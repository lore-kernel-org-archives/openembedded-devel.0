Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 208E1C433EF
	for <webhook@archiver.kernel.org>; Tue, 25 Jan 2022 13:13:30 +0000 (UTC)
Received: from mail1.bemta36.messagelabs.com (mail1.bemta36.messagelabs.com
 [85.158.142.113])
 by mx.groups.io with SMTP id smtpd.web10.6776.1643116409043760567
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 05:13:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Rlt2BkO2;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.113,
 mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1643116406; i=@fujitsu.com;
	bh=vdzhokodcWDflbwpQUUq5VSzHZAPSyphwO29BeLGny0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=Rlt2BkO2oG1zKJMC5T3erltjkjTKqbPfM4OgPyJIg0fTyaemhbDHv3iIjRwqcaQum
	 63acZk0iBGP5X6QH4Ah7KilM3c8/p4H1BYsk8LoVoqTkQuSt5/Hon8szI+tdb1U5GV
	 YUUfN6LljA4TUXP4n4rJSVfq78b/Kp+6oNl9cm8/s6/XExe+QY8dfi41oTFxlW+BF6
	 Dsa5MjI2eJLUuK7L9F31/gMwUQrv8TSqEuUrJaulW5z5ne934LFGw21Tf/XYWo9qYA
	 TbCG4bpliuQLd1q8WNa/bYQTc53mTyEptv7u9LHCprQscQ4FnepqNJCBbaRUyPcM8O
	 h+JO+d897idzw==
Received: from [100.115.65.91] (using TLSv1.2 with cipher
 DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-central-1.aws.ess.symcld.net id
 9A/67-23802-677FFE16; Tue, 25 Jan 2022 13:13:26 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrHIsWRWlGSWpSXmKPExsViZ8ORqFv2/X2
  iwYmnIhYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8aZ/gPMBZe4Kl78Os7awHiXs4uRi0NI4Amj
  xL/NT5ghnAtMEktX3mLvYuQEck4wSjS3lIHYbAJqEtNv3WAFsUUE9CWWzt7DDGIzC6hIvPjdA
  1YvLOAssfHILkYQm0VAVeLHu+NMIDavgKPE7Pc7wXolBBQkpjx8D9bLKeAkca1nMyPELkeJzg
  cL2SDqBSVOznzCAjFfQuLgixfMEL2KErMvN7NA2BUSs2a1MUHYahJXz21insAoOAtJ+ywk7Qs
  YmVYx2iUVZaZnlOQmZuboGhoY6BoamuqamekaWpjpJVbpJuqlluomp+aVFCUCpfUSy4v1UouL
  9Yorc5NzUvTyUks2MQKDOaXYadcOxoN9P/UOMUpyMCmJ8iaue58oxJeUn1KZkVicEV9UmpNaf
  IhRhoNDSYL31SegnGBRanpqRVpmDjCyYNISHDxKIrzK34DSvMUFibnFmekQqVOMilLivMIgCQ
  GQREZpHlwbLJovMcpKCfMyMjAwCPEUpBblZpagyr9iFOdgVBLm/f4VaApPZl4J3PRXQIuZgBb
  /Pv8OZHFJIkJKqoFJzOvU/wAh958zObxznu+X/PmodJugpEe3xJw8I0GePvsIF+Y1rdp93UYH
  261fTwhR4Nddv35te2hL3KYlR92meUgXLTqf8+2ZhHnJUU+f8yser3T7NMOh4LeW0dlXExrEm
  Q4KOlam1cyZpTGT3e9pX9prH7E1Hhfk660uOvSlP7vhWi9wM2mi6ootDIIrYryu/e03ORi+79
  mffAntt+ZPBViO7/MVyFp30sU9+EpwyuIFX2KrgvTDT4fE3bmu+tJCKUz9p5EVz7OVIZ43Fl/
  4PqeInbHv+4KrCi/nGi2zubhG2cpMwLB18Y9/Gu8ilY7NPxNgdDh2lezi93W2RQfdd+v+1+j5
  u2hdZ3+jyxMlluKMREMt5qLiRADd+18zYQMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-16.tower-532.messagelabs.com!1643116406!17693!1
X-Originating-IP: [62.60.8.97]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.7; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 9399 invoked from network); 25 Jan 2022 13:13:26 -0000
Received: from unknown (HELO n03ukasimr01.n03.fujitsu.local) (62.60.8.97)
  by server-16.tower-532.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384
 encrypted SMTP; 25 Jan 2022 13:13:26 -0000
Received: from n03ukasimr01.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTP id C9C08100194
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:13:25 +0000 (GMT)
Received: from R01UKEXCASM126.r01.fujitsu.local (unknown [10.183.43.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr01.n03.fujitsu.local (Postfix) with ESMTPS id BCEDA100180
	for <openembedded-devel@lists.openembedded.org>;
 Tue, 25 Jan 2022 13:13:25 +0000 (GMT)
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.26; Tue, 25 Jan 2022 13:13:04 +0000
From: Wang Mingyu <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-gnome] [PATCH] libnma: upgrade 1.8.32 -> 1.8.34
Date: Tue, 25 Jan 2022 21:12:45 +0800
Message-ID: <1643116367-7352-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1643116367-7352-1-git-send-email-wangmy@fujitsu.com>
References: <1643116367-7352-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 25 Jan 2022 13:13:30 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95058

Changelog:
=========
Add possibility of building libnma-gtk4 library with experimental Gtk4 support.

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libnma/{libnma_1.8.32.bb => libnma_1.8.34.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-gnome/recipes-connectivity/libnma/{libnma_1.8.32.bb => libnma_1.8.34.bb} (91%)

diff --git a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.32.bb b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb
similarity index 91%
rename from meta-gnome/recipes-connectivity/libnma/libnma_1.8.32.bb
rename to meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb
index 747c67b03..311492eea 100644
--- a/meta-gnome/recipes-connectivity/libnma/libnma_1.8.32.bb
+++ b/meta-gnome/recipes-connectivity/libnma/libnma_1.8.34.bb
@@ -10,7 +10,7 @@ inherit gnomebase gobject-introspection gtk-doc gettext vala features_check
 REQUIRED_DISTRO_FEATURES = "${@bb.utils.contains('PACKAGECONFIG','gcr','x11','',d)}"
 ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
 
-SRC_URI[archive.sha256sum] = "0a57b93a2fad43acc763f320dd3a7a93c429b0e3118dfa549d67824cddc4e905"
+SRC_URI[archive.sha256sum] = "f5e2e738e0fca7f2a549079290b2d8017511d485a83220c36df380a3b4753304"
 
 PACKAGECONFIG ?= "gcr iso_codes mobile_broadband_provider_info"
 PACKAGECONFIG[gcr] = "-Dgcr=true,-Dgcr=false,gcr"
-- 
2.25.1


