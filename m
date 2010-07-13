Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.ranaldo@gmail.com>) id 1OYgLX-0001Iq-Gy
	for openembedded-devel@lists.openembedded.org;
	Tue, 13 Jul 2010 16:20:51 +0200
Received: by wye20 with SMTP id 20so4663188wye.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 13 Jul 2010 07:15:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=506fEYUe6ZPPYNMYkFB2OMV+yBgq4iv8piEGO5YfzRI=;
	b=esyf4nKjqQADgyfdXKWT5BzwZcUOf2YaiBDraBzfd7GBondi1lhx38Mm7xJbst4Mi+
	+I5A6G2nC6kRLYexOm/wtf87TdlVjHKzxE9XjNn6a44T5XYFGwMAFZxLXUleU7YTci7V
	vHjP8xcBpGro3DYTUWGgDLndggwtmWCLj3sOk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=kYRyE+Yg+hdsYdm1V0bQOYpfO6W43FCGl0+TkFAc81u4BMHmK1CRUcMHWBvQ87hOje
	HDbwLmbS+xOakWJEkeDZ1bcoqvXMXX2QRvK5ECrR3hFqB3gewXut/CB6wa1jWWhbhGKl
	elP3sfIIi+1KWKylR1TI9P7fU4VLret34/w10=
Received: by 10.227.138.5 with SMTP id y5mr327868wbt.204.1279030528273;
	Tue, 13 Jul 2010 07:15:28 -0700 (PDT)
Received: from localhost.localdomain ([192.132.34.244])
	by mx.google.com with ESMTPS id a27sm39821980wbe.0.2010.07.13.07.15.27
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 13 Jul 2010 07:15:28 -0700 (PDT)
From: Nicola Ranaldo <nicola.ranaldo@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 13 Jul 2010 16:08:56 +0200
Message-Id: <1279030137-30479-1-git-send-email-nicola.ranaldo@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: nicola.ranaldo@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] libgpsbt_0.1: adding dbus-glib to DEPENDS
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
X-List-Received-Date: Tue, 13 Jul 2010 14:20:53 -0000
X-List-Received-Date: Tue, 13 Jul 2010 14:20:53 -0000

---
 recipes/maemo4/libgpsbt_0.1.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/maemo4/libgpsbt_0.1.bb b/recipes/maemo4/libgpsbt_0.1.bb
index c6c6ea6..a41501e 100644
--- a/recipes/maemo4/libgpsbt_0.1.bb
+++ b/recipes/maemo4/libgpsbt_0.1.bb
@@ -2,7 +2,7 @@ LICENSE = "nokia"
 
 PR = "r2"
 
-DEPENDS = "libgpsmgr dbus"
+DEPENDS = "libgpsmgr dbus dbus-glib"
 
 # This is proprietary software in Chinook, so we have to stay with the last released
 # free version.
-- 
1.7.0.4



