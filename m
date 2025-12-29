Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056D0E92FDC
	for <webhook@archiver.kernel.org>; Mon, 29 Dec 2025 20:54:25 +0000 (UTC)
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.51415.1767041656011900946
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 29 Dec 2025 12:54:16 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=nMdZROYw;
 spf=pass (domain: gmail.com, ip: 209.85.128.48, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4779ce2a624so71780295e9.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 12:54:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767041654; x=1767646454; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Egyfz18S3TG/d9PdjMcqK1RU/cTNvuOzauqLJ7hOp6U=;
        b=nMdZROYwxIEmBhur82I6qJyXxSLcIJfjptFbeHQtRgxCQBQNUKDdCSdQQ3GTVlBWf1
         sxp9xhfX+/6afZuWRAwhCMSfo4Yggj+FMA9yr8bqRjYhUdbH6BRArgQH5Sv/mDZCHUe+
         g7A50h7KJIS2xou4bc5BlgRUb7FI4RYjhmPJlSLa8bByg1q0m/6Vjk2YiMJTwlkqR+FZ
         CoUiGG8Smsi9ixPMSb7wRneHSRqF196HzBym5F1brwtK+jccT1xjEQ3O58fzS4dRhynN
         6or3XIKjIwXSZGIt/wWqLiquq9KEyTqc3chpt4CCk+eAXuuQAu1bdsC3RHbTeTVlEXW/
         G3lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767041654; x=1767646454;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Egyfz18S3TG/d9PdjMcqK1RU/cTNvuOzauqLJ7hOp6U=;
        b=ElSQBxZqV6p5mPvfWh3dfHtQWRMzTSxr0yqrRyv2xGfgws29qK/jUlFYsJSsbeV+BS
         Oa/lM4ebdi0lYMSj+l93Jkm8t8GO6iLWrwRCNapvrC0WxaLorVQMw2/MfxkOqAhwf70D
         6Z8gYz6lG55KY+6sDtqAn5lpyXu17QafB76PQTk/WnbveKKrlHjJ8ws1GYaZEeZ/ZDh5
         Ajwl1PcfZJMY9rFTko45Y8yofWliUiH/rF30fd0HIc4+pMlp76MMgN6StBJrGBzueGzA
         o8i0Y7VJ6V5tQkS80kmgyRML95MxKd0LoTeZC1JLfRZjgvWjN4A+N4G6VC9K87vf0dUH
         oYxw==
X-Gm-Message-State: AOJu0YwPBSX9z3xBLlaPCdm8IpgJBmSrHdG3Q6KMXtRaWDp7qoGvrrn7
	kErpNAUOx4T0q7sKox5N3PRHPFDyiOpNq3mYRG5eaAL4teB1QQmtMZsZ14gLtw==
X-Gm-Gg: AY/fxX45eALp/JbXYtaa8ckV1fDJVTfa0HF3fhXIbBWJwTo3ddL5j4ogJcMyffMGGRJ
	cJAAP3mkzCingrEB8VnV/T0HrbCfgxF+CCcdnC//etq6pjg3trnYu/6EJvz1kWR9R/Hf81Dbpc3
	Hb9FmX8azLpiZ+eZFITJw60zksOkLU0t5rjDE2qNlBCqXdQMrFmGEI0cPZed72w3ww9cn4NLm0U
	hOycdIOS5GwskJ8NT2PQiABGWcetKIr0ks6ovUqR01fybb2aH5TuBaVdP0MMCQr9OWdUVe3UrNJ
	od8Hwc2oVHR/tZbiFPYEPd0Bc4X9h2k5soun1ycH4IDCEqDvLGHKucoKC5cTqzvHJ3BZvbHdf7Q
	p2Yd+JO2Uq8VCPWg9pav3qPre3ulaxTMLjHB4oM72CZoPT7gIxas3/DLweK614iTlSwo1Y2DGlv
	8+EtE/XR4pWOUQsJCdGBY=
X-Google-Smtp-Source: AGHT+IGmFhtcWXj86xIOWlUVZjOn8b/4HIjaOYuUC/9ycNydCF/4vjinTBlXCZMIdZ/1Cbyv+KYcqQ==
X-Received: by 2002:a05:600c:348b:b0:477:a36f:1a57 with SMTP id 5b1f17b1804b1-47d276f8aeemr318064075e9.3.1767041653736;
        Mon, 29 Dec 2025 12:54:13 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-47d193cbe58sm555786255e9.9.2025.12.29.12.54.13
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 12:54:13 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][scarthgap][PATCH] atop: patch CVE-2025-31160
Date: Mon, 29 Dec 2025 21:54:12 +0100
Message-ID: <20251229205412.706469-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 29 Dec 2025 20:54:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122999

