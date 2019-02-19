Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com
	[209.85.221.42])
	by mail.openembedded.org (Postfix) with ESMTP id CB7377C9C9
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 22:23:30 +0000 (UTC)
Received: by mail-wr1-f42.google.com with SMTP id n2so11554971wrw.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Feb 2019 14:23:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=c+tNlGWk4iNz00o3IHPDjqnu11PE3ftZflDDwwLzLQw=;
	b=tmlB66ulmH0xWfpRNcGlQ2LxMnogagKcQjuDwtu31vUSplvFkFuxO5Tp/VlEeXzYLI
	B8bbvAtYe2jniy6B/bsAzuma+Nb5iGdh+ivRtpUC2gVL33KMfAb6drrE8CZ4f+yQbhjb
	eOE+8MKXFPBsD7CD/5ynGE+8Nym7bF6u9h3eAVJsDweZWWu62Dy2kiKj47DhLQsaFpxz
	KbHqMInjH3RnxAsMH4d+JrsVbq9WCWW+AEm8UWAED6A2J+rtK61qN6S4eRsjyV/NVLJD
	cdDSQ1p/EBwrUdPsMNy+JO8JMge1AO5qEzgDa0z1YrInTGN+8VynFnMH8bhgNPvI3NJM
	MBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=c+tNlGWk4iNz00o3IHPDjqnu11PE3ftZflDDwwLzLQw=;
	b=sSyqp8fh5zzklPDqdDpLj3NyufpsvH2WKo/uPQv0glT0DyUO6X8sgoBeLPdGTVEMrT
	NtZV44gVFqzZggRlmYIiLhkfMWKBBnCfu890UG5aMoT0lhSzKlUMkQs/CRSUfduNLsBE
	GSsucsIPyUMEtemB95o5Mi0Nx7fKEG95UdBE/8pIBjL53jDonusbmyYbmkud8zcFt/YU
	AH3Fv/i7CDap+YZX8s2SMXoNQB5+33JvR7tgsnphjXSGFbFlEIqeCHHPzVyqFxd7uHfu
	NKTOvUph2bmNWETNxSdlvgbp7K2+GkQYLdLZ3ZvA7ssAV60AYKsNCGFSZJkM0olUkTOl
	fW7w==
X-Gm-Message-State: AHQUAuYbgIo8BFH1i6ZnG6/v7xfFUWZS0CjZoGa+pjFjpD0l6tWi2Ie0
	vAWe+NYWK60ls/UA7YxF7K1xuxsl
X-Google-Smtp-Source: AHgI3IZHoIUTmNXXr/Tua2dgGyO62SQwdnM87l4zEYF02CA564ByKjAVw/KJrIOVPW301zPC2+bltA==
X-Received: by 2002:a5d:604d:: with SMTP id j13mr14788411wrt.194.1550615011286;
	Tue, 19 Feb 2019 14:23:31 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F065789FB9A06193E8AB1B8.dip0.t-ipconnect.de.
	[2003:f0:7f06:5789:fb9a:619:3e8a:b1b8])
	by smtp.gmail.com with ESMTPSA id
	d24sm55158896wrb.47.2019.02.19.14.23.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 19 Feb 2019 14:23:30 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Feb 2019 23:23:17 +0100
Message-Id: <20190219222319.21370-2-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190219222319.21370-1-schnitzeltony@gmail.com>
References: <20190219222319.21370-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 2/4] geany: upgrade 1.31 -> 1.34.1 and build with gtk+3
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
X-List-Received-Date: Tue, 19 Feb 2019 22:23:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../geany/{geany_1.31.bb => geany_1.34.1.bb}                | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)
 rename meta-oe/recipes-devtools/geany/{geany_1.31.bb => geany_1.34.1.bb} (64%)

diff --git a/meta-oe/recipes-devtools/geany/geany_1.31.bb b/meta-oe/recipes-devtools/geany/geany_1.34.1.bb
similarity index 64%
rename from meta-oe/recipes-devtools/geany/geany_1.31.bb
rename to meta-oe/recipes-devtools/geany/geany_1.34.1.bb
index bb9d8bc29..aab535d85 100644
--- a/meta-oe/recipes-devtools/geany/geany_1.31.bb
+++ b/meta-oe/recipes-devtools/geany/geany_1.34.1.bb
@@ -3,15 +3,15 @@ HOMEPAGE = "http://www.geany.org/"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=bd7b2c994af21d318bd2cd3b3f80c2d5"
 
-DEPENDS = "gtk+ libxml-parser-perl-native python3-docutils-native intltool-native"
+DEPENDS = "gtk+3 libxml-parser-perl-native python3-docutils-native intltool-native"
 
 inherit distro_features_check autotools pkgconfig perlnative pythonnative gettext
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = "http://download.geany.org/${BP}.tar.bz2"
-SRC_URI[md5sum] = "386000be6b26972c6a699939c37cda34"
-SRC_URI[sha256sum] = "30fdb906bb76c4251a8bcf83ee267db28c26ef6ab867668a782cec1164a3aba5"
+SRC_URI[md5sum] = "87220f4a0e03623ab9d86820f6be7b5d"
+SRC_URI[sha256sum] = "e765efd89e759defe3fd797d8a2052afbb4b23522efbcc72e3a72b7f1093ec11"
 
 FILES_${PN} += "${datadir}/icons"
 
-- 
2.20.1


