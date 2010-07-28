Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oe3I6-0002VM-3Y
	for openembedded-devel@lists.openembedded.org;
	Wed, 28 Jul 2010 11:51:26 +0200
Received: by eyf5 with SMTP id 5so989689eyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jul 2010 02:50:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=OG2yGdW9nQu+HF2nvWYSvLUMMxw9bwMEGv56gMN4Umw=;
	b=NTc+c2C6Elhfg4KR6Kob/UWinmMSerVRoUxL46/Z6ujPkY/xQHaD63ZdFS35rNmOQf
	8gUWRn1xA3LgdnvONePmx4tcQpLVepMTDCMPjpEuFSNPNJ2BlN0vHN+/ytzn8qYwrWWp
	dVaDpM7CplhoXdx9iaHLF6b/82Bsv2jgcUmjM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=uXsM7pHXkiOs7u0huJXHUWgVHh2+JlC7IYJPGxW18h9Cw+r/FrEWz7HgAmav6KQosh
	WvJMXBgH1nw0bNBFiTujSa8EH/agUH1lFp3KlmG/bTkAC3+28KLP1lrBrFtcD+20zcUY
	Tk4MiX/SZY2B+bMcH/h6FhxP3Vz0Vg8WuvxmA=
Received: by 10.213.34.140 with SMTP id l12mr5708053ebd.17.1280310653821;
	Wed, 28 Jul 2010 02:50:53 -0700 (PDT)
Received: from localhost.localdomain (atwork-193.r-212.178.107.atwork.nl
	[212.178.107.193])
	by mx.google.com with ESMTPS id x54sm9213991eeh.17.2010.07.28.02.50.52
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 28 Jul 2010 02:50:53 -0700 (PDT)
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 28 Jul 2010 11:50:35 +0200
Message-Id: <1280310636-29889-1-git-send-email-fransmeulenbroeks@gmail.com>
X-Mailer: git-send-email 1.7.0.4
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [PATCH 1/2] attr: added BBCLASSEXTEND = "native"
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
X-List-Received-Date: Wed, 28 Jul 2010 09:51:34 -0000

added BBCLASSEXTEND = "native"
this is needed for squashfs-tools, otherwise it is not possible to build
mksquashfs and hence no squashfs creation on the build system

Signed-off-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
---

as this may afffect several others, posted here for review

also not too sure of the desired positionof BBCLASSEXTEND, I put it before the appends 
if at the end, it seems kinda lost

 recipes/udev/attr_2.4.44.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/udev/attr_2.4.44.bb b/recipes/udev/attr_2.4.44.bb
index ffc0cc3..d42c5d8 100644
--- a/recipes/udev/attr_2.4.44.bb
+++ b/recipes/udev/attr_2.4.44.bb
@@ -17,6 +17,8 @@ LDFLAGS_append_libc-uclibc += " -lintl"
 
 TOPDIR[unexport] = "1"
 
+BBCLASSEXTEND = "native"
+
 do_configure_append() {
 	# gettext hack
 	echo "#define _(str) str" >> ${S}/include/config.h
-- 
1.7.0.4



