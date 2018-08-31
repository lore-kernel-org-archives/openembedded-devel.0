Return-Path: <ross.burton@intel.com>
Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com
	[209.85.221.67])
	by mail.openembedded.org (Postfix) with ESMTP id 75709795C9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 14:41:47 +0000 (UTC)
Received: by mail-wr1-f67.google.com with SMTP id a108-v6so11417164wrc.13
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 31 Aug 2018 07:41:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id;
	bh=aQz/8h2uYd2X6UEJsDW57vf9nPnG/btwZlv4N219hp0=;
	b=bZIkD5MPBccHy1cKCh73kPYsfdofGqm0eMBVv83CuUWyvoRUcLjyh6OO814+8OkjkH
	jjYL/EUwcRqU89/YTyA3rGMj8a+an7IukM4VtgsI0CNLSFScIdGsybe2KxUtK4zIaSB6
	PsJvQiE6sEW61Iu1Kl+LKCzMxkQkWxqDBUkUnzpuqnoyrZjQMBsKFa4AgQ6MDa0lRThW
	1r1LGEVzPNq8RazCe36Fax0I8XIBdZDmnn03gMDhQyGfr/Bd5XXXogE4usG6xJgEw0Km
	vznZbncOf2OOVeQZaJXtF6wlJiAHb0dPiJrrvp9QbeE1KntfWFG7gWVfRKgTt7gNP5BD
	zJxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id;
	bh=aQz/8h2uYd2X6UEJsDW57vf9nPnG/btwZlv4N219hp0=;
	b=WLK4A+lsByUg5trfMjU5EpxlPRoFu32P7hYcAidNMYiAFiwUJHp2OcoBhu1IYwacAD
	UWBUWITfLDwtqNmuua3O10hgjIGg2qahxxswqD+uj7B3xjoNWWFCfRNoWaPW3hH2g6lA
	uqGhgU8mpBIVFEK7HgQx4Pr9ftFYnYRWJaJjWt1/YqtnPj2o10t1ZzfqThvgjB/bpc4s
	Z8zkDNfmnTAKscz0xIoM1LoievXRHicgpsi1/KWF4EZDW1s0MOyf0xRR5t3FZJJk9Nhl
	Gwqpb7WBTD7Q+vm510+Ul6CG1A9VS1CFA1PaGyon0BfMq0RaB3WdIAi1nki8y/vWSsW0
	LMhw==
X-Gm-Message-State: APzg51CPVKbbXjc43m9q4V0W3axGW+DlgJMr/YsoDiP9teKbKruq+Yu6
	qyCIxmnX5vjmLnxIOcYcFkEzA3gXR14=
X-Google-Smtp-Source: ANB0VdYyE+vG1Y2wmozaDBWODz+yrut+KxOmvl8t3LvCgGw1bvPZIySGMJ3Rfv+Xea5C7zEZajebHA==
X-Received: by 2002:a5d:5009:: with SMTP id
	e9-v6mr11798716wrt.18.1535726507838; 
	Fri, 31 Aug 2018 07:41:47 -0700 (PDT)
Received: from flashheart.burtonini.com (35.106.2.81.in-addr.arpa.
	[81.2.106.35]) by smtp.gmail.com with ESMTPSA id
	l18-v6sm7665167wru.75.2018.08.31.07.41.46
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Fri, 31 Aug 2018 07:41:47 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 31 Aug 2018 15:41:44 +0100
Message-Id: <20180831144144.5038-1-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
Subject: [PATCH] phoronix-test-suite: add dependency on lsb_release
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
X-List-Received-Date: Fri, 31 Aug 2018 14:41:47 -0000

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 .../recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
index b9401f2790..b1fa51bf03 100644
--- a/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
+++ b/meta-oe/recipes-benchmark/phoronix-test-suite/phoronix-test-suite_8.0.1.bb
@@ -29,7 +29,7 @@ do_install() {
 SYSTEMD_AUTO_ENABLE = "disable"
 SYSTEMD_SERVICE_${PN} = "phoromatic-client.service phoromatic-server.service"
 
-RDEPENDS_${PN} += "bash python php-cli util-linux-lscpu os-release"
+RDEPENDS_${PN} += "bash python php-cli util-linux-lscpu os-release lsb"
 
 FILES_${PN} += " \
     ${datadir}/phoronix-test-suite \
-- 
2.11.0


