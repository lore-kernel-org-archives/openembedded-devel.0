Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68647D111A8
	for <webhook@archiver.kernel.org>; Sun, 30 Nov 2025 19:44:26 +0000 (UTC)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4139.1764531862578689598
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 30 Nov 2025 11:44:22 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=cSR2IxOj;
 spf=pass (domain: gmail.com, ip: 209.85.221.50, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-42e2e445dbbso261164f8f.2
        for <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 11:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764531861; x=1765136661; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g4iQxwNa/QwJHVHFYkLWxgGu+ucj3g4SE/NWmoZRC2k=;
        b=cSR2IxOjol1+8R7aM0uNpbAiUSXdmWNLKBpWdU2Uz1k2RnFtxn5f0ct8TQ3owwdnUW
         ucvZE5xvis1RYAfZYVLqNHCsTW+Artb3I3OWBRyzfuB/ZlMj/SW6963G0FVu/d4xK1PR
         LEQ3SMXpLVf2Pi+9PJHtoMzTBwd53tJWr8CgeMdFyDDxAbj5TvunJEwwfHGtbVEtV2FX
         IX0PKIRTGAzeSCMS3tJAy1ayay5r7kcz/JpYaueM+Ji4AjkcHmfruiQBSemWEGzlHbiD
         UqL02OxQk+zzegDFZUqjkuMp0WKzw8PUtPZs8/EX25X9WX9wMYNSzMVarD1TTL5La6mH
         qSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764531861; x=1765136661;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g4iQxwNa/QwJHVHFYkLWxgGu+ucj3g4SE/NWmoZRC2k=;
        b=IPPCzkaiL8TByO6Y1wpb/tB5x9MguqG6VVVZioO6KGh9syWsttZXsYXt6jNjThLkJG
         2Am/AwzjMvsRW9NIbeDKJ7PU4Pxt69omPDIvqGL26n22ro2V7XPG2eIhqyRWQPtZhcVA
         Zd2ai6vc32KE4/Hzqx1g8OVPtr+F2ccA6flXKyEDilyhNBdql930U6HE1CEldA9klmjp
         wNc2XSrDl+HP6x0Trc9UJZHcdvZmHR5cEAemOteg+r9U0fhSUbprPQ2yJp3ziaKaudgc
         oY4+qzFxaDBFrKOoaB+ClZS9TXMQhucAKgNFmzpPuBn6g3YYj61DPrUewQLLIo5pVQWg
         cIpA==
X-Gm-Message-State: AOJu0YyHmFnzeWAYZMRayFmh4JKN4g9KguoU/LtnkjmCyhsfJaDBdHN6
	qI4GT4NZCkZlxQ7qkNtgJE3xVny64Rq9FieFTV57806A6VfbJbOlnTYppGnBzQ==
X-Gm-Gg: ASbGncsaaIOyV9L5bhUYqSwGkwCFStj6RmmNcKvNDcX6KTm3g7FH3PrCC7HMvfYvcUe
	4410dP8A0YI1g5iOQ+9Z4NfnSdcjXWwcrQtqL1MMMHI/duQrmCYa+75xOay9X7uPjhatTd5InUR
	gwvUQwUntXEb8mnIVLwPdkMIUd/rs2WbmYHbyKVnBL262soNoSsEq36xBiyFeHt89Zax6U7xyCn
	lGch4uCNbSryaLQY/DyROmbXsXtQN16lY08ateqtlOX3aFlhdVetNbj6oxaJ4mREaDjwkTy66hp
	7nzePQvUZG8vuboUAVeczPRjkOfDjQ9Z2VxNuNg2Cbg/pc1LRVkZqb0OdxSm3xfKYp9RmLD/poR
	htAGg11cnH2x5oViqIOt8ha6r5E24SArrsrdyM/8/ZxaN2O11lwEM3oJ+zZs4hkETmYHdDpV39+
	rdBjvINv2K
X-Google-Smtp-Source: AGHT+IHGWg8Xs8+b3edvfXgIQgQtIX1UwfkI4a4L1gDG4k1NIqy9is2Hf1Rh6DbsFt/nuh1qvjFEtw==
X-Received: by 2002:a05:6000:40c7:b0:42b:39ae:d07b with SMTP id ffacd0b85a97d-42cc1d1bf4dmr38371671f8f.50.1764531860819;
        Sun, 30 Nov 2025 11:44:20 -0800 (PST)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1ca4078csm21399153f8f.29.2025.11.30.11.44.20
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Nov 2025 11:44:20 -0800 (PST)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH 7/7] fontforge: patch CVE-2024-25081 and CVE-2024-25082
Date: Sun, 30 Nov 2025 20:44:14 +0100
Message-ID: <20251130194414.2335669-7-skandigraun@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251130194414.2335669-1-skandigraun@gmail.com>
References: <20251130194414.2335669-1-skandigraun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 30 Nov 2025 19:44:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122180

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-25081
https://nvd.nist.gov/vuln/detail/CVE-2024-25082

