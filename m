Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
	[209.85.128.54])
	by mail.openembedded.org (Postfix) with ESMTP id 2F3867C54E
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  8 Feb 2019 07:24:39 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id b11so2330731wmj.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Feb 2019 23:24:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KozokEDgHVO7vZ9y3LiYt9dYp04YD6r2lfPIUGH2STg=;
	b=m6GhaVVYDsM8fMsy3lJ4wg0ZuiEXaGXHAKpLdQZkmxeNIIazc0y8dP9wfuxTlvm6ua
	7AQi71dQDaWmf0tlOSiAD08F87Sca0E2yKYTy+n0hHXCBWg5/f2N44+jficSiW/WAcHB
	WnD1rua9OX/SVRO0n+U4TwnSmqO1XYDiFJxRbvLpTX79AYg9FUXRJ+Bre6znaG5PQFy8
	sHXL6LaR2YqG5BN85ESyLh/pJ558lcsxQyppj0BJ7Nz8ehY9f9hnh73L0x74YIMTiyea
	v+FCPaFEPprqXhxllYZR9OPaAzi+H91mb68uqtRw/VDEQs/JgG701Ohdnp5Qnl6dr1kV
	PPAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=KozokEDgHVO7vZ9y3LiYt9dYp04YD6r2lfPIUGH2STg=;
	b=gbhPi9V7r5674c2MeCKCQ0yFR8VS/3RLqwkYS8uWcswyqv5Q/Idg61dLoJ0CY40PoC
	U2W4SID+a+GuMsUbn8eioLzSfGsCmpCqPjdaFFhHPxqPWXlMBnvg03+QsG5hWH0COr3M
	xNj6f7K9aA/7PED/0tZA3G+a4tMBLEm9uvwZtqUMxiuSglzkIRNr6EuAgrob5ig5HGRE
	yWwEtxlo+jvX2PC7TTRx3wWFRbzI8O6pnWQNDjM1ScDhNSJgnSgP8dm4RXfO8hjSmvYl
	Otu+7GdO3tNVnsjGtoVAaytpOkIJte0wkRhrjaPbA3/Qd81wN7mfwVkuu9LyuXaYVphW
	O8KA==
X-Gm-Message-State: AHQUAuY2xa99dizgo2tENfOrvUOPpRrnBAnc0R4x0aZGKtZ4anWEx+ov
	ueDvmdypKvwQ7+Hq0ID53aceDZud
X-Google-Smtp-Source: AHgI3IapnAZYnh6mGEYVbakmlRj6/of1Dhwv+e8ryclX4N4xwlTJ3f0/lvRX88N93jtaBl8IFPscgA==
X-Received: by 2002:a1c:2d08:: with SMTP id t8mr10812820wmt.5.1549610679173;
	Thu, 07 Feb 2019 23:24:39 -0800 (PST)
Received: from superandy.speedport.ip
	(p200300F07F02D8847C49AEC1D0D8828A.dip0.t-ipconnect.de.
	[2003:f0:7f02:d884:7c49:aec1:d0d8:828a])
	by smtp.gmail.com with ESMTPSA id w24sm811288wmi.46.2019.02.07.23.24.37
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 07 Feb 2019 23:24:38 -0800 (PST)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  8 Feb 2019 08:24:25 +0100
Message-Id: <20190208072425.24485-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [PATCHv2] menulibre: Fix multilib fetch
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
X-List-Received-Date: Fri, 08 Feb 2019 07:24:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

| ERROR: lib32-menulibre-2.2.0-r0 do_fetch: Fetcher failure for URL: 'https://launchpad.net/menulibre/2.2/2.2.0/+download/lib32-menulibre-2.2.0.tar.gz'. Unable to fetch URL from any source.
| ERROR: lib32-menulibre-2.2.0-r0 do_fetch: Function failed: base_do_fetch

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
index b0e4784fe..1e9e5f1a1 100644
--- a/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
+++ b/meta-xfce/recipes-apps/menulibre/menulibre_2.2.0.bb
@@ -13,7 +13,7 @@ inherit distutils3 gtk-icon-cache distro_features_check
 
 REQUIRED_DISTRO_FEATURES = "x11"
 
-SRC_URI = "https://launchpad.net/menulibre/2.2/${PV}/+download/${PN}-${PV}.tar.gz"
+SRC_URI = "https://launchpad.net/menulibre/2.2/${PV}/+download/${BPN}-${PV}.tar.gz"
 SRC_URI[md5sum] = "9690848dbf9196c3f7baa574e90378d8"
 SRC_URI[sha256sum] = "546fec87f451c8f5c220d02b1f36dd850f4ce9ab607f8e9711ed8f2009e349fe"
 
-- 
2.20.1


