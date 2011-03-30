Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <chasemaupin03@gmail.com>) id 1Q4zqi-0004xm-QL
	for openembedded-devel@lists.openembedded.org;
	Wed, 30 Mar 2011 20:10:32 +0200
Received: by gwb11 with SMTP id 11so645865gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Mar 2011 11:08:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=FkzYCda8RkmYQGhmF7PIFlE1LCGsICK8SWhH42gRQQ8=;
	b=vgwJjSwuaUvhMdwqCdhQp5YPHA9AWK0tG52q1hxlUnKFM5QRGJSlwlvFpUtJ+fckw5
	Q7lAnhlsOOo+/vQUvdYmbKxF/h3Icuy4v15spyvqzHHlrxuOupbUBGUDcZXaY5t8dq19
	U2haV8u3nfndb/mhiN7eLidU/HIlut8XqYskw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=sWO2hwBDT6GXerVTPwvH48OFP7ewZhhJ8gaHn0qKXoY+JpNm1VT/NbuB4dx83OTNFh
	E6yetUnmQbDxLExHd39BNvTGd8NrmUT4H2SSrVPkSTcmfcthmypoJpOHdv/ZREWD8yq3
	U13kdX7uyr926QLUATAQO2EEm7dmJV0nmTmQg=
Received: by 10.90.16.38 with SMTP id 38mr1927981agp.63.1301508512216;
	Wed, 30 Mar 2011 11:08:32 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id x32sm301049ana.38.2011.03.30.11.08.30
	(version=TLSv1/SSLv3 cipher=OTHER);
	Wed, 30 Mar 2011 11:08:31 -0700 (PDT)
From: Chase Maupin <chasemaupin03@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 30 Mar 2011 13:08:10 -0500
Message-Id: <1301508491-3062-5-git-send-email-Chase.Maupin@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
References: <1301508491-3062-1-git-send-email-Chase.Maupin@ti.com>
Cc: Chase Maupin <Chase.Maupin@ti.com>
Subject: [PATCH 5/6] am-benchmarks: Add support for am387x-evm machine
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
X-List-Received-Date: Wed, 30 Mar 2011 18:10:33 -0000

* Add support in this recipe for the am387x-evm machine
  type.
* Bump the PR.

Signed-off-by: Chase Maupin <Chase.Maupin@ti.com>
---
 recipes/ti/am-benchmarks_1.2.bb |    5 +++--
 1 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/recipes/ti/am-benchmarks_1.2.bb b/recipes/ti/am-benchmarks_1.2.bb
index 5ae0585..38c7056 100644
--- a/recipes/ti/am-benchmarks_1.2.bb
+++ b/recipes/ti/am-benchmarks_1.2.bb
@@ -8,15 +8,16 @@ LICENSE = "BSD"
 SECTION = "system"
 PRIORITY = "optional"
 
-SRCREV = "59"
+SRCREV = "60"
 PR = "r2+svnr${SRCPV}"
 
-COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x)"
+COMPATIBLE_MACHINE = "(dm365|omapl138|omap3|ti816x|ti814x)"
 
 ARCHITECTURE_dm365 = "arm9"
 ARCHITECTURE_omapl138 = "arm9"
 ARCHITECTURE_omap3 = "cortex-a8"
 ARCHITECTURE_ti816x = "cortex-a8"
+ARCHITECTURE_ti814x = "cortex-a8"
 
 INSANE_SKIP_${PN} = "True"
 
-- 
1.7.0.4



