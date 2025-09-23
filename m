Return-Path: <anuj.mittal@intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A123DCAC5B1
	for <webhook@archiver.kernel.org>; Tue, 23 Sep 2025 11:58:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by mx.groups.io with SMTP id smtpd.web11.15019.1758628660267361449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 23 Sep 2025 04:58:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@intel.com header.s=Intel header.b=dNgY6oWZ;
 spf=pass (domain: intel.com, ip: 198.175.65.21, mailfrom: anuj.mittal@intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758628684; x=1790164684;
  h=from:to:subject:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding;
  bh=bh4tgeAJnj2n8hYmZUYFLE6pw4MFeAtc14XMIR4Z7l4=;
  b=dNgY6oWZeySEhlYujHlWWQ3NX7wUFfhFjlNhBrZnIpHJcia8kokj/s3V
   qBnhICuxwe7FwwulrFhnkIH36x0xGjG2Za0GaTl5XybwmtapGqseVm3ly
   als8/2MsPNGz9wktGR8VgRXCQRrL63xgV92DSZ9NNEHaXGgam+4UgLmMd
   bk5OQFsD6oE8cxklhwxAaQAHQ8g/HsiGTlgbKCxQhBPHZjMP9nqZXj+LX
   PKXz7aT6bMS09mLMg/xeaqSmF6/EiPlYzzpQGhWtOd/1YdmA+NBQKpYW0
   cF7qdjRd1ixwAKhcbjJKWivoSGLkt0vKNEG68iAZsVjBPxXf+fgl9RTJR
   Q==;
X-CSE-ConnectionGUID: JP93ZSBIRGuf2VJGJolRGQ==
X-CSE-MsgGUID: nkRSo0PdQo6yhKlx9d00MQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="60821805"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="60821805"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:04 -0700
X-CSE-ConnectionGUID: uB2EW6NaTV2hA3tpfI0pZA==
X-CSE-MsgGUID: /avB5VrbSkus+DskhyIwkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,287,1751266800"; 
   d="scan'208";a="175875209"
Received: from anmitta2-mobl4.gar.corp.intel.com (HELO anmitta2-mobl4.intel.com) ([10.247.118.223])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2025 04:58:03 -0700
From: Anuj Mittal <anuj.mittal@intel.com>
To: openembedded-devel@lists.openembedded.org
Subject: [scarthgap][PATCH 15/24] fontforge: patch CVE-2024-25081 and CVE-2024-25082
Date: Tue, 23 Sep 2025 19:57:18 +0800
Message-ID: <06a086228747b1c689ed4e8bd51847ec45d8aded.1758626365.git.anuj.mittal@intel.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <cover.1758626365.git.anuj.mittal@intel.com>
References: <cover.1758626365.git.anuj.mittal@intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 23 Sep 2025 11:58:12 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/119704

From: Peter Marko <peter.marko@siemens.com>

Pick commit from PR [1] linked from [2] and [3] which mlso entions both
these CVEs.

[1] https://github.com/fontforge/fontforge/pull/5367
[2] https://nvd.nist.gov/vuln/detail/CVE-2024-25081
[3] https://nvd.nist.gov/vuln/detail/CVE-2024-25082

Signed-off-by: Peter Marko <peter.marko@siemens.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
(cherry picked from commit 1e6dbd183bc7e5dd7681fd5ae65f043cc8641a1d)
Signed-off-by: Anuj Mittal <anuj.mittal@intel.com>
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
 

