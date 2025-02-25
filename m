Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9EFCDC19F30
	for <webhook@archiver.kernel.org>; Tue, 25 Feb 2025 23:25:05 +0000 (UTC)
Received: from esa11.hc1455-7.c3s2.iphmx.com (esa11.hc1455-7.c3s2.iphmx.com [207.54.90.137])
 by mx.groups.io with SMTP id smtpd.web11.2198.1740525895087964817
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Feb 2025 15:24:58 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=JFYe56G8;
 spf=pass (domain: fujitsu.com, ip: 207.54.90.137, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1740525899; x=1772061899;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=JrJxWE480cCSepsDzaNT+NtrtFE67FRcaFvwRuMLDro=;
  b=JFYe56G8+GbEZ182p8n5WDq2AcOYsUfFAhe/uZuoeuJxc8hiy+UFL64C
   bkioyBrDqHV6A3UiO25K3ACnCtJkcNlRYDRWWNmGr+mI9vI2F7FcujbYA
   Z6c0A75jCnoFv1Gb1yqEHat8iEN6CMHlh2XOeerxlO3F8pjRrmmAQCsbt
   q8A70BYl1msXRrhmt70qN/h9//QNFefUdZCyuVfYtBsn3H0tMSGUSDD1t
   LNxTc2iDi4bKF9pl5FqOWb2eNhN0jpw1SOEyoms5cV+KsYIyrkqEq/glh
   rR664fCmIGAbglHCjjKDD3NVn7SznLKp0cidSduaW4LvbxGjCzRBjT9ZC
   A==;
X-CSE-ConnectionGUID: 9ReOFKSLSP20QGUD25oFLA==
X-CSE-MsgGUID: 6yu+rr/+RtSz/SIsNBOU5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11356"; a="170624529"
X-IronPort-AV: E=Sophos;i="6.13,314,1732546800"; 
   d="scan'208";a="170624529"
Received: from unknown (HELO yto-r2.gw.nic.fujitsu.com) ([218.44.52.218])
  by esa11.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Feb 2025 08:24:57 +0900
Received: from yto-m2.gw.nic.fujitsu.com (yto-nat-yto-m2.gw.nic.fujitsu.com [192.168.83.65])
	by yto-r2.gw.nic.fujitsu.com (Postfix) with ESMTP id F019F106F5
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by yto-m2.gw.nic.fujitsu.com (Postfix) with ESMTP id B0719D50A1
	for <openembedded-devel@lists.openembedded.org>; Wed, 26 Feb 2025 08:24:54 +0900 (JST)
Received: from localhost.localdomain.localdomain (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id 51FD11A000B;
	Wed, 26 Feb 2025 07:24:54 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 14/51] libmime-types-perl: upgrade 2.26 -> 2.27
Date: Wed, 26 Feb 2025 07:24:04 +0800
Message-Id: <1740525881-21103-14-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
References: <1740525881-21103-1-git-send-email-wangmy@fujitsu.com>
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Feb 2025 23:25:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115608

From: Wang Mingyu <wangmy@fujitsu.com>

Changes:
- iana updates.
Fixes:
- explicitly set $/ before reading the file by line

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{libmime-types-perl_2.26.bb => libmime-types-perl_2.27.bb} | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.26.bb => libmime-types-perl_2.27.bb} (88%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.27.bb
similarity index 88%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.27.bb
index 9b4dc1caba..2f73d67aea 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.27.bb
@@ -5,7 +5,7 @@ is transmitted. Sometimes real knowledge about a mime-type is need.\
 \n\
 This module maintains a set of MIME::Type objects, which each describe \
 one known mime type."
-HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.26"
+HOMEPAGE = "https://metacpan.org/release/MARKOV/MIME-Types-2.27"
 SECTION = "libraries"
 
 LICENSE = "Artistic-1.0 | GPL-1.0-or-later"
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "${CPAN_MIRROR}/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "bc738483cb4cdb47d61e85fe9304fa929aa9ab927e3171ec2ba2ab1cd7cefdff"
+SRC_URI[sha256sum] = "276cd4488bf1d4f477d67a05d4d0c10512b18ef25f9e06d21b34ce69e64f8bdc"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
-- 
2.43.0


