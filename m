Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16582CA0EDC
	for <webhook@archiver.kernel.org>; Thu, 14 Aug 2025 17:44:54 +0000 (UTC)
Received: from mta-65-227.siemens.flowmailer.net (mta-65-227.siemens.flowmailer.net [185.136.65.227])
 by mx.groups.io with SMTP id smtpd.web10.28820.1755193480909496733
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 14 Aug 2025 10:44:41 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm2 header.b=f3CAMP/E;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.227, mailfrom: fm-256628-202508141744378fbfcc01e49e7fad3e-ykiova@rts-flowmailer.siemens.com)
Received: by mta-65-227.siemens.flowmailer.net with ESMTPSA id 202508141744378fbfcc01e49e7fad3e
        for <openembedded-devel@lists.openembedded.org>;
        Thu, 14 Aug 2025 19:44:38 +0200
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm2;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:References:In-Reply-To;
 bh=+rSE/64QN9ZMu46sHjfHtb42MrhaHZ8OcdggsT6qhC8=;
 b=f3CAMP/EdDAys8T73fnxl775EzASH5raV+Ib+xV+nGW4TsyPsi6kzRAaYyemKbmlzyRBWE
 qBTIyRSMtzZNdMgG/Xy//wFfc3NLgCNWOmPLWkCD/S5kliTlR6HbdALEn25gypJJC6Yo0SpM
 6OBvDNGqXhFAPIPGlIwwZQv0d9I6qd56Mh7THDu5yRSvzE23Ip33c2xRVl9zsh7Gm6jrQMcM
 AY1/E1WDELaabXgjm0eFH8/aSHpBbuBAwjdtGAffwQ/p2IIkeHeeWqLX9QQ1h6hoKdgplUjN
 idKbV6HLfq/GDvX8jxJB9tRABpmW4Pwud4KQ84NWJxQzTAOTYXtb++4A==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][walnascar][PATCH 5/5] fontforge: patch CVE-2024-25081 and CVE-2024-25082
Date: Thu, 14 Aug 2025 19:43:52 +0200
Message-Id: <20250814174352.10670-5-peter.marko@siemens.com>
In-Reply-To: <20250814174352.10670-1-peter.marko@siemens.com>
References: <20250814174352.10670-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 14 Aug 2025 17:44:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118939

From: Peter Marko <peter.marko@siemens.com>

Pick commit from PR [1] linked from [2] and [3] which mlso entions both
these CVEs.

[1] https://github.com/fontforge/fontforge/pull/5367
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-25081
[3] https://nvd.nist.gov/vuln/detail/CVE-2024-25082

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
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
 

