Return-Path: <adrian.ratiu@ni.com>
Received: from ni.com (skprod2.natinst.com [130.164.80.23])
	by mail.openembedded.org (Postfix) with ESMTP id 5345D6FF22
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 14:24:14 +0000 (UTC)
Received: from us-aus-mgwout2.amer.corp.natinst.com (nb-snip2-1338.natinst.com
	[130.164.19.135])
	by us-aus-skprod2.natinst.com (8.15.0.59/8.15.0.59) with ESMTP id
	u2HEOELQ021372 for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Mar 2016 09:24:14 -0500
Received: from adi-pc-linux.emea.corp.natinst.com ([130.164.14.198])
	by us-aus-mgwout2.amer.corp.natinst.com (Lotus Domino Release 8.5.3FP6
	HF1218) with ESMTP id 2016031709241489-1499159 ;
	Thu, 17 Mar 2016 09:24:14 -0500 
From: Ioan-Adrian Ratiu <adrian.ratiu@ni.com>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 17 Mar 2016 16:23:45 +0200
Message-Id: <1458224625-4061-1-git-send-email-adrian.ratiu@ni.com>
X-Mailer: git-send-email 2.7.3
X-MIMETrack: Itemize by SMTP Server on US-AUS-MGWOut2/AUS/H/NIC(Release
	8.5.3FP6 HF1218|December 12, 2014) at 03/17/2016 09:24:15 AM,
	Serialize by Router on US-AUS-MGWOut2/AUS/H/NIC(Release 8.5.3FP6
	HF1218|December 12, 2014) at 03/17/2016 09:24:15 AM,
	Serialize complete at 03/17/2016 09:24:15 AM
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10432:, ,
	definitions=2016-03-17_04:, , signatures=0
Subject: [meta-oe][PATCH] openldap: control ipv6 support via DISTRO_FEATURES
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
X-List-Received-Date: Thu, 17 Mar 2016 14:24:14 -0000

From: Richard Tollerton <rich.tollerton@ni.com>

Explicitly disable ipv6 support if the distro does not include it.

Signed-off-by: Richard Tollerton <rich.tollerton@ni.com>
---
 meta-oe/recipes-support/openldap/openldap_2.4.43.bb | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
index 9670f1a..8618365 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.4.43.bb
@@ -53,6 +53,7 @@ EXTRA_OECONF += "--enable-dynamic"
 
 PACKAGECONFIG ??= "gnutls modules \
                    ldap meta monitor null passwd shell proxycache dnssrv \
+                   ${@bb.utils.contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
 PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls libgcrypt"
@@ -60,6 +61,7 @@ PACKAGECONFIG[openssl] = "--with-tls=openssl,,openssl"
 
 PACKAGECONFIG[sasl] = "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sasl"
 PACKAGECONFIG[modules] = "lt_cv_dlopen_self=yes --enable-modules,--disable-modules,libtool"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6"
 
 # SLAPD options
 #
-- 
2.7.3


