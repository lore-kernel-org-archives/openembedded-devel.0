Received: from mail-yi0-f47.google.com ([209.85.218.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PxguK-0006xJ-BB
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Mar 2011 15:32:40 +0100
Received: by yia13 with SMTP id 13so663280yia.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Mar 2011 06:30:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=p2nGacLWz5C80SK2R5y08dTXO1Wm1fUL5eyuq5WcG1Y=;
	b=rP7XxJeMtYD6UCBi0WfV6Hlf8CfzmSNdrvMp0Kxj6RVWNsbTiz8J7d2TMy8t3v1r0K
	6TTFokHDfUOc61ePkOH5Sp2NGJwuJ7JxiCDzv09Gz7WKQ7jK4S4lj4PjM/aW0s4sAy1R
	LwwNsfimiDlkSk9VD8tV5QDimQ7Be7W8V44Q0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=Qd+WXGilO4tKzHeWVCOQBRrB5vbVOzwds+dl7yRaieaC/V8iO9Y1dGGIMSGnpYufe0
	L/L4/IAdwWE9njxOQQs1lILUvXBHcSsSjPOeqCFjQFar3mCiGUKd99NsQxQCrMH92d/n
	DNlJ+Q9FuT+J/yVm8RQtJ3eV0ZDXDJSATPqW4=
Received: by 10.150.67.12 with SMTP id p12mr1144959yba.202.1299767427230;
	Thu, 10 Mar 2011 06:30:27 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id w6sm3962040anf.26.2011.03.10.06.30.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 10 Mar 2011 06:30:26 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 Mar 2011 14:30:04 +0000
Message-Id: <1299767410-969-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
References: <1299767410-969-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/8] freerdp: add singleton support with PDU error handling
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 10 Mar 2011 14:32:43 -0000

---
 recipes/freerdp/freerdp/singleton-mode.patch |  208 ++++++++++++++++++++++++++
 recipes/freerdp/freerdp_git.bb               |    5 +-
 2 files changed, 211 insertions(+), 2 deletions(-)
 create mode 100644 recipes/freerdp/freerdp/singleton-mode.patch

diff --git a/recipes/freerdp/freerdp/singleton-mode.patch b/recipes/freerdp/freerdp/singleton-mode.patch
new file mode 100644
index 0000000..980ec96
--- /dev/null
+++ b/recipes/freerdp/freerdp/singleton-mode.patch
@@ -0,0 +1,208 @@
+From dd81b7b7902015d35e48117db7fb664aa75fdf62 Mon Sep 17 00:00:00 2001
+From: Eduardo Beloni <beloni@ossystems.com.br>
+Date: Thu, 3 Mar 2011 14:41:32 -0300
+Subject: [PATCH] xfreerdp: singleton mode
+
+Allows return code according to the Set Error Info PDU
+---
+ X11/xf_types.h |   21 +++++++++++++++++++++
+ X11/xfreerdp.c |   45 ++++++++++++++++++++++++++++++++++++---------
+ doc/xfreerdp.1 |    4 ++++
+ 3 files changed, 61 insertions(+), 9 deletions(-)
+
+diff --git a/X11/xf_types.h b/X11/xf_types.h
+index 0d355e2..75c7d88 100644
+--- a/X11/xf_types.h
++++ b/X11/xf_types.h
+@@ -88,6 +88,27 @@ struct xf_info
+ };
+ typedef struct xf_info xfInfo;
+ 
++
++enum STANDARD_EXIT_CODE
++{
++	EX_OK = 0,
++	EX_USAGE = 64,
++	EX_DATAERR = 65,
++	EX_NOINPUT = 66,
++	EX_NOUSER = 67,
++	EX_NOHOST = 68,
++	EX_UNAVAILABLE = 69,
++	EX_SOFTWARE = 70,
++	EX_OSERR = 71,
++	EX_OSFILE = 72,
++	EX_CANTCREAT = 73,
++	EX_IOERR = 74,
++	EX_TEMPFAIL = 75,
++	EX_PROTOCOL = 76,
++	EX_NOPERM = 77,
++	EX_CONFIG = 78,
++};
++
+ #ifdef WITH_DEBUG
+ #define DEBUG(fmt, ...)	printf("DBG %s (%d): " fmt, __FUNCTION__, __LINE__, ## __VA_ARGS__)
+ #else
+diff --git a/X11/xfreerdp.c b/X11/xfreerdp.c
+index 994e8ee..f9236e7 100644
+--- a/X11/xfreerdp.c
++++ b/X11/xfreerdp.c
+@@ -155,7 +155,7 @@ out_args(void)
+ 
+ /* Returns "true" on errors or other reasons to not continue normal operation */
+ static int
+-process_params(xfInfo * xfi, int argc, char ** argv, int * pindex)
++process_params(xfInfo * xfi, int argc, char ** argv, int * pindex, _Bool * singleton)
+ {
+ 	rdpSet * settings;
+ 	rdpKeyboardLayout * layouts;
+@@ -165,6 +165,9 @@ process_params(xfInfo * xfi, int argc, char ** argv, int * pindex)
+ 	int i, j;
+ 	struct passwd * pw;
+ 	int num_extensions;
++	int first_index;
++
++	first_index = *pindex;
+ 
+ 	set_default_params(xfi);
+ 	settings = xfi->settings;
+@@ -512,6 +515,16 @@ process_params(xfInfo * xfi, int argc, char ** argv, int * pindex)
+ 			}
+ 			num_extensions++;
+ 		}
++		else if (strcmp("--singleton", argv[*pindex]) == 0)
++		{
++			if (first_index != 1) /* this is not the first parse */
++			{
++				printf("Parsing error: you can't run more than one thread in singleton mode\n");
++				exit(EX_USAGE);
++			}
++
++			*singleton = 1;
++		}
+ 		else if ((strcmp("-h", argv[*pindex]) == 0) || strcmp("--help", argv[*pindex]) == 0)
+ 		{
+ 			out_args();
+@@ -577,6 +590,7 @@ run_xfreerdp(xfInfo * xfi)
+ 	int max_sck;
+ 	fd_set rfds;
+ 	fd_set wfds;
++	uint32 disc_reason;
+ 
+ 	/* create an instance of the library */
+ 	inst = freerdp_new(xfi->settings);
+@@ -611,7 +625,7 @@ run_xfreerdp(xfInfo * xfi)
+ 	if (inst->rdp_connect(inst) != 0)
+ 	{
+ 		printf("run_xfreerdp: inst->rdp_connect failed\n");
+-		return 1;
++		return EX_PROTOCOL;
+ 	}
+ 	if (freerdp_chanman_post_connect(xfi->chan_man, inst) != 0)
+ 	{
+@@ -687,7 +701,7 @@ run_xfreerdp(xfInfo * xfi)
+ 		/* check the libfreerdp fds */
+ 		if (inst->rdp_check_fds(inst) != 0)
+ 		{
+-			printf("run_xfreerdp: inst->rdp_check_fds failed\n");
++			printf("run_xfreerdp: inst->rdp_check_fds failed reason %u\n", inst->disc_reason);
+ 			break;
+ 		}
+ 		/* check x fds */
+@@ -703,21 +717,24 @@ run_xfreerdp(xfInfo * xfi)
+ 			break;
+ 		}
+ 	}
++
++	disc_reason = inst->disc_reason;
+ 	/* cleanup */
+ 	freerdp_chanman_close(xfi->chan_man, inst);
+ 	inst->rdp_disconnect(inst);
+ 	freerdp_free(inst);
+ 	xf_uninit(xfi);
+-	return 0;
++	return disc_reason;
+ }
+ 
+ static void *
+ thread_func(void * arg)
+ {
+ 	xfInfo * xfi;
++	uint32 disc_reason;
+ 
+ 	xfi = (xfInfo *) arg;
+-	run_xfreerdp(xfi);
++	disc_reason = run_xfreerdp(xfi);
+ 	free(xfi->settings);
+ 	freerdp_chanman_free(xfi->chan_man);
+ 	free(xfi);
+@@ -728,7 +745,7 @@ thread_func(void * arg)
+ 	{
+ 		freerdp_sem_signal(&g_sem);
+ 	}
+-	return NULL;
++	return (void *)disc_reason;
+ }
+ 
+ int
+@@ -738,6 +755,8 @@ main(int argc, char ** argv)
+ 	xfInfo * xfi;
+ 	pthread_t thread;
+ 	int index = 1;
++	_Bool singleton = 0;
++	int disc_reason = 0;
+ 
+ 	setlocale(LC_CTYPE, "");
+ 	if (argc == 1)
+@@ -760,7 +779,7 @@ main(int argc, char ** argv)
+ 		memset(xfi, 0, sizeof(xfInfo));
+ 		xfi->settings = (rdpSet *) malloc(sizeof(rdpSet));
+ 		xfi->chan_man = freerdp_chanman_new();
+-		rv = process_params(xfi, argc, argv, &index);
++		rv = process_params(xfi, argc, argv, &index, &singleton);
+ 		if (rv)
+ 		{
+ 			free(xfi->settings);
+@@ -776,9 +795,17 @@ main(int argc, char ** argv)
+ 		{
+ 			g_thread_count++;
+ 		}
++
++		if (singleton)
++			break;
+ 	}
+ 
+-	if (g_thread_count > 0)
++	if (singleton)
++	{
++		pthread_join(thread, (void **)&disc_reason);
++		printf("thread joint disconnect reason %d\n", disc_reason);
++	}
++	else if (g_thread_count > 0)
+ 	{
+ 		printf("main thread, waiting for all threads to exit\n");
+ 		freerdp_sem_wait(&g_sem);
+@@ -787,5 +814,5 @@ main(int argc, char ** argv)
+ 
+ 	freerdp_chanman_uninit();
+ 	freerdp_global_finish();
+-	return 0;
++	return disc_reason;
+ }
+diff --git a/doc/xfreerdp.1 b/doc/xfreerdp.1
+index 9fa07ca..1ad0d70 100644
+--- a/doc/xfreerdp.1
++++ b/doc/xfreerdp.1
+@@ -92,6 +92,10 @@ Disable TLS encryption.
+ .BR "--no-osb"
+ Disable off screen bitmaps.
+ .TP
++.BR "--singleton"
++Singleton mode. This mode allows only one thread of execution and also returns
++the Set Error Info PDU as the program exit code.
++.TP
+ .BR "-h"
+ Print help message.
+ .TP
+-- 
+1.6.6.1
+
diff --git a/recipes/freerdp/freerdp_git.bb b/recipes/freerdp/freerdp_git.bb
index 1ed2a19..beed2b8 100644
--- a/recipes/freerdp/freerdp_git.bb
+++ b/recipes/freerdp/freerdp_git.bb
@@ -7,9 +7,10 @@ inherit gitpkgv
 
 PV = "gitr${SRCPV}"
 PKGV = "${GITPKGVTAG}"
-PR = "${INC_PR}.0"
+PR = "${INC_PR}.1"
 
 SRCREV = "6f7eb2abb077d60a09eeb66a10ad97d102336d3c"
-SRC_URI = "git://freerdp.git.sourceforge.net/gitroot/freerdp/freerdp.git;protocol=git"
+SRC_URI = "git://freerdp.git.sourceforge.net/gitroot/freerdp/freerdp.git;protocol=git \
+           file://singleton-mode.patch"
 
 S = "${WORKDIR}/git"
-- 
1.7.2.3



