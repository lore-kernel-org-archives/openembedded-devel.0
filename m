Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5971C54EE9
	for <webhook@archiver.kernel.org>; Tue, 27 Sep 2022 08:23:42 +0000 (UTC)
Received: from mail1.bemta34.messagelabs.com (mail1.bemta34.messagelabs.com
 [195.245.231.2])
 by mx.groups.io with SMTP id smtpd.web09.8435.1664267014890270751
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 01:23:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=lO4psSR+;
 spf=pass (domain: fujitsu.com, ip: 195.245.231.2,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1664267013; i=@fujitsu.com;
	bh=sqDYkywBUJFSfCxB0xwPokZtPql3OXELcsFOEt0JZIk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=lO4psSR+LmF4iCa619H4TdcYHlBwqKKqWqa/o7k8TdHgdT6pEvsuCKJxiUUl0hiud
	 qNJ2EBDsL1AtsjKL7LMlkgcN9YZHWbAAi/Ov5+cDs/f+FpTfaXVF0sVw7EOTeW8lJq
	 rxcKpI/Z8VgzFW0bpe4TFMI5pFAG/mYYg8pciDUlauUZUAfxxjmd8LZJUM/Qp48sfW
	 up+NN02hp2p6um6CepsdXqZBckxIyiVhHD5Xr/1+EPMr4HvSf1Z8qpaHfXF4ycnUIm
	 Pqd13j4vuvn8pjyaEmaRTM24By/PSlMc6r3TEfrDrdgHK5E+SX2MAnapqc5dAXhotH
	 qebSzpL6l0qpw==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFtrPIsWRWlGSWpSXmKPExsViZ8MxSZd1s1G
  ywZFQi4uHlzI7MHqc27iCMYAxijUzLym/IoE14+vcs4wFP7gqth97xdjA+Iyzi5GLQ0jgCaPE
  /751rBDOdSaJS4e+sUM4exglJi94B5Th5GATUJOYfusGmC0ioC+xdPYeZhCbWUBF4sXvHnYQW
  1jASaJ/ZhtYDYuAqkRf+2ewGl4BR4nVjS8YQWwJAQWJKQ/fQ8UFJU7OfMICMUdC4uCLF8wQNY
  oSsy83s0DYFRKN0w8xQdhqElfPbWKewMg/C0n7LCTtCxiZVjFaJxVlpmeU5CZm5ugaGhjoGhq
  a6hobAZkmeolVuol6qaW65anFJbpGeonlxXqpxcV6xZW5yTkpenmpJZsYgWGZUqyQsYPx+8qf
  eocYJTmYlER57RcZJQvxJeWnVGYkFmfEF5XmpBYfYpTh4FCS4GVaD5QTLEpNT61Iy8wBxghMW
  oKDR0mEd90SoDRvcUFibnFmOkTqFKMux8yvbQeYhVjy8vNSpcR5Z24EKhIAKcoozYMbAYvXS4
  yyUsK8jAwMDEI8BalFuZklqPKvGMU5GJWEeZeuBZrCk5lXArfpFdARTEBH2PHpgxxRkoiQkmp
  g0rzslPRb+Xq0nWX96+ztlgb6p8I2bPq9UY0pd4O3SVNqq/F+0cuWvuZnr6jNWahzxbbwZeia
  rZFfK/OuOD/n7uF/kZNiaKD26+TU5SKvBMTZ35wL+3Q87Juo7XUlEbbI2HRXIckGxZX96vmZO
  05v6VKdzOE/q3+i/cSXS3/eLM+dOtN4rvGbG+/uSV82sA87dTDDILyy6a3beQGF6S8W7mEtP/
  3x1Mv+4z3f7iSvCT0QOvN9+E+GO4lmElt/HLx5IkrWtpPl/ctjDo4/MxLSV3n0h/+QDND4e/W
  oiLS4eM8ul69Tlizv3PC4d6ttxatDcgveLtFKmFw4Y3Lxhj/5ckm6nJ0zezSZ3Nb17DPTUWIp
  zkg01GIuKk4EABuVrsZSAwAA
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-10.tower-548.messagelabs.com!1664267012!9271!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.87.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 28034 invoked from network); 27 Sep 2022 08:23:33 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-10.tower-548.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Sep 2022 08:23:33 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id AF1811000CD
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:32 +0100 (BST)
Received: from R01UKEXCASM121.r01.fujitsu.local (R01UKEXCASM121
 [10.183.43.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id A1F1C1000C2
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 27 Sep 2022 09:23:32 +0100 (BST)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Tue, 27 Sep 2022 09:23:30 +0100
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] tracker: upgrade 3.3.3 -> 3.4.0
Date: Tue, 27 Sep 2022 16:23:19 +0800
Message-ID: <1664267003-2293-1-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM121.r01.fujitsu.local (10.183.43.173)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 27 Sep 2022 08:23:42 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/98969

 Highlighted changes since 3.3.0:
  * Added tracker_sparql_connection_deserialize_async() API
    to deserialize RDF content.
  * Library is no built monolithically, Vala dependency is removed
  * Improved performance of database updates

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../tracker/{tracker_3.3.3.bb => tracker_3.4.0.bb}              | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-gnome/tracker/{tracker_3.3.3.bb => tracker_3.4.0.bb} (93%)

diff --git a/meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb b/meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb
similarity index 93%
rename from meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
rename to meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb
index 91d90dde2a..ed0fbb6f01 100644
--- a/meta-gnome/recipes-gnome/tracker/tracker_3.3.3.bb
+++ b/meta-gnome/recipes-gnome/tracker/tracker_3.4.0.bb
@@ -22,7 +22,7 @@ GNOMEBASEBUILDCLASS = "meson"
 
 inherit gnomebase gsettings gobject-introspection vala gtk-doc manpages bash-completion features_check python3native
 
-SRC_URI[archive.sha256sum] = "4094f704e338f2247fa6b94633279cfd07f7e952bb24627128fab78edb242464"
+SRC_URI[archive.sha256sum] = "b3b380c9571d7c7423b5f401e4a2f2d78de47143b035eb2c1281e2423c59218b"
 
 # gobject-introspection is mandatory and cannot be configured
 REQUIRED_DISTRO_FEATURES = "gobject-introspection-data"
-- 
2.25.1


