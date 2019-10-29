Return-Path: <luca.boccassi@gmail.com>
Received: from mail-wm1-f67.google.com (mail-wm1-f67.google.com
	[209.85.128.67])
	by mail.openembedded.org (Postfix) with ESMTP id 8A9E27F962
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 16:10:38 +0000 (UTC)
Received: by mail-wm1-f67.google.com with SMTP id g7so3203187wmk.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Oct 2019 09:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oX9xaNu2IgFTiUCE9uEBQrSc9eH3rqt8SMqbndDhzHQ=;
	b=HDkBkApWI4XkpuZ9z6jb839NCzSDJnJJUgWwUcC2rt/H5WLCkTW+UB4rRB5M82c8mJ
	F5PlRN5CyES6k1BJG9aSPVp0ofhT4PWjJJe03QIn/fBE7Y9oVFT8AzP+2ARArY84neUr
	rXFhY7W4OSC37rx3EdI1i1ihnvBbB1B9+KpbDBeFkrCqGGhfYByNwQYI/WRdo1lMWDVy
	o15VfL4fHdgUiBBELf52HAOpQ6o8HyHp4yk4np0NOnscSKVTBkYDIwN2b2y72hU7mkJ0
	B7IxsGIJCOWSg9iU0BqfFGQO8OMRTKrYkrwkjSfYYmL5rIvk7U0664WvUBmATMB6bBq4
	G9TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=oX9xaNu2IgFTiUCE9uEBQrSc9eH3rqt8SMqbndDhzHQ=;
	b=lHFUPEHynjAXEtJLZoqDH/OcSXlonkWb9HhJ/vY/ypUB3wZLlxXYdBU1o/8chLb1Rb
	jkxQEg9xZNDI4MbNSCIC8qttQoZMshDNHnxSncZOEyLqqwjbwYYqgXxPGWZGqVE6f5Mx
	oxOULHScohI/BrOJFQO022Gkpa7Y8U3yLgAcHfhYN3UN2YCsBDMPXax2bUd9hdpkU0ot
	H1NcUuRtbEQYufckyijjdarO7gqHVSmiBOnyCTSrwqp7dThxRCuMYUJqSm894eaA2ibn
	Gl67xiXhzXV6rAfRkiyJyBzOKuhzLCeXRH0575F0bhXSIOSF0cXhpGOX9yVD+kAO4XCR
	Wqqw==
X-Gm-Message-State: APjAAAWmDDMCFQvoFkyys4xTBTIhdMQWij7WsSFQMFYbEyzILiD5AHjp
	Tp77S5glbAldTH22Mvw2JjJL9E2c
X-Google-Smtp-Source: APXvYqxXJul4QuN4CbpvNK8euxo7xvHV+t7LBGXv21UevhNJziJI2wxoZW5B8z3jwsKI4hrArZ4flQ==
X-Received: by 2002:a05:600c:204e:: with SMTP id
	p14mr5095370wmg.1.1572365438816; 
	Tue, 29 Oct 2019 09:10:38 -0700 (PDT)
Received: from localhost ([88.98.246.218]) by smtp.gmail.com with ESMTPSA id
	j19sm20731557wre.0.2019.10.29.09.10.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Tue, 29 Oct 2019 09:10:37 -0700 (PDT)
From: luca.boccassi@gmail.com
To: openembedded-devel@lists.openembedded.org
Date: Tue, 29 Oct 2019 16:10:33 +0000
Message-Id: <20191029161033.4322-1-luca.boccassi@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [meta-oe][PATCH] dbus-broker: build with libaudit if selinux is enabled
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
X-List-Received-Date: Tue, 29 Oct 2019 16:10:38 -0000
Content-Transfer-Encoding: 8bit

From: Luca Boccassi <luca.boccassi@microsoft.com>

There is no DISTRO_FEATURE for audit, so most packages enable it
if selinux is enabled.

Signed-off-by: Luca Boccassi <luca.boccassi@microsoft.com>
---
 meta-oe/recipes-core/dbus/dbus-broker_21.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-core/dbus/dbus-broker_21.bb b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
index d2d051070..d639abb42 100644
--- a/meta-oe/recipes-core/dbus/dbus-broker_21.bb
+++ b/meta-oe/recipes-core/dbus/dbus-broker_21.bb
@@ -18,6 +18,7 @@ inherit meson pkgconfig systemd distro_features_check
 
 DEPENDS = "expat systemd"
 DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'libselinux', '', d)}"
+DEPENDS += " ${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'audit', '', d)}"
 
 REQUIRED_DISTRO_FEATURES = "systemd"
 
@@ -28,3 +29,4 @@ FILES_${PN} += "${systemd_user_unitdir}"
 FILES_${PN} += "${libdir}/systemd/catalog"
 
 EXTRA_OEMESON += " -Dselinux=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
+EXTRA_OEMESON += " -Daudit=${@bb.utils.contains('DISTRO_FEATURES', 'selinux', 'true', 'false', d)}"
-- 
2.20.1


