Return-Path: <yevgenyp@pointgrab.com>
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
	[209.85.208.172])
	by mail.openembedded.org (Postfix) with ESMTP id 020D47982B
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  7 Sep 2018 18:10:18 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id y17-v6so12967803ljy.8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 07 Sep 2018 11:10:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=pointgrab-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:cc:subject:date:message-id;
	bh=YeoMyY7SX0mQE539h7LXo6P8DR+sC5XlujEpjyZbfqI=;
	b=AbC0t57mtMRofW2uVtbeom5VvWIfmroB64i07Ctqg39UBYlb4PVdFQLHhmA/Enpemh
	0MvrgdnIT9+dqNFCMbO7kd25NiujDChHxNzCCndPMsSurRgq3gPeOUSGf4UNIbD9CS5+
	1XUhaIAN62C0hEyOmPo2Qgre91Lapqf1gq4LSrTQlcm05GbYIdZBWikhD8LDLScdNnSx
	Mm55iz/3LawLCc2ducsRsXZ3jdSusYwPpCGjZh82B/wdFd4TH1fsi6st5EmSVEfrBGu9
	8f9O6nJE1Z8ieHQkoMA29OYjfvhh5NSmLmGO/ZufKhLBt8TCwR//Qz4ahpu3qEsDnhsc
	VtGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=YeoMyY7SX0mQE539h7LXo6P8DR+sC5XlujEpjyZbfqI=;
	b=IIQ0O/6yLJCE/BMapn4y5UZMvXXdlgQ9zWwLV4Bv7jYjvl7eLQjZYKe69w57t0AkMm
	ZoRJgzf3D+J47l6fgRJ5rEvLDVOimLhuzYLdaJR+x1LyhVZO1eeiUmg/4PLNJI4+MPzp
	H/FLMgIuZA94VOUKASOOmItk4Q6CHZpxgSve8neFGa6nzb/L/NUkvtU1BgGRwROLGIuB
	ZJaFaiUZH9aZcJIbiitPtVhxtYCBpMCdwjG9L82KqNhLYMSflpKbmBiJWuNqxqwoNLaG
	0+TUT+nn2s86dWfb1M33rvQ6QBMEr7DdyQx/KYJchkonNdu8kejDww9ye9sJSvqRUEa4
	fDPg==
X-Gm-Message-State: APzg51D1EMC7BD0Z2RzVBc8IMvgG9Q7AOSSBcuWlAPOvsHC5k5F3NGEe
	GJqLa1G8cS2yaz21jya30XIL972HxwI=
X-Google-Smtp-Source: ANB0VdZmhiCEo2WngOqnkGPsfvjqHVaEO9w8rmUBIqu3SnU7Wv2UZSvuXNgNucxu3UVfw2ltb0F0rg==
X-Received: by 2002:a2e:6c17:: with SMTP id
	h23-v6mr3416420ljc.81.1536343819268; 
	Fri, 07 Sep 2018 11:10:19 -0700 (PDT)
Received: from yevgeny-lnx.localdomain ([77.222.132.139])
	by smtp.gmail.com with ESMTPSA id
	j24-v6sm1391050lfb.62.2018.09.07.11.10.18
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 07 Sep 2018 11:10:18 -0700 (PDT)
From: Yevgeny Popovych <yevgenyp@pointgrab.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  7 Sep 2018 21:10:07 +0300
Message-Id: <1536343810-87649-1-git-send-email-yevgenyp@pointgrab.com>
X-Mailer: git-send-email 2.7.4
Cc: andre.draszik@jci.com
Subject: [meta-java][PATCH 0/3] ca-certificates-java: Fix usage as a native tool, do_rootfs failure
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
X-List-Received-Date: Fri, 07 Sep 2018 18:10:19 -0000

This series fixes several issues with ca-certificates-java:
* when used as a native tool
* failure on do_rootfs

This doesn't fix all the issues and there is definitely a room for improvement.
I presume that running it on the target doesn't work - at least ${sysconfdir} is
not expanded in the hook.
I also think that will be best to drop create-ca-certificates-java usage in
the postinst and let it be called as a hook of ca-certificates. This will allow
us to remove some code and simplify both script and recipe.

It would be great if others could test their use cases;
and clarify them - is create-ca-certificates-java really needed?.

Yevgeny Popovych (3):
  ca-certificates-java: Fix sysconfdir for -native recipe
  ca-certificates-java: Don't fail when called via hook on do_rootfs
  ca-certificates-java: Distinguish between SYSROOT and D

 .../ca-certificates-java.hook.in                   | 23 +++++++++++-----------
 .../ca-certificates-java_20180516.bb               | 11 ++++++++---
 2 files changed, 19 insertions(+), 15 deletions(-)

-- 
2.7.4


