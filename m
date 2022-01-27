Return-Path: <xuhuan.fnst@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A361C433EF
	for <webhook@archiver.kernel.org>; Thu, 27 Jan 2022 10:28:44 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.2])
 by mx.groups.io with SMTP id smtpd.web11.26896.1643279322996603570
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 02:28:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Qyl55B5A;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.2,
 mailfrom: xuhuan.fnst@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643279321; i=@fujitsu.com;
	bh=87MrqaEYQDIfcRpL8ZjEem79u6BExhG1itBt6Wn3LrI=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Qyl55B5A+Yq/crcwC6XbNpFa/c06hlOBxMHpn6s66jXYadIndeIJFkBnsE2PFXUNL
	 Nsk2Ce+VovEjjU00U0nTxY2h/YT0zsHcl+AW57xu2391CYRcTPcr1qauyEkaKxq623
	 vTPah797MKTrmgAkXpa0Sm68OQrrtxqn24HSIiqxA28efL/pVzKtm2DKqDWlquq+IZ
	 UeiPohKpUwZDO6/82ib5YILNzdhNy1ov/dVmChK3L74IZnd1bHJIeDb2TRxla9iPDm
	 HXrmG1AIPA2tG835SsoQtA2K3HQWXtXsoWdo/qH9s418LmmZzfnuLCDBWa6A3y9JxU
	 EEluAxrUy1s1A==
Received: from [100.115.65.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 26/9B-30582-8D372F16; Thu, 27 Jan 2022 10:28:40 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprHIsWRWlGSWpSXmKPExsViZ8MxRfdG8ad
  Eg/3f1SwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyGq0/YCl5yVnz/uZ2pgXESZxcjF4eQwEwm
  iZ3/XrBDOCcZJZq3vmLrYuTkYBNQl3h88zUjiC0ioC+xdPYeZhCbWUBVovviGnYQW1jAX+Lfv
  E9g9SxA8a/TP4LV8Aq4SXx808MEYksIKEhMefgeKi4ocXLmExaIORISB1+8YIaoUZI4seIjVH
  2FxOvDl5gnMPLOQtIyC0nLAkamVYx2SUWZ6RkluYmZObqGBga6hoamumaWuoaWpnqJVbqJeqm
  lusmpeSVFiUBpvcTyYr3U4mK94src5JwUvbzUkk2MwGBLKXY9vINxd99PvUOMkhxMSqK8LgWf
  EoX4kvJTKjMSizPii0pzUosPMcpwcChJ8N4CyQkWpaanVqRl5gADHyYtwcGjJMIblwOU5i0uS
  MwtzkyHSJ1iVJQS560tAkoIgCQySvPg2mDRdolRVkqYl5GBgUGIpyC1KDezBFX+FaM4B6OSMG
  8byBSezLwSuOmvgBYzAS3+ff4dyOKSRISUVAOTanWeaWbsuRJX9r1WfJc1rDd++rfg0TlNV5m
  5bWcSLmg805llHR2Y1rYqa/vVYlXmBvEncsmzrk76d8379e9qzidNSi9yw27O2vKTQ5tZ63LU
  +ze1mQGaipcXPvzzc0KYuqGcjMHzI3r//b0mhJxXddg4te1lgNeqbfnn5NPZr9ZnifakCs3d5
  H2zzXXHMvtnCXV7dp4807ZsgnnLzhWdR96vOMCxbeZydYbvjey9B1wvHX0Z7xty12JXdFnrPY
  GX7CtCVxvsPKdmmcmVpn7wCb/O9KetTbap/2IdHa9XTRM/33Tn+zJPVSm3u/+/mGTddV+gYqv
  2/sxBZyXNE+z8Wnc2/Ne4c0XUucHtmeFXJZbijERDLeai4kQAOaomUDEDAAA=
X-Env-Sender: xuhuan.fnst@fujitsu.com
X-Msg-Ref: server-22.tower-528.messagelabs.com!1643279320!15184!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 10022 invoked from network); 27 Jan 2022 10:28:40 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-22.tower-528.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 27 Jan 2022 10:28:40 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 20RASYSK009397
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Thu, 27 Jan 2022 10:28:40 GMT
Received: from localhost.localdomain.localdomain (10.167.225.131) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Thu, 27 Jan 2022 10:28:32 +0000
From: XU Huan <xuhuan.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Xu Huan <xuhuan.fnst@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-pywbemtools: upgrade 0.9.0 ->
 0.9.1
Date: Thu, 27 Jan 2022 18:28:55 +0800
Message-ID: <1643279335-7991-1-git-send-email-xuhuan.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.131]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 27 Jan 2022 10:28:44 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95120

From: Xu Huan <xuhuan.fnst@fujitsu.com>

Signed-off-by: Xu Huan <xuhuan.fnst@fujitsu.com>
---
 ...ython3-pywbemtools_0.9.0.bb => python3-pywbemtools_0.9.1.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-extended/pywbemtools/{python3-pywbemtools_0.9.0.bb => python3-pywbemtools_0.9.1.bb} (92%)

diff --git a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.0.bb b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.1.bb
similarity index 92%
rename from meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.0.bb
rename to meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.1.bb
index 46b6a99605..c51f860fd5 100644
--- a/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.0.bb
+++ b/meta-python/recipes-extended/pywbemtools/python3-pywbemtools_0.9.1.bb
@@ -4,7 +4,7 @@ HOMEPAGE = "https://pywbemtools.readthedocs.io/en/stable/"
 LICENSE = "Apache-2.0"
 LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=e23fadd6ceef8c618fc1c65191d846fa"
 
-SRC_URI[sha256sum] = "f6f36c96be46c801919fa6cc218a5d051fce381a2d9a0b99c9162d8335e96c36"
+SRC_URI[sha256sum] = "cbe2fe67620e73a81807940a75aeed8570205e2213d6f8de4db15fbc06fe8804"
 
 inherit pypi setuptools3
 
-- 
2.25.1


