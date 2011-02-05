Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PlrAy-0007me-Lr
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 00:04:20 +0100
Received: by wwi17 with SMTP id 17so3385378wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 05 Feb 2011 15:03:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer;
	bh=X1hQ+bwbfCMBBIhN34VGFVePGgZlw2NxYCQ2P4VwB7c=;
	b=sQiEoXUP9ri5AirtujAl/hGClPeRNRzqKcr+dCyGJBmjCFzNznVH1wS9feYD7UPzZS
	CsjBqY0cy4BlQSllphtot3C/hgLj8MZi7fczaYyEVZQMFaICNlbD4qBDVXRaUraFaMwA
	3fAkh3Uqmn83wvjMWM52wpmKQMmy/31QBMTV4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer;
	b=faBxEfHip3H8AzRcwPipA3cbwcWthCUNJC4uFn8aO0RdbculMQiu/kuXBlFMwl36k0
	U2TOT9SRPYw28Ws79F0e/sbAbyIuKsdfDAV+umD8lrM/3s0T467WCL0m1ku5kTB0FXvn
	Oa1FWPRDE+NEkZ3PUc8mLyb2jzyCHcsOfBzro=
Received: by 10.216.173.82 with SMTP id u60mr12040708wel.0.1296947001311;
	Sat, 05 Feb 2011 15:03:21 -0800 (PST)
Received: from localhost.localdomain ([188.165.206.204])
	by mx.google.com with ESMTPS id b54sm1271429wer.21.2011.02.05.15.03.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 05 Feb 2011 15:03:20 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Feb 2011 00:03:09 +0100
Message-Id: <1296946989-20663-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
Subject: [PATCH] rootfs_deb.bbclass: removed $(( ... )) operator usage.
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
X-List-Received-Date: Sat, 05 Feb 2011 23:04:20 -0000

Bitbake's pyshlex.py cannot parse it raising NotImplementedError in
line 295 (bitbake @ c8d8388ce9662574a390be3b849c07d1b044275d).
---
 classes/rootfs_deb.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/rootfs_deb.bbclass b/classes/rootfs_deb.bbclass
index e077127..59072aa 100644
--- a/classes/rootfs_deb.bbclass
+++ b/classes/rootfs_deb.bbclass
@@ -35,7 +35,7 @@ fakeroot rootfs_deb_do_rootfs () {
 		echo "deb file:${DEPLOY_DIR_DEB}/$arch/ ./" >> ${STAGING_ETCDIR_NATIVE}/apt/sources.list.rev
 		(echo "Package: *"
 		echo "Pin: release l=$arch"
-		echo "Pin-Priority: $((800 + $priority))"
+		echo "Pin-Priority: $(expr 800 + $priority)"
 		echo) >> ${STAGING_ETCDIR_NATIVE}/apt/preferences
 		priority=$(expr $priority + 5)
 	done
-- 
1.7.1



