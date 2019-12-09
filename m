Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com
	[209.85.221.47])
	by mail.openembedded.org (Postfix) with ESMTP id 547DC7FC37
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  9 Dec 2019 08:36:39 +0000 (UTC)
Received: by mail-wr1-f47.google.com with SMTP id z7so15059508wrl.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Dec 2019 00:36:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=WuWascXObrxwxONnQc4ULQBtC2B+rEXMTYYx1XBtEys=;
	b=YMYkzeRTqACUduKdcKxog4Uz+mBBDTaF3Hq+WTRIoEEazws9YyFvumsJ5XFTLVj1Fo
	35nuT4eH9pvWjA344q8UBIOYSIzc1viB/EBZ230jbRkp5eiRpX6UjvtDylmazL4keeiD
	UrRix2FHtIBQbSklz7F3In+7xVVoG508R8Nk2ij8/W+llpwg6oNsu+2JdUey7nH66YRt
	xBi3TFoW/W3vZwxW23E+hNot1HIbhG1EbhMx+OMCKfyAD57ZCRi+MB2N8iJMzPOmX0pi
	aIqqRAAEfohmXJ1/84G0Fp3SBj9UMQs7pzxnNS9FkuhIrMud+dP1DcTil0dx3kVmVpvy
	NxWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=WuWascXObrxwxONnQc4ULQBtC2B+rEXMTYYx1XBtEys=;
	b=hHQAd+Kfa3nrD9zunI0PAYvus5bIYiJKCDrYNGSvf3a7FCC/5vT6fAMLP8s2/xLO9Q
	MT1sX/xAKYnxoi9ots7HGEaV1u632dVyNISVocZIIcf8qhj4WvUYKxtXsL1acGHubg72
	yzMVtq9Bgvj1kX9pKZbNxm8T712NfgCxCz+N9DedM/kFAHRsMa+ePc2F+1ep7fIAAyt7
	ifAEv2pl7W+IKB3M/P5C+iWEfDJcOdElXpQu97hIxBqbhB3AgmlZ77hv0cges9tTtSX+
	J4W0c82aGXQR/dAN+6NJLw1iY7ekkMWwYlwCUdjGtnSNGvL5neQyRGF7IAF6E167/FS5
	iofw==
X-Gm-Message-State: APjAAAVpa+PNWkUh9UaUjIWPeSar8UEnaHGRSWsp9qln1fMpjvDYr873
	E3aV42V9OFdVpCpEwy6esqsUeh1H
X-Google-Smtp-Source: APXvYqzH7QdvG6gG15b3kQWdoOVViye9xchAvPcPVdN5TfRqHS+OsZtfRy8sIUexNDEIlUNaTen4Fg==
X-Received: by 2002:adf:dc4b:: with SMTP id m11mr701370wrj.344.1575880599896; 
	Mon, 09 Dec 2019 00:36:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F05A251D39764436B44384E.dip0.t-ipconnect.de.
	[2003:f0:7f05:a251:d397:6443:6b44:384e])
	by smtp.gmail.com with ESMTPSA id
	e18sm29450149wrw.70.2019.12.09.00.36.39
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 09 Dec 2019 00:36:39 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon,  9 Dec 2019 09:36:09 +0100
Message-Id: <20191209083612.23922-18-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191209083612.23922-1-schnitzeltony@gmail.com>
References: <20191209083612.23922-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH][v3 17/20] yelp: add x11 to required distro features
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
X-List-Received-Date: Mon, 09 Dec 2019 08:36:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
index f6311965e..348727e44 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp_3.34.0.bb
@@ -4,7 +4,10 @@ LIC_FILES_CHKSUM = " \
     file://COPYING;md5=6e1b9cb787e76d7e6946887a65caa754 \
 "
 
-inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc
+inherit gnomebase itstool autotools-brokensep gsettings gettext gtk-doc features_check
+
+# for webkitgtk
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI[archive.md5sum] = "776e29bd16424c8712cbf340cfe6429b"
 SRC_URI[archive.sha256sum] = "e3d6527c5963d73206891b32f1f23363164be57de248555513bd0be77a7bd045"
-- 
2.21.0


