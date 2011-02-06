Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pm6sJ-0002VQ-5r
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Feb 2011 16:50:07 +0100
Received: by wwi17 with SMTP id 17so3748863wwi.24
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Feb 2011 07:49:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references:to;
	bh=dKmcSphaRZtjHUvLWVgZ7fcRi75WO0100Fvtzjwr8ZM=;
	b=osEjzDv8QbV0T0PwTTuGAL6D/ROSUUj0asiNGjX3/XGskAzLJ82M0CcrpsenkDzfev
	MszVpl6NjHZQczlgFgujRtMBuxi3DdQxIelpzzYGN3DqpIKGH/dAfZ5Z30bBna08ixb6
	ymZSZXpag8dst+jMZLpooJJOd5USuoG4oPCVU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=LW+zsi7o+qmpDCcYFBVy5CIEmUFS4TLxGQOyNtlf54uGrdVR9n36RjuIcn7dpMHYSZ
	s80GQbqBlz+vAan5J/iZhSH/eKLdKg1OhwoqGDxu6PvKTew5z+QpE97fQpjVfJcENJGe
	DZbOWuLMAhUfDH24Ktc0CZ+D9NGEc75yqdaCc=
Received: by 10.227.136.66 with SMTP id q2mr1700685wbt.58.1297007347091;
	Sun, 06 Feb 2011 07:49:07 -0800 (PST)
Received: from localhost.localdomain ([188.165.206.204])
	by mx.google.com with ESMTPS id x1sm2481089wbh.20.2011.02.06.07.49.05
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 06 Feb 2011 07:49:06 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun,  6 Feb 2011 16:48:56 +0100
Message-Id: <1297007336-3248-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1296946989-20663-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1296946989-20663-1-git-send-email-filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH v2] rootfs_deb.bbclass: removed $(( ... )) operator usage.
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
X-List-Received-Date: Sun, 06 Feb 2011 15:50:07 -0000

Bitbake's pyshlex.py cannot parse it raising NotImplementedError in
line 295 (bitbake @ c8d8388ce9662574a390be3b849c07d1b044275d).

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
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



