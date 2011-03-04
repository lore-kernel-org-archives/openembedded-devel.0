Received: from mail-gw0-f50.google.com ([74.125.83.50])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <otavio.salvador@gmail.com>) id 1PvYRs-0002nt-Bs
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Mar 2011 18:05:52 +0100
Received: by gwaa20 with SMTP id a20so1281658gwa.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Mar 2011 09:04:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:sender:from:to:cc:subject:date:message-id
	:x-mailer:in-reply-to:references;
	bh=p2nGacLWz5C80SK2R5y08dTXO1Wm1fUL5eyuq5WcG1Y=;
	b=OTCFH8ogSlaJJ8US6clULWq8zksszxj8sd/SwKBfkPbUuj3aILEq/3f4dJpcah9Ap8
	E+v42ajWkfMaPWNseIP3Tv4uuo4vV3GNkwIHlWhirIUC9+A+bmqlMW8/1+GH3kHaR6FD
	ldWAmzpeeIwamUyKDIefiDclFmwpEqXZmea2c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references;
	b=wxQ4+D4gzYXvmx0lz8ndLFWsxpZ0wWUvgQbhhISm4r0xwdwQ3u7RSVnCKQWOw4ESAl
	Ihqey0MNxpcFeZRh78ZjE3DQZ4jEPFxUQ++X9m1i2XMSORu/2Hj6yQdcg/TAi0oa+MzX
	5dNUvX+zZRmnAzDQvSiHrnfYTsTVQLBFCld5A=
Received: by 10.100.24.22 with SMTP id 22mr316328anx.254.1299258262236;
	Fri, 04 Mar 2011 09:04:22 -0800 (PST)
Received: from localhost.localdomain ([189.114.111.55])
	by mx.google.com with ESMTPS id i10sm1164437anh.12.2011.03.04.09.04.20
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 04 Mar 2011 09:04:21 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Mar 2011 17:04:06 +0000
Message-Id: <1299258247-13554-2-git-send-email-otavio@ossystems.com.br>
X-Mailer: git-send-email 1.7.2.3
In-Reply-To: <1299258247-13554-1-git-send-email-otavio@ossystems.com.br>
References: <1299258247-13554-1-git-send-email-otavio@ossystems.com.br>
Cc: Otavio Salvador <otavio@ossystems.com.br>
Subject: [PATCH 2/3] freerdp: add singleton support with PDU error handling
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
X-List-Received-Date: Fri, 04 Mar 2011 17:05:52 -0000

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



