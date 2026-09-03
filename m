Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE5F9C624DA
	for <webhook@archiver.kernel.org>; Thu,  3 Sep 2026 09:50:34 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4058.1788429027223686844
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 03 Sep 2026 02:50:27 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=TYlyyb1q;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84e84a6c4bfso839040b3a.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 02:50:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788429027; x=1789033827; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ohda+GjkE1pzhK8s1gNpW3ESsrfnedrHSixqBsykdmg=;
        b=TYlyyb1qKx3uPnswlSRkyc7Xim3rP3g/xpf+em+pFoQKPJy6fLUTmllOveL0fgFZol
         uHHJq9eaMqSxiAVy8J3NkXzEO8CqPi9UkaWJsn/ubQGjqi/zn8039PN3nvzkJGSSKoyZ
         7wwozvVb4uuF1oCzOEPAVTkdpKlPeiVGQgaUJSvSXswb55sXpMjVyYIhIrIMdJA2rEQd
         wZa0eqNG9q8r++pLTshzEIqm270RuiiyyPzRw10LWufTS1C1JTDMrttBvnrBQaRE/oGq
         1afCipJhh72dXY2ldJymnAjPJR320rpOREiGPnzcFQ7PZCxg6FCOMUldWxQ/5JLSgs06
         MFhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788429027; x=1789033827;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ohda+GjkE1pzhK8s1gNpW3ESsrfnedrHSixqBsykdmg=;
        b=S7Wu9VzXzdZO/bvRYdknyWtOuAi9QMT21sbexkFx1MZt1d0ExKgBWTOa+8ol2vKxH5
         AfV228E60RpgEeV/isp28qgdBMdY5jyXb+7q7M+IhhVraYIOb2zDWqQhTBgLoKOojbF0
         uoCJda7hZBO0JkJDLsx4/3PlPwrkdz+hC2DkshWZr4xVJrMSv3leH6LsEIixq1a5Bcg6
         yW1xxkICnn1XHQUrXFrVIWpgdNrh6fsC7g0XHkLzBBeSJ0NCAXG013SaKU8xcoTCHgvV
         Es1rXylK2MySCNUJ59KblZA/AC6wvO3ngUO6Rr+HPC3gL7me69/12vj0X1F8/+f6szYm
         7ocQ==
X-Gm-Message-State: AFuF++mc+sySm/+8GFKv2qVXZnQjBII/N1QerA0/ohSbna7/ww5wI0MQ
	TD+3fvgsQMNIEhnSiY4dqGwCeFRHBR9QHV6Y66nHK4Ph1U60r8kt9Kxeb+ztWtx2
X-Gm-Gg: AYBFou2anP/+sePkLSrIAYJY6treU+jnbPwiQMDPLQHtiU3iut702NoOzrSiJv/uEN6
	dF354fqbM8+R1YAGtBN0Ql33+61dRPPW2VoILjcUt+SLzwtyR58TuFIGrHCBamgCsVGebSRHxKI
	F+lOIa0OZDiGJ72v3SXol7zb+MGVYyCBUXJTLl/3DZvD6bP8yN3MEuGcPExKptmf11K/SqISMxb
	4Z2bbWJAQzKF+MtGJ9FnkSIYHLHTcESOW+I2aTnU29Qb9fwhnKPe2F1z0LsokwQBW3uNlEfPoRj
	BtxwNu8LpBLEUQ0AkE+bxT13jzN9XyOtBh3QKG55bKW2i7558R/vAFUN4u+o86wvhV2bJw0DHRR
	HDG81b5L9nggzUZ6toagcRADVlSOUCJPSYU0ac3Rk49gAcVnPL2YA5aonUdzTwCt96cAElmASTn
	1ANnyLzuJpL3W1NFl7lA+6Yt+rPy7SWphu22DTuqmesRVWU5GFnMh+vW7cpgsFjIaBb4yhAUt7S
	usDx4/OF6s=
X-Received: by 2002:a05:6a00:22ca:b0:84b:e69f:1b3f with SMTP id d2e1a72fcca58-8606687fc79mr2341594b3a.8.1788429026517;
        Thu, 03 Sep 2026 02:50:26 -0700 (PDT)
Received: from NVAPF55DW0D-IPD.. ([203.211.104.195])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-85dc003aebdsm2581265b3a.39.2026.09.03.02.50.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 02:50:26 -0700 (PDT)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-multimedia][wrynose][PATCH 12/22] libheif: patch CVE-2026-41071
Date: Thu,  3 Sep 2026 21:49:43 +1200
Message-ID: <20260903094954.3240723-12-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
References: <20260903094954.3240723-1-ankur.tyagi85@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 03 Sep 2026 09:50:34 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/129728

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Backport commit identified by Debian[1]
Also backport[2] which is needed to cherry-pick[1]

Details:
https://nvd.nist.gov/vuln/detail/cve-2026-41071

