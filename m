Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q8OrZ-00079Z-5M
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Apr 2011 05:29:29 +0200
Received: by ywg8 with SMTP id 8so1683756ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 08 Apr 2011 20:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=4pFSRLVXV9uOY75zxQmaC54SPky/RIno37mpOFz2GJE=;
	b=JXUqzVip3d3F0A46AyoldvgZDXaNyHTp5+szbJIfDwjL3nKZV9Tk4gDz1z8q1I0gLj
	Qn0Z92bTVs1jFODhCriZIG14UUaNEVXF/FJurpb4KoLEZjI4QR2n+JG6kUDjWm+qYZHW
	0oDkVKwtrzKXm+nPPyQ/OLOqkTKWKhHCBohgg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=jBJx/zvAiEWz1caRosgS477vV4L6NjXBD4QMWDWmkQHK3i2WQu26Be2aWIgT0WxvLx
	HxFaEJmy0GX4wAC5LAnidEU0e+Vf+nb/x6sN6OpeTGDfVC+iyio0475PduEYi6b4dagI
	nXIL6YAZPrrSwoCMhvKCW+xWRGE0DGV7CTrDQ=
Received: by 10.151.135.34 with SMTP id m34mr2640427ybn.36.1302319638235;
	Fri, 08 Apr 2011 20:27:18 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id t16sm1767800ybe.19.2011.04.08.20.27.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 08 Apr 2011 20:27:17 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sat,  9 Apr 2011 08:56:59 +0530
Message-Id: <1302319620-18223-4-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302319620-18223-1-git-send-email-heroor@gmail.com>
References: <1302319620-18223-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv3 4/5] ti-syslink-module: Add Syslink version 02.00.00.68 Beta1
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
X-List-Received-Date: Sat, 09 Apr 2011 03:29:29 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 ...-syslink-module_02.00.00.67+02.00.00.68beta1.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb

diff --git a/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
new file mode 100644
index 0000000..f7bcb35
--- /dev/null
+++ b/recipes/ti/ti-syslink-module_02.00.00.67+02.00.00.68beta1.bb
@@ -0,0 +1,11 @@
+require ti-syslink-module.inc
+
+PV = "02_00_00_68"
+PVExtra = "_beta1"
+
+S = "${WORKDIR}/syslink_${PV}${PVExtra}/ti/syslink/utils/hlos/knl/Linux"
+SYSLINK_ROOT = "${WORKDIR}/syslink_${PV}${PVExtra}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=syslinktarball"
+SRC_URI[syslinktarball.md5sum] = "468034372124f70f82b60cfb5f11c8e8"
+SRC_URI[syslinktarball.sha256sum] = "ed574dcb3a5477cfbc69a1c9e768d5197291cb057d19fd791e16e1c89af3e8e1"
-- 
1.7.0.4



