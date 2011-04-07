Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q7kCB-0006rQ-BA
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Apr 2011 10:04:03 +0200
Received: by ywg8 with SMTP id 8so910147ywg.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Apr 2011 01:01:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=xb6x6f7FmyKLwwM6TZXzREZe3Y+kyWunPFRcSTMHRiQ=;
	b=EsQ1fipVDMeSbQ3KVrbMxgh5xZwhDicCkxZkd/TUkTg1JcK82ps3wSip4LbuPkJlj7
	Dt2MmLNzDFa8R9fhjeYDM+cKW5R4aa+u0R8LoVyu8r6Tbh71fY8hb07jzFaftqW9GsXa
	38++NRNSQJHAeBhfheHZj5O22IntStMww8tUw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=S7+CR+xl1j6abn3nmNTNYWGCbWqCLZd9PwraUemv4zZbNjqwZYMy6uibWsGGdvZf8a
	mWMOlwVkHj5wOM2z5EDqk78iz6VuYRBWT28u6IqneEzKCClszAsf/yQ5RnWE6cl5iVnV
	xZ/UwoMed7i9gxGnDzdNggrH3UKyNq4d2Oy90=
Received: by 10.150.115.14 with SMTP id n14mr513412ybc.293.1302163315082;
	Thu, 07 Apr 2011 01:01:55 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id c4sm1593468ana.23.2011.04.07.01.01.52
	(version=TLSv1/SSLv3 cipher=OTHER);
	Thu, 07 Apr 2011 01:01:54 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu,  7 Apr 2011 13:31:35 +0530
Message-Id: <1302163296-16002-4-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302163296-16002-1-git-send-email-heroor@gmail.com>
References: <1302163296-16002-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCHv2 4/5] ti-syslink-module: Add Syslink version 02.00.00.68 Beta2
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
X-List-Received-Date: Thu, 07 Apr 2011 08:04:03 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-syslink-module_02.00.00.68.bb |   11 +++++++++++
 1 files changed, 11 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink-module_02.00.00.68.bb

diff --git a/recipes/ti/ti-syslink-module_02.00.00.68.bb b/recipes/ti/ti-syslink-module_02.00.00.68.bb
new file mode 100644
index 0000000..f7bcb35
--- /dev/null
+++ b/recipes/ti/ti-syslink-module_02.00.00.68.bb
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



