Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod3.natinst.com [130.164.80.24])
	by mail.openembedded.org (Postfix) with ESMTP id 52E777721E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 13:08:48 +0000 (UTC)
Received: from us-aus-mgwout1.amer.corp.natinst.com (nb-chan1-1338.natinst.com
	[130.164.19.134])
	by us-aus-skprod3.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u0TD8no5016431 for <openembedded-devel@lists.openembedded.org>;
	Fri, 29 Jan 2016 07:08:49 -0600
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout1.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016012907084948-436353 ;
	Fri, 29 Jan 2016 07:08:49 -0600 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 29 Jan 2016 15:08:34 +0200
Message-Id: <97ec018d13981913df887195ca467ba75f2eb3b9.1454072848.git.adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.0
In-Reply-To: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454072848.git.adrian.ratiu@ni.com>
References: <397caaab4cdf263cb23cb988bbc100ee5e264261.1454072848.git.adrian.ratiu@ni.com>
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut1/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 01/29/2016 07:08:49 AM,
	Serialize by Router on US-AUS-MGWOut1/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 01/29/2016 07:08:49 AM,
	Serialize complete at 01/29/2016 07:08:49 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-01-29_05:, , signatures=0
Subject: [meta-oe][PATCH 2/2] apache2: enable openldap support
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
X-List-Received-Date: Fri, 29 Jan 2016 13:08:49 -0000

Signed-off-by: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
---
 meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
index 8ca6d00..d20ac09 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.18.bb
@@ -2,7 +2,7 @@ DESCRIPTION = "The Apache HTTP Server is a powerful, efficient, and \
 extensible web server."
 SUMMARY = "Apache HTTP Server"
 HOMEPAGE = "http://httpd.apache.org/"
-DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util"
+DEPENDS = "libtool-native apache2-native openssl expat pcre apr apr-util openldap"
 SECTION = "net"
 LICENSE = "Apache-2.0"
 
@@ -44,6 +44,8 @@ EXTRA_OECONF = "--enable-ssl \
     --with-apr-util=${STAGING_BINDIR_CROSS}/apu-1-config \
     --enable-info \
     --enable-rewrite \
+    --enable-ldap \
+    --enable-authnz-ldap \
     --with-dbm=sdbm \
     --with-berkeley-db=no \
     --localstatedir=/var/${BPN} \
-- 
2.7.0


