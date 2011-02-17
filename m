Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1PqABU-00062n-66
	for openembedded-devel@lists.openembedded.org;
	Thu, 17 Feb 2011 21:10:40 +0100
Received: by fxm17 with SMTP id 17so2836624fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Feb 2011 12:09:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=NfWB4H9uKNOpJNqr8cBOaJi0lUUUfQvWvvlV8PViB8c=;
	b=mZdgl4F5R+kiRAWPWFmtogOp97ykPcgsn1/oaKvG0wEd6uqTdHRfUnQKQInWxAkkTF
	MKlIcokq5AtvUFCR/UWov6lRs5bjgP3BKVlVphkzP99T9Uru/Vc3XLZknH+spHNYlDed
	EHXo29Z/8+NsO9kbqMhm9/71XPPfwOaoMGv10=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=wpK905C2vA0Ibq0lEZvodg7jnLAnV2/t8Cmm3z0NrTr2Jnqic17uCuUqwgZsR8+F/j
	SgUc1T4RxCAx+PnpWHtYAA+v4YQ9BTLO7YP0UBZIODUKhNYpA2I7M1iMjuzklFAEXUDG
	QCWrznOE+1W8p/G8JGxj1hzBSARs1Nzzd8Eag=
Received: by 10.223.87.1 with SMTP id u1mr2913885fal.112.1297973366621;
	Thu, 17 Feb 2011 12:09:26 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id r24sm679920fax.3.2011.02.17.12.09.25
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 17 Feb 2011 12:09:25 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Feb 2011 21:09:16 +0100
Message-Id: <1297973356-24903-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <AANLkTikjzq=jS=+RTpZ=uxeA_5++CfZT3RetB9et29nS@mail.gmail.com>
References: <AANLkTikjzq=jS=+RTpZ=uxeA_5++CfZT3RetB9et29nS@mail.gmail.com>
Subject: [PATCH] kernel.bbclass: fix retrieving dependencies between modules.
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
X-List-Received-Date: Thu, 17 Feb 2011 20:10:40 -0000

get_dependencies() searched for a filename key in dependencies
directory with the /lib/modules/kernel_version prefix while
the directory had entries stripped of it.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/kernel.bbclass |    7 ++++++-
 1 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index e22211d..3642a53 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -385,7 +385,12 @@ python populate_packages_prepend () {
 		return deps
 	
 	def get_dependencies(file, pattern, format):
-		file = file.replace(bb.data.getVar('PKGD', d, 1) or '', '', 1)
+		prefix = os.path.normpath(os.path.join(
+			os.path.join(bb.data.getVar('PKGD', d, 1) or ''),
+			'lib/modules',
+			bb.data.getVar('KERNEL_VERSION', d, 1)
+		)) + '/'
+		file = file.replace(prefix, '', 1)
 
 		if module_deps.has_key(file):
 			import re
-- 
1.7.1



