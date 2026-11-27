Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.10300.1795753114956271887
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Nov 2026 20:18:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=wPW4httL;
 spf=pass (domain: gmail.com, ip: 74.125.82.171, mailfrom: raj.khem@gmail.com)
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-386ab9ab619so10381759eec.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Nov 2026 20:18:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795753114; x=1796357914; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=usVLbUA8qHoOH8UEL0nqqCr/RmomTbyyTwsw17Me7jM=;
        b=wPW4httLcVyjbXPV9rjyV+eVzcwTmfJykVYO7pfzNI+kFUG0wx0I2C6UnWO9XL1mUO
         fTd4PXjX3rslBkTLumzavDSeSNuEOjmBGV4Q+oZg8F/bai9INbpviFLUVleVni/a4z7K
         iWOK3fZKJGTpjt6pnGt8PgRMQ1YDqSpir1LT4lTkUvEun4lpcLDTcLp7yoLyd/5hga7q
         glcd+u4ZBua1Hq5usiLY+AA8CfsOo6RCElsOBaHuNxWoEioK+jU7Wvxc0CmD3FSC3g7P
         ckc+CLIdUFyRJ+hKaKoI1WY5szf4DrXwnlUdF7rf/TD1g8FywJPSGuQnLHDrom87m4OL
         wTTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795753114; x=1796357914;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=usVLbUA8qHoOH8UEL0nqqCr/RmomTbyyTwsw17Me7jM=;
        b=nsZvR65vlALRIjKrx2U1ilEolU6TvvTipmeB38JwmK9W1+ueW9DeN3UscjD9Jp24a2
         bnCNrka6seDeqIuNjFgzNfiDO+UDlSxcq0/Znx245hkRliF9iakldBhfdd3yaJh/C8xZ
         nXnC2+Eci/XcC2t2SHjkr0rlX3tjQUwpoZzr5hBmJ48olNK8q/3ForS8WmALJwY+uSOS
         bxe1q3UFzXtmYD37Kg57cWziYckBZBhF/8o9oiUU9kPrA5ZDghgGONgJmchN/dS4MV3F
         TIW5dkd5MmMXQsgWraXPkjmK4DmAzq1StBM4Hv4conI39kSl9O4mZ+isbm7WCD3hZ1d0
         Z6wQ==
X-Gm-Message-State: APuU4Z9pnhIU3tfhOFD3InlUj9Y5wJYWXooUh5iNOnlGKKcq4iJgcx2I
	yZRsMUGBf6Rvbq1667aQNa3kUN/ZTvbaSlD+lmT0ETUQwDyed9QJrM+a+1leFN9W
X-Gm-Gg: AZFdTZc656Ptd+WGTiMw43/r8NcJ9sjXJbsAMV1NRBBGd7UD5HI9zL8vSpPU9Eaga/c
	MjT+Gceqtx5l8mN7VLVRzPNpG9DhiZKDseKNMA10wjKPBTvgVei8G+NiiIyF0NbAhu9YqIhWUbZ
	EkQC2+jhG579gnh1lsqwn7agsxcC4S60QZbew/bFzUY18RrjXpDG11GDouVUjCQPzBqzXmfAkNJ
	aNsEyCswJRHjMj2mp8lP0dC2LXv+RRiQftIPvbGfhH15kjC0xt9FMQJgLL8CQtua9E2vQMO9YTs
	y3ZS3o1I2XbLgVrFC7bejM+xGbxfa7U1o+AIYJhIlVzicXPWusE4Byg79qhMhlCHT+aJXa8YEbe
	5/G+qWVKeIjQJX/KS3unKcfJUaCYA0sCsbZw6PznCCgg9PfS/q5H6fLIc1xDEygC5xw/sS8wFAw
	NhoMuUqj1775hZSg3sZv+zAKTF6J3MQj6wmkuTJr/UV1n5yGqhQ664YRVxon3XwDD+zZINFJqfT
	HwMRKIO5mtyZCivbUdq9z90p2R/XXgCbzLYUs0tb2K5k2PuehFBve17nTLLIIUXClIP513GJRy8
	BAkChzBWgijdJQ1ZpTWFPmA5sodJ1hZwHlAoE3nvWU1UCT9ce/b5BA6nawXRLkEycy46AONW9rC
	dKnBywRF3RbF5onZGkke8ERaZN3NnOKINP0RWumRMOXHeDKH4h4mfVBAAPGc46Bi6QczebzcPTF
	Djjf1qQ97YPhEJoqZvA/7bm/Wp7D8Wt5GYxLh6BKd/80ODjNhnQRILJaNU5V2bYzgVdGZoxkDyx
	BFBh23mf4ceYCMjh5L17N/oo9/+d6jXPOEXCNfa460shuVavWBXDwBmBbpPyDRvoFO66y+SbR11
	0Zlt
X-Received: by 2002:a05:7301:db86:b0:384:d59d:199c with SMTP id 5a478bee46e88-3856c2c3fd0mr21276535eec.1.1795753114269;
        Thu, 26 Nov 2026 20:18:34 -0800 (PST)
Return-Path: <raj.khem@gmail.com>
Received: from apollo.tail3ccdd3.ts.net ([147.160.63.35])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567abb870sm56941116eec.25.2026.11.26.20.18.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 20:18:33 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
X-Google-Original-From: Khem Raj <khem.raj@oss.qualcomm.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <khem.raj@oss.qualcomm.com>
Subject: [meta-networking][PATCH 04/15] arno-iptables-firewall: upgrade 2.1.2a -> 2.1.3
Date: Thu, 26 Nov 2026 20:18:16 -0800
Message-ID: <20261127041827.1778052-5-khem.raj@oss.qualcomm.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
References: <20261127041827.1778052-1-khem.raj@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 27 Nov 2026 04:18:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/133292
Content-Type: text/plain; charset="utf-8"

Bug fix release:
- Fix failure for multi-IP hosts in traffic-accounting-helper
- Fix missing colon that broke unprivileged UDP multicast/broadcast
  logging
- Make switching between ANF and AIF work without reboots or user
  intervention

The recipe needs no changes beyond the new tag and SRCREV. The existing
UPSTREAM_CHECK_GITTAGREGEX already matches the release tags.

AI-Generated: Uses Claude Code
Signed-off-by: Khem Raj <khem.raj@oss.qualcomm.com>
---
 ...ables-firewall_2.1.2a.bb => arno-iptables-firewall_2.1.3.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-networking/recipes-filter/arno-iptables-firewall/{arno-iptables-firewall_2.1.2a.bb => arno-iptables-firewall_2.1.3.bb} (97%)

diff --git a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.3.bb
similarity index 97%
rename from meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
rename to meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.3.bb
index 4a6b601c56..73f6a029b4 100644
--- a/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.2a.bb
+++ b/meta-networking/recipes-filter/arno-iptables-firewall/arno-iptables-firewall_2.1.3.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "http://rocky.eld.leidenuniv.nl/joomla/index.php?option=com_content&v
 LICENSE = "GPL-2.0-only"
 LIC_FILES_CHKSUM = "file://gpl_license.txt;md5=11c7b65c4a4acb9d5175f7e9bf99c403"
 
-SRCREV = "4651194df5f985ebfc989da0a20d62b9baecf314"
+SRCREV = "842decce97fbeee4086dadba2f83ff74f31e3a8e"
 SRC_URI = "git://github.com/arno-iptables-firewall/aif;branch=master;protocol=https;tag=${PV}"
 
 UPSTREAM_CHECK_GITTAGREGEX = "^(?P<pver>\d+(\.\d+)+[a-z]?)$"
