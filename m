Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <hvontres@gmail.com>) id 1NaMHm-0003fx-IW
	for openembedded-devel@lists.openembedded.org;
	Thu, 28 Jan 2010 05:47:21 +0100
Received: by ywh33 with SMTP id 33so339728ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 27 Jan 2010 20:44:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=DbCMxmheeoF6UswsL/ESidbWPjdcdjwzVhaCy4gv28s=;
	b=xbo6rZSqWJwElYMgLEwMJT6CwybdMSlsfa8b3oexP+eBY7ypVehxaCKATQZtpT7SdG
	6QWoXg8vp0ge+FCuH9GWV3Vi2DzyDHZ9BVRriRle1IihCg5vjCNIvr/De++e9EveTcPl
	z1kqY15LSmxA+s1Vq32dYdCqh8D3AKUCZTUoc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=WuE28FxPfvnNQUxn3D1ZL+j3cHxXVsy7g0jWbgCfKg8uihxXYvRoIWdfrCAsfkB5Gw
	BB4FO4eGWN33EWQ/XecKPgHIe7p5BZl5KT+fgpX/XMVzUOxzdomAU1jX742o8DgGB3sd
	OGFDuDzAar7fI0CoQWCe8mv5gRXJaRlykpO2A=
Received: by 10.151.1.19 with SMTP id d19mr7309694ybi.189.1264653895538;
	Wed, 27 Jan 2010 20:44:55 -0800 (PST)
Received: from localhost (adsl-75-7-226-176.dsl.sndg02.sbcglobal.net
	[75.7.226.176])
	by mx.google.com with ESMTPS id 4sm217607ywg.13.2010.01.27.20.44.54
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 27 Jan 2010 20:44:54 -0800 (PST)
From: Henry von Tresckow <hvontres@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 27 Jan 2010 20:44:44 -0800
Message-Id: <1264653884-16351-1-git-send-email-hvontres@gmail.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.211.195
X-SA-Exim-Mail-From: hvontres@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: [PATCH] initramfs-kexecboot-image : Unset FEED_DEPLOYDIR_BASE_URI to allow builds with local feeds
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
X-List-Received-Date: Thu, 28 Jan 2010 04:47:21 -0000

Having FEED_DEPLOYDIR_BASE_URI set in local.conf was causing recipie to not build

Signed-off-by: Henry von Tresckow <hvontres@gmail.com>
---
 recipes/kexecboot/initramfs-kexecboot-image.bb |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/recipes/kexecboot/initramfs-kexecboot-image.bb b/recipes/kexecboot/initramfs-kexecboot-image.bb
index 890287d..285640d 100644
--- a/recipes/kexecboot/initramfs-kexecboot-image.bb
+++ b/recipes/kexecboot/initramfs-kexecboot-image.bb
@@ -23,5 +23,5 @@ IMAGE_LOGIN_MANAGER = ""
 IMAGE_INIT_MANAGER = ""
 IMAGE_INITSCRIPTS = ""
 IMAGE_DEV_MANAGER = ""
-
+FEED_DEPLOYDIR_BASE_URI = ""
 inherit image
-- 
1.6.3.3



