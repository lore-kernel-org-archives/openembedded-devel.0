Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id C45CE73647
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 10:06:31 +0000 (UTC)
Received: by pdbnh10 with SMTP id nh10so6560095pdb.11
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2015 02:06:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=RfBOFNZKqoLv7FNElHJnXtWMlyGPlegljOvbgAMQ1YA=;
	b=lhegNgCi1ztzHoH6D47EzB8Y7FJam7Si3eGSicsaBr9ilhJvPREd6eNtPNZ24CbnDG
	HjjMNj3CC/jfzjMETJ4wj5AZqXyiC2zIgpelE/Y8H5J/nC6+ft5pQ5VFqD64T/G8N1Ne
	y2N4ajAeEIbCA8BloXCtjR2kmDVmYWUtR+orUpLeeaWav0iSxufSjYpwfUKdE+p0JHkG
	XKz/+itEJK1IO5QXI+04fJuH3kk6iU+6LBBWPjyMvagqaw+CYNtgVsL0QIWq44zVPzWT
	2qciwTiDfABTUwig3kSmBtGq9I1IIpnowds+cyAloHvvMJvqhv6gOrnI5HNPc5aCpwy0
	MVjw==
X-Received: by 10.70.42.47 with SMTP id k15mr15689465pdl.134.1424426793289;
	Fri, 20 Feb 2015 02:06:33 -0800 (PST)
Received: from Pahoa2.mvista.com ([192.165.183.201])
	by mx.google.com with ESMTPSA id
	qm12sm26443109pdb.36.2015.02.20.02.06.26
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 20 Feb 2015 02:06:32 -0800 (PST)
From: Armin Kuster <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 20 Feb 2015 02:06:15 -0800
Message-Id: <1424426775-17553-2-git-send-email-akuster808@gmail.com>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1424426775-17553-1-git-send-email-akuster808@gmail.com>
References: <1424426775-17553-1-git-send-email-akuster808@gmail.com>
Cc: Armin Kuster <akuster@mvista.com>
Subject: [meta-oe][PATCH 2/2] mcelog: update to latest
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 20 Feb 2015 10:06:35 -0000

From: Armin Kuster <akuster@mvista.com>

remove unused md5sum check since using git.

Signed-off-by: Armin Kuster <akuster@mvista.com>
---
 meta-oe/recipes-support/mcelog/{mcelog_1.04.bb => mcelog_1.09.bb} | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)
 rename meta-oe/recipes-support/mcelog/{mcelog_1.04.bb => mcelog_1.09.bb} (82%)

diff --git a/meta-oe/recipes-support/mcelog/mcelog_1.04.bb b/meta-oe/recipes-support/mcelog/mcelog_1.09.bb
similarity index 82%
rename from meta-oe/recipes-support/mcelog/mcelog_1.04.bb
rename to meta-oe/recipes-support/mcelog/mcelog_1.09.bb
index ceadf7a..34ff643 100644
--- a/meta-oe/recipes-support/mcelog/mcelog_1.04.bb
+++ b/meta-oe/recipes-support/mcelog/mcelog_1.09.bb
@@ -6,9 +6,7 @@ HOMEPAGE = "http://mcelog.org/"
 SECTION = "System Environment/Base"
 DEPENDS += "bash"
 SRC_URI = "git://git.kernel.org/pub/scm/utils/cpu/mce/mcelog.git"
-SRC_URI[md5sum] = "a06761ad5fed8596238b5a5ea76ed662"
-SRC_URI[sha256sum] = "519390825ec5a0545a7ed48717ef7c7480bb8b9bce68d63a58a52f4e4e275e0f"
-SRCREV = "9de4924e751346df6e2d40ae1007b40ea1915e2b"
+SRCREV = "0fc9f702232cb2d9969916f899c67c3e64deedda"
 LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://README;md5=3eb76ca64fa07ad53ebb0ebb5b4c8ede"
 
-- 
1.9.1


