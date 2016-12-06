Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-wj0-f194.google.com (mail-wj0-f194.google.com
	[209.85.210.194])
	by mail.openembedded.org (Postfix) with ESMTP id DCEB271AE2
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  6 Dec 2016 22:41:02 +0000 (UTC)
Received: by mail-wj0-f194.google.com with SMTP id kp2so46602191wjc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Dec 2016 14:41:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KvrOQgFbSoZPuN2wbS2izr8xooHuQBGLD46dY5k2HkM=;
	b=E/OtSNOgAZEu0nonU/vY6erwq0XBV1RfKuNjkEQOJ1tXvGY9jqo624pe7LnhlfLq9G
	fDIosKQpirh+6ZNPIXnSg2o771oF4GySnNQy0hYA/+butpUuxeiXVves9Bob0QFHH+pk
	AT+45h5VM+ZqhlcMI+VOWz7e39x5VraBBVbYMYOF4hmdxgms7by/JgFp6VmOqtUdReYA
	S+IjrOUL+qZ3yPg20tchq/I6Lc1axDtEBesPvNL0Dr6aSAt14li0aqjbf4WiD8UBVIRl
	JAPy/AqixD0nSIFWWf9nWSNqvi/Tdz0DqrBeH7nXzZiCP6hqp01b18jQQ9vQQ+T3e/LJ
	RyFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KvrOQgFbSoZPuN2wbS2izr8xooHuQBGLD46dY5k2HkM=;
	b=e5TfBQKFyKtfJ/cXIKmK64nij1o5FowIJy7B8Ixo6saZYx13xapSL0AxGRm3sEiO94
	+dl+iRWCMn0QWNEYr9EEdQqTSYn/uD1h5Pj1pi0CpCU2gnwlPn69AjA3DFIwZy/aey+2
	ap4Y4BjX7r4KHcc1U95w16om5TiGt6FQhxDOkEewTkXUiU12G21SZoJceOfRnnEnOcml
	9/wmtn5GtEwSDFlrR10yosXTLQ4CsNI528HqLlUGjSXktlmLB4bbQ7eaPb+fF+i20Zth
	d0cMZX/wYgHUBxOhPBjyJ1yN3kYSACDLmE3Wm2ok8sTUCKkNTiL7+jVQZqGErWIrC36v
	GrYw==
X-Gm-Message-State: AKaTC01n177Om0fRa+2JorPfAHQ/kErpJW7bwmsrEUB+znK3HPnFeX7TmlxfXVujN17lCA==
X-Received: by 10.194.171.104 with SMTP id at8mr56974164wjc.159.1481064063147; 
	Tue, 06 Dec 2016 14:41:03 -0800 (PST)
Received: from localhost.localdomain (p579CEAA5.dip0.t-ipconnect.de.
	[87.156.234.165]) by smtp.googlemail.com with ESMTPSA id
	j6sm28060674wjk.25.2016.12.06.14.41.02
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 06 Dec 2016 14:41:02 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  6 Dec 2016 23:40:39 +0100
Message-Id: <1481064044-26249-1-git-send-email-schnitzeltony@googlemail.com>
X-Mailer: git-send-email 2.5.5
MIME-Version: 1.0
Subject: [PATCH 0/5] here and there
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
X-List-Received-Date: Tue, 06 Dec 2016 22:41:03 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

0001-exo-update-to-0.11.2.patch is a V2
0002-gnome-menus3-add-gnome-common-native-to-DEPENDS.patch is a build fix

and others are 'exciting' updates

Andreas Müller (5):
  exo: update to 0.11.2
  gnome-menus3: add gnome-common-native to DEPENDS
  xfce4-notifyd: update 0.3.4
  xfce4-clipman-plugin: update to 1.4.1
  poppler: update to 0.49.0

 .../gnome-menus/gnome-menus3_3.10.1.bb             |  2 +-
 .../{poppler_0.48.0.bb => poppler_0.49.0.bb}       |  4 +--
 ...ce4-notifyd_0.3.3.bb => xfce4-notifyd_0.3.4.bb} |  4 +--
 ...ugin_1.4.0.bb => xfce4-clipman-plugin_1.4.1.bb} |  4 +--
 ...e-fix-for-Thunar-detailed-view-Xfce-12916.patch | 36 ----------------------
 .../exo/{exo_0.11.1.bb => exo_0.11.2.bb}           |  5 ++-
 6 files changed, 9 insertions(+), 46 deletions(-)
 rename meta-oe/recipes-support/poppler/{poppler_0.48.0.bb => poppler_0.49.0.bb} (93%)
 rename meta-xfce/recipes-apps/xfce4-notifyd/{xfce4-notifyd_0.3.3.bb => xfce4-notifyd_0.3.4.bb} (78%)
 rename meta-xfce/recipes-panel-plugins/clipman/{xfce4-clipman-plugin_1.4.0.bb => xfce4-clipman-plugin_1.4.1.bb} (76%)
 delete mode 100644 meta-xfce/recipes-xfce/exo/exo/0001-Probable-fix-for-Thunar-detailed-view-Xfce-12916.patch
 rename meta-xfce/recipes-xfce/exo/{exo_0.11.1.bb => exo_0.11.2.bb} (83%)

-- 
2.5.5


