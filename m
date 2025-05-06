Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C1AC3ABBC
	for <webhook@archiver.kernel.org>; Tue,  6 May 2025 20:47:08 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.624.1746564423961539884
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 06 May 2025 13:47:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=MwmsSOSS;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-20250506204659bc6e976c46627671c3-imfgek@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 20250506204659bc6e976c46627671c3
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 06 May 2025 22:46:59 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc;
 bh=HsmR3PpscvqJT300TI0eKNqpL4MTm1cao5J+c40H0vM=;
 b=MwmsSOSS16ddkp0+m1qGiChvd7VymXVcd4rS3JHq6QXytGfx3pQK3mdx7QmNlk/kFKKnog
 xifEMMBAh+ImImponmWbKx/eJgJVEVKXLHR+bx29t5pKoouue5Y7Fp+/m95xCDBzSIicE9zL
 t7t3aUKEryBBkzmm3I7edepT2LvNau43ButHZHyjKOkzUMRgCHTp7AJuCHigvgDNzky0hd+C
 lwolf0AKNZ8ikt/F1DoLlTWSdnVssQNkvglbELwgO21PZPCB9a9V5yjC1T7XsRgPPDmlXtEf
 1XyMkWijEh5kEBt4OaF7PT7jf/x+QSGfnZvKDYQ2pZ3POHjXlm/+nENA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [PATCH] fontforge: patch CVE-2024-25081 and CVE-2024-25082
Date: Tue,  6 May 2025 22:46:08 +0200
Message-Id: <20250506204608.1793419-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 06 May 2025 20:47:08 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/117356

From: Peter Marko <peter.marko@siemens.com>

Pick commit from PR [1] linked from [2] and [3] which mlso entions both
these CVEs.

[1] https://github.com/fontforge/fontforge/pull/5367
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-25081
[3] https://nvd.nist.gov/vuln/detail/CVE-2024-25082

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../CVE-2024-25081_CVE-2024-25082.patch       | 181 ++++++++++++++++++
 .../fontforge/fontforge_20230101.bb           |   1 +
 2 files changed, 182 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch

diff --git a/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch
new file mode 100644
index 0000000000..40f85e9f33
--- /dev/null
+++ b/meta-oe/recipes-graphics/fontforge/fontforge/CVE-2024-25081_CVE-2024-25082.patch
@@ -0,0 +1,181 @@
+From 216eb14b558df344b206bf82e2bdaf03a1f2f429 Mon Sep 17 00:00:00 2001
+From: Peter Kydas <pk@canva.com>
+Date: Tue, 6 Feb 2024 20:03:04 +1100
+Subject: [PATCH] fix splinefont shell command injection (#5367)
+
+CVE: CVE-2024-25081
+CVE: CVE-2024-25082
+Upstream-Status: Backport [https://github.com/fontforge/fontforge/commit/216eb14b558df344b206bf82e2bdaf03a1f2f429]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ fontforge/splinefont.c | 123 +++++++++++++++++++++++++++++------------
+ 1 file changed, 89 insertions(+), 34 deletions(-)
+
+diff --git a/fontforge/splinefont.c b/fontforge/splinefont.c
+index 239fdc035..647daee10 100644
+--- a/fontforge/splinefont.c
++++ b/fontforge/splinefont.c
+@@ -788,11 +788,14 @@ return( name );
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
+@@ -827,18 +830,30 @@ return( NULL );
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
+     }
+-    free(listcommand);
++    // Write out the listfile to be read in later
++    FILE *fp = fopen(listfile, "wb");
++    fwrite(stdoutresponse, strlen(stdoutresponse), 1, fp);
++    fclose(fp);
+ 
+     desiredfile = ArchiveParseTOC(listfile, archivers[i].ars, &doall);
+     free(listfile);
+@@ -847,22 +862,28 @@ return( NULL );
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
+@@ -885,20 +906,54 @@ struct compressors compressors[] = {
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
diff --git a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
index 31dd495fd7..d470ff12d4 100644
--- a/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
+++ b/meta-oe/recipes-graphics/fontforge/fontforge_20230101.bb
@@ -20,6 +20,7 @@ SRC_URI = "git://github.com/${BPN}/${BPN}.git;branch=master;protocol=https \
            file://0001-fontforgeexe-Use-env-to-find-fontforge.patch \
            file://0001-cmake-Use-alternate-way-to-detect-libm.patch \
            file://0001-Fix-Translations-containing-invalid-directives-hs.patch \
+           file://CVE-2024-25081_CVE-2024-25082.patch \
 "
 S = "${WORKDIR}/git"
 

