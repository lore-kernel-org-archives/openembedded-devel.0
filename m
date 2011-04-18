Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBloh-0007Fg-K6
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:36:27 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317704fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:34:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=V6FTX7EUJWGtGIDUFpF02YNDkfG65GiJgQgxtexN6+c=;
	b=SYSRniTFyaFZ7KsAsz455BruURYhnt0PSCcqna8LTO/bHFiulkAV8fR50mapwhwxFj
	GRHC+qymrK8Nphr3VDj6zCJoTucoze7nQIfBzsKCxfjDJgYZLRbayEdZkhQGdo5VDEHh
	UwPlQx0UWP+QHnen9bGLgR1ARQxLL6EKZGOA4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=NUEFMxggUBTL84YILcpylehIZ8JCfDx4DKOrnsFR1KDn5RX4KpIqKDQ1xKXVCyr5QK
	CPwoQ4bS996TvYYJQjbc1CBZopjRc2J1SuT7UedzTLiL+t+BBaKKhbpjhPUAEbogDzoV
	eKLeVqRfn+/hn534ZWQGNAMjAEW9TOPnUG4YY=
Received: by 10.223.74.83 with SMTP id t19mr4781194faj.149.1303122849727;
	Mon, 18 Apr 2011 03:34:09 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id c21sm1622507fac.46.2011.04.18.03.34.08
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:34:09 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:34:03 +0200
Message-Id: <22fd4e659f49ecbdd706a2bf670ef5a1aa0b5cf5.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 11/13] xorg-driver-common: depend on virtual/xserver-xf86 as oe-core drivers does
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
X-List-Received-Date: Mon, 18 Apr 2011 10:36:27 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xorg-driver/xorg-driver-common.inc             |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc b/meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
index 970b0d1..c0f4a15 100644
--- a/meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
+++ b/meta-oe/recipes-graphics/xorg-driver/xorg-driver-common.inc
@@ -4,7 +4,7 @@ SECTION = "x11/drivers"
 LICENSE = "MIT-X"
 INC_PR = "r15"
 
-DEPENDS = "randrproto xorg-server xproto"
+DEPENDS = "randrproto virtual/xserver-xf86 xproto"
 
 SRC_URI = "${XORG_MIRROR}/individual/driver/${BPN}-${PV}.tar.bz2"
 
-- 
1.7.5.rc1



