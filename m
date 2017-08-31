Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f65.google.com (mail-pg0-f65.google.com [74.125.83.65])
	by mail.openembedded.org (Postfix) with ESMTP id DB62778400
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 14:48:33 +0000 (UTC)
Received: by mail-pg0-f65.google.com with SMTP id t3so603890pgt.5
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Aug 2017 07:48:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=GV6qMXaIGcyLniSaDrgOGgBo6oJ19Ug15NcXlCVQv1c=;
	b=sAXZE+IRHsFPr4XQpnCBk4esfNDxe2i2ojKKTbItJefQ+3QJAFFeBs8YsFYZ8LZy9M
	Uq4lj+Sh0OCG/Z7+UNddH+4tlXbKxuB5AtAgMAkNT32Y8C/F+65S6RRBp5BIj97bD9ST
	xXhLvcAReeDwoChB2bGusF3kn3CZ1qBwLH/WFLBZThWBeMhxS2eW+dSR+e5GSMivCNf4
	4Hl+DfpLoBZIqwzVcCS1Rg8/67XByUIPIJjKE5ILkKDCjte+juS4Vln+7ApcADDGMqPs
	DRZ7+ubh4u6V4734eG8Q+BSjgGSnECxSSioIxke4FKyN1zD1Vsgeg1He1XHGnkX9xWOr
	ehaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=GV6qMXaIGcyLniSaDrgOGgBo6oJ19Ug15NcXlCVQv1c=;
	b=hhRln4XmIpYFIYgOxUVeYieqkIOFMw3dF4rxAvZRqaVVNQA1CpFrJZ+xSoVszylvdj
	uzGVWSnoGIzgEtE2kbCgzxQOdrhSr+d6Hw5+s/opFtiXGqYRFKea3U3fCuhNxMpo4j78
	TMz897GE3mCeM0i/cLZrYjTrqchYvH18eTC+e6/e0gqV75SCaebYBBG8CriaU9jXmM6C
	XjnhVesvq22FWL1yWZQNU0XxMSPhELsWZnd5MPhZJiB31jls5+Vkc3WXwnkAQh4apIa7
	oDEpoPepFO56PaO9Q6HOs4MAChDjhp04Vll9bQbf2VVvM3oRNwRtrXdpZbasLZNh+DCn
	0Krw==
X-Gm-Message-State: AHYfb5i9ar4Rf7QdrvAj2PORbOUfrnaK1CGCCAORodWshwv8OvpxbTSs
	/vE1l8D3rXwnEM4V
X-Google-Smtp-Source: ADKCNb48wutmaGQ9rrkEaHWgSwoubs+0GomGz93Tl03YPAtmXoSj8M9YaMKT0t336vweydYCiZ1QOA==
X-Received: by 10.99.122.69 with SMTP id j5mr2800207pgn.12.1504190915355;
	Thu, 31 Aug 2017 07:48:35 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8882:b8c::2e06])
	by smtp.gmail.com with ESMTPSA id
	e190sm13470751pfa.41.2017.08.31.07.48.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 31 Aug 2017 07:48:34 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Aug 2017 07:48:26 -0700
Message-Id: <20170831144826.6048-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.14.1
In-Reply-To: <20170831144826.6048-1-raj.khem@gmail.com>
References: <20170831144826.6048-1-raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] libgphoto2: Copy Makefile.in.in from gettext-native
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
X-List-Received-Date: Thu, 31 Aug 2017 14:48:33 -0000

virtual/gettext is not including virtual/gettext anymore

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
index 5e798efb3..4434af930 100644
--- a/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
+++ b/meta-oe/recipes-graphics/gphoto2/libgphoto2_2.5.8.bb
@@ -31,7 +31,7 @@ PACKAGECONFIG[gd] = ",--without-gdlib,gd"
 PACKAGECONFIG[serial] = "--enable-serial,--disable-serial,lockdev"
 
 do_configure_append() {
-    cp ${STAGING_DATADIR}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
+    cp ${STAGING_DATADIR_NATIVE}/gettext/po/Makefile.in.in ${S}/libgphoto2_port/po/
     cd ${S}/libgphoto2_port/
     autoreconf -Wcross --verbose --install --force ${EXTRA_AUTORECONF} $acpaths
     cd ${S}
-- 
2.14.1


