Return-Path: <mickey.happygolucky@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 1782270018
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  8 Aug 2017 00:59:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id t86so1822338pfe.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Aug 2017 17:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=55g/bWHvQ7iMrEN0neYiFBOcoSUpeuISy1bDi5Im7fY=;
	b=Dlz7d1au7Z8Bo+7r5/jwsF29ppCyDL/gVybQCKPm72Tk1/BEOyXDfubna+Xy8t5fiD
	dr4vIagORQcZ2mH4k5koJjwxMQgqsVonAOE0zTk40nnMK+9zBHvmo5gdH8qSp0GhVnKT
	0UR2BB4tOfvo4/fIpIQC2accQ0hKxvESH8PUHqqRnvreOLPYy/OThWnEQIakmT1Vx0o0
	f4AknbiRKHcB0QSwx6NBMNgvRJ9P1SlQW5dVl+Py3izkkdZ6Tw3g2Yb5QMVtEV3CsDGp
	GC1NmclV/82nlCWpKegLXPD8vNleJh5MQ4j1w4jOB3fGc11xA11X8zUvlNvhd1nS+PFi
	3xNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=55g/bWHvQ7iMrEN0neYiFBOcoSUpeuISy1bDi5Im7fY=;
	b=JeeIr2U/ksfDYsHXmShQyfupS8wgx4RJSnj4SCBSChg984FvRYgI53LSlQ2LzdRlPx
	1FDtt+bzTqPV/oqNUSrMNiAstDytz0M99plgj0wOT+TmfLKCBw4kTzfp+p4BjPu9l3Vd
	zm3tAHWizDXARiBRWu5KTldwTKWQUdz+3tEdPEp95TicCWaNh02NRz61RBs/jIG9djU/
	j/GmGRCeVvK5EArth+cbfT5PINlhp7idNf8Ga3dPUUVtWDFOn1N2PPKd2mvEJxUeetAw
	aPZIVllTUtKloBwmcjTGbDzsbcDEYx7LU4g02CK7WVzH8XcluIyU40xX/H8aA5iLcEJi
	OPZw==
X-Gm-Message-State: AHYfb5hNXQUTWGtq+CdKnKWZZyhfX5rTxNc9/P8hgy914Lk+IRZ01wWm
	nrw8ly4B5cGmhnv6mGs=
X-Received: by 10.84.167.2 with SMTP id c2mr2559672plb.367.1502153975149;
	Mon, 07 Aug 2017 17:59:35 -0700 (PDT)
Received: from localhost.localdomain
	([2400:2411:21c1:9d00:b8cb:4f3b:9c01:c505])
	by smtp.gmail.com with ESMTPSA id x25sm89484pfk.80.2017.08.07.17.59.33
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Mon, 07 Aug 2017 17:59:34 -0700 (PDT)
From: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  8 Aug 2017 09:59:11 +0900
Message-Id: <1502153954-2796-4-git-send-email-mickey.happygolucky@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
References: <1502153954-2796-1-git-send-email-mickey.happygolucky@gmail.com>
Subject: [PATCH 3/6] uim: Added glibc-utils and glibc-gconv-euc-jp to RDEPENDS_uim-anthy
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
X-List-Received-Date: Tue, 08 Aug 2017 00:59:34 -0000

To uim-anthy is working correctly needs register by uim-module-manager.
However 'uim-module-manager --register anthy' is failed.
Because uim-module-manager uses iconv(EUCJP to UTF8) internally.
iconv needs glibc-utils and EUCJP conversion needs glibc-gconv-euc-jp.

Signed-off-by: Yusuke Mitsuki <mickey.happygolucky@gmail.com>
---
 meta-oe/recipes-support/uim/uim_1.8.6.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/uim/uim_1.8.6.bb b/meta-oe/recipes-support/uim/uim_1.8.6.bb
index 9e7b45c..0cfd351 100644
--- a/meta-oe/recipes-support/uim/uim_1.8.6.bb
+++ b/meta-oe/recipes-support/uim/uim_1.8.6.bb
@@ -17,7 +17,7 @@ DEPENDS = "anthy fontconfig libxft libxt glib-2.0 ncurses intltool"
 DEPENDS_class-target += "intltool-native gtk+ gtk+3 uim-native takao-fonts libanthy-dev"
 
 RDEPENDS_uim = "libuim0 libedit"
-RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0"
+RDEPENDS_uim-anthy = "takao-fonts anthy libanthy0 glibc-utils glibc-gconv-euc-jp"
 
 LEAD_SONAME = "libuim.so.1"
 
-- 
2.7.4


