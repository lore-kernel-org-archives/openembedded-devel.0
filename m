Received: from [72.14.220.153] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KzAn8-0001yu-R1
	for openembedded-devel@lists.openembedded.org;
	Sun, 09 Nov 2008 14:57:26 +0100
Received: by fg-out-1718.google.com with SMTP id l26so2046481fgb.20
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 09 Nov 2008 05:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer:in-reply-to:references;
	bh=aoq4xTiljOzvDw3E+WM+XqoEBTGDKFjmK3nf2tsAul0=;
	b=hhGEtILUXE3piAxD2/NGOFzBWn+j2BNWSzty/SaIFU4bzp35DMsP+DLkheTdZDOeic
	Y5VGsRHDxnGE/YhnSweke68fNA0dpZMxFPvw2g+YmsJ9wGWjsPk2IqE38ZtQ+EPfUu+s
	9h7q6mR/wKKF+VQw3Y/FcSiuVwztnTKie8g0c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=u0afww7f+b05ldZKRUpvtl9J7aH/PRJUFGw/jmo/jby9R0BU+TrUDqEEmwWfEyqEhP
	Uv7zbe0vciVE/353q5V8n18IAHOMSSU6hYWCd8uA9z9VDJxRU7azQDL5fEdQjetLfZfo
	QX2XExQILUJBxDKmUk4e5h5LkbVK4n9cQIkm4=
Received: by 10.181.218.14 with SMTP id v14mr1730442bkq.111.1226237354962;
	Sun, 09 Nov 2008 05:29:14 -0800 (PST)
Received: from localhost.localdomain (ppp89-110-5-254.pppoe.avangarddsl.ru
	[89.110.5.254])
	by mx.google.com with ESMTPS id l12sm8088339fgb.6.2008.11.09.05.29.12
	(version=SSLv3 cipher=RC4-MD5); Sun, 09 Nov 2008 05:29:13 -0800 (PST)
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  9 Nov 2008 16:28:10 +0300
Message-Id: <1226237296-11012-10-git-send-email-dbaryshkov@gmail.com>
X-Mailer: git-send-email 1.5.6.5
In-Reply-To: <1226237296-11012-9-git-send-email-dbaryshkov@gmail.com>
References: <1226237296-11012-1-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-2-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-3-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-4-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-5-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-6-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-7-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-8-git-send-email-dbaryshkov@gmail.com>
	<1226237296-11012-9-git-send-email-dbaryshkov@gmail.com>
Cc: Dmitry Baryshkov <dbaryshkov@gmail.com>
Subject: [PATCH] x11-sato-image: use correct package names instead of ttf-liberation
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
X-List-Received-Date: Sun, 09 Nov 2008 13:57:27 -0000

Signed-off-by: Dmitry Baryshkov <dbaryshkov@gmail.com>
---
 packages/images/x11-sato-image.bb |    4 +++-
 1 files changed, 3 insertions(+), 1 deletions(-)

diff --git a/packages/images/x11-sato-image.bb b/packages/images/x11-sato-image.bb
index 3516395..0a127f8 100644
--- a/packages/images/x11-sato-image.bb
+++ b/packages/images/x11-sato-image.bb
@@ -1,6 +1,8 @@
 DISTRO_SSH_DAEMON ?= "dropbear"
 DISTRO_PACKAGE_MANAGER ?= "opkg-nogpg opkg-collateral"
 
+XSERVER ?= "xserver-kdrive-fbdev"
+
 IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
 
 IMAGE_INSTALL = "\
@@ -13,7 +15,7 @@ IMAGE_INSTALL = "\
 	matchbox-desktop \
 	${XSERVER} \
 	xserver-kdrive-common xserver-nodm-init \
-	ttf-liberation \
+	ttf-liberation-sans ttf-liberation-serif ttf-liberation-mono \
 	xauth xhost xset xrandr \
 	matchbox-sato \
 	matchbox-config-gtk \
-- 
1.5.6.5



