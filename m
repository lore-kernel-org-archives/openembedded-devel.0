Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f196.google.com (mail-wr0-f196.google.com
	[209.85.128.196])
	by mail.openembedded.org (Postfix) with ESMTP id 5863777EA6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 18:21:59 +0000 (UTC)
Received: by mail-wr0-f196.google.com with SMTP id o2so12133714wro.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 17 Dec 2017 10:22:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=BJ4uHFfdopEYEd0GkTpPgNgUHxhSuBF6ezP5Lknap6w=;
	b=ML9twPOzJNetOe5IMIxUMmIogPbASDV/4rlS4t/mfjt2Nx4YABzCXi80i5cHMcSym7
	qKEfcMVPKtydNuHGSQAWOISKoqSHDMBlLEeeLpCvPs2qmVwksV1N+Eq6Nc4lcH4Y7v9H
	4MEiT/xT5HIP0+xMgUq3OptSqZ27HkDyDmldT9DL4ewei7/IdJk3AEGKdueaCvUtIRmw
	Zbh2JedZ5rTODhnX10keHsAqlQUanAQ6ZpJj9a94AC0xwl5bzcfekc9V2u7Iqli2umat
	9pRu2hpgfb0ioUP47t1ynnqV0izAcNY48ATx00j+fx4Z+R/NFIs9Kir4nJzT6jrwX4oZ
	mFUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=BJ4uHFfdopEYEd0GkTpPgNgUHxhSuBF6ezP5Lknap6w=;
	b=jSV7T3yYwcoEhedXFYhX82UYWFMiBUQ4vcNfgxRGQ/xsChAlt2qYS+UuW5/v415JsQ
	MebyZ1G7Ms6idjCwlhgh2tqZhl4sbOYEcGi3J1D5Fa1rnoQOo2heMgYMMpBIJHUvuTbK
	AUO42ROLO482g776vxUS52sFkTVVyagJbuCXOqfJj/07HUUdMslFyDGGbyPqtDHUPdvG
	NhnXg0j7lgYaykSO/88nX60melAv68TTqvd6qICBwrdcx80coTcLAbdg97LZEaKuMk+t
	MutdfS9kI1x82/Mqz+B/f3fJjdqh4y/cLHIICsVjHwAQKFZ3IrhYtMQ1mc0IKOfhHUrb
	HoLA==
X-Gm-Message-State: AKGB3mIzL0ayVlb+pHSR2gVIPYUapaSmTcyG/iroRNT4t3DEKqk0E3jI
	JTkIcnxHs4x89zaYueRLQfTlVA==
X-Google-Smtp-Source: ACJfBotMtooaXcNBTTCHneex5rctl00oHInZAjiN3wOsFo63Q/N3ywOdsLr9EawHlr8U8jqf3+WZWg==
X-Received: by 10.223.190.134 with SMTP id i6mr15144816wrh.177.1513534920801; 
	Sun, 17 Dec 2017 10:22:00 -0800 (PST)
Received: from PC192-168-2-116.speedport.ip
	(p200300F07BC3E4151E6F65FFFE3E7F61.dip0.t-ipconnect.de.
	[2003:f0:7bc3:e415:1e6f:65ff:fe3e:7f61])
	by smtp.gmail.com with ESMTPSA id 139sm7762637wmp.7.2017.12.17.10.21.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 17 Dec 2017 10:22:00 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 17 Dec 2017 19:21:41 +0100
Message-Id: <20171217182144.21123-6-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171217182144.21123-1-schnitzeltony@gmail.com>
References: <20171217182144.21123-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][V2 5/8] fltk-native: remove fltk-config from image
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 17 Dec 2017 18:22:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Make sure fltk-config will not be used accidentaly.

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-support/fltk/fltk-native.bb | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-oe/recipes-support/fltk/fltk-native.bb b/meta-oe/recipes-support/fltk/fltk-native.bb
index 353987e..2636287 100644
--- a/meta-oe/recipes-support/fltk/fltk-native.bb
+++ b/meta-oe/recipes-support/fltk/fltk-native.bb
@@ -14,3 +14,8 @@ EXTRA_OECMAKE += " \
     -DOPTION_USE_XFIXES=OFF \
     -DOPTION_USE_XCURSOR=OFF \
 "
+
+do_install_append() {
+    # make sure native fltk-config is not used accidentaly
+    rm -f ${D}${bindir}/fltk-config
+}
-- 
2.9.5


