Return-Path: <schnitzeltony@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 3415475264
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 16:14:22 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id g21-v6so2555619wrb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 May 2018 09:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vRTKl+ZOI9wTS8gl4m1BgMXdfO5Mfkxqdr7E7iniarc=;
	b=j9ePXB6yvl6sIlJn3LZLUnULKssFGlDj7v5qp2konpXVW3hhWb8POfD/oL7oybLYw+
	W8MKVcXYkKwAV02P9nNwX555oR4D0NiKgTIoJJ352/unZUoi/Jg6ZsT5CYJWQNpnvtvu
	6tw1PR32V30KRVt/FL4oYQE5avq76cZFz6jyQ/rI1HhcxncCqv1L4lknncgrL1WL9RNg
	BY1Jc0zx7T+Ifrv+Y9CMN0McjCBeoQ8sxtENHfFCl32hlQsDD3AeJbbUq1xGvOvoPuMx
	VoAyQUIWPDUwoC6Iz89z2KzSq/nVOJ97moZZjAlkUJhdM5fleNMAUxt/5NdbGkQ/M74R
	dPHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=vRTKl+ZOI9wTS8gl4m1BgMXdfO5Mfkxqdr7E7iniarc=;
	b=tYWVMZ0rxRpjA+lP59pA7yyEjOVhD4lh32Qeo6gSRkyIsGh3y0KLBnKkVuVbYE9+un
	9qllh43UDwrQ0it/gXNl2TWm4xj1EWCZiHZcye+sH5hYxjGxKvlLsUDTjxFkcMvFu4Iu
	xhxJHIrBuBo5pNBi3CzZMHd6cn//pBw39xMJ3VNNMVHUTqsRije/ywTwjnfWCq2Rshks
	ySRYAQI2XHiLIZxmgmN1f7WhKN1hQiHzLZFCFwx626gJzXOKxFi1hdPqty8G2RlqIu4w
	VCdsWFQx6OdNovseadvKMUSGrt6KR6tge5FYxY5Irsz9ptfpLhADKVPYjACAefrIWjxp
	+fLw==
X-Gm-Message-State: ALKqPwcNis+6lGvL5IRIUZIp0Pb2cC1Ge2VQ3Ij5Z1ob53wVj7TgjzAA
	Z7TQKrQ1+r2juxgJgeSXg2yjhg==
X-Google-Smtp-Source: AB8JxZoFeuVnHZmP2RE+lPwwcSGIa1T6hVtXnNSicqL2BS+Hk2uXV0SEQTi7n+wE8MO9WvvTBYbXww==
X-Received: by 2002:adf:8af0:: with SMTP id
	z45-v6mr1708170wrz.150.1525968863354; 
	Thu, 10 May 2018 09:14:23 -0700 (PDT)
Received: from mueller-a-nb-linux.speedport.ip
	(p200300F07BC0732689B6120586BBC15E.dip0.t-ipconnect.de.
	[2003:f0:7bc0:7326:89b6:1205:86bb:c15e])
	by smtp.gmail.com with ESMTPSA id
	f143-v6sm1679595wme.43.2018.05.10.09.14.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 10 May 2018 09:14:22 -0700 (PDT)
From: =?UTF-8?q?Andreas=20M=C3=BCller?= <schnitzeltony@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 10 May 2018 18:14:08 +0200
Message-Id: <20180510161415.12827-1-schnitzeltony@gmail.com>
X-Mailer: git-send-email 2.14.3
MIME-Version: 1.0
Subject: [PATCH 1/8] xfce4-clipman-plugin/DEPENDS: replace deprecated xproto by xorgproto
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
X-List-Received-Date: Thu, 10 May 2018 16:14:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Signed-off-by: Andreas Müller <schnitzeltony@gmail.com>
---
 meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
index 96bdf0e53..f683f5359 100644
--- a/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
+++ b/meta-xfce/recipes-panel-plugins/clipman/xfce4-clipman-plugin_1.4.2.bb
@@ -6,7 +6,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
 
 inherit xfce-panel-plugin
 
-DEPENDS += "xfconf xproto libxtst"
+DEPENDS += "xfconf xorgproto libxtst"
 
 SRC_URI[md5sum] = "9169140af7c9d3fddd8a5c9e0efb5a61"
 SRC_URI[sha256sum] = "cf2b45e327e67cc187dcb99a6ef6d95570463045accd24540e17172f005189b3"
-- 
2.14.3


