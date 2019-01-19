Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com
	[209.85.221.41])
	by mail.openembedded.org (Postfix) with ESMTP id 436E27C21D
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 12:22:44 +0000 (UTC)
Received: by mail-wr1-f41.google.com with SMTP id s12so18171966wrt.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jan 2019 04:22:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=Fm8/pyB7EnxIGox1pSYNKhs1qWUQMkkHcLJIXTD3Xc0=;
	b=qiTTpg0X/EgfeFrNSirU3k3a5vv6dEBekSKMNZuJlrquT+68auNSFyWrHFk2eOWlXj
	ktbdNQ6GrOdBYrUcBfAFKoGlKMjOuZB/QxnqsnE0xWxsChu0qQek4tzG4A3o4B+AJx0F
	C8F8MsZOEaMtLTqxzqYM4tBelmHvurI9ZTpmxBKmNFmblLwWYVKPbSzodpqUriHZJC86
	/zsiWBzvOA0it5s/qf5Sm41J/erUx9uAUs605ftq0t4OaTWgFCqVsw6e3EB+Coanf5Se
	2aveRsidBn2ATr+IlLArRE6SmpcTqtwuejAGBc9bD/+q/VIo8aT+fbs7NT593U6I7cVA
	moJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=Fm8/pyB7EnxIGox1pSYNKhs1qWUQMkkHcLJIXTD3Xc0=;
	b=AMFBuk0PS4NA0XktKtwD/48Ymsy+e7YXUebgdtzge2zOAUYGR10Q+T693Oip8KuLia
	kfGvN98zhPl0RGhEwU1mvWDPClt+Af8LSxX9DHaiNdti9GehA32o9UNTwVbUOg3egXlD
	Z5rCqbf7359jCIRLxRkQo593ZegCA6347O8B+cnULqXTgAZjdOEmaCybBApc5OCZ2XfN
	2pSG757iIADuCa1ydY6cKEZf9TJnZIB7DddM79zSZJ9lJxG63KNdljEXTAC1e7fjIpmH
	wrjvLStu+NvtoT22kjUQC8cIbvMmoKPCBQIIgETT4EkhSvZuPH0yr3jd2YAgQfdQnytM
	TMqg==
X-Gm-Message-State: AJcUukfhV2zTCl6+bATdnHrJ1uNcSnv5AKPcaxziZxWvOWSYk/tZE1it
	6EqFkXYBd6wf3dR3XQ8B0SNx9JMV
X-Google-Smtp-Source: ALg8bN78w9tq+oP4Si4+IDp3lN1iyGmA8aHEbcPMY86B4qGuLVuzZxxjgnAp6LzdpzPVT4mcg8xeMA==
X-Received: by 2002:a05:6000:10d1:: with SMTP id
	b17mr20284578wrx.306.1547900565399; 
	Sat, 19 Jan 2019 04:22:45 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F1BE998930CD041FFEA0CD4.dip0.t-ipconnect.de.
	[2003:f0:7f1b:e998:930c:d041:ffea:cd4])
	by smtp.gmail.com with ESMTPSA id
	v6sm52697393wrd.88.2019.01.19.04.22.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Sat, 19 Jan 2019 04:22:44 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 19 Jan 2019 13:22:33 +0100
Message-Id: <20190119122233.5388-3-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190119122233.5388-1-schnitzeltony@gmail.com>
References: <20190119122233.5388-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] atkmm: upgrade 2.24.2 -> 2.28.0
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
X-List-Received-Date: Sat, 19 Jan 2019 12:22:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 .../recipes-gnome/atk/{atkmm_2.24.2.bb => atkmm_2.28.0.bb}    | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-gnome/atk/{atkmm_2.24.2.bb => atkmm_2.28.0.bb} (74%)

diff --git a/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
similarity index 74%
rename from meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
rename to meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
index 307774b37..63f4f09ba 100644
--- a/meta-oe/recipes-gnome/atk/atkmm_2.24.2.bb
+++ b/meta-oe/recipes-gnome/atk/atkmm_2.28.0.bb
@@ -11,8 +11,8 @@ inherit distro_features_check gnome autotools pkgconfig
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI[archive.md5sum] = "d53b60b0f1be597e86070954a49cf0c3"
-SRC_URI[archive.sha256sum] = "ff95385759e2af23828d4056356f25376cfabc41e690ac1df055371537e458bd"
+SRC_URI[archive.md5sum] = "6194ac577f15567adfa3c923944c6651"
+SRC_URI[archive.sha256sum] = "4c4cfc917fd42d3879ce997b463428d6982affa0fb660cafcc0bc2d9afcedd3a"
 
 EXTRA_OECONF = " --disable-documentation "
 
-- 
2.20.1


