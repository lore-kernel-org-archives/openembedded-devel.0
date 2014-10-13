Return-Path: <Wenzong.Fan@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id AFF076A362
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Oct 2014 06:17:18 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.14.9/8.14.5) with ESMTP id s9D6HJcd013606
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Oct 2014 23:17:19 -0700 (PDT)
Received: from pek-hostel-vm12.wrs.com (128.224.153.182) by
	ALA-HCB.corp.ad.wrs.com (147.11.189.41) with Microsoft SMTP Server id
	14.3.174.1; Sun, 12 Oct 2014 23:17:19 -0700
From: <wenzong.fan@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 13 Oct 2014 02:17:16 -0400
Message-ID: <0ba4f373d7be41147888b6a71728f7771ef28bb8.1413180347.git.wenzong.fan@windriver.com>
X-Mailer: git-send-email 1.7.9.5
In-Reply-To: <cover.1413180347.git.wenzong.fan@windriver.com>
References: <cover.1413180347.git.wenzong.fan@windriver.com>
MIME-Version: 1.0
Subject: [PATCH 1/1 v3][meta-networking] ntp: fix path to drift file
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
X-List-Received-Date: Mon, 13 Oct 2014 06:17:22 -0000
Content-Type: text/plain

From: Wenzong Fan <wenzong.fan@windriver.com>

The default path of ntp drift file is /etc/ntp.drift, ntp daemon
maybe fails to create this file since the user ntp is not always
permitted to write /etc.

Refer to other distributions such as RedHat, Debian, just moving
the file to /var/lib/ntp which the home dir of user ntp.

Signed-off-by: Wenzong Fan <wenzong.fan@windriver.com>
---
 meta-networking/recipes-support/ntp/files/ntp.conf |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-support/ntp/files/ntp.conf b/meta-networking/recipes-support/ntp/files/ntp.conf
index 875b7eb..676e186 100644
--- a/meta-networking/recipes-support/ntp/files/ntp.conf
+++ b/meta-networking/recipes-support/ntp/files/ntp.conf
@@ -1,7 +1,7 @@
 # This is the most basic ntp configuration file
 # The driftfile must remain in a place specific to this
 # machine - it records the machine specific clock error
-driftfile /etc/ntp.drift
+driftfile /var/lib/ntp/drift
 # This should be a server that is close (in IP terms)
 # to the machine.  Add other servers as required.
 # Unless you un-comment the line below ntpd will sync
-- 
1.7.9.5


