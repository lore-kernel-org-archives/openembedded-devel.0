Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1S0bBu-0004aY-I1
	for openembedded-devel@lists.openembedded.org;
	Thu, 23 Feb 2012 17:06:46 +0100
Received: by mail-ey0-f175.google.com with SMTP id l10so637175eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Feb 2012 07:58:27 -0800 (PST)
Received-SPF: pass (google.com: domain of martin.jansa@gmail.com designates
	10.213.33.203 as permitted sender) client-ip=10.213.33.203; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of martin.jansa@gmail.com
	designates 10.213.33.203 as permitted sender)
	smtp.mail=martin.jansa@gmail.com;
	dkim=pass header.i=martin.jansa@gmail.com
Received: from mr.google.com ([10.213.33.203])
	by 10.213.33.203 with SMTP id i11mr631151ebd.28.1330012707407 (num_hops
	= 1); Thu, 23 Feb 2012 07:58:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references
	:in-reply-to:references;
	bh=04hDclh2cUi9kRUhD5rF4Nerwqj1hajgMZaR/Fy2Fds=;
	b=tmPHgUY3y8iaaqL2AOmrNee6Ms2B5WkygA9EGdBQBRTqNJTu0uQpgBEZ0J5ozXMLUj
	8pSaYTCrwKVg9uDNLoAM0R3WYn9wjP9o6EuzU7ItG1KA8VMRjqIU4L8RfjvDehCU5FgR
	mF7oh+ML/zxouZhnMeEl2x5ZPGepaZKhf18Jo=
Received: by 10.213.33.203 with SMTP id i11mr497721ebd.28.1330012707121;
	Thu, 23 Feb 2012 07:58:27 -0800 (PST)
Received: from localhost ([94.230.152.246])
	by mx.google.com with ESMTPS id o49sm6717143eeb.7.2012.02.23.07.58.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 23 Feb 2012 07:58:26 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 23 Feb 2012 16:58:02 +0100
Message-Id: <7274c25bf2ddae32a8e5fe1dd60fce6d5b6fea42.1330012507.git.Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.7.8.4
In-Reply-To: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
References: <93f56c062e7a5103f15551808826f76c94779005.1330012507.git.Martin.Jansa@gmail.com>
In-Reply-To: <cover.1330012507.git.Martin.Jansa@gmail.com>
References: <cover.1330012507.git.Martin.Jansa@gmail.com>
Subject: [meta-oe][PATCH 5/7] networkmanager: use systemd_unitdir variable
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
X-List-Received-Date: Thu, 23 Feb 2012 16:06:46 -0000

* maybe we should move systemd_unitdir definition outside systemd.bbclass
  because it's used in few more recipes which doesn't inherit systemd

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 .../networkmanager/networkmanager_0.9.2.0.bb       |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
index 1dcc3cf..38fac08 100644
--- a/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
+++ b/meta-oe/recipes-connectivity/networkmanager/networkmanager_0.9.2.0.bb
@@ -4,7 +4,7 @@ SECTION = "net/misc"
 LICENSE = "GPLv2+"
 LIC_FILES_CHKSUM = "file://COPYING;md5=cbbffd568227ada506640fe950a4823b"
 
-PR = "r2"
+PR = "r3"
 
 DEPENDS = "systemd libnl dbus dbus-glib udev wireless-tools polkit gnutls util-linux ppp"
 inherit gnome gettext
@@ -70,7 +70,7 @@ FILES_${PN} += " \
 		${datadir}/polkit-1 \
 		${datadir}/dbus-1 \
 		${base_libdir}/udev/* \
-        ${base_libdir}/systemd \
+        ${systemd_unitdir} \
 "
 
 RRECOMMENDS_${PN} += "iptables"
-- 
1.7.8.4



