Return-Path: <tuanhoanganh.dev@gmail.com>
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com
	[209.85.215.182])
	by mail.openembedded.org (Postfix) with ESMTP id 1BF6F7C75F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Feb 2019 05:03:17 +0000 (UTC)
Received: by mail-pg1-f182.google.com with SMTP id h8so8577023pgp.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Feb 2019 21:03:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=7cbN5zZU0Hr9KbPAijIDmsa/c7EoMmpMSyGuXyP4lu0=;
	b=FojJR9EJuX4St5dqGhmcqDAxyGeFO8v0ir9DjX6Z+H+Wm0eJkTWy/WvldhsuUa9uT8
	G2gRbarfNhd77wKo9EQRytXVSwSrsYDtTNaAE/P91fLwukii05XoQLuMNpL17Qp+67fe
	I9Ook5/Pc/YOf2Im553OjBgK1JnCLefNucVGC+4nKVxPvxpiUkQqjalwuVVqaRvkAZor
	f1OfoeWy3fzm4PnR8nf00zfKU0TkSr2hIJtOq+BQVpK5GDnVI27PH9fr+0VDpllLtwbP
	fjcLe2gk273AJZHe5IjOjStjRgqOKd2WJYNZupnUx4IQTGPvOONJjf9NGRM/6qptGPbq
	IfSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=7cbN5zZU0Hr9KbPAijIDmsa/c7EoMmpMSyGuXyP4lu0=;
	b=FcnrE6PTPo75/9fQESIfDBvIqxZRoKSyCbxOUhb1cp0QEswG3/HeqZjaGHEq5CeBnM
	wYmbqou09z69o41UjmDn+5lq0DyuSDPD2mFTh2Gz2IzJvTuS7z7g1bnZPDPgKlFjnhJo
	ROArs1IQemaB9cXJZQF5i9h1eMCT5zD1OcbTMpHzxXnpjqGPJhj0ZI/6VBzQWGVIHPMu
	+X1GHFKgdlGo/1r+Rn64bFdnphUdh738GXamIQWxAVD2Enlkthybp77lPty4c1XMgnHs
	ZheHOct3DjEXChSB440+9n7D+d0aCegTshjHzaRkIGBa0nVtx9Fp9EOzLZMuwwn96mh8
	xKfQ==
X-Gm-Message-State: AHQUAuaKCz+Hwa4byXWlHE6b+ZC4OgnuRI7MdBnMRaf+Y3Caelm2YQyp
	8d/WgEfDRs4CVlnrTiFIg/DS8RJk
X-Google-Smtp-Source: AHgI3IaD8EHUUo1Xdip76vlTQb/haNLvJO0hlvPKCFi7aGbjZVkDXsfrcdnzL3Mw2/8eqA0ZOdg6pQ==
X-Received: by 2002:aa7:8c4d:: with SMTP id e13mr5526549pfd.53.1551330198177; 
	Wed, 27 Feb 2019 21:03:18 -0800 (PST)
Received: from localhost.localdomain ([128.242.105.20])
	by smtp.gmail.com with ESMTPSA id
	v7sm11383296pga.50.2019.02.27.21.03.17
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Wed, 27 Feb 2019 21:03:17 -0800 (PST)
From: Hoang Anh Tuan <tuanhoanganh.dev@gmail.com>
X-Google-Original-From: Hoang Anh Tuan <tuanha@viosoft.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 28 Feb 2019 05:03:08 +0000
Message-Id: <1551330189-18497-1-git-send-email-tuanha@viosoft.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-openwrt][PATCH 1/2] busybox: Upgrade busybox 1.29 to 1.30
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
X-List-Received-Date: Thu, 28 Feb 2019 05:03:17 -0000

Upgrade busybox because busybox in oe has changed

Signed-off-by: Hoang Anh Tuan <tuanha@viosoft.com>
---
 recipes-tweaks/busybox/{busybox_1.29%.bbappend => busybox_1.30%.bbappend} | 0
 1 file changed, 0 insertions(+), 0 deletions(-)
 rename recipes-tweaks/busybox/{busybox_1.29%.bbappend => busybox_1.30%.bbappend} (100%)

diff --git a/recipes-tweaks/busybox/busybox_1.29%.bbappend b/recipes-tweaks/busybox/busybox_1.30%.bbappend
similarity index 100%
rename from recipes-tweaks/busybox/busybox_1.29%.bbappend
rename to recipes-tweaks/busybox/busybox_1.30%.bbappend
-- 
2.7.4


