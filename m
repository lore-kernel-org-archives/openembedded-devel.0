Return-Path: <jiaqing.zhao@linux.intel.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FB70C433EF
	for <webhook@archiver.kernel.org>; Thu,  5 May 2022 02:56:22 +0000 (UTC)
Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
 by mx.groups.io with SMTP id smtpd.web10.6557.1651719374517563046
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 04 May 2022 19:56:14 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="unable to parse pub key" header.i=@intel.com header.s=intel
 header.b=Savh7hIu;
 spf=none, err=permanent DNS error (domain: linux.intel.com,
 ip: 192.55.52.115, mailfrom: jiaqing.zhao@linux.intel.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1651719374; x=1683255374;
  h=from:to:cc:subject:date:message-id:mime-version:
   content-transfer-encoding;
  bh=2gUh1tHGI6RoxE8x1HBQ1EMvwR8lNpKi9sDCBPL3RIY=;
  b=Savh7hIuXfvaIjgRHhP/vy0egPeltv7O96yFNTCduoPUHhMWbrX532J3
   ssW7lvcLbQnuFhR+3cOkRtA3VHtzmwlU25HC/W5sdlL0aj69CkcsbIpK3
   Ar17EblyCpS0CqQw+rGaHOiAXDAYiTkD4xUaZtXv22NbG6x07kbvYjB2F
   8ku/rgLJ6+Ua5yXSycQh68FpfIEhYhiQPh355yO3nG6pwazBkSLQdPfWO
   CVAXO2E7o5RBx3kNTbwD2a0OQLpcbj7SMN++1SQbHNjSBbl+sK0CGbkoB
   7zJMnIg1O3pni6vkFxKWR+23gVjlQGFHf9mxMvtgFBjFlVifAk3K4LOk+
   w==;
X-IronPort-AV: E=McAfee;i="6400,9594,10337"; a="268120247"
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600";
   d="scan'208";a="268120247"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 19:56:14 -0700
X-IronPort-AV: E=Sophos;i="5.91,199,1647327600";
   d="scan'208";a="563024787"
Received: from unknown (HELO jiaqingz-bmcdev-container.sh.intel.com)
 ([10.239.138.232])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 May 2022 19:56:13 -0700
From: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
Subject: [meta-oe] [PATCH v2 1/2] openldap: Remove libgcrypt dependency
Date: Thu,  5 May 2022 10:55:52 +0800
Message-Id: <20220505025553.3019552-1-jiaqing.zhao@linux.intel.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 05 May 2022 02:56:22 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/96957

Since OpenLDAP 2.5.0, it uses nettle instead of gcrypt.

Signed-off-by: Jiaqing Zhao <jiaqing.zhao@linux.intel.com>
---
 .../openldap/openldap-2.4.28-gnutls-gcrypt.patch  | 15 ---------------
 .../recipes-support/openldap/openldap_2.5.9.bb    |  3 +--
 2 files changed, 1 insertion(+), 17 deletions(-)
 delete mode 100644 meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch

diff --git a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch b/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
deleted file mode 100644
index 8cfd0033c..000000000
--- a/meta-oe/recipes-support/openldap/openldap/openldap-2.4.28-gnutls-gcrypt.patch
+++ /dev/null
@@ -1,15 +0,0 @@
-From http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/net-nds/openldap/files/
-
-Upstream-Status: Pending
-
---- a/configure.ac
-+++ b/configure.ac
-@@ -1263,7 +1263,7 @@ if test $ol_link_tls = no ; then
- 				ol_link_tls=yes
- 				WITH_TLS_TYPE=gnutls
- 
--				TLS_LIBS="-lgnutls"
-+				TLS_LIBS="-lgnutls -lgcrypt"
- 
- 				AC_DEFINE(HAVE_GNUTLS, 1, 
- 					[define if you have GNUtls])
diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
index 5ac5660cd..958a21b9c 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -15,7 +15,6 @@ SECTION = "libs"
 LDAP_VER = "${@'.'.join(d.getVar('PV').split('.')[0:2])}"
 
 SRC_URI = "http://www.openldap.org/software/download/OpenLDAP/openldap-release/${BP}.tgz \
-    file://openldap-2.4.28-gnutls-gcrypt.patch \
     file://use-urandom.patch \
     file://initscript \
     file://slapd.service \
@@ -51,7 +50,7 @@ PACKAGECONFIG ??= "asyncmeta gnutls modules \
                    ${@bb.utils.filter('DISTRO_FEATURES', 'ipv6', d)} \
 "
 #--with-tls              with TLS/SSL support auto|openssl|gnutls [auto]
-PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls libgcrypt"
+PACKAGECONFIG[gnutls] = "--with-tls=gnutls,,gnutls"
 PACKAGECONFIG[openssl] = "--with-tls=openssl,,openssl"
 
 PACKAGECONFIG[sasl] = "--with-cyrus-sasl,--without-cyrus-sasl,cyrus-sasl"
-- 
2.34.1