Details: https://nvd.nist.gov/vuln/detail/CVE-2025-31160

Backport the patch that's subject references the CVE id explicitly.

I was able to verify the patch with a reproducer[1] (which is mentioned
in a reference[2] in the nvd report). Without the patch atop crashed,
with the patch it worked fine (both with and without -k/-K flags).

[1]: https://blog.bismuth.sh/blog/bismuth-found-the-atop-bug
[2]: https://gist.github.com/kallsyms/3acdf857ccc5c9fbaae7ed823be0365e

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../atop/atop/CVE-2025-31160.patch            | 607 ++++++++++++++++++
 meta-oe/recipes-support/atop/atop_2.4.0.bb    |   1 +
 2 files changed, 608 insertions(+)
 create mode 100644 meta-oe/recipes-support/atop/atop/CVE-2025-31160.patch

diff --git a/meta-oe/recipes-support/atop/atop/CVE-2025-31160.patch b/meta-oe/recipes-support/atop/atop/CVE-2025-31160.patch
new file mode 100644
index 0000000000..d83eca13ef
--- /dev/null
+++ b/meta-oe/recipes-support/atop/atop/CVE-2025-31160.patch
@@ -0,0 +1,607 @@
+From 6427a26127cfec800b7064fd8700837c9f0c3548 Mon Sep 17 00:00:00 2001
+From: Gerlof Langeveld <gerlof.langeveld@atoptool.nl>
+Date: Sat, 29 Mar 2025 18:56:44 +0100
+Subject: [PATCH] Fix security vulnerability CVE-2025-31160 (#334)
+
+Atop will not connect to the TCP port of 'atopgpud' daemon any more
+by default.  The flag -k can be used explicitly when 'atopgpud' is
+active. Also the code to parse the received strings is improved to
+avoid future issues with heap corruption.
+
+The flag -K has been implemented to connect to netatop/netatop-bpf.
+CVE: CVE-2025-31160
+Upstream-Status: Backport [https://github.com/Atoptool/atop/commit/ec8f3038497fcf493c6ff9c9f98f7a7c6216a1cb]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ atop.c      |  59 +++++++--------
+ atop.h      |   1 +
+ gpucom.c    | 210 +++++++++++++++++++++++++++++++++++++---------------
+ photoproc.c |   3 +-
+ 4 files changed, 182 insertions(+), 91 deletions(-)
+
+diff --git a/atop.c b/atop.c
+index 7ea9cc8..967df46 100644
+--- a/atop.c
++++ b/atop.c
+@@ -333,6 +333,8 @@ int 		ossub;
+ int		supportflags;	/* supported features             	*/
+ char		**argvp;
+ 
++char		connectgpud	= 0; /* boolean: connect to atopgpud      */
++char		connectnetatop	= 0; /* boolean: connect to netatop(bpf)  */
+ 
+ struct visualize vis = {generic_samp, generic_error,
+ 			generic_end,  generic_usage};
+@@ -573,7 +575,12 @@ main(int argc, char *argv[])
+ 
+ 				linelen = atoi(optarg);
+ 				break;
+-
++                           case 'k':		/* try to open TCP connection to atopgpud */
++                                connectgpud = 1;
++                                break;
++                           case 'K':		/* try to open connection to netatop/netatop-bpf */
++                                connectnetatop = 1;
++                                break;
+ 			   default:		/* gather other flags */
+ 				flaglist[i++] = c;
+ 			}
+@@ -688,7 +695,8 @@ main(int argc, char *argv[])
+ 	/*
+  	** open socket to the IP layer to issue getsockopt() calls later on
+ 	*/
+-	netatop_ipopen();
++	if (connectnetatop)
++		netatop_ipopen();
+ 
+ 	/*
+ 	** since privileged activities are finished now, there is no
+@@ -791,11 +799,15 @@ engine(void)
+ 
+ 	/*
+  	** open socket to the atopgpud daemon for GPU statistics
++	** if explicitly required
+ 	*/
+-        nrgpus = gpud_init();
++	if (connectgpud)
++	{
++	        nrgpus = gpud_init();
+ 
+-	if (nrgpus)
+-		supportflags |= GPUSTAT;
++		if (nrgpus)
++			supportflags |= GPUSTAT;
++	}
+ 
+ 	/*
+ 	** MAIN-LOOP:
+@@ -842,7 +854,10 @@ engine(void)
+ 		** send request for statistics to atopgpud 
+ 		*/
+ 		if (nrgpus)
+-			gpupending = gpud_statrequest();
++		{
++			if ((gpupending = gpud_statrequest()) == 0)
++				nrgpus = 0;
++		}
+ 
+ 		/*
+ 		** take a snapshot of the current system-level statistics 
+@@ -867,28 +882,8 @@ engine(void)
+ 			// connection lost or timeout on receive?
+ 			if (nrgpuproc == -1)
+ 			{
+-				int ng;
+-
+-				// try to reconnect
+-        			ng = gpud_init();
+-
+-				if (ng != nrgpus)	// no success
+-					nrgpus = 0;
+-
+-				if (nrgpus)
+-				{
+-					// request for stats again
+-					if (gpud_statrequest())
+-					{
+-						// receive stats response
+-						nrgpuproc = gpud_statresponse(nrgpus,
+-						     cursstat->gpu.gpu, &gp);
+-
+-						// persistent failure?
+-						if (nrgpuproc == -1)
+-							nrgpus = 0;
+-					}
+-				}
++				nrgpus = 0;
++				supportflags &= ~GPUSTAT;
+ 			}
+ 
+ 			cursstat->gpu.nrgpus = nrgpus;
+@@ -977,7 +972,7 @@ engine(void)
+ 		/*
+  		** merge GPU per-process stats with other per-process stats
+ 		*/
+-		if (nrgpus && nrgpuproc)
++		if (nrgpus && nrgpuproc > 0)
+ 			gpumergeproc(curtpres, ntaskpres,
+ 		                     curpexit, nprocexit,
+ 		 	             gp,       nrgpuproc);
+@@ -1008,8 +1003,8 @@ engine(void)
+ 		if (nprocexitnet > 0)
+ 			netatop_exiterase();
+ 
+-		if (gp)
+-			 free(gp);
++		free(gp);
++		gp = NULL;	// avoid double free
+ 
+ 		if (lastcmd == 'r')	/* reset requested ? */
+ 		{
+@@ -1050,6 +1045,8 @@ prusage(char *myname)
+ 	printf("\t  -P  generate parseable output for specified label(s)\n");
+ 	printf("\t  -L  alternate line length (default 80) in case of "
+ 			"non-screen output\n");
++	printf("\t  -k  try to connect to external atopgpud daemon (default: do not connect)\n");
++	printf("\t  -K  try to connect to netatop/netatop-bpf interface (default: do not connect)\n");
+ 
+ 	(*vis.show_usage)();
+ 
+diff --git a/atop.h b/atop.h
+index 791c450..cbf4225 100644
+--- a/atop.h
++++ b/atop.h
+@@ -82,6 +82,7 @@ extern char		threadview;
+ extern char		calcpss;
+ extern char		rawname[];
+ extern char		rawreadflag;
++extern char		connectnetatop;
+ extern unsigned int	begintime, endtime;
+ extern char		flaglist[];
+ extern struct visualize vis;
+diff --git a/gpucom.c b/gpucom.c
+index 4834851..690937e 100644
+--- a/gpucom.c
++++ b/gpucom.c
+@@ -43,12 +43,12 @@
+ 
+ #define	GPUDPORT	59123
+ 
+-static void	gputype_parse(char *);
++static int	gputype_parse(char *);
+ 
+-static void	gpustat_parse(int, char *, int,
++static int	gpustat_parse(int, char *, int,
+ 		                      struct pergpu *, struct gpupidstat *);
+-static void	gpuparse(int, char *, struct pergpu *);
+-static void	pidparse(int, char *, struct gpupidstat *);
++static int	gpuparse(int, char *, struct pergpu *);
++static int	pidparse(int, char *, struct gpupidstat *);
+ static int	rcvuntil(int, char *, int);
+ 
+ static int	actsock = -1;
+@@ -150,20 +150,24 @@ gpud_init(void)
+ 	if ( rcvuntil(actsock, buf, length) == -1)
+ 	{
+ 		perror("receive type request from atopgpud");
++		free(buf);
+ 		goto close_and_return;
+ 	}
+ 
+ 	buf[length] = '\0';
+ 
+-	gputype_parse(buf);
+-
+-        numgpus = numgpus <= MAXGPU ? numgpus : MAXGPU;
++	if (! gputype_parse(buf))
++	{
++		free(buf);
++		goto close_and_return;
++	}
+ 
+ 	return numgpus;
+ 
+     close_and_return:
+ 	close(actsock);
+ 	actsock = -1;
++	numgpus = 0;
+ 	return 0;
+ }
+ 
+@@ -176,7 +180,7 @@ gpud_init(void)
+ **
+ ** Return value:
+ ** 	0 in case of failure
+-** 	1 in case of success
++** 	1 in case of success (request pending)
+ */
+ int
+ gpud_statrequest(void)
+@@ -190,6 +194,7 @@ gpud_statrequest(void)
+ 	{
+ 		close(actsock);
+ 		actsock = -1;
++		numgpus = 0;
+ 		return 0;
+ 	}
+ 
+@@ -216,7 +221,7 @@ gpud_statresponse(int maxgpu, struct pergpu *ggs, struct gpupidstat **gps)
+ 	uint32_t	prelude;
+ 	char		*buf = NULL, *p;
+ 	int		version, length;
+-	int		pids = 0;
++	int		maxprocs = 0, nrprocs;
+ 
+ 	if (actsock == -1)
+ 		return -1;
+@@ -269,22 +274,22 @@ gpud_statresponse(int maxgpu, struct pergpu *ggs, struct gpupidstat **gps)
+ 	*(buf+length) = '\0';
+ 
+ 	/*
+-	** determine number of per-process stats
+-	** and malloc space to parse these stats
++	** determine number of per-process stats in string
++	** and malloc space to store these stats
+ 	*/
+ 	for (p=buf; *p; p++)
+ 	{
+ 		if (*p == PIDDELIM)
+-			pids++;
++			maxprocs++;
+ 	}
+ 
+ 	if (gps)
+ 	{
+-		if (pids)
++		if (maxprocs)
+ 		{
+-			*gps = malloc(pids * sizeof(struct gpupidstat));
+-			ptrverify(gps, "Malloc failed for gpu pidstats\n");
+-			memset(*gps, 0, pids * sizeof(struct gpupidstat));
++			*gps = malloc(maxprocs * sizeof(struct gpupidstat));
++			ptrverify(*gps, "Malloc failed for gpu pidstats\n");
++			memset(*gps, 0, maxprocs * sizeof(struct gpupidstat));
+ 		}
+ 		else
+ 		{
+@@ -295,18 +300,27 @@ gpud_statresponse(int maxgpu, struct pergpu *ggs, struct gpupidstat **gps)
+ 	/*
+ 	** parse stats string for per-gpu stats
+ 	*/
+-	gpustat_parse(version, buf, maxgpu, ggs, gps ? *gps : NULL);
++	if ( (nrprocs =  gpustat_parse(version, buf, maxgpu, ggs, gps ? *gps : NULL)) == -1)
++	{
++	if (gps)
++		{
++			free(*gps);
++			*gps = NULL;    // avoid double free later on
++		}
++
++		goto close_and_return; // inconsistent data received from atopgpud
++	}
+ 
+ 	free(buf);
+ 
+-	return pids;
++	return nrprocs;
+ 
+     close_and_return:
+-	if (buf)
+-		free(buf);
++	free(buf);
+ 
+ 	close(actsock);
+ 	actsock = -1;
++	numgpus = 0;
+ 	return -1;
+ }
+ 
+@@ -314,6 +328,8 @@ gpud_statresponse(int maxgpu, struct pergpu *ggs, struct gpupidstat **gps)
+ /*
+ ** Receive given number of bytes from given socket
+ ** into given buffer address
++** Return value:  number of bytes received
++** 		  -1 - failed (including end-of-connection)
+ */
+ static int
+ rcvuntil(int sock, char *buf, int size)
+@@ -339,21 +355,22 @@ rcvuntil(int sock, char *buf, int size)
+ **
+ ** Store the type, busid and tasksupport of every GPU in
+ ** static pointer tables
++**
++** Return value:  1 - success
++**                0 - failed
+ */
+-static void
++static int
+ gputype_parse(char *buf)
+ {
+-	char	*p, *start, **bp, **tp, *cp;
++	char	*p, *start, **bp, **tp, *cp, fails=0;
+ 
+ 	/*
+ 	** determine number of GPUs
+ 	*/
+ 	if ( sscanf(buf, "%d@", &numgpus) != 1)
+-	{
+-		close(actsock);
+-		actsock = -1;
+ 		return;
+-	}
++
++	numgpus = numgpus <= MAXGPU ? numgpus : MAXGPU;
+ 
+ 	for (p=buf; *p; p++)	// search for first delimiter
+ 	{
+@@ -364,6 +381,9 @@ gputype_parse(char *buf)
+ 		}
+ 	}
+ 
++	if (*p == 0)    // no delimiter or no data behind delimeter?
++		return 0;
++
+ 	/*
+ 	** parse GPU info and build arrays of pointers to the
+ 	** busid strings, type strings and tasksupport strings.
+@@ -380,27 +400,47 @@ gputype_parse(char *buf)
+ 		ptrverify(gputypes, "Malloc failed for gpu types\n");
+ 		ptrverify(gputasks, "Malloc failed for gpu tasksup\n");
+ 
+-		for (field=0, start=p; ; p++)
++		for (field=0, start=p; fails == 0; p++)
+ 		{
+ 			if (*p == ' ' || *p == '\0' || *p == GPUDELIM)
+ 			{
+ 				switch(field)
+ 				{
+ 				   case 0:
++					if (bp - gpubusid >= numgpus)
++					{
++						fails++;
++						break;  // inconsistent with number of GPUs
++					}
++
+ 					if (p-start <= MAXGPUBUS)
+ 						*bp++ = start;
+ 					else
+ 						*bp++ = p - MAXGPUBUS;
+ 					break;
+ 				   case 1:
++					if (tp - gputypes >= numgpus)
++					{
++						fails++;
++						break;  // inconsistent with number of GPUs
++					}
++
+ 					if (p-start <= MAXGPUTYPE)
+ 						*tp++ = start;
+ 					else
+ 						*tp++ = p - MAXGPUTYPE;
+ 					break;
+ 				   case 2:
++					if (cp - gputasks >= numgpus)
++					{
++						fails++;
++						break;  // inconsistent with number of GPUs
++					}
++
+ 					*cp++ = *start;
+ 					break;
++				   default:
++					fails++;
+ 				}
+ 
+ 				field++;
+@@ -418,7 +458,24 @@ gputype_parse(char *buf)
+ 
+ 		*bp = NULL;
+ 		*tp = NULL;
++		/*
++		** verify if number of GPUs and supplied per-GPU information
++		** appears to be inconsistent
++		*/
++		if (fails || bp - gpubusid != numgpus || tp - gputypes != numgpus || cp - gputasks != numgpus)
++		{
++			free(gpubusid);
++			free(gputypes);
++			free(gputasks);
++			return 0;
++		}
++	}
++	else
++	{
++		return 0;
+ 	}
++
++	return 1;
+ }
+ 
+ 
+@@ -430,105 +487,140 @@ gputype_parse(char *buf)
+ ** Every series with counters on process level is introduced
+ ** with a '#' delimiter (last part of the GPU level data).
+ */
+-static void
++static int
+ gpustat_parse(int version, char *buf, int maxgpu, 
+ 		struct pergpu *gg, struct gpupidstat *gp)
+ {
+-	char	*p, *start, delimlast;
+-	int	gpunum = 0;
++	char	*p, *pp, *start;
++	int	gpunum, nrprocs = 0;
+ 
+ 	/*
+ 	** parse stats string
+ 	*/
+-	for (p=start=buf, delimlast=DUMMY; gpunum <= maxgpu; p++)
++	for (p=buf; *p && *p != GPUDELIM; p++)  // find first GPU deimiter
++		; 
++
++	if (*p == 0)    // string without GPU delimiter
++		return -1;
++
++	for (p++, start=p, gpunum=0; gpunum < maxgpu; p++)
+ 	{
+-		char delimnow;
++		char delimnext;
+ 
+-		if (*p != '\0' && *p != GPUDELIM && *p != PIDDELIM)
++		// search next GPU delimiter
++		//
++		if (*p && *p != GPUDELIM)
+ 			continue;
+ 
+ 		/*
+-		** next delimiter or end-of-string found
++		** next GPU delimiter or end-of-string found
+ 		*/
+-		delimnow = *p;
++		delimnext = *p;
+ 		*p       = 0;
+ 
+- 		switch (delimlast)
+-		{
+-		   case DUMMY:
+-			break;
+-
+-		   case GPUDELIM:
+-			gpuparse(version, start, gg);
+-
+-			strcpy(gg->type,  gputypes[gpunum]);
+-			strcpy(gg->busid, gpubusid[gpunum]);
++		/*
++		** parse GPU itself
++		*/
++		if (! gpuparse(version, start, gg))
++			return -1;
+ 
+-			gpunum++;
+-			gg++;
+-			break;
++		strncpy(gg->type,  gputypes[gpunum], MAXGPUTYPE);
++		strncpy(gg->busid, gpubusid[gpunum], MAXGPUBUS);
+ 
+-		   case PIDDELIM:
+-			if (gp)
++		/*
++		** continue searching for per-process stats for this GPU
++		*/
++		if (gp)
++		{
++			for (pp = start; pp < p; pp++)
+ 			{
+-				pidparse(version, start, gp);
++				if (*pp != PIDDELIM)
++					continue;
++
++				// new PID delimiter (#) found
++				//
++				if (! pidparse(version, pp+1, gp))
++					return -1;
+ 
+ 				gp->gpu.nrgpus++;
+-				gp->gpu.gpulist = 1<<(gpunum-1);
++				gp->gpu.gpulist = 1<<gpunum;
+ 				gp++;
+ 
+-				(gg-1)->nrprocs++;
++				gg->nrprocs++;  // per GPU
++				nrprocs++;      // total
+ 			}
+ 		}
+ 
+-		if (delimnow == 0 || *(p+1) == 0)
++		gpunum++;
++		gg++;
++
++		if (delimnext == 0 || *(p+1) == 0)
+ 			break;
+ 
+ 		start     = p+1;
+-		delimlast = delimnow;
+ 	}
++	return nrprocs;
+ }
+ 
+ 
+ /*
+ ** Parse GPU statistics string
++** Return value:  1 - success
++**                0 - failed 
+ */
+-static void
++static int
+ gpuparse(int version, char *p, struct pergpu *gg)
+ {
++	int nr;
++
+ 	switch (version)
+ 	{
+ 	   case 1:
+-		(void) sscanf(p, "%d %d %lld %lld %lld %lld %lld %lld", 
++		nr = sscanf(p, "%d %d %lld %lld %lld %lld %lld %lld",
+ 			&(gg->gpupercnow), &(gg->mempercnow),
+ 			&(gg->memtotnow),  &(gg->memusenow),
+ 			&(gg->samples),    &(gg->gpuperccum),
+ 			&(gg->memperccum), &(gg->memusecum));
+ 
++		if (nr < 8)     // parse error: unexpected data
++			return 0;
++
+ 		gg->nrprocs = 0;
+ 
+ 		break;
+ 	}
++
++	return 1;
+ }
+ 
+ 
+ /*
+ ** Parse PID statistics string
++** Return value:  1 - success
++**                0 - failed
+ */
+-static void
++static int
+ pidparse(int version, char *p, struct gpupidstat *gp)
+ {
++	int nr;
++
+ 	switch (version)
+ 	{
+ 	   case 1:
+-		(void) sscanf(p, "%c %ld %d %d %lld %lld %lld %lld",
++		nr = sscanf(p, "%c %ld %d %d %lld %lld %lld %lld",
+ 			&(gp->gpu.state),   &(gp->pid),    
+ 			&(gp->gpu.gpubusy), &(gp->gpu.membusy),
+ 			&(gp->gpu.timems),
+ 			&(gp->gpu.memnow), &(gp->gpu.memcum),
+ 		        &(gp->gpu.sample));
++
++		if (nr < 8)     // parse error: unexpected data
++			return 0;
++
+ 		break;
+ 	}
++
++	return 1;
+ }
+ 
+ 
+diff --git a/photoproc.c b/photoproc.c
+index e5cd88b..5df04e3 100644
+--- a/photoproc.c
++++ b/photoproc.c
+@@ -216,7 +216,8 @@ photoproc(struct tstat *tasklist, int maxtask)
+ 	*/
+ 	regainrootprivs();
+ 
+-	netatop_probe();
++	if (connectnetatop)
++		netatop_probe();
+ 
+ 	if (! droprootprivs())
+ 		cleanstop(42);
diff --git a/meta-oe/recipes-support/atop/atop_2.4.0.bb b/meta-oe/recipes-support/atop/atop_2.4.0.bb
index bb1f53624a..f6db0508f6 100644
--- a/meta-oe/recipes-support/atop/atop_2.4.0.bb
+++ b/meta-oe/recipes-support/atop/atop_2.4.0.bb
@@ -20,6 +20,7 @@ SRC_URI = "http://www.atoptool.nl/download/${BP}.tar.gz \
            file://fix-permissions.patch \
            file://sysvinit-implement-status.patch \
            file://0001-atop.daily-atop.init-atop-pm.sh-Avoid-using-bash.patch \
+           file://CVE-2025-31160.patch \
            "
 SRC_URI[md5sum] = "1077da884ed94f2bc3c81ac3ab970436"
 SRC_URI[sha256sum] = "be1c010a77086b7d98376fce96514afcd73c3f20a8d1fe01520899ff69a73d69"

