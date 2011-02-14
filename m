Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <filip.zyzniewski@gmail.com>) id 1Pp3Xy-0004UZ-6b
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Feb 2011 19:53:18 +0100
Received: by eya28 with SMTP id 28so2270858eya.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Feb 2011 10:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=2vkFrL/Yz9qUkvV89+SCCOvyzkz3P0OO4Gg+z9iYZF0=;
	b=ZsR6CPDuRfkL+R2F0949r2egnRfvX9lRg3dHu5pUKecG8pdCBZGRNHLmSMd8+1ntyY
	Dx9BKD5f2+y+CHaztIRl3wy1t1gevOtQNsPeCpD0wuW3+W12IzKL1Kc4hCOqz31ese49
	6XK5h1yl095nje74VpEFl2963DtT+7V9gXVwo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TF57Ux0yaoMZMr3dM6stcWN94jvWJvztFYIZx+bE2KEVuU8OdHH9lJnlsAwQNodRQM
	1EZf5LhYwQvyab6tU486WQGcw6uP5ZbcMAutd7kmgQr0tY4yIydrYw/xtlfUYDFBf5hG
	HohEo/D8TPLtNBadrLlan8Hn8lQWPzXLUR2ic=
Received: by 10.223.86.135 with SMTP id s7mr5012095fal.70.1297709528537;
	Mon, 14 Feb 2011 10:52:08 -0800 (PST)
Received: from localhost.localdomain (ns.tefnet.pl [188.165.206.204])
	by mx.google.com with ESMTPS id z1sm1237765fau.21.2011.02.14.10.52.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Mon, 14 Feb 2011 10:52:07 -0800 (PST)
From: Filip Zyzniewski <filip.zyzniewski@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 14 Feb 2011 19:52:01 +0100
Message-Id: <1297709521-6650-1-git-send-email-filip.zyzniewski@gmail.com>
X-Mailer: git-send-email 1.7.1
In-Reply-To: <4D59056C.8000602@opendreambox.org>
References: <4D59056C.8000602@opendreambox.org>
Subject: [PATCH] package_deb.bbclass: Use PKGV/PKGR variables where applicable.
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
X-List-Received-Date: Mon, 14 Feb 2011 18:53:18 -0000

Using PV/PR causes problems like libncursesw5_5.7-r16 depending on
libtinfo5 (>= 5.7+20110115).

Signed-off-by: Filip Zyzniewski <filip.zyzniewski@gmail.com>
---
 classes/package_deb.bbclass |    4 ++--
 1 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/classes/package_deb.bbclass b/classes/package_deb.bbclass
index a98ec9d..1f36246 100644
--- a/classes/package_deb.bbclass
+++ b/classes/package_deb.bbclass
@@ -146,9 +146,9 @@ python do_package_deb () {
         fields = []
         pe = bb.data.getVar('PE', d, 1)
         if pe and int(pe) > 0:
-            fields.append(["Version: %s:%s-%s%s\n", ['PE', 'PV', 'PR', 'DISTRO_PR']])
+            fields.append(["Version: %s:%s-%s%s\n", ['PE', 'PKGV', 'PKGR', 'DISTRO_PR']])
         else:
-            fields.append(["Version: %s-%s%s\n", ['PV', 'PR', 'DISTRO_PR']])
+            fields.append(["Version: %s-%s%s\n", ['PKGV', 'PKGR', 'DISTRO_PR']])
         fields.append(["Description: %s\n", ['DESCRIPTION']])
         fields.append(["Section: %s\n", ['SECTION']])
         fields.append(["Priority: %s\n", ['PRIORITY']])
-- 
1.7.1



