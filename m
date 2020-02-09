Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com
	[209.85.221.46])
	by mail.openembedded.org (Postfix) with ESMTP id 47EB16080B
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  9 Feb 2020 15:11:02 +0000 (UTC)
Received: by mail-wr1-f46.google.com with SMTP id m16so4376040wrx.11
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Feb 2020 07:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=vlCeNLTnpB0vRzc9j3iL3tUq4T+ade0bdE/u1Gex1hs=;
	b=K45tdsRPge55daOCrRPocVJVAudQhL1Szzc3FSHVrYcqv7x+ZW7JSJzsF2UecJF552
	ld03DkuvMJ1y2Zi79vUzhHuEQo8kVCXOaZ9wcELktt+G0NgTniRjo6Y3+CaiU3hzGuCn
	UhbLalTB5UQS4d7ljbOF2h2ov66m1YpUsqAoi4idMsN24Jc/aYqMgsZUhM5KlG3i/y39
	sMXgWCcbXw+prZp5V9jf+y1928pqCd3no8ZP37JD8Vs8GuqMDIIuMpN8OkMdVsN2BXCb
	fi2P7XHVZS1PC+DqS4NqGqTtZGWFaNxFb6wh5KWXlnEkBD/D7rb+BO0j+AN6kl19aduc
	pS+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=vlCeNLTnpB0vRzc9j3iL3tUq4T+ade0bdE/u1Gex1hs=;
	b=ERgboW7OjSwlehlbBW0FYXnbQTzg9LLvda3ED1HRalyBk3Jq65khrHP4jWLhjXyOZu
	iSJwATua27LQFZK/rf9X9N2E4BxR1v72qfWJBTAxhiAIp28E8/B89kdtFCdHGJ79/o/j
	V7eLMKHqyO6uD4HoZbsZeBbFvOFiQ17lB2b+392kzfSiG67fUj27EgT3jYxICOqVasVm
	LFHF08Aw/anLU1wkOZKKMsXteVtUfF8gdg/jOHi5pUnUN6NwE8jKtnVf+i0luy3XUIPT
	0KJ4Pf2iqh56sCBbzZVmTS8A2DBSKMVuTwlR5D7Sn5fzAvATEZVqWhQeM4EfJTeOCoYs
	+3xA==
X-Gm-Message-State: APjAAAVVhrfs5dxyb0JO0MzIgkupJ8yaEgYLr7tX58dRatcqq+r1tjcH
	HhIpKWEVbNTRVDOZEH1UiqLtMazV
X-Google-Smtp-Source: APXvYqyt6b3u4XHogFJRl5aZjDRmSvihjcxbZSN7PhQxO7bOknjD6FsBrjR8KvVpfkiRkAEyKrk1JA==
X-Received: by 2002:a5d:494b:: with SMTP id r11mr11372176wrs.184.1581261062717;
	Sun, 09 Feb 2020 07:11:02 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F2C16629984A4CCEAA4B6A2.dip0.t-ipconnect.de.
	[2003:f0:7f2c:1662:9984:a4cc:eaa4:b6a2])
	by smtp.gmail.com with ESMTPSA id
	q10sm11429093wme.16.2020.02.09.07.11.01
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 09 Feb 2020 07:11:01 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Feb 2020 16:10:48 +0100
Message-Id: <20200209151053.4277-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20200209151053.4277-1-schnitzeltony@gmail.com>
References: <20200209151053.4277-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v2 1/6] babl: upgrade 0.1.62 -> 0.1.74
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
X-List-Received-Date: Sun, 09 Feb 2020 15:11:02 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

* babl moved to meson build
* move to meta-gnome: latest gimp requires gexiv2 and nothing but gimp depends
  on babl
* extend to native build for native gegl (next patch)
* get sources from location gimp's homepage suggests

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gimp/babl/babl_0.1.74.bb           | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)
 rename meta-oe/recipes-graphics/babl/babl_0.1.62.bb => meta-gnome/recipes-gimp/babl/babl_0.1.74.bb (31%)

diff --git a/meta-oe/recipes-graphics/babl/babl_0.1.62.bb b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
similarity index 31%
rename from meta-oe/recipes-graphics/babl/babl_0.1.62.bb
rename to meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
index 4a7dbcab3..59921d344 100644
--- a/meta-oe/recipes-graphics/babl/babl_0.1.62.bb
+++ b/meta-gnome/recipes-gimp/babl/babl_0.1.74.bb
@@ -2,12 +2,16 @@ SUMMARY = "Babl is a dynamic, any to any, pixel format conversion library"
 LICENSE = "LGPL-3.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=6a6a8e020838b23406c81b19c1d46df6"
 
-inherit gnomebase
+GNOMEBASEBUILDCLASS = "meson"
 
-SRC_URI = "http://ftp.gimp.org/pub/${BPN}/0.1/${BP}.tar.bz2"
-SRC_URI[md5sum] = "28fa9d43549378ceebe2871d7721dd46"
-SRC_URI[sha256sum] = "dc279f174edbcb08821cf37e4ab0bc02e6949369b00b150c759a6c24bfd3f510"
+GIR_MESON_OPTION = "enable-gir"
 
-FILES_${PN} += "${libdir}/babl-*/*.so"
-FILES_${PN}-dev += "${libdir}/babl-*/*.la"
-FILES_${PN}-dbg += "${libdir}/babl-*/.debug/"
+inherit setuptools3 gnomebase gobject-introspection
+
+DEPENDS += "lcms"
+
+SRC_URI = "https://download.gimp.org/pub/${BPN}/0.1/${BP}.tar.xz"
+SRC_URI[md5sum] = "d032853f2678bc95054c39d4f02045c1"
+SRC_URI[sha256sum] = "9a710b6950da37ada94cd9e2046cbce26de12473da32a7b79b7d1432fc66ce0e"
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


