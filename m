Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1O50wB-0006wt-MA
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Apr 2010 20:15:45 +0200
Received: by vws6 with SMTP id 6so962643vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Apr 2010 11:12:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:from:to:cc:subject
	:date:message-id:x-mailer;
	bh=2ehS7apH4uMyn2/nUC6BcVACIuY83VW4/aWsHB1DEns=;
	b=CUMUCuE1mwEmSV9x4yQcF7zEFM+aMz2hCOLesyd3UphFJLCXF1a8Aj5via3xjOJGUY
	2jHr3+Wkz4aGsLIoS710qsmN4MU72q6+KWVS+84gAsYaZEJxEfU9G+hsuXGCcR3A14hf
	zSaucktVMeX8TBjGtAGnSYvqQ3wVXx9U8fVFc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:cc:subject:date:message-id:x-mailer;
	b=kH5LsMStZnlRDEOnac0ZIAooSrxvM+cKd0+XdPMJ3ChCf/7v3lcKmxqAl/YKTwYPHb
	O+yVoKX9K/mJzwriac0vQpYo8vqdz+9gEwDoogIdne5hjYBI72An56llEkMO3Tdb7WTy
	C9Bt43FQ64dPMNx47g0lyQcMCvEN4EvmsLuwM=
Received: by 10.220.128.16 with SMTP id i16mr7086280vcs.120.1271959926085;
	Thu, 22 Apr 2010 11:12:06 -0700 (PDT)
Received: from localhost.localdomain (ip24-251-170-95.ph.ph.cox.net
	[24.251.170.95])
	by mx.google.com with ESMTPS id z13sm888536vco.6.2010.04.22.11.12.04
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 22 Apr 2010 11:12:05 -0700 (PDT)
Sender: Chris Larson <kergoth@gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 22 Apr 2010 11:11:18 -0700
Message-Id: <1271959878-6178-1-git-send-email-clarson@kergoth.com>
X-Mailer: git-send-email 1.6.3.3
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Chris Larson <chris_larson@mentor.com>
Subject: [PATCH] bitbake.conf: Don't remove nonexisting paths from FILESPATH
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
X-List-Received-Date: Thu, 22 Apr 2010 18:15:45 -0000

From: clarson <clarson@6a149ff2-cb3c-0410-b4c8-c88968701766>

Doing so coupled with amend.bbclass results in caching an __depends which
doesn't include all possible amend.inc files, only all the possible
amend.inc files *within already existing directories*.  Leaving all the
possible dirs in FILESPATH resolves this.

Signed-off-by: Chris Larson <chris_larson@mentor.com>

git-svn-id: http://svr-alm-svn-01.alm.mentorg.com:8080/svn/ea/easi_oe/system-builder/release-2010.1@2828 6a149ff2-cb3c-0410-b4c8-c88968701766
---
 sb-core/conf/bitbake.conf |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/sb-core/conf/bitbake.conf b/sb-core/conf/bitbake.conf
index 9a04292..bd57581 100644
--- a/sb-core/conf/bitbake.conf
+++ b/sb-core/conf/bitbake.conf
@@ -272,7 +272,7 @@ export MANIFEST = "${FILESDIR}/manifest"
 FILE_DIRNAME = "${@os.path.dirname(bb.data.getVar('FILE', d))}"
 FILESPATHBASE = "${FILE_DIRNAME}"
 FILESPATHPKG = "${PF}:${P}:${PN}:${BP}:${BPN}:files:."
-FILESPATH = "${@':'.join([os.path.normpath(os.path.join(fp, p, o)) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':') if os.path.exists(os.path.join(fp, p, o))])}"
+FILESPATH = "${@':'.join([os.path.join(fp, p, o) for fp in d.getVar('FILESPATHBASE', 1).split(':') for p in d.getVar('FILESPATHPKG', 1).split(':') for o in (d.getVar('OVERRIDES', 1) + ':').split(':')])}"
 FILESDIR = "${@bb.which(d.getVar('FILESPATH', 1), '.')}"
 
 ##################################################################
-- 
1.6.3.3



