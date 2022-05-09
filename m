Return-Path: <zhengrq.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A2ACC433EF
	for <webhook@archiver.kernel.org>; Mon,  9 May 2022 09:00:43 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.1])
 by mx.groups.io with SMTP id smtpd.web11.29694.1652086831946992316
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 May 2022 02:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=wF+keJaS;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.1,
 mailfrom: zhengrq.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1652086830; i=@fujitsu.com;
	bh=r7wz6YqwK5kAebv5VqYxweLjYY+VrMkjKVW7q3huse8=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=wF+keJaSisklTWt0JVOL97KP080FnVDtFErtKiOsbZ3KPSDFOB1liK/PahLjuZk5V
	 bNAyG9lpFoJ3H7md0QXAg+89gszGdqvOyDt/IEEkTSORR2rk7im0Vcpvcg0rkVqNhe
	 gDAx7ZELdiFtrd8mzJ3iVbS4wXx4VUunKj26zHnBe9DYSloU1PCCENTQ1f2LHsvadg
	 10E++7Ix30ZKlU6zcPN77xWCSC1mYwn7YtyLEoGi7IeXiA+HccFzSvrCnLT11+kLhk
	 4ba173IzUUuVZPSNzoIxcrVhz0uxMVp/0wKIluvCLe3pQkiLDWKcrDLDknSvyYnuv6
	 bATeKD1yBwSfA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrJIsWRWlGSWpSXmKPExsViZ8ORqKt9oyL
  J4NhzNouLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPpyjssBRv4Kro6F7I3MP7h6WLk4hASeMIo
  sWTiFmYI5wKTxL+Fy1kgnP2MEjs3bmfqYuTkYBPQlXjxYzELiC0ioC+xdPYeZhBbWMBVYtvUj
  2BxFgEViQvnJwHVc3DwCrhLdP60AQlLCChITHn4HqycV0BQ4uTMJ2DlzAISEgdfvGAGKZcQUJ
  SYPV0eorxC4vXhS8wQtprE1XObmCcw8s1C0j0LSfcCRqZVjHZJRZnpGSW5iZk5uoYGBrqGhqa
  6Zua6hmZmeolVuol6qaW6yal5JUWJQGm9xPJivdTiYr3iytzknBS9vNSSTYzAEEwpdl62g/Fd
  30+9Q4ySHExKorzrr1YkCfEl5adUZiQWZ8QXleakFh9ilOHgUJLg/QiSEyxKTU+tSMvMAcYDT
  FqCg0dJhLcLJM1bXJCYW5yZDpE6xagoJc6beB0oIQCSyCjNg2uDxeAlRlkpYV5GBgYGIZ6C1K
  LczBJU+VeM4hyMSsK84SBTeDLzSuCmvwJazAS0+GNAKcjikkSElFQDE9OJf54l//sOr+etrPx
  7y+zh7kM9JRXnbJ266zd4LN3Ibc9rEmp+zeJU8kfLxh0H1k5T2XHr5R8xDg6NafVbT2518JH6
  zlc3Ny/xxpnsDZV1PFGbL2zNXfI4RHvH85k3bfrPpi7ad+DLfJceIx+5kw0snh3ly08uyj1nM
  usRi+5ndf2mrXePMGpUPyk8bc5ucSV3i0rUr8OHCjbtNghS/CjYll+/ruH+J61sjp352yyX/t
  v12TXp95tgz4+G73etVfm17VHENjlXtqapv2olsyv5VZ0+PvskX1fd1qk+JfPe8/zpLxgueVp
  N3LzjZ9eT7Z9KLbf+4dgbliP+myl0QmbJ9AC7DWufuL3j9mIWfafEUpyRaKjFXFScCABf7x/i
  PAMAAA==
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-528.messagelabs.com!1652086826!6443!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.86.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 13389 invoked from network); 9 May 2022 09:00:27 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-8.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 9 May 2022 09:00:27 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id 8726710018E
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:00:26 +0100 (BST)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id 7A7C510004E
	for <openembedded-devel@lists.openembedded.org>;
 Mon,  9 May 2022 10:00:26 +0100 (BST)
Received: from CentOS7.g08.fujitsu.local (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.32; Mon, 9 May 2022 10:00:04 +0100
From: zhengrq.fnst <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] glibmm-2.68: upgrade 2.70.0 -> 2.72.1
Date: Mon, 9 May 2022 16:59:49 +0800
Message-ID: <1652086789-2558-1-git-send-email-zhengrq.fnst@fujitsu.com>
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
 <openembedded-devel@lists.openembedded.org>; Mon, 09 May 2022 09:00:43 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/97013

Changelog:
==========
Glib:
* ustring_Iterator: Don't declare copy constructor =default.
  A fix in the 2.72.0 release broke ABI.
* MainContext: Add create(MainContextFlags flags)

Gio:
* Add AppInfoMonitor
* DBus::Proxy: signal_signal() accepts a signal name
* File: Add move_async() and move_finish()
* SocketClient: Deprecate set/get/property_tls_validation_flags()
* TlsCertificate: Add properties private_key, private_key_pem,
pkcs11_uri, private_key_pkcs11_uri. Fix the create*() methods.
* TlsClientConnection.hg: Deprecate set/get/property_validation_flags()

gmmproc:
* Add "ignore_deprecations" argument in _WRAP_METHOD()

Build:
* Require glib-2.0 >= 2.71.2
* MSVC build: Support VS2022 builds
* Meson build: Specify 'check' option in run_command()
  Require Meson >= 0.55.0

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../glib-2.0/{glibmm-2.68_2.70.0.bb => glibmm-2.68_2.72.1.bb}   | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-core/glib-2.0/{glibmm-2.68_2.70.0.bb => glibmm-2.68_2.72.1.bb} (90%)

diff --git a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.70.0.bb b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.72.1.bb
similarity index 90%
rename from meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.70.0.bb
rename to meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.72.1.bb
index 278cfd87b..f13cf9d50 100644
--- a/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.70.0.bb
+++ b/meta-oe/recipes-core/glib-2.0/glibmm-2.68_2.72.1.bb
@@ -13,7 +13,7 @@ inherit gnomebase
 
 SHRT_VER = "${@d.getVar('PV').split('.')[0]}.${@d.getVar('PV').split('.')[1]}"
 
-SRC_URI[archive.sha256sum] = "8008fd8aeddcc867a3f97f113de625f6e96ef98cf7860379813a9c0feffdb520"
+SRC_URI[archive.sha256sum] = "2a7649a28ab5dc53ac4dabb76c9f61599fbc628923ab6a7dd74bf675d9155cd8"
 
 S = "${WORKDIR}/${GNOMEBN}-${PV}"
 
-- 
2.25.1


