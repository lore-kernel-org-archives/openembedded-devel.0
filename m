Return-Path: <raj.khem@gmail.com>
Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com
	[209.85.215.170])
	by mail.openembedded.org (Postfix) with ESMTP id 6FFB17FCB6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Dec 2019 00:06:58 +0000 (UTC)
Received: by mail-pg1-f170.google.com with SMTP id l24so5744555pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Dec 2019 16:06:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ZWwP+Jy4vrhHtxndJWEZIsNNIVvvw2IdXuLrDdq32ss=;
	b=t5UdL6+pHWTYBKuUC9iFnUFW36mn5qGtxK/EsUSeJzg4uhiJ/8f1ZEM22JKvQXRyfL
	T7HMT+0OWMsZO/prqbJ6rLgXh3cytqlrjmcQmTHJE0FfdxebU88dedzBuzQTsY9ZG3ah
	HkUecLlq7miApFWsb9iF0XHVfNv4M48rprhHY94TDWOGjpQeKvnqECN8P0R5ykrv1xnF
	2ye6lnSIen5OoYSq+5Sb+Uut4pIlYVcmSc04xyG39luIT2plt7iYbqr2b+pTS8RWbtFj
	fIY1DoqwMqgJPtAVyVm7uWfsqxr72ag7EZs+o1v4yj3oD8paIrDPbvhtJQNtK4lL76Si
	SpUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ZWwP+Jy4vrhHtxndJWEZIsNNIVvvw2IdXuLrDdq32ss=;
	b=gcPEmmC5R1LzGlySF12QUEvlFZYimw8bBZzWE2k8k0/ZOsq7vnNSIV0zYjApTmBSw9
	T9erRAEnXRnMvlMNeUp/nAKlLcByghCLRuQBxunirXUV6jROHMd2AL4NSdtusBOc0/aC
	/2jvvrFm/IrSR0TDXybxzlbqFjxLz1ihv9x1bXr1HNp1GcSEUQ5VzGP+3BRjAff6AXj3
	T22khvb4L5US5HFt8JXMpN/WO/u/BcPSeX1RL0dvnMBuxNb4LWXySvZ8SCmJVThqLk1w
	oH2o8eG5m6AVkTj+NmCLbEhrpFqhuYNhZGMOt74hbT+MohGi2+AXzHfQ+9eYbmLQliTf
	DDug==
X-Gm-Message-State: APjAAAWL1HC6zwA/NHfdOv9Lne/xWi2W0x/hWZIEYxpL5Wqg0ldHO4On
	sWX7t6icq/QIDQfA55qpFktDDTxj6bw=
X-Google-Smtp-Source: APXvYqzxciH5HCAb82FGGwiuV5eckGDGVPZm3YEQTaQsTcfBm4SEA0Owr3RFFOT6aWqlwtIh7/6B8g==
X-Received: by 2002:a63:1204:: with SMTP id h4mr17369339pgl.288.1576886818991; 
	Fri, 20 Dec 2019 16:06:58 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9200:4e0::36e9])
	by smtp.gmail.com with ESMTPSA id
	d4sm11701624pjz.12.2019.12.20.16.06.58
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 20 Dec 2019 16:06:58 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Dec 2019 16:06:27 -0800
Message-Id: <20191221000635.1573390-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20191221000635.1573390-1-raj.khem@gmail.com>
References: <20191221000635.1573390-1-raj.khem@gmail.com>
MIME-Version: 1.0
Subject: [meta-multimedia][PATCH 15/23] rygel: Use nonarch_libdir for systemd units
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
X-List-Received-Date: Sat, 21 Dec 2019 00:06:58 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../recipes-connectivity/rygel/rygel_0.37.0.bb            | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
index 0adc721d8d..6ee02fcc04 100644
--- a/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
+++ b/meta-multimedia/recipes-connectivity/rygel/rygel_0.37.0.bb
@@ -37,10 +37,12 @@ do_install_append() {
        # Remove .la files for loadable modules
        rm -f ${D}/${libdir}/rygel-${LIBV}/engines/*.la
        rm -f ${D}/${libdir}/rygel-${LIBV}/plugins/*.la
-       if [ -e ${D}${libdir}/systemd/user/rygel.service ]; then
+       if [ -e ${D}${nonarch_libdir}/systemd/user/rygel.service ]; then
                mkdir -p ${D}${systemd_unitdir}/system
-               mv ${D}${libdir}/systemd/user/rygel.service ${D}${systemd_unitdir}/system
-               rmdir ${D}${libdir}/systemd/user ${D}${libdir}/systemd
+               mv ${D}${nonarch_libdir}/systemd/user/rygel.service ${D}${systemd_unitdir}/system
+               rmdir --ignore-fail-on-non-empty ${D}${nonarch_libdir}/systemd/user \
+               ${D}${nonarch_libdir}/systemd \
+               ${D}${nonarch_libdir}
        fi
 }
 
-- 
2.24.1


