Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8656CC433EF
	for <webhook@archiver.kernel.org>; Mon, 20 Dec 2021 15:08:25 +0000 (UTC)
Received: from mail1.bemta32.messagelabs.com (mail1.bemta32.messagelabs.com
 [195.245.230.65])
 by mx.groups.io with SMTP id smtpd.web09.6434.1640012904926106605
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 07:08:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=FOfJzZ8z;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.65,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1640012902; i=@fujitsu.com;
	bh=+dM76obhHjqKXFhkaJWYYIz5Ko7/JYh+aER5FJCJGAM=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=FOfJzZ8zEVcJIYcha/P7caFs18tpZpccG0/u6hF8ZlxMfWPIofc2ZbXIzLWhK28qA
	 Yza/AthW0EsXXGfncoWZlMNhAdQvd/JFpvzeEFswYYw39+XVgNdFi+w/i+Ix9rF9r9
	 1N/PWf5VhAFcxcNqwOMZlGpHIrpDNjtcBq1dXjQpHvI8ikdyEHt5P2A0X/FIYuVkmQ
	 1VQqzHIW1lO0CnarmNDiNvWcBShW4hZfeiOOvUWpLZY25u8oFpKUuCZLfxB9Sn/ylq
	 IOhHrY6FZivFj6q4NRNT8up4NOmyyBGExtMePeXOEnRs6VJNVvhWJJg827yTuF5HxS
	 TKfcD7UQDd5aA==
Received: from [100.115.7.142] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-west-1.aws.ess.symcld.net id E3/3E-13695-66C90C16;
 Mon, 20 Dec 2021 15:08:22 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqJs250C
  iwY7lohYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8a9k5wF56Urpl56xdzAeFisi5GTQ0jgCaPE
  zcOOXYxcQPYFJonbe5exQTh7GCVOdrSygVSxCehKnHu8lh3EFhHQl1g6ew8ziC0s4CmxcMJUV
  hCbRUBV4ue2rWD1vAIeEn9XLwGzJQQUJKY8fM8MEReUODnzCQuIzSwgIXHwxQugOAdQjaLE7O
  nyEOUVEq8PX2KGsNUkrp7bxDyBkW8Wku5ZSLoXMDKtYrRKKspMzyjJTczM0TU0MNA1NDTVBZK
  mJnqJVbqJeqmluuWpxSW6hnqJ5cV6qcXFesWVuck5KXp5qSWbGIGBl1LMMGsH46y+n3qHGCU5
  mJREefl9DyQK8SXlp1RmJBZnxBeV5qQWH2KU4eBQkuD9OQMoJ1iUmp5akZaZA4wCmLQEB4+SC
  G8TSJq3uCAxtzgzHSJ1itGb48XVxYuYOV6uXQIkm+7dBZKrDkxfxcwxZcHB1cwcd9oPrWYWYs
  nLz0uVEuf1ng00QgBkREZpHtwCWDRfYpSVEuZlZGBgEOIpSC3KzSxBlX/FKM7BqCTMmz4LaAp
  PZl4J3B2vgE5kAjpRKXw/yIkliQgpqQYmCcVqW4G7G49IRYqq7Tu/Ilwh7KnjGQveKQLxpz3V
  RRfsvtv0vXOqSd8J+YTJUTlaju9CCqL+iB2/t+T/7y0xBhvuPajOW/VsqtW1Pm1hrb2P/gedq
  677t/1Es+K1tGeMwd+9yhzusZVGhHSY1qVf3V7NGWaq2McTqhjDtKLrbtZK4xMfn6zV1nBbtP
  Zxg8tuyW357R1mRcWLEufOUJqY4PKj/Ep3Z3ngJWeJ9nJ7vn0f113fm3AzI1vt8ImtMY1dcmL
  8b/8ah9qvzfd17ZTZsP1y1kMH0eAjjFPevMzlsMhsjXof+1c1ey+n96tvd/tWd73Y+rWyeNIX
  69SvLsbeL5o4eh78u/roiNruciUlluKMREMt5qLiRAAD0Dl/YQMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-13.tower-591.messagelabs.com!1640012902!6359!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24227 invoked from network); 20 Dec 2021 15:08:22 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-13.tower-591.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 20 Dec 2021 15:08:22 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id DC6621009F3
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:08:21 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id CF977100232
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Dec 2021 15:08:21 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 20 Dec 2021 15:08:01 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] samba: upgrade 4.14.10 -> 4.14.11
Date: Tue, 21 Dec 2021 08:07:56 +0800
Message-ID: <1640045276-88252-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 20 Dec 2021 15:08:25 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94454

