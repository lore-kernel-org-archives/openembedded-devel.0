Return-Path: <cody@arrc.ou.edu>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 6803577BC9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Mar 2017 16:16:53 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id l203so3782583oia.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Mar 2017 09:16:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=arrc-ou-edu.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=1KID8iw9Uo3PnvjEJnl5jModwIasbvEti9F+Zq8QBuM=;
	b=fbFj40J83nAZQNtBtHEYgwi78/06Bp8ytY1O+43/RAehSgK+hkRz2H5Cx2gM30Q9ih
	GDjE5qCuOGA5hSxnXZEDJfNZEm764b26yhK/+ZkSubkbNADu1YuMJTR+Gly9Iqxxl1Jo
	VCaP60pQbylrLdZLw4PYhalJg/YcrKh5ZQr4UiOky8CwXXfA2+NETg9HBRhyW0hdha5f
	bQz3SAkWBGeoSqRUAWtxjhaFn6/KO1zdvPdAItgvXZMVz/nikuvRtUuZZ3AZz25i1Cwm
	lvf0X5dN5AGFKCbfhVqc+UvOcgZ3YvzC8Zp2FlTzsKGMD9+mRJlUmN4pHAD0Cfc+n25y
	o1XQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=1KID8iw9Uo3PnvjEJnl5jModwIasbvEti9F+Zq8QBuM=;
	b=BC446gcH1DvSp8xd0wgd5oK+itqneWS38X+M4Lz+6I3NYzAjHIf3XdI21yWc3EVhu6
	fYPWOPo324fN86mLQ7973Uajjw9ROMcaKlqsjHHjQLhEQ1q8EPgE5ZSpZ9CKXXccSNcd
	4xgOVvcIvEhqJeWcYfLeRrEtnTDSuB7anLIPvZzOV+B4Zg6PzJxd6qx3ig6KDrMVyap4
	gJVzSHDj6I4KryAE8JT633fIp1rv8xyem+cnRLU9lvUyKEGB+IXdPdmVgCz7KcElcq/J
	sieJUOoLOs7cy/gVbwJopOERQ5WHXjz0fNVpeiQn41r4eAUUyAYpGcy/WXOzdzRd8T5U
	rFWA==
X-Gm-Message-State: AFeK/H3OF4jQkvFp3OE8kGX9rdBJw2sLjKmAXv1ILlP4LtjnI92olrgMVu9IUTjGT+9P5dOZ
X-Received: by 10.202.180.213 with SMTP id d204mr5087835oif.82.1490372214408; 
	Fri, 24 Mar 2017 09:16:54 -0700 (PDT)
Received: from localhost.localdomain (ip-129-15-133-239.fwsmscbz.ou.edu.
	[129.15.133.239]) by smtp.gmail.com with ESMTPSA id
	s95sm1154510ota.45.2017.03.24.09.16.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 24 Mar 2017 09:16:53 -0700 (PDT)
From: Cody Piersall <cody@arrc.ou.edu>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 24 Mar 2017 11:16:44 -0500
Message-Id: <1490372204-4336-1-git-send-email-cody@arrc.ou.edu>
X-Mailer: git-send-email 1.9.1
Subject: [meta-OE] Remove do_install_append() from zsh recipe.
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
X-List-Received-Date: Fri, 24 Mar 2017 16:16:54 -0000

do_install_append() removes a lot of useful functionality from the zsh shell.
If a user requires this limited shell, they can add it in a bbappend file.
---
 meta-oe/recipes-extended/zsh/zsh_5.0.5.bb | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
index 39b2d95..d5bb1b7 100644
--- a/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
+++ b/meta-oe/recipes-extended/zsh/zsh_5.0.5.bb
@@ -44,10 +44,6 @@ do_configure () {
     oe_runconf
 }
 
-do_install_append () {
-    rm -fr ${D}/usr/share
-}
-
 pkg_postinst_${PN} () {
     touch $D${sysconfdir}/shells
     grep -q "bin/zsh" $D${sysconfdir}/shells || echo /bin/zsh >> $D${sysconfdir}/shells
-- 
1.9.1


