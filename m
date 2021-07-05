Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.116])
 by mx.groups.io with SMTP id smtpd.web10.5595.1625450091541644610
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 04 Jul 2021 18:54:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=AuwqDsUq;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.116, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1625450089; i=@fujitsu.com;
	bh=vfyifsEPfXMpbKflFdckVaOkez1IcpWmczEjZB7INJU=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=AuwqDsUqUnCbHl1x/Ep1kWzhH7sJ+KWknC4UmXwesRb94rvFXd3tTZfXIHPhFgFtX
	 2X3K0GruO/KevZG3FCyckMyQqUSz6y93A6vY9CA3GVK0VEq27dZRU22vqV1Xr12Bxe
	 oLvFvHo1AHVpx9DtH11UAwsmVznvvz2dj7JSzn2piyV1pZB3HMIvXpe0CF/fqgZu7r
	 B1JSkUM81q11z40avE8At9wkk88qzlHjOGnCfBqEsrDP11ayBSfyqN8tEYnfIQF5DN
	 csrhZGDMd3aTeKh5gOylWijfpkV+SjTdUN48EdZiElp7pVWvMThkYKI3+nzR3c6qr9
	 6c9NFW28QVx6A==
Received: from [100.113.7.10] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-b.eu-central-1.aws.symcld.net id 32/78-07230-86662E06; Mon, 05 Jul 2021 01:54:48 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupmkeJIrShJLcpLzFFi42Kxs+GYopuR9ij
  B4M8zWYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePOpgmMBd85K7onz2RtYDzD0cXIySEkMItJ
  oudtUhcjF5B9nFHiyOGT7CAJNgEdiY4X3SwgtoiAvsTS2XuYQWxhAR+JFWsns3YxcnCwCKhIL
  F8cABLmFfCQOLJoAlirhICCxJSH75kh4oISJ2c+ARvDLCAhcfDFC2aIGkWJ7TvPsEDYFRIzZm
  xjm8DIMwtJyywkLQsYmVYxWiYVZaZnlOQmZuboGhoY6BoaGuua6xqZGuklVukm6aWW6ian5pU
  UJQJl9RLLi/WKK3OTc1L08lJLNjECwyilkP3PDsbrrz/oHWKU5GBSEuXdpPkoQYgvKT+lMiOx
  OCO+qDQntfgQowwHh5IEb1UyUE6wKDU9tSItMwcY0jBpCQ4eJRHe5DigNG9xQWJucWY6ROoUo
  6KUOC9LKlBCACSRUZoH1waLo0uMslLCvIwMDAxCPAWpRbmZJajyrxjFORiVhHnvgkzhycwrgZ
  v+CmgxE9Dim+cegiwuSURISTUwhVX2yexsYfnxXzZh2a3rc0KivCscL71N2+a1QH3yuaSV7+6
  ZuYYoezIWPFrLfdZWvkT9aN5BNdYDbA4tB1TWT7Vu5M93/c32QZ/7SbjJTTeNXws2yt6PqAu/
  8uq1pfWM/yVffCXDa590bjy/oXmqHg9H2PstX+XXtui6rxC5M/s+R+ufW0c3Ou+10tcWKF584
  OuHGa5TTEJFPyQ/MbXoSJplF9jnGlJdEXw/5lqBxS2m5L62LbwnrGS8d8afXS9QLekssMhaSp
  M/52fL3WjxA9vLE3/I37ivI63guUg/WMosof/hhF0vNyhNPjjry6aldywPM9aI39pzNWZGX6O
  ujW2dVeiGt31O61p2+4YqsRRnJBpqMRcVJwIANgaDWx4DAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-15.tower-238.messagelabs.com!1625450087!325037!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 19530 invoked from network); 5 Jul 2021 01:54:48 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-15.tower-238.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 5 Jul 2021 01:54:48 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1651slDo016298
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 5 Jul 2021 02:54:47 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 5 Jul 2021 02:54:35 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.38.0 -> 1.38.1
Date: Mon, 5 Jul 2021 09:54:30 +0800
Message-ID: <1625450070-114827-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD09.g08.fujitsu.local (10.167.33.85) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-grpcio_1.38.0.bb => python3-grpcio_1.38.1.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.38.0.bb => python3-grpcio_1.38.1.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.38.0.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.38.0.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
index d9e00422bc..3af033d966 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.38.0.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
@@ -12,7 +12,7 @@ SRC_URI_append_class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "abbf9c8c3df4d5233d5888c6cfa85c1bb68a6923749bd4dd1abc6e1e93986f17"
+SRC_URI[sha256sum] = "1f79d8a24261e3c12ec3a6c25945ff799ae09874fd24815bc17c2dc37715ef6c"
 
 RDEPENDS_${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1

