Received: from mail3.bemta25.messagelabs.com (mail3.bemta25.messagelabs.com [195.245.230.84])
 by mx.groups.io with SMTP id smtpd.web08.80631.1629440535531470180
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 23:22:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=OjbuA8rW;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.84, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629440533; i=@fujitsu.com;
	bh=o95a3s4F7G8gKn883a/sW12VcDVEVaYvoCdisjMr8NE=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=OjbuA8rW4OOkP7Kp4R/FMvUJztFOiqr+bt2I2MkI9shE3jpzFB7i4WADkEK2PlROW
	 JY94vSb4KvFkTgJ+X5ejJlhfZxOVnVblXgzvfFc+63SRdnEz7aHgCzAIXDSASrG9hT
	 q1841R6cvxeDC5xGT3zDKME0kaCrFVv+HBVTOW7OgM3NOw/ya5t/aW/NGU811RG8vg
	 Wlck5kk20hthUsFJBml3CcVsrIp1d5ZDcKXivy6txzXLyA5RlrpQzKI+vDoL4F9DvP
	 xYK6b3BZ5zbGLdG9RRTD6aqiqvJ+aKBbr01rbrxZQMMCss12o026L8Bcrz4HW0cuqi
	 uWRI4yin9Vk7g==
Received: from [100.112.198.129] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-b.eu-west-1.aws.symcld.net id 8D/70-29858-51A4F116; Fri, 20 Aug 2021 06:22:13 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+EI0RXxkk8
  0aLpubXHx8FJmB0aPcxtXMAYwRrFm5iXlVySwZhz83MBS8JKjYuqa54wNjG0cXYxcHEICs5kk
  9m6axwjh7GGUWLP8FlMXIycHm4CuxLnHa9lBbBEBfYmls/cwg9jCAg4SVxd8YQOxWQRUJc5MW
  8oCYvMKeEg8m34DrFdCQEFiysP3zBBxQYmTM5+A1TALSEgcfPECKM4BVKMoMXu6PER5hcTrw5
  eYJzDyzELSMQtJxwJGplWMFklFmekZJbmJmTm6hgYGuoaGRrqGlpa6RkbmeolVukl6qaW65an
  FJbqGeonlxXrFlbnJOSl6eaklmxiBYZRScPzxDsYVbz7oHWKU5GBSEuVVNZNPFOJLyk+pzEgs
  zogvKs1JLT7EKMPBoSTB+9AdKCdYlJqeWpGWmQMMaZi0BAePkgjvTQ+gNG9xQWJucWY6ROoUo
  6KUOO8KkIQASCKjNA+uDRZHlxhlpYR5GRkYGIR4ClKLcjNLUOVfMYpzMCoJ804EmcKTmVcCN/
  0V0GImoMVCqrIgi0sSEVJSDUzBTVdXfCic0HrsW3KmrtkzkQX6qX8nvEpeFfjgZ05e2E6jyKP
  vhCwtrk6pcWHNOZ/6+/WePVZrj3q583vdubA7fMKDf7o6G/ita49yGN+qcZy1kHXZUuHDGsk/
  maZqJWVM9vh7ZVnplENaycnLjvDvcAh6bec4V7U5h3nj3DXLHs91r15y+cXNCGPx6s9/q67Pe
  cnHb/JHja8vOSP6IIv4Pc/FFn8YXO4dfqxy1ecdU+brI/1qxcunHPITdcgXa/u487OYu4rzZ2
  /X1dOu+5fElbmbBx3y+Zb0Ocv413/Hb3+ll531vrdWJMC5fMVK8UUz9/Jwh/5vm3qb+0ygQOD
  s6QZqBWmPHruye3Y+PfleiaU4I9FQi7moOBEAaRkP5R4DAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-3.tower-285.messagelabs.com!1629440532!213777!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16160 invoked from network); 20 Aug 2021 06:22:12 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-3.tower-285.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 06:22:12 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K6MCW9030327
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 07:22:12 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 07:22:10 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.28.8 -> 1.30.0
Date: Fri, 20 Aug 2021 14:22:04 +0800
Message-ID: <1629440524-34551-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../libqmi/{libqmi_1.28.8.bb => libqmi_1.30.0.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.28.8.bb => libqmi_1.30.0.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.8.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.0.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.28.8.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.30.0.bb
index ebc8b8b8aa..61fe0eef81 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.28.8.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.0.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "6e3bbbd200bc1b64b23f6254fef9212f2699ec77cfb32075d2ba5079c73a9f78"
+SRC_URI[sha256sum] = "c039cdb5d3522b45a50d2287ab6311cdc9f99d46a719a1ea4beb7591787b8a1b"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.25.1

