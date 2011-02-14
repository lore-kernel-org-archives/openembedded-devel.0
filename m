Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp4Zl-0002oX-Sk
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 20:59:13 +0100
Received: by eya28 with SMTP id 28so2312863eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 11:58:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=J02h8hLDbphiQX8+WaVjOio/ZJz1p3qo/QBZX17bSXk=;
	b=WXjPe6P0rp1JxojcASlsxjOfyqEaaFJGAomBGql1PxxCVdBraSHlGdqnz4XmhHUngF
	hTsgX7A/T0csEa1Hluj3dlxLyEfsOXXiOsG41MwF6fhzhW+mrXSKdBlwVpsKVb/nO6+b
	/2WiODntB5Wn1gogE9UuIvv1lVer6+Kw2z6x8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=l4FbBnbOE6qNznCLn7yCZf9G5tp+kftBAKBIWrQiIEqHbniEO2954KWn8itWIvee9h
	5Qm0+rDhb1N6cP+ACuUPmJTuQqnoCPqIT8t+A8cxelykyp/1rQYZM2qu1Cpi3OZbRG6P
	ks9iX19FKgBbD2AVRorVHoKYNH5Vw0PbX9naA=
Received: by 10.204.98.65 with SMTP id p1mr25744346bkn.198.1297713484701;
	Mon, 14 Feb 2011 11:58:04 -0800 (PST)
Received: from localhost.localdomain ([188.165.206.204])
	by mx.google.com with ESMTPS id b6sm2047509bkb.22.2011.02.14.11.58.03
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 11:58:03 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 20:57:54 +0100
Message-Id: <1297713474-8677-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <1297709521-6650-1-git-send-email-filip.zyzniewski@gmail.com>
References: <1297709521-6650-1-git-send-email-filip.zyzniewski@gmail.com>
Subject: [PATCH] package_deb.bbclass: remove double DISTRO_PR from the package version.
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
X-List-Received-Date: Mon, 14 Feb 2011 19:59:14 -0000

PKGR already contains DISTRO_PR, so no need to add it twice.

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index 1f36246..60e759d 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -146,9 +146,9 @@ python do_package_deb () {
         fields = []
         pe = bb.data.getVar('PE', d, 1)
         if pe and int(pe) > 0:
-            fields.append(["Version: %s:%s-%s%s\n", ['PE', 'PKGV', 'PKGR', 'DISTRO_PR']])
+            fields.append(["Version: %s:%s-%s\n", ['PE', 'PKGV', 'PKGR']])
         else:
-            fields.append(["Version: %s-%s%s\n", ['PKGV', 'PKGR', 'DISTRO_PR']])
+            fields.append(["Version: %s-%s\n", ['PKGV', 'PKGR']])
         fields.append(["Description: %s\n", ['DESCRIPTION']])
         fields.append(["Section: %s\n", ['SECTION']])
         fields.append(["Priority: %s\n", ['PRIORITY']])
-- 
1.7.1



