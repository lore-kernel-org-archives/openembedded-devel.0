Return-Path: <martin.jansa@gmail.com>
Received: from mail-we0-f175.google.com (mail-we0-f175.google.com
	[74.125.82.175])
	by mail.openembedded.org (Postfix) with ESMTP id C21CB70671
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 15:28:25 +0000 (UTC)
Received: by mail-we0-f175.google.com with SMTP id t60so9334561wes.34
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Jul 2014 08:28:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id;
	bh=W23peoqMnNfWQIKurr7KO7uNU84jBAoWnUrge2l2kZA=;
	b=kFmZOTE+2PxvLt+OQs8akafr0gyrmphl6VMqIW3ouM0MtkP0JVSyxFt5qH3eaR5S/x
	mI0wFbB4DNnMZtFW3DJD9MS2cqn8tVCimHN9nL3GdpKP8gPVpa9VUnI7AXjfogFws3a0
	UCZjLK2/o7nNB1rfzgoVkT9Ax8RMeOyM0+Q0WvNh5xp6+hovJ8AGb18FK48tnv1E9mxT
	voId7+Am9Q3BwQEzEIo4Q/l3BaTxhsz85T23ZkdoLXK8huPqfcD6fySjLeTo0yk72lcz
	Z15+ZRUp7zhyRuPFQa6bv98DuzUdwIfWtDTsqPV3EslO2TMI5KtsqwMcqqnd4s2paYWS
	xGBg==
X-Received: by 10.194.87.97 with SMTP id w1mr35181290wjz.42.1406042906191;
	Tue, 22 Jul 2014 08:28:26 -0700 (PDT)
Received: from localhost (ip-89-176-104-3.net.upcbroadband.cz. [89.176.104.3])
	by mx.google.com with ESMTPSA id
	fw4sm3755443wib.19.2014.07.22.08.28.25 for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jul 2014 08:28:25 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 22 Jul 2014 17:28:40 +0200
Message-Id: <1406042920-15233-1-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 2.0.2
Subject: [meta-oe][PATCH] snort: move files from 'files' to 'snort' for faster lookup
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 22 Jul 2014 15:28:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../snort/{files => snort}/0001-libpcap-search-sysroot-for-headers.patch  | 0
 .../snort/{files => snort}/disable-dap-address-space-id.patch             | 0
 .../recipes-connectivity/snort/{files => snort}/disable-inaddr-none.patch | 0
 meta-networking/recipes-connectivity/snort/{files => snort}/snort.init    | 0
 4 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-networking/recipes-connectivity/snort/{files => snort}/0001-libpcap-search-sysroot-for-headers.patch (100%)
 rename meta-networking/recipes-connectivity/snort/{files => snort}/disable-dap-address-space-id.patch (100%)
 rename meta-networking/recipes-connectivity/snort/{files => snort}/disable-inaddr-none.patch (100%)
 rename meta-networking/recipes-connectivity/snort/{files => snort}/snort.init (100%)

diff --git a/meta-networking/recipes-connectivity/snort/files/0001-libpcap-search-sysroot-for-headers.patch b/meta-networking/recipes-connectivity/snort/snort/0001-libpcap-search-sysroot-for-headers.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/snort/files/0001-libpcap-search-sysroot-for-headers.patch
rename to meta-networking/recipes-connectivity/snort/snort/0001-libpcap-search-sysroot-for-headers.patch
diff --git a/meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch b/meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/snort/files/disable-dap-address-space-id.patch
rename to meta-networking/recipes-connectivity/snort/snort/disable-dap-address-space-id.patch
diff --git a/meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch b/meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
similarity index 100%
rename from meta-networking/recipes-connectivity/snort/files/disable-inaddr-none.patch
rename to meta-networking/recipes-connectivity/snort/snort/disable-inaddr-none.patch
diff --git a/meta-networking/recipes-connectivity/snort/files/snort.init b/meta-networking/recipes-connectivity/snort/snort/snort.init
similarity index 100%
rename from meta-networking/recipes-connectivity/snort/files/snort.init
rename to meta-networking/recipes-connectivity/snort/snort/snort.init
-- 
2.0.2


