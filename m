Return-Path: <zboszor@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C6EABCCA471
	for <webhook@archiver.kernel.org>; Mon,  6 Oct 2025 03:53:25 +0000 (UTC)
Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
 by mx.groups.io with SMTP id smtpd.web11.25547.1759722802074372307
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 20:53:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=gctoEsPf;
 spf=pass (domain: gmail.com, ip: 209.85.210.175, mailfrom: zboszor@gmail.com)
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-781ea2cee3fso4106566b3a.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 20:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759722801; x=1760327601; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1Ay18uDRvqAurfTB1AxynkXFwbAjTxKqpEZmDfcAxQQ=;
        b=gctoEsPfpEyLj03ANnQhubtb5i7luVIFSFGuT1Cht+B76wgy1yqGx5Le5sULmonMP/
         5AhEL2pBjnTxLSx8BzucTgHkV3NqDInebNQ8bKyAn3dScZpmqjHaeGMkt4IXad4KFesO
         sL/+mtnHx81dVqN5b4utfJYodNtiCdLRpjV/BkJHntT/pUvCXRxXpSyOZ9AkKzralaRy
         UQAiAoj5FdueOWKKweMTDdc4Jl3iUdMLyS5IoXibnryJokigg7oMEh012PMi+9cpIMuD
         hbPJi0ZvSIAdWNuGx80eQO7VNANsOEdFrMmCg50yW1TCByON4JNAD2sKeUu93lIlygXT
         AOzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759722801; x=1760327601;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Ay18uDRvqAurfTB1AxynkXFwbAjTxKqpEZmDfcAxQQ=;
        b=k/l9PkHq1bs2ASJWfLMDn/kx4lMMrnaMSYm+SiovhYUh4Kwe2yFsKnL6JnEAz4THZq
         ZFS1eNPJfXuipLbMpUxPfLmtl9onfZlYkC661p+PPdIud3j+Y7reI7EZX8pQ5nuURjk4
         sLzZo3GbDBd1c02WoDb1yOhSdTE9tsHBRE7OVXu5Pqav0Rhnqfs7djxhv/mUdAGt/bog
         D55o1I8MmjUtLwKr0yveCvPiTGZ2drXlUzub8chSCibqoFbIsGWqsrcnWaB3NMMG40L4
         /uiIr64xZb+SLBnaQRZF8hb1lBfryaI5tNcIo5youCmT1LoCdi3TfckfTxrH+K8MSoGO
         vgIw==
X-Gm-Message-State: AOJu0YzB3NOd/jidDtjBm1tGWf0Sn2HK/8EviIWyMNSM0cebXp4qIGkd
	aL4yhuwmuYoWmv8jdZpK1XwmzGpgIKZeoJK5JwJOhWR1aamvQ8dnC5iPQRbg4qPD
X-Gm-Gg: ASbGncuNAtBJMo5thDt1xz1nV6Oiv3Rigs5hV7Qp7c/qDESzPhBl14GLTPA5a7YW9yo
	lCt0WxeuDuTOUcN5tadOeGoWk5UYqOo3KUZycEwE3TEMyiV3mS7SxiNr0xz/jknrQa8q/wdIFS+
	ur3+nlrbdoL75gpunhBUrTCMH68sG2kacL6rU02BhJdFuVGX6NsO3ICO0h6SFaYgt3TYJb7TW64
	a4N3Zm0RtKq0RmAeR3+ZkGtUN6ko4ugrxux4Ma9oBPiBfCj9IprO/CeXU1RsuJ/svvfdMSK8/Xm
	v70Jp6DeL6FaHk964FCZNZrS6Z7VaePrdEb3247DCQtLx2WZ+9t1T1K/fRWeXSUMfDAo39fLWAv
	U7iT7Z5q4OxUTMsgzIuc12rl5upokgBlCuWFQ8VMdF/uf06Cw0qNs0XymwoS2PszK5e3bjhQyxF
	u4ohw=
X-Google-Smtp-Source: AGHT+IH0MXAcbtxoN5HCzVPjzAAOX+OShR3lhdIjNuPcN6NMyIMXeEO9N3iYYKUP0c1zKWo/1B4M8Q==
X-Received: by 2002:a05:6a00:3998:b0:782:ec0f:d273 with SMTP id d2e1a72fcca58-78c98a4e0demr13972153b3a.1.1759722801067;
        Sun, 05 Oct 2025 20:53:21 -0700 (PDT)
Received: from fedora (dsl51B7D2F9.fixip.t-online.hu. [81.183.210.249])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-78b01f9cbb4sm11075213b3a.10.2025.10.05.20.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 20:53:20 -0700 (PDT)
From: =?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Tim moto-timo Orling <TicoTimo@gmail.com>,
	Derek Straka <derek@asterius.io>,
	=?UTF-8?q?Zolt=C3=A1n=20B=C3=B6sz=C3=B6rm=C3=A9nyi?= <zboszor@gmail.com>
Subject: [meta-python][PATCH] python3-odfpy: New recipe for version 1.4.1
Date: Mon,  6 Oct 2025 05:53:12 +0200
Message-ID: <20251006035312.563935-1-zboszor@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 06 Oct 2025 03:53:25 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120268

It's an optional dependency for pandas to provide ODS reader
and writer support. It complements spreadsheet support along
with python3-xlrd and python3-openpyxl, both of which are
part of meta-python already.

Signed-off-by: Zoltán Böszörményi <zboszor@gmail.com>
---
 .../recipes-devtools/python/python3-odfpy_1.4.1.bb  | 13 +++++++++++++
 1 file changed, 13 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb

diff --git a/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
new file mode 100644
index 0000000000..1b943e535e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-odfpy_1.4.1.bb
@@ -0,0 +1,13 @@
+SUMMARY = "Python API and tools to manipulate OpenDocument files"
+LICENSE = "Apache-2.0 | (GPL-2.0-or-later & LGPL-2.0-or-later)"
+LIC_FILES_CHKSUM = " \
+	file://APACHE-LICENSE-2.0.txt;md5=3b83ef96387f14655fc854ddc3c6bd57 \
+	file://GPL-LICENSE-2.txt;md5=751419260aa954499f7abaabaa882bbe \
+"
+
+PYPI_PACKAGE = "odfpy"
+
+inherit pypi setuptools3
+SRC_URI[sha256sum] = "db766a6e59c5103212f3cc92ec8dd50a0f3a02790233ed0b52148b70d3c438ec"
+
+RDEPENDS:${PN} = "python3-defusedxml"
-- 
2.51.0


