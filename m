Return-Path: <akuster808@gmail.com>
Received: from mail-wm1-f65.google.com (mail-wm1-f65.google.com
	[209.85.128.65])
	by mail.openembedded.org (Postfix) with ESMTP id A665F60191
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 15:46:39 +0000 (UTC)
Received: by mail-wm1-f65.google.com with SMTP id 143-v6so10769199wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2018 08:46:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id;
	bh=mc31L9OWFi+aL4n44Rcc+hdYfbmDFV7juhhIv/yqhL4=;
	b=dkMb+cf6lCzBfXcmtq99/n52Gs3kV432sFxZr71iLfhgMLVZ0dFggQheY9tb5Lea7e
	cv2yWLm3dPdZkdfYUyaC27GhWDtOG/NpNJ0TsdWlYOPOZaI9WvMwmLXqG6JEdBQfTVk4
	WByqhTTaLMTD+3kIh9DguAQmjTNKo3pkRZ7et07lei1V+Qf/1bVdePQfMKRwSOZDY3pW
	DPSWOmLoD5pf3uHdRarmZYOskVbZWkVtDW9DplHSLx8WHp0HQPiYKz5axYPIwrNR3d0R
	sjgl3XghAotzd4GZDudNUvgyUDAI14ISt8gFCzOxzxRd1Ly4IlU2jD5UzjzhzhBECI+F
	xl3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=mc31L9OWFi+aL4n44Rcc+hdYfbmDFV7juhhIv/yqhL4=;
	b=i/j8tpOpMHGrhWsfHAr5Lu+B6E0cEkA2S4CAfn+gYBX6R1DENuIngjUgUyFQUJfdGC
	a/uYSGwe7/x+TRp5TApI6KgHwAWrlxX4Hy0SZKaSRQT0JYjYimq9b2rNMyY9sbfbK6G1
	yPwgE7KuiMRHd1CRohvxlWelOEjgR40i2d+wiLz+oQ5Xs2t3Tf614/VLl6WigLEKnK3J
	EXMou3bXgDsGmOJpC7JJZ/uVaHBRqcYHuoYNMIcKZo1Vq7c585UtpX7mH7vZNAWPcn39
	P0vSO12bMJR3dJgbXKgx6KXvSJGwpL3gzX9eup+QmruktinJ9oPrdHpuDxx3S34JOatm
	MuBg==
X-Gm-Message-State: ABuFfoj8d3HkTG5BeQf4MQYAWvSZrMjKADJ8mP/fB8kTRvm9KlMTs1X4
	5YJzlBV0jaevmGo4bUAJw4jfzEduP08=
X-Google-Smtp-Source: ACcGV619Xhf7pb0PH5/atMbZfVukQvssAJzTVBNgqKya7YWDQ6SMTHmH+2fuGzaUhWc9mrKwEmAo0A==
X-Received: by 2002:a1c:7c16:: with SMTP id
	x22-v6mr15915605wmc.16.1540223199891; 
	Mon, 22 Oct 2018 08:46:39 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.event.pylonone.net ([185.7.230.214])
	by smtp.gmail.com with ESMTPSA id
	o201-v6sm20950634wmg.16.2018.10.22.08.46.38
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 22 Oct 2018 08:46:39 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 22 Oct 2018 16:46:36 +0100
Message-Id: <1540223197-8004-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH 1/2] blueman: add x11 to REQUIRED_DISTRO_FEATURES
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
X-List-Received-Date: Mon, 22 Oct 2018 15:46:40 -0000

Nothing RPROVIDES 'thunar'

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-connectivity/blueman/blueman_git.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-networking/recipes-connectivity/blueman/blueman_git.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
index 947db78..8eb99ed 100644
--- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
+++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
@@ -4,7 +4,8 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=d32239bcb673463ab874e80d47fae504"
 
 DEPENDS = "bluez5 python3-pygobject python3-cython-native python3-setuptools-native intltool-native"
 
-inherit autotools systemd gsettings python3native gtk-icon-cache
+inherit autotools systemd gsettings python3native gtk-icon-cache distro_features_check
+REQUIRED_DISTRO_FEATURES = "x11"
 
 SRC_URI = " \
     git://github.com/blueman-project/blueman.git \
-- 
2.7.4


