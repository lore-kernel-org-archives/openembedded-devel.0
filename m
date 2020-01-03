Return-Path: <akuster808@gmail.com>
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com
	[209.85.215.175])
	by mail.openembedded.org (Postfix) with ESMTP id 98E587F95D
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  3 Jan 2020 02:49:42 +0000 (UTC)
Received: by mail-pg1-f175.google.com with SMTP id l24so22801589pgk.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 02 Jan 2020 18:49:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=g0L4LKcqY0IeV1C4QeJKm8GbKbwTftmxFKxnzdI3rRE=;
	b=FZAII182UEqn1rlzL3Eti71jmlH6ZAz3SB5Gp7fsh09Cpj+X8eec6njKMRhGjLygv2
	J47Z9tgGTSNuwveL6ii8CGGdeODn7lEIAcDLdHvH17aJuoSUkwwh/4IN6UYU3zsyUPMJ
	CPBaVY1AGfEdIAZpIOv9ZFi2sCK1Sl2wtVbDiX8gLDTUqBZtmfBTFewR9eYVKH3HSaUs
	jlJx92+ItRVZKp3IPxBs5zTDjBJjK8dAuGd7gG+cqYGbqz24JA+xLXEUpK2np55Ry15o
	Ah+Lt7GEOARK8FpSOA8xF7hMwwz+uVrL6o2ErQDR1PUeyTzDMkgVJ8kWBhlbSiqvOa1F
	1WCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=g0L4LKcqY0IeV1C4QeJKm8GbKbwTftmxFKxnzdI3rRE=;
	b=bItBbmSA2G+a9kE6Tz2eVvHBb00U1dJOJAN3A2yUB91SFJ1YiiT3E6uwe/bIO5aEvx
	GVcFhasB/x0MaPT503NJVOWmkvBvPF94F0V4tIRkXqR0gkPDKmKCFE4ny05kCG7L/+h4
	9i2JczbejH3cMhGe6WQ1SMypGoR0l5Hngeh1ziKGFL2oWx9KjYtv98D3vzsxsd1Gry/f
	JSiFfobrdDQQYSkzISdY822w61XNS32b5qiH8tumb/VyKwbNws7aFhl5B+RKNQelSjiV
	7NcRl417rotBj2qZwdSQ7kPUydsQ2yeyIxdbtoJTUaYOs9jRQ+owvvz5KJ9c0ewOtA1M
	EnzA==
X-Gm-Message-State: APjAAAXfz1icqdXSSKJ3V1HlbK7Q2DmNSvRjGwbu4oIyBDqs2805PQbY
	0SrRd9kH1RyYwdYRKW/+NtXTw2rNfA4=
X-Google-Smtp-Source: APXvYqwUAjKzg4qftTb3YWjtvI94Rud+9l9qW6kqCiGFh+aHnNV0N5+RZw0iHdQCYX/oKLYLBGbFtw==
X-Received: by 2002:aa7:968d:: with SMTP id f13mr89675804pfk.67.1578019783489; 
	Thu, 02 Jan 2020 18:49:43 -0800 (PST)
Received: from akuster-ThinkPad-T460s.mvista.com
	([2601:202:4180:a5c0:555:ddff:6770:148b])
	by smtp.gmail.com with ESMTPSA id
	p5sm61306640pga.69.2020.01.02.18.49.42
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Thu, 02 Jan 2020 18:49:43 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  2 Jan 2020 18:49:11 -0800
Message-Id: <445495c7b4dcaf1913520d8ec58479e5cfa2e1c6.1578019547.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1578019547.git.akuster808@gmail.com>
References: <cover.1578019547.git.akuster808@gmail.com>
Subject: [zeus 14/17] networkmanager: do not deploy unnecessary udev rule file
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
X-List-Received-Date: Fri, 03 Jan 2020 02:49:42 -0000

From: Stefan Agner <stefan.agner@toradex.com>

The 84-nm-drivers.rules is not required for systemd-udevd versions
v210 and later. The file has been split into a separate file so
distributions with a new enough systemd version can drop it. See
also:
https://github.com/NetworkManager/NetworkManager/commit/1e0375826252abf9aab2aef273a2a24cd08c9f42

I noticed this while investigating into a warning show during
bootup:
  /usr/lib/udev/rules.d/84-nm-drivers.rules:10 Invalid value "/bin/sh -c
  'ethtool -i $1 | sed -n s/^driver:\ //p' -- $env{INTERFACE}" for PROGRAM
  (char 24: invalid substitution type), ignoring, but please fix it.

Signed-off-by: Stefan Agner <stefan.agner@toradex.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
(cherry picked from commit 82ecc0e69fe3920360d1ba8bd1b5e6ede164de42)
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../networkmanager/networkmanager_1.18.4.bb                  | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
index 085807c4ce9..27508c4d938 100644
--- a/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
+++ b/meta-networking/recipes-connectivity/networkmanager/networkmanager_1.18.4.bb
@@ -141,8 +141,11 @@ do_install_append() {
 
     rm -rf ${D}/run ${D}${localstatedir}/run
 
-    # For read-only filesystem, do not create links during bootup
     if ${@bb.utils.contains('DISTRO_FEATURES','systemd','true','false',d)}; then
+        # For read-only filesystem, do not create links during bootup
         ln -sf ../run/NetworkManager/resolv.conf ${D}${sysconfdir}/resolv-conf.NetworkManager
+
+        # systemd v210 and newer do not need this rule file
+        rm ${D}/${nonarch_base_libdir}/udev/rules.d/84-nm-drivers.rules
     fi
 }
-- 
2.17.1


