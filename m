Return-Path: <ankur.tyagi85@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BDA8D5B87C
	for <webhook@archiver.kernel.org>; Tue, 16 Dec 2025 07:13:43 +0000 (UTC)
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.16480.1765869217927574307
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 15 Dec 2025 23:13:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=SIPbjJGu;
 spf=pass (domain: gmail.com, ip: 209.85.210.182, mailfrom: ankur.tyagi85@gmail.com)
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7b75e366866so1730413b3a.2
        for <openembedded-devel@lists.openembedded.org>; Mon, 15 Dec 2025 23:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765869217; x=1766474017; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DWQ2OSPk80opXbd1tWrKeoa8lW5+6XqK4Qwpypu1QcU=;
        b=SIPbjJGuCwKofRq9algUd+4otJuoVnwbtgiIYBjEHcEkDbTotEIJGXu/cVUSJaifw0
         v4KU+CV9dj/mWixyvGpycYOZdZp0dhFjfHVZmNjylt2z9PGIPfsu4HyMw0YLH4qhwOyo
         P+xVCGL6YWPRZ02AmzPy+OFXI8ZGNcQPsxYwTC+NK3plBdvnC4qaPioWYzcm/+7qZgmy
         brJUqWllYKSzZa1oDapFZl3rY95ufK31vBmKjg0tJIaRDsjypo77l59FeIiyIcq57TNH
         +O8gxGtkQlRdllasZ2vQBnjjSGGdwYKkCYjPcgOiMyZ6ZsOg3raMTQRUoRj210f6tKHs
         ljJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765869217; x=1766474017;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DWQ2OSPk80opXbd1tWrKeoa8lW5+6XqK4Qwpypu1QcU=;
        b=PWfBbXOYFoutPvFZUKk17aw7EyYyUVQhqcCT6aegQiVUU4PfCmoxwlNn2Lh35vZXHY
         sgL3xsZBuwQcVzfdbdX96CMCPO9MjZt9tJSym1a3Ol11yF1294Q0mH7r8n4kGlCz4Nqq
         48xLSDN9EjR73cLdTqY98DDCzGw7iC5vi2yGuyGRiNQIeaqBOTR1tO2PzFDr85IbT9co
         z7UbETHR563W7xiD/loJ05ooUOSZoMCGXcRlXglGtz289bklh6kgVfeGYNKPnmXxuDJs
         gBoreVaQvJ63WuRXMtGwFv+mhNUIK87u1f9flkVoRKAtstZIiGIk2Y40utAY0u2ulmPa
         ddxg==
X-Gm-Message-State: AOJu0YynbkuDnxiu3+bWSRjJcxqAA66WvK0loQs0r+zq5zpjLmoyvq/6
	1lPyuIq5E41HZNzIuaHETZuj92FQgKThCxrUiYiu5RYDb8O3LwW+c5B/2+qLnw==
X-Gm-Gg: AY/fxX5no436Bib9vXYx3vOqv9rKmrcYCxqyqHTeH2WvYjyGlVQYU84iwa/Gd9k9p+o
	DuRKEaWk4ESJpYYfRXhvR2svv4YqqfM2VNS11GG3QGMMDw0ZkQstCwMbSlUusOWY4SrY5Trc0sa
	J0VG7L8kwubjrXkIOvG53V244RnaqV8tnQsVaAtJBPed3swGtd3QBh2b8efFA/MoUSt0n96gvRE
	F81U3E24oQJhVV/b7g1uuxgfIVFSlPHppTVqz1YgS8FsVX2NjzHre6vSVnX3IhD33bFWZqbGdpZ
	i5ZlheG1WKSX2/Tx3i3xW/6SaQaUeRlRgckGSrKsBe2TmO8193fkdPchbKbS7HE5nTG31CTrrZ/
	qRBtqgsyLC3KlYr79r0usyQSaydhDGVr6lPYrgJhIcWxw9DDpfk5bURbfK5t/UE3usBfbBi+7Kj
	iVnf7WQU+Nb011BO/9goxsv2+U
