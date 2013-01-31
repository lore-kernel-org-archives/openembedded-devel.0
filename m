Received: from mail-pb0-f53.google.com ([209.85.160.53])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martin.jansa@gmail.com>) id 1U0uH0-0000OU-Mw
	for openembedded-devel@lists.openembedded.org;
	Thu, 31 Jan 2013 14:34:06 +0100
Received: by mail-pb0-f53.google.com with SMTP id un1so1610256pbc.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 Jan 2013 05:18:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=FlRaKZW4bymTYZzy5V/OsobkjWc7QwXgYydid1pGOvk=;
	b=DW+x8U1MGeQBbHPH5pffAx5tKfn7HFNRn8g1WHDtNN+n/qlG3Al/yvhV4XgJv5hQVG
	VAivBU0aiXYrhciz8OTI017n8n6LU1TpAlQ8Bp5XQbQxQTtVpMWSkm88kn4Xy52QsEbs
	r1RC5YNNU0joltt1FIX4pw9UKPzn6+N2pS5k7ZtRI6RTLJT/TC/QYF9ZmGI/aRvLetjT
	MgKfwSPNprw+RsSfzHrxA0mkW3F9nez+yqnQEDSDVKKRhBzGf606oCzs0zH9LggDEpZa
	SkcmYdPPKjP43IMl0pHCcwzO7sm2fA+YwF+d+org+/iJyFw839w/cMvy6TGyFcPYaw/1
	YquA==
X-Received: by 10.68.137.167 with SMTP id qj7mr21752447pbb.148.1359638287503; 
	Thu, 31 Jan 2013 05:18:07 -0800 (PST)
Received: from localhost (ip-62-24-80-7.net.upcbroadband.cz. [62.24.80.7])
	by mx.google.com with ESMTPS id ot3sm5000069pbb.38.2013.01.31.05.18.04
	(version=TLSv1.2 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Thu, 31 Jan 2013 05:18:06 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 31 Jan 2013 14:17:49 +0100
Message-Id: <1359638269-28437-2-git-send-email-Martin.Jansa@gmail.com>
X-Mailer: git-send-email 1.8.1.2
In-Reply-To: <1359638269-28437-1-git-send-email-Martin.Jansa@gmail.com>
References: <1359638269-28437-1-git-send-email-Martin.Jansa@gmail.com>
Subject: [PATCH][meta-oe][meta-gnome 2/2] midori: add libunique to DEPENDS
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
X-List-Received-Date: Thu, 31 Jan 2013 13:34:09 -0000

Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
---
 meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
index 5b1a959..57de0cc 100644
--- a/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
+++ b/meta-gnome/recipes-connectivity/midori/midori_0.4.7.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "Midori is a lightweight web browser."
 HOMEPAGE = "http://www.twotoasts.de/index.php?/pages/midori_summary.html"
 LICENSE = "LGPLv2.1"
 LIC_FILES_CHKSUM = "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
-DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl python-native python-docutils-native librsvg-native libnotify"
+DEPENDS = "webkit-gtk libsoup-2.4 libsexy openssl python-native python-docutils-native librsvg-native libnotify libunique"
 
 SRC_URI = "http://archive.xfce.org/src/apps/midori/0.4/midori-${PV}.tar.bz2;name=midori \
           "
-- 
1.8.1.2



