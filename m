Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1QBlnW-0007Fd-UI
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Apr 2011 12:35:14 +0200
Received: by mail-fx0-f47.google.com with SMTP id 19so3317697fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Apr 2011 03:32:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=0MeZAIhwZHYdCW345Yen0iEbwzSknCJDNYMXQLunLn0=;
	b=J7f1rvrwmJ7nbbmtcJi+4YIvm+oY7G23naaYVweuH3Na6caexriG9fiqWwhE347//m
	5jMcXWGxVjtdsxv1JHqzmJF6z/EWO9LAY+8nKyIeZAga18KOU2yNhiV83phEuOdREcV9
	uix/MaOq6Nh4vb0fOMV5RSMJ+oISs71IDn7oQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=co3d+EffAzjpSWcJ1+zMowWd0jos05OVznCuMK8XKNm93xeey4efMxrKHmImXqN9dj
	O0hxovrUha//l0V7FDgNhEkevGfDUHYEfVwm97LVlKu69aSlfVZ8lS+JZzCv+8Z5jNGy
	URizjuKEfXDSyCWWaa4NYgS+gpJ0iu339YQZs=
Received: by 10.223.24.206 with SMTP id w14mr32341fab.134.1303122776420;
	Mon, 18 Apr 2011 03:32:56 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id j12sm1622882fax.33.2011.04.18.03.32.55
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 18 Apr 2011 03:32:55 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 18 Apr 2011 12:32:49 +0200
Message-Id: <f09b3426b3ee2df5885ce1041303290aee0805ea.1303122650.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.5.rc1
In-Reply-To: <cover.1303122650.git.Martin.Jansa@gmail.com>
References: <cover.1303122650.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 02/13] xserver-common: add fbset to RDEPENDS
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
X-List-Received-Date: Mon, 18 Apr 2011 10:35:15 -0000

* used by xserver-common script to find out geometry

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../xserver-common/xserver-common_1.34.bb          |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
index 8269205..b994dfb 100644
--- a/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
+++ b/meta-oe/recipes-graphics/xserver-common/xserver-common_1.34.bb
@@ -2,8 +2,8 @@ DESCRIPTION = "Common X11 scripts and support files"
 LICENSE = "GPL"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
-RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo"
-PR = "r0"
+RDEPENDS_${PN} = "xmodmap xrandr xdpyinfo fbset"
+PR = "r1"
 
 PACKAGE_ARCH = "all"
 
-- 
1.7.5.rc1



