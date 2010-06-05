Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OKmXH-0005Dj-7z
	for openembedded-devel@lists.openembedded.org;
	Sat, 05 Jun 2010 08:07:15 +0200
Received: by pvh1 with SMTP id 1so401100pvh.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 23:02:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=56KHruKc/xLxE4dAymr6ZM22LTdTm5LjAb0QpkjDsWc=;
	b=EGJ581qGR1rJxijzxKPe33dOKF0zo/vOyFRtnYSuB8sOdSaBOtyDPb+ZnaWXXqkyrF
	7R3CpreaTvuzDritnqN8w/bhKKSPmFu+WMeAbkiST9Fk6NReLWtZss2Ljqs+Vo1q0naF
	Q2lUcQpJ6UNAhyCB3XLcJFtVugrRAwY1Wqwq4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=RZBPcTSl+z3I3MsIUWJFAg50CrKiNGEB4Pbn2v22c1E4izsaJnwucyqJlyHdwVtAm7
	4tPet4uVyHCBTMCXp4gImONyxpAjKahViA0CdbbPPFumvv9Yiul1NGSxWxzeF0aMFDmF
	Gelb75AvKlllgz36Lhm4HqichzkuRKhs0Nqb4=
Received: by 10.143.153.42 with SMTP id f42mr8937333wfo.299.1275717772802;
	Fri, 04 Jun 2010 23:02:52 -0700 (PDT)
Received: from localhost.localdomain
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id d16sm15495154wam.0.2010.06.04.23.02.51
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 04 Jun 2010 23:02:52 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri,  4 Jun 2010 23:02:47 -0700
Message-Id: <1275717767-28870-1-git-send-email-raj.khem@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH] angstrom-2008-preferred-versions.inc: Set 1.11 PREFERRED_VERSION for automake-native
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
X-List-Received-Date: Sat, 05 Jun 2010 06:07:16 -0000

This patch would be needed for angstrom after the gettext 0.18 patches
are pushed.
I have booted a angstrom-2008.1 minimal-image successfully on qemuarm.

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../include/angstrom-2008-preferred-versions.inc   |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/conf/distro/include/angstrom-2008-preferred-versions.inc b/conf/distro/include/angstrom-2008-preferred-versions.inc
index 94beffb..2779504 100644
--- a/conf/distro/include/angstrom-2008-preferred-versions.inc
+++ b/conf/distro/include/angstrom-2008-preferred-versions.inc
@@ -5,7 +5,7 @@ require conf/distro/include/angstrom-codec-engine-${CE_VERSION}-preferred-versio
 
 PREFERRED_VERSION_autoconf = "2.65"
 PREFERRED_VERSION_autoconf-native = "2.65"
-PREFERRED_VERSION_automake-native = "1.10.3"
+PREFERRED_VERSION_automake-native = "1.11"
 PREFERRED_VERSION_busybox 	= "1.13.2"
 PREFERRED_VERSION_cairo		= "1.8.10"
 PREFERRED_VERSION_dbus 		= "1.2.24"
-- 
1.7.0.4



