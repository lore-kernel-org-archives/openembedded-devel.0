Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f48.google.com (mail-pa0-f48.google.com
	[209.85.220.48])
	by mail.openembedded.org (Postfix) with ESMTP id 5744960621
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  9 Feb 2016 23:42:35 +0000 (UTC)
Received: by mail-pa0-f48.google.com with SMTP id yy13so1663224pab.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2016 15:42:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:subject:date:message-id;
	bh=Nd09UJ6pRvGp63/sluXu4aXi4fuji32WXkU0/buDil0=;
	b=bEpzZyctKwl40padgf2rfBa6UfEKBGuEeLS1P1EiN095fF/LymLKeyQzM/S2dRbyup
	9QBQB9NmzV4DcUVyDlPpWQF78ylXIZm0t++9d38lrpQzSqU7WvNsSvI4vr0K59UDBvvl
	Gmjbdu9U0VwU6lXhkE3WTtqvG5o60lBnYjnSxBSaj7QXc90sBzKZZEyc5PzlXdJaQho+
	Dplx+lwUqc2RDFA291hJld+DmbBJJ/F4HP5oeVTQiP3/NPLnjeMxCnFXltckFBPPWMVJ
	VK7GFxGqqsRd/Z2pcimxh3wUz2C3XAipZfMlssiUI9SY8RieMB0vifQGOfT8jqTVBldg
	MU5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=Nd09UJ6pRvGp63/sluXu4aXi4fuji32WXkU0/buDil0=;
	b=IFNuBL8trL1KQE69kuVtb4yjEUG77Ewh62AIALpzK2Cu6VRmYeH3voPjrddD0+ga5/
	ImzxyiWSE41IKtKhN7d44thm3KPK4m6qIYYndiIWRrWz3iN/mi+niEQllImzeyo0F472
	Q4p4O1r/FOJ7XokjVqLbCDwVX1jxj7xvEkLyGnoTW//HFYtUEQdPKyfcJTG7GhhMw1pm
	e5JAJvzD7smJgW8WC9a4eLk04SYH1dIn3gTx61HnLxuL+YhCbFi18g516IjsO+7Z5/0Z
	9O3g4oafbPI9p+SMxcuPguGn6bSUhS1A+CES6NTZY7YLDE6HqIWC5e0RPteEsnpbR6B0
	0GNA==
X-Gm-Message-State: AG10YORIPttfI3Xim7a+F2jXOhEyyvoNBw7w2Hxj5c6Ciy6EyDkCkgblyVkPyrpps+l9Iw==
X-Received: by 10.66.180.174 with SMTP id dp14mr42694628pac.93.1455061355984; 
	Tue, 09 Feb 2016 15:42:35 -0800 (PST)
Received: from Pahoa2.mvista.com (c-76-20-92-207.hsd1.ca.comcast.net.
	[76.20.92.207])
	by smtp.gmail.com with ESMTPSA id cf6sm284477pad.41.2016.02.09.15.42.34
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Tue, 09 Feb 2016 15:42:34 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  9 Feb 2016 15:42:32 -0800
Message-Id: <1455061352-28332-1-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 2.3.5
Subject: [meta-oe][PATCH][Master][ethro] krb5: Fix build warning
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
X-List-Received-Date: Tue, 09 Feb 2016 23:42:35 -0000

WARNING: /tmp/work/armv5e-poky-linux-gnueabi/krb5/1.12.2-r0/krb5-1.12.2/src/ ('S') doesn't exist, please set 'S' to a proper value

remove extra "/"

Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
index ecb4eda..65013b5 100644
--- a/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
+++ b/meta-oe/recipes-connectivity/krb5/krb5_1.13.2.bb
@@ -36,7 +36,7 @@ SRC_URI = "http://web.mit.edu/kerberos/dist/${BPN}/${SHRT_VER}/${BP}-signed.tar
 SRC_URI[md5sum] = "f7ebfa6c99c10b16979ebf9a98343189"
 SRC_URI[sha256sum] = "e528c30b0209c741f6f320cb83122ded92f291802b6a1a1dc1a01dcdb3ff6de1"
 
-S = "${WORKDIR}/${BP}/src/"
+S = "${WORKDIR}/${BP}/src"
 
 PACKAGECONFIG ??= "openssl"
 PACKAGECONFIG[libedit] = "--with-libedit,--without-libedit,libedit"
-- 
2.3.5