[1]https://security-tracker.debian.org/tracker/CVE-2026-41071
[2]https://github.com/strukturag/libheif/commit/71755d3d41a117685a3274bdd1214fc50a760f20

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../libheif/libheif/CVE-2026-41071-1.patch    | 34 ++++++++++++++
 .../libheif/libheif/CVE-2026-41071-2.patch    | 44 +++++++++++++++++++
 .../libheif/libheif_1.21.2.bb                 |  2 +
 3 files changed, 80 insertions(+)
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-1.patch
 create mode 100644 meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-2.patch

diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-1.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-1.patch
new file mode 100644
index 0000000000..7971ea3cef
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-1.patch
@@ -0,0 +1,34 @@
+From 415b59839dcf46bb05e08de7422a21e65ab28e03 Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Mon, 13 Apr 2026 19:49:06 +0200
+Subject: [PATCH] fix: reject malformed sequence files with saiz samples but no
+ chunks
+
+(cherry picked from commit 71755d3d41a117685a3274bdd1214fc50a760f20)
+
+CVE: CVE-2026-41071
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/71755d3d41a117685a3274bdd1214fc50a760f20]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/sequences/track.cc | 8 ++++++++
+ 1 file changed, 8 insertions(+)
+
+diff --git a/libheif/sequences/track.cc b/libheif/sequences/track.cc
+index acb916fa..ac5d5687 100644
+--- a/libheif/sequences/track.cc
++++ b/libheif/sequences/track.cc
+@@ -443,6 +443,14 @@ Error Track::load(const std::shared_ptr<Box_trak>& trak_box)
+         };
+       }
+ 
++      if (saio->get_num_chunks() != 1 && m_chunks.empty() && saiz->get_num_samples() > 0) {
++        return Error{
++          heif_error_Invalid_input,
++          heif_suberror_Unspecified,
++          "'saiz' box references samples but no chunks exist."
++        };
++      }
++
+       if (aux_info_type == fourcc("suid")) {
+         m_aux_reader_content_ids = std::make_unique<SampleAuxInfoReader>(saiz, saio, m_chunks);
+       }
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-2.patch b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-2.patch
new file mode 100644
index 0000000000..952c366966
--- /dev/null
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif/CVE-2026-41071-2.patch
@@ -0,0 +1,44 @@
+From b79d7d2a4f1502e93739453025ac2dbfd59e514f Mon Sep 17 00:00:00 2001
+From: Dirk Farin <dirk.farin@gmail.com>
+Date: Mon, 13 Apr 2026 20:09:26 +0200
+Subject: [PATCH] fix: reject malformed sequence files where saiz sample count
+ exceeds actual samples
+
+(cherry picked from commit f20c81745e917b4c496615140385c86d7a2fa58d)
+CVE: CVE-2026-41071
+Upstream-Status: Backport [https://github.com/strukturag/libheif/commit/f20c81745e917b4c496615140385c86d7a2fa58d]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ libheif/sequences/track.cc | 12 +++++++++++-
+ 1 file changed, 11 insertions(+), 1 deletion(-)
+
+diff --git a/libheif/sequences/track.cc b/libheif/sequences/track.cc
+index ac5d5687..e4b08afa 100644
+--- a/libheif/sequences/track.cc
++++ b/libheif/sequences/track.cc
+@@ -138,7 +138,9 @@ SampleAuxInfoReader::SampleAuxInfoReader(std::shared_ptr<Box_saiz> saiz,
+     for (uint32_t i = 0; i < nSamples; i++) {
+       if (!oneChunk && i > chunks[current_chunk]->last_sample_number()) {
+         current_chunk++;
+-        assert(current_chunk < chunks.size());
++        if (current_chunk >= chunks.size()) {
++          break;
++        }
+         offset = saio->get_chunk_offset(current_chunk);
+       }
+ 
+@@ -451,6 +453,14 @@ Error Track::load(const std::shared_ptr<Box_trak>& trak_box)
+         };
+       }
+ 
++      if (saiz->get_num_samples() > m_stsz->num_samples()) {
++        return Error{
++          heif_error_Invalid_input,
++          heif_suberror_Unspecified,
++          "Number of samples in 'saiz' box exceeds actual number of samples."
++        };
++      }
++
+       if (aux_info_type == fourcc("suid")) {
+         m_aux_reader_content_ids = std::make_unique<SampleAuxInfoReader>(saiz, saio, m_chunks);
+       }
diff --git a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
index 92891cb5ef..f3f03abdc7 100644
--- a/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
+++ b/meta-multimedia/recipes-multimedia/libheif/libheif_1.21.2.bb
@@ -12,6 +12,8 @@ SRC_URI = "git://github.com/strukturag/libheif.git;protocol=https;branch=master;
            file://CVE-2026-32739.patch \
            file://CVE-2026-32740.patch \
            file://CVE-2026-32741.patch \
+           file://CVE-2026-41071-1.patch \
+           file://CVE-2026-41071-2.patch \
            "
 
 SRCREV = "62f1b8c76ed4d8305071fdacbe74ef9717bacac5"

