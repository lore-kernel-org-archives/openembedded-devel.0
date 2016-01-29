Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 9635F7720A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 15:38:30 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0TFcVkH013665; Fri, 29 Jan 2016 09:38:31 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012909383130-440747 ;
	Fri, 29 Jan 2016 09:38:31 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 17:38:15 +0200
Message-Id: <1bbf4294022caa7880af64a76570c53aa2edeb0b.1454081481.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454081481.git.adrian.ratiu@ni.com>
References: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454081481.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/29/2016 09:38:31 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/29/2016 09:38:31 AM,
	Serialize complete at 01/29/2016 09:38:31 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-29_06:, , signatures=0
Subject: [meta-oe][PATCH v2 2/2] apache2: add openldap support to PACKAGECONFIG
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

This config option is disabled by default

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb | 1 +
 1 file changed, 1 insertion(+)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
index 8ca6d00..597afe6 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
@@ -59,6 +59,7 @@ EXTRA_OECONF = "--enable-ssl \
 
 PACKAGECONFIG ?= "${@base_contains('DISTRO_FEATURES', 'selinux', 'selinux', '', d)}"
 PACKAGECONFIG[selinux] = "--enable-selinux,--disable-selinux,libselinux,libselinux"
+PACKAGECONFIG[openldap] = "--enable-ldap --enable-authnz-ldap,--disable-ldap --disable-authnz-ldap,openldap"
 
 do_install_append() {
     install -d ${D}/${sysconfdir}/init.d
-- 
2.7.0


