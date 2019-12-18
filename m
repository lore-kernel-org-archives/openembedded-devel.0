Return-Path: <Trevor.Gamblin@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BD3747FFA2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Dec 2019 01:11:13 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id xBI1BED4024436
	(version=TLSv1 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Dec 2019 17:11:14 -0800 (PST)
Received: from yow-tgamblin-fedora1.wrs.com (128.224.56.206) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.50) with Microsoft SMTP Server id
	14.3.468.0; Tue, 17 Dec 2019 17:11:14 -0800
From: Trevor Gamblin <trevor.gamblin@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Tue, 17 Dec 2019 20:11:13 -0500
Message-ID: <20191218011113.4072000-1-trevor.gamblin@windriver.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Subject: [meta-networking][PATCH] net-snmp: update default community string
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 18 Dec 2019 01:11:13 -0000
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

snmpd.conf, by default, lists the string "public" as the community string. As
a consequence, any build incorporating net-snmp implicitly enables a
vulnerability (CVE-1999-0517) where an attacker could obtain information about
(and potential control of) the device and its network. This issue is picked up
by common security scan tools, and given the age of the vulnerability, some
minimum mitigation steps should be taken. While the conf file itself
recommends setting the community string to a value known only within the
user's organization, changing this string's default value for Yocto builds is
a minimum step to help mitigate this issue. Superior solutions that can be
implemented by the end developer/user include replacing the default community
string with a complex string unique to the network and/or filtering
UDP packets on the appropriate ports.

There's no formal fix for the above CVE, so I've avoided labeling this as if
it were a CVE fix. Also note that if you want to test this to check the change,
net-snmp-server needs to be included in the build (not just net-snmp).

More info can be found at https://www.tenable.com/plugins/nessus/41028.

Signed-off-by: Trevor Gamblin <trevor.gamblin@windriver.com>
---
 meta-networking/recipes-protocols/net-snmp/files/snmpd.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-networking/recipes-protocols/net-snmp/files/snmpd.conf b/meta-networking/recipes-protocols/net-snmp/files/snmpd.conf
index 728171c42..5a5c40bb0 100644
--- a/meta-networking/recipes-protocols/net-snmp/files/snmpd.conf
+++ b/meta-networking/recipes-protocols/net-snmp/files/snmpd.conf
@@ -58,7 +58,7 @@
 # from):
 
 #       sec.name  source          community
-com2sec paranoid  default         public
+com2sec paranoid  default         yocto-snmp-community
 #com2sec readonly  default         public
 #com2sec readwrite default         private
 
-- 
2.23.0


