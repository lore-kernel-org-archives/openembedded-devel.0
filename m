Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id E63A578260
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 12:07:44 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id u23so7628736wma.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jun 2017 05:07:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=wxzE/9oDKz2hgLg12UptTzMuNMZHCez+LvJI1V6IWFk=;
	b=XbQ4FgSCqCgMoADY4dRNBcivQ6Dg1hLlmTl91VBEZHZiBW27aHsQPQuC7ImRSDUoE9
	iqVeVvz4YwGikH4SLqb963hzb4csbt9gu7CYZ3aItothtR4zK+xCjZTFuKnuCEw3nAHh
	2PUwD9LUVIk3G7yM5tc1yg/WONxMLkXn3mXD4AnLdNLev+eE5Afc1goep8jCwZJL5+/j
	hC1rGa8TgJsUD9Os5rCEph129ROsvoUm88SmXLrn4S1a//68KC5i7E8rtfXbTPQdmIAo
	5HpmMr3REbJiTWeegfjKYA7i5RQ8T0YVnMohYJnHBW7VA2XN65EXIQzezlzhwdxklwwj
	L2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=wxzE/9oDKz2hgLg12UptTzMuNMZHCez+LvJI1V6IWFk=;
	b=HBE/HJAvn1w3t027SkGltlOYBX3tJlTGEZ3l/ewoq8Wm/B+V43OnZnS0JECeu+fYkd
	sv2/3xagl35Nya6PLYM+JxPwkOeNRUXmXPliAP9HbfB6M0WEd0GUUcFNRu9AzbJLOrLt
	4WGX6BC2CMO4v8kw3UIzC3B0AtbVRtOA308jUG/2S0sQkUhyJvBlgTvvml6qmtiR8z4+
	74VVEA89cBWBWa9BzJpYAuyAFnygmHhTTrWM2kDgz6aAhHHBPDOCoY8wQrrrusFNh6iI
	ij8gs5dmRqhrsOzHrU1KcnqPBv3tvbk7VsceklUkxs3YcY+dnNGqey30/dKlniixSEVO
	6tDQ==
X-Gm-Message-State: AKS2vOw+e5xxNwiEZ4ML0oIPrYL6BdMms/c3WF45mB2zlLsWfP2NJf1y
	SA6q+uRkCl7vBKwl
X-Received: by 10.28.232.29 with SMTP id f29mr5080759wmh.55.1498824465123;
	Fri, 30 Jun 2017 05:07:45 -0700 (PDT)
Received: from mueller-a-nb-linux.zera.local
	(ip-109-91-251-134.hsi12.unitymediagroup.de. [109.91.251.134])
	by smtp.googlemail.com with ESMTPSA id
	d91sm14159496wma.7.2017.06.30.05.07.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 30 Jun 2017 05:07:44 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 30 Jun 2017 14:07:31 +0200
Message-Id: <20170630120731.3745-4-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.9.4
In-Reply-To: <20170630120731.3745-1-schnitzeltony@googlemail.com>
References: <20170630120731.3745-1-schnitzeltony@googlemail.com>
MIME-Version: 1.0
Subject: [PATCH 3/3] gimp: update 2.8.20 to 2.8.22
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
X-List-Received-Date: Fri, 30 Jun 2017 12:07:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com>
---
 meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb => gimp_2.8.22.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-oe/recipes-graphics/gimp/{gimp_2.8.20.bb => gimp_2.8.22.bb} (89%)

diff --git a/meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
similarity index 89%
rename from meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb
rename to meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
index 9588ab0..68febca 100644
--- a/meta-oe/recipes-graphics/gimp/gimp_2.8.20.bb
+++ b/meta-oe/recipes-graphics/gimp/gimp_2.8.22.bb
@@ -32,8 +32,8 @@ SRC_URI = " \
     file://0001-configure-ac-do-not-check-for-freetype-config.patch \
     file://bump_Babl-GEGL_versions.patch \
 "
-SRC_URI[md5sum] = "d405640c426b234d6efc36fb4f5bae57"
-SRC_URI[sha256sum] = "939ca1df70be865c672ffd654f4e20f188121d01601c5c90237214101533c805"
+SRC_URI[md5sum] = "7e4fd7a53b1d3c32dff642ab1a94b44d"
+SRC_URI[sha256sum] = "9187a35cc52b110d78124d7b27b68a68ade14a794c2721314bac6134d2a5638a"
 
 EXTRA_OECONF = "--disable-python \
                 --without-webkit \
-- 
2.9.4