The same patch fixes both vulnerabilities.
Take the patch from the pull request that is referenced by the
nv report.

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 .../fontforge/CVE-2024-25081-25082.patch      | 181 ++++++++++++++++++
 .../fontforge/fontforge_20190801.bb           |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081-25082.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081-25082.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081-25082.patch
new file mode 100644
index 0000000000..0932196c5e
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081-25082.patch
@@ -0,0 +1,181 @@
+From 7890a39d98e73c59156ebd6ff58a4a455801745f Mon Sep 17 00:00:00 2001
+From: Peter Kydas <pk@canva.com>
+Date: Tue, 6 Feb 2024 10:23:36 +1100
+Subject: [PATCH] fix splinefont shell command injection
+
+CVE: CVE-2024-25081 CVE-2024-25082
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/pull/5367/commits/a64099931ea004a08e074b08ad0984d92c25daa2]
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ fontforge/splinefont.c | 125 +++++++++++++++++++++++++++++------------
+ 1 file changed, 90 insertions(+), 35 deletions(-)
+
+diff --git a/fontforge/splinefont.c b/fontforge/splinefont.c
+index ef1ed27ea..9a70c90d9 100644
+--- a/fontforge/splinefont.c
++++ b/fontforge/splinefont.c
+@@ -799,11 +799,14 @@ return( name );
+ 
+ char *Unarchive(char *name, char **_archivedir) {
+     char *dir = getenv("TMPDIR");
+-    char *pt, *archivedir, *listfile, *listcommand, *unarchivecmd, *desiredfile;
++    char *pt, *archivedir, *listfile, *desiredfile;
+     char *finalfile;
+     int i;
+     int doall=false;
+     static int cnt=0;
++    gchar *command[5];
++    gchar *stdoutresponse = NULL;
++    gchar *stderrresponse = NULL;
+ 
+     *_archivedir = NULL;
+ 
+@@ -838,18 +841,30 @@ return( NULL );
+     listfile = malloc(strlen(archivedir)+strlen("/" TOC_NAME)+1);
+     sprintf( listfile, "%s/" TOC_NAME, archivedir );
+ 
+-    listcommand = malloc( strlen(archivers[i].unarchive) + 1 +
+-			strlen( archivers[i].listargs) + 1 +
+-			strlen( name ) + 3 +
+-			strlen( listfile ) +4 );
+-    sprintf( listcommand, "%s %s %s > %s", archivers[i].unarchive,
+-	    archivers[i].listargs, name, listfile );
+-    if ( system(listcommand)!=0 ) {
+-	free(listcommand); free(listfile);
+-	ArchiveCleanup(archivedir);
+-return( NULL );
+-    }
+-    free(listcommand);
++    command[0] = archivers[i].unarchive;
++    command[1] = archivers[i].listargs;
++    command[2] = name;
++    command[3] = NULL; // command args need to be NULL-terminated
++
++    if ( g_spawn_sync(
++                      NULL,
++                      command,
++                      NULL,
++                      G_SPAWN_SEARCH_PATH, 
++                      NULL, 
++                      NULL, 
++                      &stdoutresponse, 
++                      &stderrresponse, 
++                      NULL, 
++                      NULL
++                      ) == FALSE) { // did not successfully execute
++      ArchiveCleanup(archivedir);
++      return( NULL );
++    }
++    // Write out the listfile to be read in later
++    FILE *fp = fopen(listfile, "wb");
++    fwrite(stdoutresponse, strlen(stdoutresponse), 1, fp);
++    fclose(fp);
+ 
+     desiredfile = ArchiveParseTOC(listfile, archivers[i].ars, &doall);
+     free(listfile);
+@@ -858,22 +873,28 @@ return( NULL );
+ return( NULL );
+     }
+ 
+-    /* I tried sending everything to stdout, but that doesn't work if the */
+-    /*  output is a directory file (ufo, sfdir) */
+-    unarchivecmd = malloc( strlen(archivers[i].unarchive) + 1 +
+-			strlen( archivers[i].listargs) + 1 +
+-			strlen( name ) + 1 +
+-			strlen( desiredfile ) + 3 +
+-			strlen( archivedir ) + 30 );
+-    sprintf( unarchivecmd, "( cd %s ; %s %s %s %s ) > /dev/null", archivedir,
+-	    archivers[i].unarchive,
+-	    archivers[i].extractargs, name, doall ? "" : desiredfile );
+-    if ( system(unarchivecmd)!=0 ) {
+-	free(unarchivecmd); free(desiredfile);
+-	ArchiveCleanup(archivedir);
+-return( NULL );
++    command[0] = archivers[i].unarchive;
++    command[1] = archivers[i].extractargs;
++    command[2] = name;
++    command[3] = doall ? "" : desiredfile;
++    command[4] = NULL;
++
++    if ( g_spawn_sync(
++                      (gchar*)archivedir,
++                      command,
++                      NULL,
++                      G_SPAWN_SEARCH_PATH, 
++                      NULL, 
++                      NULL, 
++                      &stdoutresponse, 
++                      &stderrresponse, 
++                      NULL, 
++                      NULL
++                      ) == FALSE) { // did not successfully execute
++      free(desiredfile);
++      ArchiveCleanup(archivedir);
++      return( NULL );
+     }
+-    free(unarchivecmd);
+ 
+     finalfile = malloc( strlen(archivedir) + 1 + strlen(desiredfile) + 1);
+     sprintf( finalfile, "%s/%s", archivedir, desiredfile );
+@@ -896,20 +917,54 @@ struct compressors compressors[] = {
+ 
+ char *Decompress(char *name, int compression) {
+     char *dir = getenv("TMPDIR");
+-    char buf[1500];
+     char *tmpfn;
+-
++    gchar *command[4];
++    gint stdout_pipe;
++    gchar buffer[4096];
++    gssize bytes_read;
++    GByteArray *binary_data = g_byte_array_new();
++    
+     if ( dir==NULL ) dir = P_tmpdir;
+     tmpfn = malloc(strlen(dir)+strlen(GFileNameTail(name))+2);
+     strcpy(tmpfn,dir);
+     strcat(tmpfn,"/");
+     strcat(tmpfn,GFileNameTail(name));
+     *strrchr(tmpfn,'.') = '\0';
+-    snprintf( buf, sizeof(buf), "%s < %s > %s", compressors[compression].decomp, name, tmpfn );
+-    if ( system(buf)==0 )
+-return( tmpfn );
+-    free(tmpfn);
+-return( NULL );
++
++    command[0] = compressors[compression].decomp;
++    command[1] = "-c";
++    command[2] = name;
++    command[3] = NULL;
++
++    // Have to use async because g_spawn_sync doesn't handle nul-bytes in the output (which happens with binary data)
++    if (g_spawn_async_with_pipes(
++      NULL, 
++      command, 
++      NULL, 
++      G_SPAWN_DO_NOT_REAP_CHILD | G_SPAWN_SEARCH_PATH,
++      NULL, 
++      NULL,  
++      NULL,
++      NULL, 
++      &stdout_pipe, 
++      NULL, 
++      NULL) == FALSE) {
++      //command has failed
++      return( NULL );
++    }
++
++    // Read binary data from pipe and output to file
++    while ((bytes_read = read(stdout_pipe, buffer, sizeof(buffer))) > 0) {
++        g_byte_array_append(binary_data, (guint8 *)buffer, bytes_read);
++    }
++    close(stdout_pipe);
++
++    FILE *fp = fopen(tmpfn, "wb");
++    fwrite(binary_data->data, sizeof(gchar), binary_data->len, fp);
++    fclose(fp);
++    g_byte_array_free(binary_data, TRUE);
++
++		return(tmpfn);
+ }
+ 
+ static char *ForceFileToHaveName(FILE *file, char *exten) {
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
index 7686b04fb3..cfb20ab2bd 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20190801.bb
@@ -19,6 +19,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-include-sys-select-on-non-glibc-platforms.patch \
            file://CVE-2020-25690-1.patch \
            file://CVE-2020-25690-2.patch \
+           file://CVE-2024-25081-25082.patch \
            "
 S = "${WORKDIR}/git"
 

