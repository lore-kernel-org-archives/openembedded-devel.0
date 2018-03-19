Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f194.google.com (mail-pf0-f194.google.com
	[209.85.192.194])
	by mail.openembedded.org (Postfix) with ESMTP id 6AE0B7893C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2018 06:03:33 +0000 (UTC)
Received: by mail-pf0-f194.google.com with SMTP id z10so6634321pfh.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Mar 2018 23:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RQgz17oYeDDzsP/AD/TGFbJcg1OOZq+I3U4152uOtug=;
	b=iVL7xjNLuAcVw3y11/Z9KE3NTSYp1As23azwQ6G1RNYGLCNdwXsbejpg9OHYFwHMWd
	2bE1auhjHnbeeoa0cxvXGA/B6x9YSveu8KeAKY4j3m6aoWwpTc/XRbygj8APj/mgFYcG
	u/TvJD0oeS889xLS6k3iNa9FN3N9la0NCvkeSCY0qHuadDLyIaJMSHlV8fLvD/DQVb4u
	cE6R1aVnD9xkDAt7537iFcXA8d/jWgUpH1R5pzG/R+BPNkue6uMdYxKCyj6ochxsSywO
	Ug257J0JmcXQWIEbJ81Fq08Aw3sauVIcx29/oU0VvlSpWxLPmYsG8/MCxdS5bGPBABcd
	diXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=RQgz17oYeDDzsP/AD/TGFbJcg1OOZq+I3U4152uOtug=;
	b=pFALS9s8UG+efXWU6OfwbJ+ZRWSVlnYwo7JAYqEk7yqClR3ezYHg+ZSfQHygkPWBmr
	aFhTEmeuccWcDjLJWEbd/u9pTtjb+jE1WNTLVXFZ89Dztnsa7RFoCw+/YMBg6BVN1Zu7
	ykgFptiNSx5tKvT86nKs6rvLXZ5Cu5uzbkK+aqRAudiHBKFfTMq1T8D369SsyqQUkmZF
	uZWDwfqS3ui3cAxj5CNqLVY/pOpwDs1m+mATJr0tzmatWP3teBqY4LJ3tyGuzd5IAkg6
	zBeB2wbAflHM6uEwhi9eAS59AFlFP1861Wv9NfaHrkR8rcfTMa1k8NwPlnrOESpuG8LJ
	WCtw==
X-Gm-Message-State: AElRT7EP5O80WNLPbNtdYNjxAhN2AF4re96duSefKCg6p2vw5vmga27S
	v2ZMwk4xfeLVFqlcMxwDzwCxgg==
X-Google-Smtp-Source: AG47ELsA43iJxdAkqWBYGtS6TVsnxkuJTuAP7T1tag1MwXbHZT1Q6CU3JT89deVA0wSJ9HR0nv6PyQ==
X-Received: by 10.98.214.218 with SMTP id a87mr1022555pfl.124.1521439414630;
	Sun, 18 Mar 2018 23:03:34 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:8880:466c:6245:cbff:fe64:591])
	by smtp.gmail.com with ESMTPSA id
	a22sm5047426pgw.10.2018.03.18.23.03.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 18 Mar 2018 23:03:32 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 18 Mar 2018 23:02:59 -0700
Message-Id: <20180319060300.5366-17-raj.khem@gmail.com>
X-Mailer: git-send-email 2.16.2
In-Reply-To: <20180319060300.5366-1-raj.khem@gmail.com>
References: <20180319060300.5366-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 17/18] fwknop: Use new config.guess and config.sub
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
X-List-Received-Date: Mon, 19 Mar 2018 06:03:33 -0000

This brings in new architecture support for risc-v

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb b/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb
index 49b11ad33..0fd5f6fed 100644
--- a/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb
+++ b/meta-networking/recipes-support/fwknop/fwknop_2.6.9.bb
@@ -17,6 +17,9 @@ EXTRA_OECONF = " --with-iptables=/usr/sbin/iptables \
                "
 
 do_configure () {
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.guess ${S}/config
+	install -m 0755 ${STAGING_DATADIR_NATIVE}/gnu-config/config.sub ${S}/config
+
 	aclocal
 	libtoolize --automake --copy --force
 	autoconf
-- 
2.16.2


