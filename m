Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f194.google.com (mail-pl1-f194.google.com
	[209.85.214.194])
	by mail.openembedded.org (Postfix) with ESMTP id EAA816D66D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Nov 2018 03:02:50 +0000 (UTC)
Received: by mail-pl1-f194.google.com with SMTP id w4so2061205plz.1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2018 19:02:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e8Z7ML/rDJSe/aRSXagqiWkLfl+EhnfiJnOlrso6Qv4=;
	b=tsPXwx/4NDpLJ6rmOgTF7VBgfDwcNQ8m7GV5xBihmIdqO2L+7hcXvMEYG8d9uE7MDc
	S8OCUcUzGdqIMWVF52Yg86KfmgT8jb+U98gxrQc4AjYIte1+vzmDKzG96xkPtfIITrux
	Ff1CaRG5fEeDAcs95RWwUO6l5yaq+hgemjdZqOfuTjw+3i3/pda6ZghysrW5f/+5rpfv
	tpBfo+ycgboWIPVM2xzSF5WzSyprUnxHZC5EgrrYuX3zySE2Q4XxogieY9jmVkeNmJAO
	1VU0NRsMPVKIOSGcL6HGXay+oGp3EFvW15ygZYsqiOUq2W2E+tPtt9ND7LdBtFIU+CFT
	X5iQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=e8Z7ML/rDJSe/aRSXagqiWkLfl+EhnfiJnOlrso6Qv4=;
	b=poK97JrR+1Qa/A+6YkzHbFmbcDe9t5HYFd8ll7sKiw/Wo4MhkHdO4FevHTSZEz/770
	OlnU/5QYfyhUBcl3I/3cNxmTlrSyGx66aNCyqmPYFtAfH4U9hCC/JwtbEqlFsZ+3Ne48
	BquT4lJWAKAQL8NYG9AnFwNWJ5fh14MqOoq62w1E7Xi1sJQ6Uc/OAx1/f3lNYlDPd+9W
	NSNzrM00JDXZb++Iy1s/p1uClKnhc6iEULe9Ov397yLF8/reB+kBf+QyEXIOLpyBClGU
	1Gg+GNnXZkfziXkSqMDtXtXPKWVxacFhQ8zozXNUOpV3usRySXUYSzlaTxr7ujX9OqPm
	9smw==
X-Gm-Message-State: AA+aEWaFSb6gJECKp5APiQSq0xiEpEtIAlCsOiMWR7u31cE0FSKq9QOp
	aWwb5QUuGFLdTt/+veBOqjR7JSUR/Dw=
X-Google-Smtp-Source: AFSGD/X/W2SBhDJkMZhWc9UGDUsgFGXs/4ah8wVosIuNU6ut/SapOgr6sikE4ZAPcKyYi6rC1LWwrw==
X-Received: by 2002:a17:902:2:: with SMTP id 2mr4101047pla.228.1543546971358; 
	Thu, 29 Nov 2018 19:02:51 -0800 (PST)
Received: from localhost.localdomain ([2601:646:877f:9499::26ab])
	by smtp.gmail.com with ESMTPSA id
	q199sm10364448pfc.97.2018.11.29.19.02.50
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 29 Nov 2018 19:02:50 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 29 Nov 2018 19:02:38 -0800
Message-Id: <20181130030239.32139-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
Subject: [meta-networking][PATCH 1/2] miniupnpd: Update to 2.1.20180706
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
X-List-Received-Date: Fri, 30 Nov 2018 03:02:51 -0000
Content-Transfer-Encoding: 8bit

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{miniupnpd_2.0.20180203.bb => miniupnpd_2.1.20180706.bb} | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)
 rename meta-networking/recipes-connectivity/miniupnpd/{miniupnpd_2.0.20180203.bb => miniupnpd_2.1.20180706.bb} (91%)

diff --git a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.20180203.bb b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
similarity index 91%
rename from meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.20180203.bb
rename to meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
index 04b5cd589c..d5d9bcf64a 100644
--- a/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.0.20180203.bb
+++ b/meta-networking/recipes-connectivity/miniupnpd/miniupnpd_2.1.20180706.bb
@@ -13,9 +13,8 @@ DEPENDS += "iptables net-tools util-linux libmnl libnetfilter-conntrack"
 
 SRC_URI = "http://miniupnp.tuxfamily.org/files/download.php?file=${P}.tar.gz;downloadfilename=${P}.tar.gz \
            file://miniupnpd.service"
-
-SRC_URI[md5sum] = "b4c7c938915edeee6ca4c65dd021f212"
-SRC_URI[sha256sum] = "860c15f2f8340fd69546b01cffe4c7fcff3e63a7bdfe5a2af6b2346f0e074bb6"
+SRC_URI[md5sum] = "a84b3647c871802abeccfc2771e8db21"
+SRC_URI[sha256sum] = "fc2d2fd044d8c3f8d02b63d70489bb35ece836a4fc1b6386865ac8fbe8d8b006"
 
 IPV6 = "${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', '--ipv6', '', d)}"
 
-- 
2.19.2


