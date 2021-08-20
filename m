Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.2])
 by mx.groups.io with SMTP id smtpd.web10.82445.1629452476705413905
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 20 Aug 2021 02:41:17 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=Nt+QzjvA;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.2, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1629452475; i=@fujitsu.com;
	bh=fD9Zg4dAwHWlYMCWhxehjL46mkWEicAX2ipHRMapX28=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=Nt+QzjvAJutfqbGxt/VLsWIU1J+K1M2sjsPskw+bOwOr+D45z/JTfnxsv+D+xksFQ
	 QzGMPwkOs8o9ZlydscUhD2JfzhB3G9tyB5CA2NMaTb5lpo3cEti3RybUks4UnyU0C5
	 xs1y+uJ9GPlmeCKnN7hvs0oC5R9HJaIvDFYarpkhLzkZPjTolqRwBqar4LtWgoEsMm
	 HRKRBSCRsfZpk1iawZUUOYUzDGGuXGNMRvGWJDIc0XndkpvmoOqcUTiAstBsph0f4V
	 K482xLWpf3T7PzSXgdTAVTmNtxkXbydPJAepTcSsvdj452pJf35ovZTRWtfMHy3arY
	 MdqwqyYi/pbJQ==
Received: from [100.112.192.137] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-2.bemta.az-a.eu-west-1.aws.symcld.net id 3E/9E-09210-AB87F116; Fri, 20 Aug 2021 09:41:14 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupikeJIrShJLcpLzFFi42Kxs+GYorurQj7
  R4MkrJYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNWPd80a2gu+cFbdeLWJrYDzD0cXIxSEkMJtJ
  onveHiYI5wSjxP6ZT5i7GDk52AR0JDpedLOA2CIC+hJLZ+8BinNwCAv4SNx8ngISZhFQlVjWu
  YMFJMwr4C5xbaUnSFhCQEFiysP3YFN4BQQlTs58AjaFWUBC4uCLF8wQNYoS23eeYYGwKyReH7
  7EPIGRZxaSlllIWhYwMq1itEgqykzPKMlNzMzRNTQw0DU0NNI1tDTVNTQ11Eus0k3USy3VLU8
  tLtEFcsuL9Yorc5NzUvTyUks2MQKDKKXg8PQdjP1vPugdYpTkYFIS5VU1k08U4kvKT6nMSCzO
  iC8qzUktPsQow8GhJMF7qQwoJ1iUmp5akZaZAwxomLQEB4+SCG9xEVCat7ggMbc4Mx0idYpRU
  Uqc17scKCEAksgozYNrg0XRJUZZKWFeRgYGBiGegtSi3MwSVPlXjOIcjErCvEEgU3gy80rgpr
  8CWswEtFhIVRZkcUkiQkqqgaksZC+LWO2ROSuf/eLbGj2p9ilLuPpnnUKBTQ5y03orjGvVjpx
  a8qsl5YfSjFdLTwu1Re61u5rck6GRmbFksrV78qx/eadEX3zKPTU1O5bf9Nbrgv35r272NFYe
  klfacfNu6YlHUe17fyUK3NrzasYS0esTE4TsfSR1ihSa2VYHGi1Z8zn54ZbzzHoLmHxWLXbO+
  rjQLORv69mPzlpJiwsbrCP3Nhu+dW4M3FgbIvct5Z6ty1mO9Q+DIh+1fdzZJ+0Tkrkp1f5R0e
  HylpRFt9f4cSnOvL7hzv1A/d+zJQKq/jQcmvbiMHetd5NWacJFzxKJY64rv+ivr1T79z9N99P
  jyY3n1yr8X/S4qmqd+XIlluKMREMt5qLiRABrNCf6HQMAAA==
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-6.tower-267.messagelabs.com!1629452474!115489!1
X-Originating-IP: [62.60.8.148]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 25533 invoked from network); 20 Aug 2021 09:41:14 -0000
Received: from unknown (HELO mailhost1.uk.fujitsu.com) (62.60.8.148)
  by server-6.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 20 Aug 2021 09:41:14 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost1.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 17K9fEWj007722
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Fri, 20 Aug 2021 10:41:14 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Fri, 20 Aug 2021 10:41:12 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-grpcio: upgrade 1.38.1 -> 1.39.0
Date: Fri, 20 Aug 2021 17:41:04 +0800
Message-ID: <1629452464-16769-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 .../{python3-grpcio_1.38.1.bb => python3-grpcio_1.39.0.bb}      | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-grpcio_1.38.1.bb => python3-grpcio_1.39.0.bb} (93%)

diff --git a/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb b/meta-python/recipes-devtools/python/python3-grpcio_1.39.0.bb
similarity index 93%
rename from meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
rename to meta-python/recipes-devtools/python/python3-grpcio_1.39.0.bb
index f68034763c..76d38a2646 100644
--- a/meta-python/recipes-devtools/python/python3-grpcio_1.38.1.bb
+++ b/meta-python/recipes-devtools/python/python3-grpcio_1.39.0.bb
@@ -12,7 +12,7 @@ SRC_URI:append:class-target = " file://ppc-boringssl-support.patch \
                                 file://mips_bigendian.patch \
                                 file://0001-absl-always-use-asm-sgidefs.h.patch \
 "
-SRC_URI[sha256sum] = "1f79d8a24261e3c12ec3a6c25945ff799ae09874fd24815bc17c2dc37715ef6c"
+SRC_URI[sha256sum] = "57974361a459d6fe04c9ae0af1845974606612249f467bbd2062d963cb90f407"
 
 RDEPENDS:${PN} = "${PYTHON_PN}-protobuf \
                   ${PYTHON_PN}-setuptools \
-- 
2.25.1