X-Google-Smtp-Source: AGHT+IGfsD/+9k68r7BD+I4u4b6ZvLhnRkswLDd4a2k3xUzKGDfBaXnWEay3hQcKVafXjB2VGW1LhA==
X-Received: by 2002:a05:6a00:4407:b0:7e8:43f5:bd41 with SMTP id d2e1a72fcca58-7f6692abf0cmr12104265b3a.45.1765869216959;
        Mon, 15 Dec 2025 23:13:36 -0800 (PST)
Received: from NVAPF55DW0D-IPD.. ([165.225.124.223])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7f4c5093d5csm14225372b3a.49.2025.12.15.23.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 23:13:36 -0800 (PST)
From: ankur.tyagi85@gmail.com
To: openembedded-devel@lists.openembedded.org
Cc: Ankur Tyagi <ankur.tyagi85@gmail.com>
Subject: [oe][meta-oe][scarthgap][PATCH 1/4] jasper: patch CVE-2024-31744
Date: Tue, 16 Dec 2025 12:43:26 +0530
Message-ID: <20251216071329.3172170-1-ankur.tyagi85@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 16 Dec 2025 07:13:43 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/122676

From: Ankur Tyagi <ankur.tyagi85@gmail.com>

Details https://nvd.nist.gov/vuln/detail/CVE-2024-31744

Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
---
 .../jasper/jasper/0001-Fixes-381.patch        | 30 +++++++++++++++++++
 .../recipes-graphics/jasper/jasper_4.1.2.bb   |  1 +
 2 files changed, 31 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-381.patch

diff --git a/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-381.patch b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-381.patch
new file mode 100644
index 0000000000..21cf347d18
--- /dev/null
+++ b/meta-oe/recipes-graphics/jasper/jasper/0001-Fixes-381.patch
@@ -0,0 +1,30 @@
+From 0a3bbc33b88a44e03c7d7a2732b80f4e2ed45355 Mon Sep 17 00:00:00 2001
+From: Michael Adams <mdadams@ece.uvic.ca>
+Date: Fri, 29 Mar 2024 07:57:29 -0700
+Subject: [PATCH] Fixes #381.
+
+Added a missing check to the jpc_dec_process_sod function of the JPC codec.
+Added another image to the test set.
+
+CVE: CVE-2024-31744
+Upstream-Status: Backport [https://github.com/jasper-software/jasper/commit/6d084c53a77762f41bb5310713a5f1872fef55f5]
+Signed-off-by: Ankur Tyagi <ankur.tyagi85@gmail.com>
+---
+ src/libjasper/jpc/jpc_dec.c |   4 +++-
+ 1 file changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/src/libjasper/jpc/jpc_dec.c b/src/libjasper/jpc/jpc_dec.c
+index 929f7ae..7e44f05 100644
+--- a/src/libjasper/jpc/jpc_dec.c
++++ b/src/libjasper/jpc/jpc_dec.c
+@@ -611,7 +611,9 @@ static int jpc_dec_process_sod(jpc_dec_t *dec, jpc_ms_t *ms)
+ 	if (dec->pkthdrstreams) {
+ 		/* Get the stream containing the packet header data for this
+ 		  tile-part. */
+-		if (!(tile->pkthdrstream = jpc_streamlist_remove(dec->pkthdrstreams, 0))) {
++		if (jpc_streamlist_numstreams(dec->pkthdrstreams) != 0 &&
++		  !(tile->pkthdrstream = jpc_streamlist_remove(dec->pkthdrstreams,
++		  0))) {
+ 			return -1;
+ 		}
+ 	}
diff --git a/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
index 5f6ad067e0..398b3bd05f 100644
--- a/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
+++ b/meta-oe/recipes-graphics/jasper/jasper_4.1.2.bb
@@ -7,6 +7,7 @@ SRC_URI = "git://github.com/jasper-software/jasper.git;protocol=https;branch=mas
            file://0001-Fixes-400.patch \
            file://0001-Fixes-401.patch \
            file://0001-Fixes-402-403.patch \
+           file://0001-Fixes-381.patch \
            "
 SRCREV = "ff633699cb785967a2cb0084d89d56e53c46e416"
 

