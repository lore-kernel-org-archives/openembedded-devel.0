Return-Path: <ross.burton@intel.com>
Received: from mail-wr0-f173.google.com (mail-wr0-f173.google.com
	[209.85.128.173])
	by mail.openembedded.org (Postfix) with ESMTP id 4130477E8F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 15:11:29 +0000 (UTC)
Received: by mail-wr0-f173.google.com with SMTP id r103so146319214wrb.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 08:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=ZvcPFrQhu0hjFo0642tmUdX18YqPw6lJ0Iz6H9PYqoA=;
	b=pdQ9f0kscTg1uK9uHUOekoNiPCiT557V7J8HGPIXEApSGrz1zDsLQ/5FC8tnOtYXOV
	9pEMh+bpVURnXCIKI9VhHMi392fUUen/TzkVCQoq4KuTES8oPhvbw+0JdOUtx+ARwV1J
	sNfaxNXk9Xq8H6ucejaeCresGb5JdF3A4hTA4hZ/x9WHuB2AZrYeeu0kFyII3HFUeqTn
	gg+Nk7AGDWX0m1VvVd7U9AND2YeWqQCNtEQMv+8mY4o0CLwdEibBFTLy6p3NQIviszsU
	proecp3qqAlFdEpeIi8rJHH2xjpC1OH3NrIkbNhqVNpJ2y9kvK8aMnhs5V1TZNw0K/5D
	z0kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=ZvcPFrQhu0hjFo0642tmUdX18YqPw6lJ0Iz6H9PYqoA=;
	b=Mv2JhtLIdgkbaeDMfeQ/pdcfQEaa1hhC0fbUvyW9734idlO9jrR4ndqNyqUH75ePSJ
	hcgQic4KGirltM5DioH7p2qprhHO9SxnQ7dEo8qavOwWGYA9pP554jguo/AimAg+4i17
	bg5vlLAVxAmmqzdTe8mAZkk1FMqvJH9eIyLfMGKUB/c0KVuigvMQjjw29ZkTfua1xCht
	9nD3DQthlRIVhKPCx5YPtvGvtU/UvAIMWY2dLoEYLuj6SQc3gcn5szA+vFXXawhOj+Nr
	FioaW9rEsk+WGRKqSBGMMLByNksJoZrNuxlxSPuFR/57Q22MZLqLOXrcV4zzBjNuHa8X
	UAew==
X-Gm-Message-State: AKS2vOxFyRZraNWCkqeJ/GurkmrjL5brsSKft+zDWSBhVhmAIbAPN5gN
	orWNJLFs4FSdDl6eZJE=
X-Received: by 10.223.173.143 with SMTP id w15mr13279632wrc.113.1498489890640; 
	Mon, 26 Jun 2017 08:11:30 -0700 (PDT)
Received: from flashheart.burtonini.com (home.burtonini.com. [81.2.106.35])
	by smtp.gmail.com with ESMTPSA id d91sm368379wma.7.2017.06.26.08.11.29
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 26 Jun 2017 08:11:30 -0700 (PDT)
From: Ross Burton <ross.burton@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 26 Jun 2017 16:11:12 +0100
Message-Id: <20170626151117.6221-3-ross.burton@intel.com>
X-Mailer: git-send-email 2.11.0
In-Reply-To: <20170626151117.6221-1-ross.burton@intel.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
Subject: [meta-oe][PATCH 3/8] meson: don't pass localedir
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
X-List-Received-Date: Mon, 26 Jun 2017 15:11:30 -0000

For historic reasons the localedir directory is where binary locales are stored
(/usr/lib/locale) , not where application translations belong (typically,
/usr/share/locale).  Don't pass localedir explicitly, and let Meson use the
default of $datadir/locale to match the behaviour of autotools.bbclass and the
expectations of the system.

Signed-off-by: Ross Burton <ross.burton@intel.com>
---
 meta-oe/classes/meson.bbclass | 1 -
 1 file changed, 1 deletion(-)

diff --git a/meta-oe/classes/meson.bbclass b/meta-oe/classes/meson.bbclass
index 72f96c541..8f384c127 100644
--- a/meta-oe/classes/meson.bbclass
+++ b/meta-oe/classes/meson.bbclass
@@ -27,7 +27,6 @@ MESONOPTS = " --prefix ${prefix} \
               --includedir ${@noprefix('includedir', d)} \
               --mandir ${@noprefix('mandir', d)} \
               --infodir ${@noprefix('infodir', d)} \
-              --localedir ${@noprefix('localedir', d)} \
               --sysconfdir ${sysconfdir} \
               --localstatedir ${localstatedir} \
               --sharedstatedir ${sharedstatedir}"
-- 
2.11.0