Changelog:
============
There have been a few regressions in the security release 4.14.10:

o CVE-2020-25717: A user on the domain can become root on domain members.
                  https://www.samba.org/samba/security/CVE-2020-25717.html
                  PLEASE [RE-]READ!
                  The instructions have been updated and some workarounds
                  initially adviced for 4.14.10 are no longer required and
                  should be reverted in most cases.

o BUG-14902: User with multiple spaces (eg Fred&lt;space&gt;&lt;space&gt;Nurk) become
             un-deletable. While this release should fix this bug, it is
             adviced to have a look at the bug report for more detailed
             information, see https://bugzilla.samba.org/show_bug.cgi?id=14902.

Changes since 4.14.10
---------------------

   * BUG 14878: Recursive directory delete with veto files is broken.
   * BUG 14879: A directory containing dangling symlinks cannot be deleted by
     SMB2 alone when they are the only entry in the directory.
   * BUG 14656: Spaces incorrectly collapsed in ldb attributes.
   * BUG 14694: Ensure that the LDB request has not timed out during filter
     processing as the LDAP server MaxQueryDuration is otherwise not honoured.
   * BUG 14901: The CVE-2020-25717 username map [script] advice has undesired
     side effects for the local nt token.
   * BUG 14902: User with multiple spaces (eg Fred&lt;space&gt;&lt;space&gt;Nurk) become un-
     deletable.
   * BUG 14127: Avoid storing NTTIME_THAW (-2) as value on disk
   * BUG 14922: Kerberos authentication on standalone server in MIT realm
     broken.
   * BUG 14923: Segmentation fault when joining the domain.
   * BUG 14903: Support for ROLE_IPA_DC is incomplete.
   * BUG 14788: Memory leak if ioctl(FSCTL_VALIDATE_NEGOTIATE_INFO) fails before
     smbd_smb2_ioctl_send.
   * BUG 14899: winbindd doesn&apos;t start when &quot;allow trusted domains&quot; is off.
   * BUG 14901: The CVE-2020-25717 username map [script] advice has undesired
     side effects for the local nt token.
   * BUG 14694: Ensure that the LDB request has not timed out during filter
     processing as the LDAP server MaxQueryDuration is otherwise not honoured.
   * BUG 14901: The CVE-2020-25717 username map [script] advice has undesired
     side effects for the local nt token.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../samba/{samba_4.14.10.bb => samba_4.14.11.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-connectivity/samba/{samba_4.14.10.bb => samba_4.14.11.bb} (99%)

diff --git a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb b/meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
similarity index 99%
rename from meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
rename to meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
index d51ec54d5..0e125891e 100644
--- a/meta-networking/recipes-connectivity/samba/samba_4.14.10.bb
+++ b/meta-networking/recipes-connectivity/samba/samba_4.14.11.bb
@@ -31,8 +31,7 @@ SRC_URI:append:libc-musl = " \
            file://samba-fix-musl-lib-without-innetgr.patch \
            "
 
-SRC_URI[md5sum] = "02a3ae53a9c3feb2f3c5b97141b7a8cc"
-SRC_URI[sha256sum] = "107ee862f58062682cec362ec68a24251292805f89aa4c97e7ab80237f91c7af"
+SRC_URI[sha256sum] = "3d9ebbf3280c7cf5eac1b15aeff8857b31151abaec4d2987be015a66c2945d98"
 
 UPSTREAM_CHECK_REGEX = "samba\-(?P<pver>4\.14(\.\d+)+).tar.gz"
 
-- 
2.25.1


