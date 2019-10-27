Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id 327447FA80
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:00 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id w18so8005739wrt.3
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=RXeeBQRSedm5XLD2hd13Nwa5TkP1/oJJw+YNEqLmruo=;
	b=bsQO8zvJ8i/SiAHktVAPSVXq2mljPLLpeSRuBHiRIGh37O/DUM+/oNP/eL1oSnltsp
	Gb06jqr35V7jo/oNdVXi/YGP5kPQC55ef5u4INMaQ+OF9u48gh9Vl7DrC6+jfdeDX0sg
	MoqbkAoO7UrbvSUo9vStVgubMDsrGOCol5ndcum0V5PiMadUDj+gUXOjP8q75DKGwH1O
	B+EsBlqcijqbEPe7h6wAyvFFlfBXtQdIrfsbF4+Ga/EAHuseFA1IYrvUWlp3V1gsWHfD
	NTVLWIjvBpnRqcazgh6QXq0zRBqZQZusDpCPHRoYKpmknjj3EKFYf0xYEz4QqkPxx2JZ
	PG6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=RXeeBQRSedm5XLD2hd13Nwa5TkP1/oJJw+YNEqLmruo=;
	b=PHFJpf7kQPi9mbd0EDhF7vH9KYyvSMLMGQsXkVG378L2iSfLQmOWWSbzr1t4j6Nj6w
	2DTbyZNJZ2nKO75LVaV+S1ASO6JKtL9zUSXkDBZZScj9v2rXWaJrqWL2Vr3HMuiBg0I7
	iazCbHTt2bUwjm9E03P3I844oBK4NHpK7C0uMWGzGakBfAhYAgtADSXD9f+i+4Lrnfy2
	NMla8qtz5ZxxgoYgprmkZYAukqdmQgKgRy4qo7H+1oDO3gMdHIlVgHsFLcGJvuQYsUdb
	LxkJe4BxRvxBfMXV3ifv8th6mmQANyRl9gFJV57zROCEsrmZcs61Rx08HccNB11o7mY9
	e2AA==
X-Gm-Message-State: APjAAAU4063UnOWWRywUgp46OHSJDTQt7my0DlenBnuunKKVBOyxiPLm
	5FWSNqDlPjccXqNCNXCc9Rbrst5o
X-Google-Smtp-Source: APXvYqyU8Ms5MKlKHoMEgHqEuucxBAbiYCzqttmvSb28rk0x0QqEfUoVdhzHD6PouyZu+1M22wtV2w==
X-Received: by 2002:adf:ef0a:: with SMTP id e10mr12200259wro.234.1572219360619;
	Sun, 27 Oct 2019 16:36:00 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.35.59
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:35:59 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:29 +0100
Message-Id: <20191027233545.4146-4-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 03/19] yelp-xsl: use itstool.bbclass
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
index 17994414e..20052cf16 100644
--- a/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
+++ b/meta-gnome/recipes-gnome/yelp/yelp-xsl_3.34.0.bb
@@ -6,13 +6,16 @@ LIC_FILES_CHKSUM = " \
     file://COPYING.LGPL;md5=a6f89e2100d9b6cdffcea4f398e37343 \
 "
 
-inherit gnomebase gettext
+inherit gnomebase gettext itstool
 
-DEPENDS += "libxml2 itstool-native"
+DEPENDS += "libxml2"
 
 SRC_URI[archive.md5sum] = "f8c4e777aee8b055251c333ef48a0cd0"
 SRC_URI[archive.sha256sum] = "e8063aee67d1df634f3d062f1c28130b2dabb3c0c66396b1af90388f34e14ee2"
 
-RDEPENDS_${PN} += "libxml2 itstool"
+RDEPENDS_${PN}_append_class-target = " libxml2 itstool"
+
+# ensure our native consumers are forced to inherit itstool
+RDEPENDS_${PN}_append_class-native = " libxml2"
 
 BBCLASSEXTEND = "native"
-- 
2.21.0


