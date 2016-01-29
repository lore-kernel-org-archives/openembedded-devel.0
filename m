Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 86C4B731E1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 15:38:30 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0TFcU7s028330; Fri, 29 Jan 2016 09:38:30 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012909383025-440745 ;
	Fri, 29 Jan 2016 09:38:30 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 17:38:14 +0200
Message-Id: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454081481.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/29/2016 09:38:30 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/29/2016 09:38:30 AM,
	Serialize complete at 01/29/2016 09:38:30 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-29_06:, , signatures=0
Subject: [meta-oe][PATCH v2 1/2] openldap: enable native build
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
X-List-Received-Date: Fri, 29 Jan 2016 15:38:31 -0000

This is required by the apr-util & apache2 recipes to enable
ldap support without breaking the build (nothing provides -native)

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.43.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
index c4a52b1..148d5a8 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
@@ -222,3 +222,5 @@ python populate_packages_prepend () {
     packages.append(metapkg)
     d.setVar('PACKAGES', ' '.join(packages))
 }
+
+BBCLASSEXTEND = "native"
-- 
2.7.0


