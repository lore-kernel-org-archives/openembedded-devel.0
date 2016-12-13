Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f67.google.com (mail-lf0-f67.google.com
	[209.85.215.67])
	by mail.openembedded.org (Postfix) with ESMTP id 902D371E48
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 21:04:10 +0000 (UTC)
Received: by mail-lf0-f67.google.com with SMTP id o20so4878174lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Dec 2016 13:04:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=XasETbWg/Wj+PiWx/pmuQSK4IrwsPZJMeO1zi7GniwA=;
	b=vzunodH1UwxO/JWxspXufa+GNAWjzb+CR/ew0/xU7Qz0lmouqzi9vw9n8YkJFDE0bR
	1xpkOYtXDbAiEDyR0Qa3Qwh0P/f8NcuEiWYLCq1xcaxkPvACkapz4OelL0HVcd/hSBnp
	CWiDT3wJHvqFX6hk77rH29Y6CFLIaOG29aYpONqiLWT9Beph+rUAnTBBjY7u9jCZ7Tye
	/XamD3G2JY1uF+qoHLQy8cJFtVV81KwcCdXrfLvvZGq2S7IWnfg2SPuoJxpJZGsLR+te
	hjYUV6N9p+0jL5AkFcGWZEIBaM3I/NcDWIcckBjLmvTB3daIbi7k8za20oHHi0udsaZr
	m7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=XasETbWg/Wj+PiWx/pmuQSK4IrwsPZJMeO1zi7GniwA=;
	b=UpYfAMP5xbgruAh0qEm+IB2ZHO0yti42vOBwMqdOeflqU41kzSAoJzJGTvUmrM8I5B
	BGGnprzMirz/a/WRSOorYlktP/dfIaROfwmVAPhvIVdcD7yDOSLKMgS+ccAhKwv5EAgg
	ji7x9tCFG1jbdwRvOr1aIsbxyu7D3t35XHPfZmnuAvGzYoEBYaBERu4Tfqyg7P7qXRQO
	am5cxfcF53bdco+nI407Us0Orj+vg+GfD316Z8UxvMix9Pij7ssCMuD+6vNOzzLSkMH6
	Zve969RGCPoBP7eZXRaYbpCKr36Mx7QHzdAvNr46ezta3GAwtyk/q/ua43/Xp5xQrOLz
	zZzA==
X-Gm-Message-State: AKaTC02zk0Pt3qPRWBSX+t+GlaJGDPdW2EDLuZrfdXeojz93CE+AFR5Ozk2fw9+6GkONvw==
X-Received: by 10.25.28.21 with SMTP id c21mr33651090lfc.91.1481663051233;
	Tue, 13 Dec 2016 13:04:11 -0800 (PST)
Received: from neopili.qtec.com
	(cpe.xe-3-0-1-778.vbrnqe10.dk.customer.tdc.net. [80.197.57.18])
	by smtp.gmail.com with ESMTPSA id 26sm6678921lji.37.2016.12.13.13.04.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 13 Dec 2016 13:04:09 -0800 (PST)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
To: openembedded-devel@lists.openembedded.org, Martin.Jansa@gmail.com,
	ross.burton@intel.com
Date: Tue, 13 Dec 2016 22:03:58 +0100
Message-Id: <20161213210404.6940-2-ricardo.ribalda@gmail.com>
X-Mailer: git-send-email 2.10.2
In-Reply-To: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
References: <20161213210404.6940-1-ricardo.ribalda@gmail.com>
Subject: [meta-oe][PATCH 2/8] opencv: Metapkg should not rdepend on -staticdev
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
X-List-Received-Date: Tue, 13 Dec 2016 21:04:11 -0000

Otherwise the running dependencies will grow considerably.

Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
---
 meta-oe/recipes-support/opencv/opencv_3.1.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/opencv/opencv_3.1.bb b/meta-oe/recipes-support/opencv/opencv_3.1.bb
index fa2fdb6e6c31..cf41d894cf7f 100644
--- a/meta-oe/recipes-support/opencv/opencv_3.1.bb
+++ b/meta-oe/recipes-support/opencv/opencv_3.1.bb
@@ -104,7 +104,7 @@ python populate_packages_prepend () {
     blacklist = [ metapkg ]
     metapkg_rdepends = [ ]
     for pkg in packages[1:]:
-        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale'):
+        if not pkg in blacklist and not pkg in metapkg_rdepends and not pkg.endswith('-dev') and not pkg.endswith('-dbg') and not pkg.endswith('-doc') and not pkg.endswith('-locale') and not pkg.endswith('-staticdev'):
             metapkg_rdepends.append(pkg)
     d.setVar('RDEPENDS_' + metapkg, ' '.join(metapkg_rdepends))
 
-- 
2.10.2


