Return-Path: <open.source@oleksandr-kravchuk.com>
Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com
	[209.85.208.53])
	by mail.openembedded.org (Postfix) with ESMTP id 41EC17F5EC
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2019 21:19:40 +0000 (UTC)
Received: by mail-ed1-f53.google.com with SMTP id r12so23535343edo.5
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 25 Aug 2019 14:19:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=oleksandr-kravchuk-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=CXiulHw98wG1B2wqsjMi+ZoBM1ZGESQr6ovZVSpNVmw=;
	b=bbxpgJPXRxOF7ENZVFrmWMA6D7dCZFKX8IfxQr6vUcYTK108bv1r1LB+Z3mjz748S0
	ZhUQQlog/+HZQnoO2CxVfmLfRBs2VhbBmyU75LChTmjZPnsmzPkseWFkkM5lkttDs32o
	ljqX1ZnlB1XZ3DfemCM9A6aVckZMFV8Omr4MbF2x9102iZwV5trjtrbgFhOSgnKfWZcg
	zc2yTdzxDoQ3lIKkoDXLKIXyBJwyn90LyA2ya7ec83QeCfoEuC8/z2TR238a+uxSbRIk
	jCEUkoPgx+DZBLa4mp2au1NLO3d2sL7742Z9QPL/fp3lk2jtUdWxIluN48mYiTPG9H//
	Pb/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=CXiulHw98wG1B2wqsjMi+ZoBM1ZGESQr6ovZVSpNVmw=;
	b=OozTDt6Q25DaSXFnLBZBbJUWlQYAMED9aaEew1d1tLrHoAcYfeWnvHRRbamTZI0R0G
	KD6ziSqbbvazE9jn+WzdAxrrSZYDCoQF2rVubJ1bRyohkxqEowb5vHWz7ftZZYLvZjFj
	JemAKyNDcN5wKjrIEWZwSffhLj6XBfV3LS44EPRGRaKGljDUuqwEOgFSNA6JmgD9kGQO
	98RoeKtYSkkaNiSI9J2Tme9/i8nLSDqLchWivM5SHsQLDeCIkOtFXVd3k4L2YMmrGdC0
	grYqMpCiIFhVyo5VtCaNqMXZnttLuNtP5ZwpMEtDWwJ+d+tqndcME8kLW7ST+B3ZOluw
	exZw==
X-Gm-Message-State: APjAAAW8qYIxn81/sv+Dc42wdCMr3arXi+ajm4X4EvmynXYnMOD5n9r9
	wFZenhqedXVCW9kApxcbvmqh37ZaC8U=
X-Google-Smtp-Source: APXvYqxJYvQOasObxl29a9/9oeLaVk8dhpQTlpwCNWAhtfy2WtAaCfUe18OyzCv22Eg5J4WlOWSzFw==
X-Received: by 2002:a50:fc12:: with SMTP id i18mr15932315edr.23.1566767980694; 
	Sun, 25 Aug 2019 14:19:40 -0700 (PDT)
Received: from localhost.localdomain (c83-252-117-108.bredband.comhem.se.
	[83.252.117.108]) by smtp.gmail.com with ESMTPSA id
	ch24sm2644044ejb.3.2019.08.25.14.19.39
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Sun, 25 Aug 2019 14:19:40 -0700 (PDT)
From: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 25 Aug 2019 23:19:35 +0200
Message-Id: <20190825211935.27985-1-open.source@oleksandr-kravchuk.com>
X-Mailer: git-send-email 2.17.1
Cc: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
Subject: [PATCH][meta-networking] nftables: update to 0.9.2
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
X-List-Received-Date: Sun, 25 Aug 2019 21:19:40 -0000

Signed-off-by: Oleksandr Kravchuk <open.source@oleksandr-kravchuk.com>
---
 .../nftables/{nftables_0.9.1.bb => nftables_0.9.2.bb}         | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-networking/recipes-filter/nftables/{nftables_0.9.1.bb => nftables_0.9.2.bb} (85%)

diff --git a/meta-networking/recipes-filter/nftables/nftables_0.9.1.bb b/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
similarity index 85%
rename from meta-networking/recipes-filter/nftables/nftables_0.9.1.bb
rename to meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
index 9d0da33e3..98e8050b8 100644
--- a/meta-networking/recipes-filter/nftables/nftables_0.9.1.bb
+++ b/meta-networking/recipes-filter/nftables/nftables_0.9.2.bb
@@ -8,8 +8,8 @@ DEPENDS = "libmnl libnftnl readline gmp bison-native"
 UPSTREAM_CHECK_URI = "https://www.netfilter.org/projects/nftables/files/"
 
 SRC_URI = "http://www.netfilter.org/projects/nftables/files/${BP}.tar.bz2"
-SRC_URI[md5sum] = "e2facbcad6c5d9bd87a0bf5081a31522"
-SRC_URI[sha256sum] = "ead3bb68ed540bfbb87a96f2b69c3d65ab0c2a0c3f6e739a395c09377d1b4fce"
+SRC_URI[md5sum] = "dfe130724d7c998eb26b56447e932899"
+SRC_URI[sha256sum] = "5cb66180143e6bfc774f4eb316206d40ac1cb6df269a90882404cbf7165513f5"
 
 inherit autotools manpages pkgconfig
 
-- 
2.17.1


