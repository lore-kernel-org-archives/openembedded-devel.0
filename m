Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C4A63C54792
	for <webhook@archiver.kernel.org>; Mon, 19 Feb 2024 09:02:49 +0000 (UTC)
Received: from esa5.hc1455-7.c3s2.iphmx.com (esa5.hc1455-7.c3s2.iphmx.com [68.232.139.130])
 by mx.groups.io with SMTP id smtpd.web10.37318.1708333362255109373
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 19 Feb 2024 01:02:45 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj2 header.b=iKkC2i8G;
 spf=pass (domain: fujitsu.com, ip: 68.232.139.130, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj2;
  t=1708333366; x=1739869366;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references;
  bh=regKjnK1eRe1lJ1e4rC69fWJhxOp0GC3oKBdpjtYlQ8=;
  b=iKkC2i8Geeac7fbV2PZVAhzHbmri71IauLPWAARf2H860bxl4X0GHnSt
   3/kNVRovX4sWMf0UBOeiie6cJstL/HGjOOUQcBdrdvIn6UiVw3kNxAK7T
   feLk0hbaPiQR9fGhqC1NcIWAmcVMgjSvPpL3DGmFInmS5SEURYYlz31sg
   LpjmM3fjPe452G3ObbjncUSYbyr4QQiDNFnyIWwzqIE58eorhuhvkYGqr
   tVSryYU1+U/0zHG3zuY98ayP5rPw76+GjjGBdYhXrfwms50uov+PoxYvf
   1MN99JyQigGPpSGjdRc4hjm2cAeolztfBjOlH03l8yEwjcVyYFkgrYxKy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10988"; a="149230098"
X-IronPort-AV: E=Sophos;i="6.06,170,1705330800"; 
   d="scan'208";a="149230098"
Received: from unknown (HELO yto-r4.gw.nic.fujitsu.com) ([218.44.52.220])
  by esa5.hc1455-7.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2024 18:02:44 +0900
Received: from yto-m1.gw.nic.fujitsu.com (yto-nat-yto-m1.gw.nic.fujitsu.com [192.168.83.64])
	by yto-r4.gw.nic.fujitsu.com (Postfix) with ESMTP id 6E428D7730
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:41 +0900 (JST)
Received: from kws-ab3.gw.nic.fujitsu.com (kws-ab3.gw.nic.fujitsu.com [192.51.206.21])
	by yto-m1.gw.nic.fujitsu.com (Postfix) with ESMTP id B2F41CFA5A
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:40 +0900 (JST)
Received: from edo.cn.fujitsu.com (edo.cn.fujitsu.com [10.167.33.5])
	by kws-ab3.gw.nic.fujitsu.com (Postfix) with ESMTP id 2DCA720099594
	for <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 18:02:40 +0900 (JST)
Received: from vm4860.g01.fujitsu.local (unknown [10.193.128.200])
	by edo.cn.fujitsu.com (Postfix) with ESMTP id CD0D41A006B;
	Mon, 19 Feb 2024 17:02:39 +0800 (CST)
From: wangmy@fujitsu.com
To: openembedded-devel@lists.openembedded.org
Cc: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-perl] [PATCH 10/23] libmime-types-perl: upgrade 2.24 -> 2.26
Date: Mon, 19 Feb 2024 17:02:13 +0800
Message-Id: <1708333346-17704-10-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
References: <1708333346-17704-1-git-send-email-wangmy@fujitsu.com>
X-TM-AS-GCONF: 00
X-TM-AS-Product-Ver: IMSS-9.1.0.1417-9.0.0.1002-28200.006
X-TM-AS-User-Approved-Sender: Yes
X-TMASE-Version: IMSS-9.1.0.1417-9.0.1002-28200.006
X-TMASE-Result: 10-1.274700-10.000000
X-TMASE-MatchedRID: dhm/lGuWeZijz0nOeth/yUIIxwDaU5mrxZpjHSMI6w4zyScpZuj/nr6p
	xbTOjavy+7QcRaVoa8nGKIf6hBf7VaGGOyqBK41vEXjPIvKd74AQhNjZQYyI3HZonBD1OvOD7Fo
	gUQ0vV9iDmiu0er9jDPWR3E+K7Cl9uJXEeLLJ6+yeAiCmPx4NwGmRqNBHmBveeFIQTy0Zb4bfaY
	87m2dqxydET58jp62SLEh7yikk59NL6eHyi3R8P6jkrtDkhAwhquvt6XadPmFRpF8R1QTnalEQc
	ckrnwNxe6AeA7gneJAkMzzjX8CilYq8Qmb6kmIxS7+RMq/2CK6rA4c7UV2fQpvi2PQO/FFQiz2u
	jrPVx9yEIU1NtMkm0Q==
X-TMASE-SNAP-Result: 1.821001.0001-0-1-22:0,33:0,34:0-0
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 19 Feb 2024 09:02:49 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/108855

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
==========
- iana updates
- support multi-level extensions.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{libmime-types-perl_2.24.bb => libmime-types-perl_2.26.bb}  | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-perl/recipes-perl/libmime/{libmime-types-perl_2.24.bb => libmime-types-perl_2.26.bb} (93%)

diff --git a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.24.bb b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
similarity index 93%
rename from meta-perl/recipes-perl/libmime/libmime-types-perl_2.24.bb
rename to meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
index a3d9ceef0..fa4ad6fc4 100644
--- a/meta-perl/recipes-perl/libmime/libmime-types-perl_2.24.bb
+++ b/meta-perl/recipes-perl/libmime/libmime-types-perl_2.26.bb
@@ -14,7 +14,7 @@ LIC_FILES_CHKSUM = "file://META.yml;beginline=11;endline=11;md5=963ce28228347875
 SRC_URI = "http://search.cpan.org/CPAN/authors/id/M/MA/MARKOV/MIME-Types-${PV}.tar.gz \
            file://run-ptest \
           "
-SRC_URI[sha256sum] = "629e361f22b220be50c2da7354e23c0451757709a03c25a22f3160edb94cb65f"
+SRC_URI[sha256sum] = "bc738483cb4cdb47d61e85fe9304fa929aa9ab927e3171ec2ba2ab1cd7cefdff"
 
 S = "${WORKDIR}/MIME-Types-${PV}"
 
-- 
2.34.1


