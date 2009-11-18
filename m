Received: from ey-out-1920.google.com ([74.125.78.149])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NAYQ3-0002Ip-PF
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Nov 2009 01:29:14 +0100
Received: by ey-out-1920.google.com with SMTP id 26so139296eyw.4
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Nov 2009 16:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=Tvzlrn99U9MyxYwqEoKQLJo5/CbWvJCTWV0kFcEah1o=;
	b=vqUldm7lesz6OWObt0mQZGg91AG1pXf+FI/Y8tA50JU0VkFTifukKF1MJSthMar8/x
	hMuHe2OHjt5b9QNH4KisAlOcVe3X2YP/MZqS6RUgkyki4dcmfFGn/yhXbWt1izAvt9fg
	cdds4z4Ct353p1umzK+kwbJ+0zqyDZezLyVDo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=xIMD/PHFQ3n3fsdM+83gyVFHKwsAgaJsSO5EbjUk5/UiA+DR4/5Tl3K28Cu/wcePqR
	VNSqBemvkXiBnk2Zgbvi/ayXfTPmNjqu6iXpb2TmDOJPv3mvgBH7lBBl5B3Q9LT2QGlQ
	4sgYahDSpBKURFwnjFhbGxY637nSptV86/mOk=
Received: by 10.213.100.13 with SMTP id w13mr1572998ebn.15.1258504070413;
	Tue, 17 Nov 2009 16:27:50 -0800 (PST)
Received: from localhost.localdomain (82-171-51-231.ip.telfort.nl
	[82.171.51.231])
	by mx.google.com with ESMTPS id 28sm749560eyg.30.2009.11.17.16.27.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 17 Nov 2009 16:27:49 -0800 (PST)
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 18 Nov 2009 01:27:46 +0100
Message-Id: <1258504066-24834-1-git-send-email-leon@sidebranch.com>
X-Mailer: git-send-email 1.6.0.4
X-SA-Exim-Connect-IP: 74.125.78.149
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: Leon Woestenberg <leon@sidebranch.com>
Subject: [PATCH] kernel.bbclass: Move do_menuconfigure after do_configure.
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
X-List-Received-Date: Wed, 18 Nov 2009 00:29:14 -0000

Currently, menuconfigure comes after the patch task and before
the configure task. If someone runs the menuconfigure task,
then builds the kernel, the configure task will overwrite the
configuration just edited. This is unexpected and/or unwanted
behaviour.

Rather moved menuconfigure past configure, so that the OpenEmbedded
supplied defconfig can be edited afterwards.

Signed-off-by: Leon Woestenberg <leon@sidebranch.com>
---
 classes/kernel.bbclass |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/classes/kernel.bbclass b/classes/kernel.bbclass
index 9c1f637..cf7cc4f 100644
--- a/classes/kernel.bbclass
+++ b/classes/kernel.bbclass
@@ -218,7 +218,7 @@ do_menuconfig() {
 	fi
 }
 do_menuconfig[nostamp] = "1"
-addtask menuconfig after do_patch
+addtask menuconfig after do_configure
 
 pkg_postinst_kernel () {
 	cd /${KERNEL_IMAGEDEST}; update-alternatives --install /${KERNEL_IMAGEDEST}/${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE} ${KERNEL_IMAGETYPE}-${KERNEL_VERSION} ${KERNEL_PRIORITY} || true
-- 
1.6.0.4



