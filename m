Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1Q7RC1-0003b1-4U
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Apr 2011 13:46:37 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so1044407fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Apr 2011 04:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=XYAGPbm4xrf8oKTKX6qJL+/wALsmjXywQi/YUN7oZvg=;
	b=MkLgMzw96TxACMT9FmUfB+WkEoew/GvUS6999kUTXdUQSXo/yIPHsUfOdginmfteVY
	dKtfFwyH8wOGL3EF0Skt/1pjQBU9YQuGu3yYUB89F/MpAuhnzjo8IEb5OxGHkgTmHPcK
	4wGz1mSBIOD2ca/4882zAsL9/g+r3KwBkr/AA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=XCWRrpxYNRSE3454FRxJiVMMQKVSTctZSie5PVJ1u4879Q6HvP6fcPzdu5JMgt5k2j
	GDnrTMCHKvn4i0wO3y5YGaw/FM082j0I0PQExYtX3/Za11saLDP2xrKK16kcrox0fFP9
	bmCKDdw1pMrRwLNnmB/S0tIaszG9dwYb1V21Q=
Received: by 10.223.72.132 with SMTP id m4mr946890faj.86.1302090272740;
	Wed, 06 Apr 2011 04:44:32 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 21sm162351fav.17.2011.04.06.04.44.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 06 Apr 2011 04:44:32 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed,  6 Apr 2011 13:44:06 +0200
Message-Id: <1302090248-16251-4-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.4.1
In-Reply-To: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
References: <1302090248-16251-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH 3/5] xorg-driver-common: bump INC_PR to rebuild drivers against new ABI from xserver-1.10
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Apr 2011 11:46:37 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 recipes/xorg-driver/xorg-driver-common.inc |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/xorg-driver/xorg-driver-common.inc b/recipes/xorg-driver/xorg-driver-common.inc
index 53b499e..f7878a9 100644
--- a/recipes/xorg-driver/xorg-driver-common.inc
+++ b/recipes/xorg-driver/xorg-driver-common.inc
@@ -2,7 +2,7 @@ DESCRIPTION = "X driver"
 HOMEPAGE = "http://www.x.org"
 SECTION = "x11/drivers"
 LICENSE = "MIT-X"
-INC_PR = "r15"
+INC_PR = "r16"
 
 DEPENDS = "randrproto xorg-server xproto"
 
-- 
1.7.4.1



