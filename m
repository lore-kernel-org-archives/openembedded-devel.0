Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE052C38A2D
	for <webhook@archiver.kernel.org>; Mon, 24 Oct 2022 06:49:35 +0000 (UTC)
Received: from mail1.bemta37.messagelabs.com (mail1.bemta37.messagelabs.com [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web12.16488.1666594168511283226
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 23 Oct 2022 23:49:28 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=qfEKJcFT;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2, mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1666594166; i=@fujitsu.com;
	bh=VjCIVAYyPlgCW+hALABWwvjiY1jmnXvwwrsWHFVhcI8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=qfEKJcFTqjMBzguXDUID+Mk3ZlGt9zaB/Si01/ykShEQn+OqUMnspZLWxqu2KM2Xu
	 kiNiyKkYWcL1EVh7/D0NFUlOTyseULaH6VXe8QB1P/0XtLsrwwNqbLJS+SFPb5P1cf
	 ZXhdIhcalYQOXASGLwpyJfYRaAqqu+LuW7LGJWBJA1RVclwXlnALhDqq/KaRr/dALh
	 MtT7Hgkntze2877QQ5tVZPJbJLFkxNg1Uu7xJEyXMcvd6jLnny4vHAkv24/9sk3ii3
	 XfCwxRLGdij5FKLI5NB74R+TP+lm5c5CsUl36bQbmnNV0okq/9G+orrg/2gcyUDNE4
	 2QkdhNn62sstA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrHIsWRWlGSWpSXmKPExsViZ8MxSbfMNCz
  Z4NwtbouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPH9KnMBV28FTs/bWZrYLzP3cXIxSEk8IRR
  YuHmHYxdjJxAznUmib6b6hCJA4wSF+90s4Ik2AQUJBZuPQNmiwjoSyydvYcZxBYWcJG493UCW
  JxFQFXi6YIvYHFeAXeJ3t+HwGwJoN4pD99DxQUlTs58wgJiMwtISBx88QIozgFUoygxe7o8RH
  mFxKxZbUwQtprE1XObmCcw8s1C0j0LSfcCRqZVjObFqUVlqUW6hsZ6SUWZ6RkluYmZOXqJVbq
  Jeqmlunn5RSUZuoZ6ieXFeqnFxXrFlbnJOSl6eaklmxiBQZdSnCqxg7Fh+R+9Q4ySHExKorwM
  4mHJQnxJ+SmVGYnFGfFFpTmpxYcYZTg4lCR4a7SAcoJFqempFWmZOcAIgElLcPAoifDOMgJK8
  xYXJOYWZ6ZDpE4x6nLM/Np2gFmIJS8/L1VKnFfNBKhIAKQoozQPbgQsGi8xykoJ8zIyMDAI8R
  SkFuVmlqDKv2IU52BUEuadbQA0hSczrwRu0yugI5iAjri0IgjkiJJEhJRUA9N6nzU2zxn+LTv
  4p2rhFYnrq7fczNwZ8+DYFCHD+hvrNrocc/p8JKv/neevifpfeH7sZ98YWnr7RK1EfOqKI+rx
  iruMDz6Z5jqh4L9+47mdmSbH7YwTkpZttp+4T9Eg+kTOdusZOTXzcpzNdPNYeD/r6M543xYT/
  vXvry0s7U+67rQH3N1rNGdfb1ra7df8Jtr7yoX4H52/Wv/xZHzuKk9mo7+B1d4uD6fVfHt2+t
  5fa9UTPK1vu4tuR9Xc3v+v/PCpB9s0t6swLVVfvS58To/L6S3efZ08R/dfkf/8k7nab+phN1e
  laf+CeoRmaIjL6rjpcz7TiXo1Rfd380+eiU9Obl2ss/OGzYwJp5pdpUPzlFiKMxINtZiLihMB
  cZMRs0EDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-7.tower-728.messagelabs.com!1666594165!196227!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.100.1; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 20232 invoked from network); 24 Oct 2022 06:49:26 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-7.tower-728.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 24 Oct 2022 06:49:26 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id A73FD1000EE
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:49:25 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (R01UKEXCASM126 [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 9A32B1000E9
	for <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 07:49:25 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 24 Oct 2022 07:49:24 +0100
From: <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-networking] [PATCH] tcpslice: upgrade 1.5 -> 1.6
Date: Mon, 24 Oct 2022 14:49:16 +0800
Message-ID: <1666594156-2918-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 24 Oct 2022 06:49:35 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99277

Changelog:
=========
- Call pcap_dump_close() on the output file.
- Implement new flags in ./configure: --enable-instrument-functions,
  --without-libnids, --without-libosipparser2 and --without-libooh323c.
- autoconf: Add the option to print functions and files names
- Update config.{guess,sub}, timestamps 2022-01-09,2022-01-03
- configure: use pcap-config --static-pcap-only if available
- Remove awk code from mkdep.
- Refine the man page.
- Refine the documentation files.

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../tcpdump/{tcpslice_1.5.bb => tcpslice_1.6.bb}               | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
 rename meta-networking/recipes-support/tcpdump/{tcpslice_1.5.bb => tcpslice_1.6.bb} (80%)

diff --git a/meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb b/meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
similarity index 80%
rename from meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb
rename to meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
index 4909acdee9..7128a23cd2 100644
--- a/meta-networking/recipes-support/tcpdump/tcpslice_1.5.bb
+++ b/meta-networking/recipes-support/tcpdump/tcpslice_1.6.bb
@@ -8,8 +8,7 @@ LIC_FILES_CHKSUM = "file://tcpslice.c;endline=20;md5=99519e2e5234d1662a4ce16baa6
 
 SRC_URI = "http://www.tcpdump.org/release/${BP}.tar.gz \
            "
-SRC_URI[md5sum] = "8907e60376e629f6e6ce2255988aaf47"
-SRC_URI[sha256sum] = "f6935e3e7ca00ef50c515d062fddd410868467ec5b6d8f2eca12066f8d91dda2"
+SRC_URI[sha256sum] = "60d23f00d4c485fef2dda9b12c2018af958df3a511238c45374733bbc1231920"
 
 UPSTREAM_CHECK_REGEX = "tcpslice-(?P<pver>\d+(\.\d+)+)\.tar"
 
-- 
2.25.1


