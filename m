Received: from mail-gx0-f193.google.com ([209.85.161.193])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jefflance01@gmail.com>) id 1PaC4e-0006sH-UE
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Jan 2011 19:57:37 +0100
Received: by gxk7 with SMTP id 7so3804319gxk.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 04 Jan 2011 10:57:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:from:to:cc:subject:date
	:message-id:x-mailer;
	bh=vWxmiIpsHSVqMTxLkrHIBPhLiFZUalN1MTC7JW7bDgI=;
	b=UL+MOYJPuHKYRuCn9Mv2npx6SG1dSYX/aePsrBtaXl+RMT3V3xSSlvFj8ugjtKEy/1
	Wt2K06qv75cXpqEkWb0ELbpngm09x9WX31mxEHE5vrKlPkAacDSB1ISGd4LVXMcdRKk4
	sMhf1PdHIgOGjmn/cdFsECxJJzg/Gz5+x/hRY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer;
	b=Z3DxzZaFEqH1NeajwoLukVeZ4pqTZtedKYYq15oTuSPbID+5WwEGpm/SSP+PR7dPlw
	djbDN72Ex2wLnGZKWZExzPBSYQiBR30LNzeCB+fJl1ozwmfAXssgAmseYjuw+5B22/UL
	X7WEn70auFJtS+Z7A+AYHt13DloVqySn8Ejf8=
Received: by 10.150.212.14 with SMTP id k14mr2192363ybg.73.1294167432245;
	Tue, 04 Jan 2011 10:57:12 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id k2sm10915622ybj.22.2011.01.04.10.57.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 04 Jan 2011 10:57:11 -0800 (PST)
From: Jeff Lance <jefflance01@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  4 Jan 2011 12:56:32 -0600
Message-Id: <1294167392-20610-1-git-send-email-j-lance1@ti.com>
X-Mailer: git-send-email 1.6.3.3
Cc: Jeff Lance <j-lance1@ti.com>
Subject: [PATCH 1/1] am-benchmarks: add platform support and correct makefile
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
X-List-Received-Date: Tue, 04 Jan 2011 18:57:37 -0000

  * Modify recipe name to include package version
  * add support for additional platforms am181x-evm and am180x-evm
  * Update the SRCREV
    * Fix pathname to Rules.make in each Makefile

Signed-off-by: Jeff Lance <j-lance1@ti.com>
---
 .../{am-benchmarks_svn.bb => am-benchmarks_1.2.bb} |    8 +++++---
 1 files changed, 5 insertions(+), 3 deletions(-)
 copy recipes/ti/{am-benchmarks_svn.bb => am-benchmarks_1.2.bb} (87%)

diff --git a/recipes/ti/am-benchmarks_svn.bb b/recipes/ti/am-benchmarks_1.2.bb
similarity index 87%
copy from recipes/ti/am-benchmarks_svn.bb
copy to recipes/ti/am-benchmarks_1.2.bb
index 63c122f..dbe2db7 100644
--- a/recipes/ti/am-benchmarks_svn.bb
+++ b/recipes/ti/am-benchmarks_1.2.bb
@@ -8,9 +8,9 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "56"
-PV = "1.1"
-PR = "r1+svnr${SRCPV}"
+SRCREV = "58"
+PV = "1.2"
+PR = "r2+svnr${SRCPV}"
 
 COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
 
@@ -18,6 +18,8 @@ ARCHITECTURE_dm365 = "arm9"
 ARCHITECTURE_omapl138 = "arm9"
 ARCHITECTURE_omap3 = "cortex-a8"
 ARCHITECTURE_ti816x = "cortex-a8"
+ARCHITECTURE_am180x-evm = "arm9"
+ARCHITECTURE_am181x-evm = "arm9"
 
 INSANE_SKIP_${PN} = "True"
 
-- 
1.6.3.3



