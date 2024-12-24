Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84897E7718D
	for <webhook@archiver.kernel.org>; Tue, 24 Dec 2024 12:46:03 +0000 (UTC)
Received: from mta-65-226.siemens.flowmailer.net (mta-65-226.siemens.flowmailer.net [185.136.65.226])
 by mx.groups.io with SMTP id smtpd.web10.32716.1735044349808130286
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 24 Dec 2024 04:45:50 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=peter.marko@siemens.com header.s=fm1 header.b=Ok/CSLmY;
 spf=pass (domain: rts-flowmailer.siemens.com, ip: 185.136.65.226, mailfrom: fm-256628-20241224124547b47d3b72d2975927d2-okz_67@rts-flowmailer.siemens.com)
Received: by mta-65-226.siemens.flowmailer.net with ESMTPSA id 20241224124547b47d3b72d2975927d2
        for <openembedded-devel@lists.openembedded.org>;
        Tue, 24 Dec 2024 13:45:48 +0100
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; s=fm1;
 d=siemens.com; i=peter.marko@siemens.com;
 h=Date:From:Subject:To:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Cc:References:In-Reply-To;
 bh=C38wmnNuQOLG3TX7vSii6qLDCl6sjEr4b5QFJhlDQP4=;
 b=Ok/CSLmYHReqLMvT0xCSl0VT01VTyO+68BFzQRdI1DhyH7lA+XVqcSO6yIS2S3cb3ujkWo
 btAFJJLGMaNIxBRHwF7FvKM09Up+04l/sLh6FXovMijQzTq8q6k1K720jvU4NqmOrpip/AgP
 vUZIs/MnJSHqRM8a8oICic6BHgOIiher7mXI13xJ06Tk64inyP16pb9WMkcu5hZNUorp7DcA
 93Ap8GXVbA14/cj9N2gvKGsCfRsbgmKIOBB2fiOpRYZlAhDwtOWvNZ/mwbFfsx7Ab5aIsLP0
 0FhMDnPV4QmHowLvJvJw3907bErb77u9YmUsg58RALcJgQBXRoJ3BoIA==;
From: Peter Marko <peter.marko@siemens.com>
To: openembedded-devel@lists.openembedded.org
Cc: Peter Marko <peter.marko@siemens.com>
Subject: [meta-multimedia][PATCH 5/6] opusfile: patch CVE-2022-47021
Date: Tue, 24 Dec 2024 13:44:16 +0100
Message-Id: <20241224124417.2547005-6-peter.marko@siemens.com>
In-Reply-To: <20241224124417.2547005-1-peter.marko@siemens.com>
References: <20241224124417.2547005-1-peter.marko@siemens.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Flowmailer-Platform: Siemens
Feedback-ID: 519:519-256628:519-21489:flowmailer
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 24 Dec 2024 12:46:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114546

From: Peter Marko <peter.marko@siemens.com>

This patch is mentioned in [1] and [2].

[1] https://nvd.nist.gov/vuln/detail/CVE-2022-47021
[2] https://github.com/xiph/opusfile/issues/36

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../opusfile/opusfile/CVE-2022-47021.patch    | 44 +++++++++++++++++++
 .../opusfile/opusfile_0.12.bb                 |  2 +
 2 files changed, 46 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch

diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch b/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
new file mode 100644
index 0000000000..48a7cab3f5
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile/CVE-2022-47021.patch
@@ -0,0 +1,44 @@
+From 0a4cd796df5b030cb866f3f4a5e41a4b92caddf5 Mon Sep 17 00:00:00 2001
+From: Ralph Giles <giles@thaumas.net>
+Date: Tue, 6 Sep 2022 19:04:31 -0700
+Subject: [PATCH] Propagate allocation failure from ogg_sync_buffer.
+
+Instead of segfault, report OP_EFAULT if ogg_sync_buffer returns
+a null pointer. This allows more graceful recovery by the caller
+in the unlikely event of a fallible ogg_malloc call.
+
+We do check the return value elsewhere in the code, so the new
+checks make the code more consistent.
+
+Thanks to https://github.com/xiph/opusfile/issues/36 for reporting.
+
+Signed-off-by: Timothy B. Terriberry <tterribe@xiph.org>
+Signed-off-by: Mark Harris <mark.hsj@gmail.com>
+
+CVE: CVE-2022-47021
+Upstream-Status: Backport [https://github.com/xiph/opusfile/commit/0a4cd796df5b030cb866f3f4a5e41a4b92caddf5]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/opusfile.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/src/opusfile.c b/src/opusfile.c
+index ca219b2..3c3c81e 100644
+--- a/src/opusfile.c
++++ b/src/opusfile.c
+@@ -148,6 +148,7 @@ static int op_get_data(OggOpusFile *_of,int _nbytes){
+   int            nbytes;
+   OP_ASSERT(_nbytes>0);
+   buffer=(unsigned char *)ogg_sync_buffer(&_of->oy,_nbytes);
++  if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+   nbytes=(int)(*_of->callbacks.read)(_of->stream,buffer,_nbytes);
+   OP_ASSERT(nbytes<=_nbytes);
+   if(OP_LIKELY(nbytes>0))ogg_sync_wrote(&_of->oy,nbytes);
+@@ -1527,6 +1528,7 @@ static int op_open1(OggOpusFile *_of,
+   if(_initial_bytes>0){
+     char *buffer;
+     buffer=ogg_sync_buffer(&_of->oy,(long)_initial_bytes);
++    if(OP_UNLIKELY(buffer==NULL))return OP_EFAULT;
+     memcpy(buffer,_initial_data,_initial_bytes*sizeof(*buffer));
+     ogg_sync_wrote(&_of->oy,(long)_initial_bytes);
+   }
diff --git a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
index c775cef5a1..9e1d80e8dd 100644
--- a/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
+++ b/meta-multimedia/recipes-multimedia/opusfile/opusfile_0.12.bb
@@ -11,4 +11,6 @@ SRC_URI = "https://downloads.xiph.org/releases/opus/${BP}.tar.gz"
 SRC_URI[md5sum] = "45e8c62f6cd413395223c82f06bfa8ec"
 SRC_URI[sha256sum] = "118d8601c12dd6a44f52423e68ca9083cc9f2bfe72da7a8c1acb22a80ae3550b"
 
+SRC_URI += "file://CVE-2022-47021.patch"
+
 inherit autotools pkgconfig
-- 
2.30.2


