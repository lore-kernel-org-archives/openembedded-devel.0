Return-Path: <wangmy@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A48C64EC7
	for <webhook@archiver.kernel.org>; Sun, 12 Feb 2023 10:02:14 +0000 (UTC)
Received: from mail3.bemta32.messagelabs.com (mail3.bemta32.messagelabs.com [195.245.230.17])
 by mx.groups.io with SMTP id smtpd.web10.8371.1676196132925988592
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 12 Feb 2023 02:02:13 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=F2uiNzud;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.17, mailfrom: wangmy@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1676196131; i=@fujitsu.com;
	bh=IMfCm9MTj6/1MwC78/BxIjV24vSl2ylKYUBz6i1NIc4=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=F2uiNzudKfaA6h3rcCKWUAiR0H+kBWJQ6DbhvXwailKGhLMvpbyiUhq6Wwc6SAqL+
	 IXQ8kBtdc0gZE8WlZO0bO0ABM+r2WeDR+giyYh5yk0VZL3p/cs/Me9u0AYRkHlRZwr
	 VDlRzZ0lAapptiWF/cWYFHHQy/HrTkd9+qdUoQDeRvxWwr1toEkd8z7xRlvv2+YyWZ
	 H8BgnP64abwr/6L4UFdE/ZnjKmALY6+harFwo5tK+56tRDXSKqC/PZJcexTXd+WI9L
	 6tNrFEUsyizyPNXZCBC9+o9+qPA/fk83G1fMOAbOQiIa0P/5rSNKdbhd+Uq16lodRn
	 yFgp1dkY/tTYQ==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFjrGIsWRWlGSWpSXmKPExsViZ8MxSVdp54t
  kg78/tCwuHl7K7MDocW7jCsYAxijWzLyk/IoE1oyJBz+yF6zjrNh+fRJ7A+Mpji5GLg4hgSeM
  EhdvnmaFcG4wSZxY18UE4exllHjSsBwow8nBJiAlceP+fzYQW0RAX2Lp7D3MIDazgIrEi9897
  CC2sICfRMuveWD1LAKqElvPHWEBsXkFnCSm/3kIZksIKEhMefgerJdTwFlixpnvjCC2EFDN9v
  4uqHpBiZMzn7BAzJeQOPjiBTNEr6LE7MvNUHMqJVo//IKy1SSuntvEPIFRcBaS9llI2hcwMq1
  iNC1OLSpLLdI10ksqykzPKMlNzMzRS6zSTdRLLdUtTy0u0TXUSywv1kstLtYrrsxNzknRy0st
  2cQIDN6UYrbuHYzre//qHWKU5GBSEuVdtvlpshBfUn5KZUZicUZ8UWlOavEhRhkODiUJ3hvbX
  yQLCRalpqdWpGXmACMJJi3BwaMkwiu+DijNW1yQmFucmQ6ROsWoKCXO+wGkTwAkkVGaB9cGi9
  5LjLJSwryMDAwMQjwFqUW5mSWo8q8YxTkYlYR5328BmsKTmVcCN/0V0GImoMUMUk9BFpckIqS
  kGpgqP72Oe83uuIYpX2jORNbezFTftZMlXCdp6mrXy/BPYy9yXqndcXrGTasf36dJHfeelF72
  6tsdl9nT7DJ/33v5Mv3V1Tt7w6v3V26sf7yYkW3u4bQf59U6J20M7X1tOVlbY/dPjfDQtcve/
  Xn04NH6XebRWvu07otJ3EuevWrr5AMrQrRvcglHXBS+KZOnsFh32pv+Q5/uF644ny7H/IJ76j
  dNfQWbZcpJdws9fC67dsY65PkcWyNSUMAz8TKz5T22hc2How5HMW3tST/99vg1pQSLvcUq0l3
  zqoVuWLcYGHcUHqtKjrpsPL8ooXOa67ufZ7u+XPZenbTFUSdE4vPS1OcCi16/dXy1/bX2uWt/
  lFiKMxINtZiLihMBENhigVkDAAA=
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-4.tower-585.messagelabs.com!1676196130!487457!1
X-Originating-IP: [62.60.8.146]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.102.2; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 11991 invoked from network); 12 Feb 2023 10:02:10 -0000
Received: from unknown (HELO n03ukasimr02.n03.fujitsu.local) (62.60.8.146)
  by server-4.tower-585.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 12 Feb 2023 10:02:10 -0000
Received: from n03ukasimr02.n03.fujitsu.local (localhost [127.0.0.1])
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTP id 54F961000DC
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:10 +0000 (GMT)
Received: from R01UKEXCASM223.r01.fujitsu.local (R01UKEXCASM223 [10.182.185.121])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
	(No client certificate requested)
	by n03ukasimr02.n03.fujitsu.local (Postfix) with ESMTPS id 492511000D7
	for <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:10 +0000 (GMT)
Received: from localhost.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.42; Sun, 12 Feb 2023 10:02:08 +0000
From: <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-python] [PATCH] python3-xlsxwriter: upgrade 3.0.7 -> 3.0.8
Date: Sun, 12 Feb 2023 18:01:50 +0800
Message-ID: <1676196111-13722-4-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
References: <1676196111-13722-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
X-Virus-Scanned: ClamAV using ClamSMTP
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 12 Feb 2023 10:02:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101051

From: Wang Mingyu <wangmy@fujitsu.com>

Changelog:
===========
* Fix for "autofit()" exception when user defined column width was "None".

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 ...{python3-xlsxwriter_3.0.7.bb => python3-xlsxwriter_3.0.8.bb} | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-xlsxwriter_3.0.7.bb => python3-xlsxwriter_3.0.8.bb} (82%)

diff --git a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.7.bb b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.8.bb
similarity index 82%
rename from meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.7.bb
rename to meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.8.bb
index e73e579e3..4b89ba68d 100644
--- a/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.7.bb
+++ b/meta-python/recipes-devtools/python/python3-xlsxwriter_3.0.8.bb
@@ -16,6 +16,6 @@ RDEPENDS:${PN} += " \
 	python3-io \
 "
 
-SRC_URI[sha256sum] = "1239958b12da12be6abf05b32f64ff162eb75fff0fdf00d901ca0f46dc0557cf"
+SRC_URI[sha256sum] = "ec77335fb118c36bc5ed1c89e33904d649e4989df2d7980f7d6a9dd95ee5874e"
 
 BBCLASSEXTEND = "native nativesdk"
-- 
2.34.1


