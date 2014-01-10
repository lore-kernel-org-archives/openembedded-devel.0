Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f180.google.com (mail-wi0-f180.google.com
	[209.85.212.180])
	by mail.openembedded.org (Postfix) with ESMTP id 903E56B5D8
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 07:07:15 +0000 (UTC)
Received: by mail-wi0-f180.google.com with SMTP id hn9so910514wib.13
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Jan 2014 23:07:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=qPgx3ZuUCX222BQhtOlzpwmFVzUzUjYHpn07Fg1XfiY=;
	b=KkaXjqYhuPB/Jyrp62q83luJxx6ztg8bvdrwXaHqH5kVwd5WNpVZHW1tjgQtIEQCPb
	Q1qwaF4sCclZs5xBOfRl+lZ470sigMfl38BjQmveLP2ZpD0XX+EMO8jZOMjAxEQRKcN5
	S2cH4H2Hk8N0/AJO9HbrJAwBz8t0idyORVIX69x5/huQyp+XMIs5wvI7b+L0IcpQaOfG
	5zjyUv+zn/xSJ3V6cPEMik701ShCNqeX4noQBe43iJ8CmXmiTgDSGAXO4NRtGdaQBdng
	CO32+WuoZ8NI19EYJmbXRPWbKKbVHpa2BsmjuJSL/gbWINvhNhgihaTwFAKrfSZB2wln
	3EoA==
X-Gm-Message-State: ALoCoQk3IIRG1WSosf8KXvfS/vF555Nljv64afEVyFd8ik5YxqIETmTI7LZS9yx0rek2JiXkV3KS
X-Received: by 10.180.13.242 with SMTP id k18mr1093506wic.44.1389337636201;
	Thu, 09 Jan 2014 23:07:16 -0800 (PST)
Received: from localhost ([2001:610:612:0:223:32ff:fece:c738])
	by mx.google.com with ESMTPSA id cx3sm1919232wib.0.2014.01.09.23.07.15
	for <multiple recipients>
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 09 Jan 2014 23:07:15 -0800 (PST)
From: Koen Kooi <koen@dominion.thruhere.net>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 10 Jan 2014 08:07:09 +0100
Message-Id: <1389337631-1844-2-git-send-email-koen@dominion.thruhere.net>
X-Mailer: git-send-email 1.8.4.2
In-Reply-To: <1389337631-1844-1-git-send-email-koen@dominion.thruhere.net>
References: <1389337631-1844-1-git-send-email-koen@dominion.thruhere.net>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: [meta-oe][PATCH 2/4] apcupsd: fix configure failure
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
X-List-Received-Date: Fri, 10 Jan 2014 07:07:16 -0000

configure looks in host paths for X, so disable X. This fixes:

	ERROR: This autoconf log indicates errors, it looked at host include and/or library paths while determining system capabilities.

Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
---
 meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
index 5ab92fc..07b8ccb 100644
--- a/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
+++ b/meta-oe/recipes-support/apcupsd/apcupsd_3.14.10.bb
@@ -11,7 +11,8 @@ inherit autotools
 
 LD = "${CXX}"
 
-EXTRA_OECONF = "--enable-usb \
+EXTRA_OECONF = "--without-x \
+                --enable-usb \
                 --with-distname=${DISTRO}"
 
 do_configure() {
-- 
1.8.4.2


