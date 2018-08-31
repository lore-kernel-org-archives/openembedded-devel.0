Return-Path: <ross.burton@intel.com>
Received: from mail-wm0-f52.google.com (mail-wm0-f52.google.com [74.125.82.52])
	by mail.openembedded.org (Postfix) with ESMTP id 88F2B79567
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 13:39:05 +0000 (UTC)
Received: by mail-wm0-f52.google.com with SMTP id c14-v6so5292754wmb.4
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 06:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=mx5cty9LOU6jWpeC75P7WHu/wAYMWaWVYEaA08k+QVw=;
	b=BZ5+X1yBKBytG5D6vgo8Mp9gC1GsG4PcGqHdY3YwQQvxeAgyfj5V06uf8dGfjsvsbS
	9kzDFRIhd6x5rHfCeJBh0EEeTmaTu0rVHrELbf0bIOGjAIYUbGP8cf6h/WI28fnw9BR/
	aaplOLx3MAQ7ETG6nELmVxkiEZ3XCg3KyA7EfaryB2revqLdafnQOzWCZr7z8/RhO/FB
	ilsZRgfwDAXuh5a/eaXeVij21Urck7weXTGEiahr9qYvp3bA+BrbD1akmb3KZmn0yTsD
	HotQ2p0UlSXCt4iXNGOk9fAiJ1HuNWRuvxiwZhxxdmLUDqAIcx2a4XXvNNWgdgLYWRwM
	nX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=mx5cty9LOU6jWpeC75P7WHu/wAYMWaWVYEaA08k+QVw=;
	b=qKCQGblMIZorSzA+h3CEeGhLtpV0vaF3xsTJjpUEc9fLh1YDzIGUiWPt3ZFsDSVBge
	SPuY8HpV9c/gtMsFZNjSu/GboZq6Ko0Jvbhz2emOkDW+fbi0a9RiN4P7dBKzczLEbgIw
	5R7+5S3mgwkcJK2c+kJ0LKjrDUxodtkFGsOIbT+ha94vyMF4pCFY9ooBbhr6u1DjavLA
	/eWlIPTk+BL2HvKdfE7SppdcnW49kIvr/tfIjzecDF6Y4j6t1yaQVfXvcbArDWmoH0hf
	87jAJzChL3HcRrkHepD+ad/xVNnwQAoSohdppeq7EzyLMjvP+11n9T+9sgoScmoltHRe
	B5Bg==
X-Gm-Message-State: APzg51BY+Lo3v9WIe900AyHlXDAGRNWTP5nyT7pp4ozxjy5SuKhagvQV
	8lV99e5Y+XRshQ85eavFmwKNPRIfFPU=
X-Google-Smtp-Source: ANB0Vdb8kddigrIvB0jpIErzusX7WRX/3b9qFD3fw21OV3Ddi9YrivQRHxdsaNmUbIZz+fQ7jqOhbw==
X-Received: by 2002:a1c:638a:: with SMTP id
	x132-v6mr4933135wmb.33.1535722745901; 
	Fri, 31 Aug 2018 06:39:05 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	q200-v6sm7718945wmd.2.2018.08.31.06.39.04
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 06:39:05 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 14:39:01 +0100
Message-Id: <20180831133901.18202-2-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20180831133901.18202-1-ross.burton@intel.com>
References: <20180831133901.18202-1-ross.burton@intel.com>
Subject: [PATCH 2/2] vlc: use fribidi not libfribidi
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
X-List-Received-Date: Fri, 31 Aug 2018 13:39:05 -0000

The recipe is called fribidi, so use that instead of the PROVIDE.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-multimedia/recipes-multimedia/vlc/vlc.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-multimedia/recipes-multimedia/vlc/vlc.inc b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
index 8e82b3bd33..f13c0ead6e 100644
--- a/meta-multimedia/recipes-multimedia/vlc/vlc.inc
+++ b/meta-multimedia/recipes-multimedia/vlc/vlc.inc
@@ -5,7 +5,7 @@ SECTION = "multimedia"
 LICENSE = "GPL-2.0"
 LIC_FILES_CHKSUM = "file://COPYING;md5=b234ee4d69f5fce4486a80fdaf4a4263"
 
-DEPENDS = "libfribidi libtool libgcrypt libgcrypt-native \
+DEPENDS = "fribidi libtool libgcrypt libgcrypt-native \
    dbus dbus-glib libxml2 gnutls \
    tremor faad2 ffmpeg flac fluidsynth alsa-lib \
    lua-native lua libidn \
-- 
2.11.0


