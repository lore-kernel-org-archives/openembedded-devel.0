Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web12.592.1626397981981646924
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jul 2021 18:13:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=gD2ccpeO;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1626397979; i=@fujitsu.com;
	bh=4orzUH9ZEZIU5tjIV9W/CwTbEjO8iWeJ1UGuXYKYd6U=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=gD2ccpeOwCNRjhOBXJHRihWjdKmYsttZMPoyg3RH9kC3QAqOP8tSdq79c0hN0oCWG
	 fFraLpP7HtOEmy6lHkVEqA+KhfqnN8b7+hyzwlJ2YkhFi7YghVWOxZJPpXggY2OhnG
	 tuOuyccdRkqLbwOLT1MJKDHodblZqm9rTXONcJfXyZRhbnuEMlIEBpw30BKyIDKKVY
	 z4lylT8RViuFXbJpEWeL88lu6MQ33OhoYT9MEffX9gfHiC3xynEm5rgQxWWW5e+Gnk
	 mvHmPqKve0X/2ldF6FMx2nCnVz6ci8acOePDke8y6pGw4QdtgxH9tSJqGaciQT+gyF
	 cAXj+vXjgHY+Q==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id F1/9F-07839-A1DD0F06; Fri, 16 Jul 2021 01:12:58 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrDIsWRWlGSWpSXmKPExsViZ8MxVVfq7oc
  Eg0VLOS0uHl7K7MDocW7jCsYAxijWzLyk/IoE1oxlU3ayFjRxVWw8Xt/AOIezi5GLQ0hgG5PE
  pMurWLoYOYGck4wSE47EgdhsAmoS02/dYAWxRQT0JZbO3sMMYjMLqEi8+N3DDmILC7hJfDmyF
  8jm4GARUJW4tTQHJMwr4CTxdf4UsJESAgoSUx6+B2vlFHCW+NU3mR1ilZNEX8tSVoh6QYmTM5
  +wQIyXkDj44gUzRK+ixOzLzSwg4yUEKiVuPE6dwMg/C0nHLCQdCxiZVjFaJBVlpmeU5CZm5ug
  aGhjoGhoa6RpaArGRmV5ilW6iXmqpbnlqcYmuoV5iebFecWVuck6KXl5qySZGYCCmFByo28H4
  4PUHvUOMkhxMSqK86y9/SBDiS8pPqcxILM6ILyrNSS0+xCjDwaEkwSt5GygnWJSanlqRlpkDj
  AqYtAQHj5IIbxRImre4IDG3ODMdInWKUVFKnPfaLaCEAEgiozQPrg0WiZcYZaWEeRkZGBiEeA
  pSi3IzS1DlXzGKczAqCfNuBJnCk5lXAjf9FdBiJqDF2mvegiwuSURISTUwZU4NlGh8vdrzhSr
  jrDTb2seOko6Pzr2QKDz9wujvAlHdHVW5jRtuKEW6iV8z9A3YxbFU8mD259xS40n7cyI1n6/6
  fTDa5Nvsm7nx2x/u9OBo2FCocTx6T8WjV8K/XNy0Hv7q2bNqa+eZ24IRZzg/fboYGRX7xlFY/
  PS6dZzd3y6cXNScEsfjf+R9YVpMhb/QLcOthw6cYS4VK5ipm7RK2zuuYLsxc3LaR5MMwyv/Cy
  Y1LjWyDqwL0Ahxelz59/7FpD2+bYEVVjv2CIebCJ5e258X0H5r/XfxOYJVnPmmq+J3btkosNz
  w9++lYV7Fd43qzDtMVuytDhG9K58WpiJSpPSNp5ZPu86z7MCr8KNKLMUZiYZazEXFiQAwcY21
  PwMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-7.tower-267.messagelabs.com!1626397977!152466!1
X-Originating-IP: [62.60.8.149]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25026 invoked from network); 16 Jul 2021 01:12:58 -0000
Received: from unknown (HELO mailhost2.uk.fujitsu.com) (62.60.8.149)
  by server-7.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 16 Jul 2021 01:12:58 -0000
Received: from R01UKEXCASM223.r01.fujitsu.local (ex2k13_223.fs.fujitsu.com [10.182.185.121])
	by mailhost2.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16G1CmkD017303
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 16 Jul 2021 02:12:57 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 16 Jul 2021 02:12:49 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] modemmanager: upgrade 1.16.6 -> 1.16.8
Date: Fri, 16 Jul 2021 09:12:32 +0800
Message-ID: <1626397952-27403-2-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1626397952-27403-1-git-send-email-wangmy@fujitsu.com>
References: <1626397952-27403-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM223.r01.fujitsu.local (10.182.185.121)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../{modemmanager_1.16.6.bb => modemmanager_1.16.8.bb}          | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/modemmanager/{modemmanager_1.16.6.bb => modemmanager_1.16.8.bb} (95%)

diff --git a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.6.bb b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
similarity index 95%
rename from meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.6.bb
rename to meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
index b499d93ec1..acfa113edb 100644
--- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.6.bb
+++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.16.8.bb
@@ -12,7 +12,7 @@ inherit gnomebase gettext systemd vala gobject-introspection bash-completion
 DEPENDS = "glib-2.0 libgudev intltool-native libxslt-native"
 
 SRC_URI = "http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.xz"
-SRC_URI[sha256sum] = "2a90b6260f66d3135609d62667ada73416694d717e7fd9b73223e3703a499617"
+SRC_URI[sha256sum] = "21fdfaf94171261ad9d99771894f5ade4bc39ef3d1ff1d421054d14713e97880"
 S = "${WORKDIR}/ModemManager-${PV}"
 
 PACKAGECONFIG ??= "mbim qmi \
-- 
2.25.1

