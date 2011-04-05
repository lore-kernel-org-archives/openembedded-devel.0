Received: from mail-gy0-f175.google.com ([209.85.160.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <heroor@gmail.com>) id 1Q77wM-0003hQ-Sk
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Apr 2011 17:13:11 +0200
Received: by gyf1 with SMTP id 1so168143gyf.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Apr 2011 08:11:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:from:to:cc:subject:date:message-id:x-mailer
	:in-reply-to:references;
	bh=zEnK0SCUdHfmgBxxgPk0MQfLlChYQoA1qfT/lVRxwSc=;
	b=K31DoL4rT1vir0jxz7fL/PDl7kkgHdilFnK4wLgAbhUWpW8HD1ZpTlGMhw6dMpgJN8
	1Qf1g0cOPaZcfWL1ojnWB0L63luv73BklWQP04c1rthW9cHfYrHdDLJyOkrLIKTzgtfd
	RG1c1w7a7k4Qo5cDkaFzBsM6h4eRoy2xiDEeU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=from:to:cc:subject:date:message-id:x-mailer:in-reply-to:references;
	b=TBnkIP2C9C3TzZDQdQF3t6jkUxJsNieogDfZ1/5FUdU94KojH5MjRUWiJL8AZW/Bza
	i0BJFslY2Y0q0IlGgi+zlZMkwi5gdPkAKyPu9YGshv2oqozx2aO+Kmdrjm9LzhPfrb4G
	jagq1Izu5EW9QV3X0y4AcUoDX+G02cpkn1QVI=
Received: by 10.150.67.3 with SMTP id p3mr629141yba.153.1302016264364;
	Tue, 05 Apr 2011 08:11:04 -0700 (PDT)
Received: from localhost.localdomain (dragon.ti.com [192.94.94.33])
	by mx.google.com with ESMTPS id p28sm148062ybk.0.2011.04.05.08.11.02
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 05 Apr 2011 08:11:03 -0700 (PDT)
From: Siddharth Heroor <heroor@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Tue,  5 Apr 2011 20:40:53 +0530
Message-Id: <1302016253-10390-2-git-send-email-heroor@gmail.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1302016253-10390-1-git-send-email-heroor@gmail.com>
References: <1302016253-10390-1-git-send-email-heroor@gmail.com>
Cc: Siddharth Heroor <heroor@ti.com>
Subject: [PATCH 2/2] ti-syslink: Add release 02.00.00.68.
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
X-List-Received-Date: Tue, 05 Apr 2011 15:13:11 -0000

From: Siddharth Heroor <heroor@ti.com>


Signed-off-by: Siddharth Heroor <heroor@ti.com>
---
 recipes/ti/ti-syslink_02.00.00.68.bb |   12 ++++++++++++
 1 files changed, 12 insertions(+), 0 deletions(-)
 create mode 100644 recipes/ti/ti-syslink_02.00.00.68.bb

diff --git a/recipes/ti/ti-syslink_02.00.00.68.bb b/recipes/ti/ti-syslink_02.00.00.68.bb
new file mode 100644
index 0000000..6ae07ae
--- /dev/null
+++ b/recipes/ti/ti-syslink_02.00.00.68.bb
@@ -0,0 +1,12 @@
+require ti-syslink.inc
+
+PV = "02_00_00_68"
+
+# This release appends a beta tag to PV.
+PVExtra = "_beta1"
+S = "${WORKDIR}/syslink_${PV}${PVExtra}"
+
+SRC_URI = "http://software-dl.ti.com/dsps/dsps_public_sw/SysLink/${PV}${PVExtra}/exports/syslink_${PV}${PVExtra}.tar.gz;name=syslinktarball"
+
+SRC_URI[syslinktarball.md5sum] = "468034372124f70f82b60cfb5f11c8e8"
+SRC_URI[syslinktarball.sha256sum] = "ed574dcb3a5477cfbc69a1c9e768d5197291cb057d19fd791e16e1c89af3e8e1"
-- 
1.7.0.4



