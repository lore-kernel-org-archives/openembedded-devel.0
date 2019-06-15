Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com
	[209.85.214.173])
	by mail.openembedded.org (Postfix) with ESMTP id 9F5C37EB51
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 17:57:50 +0000 (UTC)
Received: by mail-pl1-f173.google.com with SMTP id s24so2356077plr.8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Jun 2019 10:57:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=9o71N3tCdYUUnbPfLuHfYBBTgAnxvFQXb8UDXuPx5WE=;
	b=gG1gdDpeA6N2TXoS1SNHcGHn+1ievzUb3ax7x/FBnu7sHfcqO4fQngOCj2+/O6oJB/
	N4I3Ydwtv3qHTMKJtyAV6Qf/FonSMhdH3gtejNdiF52BRqrkM4b4sw+NzVbx0hSpLPXN
	P0s1A3qahHsKd2MeLG8x25l8rmr5gLNVmGxP9RkQYmDKROYQ96KMV2H4KAMPQJltJlkc
	eZ8EM6OngJZYKtG4ZiSsTAoHQddTq1zP7SdjifhPRwdvqPJ78dD845tfFStbXfr6MY5O
	VacOpa+01kiBAUdhS9urasmxRkoI3M4JU5XU/jwWVhAy1t+BlOwV98CHlw8w3Ep3x6Vp
	8GUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=9o71N3tCdYUUnbPfLuHfYBBTgAnxvFQXb8UDXuPx5WE=;
	b=rlqp8H1HNzMru97cZJrS1OpMbSh1ZSaQPe0KweFtYkqwRVF0GIO7hnbLrMp+98IoqR
	AUGsKixea0XpP4aCrTJppmw0dp8YTPdZD/lDxqtUr2EeCNsYvQP2xuv7AWYDOgDyELuq
	CaMC47EPM2jnT85ZzNxSBFQAfUc7MMKtbLYMfaWSx57CMMeb0D4dC3y3enXbvBCTHYFP
	c79ay0Gh19UOzpU43saDnJ7HgMR6+jTtWh6waYxSHZx5RIWLOtYIzWuQhqTYDy3TuzPb
	8TkMbsWa4Dq6TieMXXEzPdNh8NGi1tuIFZGOOcdepkssKwempj+bbXC1Nu637limSdLU
	dSUA==
X-Gm-Message-State: APjAAAVJEa7RZQujOVrzY6zIZx5yLrsyw0Ulxl3PhCn/s3wRdTwpaQtX
	YaHA3mSqN/TC6AalG2MQJ5RmOwK2
X-Google-Smtp-Source: APXvYqzHQarHdMy0Vk7RQvqdUfORU+y34pBDtFn9LPNlFTN+uoiLkV8sugYrTtUq7yWnVbJEkHPiqw==
X-Received: by 2002:a17:902:9689:: with SMTP id
	n9mr2989497plp.241.1560621471555; 
	Sat, 15 Jun 2019 10:57:51 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4180:c33:5942:80bf:dc9c:15ab])
	by smtp.gmail.com with ESMTPSA id
	f14sm8561221pfn.53.2019.06.15.10.57.50
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sat, 15 Jun 2019 10:57:51 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat, 15 Jun 2019 10:57:26 -0700
Message-Id: <9814a993ba65cfd84a8707a22dc02a85082de513.1560620937.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1560620937.git.akuster808@gmail.com>
References: <cover.1560620937.git.akuster808@gmail.com>
Subject: [Warror][ 22/23] netkit-telnet: add rconflicts
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
X-List-Received-Date: Sat, 15 Jun 2019 17:57:50 -0000

From: Changqing Li <changqing.li@windriver.com>

fix below error:

file /etc/xinetd.d/telnet conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586
file /usr/sbin/in.telnetd conflicts between attempted installs of netkit-telnet-0.17-r0.i586 and inetutils-telnetd-1.9.4-r0.i586

Signed-off-by: Changqing Li <changqing.li@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
index db4b1c9..4b035af 100644
--- a/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
+++ b/meta-networking/recipes-netkit/netkit-telnet/netkit-telnet_0.17.bb
@@ -63,3 +63,4 @@ FILES_${PN} += "${sbindir}/in.* ${libdir}/* ${sysconfdir}/xinetd.d/*"
 
 # http://errors.yoctoproject.org/Errors/Details/186954/
 EXCLUDE_FROM_WORLD_libc-musl = "1"
+RCONFLICTS_${PN} = "inetutils-telnetd"
-- 
2.7.4


