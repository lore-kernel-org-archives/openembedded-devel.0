Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFD8EC54F51
	for <webhook@archiver.kernel.org>; Wed, 29 Jul 2026 13:25:21 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.11271.1785331512547544113
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jul 2026 06:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=hnox2TYQ;
 spf=pass (domain: konsulko.com, ip: 209.85.221.43, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-47f7854678bso474405f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 06:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1785331511; x=1785936311; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xnj0LN6NWYmldwuQYjYP33hN1fUNzlykKcxIEEVeCaU=;
        b=hnox2TYQIDypMdzzsmlFMYT0GQPffZZ2gC/+6eChozc+0OTO6XNQaq0a/g+vgJvItT
         FZ3Pf4UE4NDbbKiZSMRBWUfRO7VUVIkGX9BZeKNCvslXPhVr/wQqxfMwG6F3tnRjyRhQ
         rZSHHf0X5Mw/lrWcsURWSSYY18E16wG+iSTXw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785331511; x=1785936311;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=xnj0LN6NWYmldwuQYjYP33hN1fUNzlykKcxIEEVeCaU=;
        b=NtunSZ3qFSFleyY2iK2t/Q558ozpewS8eneLCGxr1jhAxh6Q7No/oWywok55plZR5B
         dcxXnH8Yi7tr1OLakxk8YgKFU8UNuh4d/Aggx2Y8zHehm3hsxOVJpqtoQ783WyDCu4aJ
         q8x9i0NlRgDQ6rZ2u6dDm08eAKWpaYQbxbvM1mewea0Zmu8BQufGolC48jjHrRfg64Sc
         a/epBAr/BjEh0mxkBnxp7rZWDOWRNN9wxdTlz17yAcxyucbz8u6YF14QbFjcfTGaHZ1n
         llbSm5PHQSzHHGKcTYyJvupqmMXfMXVvgkHJC8m1/p0fudUWyzZrwM2RMNTy5k2rkqeH
         vDFg==
X-Gm-Message-State: AOJu0YzVfzSc7+dIpvy0TUfSqdyTaYuVRm07BeFT4FdSIEYzWFKa+Mfe
	Q9eRtR1oc2DkBtlGjpUza4U9Crl3ngzlzaVfU+X5GsaX27eIwqepu5qkbRYIigqEbU0D5++sYSO
	5e5Y2
X-Gm-Gg: AR+sD10ASfvz1xOHWIMhSMBHreq9kDofLO+pSM9PyLQwJAcfgBGgvI+GNO90kMgBFX4
	+qkBOddF2J8Ss6v48gnDZb2/Ux+FCAvIvih3YjxSAbe62DcggwqBIU62o06CKDXcb+n0jsHmmwT
	E+IzmP+Qne1U1RtMkcTI6GAoWXWJTZBR9QiqpwfYadgK3YPTbmvC5+Ze5cDWH7jAq1PZg1yr4RM
	5FzmTCr7vfFJ0db1afxcGylgHheiCLP78CZbrYZlwg2KOXbEsB8iu5k0y3Sd+yS2cDsRyMrp9pA
	t7e17HRGunKx3bkndYAl99cIDqZjBhvOgLvhcmNB43qNViA2DcqRP3qzJDVLRxCtwaRhndzmZCX
	OcAoaTZHcunWXOS4muglOCJnaJ95wKheqQymDzG5aJzmo/qis53ubKr/m7IcMkj4l3FL4v8xWFR
	OYV2Km/CwJiP7CtNyjyXBhnoy2zD6V6R0eaIC+IJrFBY+GenOLo95cekwT8kESfCgt7wk5F/aax
	8pcBjlVTqJM1fB2RcgSKhV4B6fUqcurxk2K+dFD82LmVBuNckAvk9sljLItRsSzHQigzInAHsTR
	SjqEjWZo2xh9Mg==
X-Received: by 2002:a05:6000:2403:b0:47f:959f:f69c with SMTP id ffacd0b85a97d-47fb1ecafa4mr7324260f8f.7.1785331510364;
        Wed, 29 Jul 2026 06:25:10 -0700 (PDT)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b191a0sm7976457f8f.28.2026.07.29.06.25.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 06:25:09 -0700 (PDT)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 1/2] python3-pytest-httpserver: Add recipe
Date: Wed, 29 Jul 2026 16:25:06 +0300
Message-ID: <20260729132507.3183917-1-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jul 2026 13:25:21 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/128561

Add recipe for pytest_httpserver, a HTTP server for pytest.
Changelog for release 1.1.5:

- Add bake() method for pre-configured request expectations

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-pytest-httpserver_1.1.5.bb | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb

diff --git a/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb b/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb
new file mode 100644
index 0000000000..4421260005
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-pytest-httpserver_1.1.5.bb
@@ -0,0 +1,19 @@
+SUMMARY = "HTTP server for pytest to test http clients"
+DESCRIPTION = "HTTP server for pytest to test http clients"
+HOMEPAGE = "https://github.com/csernazs/pytest-httpserver"
+LICENSE = "MIT"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7f54416ccc5478427995b27e5ef38e92"
+
+SRC_URI[sha256sum] = "dc3d82e1fe00e491829d8939c549bf4bd9b39a260f87113c619b9d517c2f8ff1"
+
+PYPI_PACKAGE = "pytest_httpserver"
+
+inherit pypi python_poetry_core ptest-python-pytest
+
+RDEPENDS:${PN}-ptest += " \
+        python3-requests \
+"
+
+RDEPENDS:${PN} += " \
+        python3-werkzeug \
+"
-- 
2.47.3


