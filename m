Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
	[209.85.221.43])
	by mail.openembedded.org (Postfix) with ESMTP id 6B3C87FA8E
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 23:36:07 +0000 (UTC)
Received: by mail-wr1-f43.google.com with SMTP id s1so8017492wro.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 27 Oct 2019 16:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references:mime-version
	:content-transfer-encoding;
	bh=+XIKeVT6ZJhodQBTY2biePbMKO/Q0rRJc2HhWz7/rnY=;
	b=Cncup9UZ5yAPA7v09Ak6NLXDHv4Mug1wrhrIFapE87JyFu24M2AD9BIEoRqiuuNwjp
	8pBLEJT/04/kFSujhOI7p0zem1uwD97mGs+DacnXvu4/0tz6XdHFbScW3powSwoTGwWj
	65sIRKnMni2Iuy9Zlzemn3sbnxW7GpOSGjxRMQwPziCREL1yqFl7rPAZVXMzTkVyF+cU
	/zLCfxi0GGXmefSHGpgdDbnoU7rX6y6eptEA2B2ve0+D1s9oDpCSuR6xdjmPnM7pR3Rs
	3bZbzCDD1DCpN9OfM4cb2V99d3XVfEAyV0UMuY44bf03FnFxI5tEvFhglmKLogcufDmp
	S/DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=+XIKeVT6ZJhodQBTY2biePbMKO/Q0rRJc2HhWz7/rnY=;
	b=rpJjQZPm7a6O4NrMm07qV4xFyfe1qKGvlYebGkCJd6UKisZfaTjWxayZYbWjwg5dzr
	SROF/n1G8bXEIG5dDUEZxHqQaipbPxSGjtjGbPBL77Gf21UarpHn3ivAB0yDNzwO4XJX
	o+ysMvuX+b2l6aFfmZt5o7xgie1l7Cku1N0Hm+FYB5c/aXDvd3YzRNGMp07INeuhTDhZ
	8ns4xkZ3NyillWXO21KC8iVx3ZYtnU/86yF0YZ8K5USdJKr52zYbEKfjcszJPip0vpO7
	zZJpNu/BLsZtkZoLAjsAYg7LZf8R11C8E7QlR5OJl/q5SHN+3/dFW5Y7MNeZkSnHBiyw
	GcOA==
X-Gm-Message-State: APjAAAVFRaIE3SDGjNHkWP8xxVIW9kRP1rdnm/fpgVvv6ZBRWZTMazy7
	jiyXbUGK0zn+pqIlWQXn/Cf9SP+6
X-Google-Smtp-Source: APXvYqwZfcusHplSmjnDxrryJoFCEpyK/JPtKGNLyl2l1H+8bxo3+wPDgRVKSnDh3uiwaLJBiMp0gw==
X-Received: by 2002:a5d:5446:: with SMTP id w6mr12288062wrv.350.1572219367284; 
	Sun, 27 Oct 2019 16:36:07 -0700 (PDT)
Received: from superandy.speedport.ip
	(p200300F07F320614DE89D4DE1A96B15C.dip0.t-ipconnect.de.
	[2003:f0:7f32:614:de89:d4de:1a96:b15c])
	by smtp.gmail.com with ESMTPSA id a17sm8699929wmb.8.2019.10.27.16.36.06
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 27 Oct 2019 16:36:06 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 28 Oct 2019 00:35:35 +0100
Message-Id: <20191027233545.4146-10-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20191027233545.4146-1-schnitzeltony@gmail.com>
References: <20191027233545.4146-1-schnitzeltony@gmail.com>
MIME-Version: 1.0
Subject: [PATCH 09/19] dconf: extend to native build for upcoming gdm
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
X-List-Received-Date: Sun, 27 Oct 2019 23:36:07 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
index ef549432e..3c3802f34 100644
--- a/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
+++ b/meta-gnome/recipes-gnome/dconf/dconf_0.34.0.bb
@@ -16,8 +16,12 @@ SRC_URI += "file://fix-meson-0.52.patch"
 
 # I/O error : Attempt to load network entity http://docbook.sourceforge.net/release/xsl/current/manpages/docbook.xsl
 EXTRA_OEMESON = "-Dman=false"
+# no bash-completion for native
+EXTRA_OEMESON_append_class-native = "-Dbash_completion=false"
 
 FILES_${PN} += " \
     ${datadir}/dbus-1 \
     ${libdir}/gio/modules/*.so \
 "
+
+BBCLASSEXTEND = "native"
-- 
2.21.0


