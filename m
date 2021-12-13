Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A342AC433F5
	for <webhook@archiver.kernel.org>; Mon, 13 Dec 2021 09:01:41 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com
 [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web08.8862.1639386100252554623
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 01:01:40 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="body hash did not verify" header.i=@fujitsu.com
 header.s=170520fj header.b=ruAqsxn3;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1639386097; i=@fujitsu.com;
	bh=Ez0gjTsX9VASqCqQDcVCUJh9ahtTmQ8qakmaGyKwAxQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	b=ruAqsxn3GNob8nm2B8+m/gDpdhJehSsJhXWpprAtCoepyBH5L4hZFy4ukyWBZ0mRz
	 QEru4cbcnvB37Ime9iEXGTcg7i0dsPlv08D5vDEQ67b0PI1rtkVvXD6yIJqimksEos
	 WfrMEPJtc6xiIAg0fcV0Xfw1sJijzaLvPwBw0tjQjMoGMD/ve78h6MhHZO1gnq38v2
	 Fi+T1aP1OP1vB1cytGHMfyIjaE5PK9kODer3NM8diVNqyiYRkJtIoiYu4hw3NeT+KX
	 Y00jHQwVRSVNbNHnNZa5DHYlr6CF18nBcZLq1MgekvtX5+Rp02kArhoFcb4rWjNI45
	 D7PGhGH3DIEdA==
Received: from [100.115.0.27] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-1.bemta.az-a.eu-west-1.aws.ess.symcld.net id 84/79-14524-1FB07B16;
 Mon, 13 Dec 2021 09:01:37 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrCIsWRWlGSWpSXmKPExsViZ8MRovuRe3u
  iwZ35QhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa0bnLZOCZq6K518WsjcwfuDoYuTiEBKYySQx
  9cNmVghnD6NEa3MLSxcjJwebgK7Eucdr2UFsEQF9iaWz9zCD2MIC7hLzFk8Aq2ERUJV4eW0DK
  4jNK+ApcfHORiYQW0JAQWLKw/fMEHFBiZMzn4DVMwPVdx95ygRhy0s0b50NVMMBVK8oMXu6PE
  RrhcTrw5eYJzDyzkLSPQtJ9ywk3QsYmVcxWiUVZaZnlOQmZuboGhoY6Boamuqa6RoZGuglVuk
  m6qWW6panFpfoGuollhfrpRYX6xVX5ibnpOjlpZZsYgQGXkox26UdjHP7fuodYpTkYFIS5Q1m
  3Z4oxJeUn1KZkVicEV9UmpNafIhRhoNDSYI3GhjKQoJFqempFWmZOcAogElLcPAoifCmcQKle
  YsLEnOLM9MhUqcYFaXEeU9xASUEQBIZpXlwbbDIu8QoKyXMy8jAwCDEU5BalJtZgir/ilGcg1
  FJmNeXA2gKT2ZeCdz0V0CLmYAWM1ZuBllckoiQkmpg0vmU68l+cP8R0bCePr4dJ5cu4X00641
  S4lfP92rnN4dcuxl1unyepJ6XS0nMPxOtV8kx+4TeNy9gNqx+7n3HVun5husqC10jPtRfSJ3I
  2re26+jt6R1GRz/9ly50Ofnzgqbfyn7ezykqO83cGth/9DfsV7i54KyJ8RfNKydeeF3f6RPcF
  Xfk/7JLb4J6AlYbts7quKLSfezFI5dNciXFleorXT4byExVk5rHqMEv9M92LssajykKBzpe/N
  7ffzM0bM+n119Tnz6ycBRQbFXKmcueNbnl9eX01Q3/3efsXHg+onbq4YuzS3/NtOE3P6XewCC
  as9djy8/b/dmbXDtLT0te/fm/VIpVJazIapr8WSWW4oxEQy3mouJEAAFdmaA3AwAA
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-20.tower-585.messagelabs.com!1639386096!174298!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 24397 invoked from network); 13 Dec 2021 09:01:37 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-20.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 13 Dec 2021 09:01:37 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1BD91SJ1016150
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Mon, 13 Dec 2021 09:01:36 GMT
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Mon, 13 Dec 2021 09:01:26 +0000
From: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] php: Fix bug when configure php-native.
Date: Tue, 14 Dec 2021 02:01:17 +0800
Message-ID: <1639418477-129618-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain; charset="y"
Content-Transfer-Encoding: quoted-printable
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 13 Dec 2021 09:01:41 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/94313

Fix error caused by modify of libtool from poky.
 libtool: don't prefix the installed binary 
 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -m 0755 ${HOST_SYS}-libtool ${D}${bindir}/${HOST_SYS}-libtool
 +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0install -m 0755 libtool ${D}${bindir}/libtool 

When executing do_configure of php-native, the folloing error occured:
sed: can't read x86_64-linux-libtool: No such file or directory

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 meta-oe/recipes-devtools/php/php_8.0.12.bb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/meta-oe/recipes-devtools/php/php_8.0.12.bb b/meta-oe/recipes-devtools/php/php_8.0.12.bb
index 4f484179cc..38771948f1 100644
--- a/meta-oe/recipes-devtools/php/php_8.0.12.bb
+++ b/meta-oe/recipes-devtools/php/php_8.0.12.bb
@@ -141,8 +141,8 @@ EOF
 
 do_configure:append() {
     # No, libtool, we really don't want rpath set...
-    sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=3D""|g' ${HOST_SYS}-libtool
-    sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g' ${HOST_SYS}-libtool
+    sed -i 's|^hardcode_libdir_flag_spec=3D.*|hardcode_libdir_flag_spec=3D""|g' libtool
+    sed -i 's|^runpath_var=3DLD_RUN_PATH|runpath_var=3DDIE_RPATH_DIE|g' libtool
 }
 
 do_install:append:class-native() {
-- 
2.25.1


