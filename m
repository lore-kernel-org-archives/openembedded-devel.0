Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f68.google.com (mail-wm0-f68.google.com [74.125.82.68])
	by mail.openembedded.org (Postfix) with ESMTP id 3367478448
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 19:21:59 +0000 (UTC)
Received: by mail-wm0-f68.google.com with SMTP id j5-v6so5027467wme.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 May 2018 12:22:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=UEbIWgJjBuJahL80PklKh/9tUqlZMu16xCecD3Vmf3I=;
	b=XN4rdw5OfwVpEaJlQv/u9qJBKpYu69QdohhxogOIokdvdSJRlsMuI6q3AsCajQMwCP
	f2RclhQAZDQOB7wzZOzEDsoiYH2F07ko3/9PmlDdxj48eu8xml72KXgH91l9GY+VtH0t
	tXRIX4Cn1BqwCdTGesjFM6NeKYQAjNzUdIPLdU4mbgEpzCIqZFZPC6xilTTe+GZ+h4Zn
	lHw0OjyZGsSWQ0Wgl2QGqBiR0kWleqP8CWuXpbGtH2RYpfcK5qI4oo6/SJrEuiL+iySQ
	TG9VvDJn9vAMRJJHqkrAMS7iySn+KfaLk9zu8hf7MIRy5/TvH2Gj2SYDOy9AwRDF5DWf
	o5Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=UEbIWgJjBuJahL80PklKh/9tUqlZMu16xCecD3Vmf3I=;
	b=MVkl4eprfSTGlYFu+r6TqYZ6BwlN3tiH405tcrOnTUecDGu1wu16Ob+aXz7iKhSrgm
	/imgjtIAAXhNTExpSznTnuDSwiIxWOd77/GGIIfasQ6AkQbhnazB+nX8Py78bfG6viBO
	zlXleb9k1GYE+MMNDQ/inh2eo6DXkswiBq7iFv7Dsmf1l6xsgzrHAkBPfok+UkUTNhsp
	MOphICOluT62BfrWYZ4L2/fOUuOg0hn+n3AEtWbXmTzD+FSg12p9kgPXMRUZuNmoAevo
	ZW1Ce6iFKSVdZvnt8OUpNBy77/UZ12u8L7B8ezYzfffEqD9OfI0QQPsBn1oYroh5yug7
	ZR0g==
X-Gm-Message-State: ALKqPwe9gmbrCekYLZfssVXsVaGAicjFVBiYTlWNPJ72BS5OT/9iWOoI
	oNdTZNC6m4yuKF4YhQIH7j4vHA==
X-Google-Smtp-Source: AB8JxZoLW1heEsL6qlX5UHYE19dhLOXJHM/EFJwaV6jvv1+8l/zrL8cnbzw4Bo9fh69/10x8qq//8Q==
X-Received: by 2002:a1c:1f47:: with SMTP id f68-v6mr2486640wmf.4.1526066520418;
	Fri, 11 May 2018 12:22:00 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	69-v6sm3772013wmi.29.2018.05.11.12.21.59
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 11 May 2018 12:21:59 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 11 May 2018 19:21:44 +0000
Message-Id: <20180511192145.7811-8-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180511192145.7811-1-Martin.Jansa@gmail.com>
References: <20180511192145.7811-1-Martin.Jansa@gmail.com>
Subject: [meta-networking][PATCH 8/9] spice: fix nativesdk build with security-flags included
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
X-List-Received-Date: Fri, 11 May 2018 19:22:00 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-networking/recipes-support/spice/spice_git.bb | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/meta-networking/recipes-support/spice/spice_git.bb b/meta-networking/recipes-support/spice/spice_git.bb
index 1b65d6fd72..257159f374 100644
--- a/meta-networking/recipes-support/spice/spice_git.bb
+++ b/meta-networking/recipes-support/spice/spice_git.bb
@@ -35,6 +35,10 @@ inherit autotools gettext pythonnative python-dir pkgconfig
 DEPENDS += "spice-protocol jpeg pixman alsa-lib glib-2.0 python-pyparsing-native python-six-native glib-2.0-native"
 DEPENDS_append_class-nativesdk = "nativesdk-openssl"
 
+# Otherwise nativesdk-spice fails like this:
+# http://errors.yoctoproject.org/Errors/Details/164866/
+LDFLAGS_append_class-nativesdk = " -lssp"
+
 export PYTHON="${STAGING_BINDIR_NATIVE}/python-native/python"
 export PYTHONPATH="${PKG_CONFIG_SYSROOT_DIR}${libdir}/python2.7/site-packages"
 
-- 
2.17.0


