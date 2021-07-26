Received: from mail1.bemta26.messagelabs.com (mail1.bemta26.messagelabs.com [85.158.142.3])
 by mx.groups.io with SMTP id smtpd.web08.24876.1627264010378333848
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 25 Jul 2021 18:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=RKILpXBe;
 spf=pass (domain: fujitsu.com, ip: 85.158.142.3, mailfrom: zhengrq.fnst@fujitsu.com)
Return-Path: <zhengrq.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1627264008; i=@fujitsu.com;
	bh=+D8cFc95ZZmU+SUE2l+nL7ramf76h28Dj0+BrgqV5aQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=RKILpXBeYrawVQda4RrDYSgwpJp4bsvDUvNb/NRagkAiCR6NZcg7wZbD15UtbwLRa
	 StffVLTBxDuf4iVq2M2W2wCUgzZQKyM+pAZp+P/grEYlPHi94bJ5usKK5gJ4Pxaxrd
	 taFCOxyF3EoK8dVxG9RRFi26R7DmnxZgj90RakGQOo/wK6kW9ilgZZale9LKa/JXRS
	 lHjJsjyTDe2TMX2QbIA//MDek3meFzpLo6nwjldZ+XGADBTBod+zKRDgAJz0Fvpq3j
	 Ae+41VY0vzO3VBuM2fm7nAr2MKC0w6OY8h7Fbi99k4WfABEle/kGV6LYdJ2rSkNo2y
	 XWwYH2JVdKNFQ==
Received: from [100.113.1.116] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-3.bemta.az-a.eu-central-1.aws.symcld.net id 80/04-07651-7041EF06; Mon, 26 Jul 2021 01:46:47 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprBIsWRWlGSWpSXmKPExsViZ8MRqssu8i/
  BYNFHEYuLh5cyOzB6nNu4gjGAMYo1My8pvyKBNaNrxV7WgvOcFecvnmZuYHzN0cXIxSEkMJtJ
  YsLjtcwQzh5GiSM/nrB1MXJysAnoSpx7vJYdxBYR0JdYOnsPM4gtLOAqcfjyFTCbRUBVoqFtD
  lgNr4C7xIH9rxhBbAkBBYkpD98zQ8QFJU7OfMICYjMLSEgcfPECKM4BVKMoMXu6PER5hcTrw5
  eYJzDyzELSMQtJxwJGplWMlklFmekZJbmJmTm6hgYGuoaGxrpGukaGZnqJVbqJeqmlusmpeSV
  FiUBZvcTyYr3iytzknBS9vNSSTYzAQEopZLqxg/Hb6w96hxglOZiURHn71v5JEOJLyk+pzEgs
  zogvKs1JLT7EKMPBoSTBayn0L0FIsCg1PbUiLTMHGNQwaQkOHiUR3gheoDRvcUFibnFmOkTqF
  KMux5dVSxYxC7Hk5eelSonz5gsDFQmAFGWU5sGNgEXYJUZZKWFeRgYGBiGegtSi3MwSVPlXjO
  IcjErCvG4gU3gy80rgNr0COoIJ6Ijg+r8gR5QkIqSkGpjUZKeddI5Y0npFXtlRMNxpZd+eE59
  aY35f6T8zNyXgOM+5HXpZ7hv/nj3YaOT1b/6Te/NnNWe9n9coHPP8swHbobdZzjEMD7yf2F39
  w5Ws6JbXVs4UpX314JdP85I73x6dtJpD6mlt3UcRgZgL/axT5Z1FnN2Nj22vypyWtb2w7+fTC
  pnEhwkHV9j+7Hs0jYlvY9vT1potsn8We3z/ds1C3vpA1OZVxhzLvj94tox/RtL3Ccde1HosKG
  ML/1sd+O97tODV7gKXVM+ky7sK1FdfmdasOv9SpJ3IVpP1wapX6xZdPf0i7eLW2eLNJ8Q1n/w
  90p/46f46s7zN4QUOlyMZE4Of89Y4JEyvY24++HuJEktxRqKhFnNRcSIAM0O96CsDAAA=
X-Env-Sender: zhengrq.fnst@fujitsu.com
X-Msg-Ref: server-9.tower-232.messagelabs.com!1627264006!376528!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.3; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29677 invoked from network); 26 Jul 2021 01:46:47 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-9.tower-232.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 26 Jul 2021 01:46:47 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 16Q1kfs1005032
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 26 Jul 2021 02:46:46 +0100
Received: from localhost.localdomain (10.167.225.35) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.18; Mon, 26 Jul 2021 02:46:40 +0100
From: "zhengruoqin" <zhengrq.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-oe] [PATCH] live555: upgrade 20210710 -> 20210720
Date: Mon, 26 Jul 2021 18:46:34 +0800
Message-ID: <1627296394-3699-1-git-send-email-zhengrq.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.35]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Zheng Ruoqin <zhengrq.fnst@fujitsu.com>
---
 .../live555/{live555_20210710.bb => live555_20210720.bb}        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-multimedia/live555/{live555_20210710.bb => live555_20210720.bb} (97%)

diff --git a/meta-oe/recipes-multimedia/live555/live555_20210710.bb b/meta-oe/recipes-multimedia/live555/live555_20210720.bb
similarity index 97%
rename from meta-oe/recipes-multimedia/live555/live555_20210710.bb
rename to meta-oe/recipes-multimedia/live555/live555_20210720.bb
index 9d89e1c5ad..b30fc1069e 100644
--- a/meta-oe/recipes-multimedia/live555/live555_20210710.bb
+++ b/meta-oe/recipes-multimedia/live555/live555_20210720.bb
@@ -16,7 +16,7 @@ SRC_URI = "https://download.videolan.org/pub/contrib/live555/live.${URLV}.tar.gz
 # only latest live version stays on http://www.live555.com/liveMedia/public/, add mirror for older
 MIRRORS += "http://www.live555.com/liveMedia/public/ http://download.videolan.org/contrib/live555/ \n"
 
-SRC_URI[sha256sum] = "c157e848fecb335a7af2917fe787dacc5ada07e74f02026c206b092bc4cecb01"
+SRC_URI[sha256sum] = "3a9a83618b07192c5fb0d824bdafaece466086bb44b5634fac32e8f9e00c7994"
 
 S = "${WORKDIR}/live"
 
-- 
2.25.1

