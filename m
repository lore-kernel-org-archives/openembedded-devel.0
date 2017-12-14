Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id 15B6F788A1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 10:10:11 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id i11so10254351wmf.4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Dec 2017 02:10:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=H4bva0eXpB+SdG2hgHjuq52FRlUQ/B5+WKU/Sup8koU=;
	b=jvy3F8Ut+/Ed5Epzdyb1YAudBxc6mB8wJHdb96KUSk5wnUZNj+ebF+IpKmQgjSdepo
	kJHgyXVGmGgtXaikbcnwyYLtS4XXACpN0wPXt8JxpliWaeGEYd2udjgpSknTeLqni5ep
	N0E1+R8+aqkGs4F4vkNlNixKvV40cuJW207rOQc3Wj9cFvMdIXSxnAa6xhs73GOMfxio
	i+kYAJkJQZ6zpzzwWSCh9qApml3N61sDrBtMW3YoIyX0Lz1yzN2MtVmjIQz1dQlr7D2S
	ZIfZDucFlgt3Iw6zI6ODJlkLmmnTtp2JQri5hwVqyIS8GhEC4p1CLziwo77TVkC1kMMm
	DHGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=H4bva0eXpB+SdG2hgHjuq52FRlUQ/B5+WKU/Sup8koU=;
	b=mhme+70HJsnWY77EyuCmncjeuR4vibIh/PLkI1MMS8NxKhNpxHmg/wurhk+v0SI2DI
	Z6aMUTn8E0qbgl+IUk+vC4ovyHb7qSRickylCRmiLs6/LzyfU3Ih5VlqnD22LnF9cOF8
	7w3QfqmvYjX5fWg3tMvjOJSMKQarMS+yal3Md63oMa/05qtPkeS1R1NIApanj0+KK6E4
	S332s4S0TS41IUwwqPS0r6K7cfD0Tcc1GI06aivFIlsqd3HNjdS317Pr3QGmt1Qu8zXF
	vZ/x/g5mHhlEOZKDwSG11eN5a2c3X+UfEjL8Y+fOUzKLsmd5ZbHXWTx6bJH/gMD1KXev
	ZA1A==
X-Gm-Message-State: AKGB3mIHnQt6H72ZWLPUp5t7P1cXzuWcVuMNKRZrLt5hgz0l25M15bJD
	2IykQ5Z2yQoeuXS35CkaiPqOqw==
X-Google-Smtp-Source: ACJfBou/rQELNGeewe7Q/02xDWhpnyyJFM6Cnzod7fNsEQikWdf3/Ho0NIKQfAGaxXCyQYsA8Vxu8Q==
X-Received: by 10.28.238.135 with SMTP id j7mr1799888wmi.140.1513246212620;
	Thu, 14 Dec 2017 02:10:12 -0800 (PST)
Received: from mueller-a-nb-linux.zera.local
	(ip-88-152-111-130.hsi03.unitymediagroup.de. [88.152.111.130])
	by smtp.gmail.com with ESMTPSA id c3sm1840174wrf.21.2017.12.14.02.10.11
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 14 Dec 2017 02:10:12 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 14 Dec 2017 11:09:28 +0100
Message-Id: <20171214100929.11094-5-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.9.5
In-Reply-To: <20171214100929.11094-1-schnitzeltony@gmail.com>
References: <20171214100929.11094-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 4/5] plymouth: packageconfig gtk needs gtk+3 as depends
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
X-List-Received-Date: Thu, 14 Dec 2017 10:10:12 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
index e331779..6b24ed2 100644
--- a/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
+++ b/meta-oe/recipes-core/plymouth/plymouth_0.9.2.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG_append_x86-64 = " drm"
 
 PACKAGECONFIG[drm] = "--enable-drm,--disable-drm,libdrm"
 PACKAGECONFIG[pango] = "--enable-pango,--disable-pango,pango"
-PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+"
+PACKAGECONFIG[gtk] = "--enable-gtk,--disable-gtk,gtk+3"
 PACKAGECONFIG[initrd] = ",,,"
 
 LOGO ??= "${datadir}/plymouth/bizcom.png"
-- 
2.9.5


