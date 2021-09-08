Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.4])
 by mx.groups.io with SMTP id smtpd.web10.12578.1631112389238364331
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 08 Sep 2021 07:46:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=YXc3V12c;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.4, mailfrom: wangmy@fujitsu.com)
Return-Path: <wangmy@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1631112387; i=@fujitsu.com;
	bh=/baZyCu0mup3fPXNs9jTR0koQeUqcq/h/dPVqyn8yic=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type;
	b=YXc3V12cGNTjqZeodm/mjY6al2RA2+EM0u26JpE3S2idWDj+B96RcJreCxVs2Zipf
	 GEB16TsD9ZcQRKttupbkFaNiDMeADArwGOXfzfk/xtm9eoGNc1wMOA3Mxco/iRvDY5
	 mKT8sRxy/PaeUf3gI4iUI4rfimvgJSvyzRFnubaWKOkTa/cf1fWRk0Xrv+HOmGqGt+
	 4vGH3DIdCo/jvZpsj0AMoN6xiWTNvzbS2b/b5Qdm5NrgrzwJ+7jPqI2+/tWQmXV4Bd
	 B4KnCWoiLfoy+fnqAnGtMN8tIxXUrdaqCcwUQm0tB1zj3NKguRzFn0GuKdhwg+p5iq
	 jyFpUGGk5KMOw==
Received: from [100.112.194.253] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-4.bemta.az-a.eu-west-1.aws.symcld.net id DE/CC-12623-3CCC8316; Wed, 08 Sep 2021 14:46:27 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFlrLIsWRWlGSWpSXmKPExsViZ8MRonvojEW
  iwdW5ehYXDy9ldmD0OLdxBWMAYxRrZl5SfkUCa8acpS/ZCx5xVKx9s4etgfE/excjF4eQwCwm
  iWPz1rB1MXICOccZJSZvTQax2QTUJKbfusEKYosI6Essnb2HGcRmFlCRePG7B6iZg0NYwEFi+
  WRrkDALUPjctpvMIGFeASeJ9V+iQcISAgoSUx6+B+vkFHCWmDO9jR1ik5PEr5s/GUFsXgFBiZ
  Mzn7BATJeQOPjiBTNEr6LE7MvNLBB2hcSsWW1MExj5ZyFpmYWkZQEj0ypGi6SizPSMktzEzBx
  dQwMDXUNDI11DSyA2MtNLrNJN1Est1S1PLS7RNdRLLC/WK67MTc5J0ctLLdnECAzFlIIDdTsY
  H7z+oHeIUZKDSUmUd9dui0QhvqT8lMqMxOKM+KLSnNTiQ4wyHBxKEryap4BygkWp6akVaZk5w
  LiASUtw8CiJ8DodAUrzFhck5hZnpkOkTjEqSonzzj0NlBAASWSU5sG1wWLxEqOslDAvIwMDgx
  BPQWpRbmYJqvwrRnEORiVh3icgU3gy80rgpr8CWswEtLjtoQnI4pJEhJRUA9PjaX/frLteHMg
  utf/3Sha5pdpCm19Wb8mVjHC7kTlZP0/5XfqKFTcVvqxujnkRLxcgvH759FsWj88L/t5x7Pw5
  R+2PMzYxNmWEGa1p2eMlriirkr+/iW+amNFjf6GEG46OW7RPi/OabFWZmKXOH9GsfdAwpbrdM
  Lk84QpHseQBxSv+fjGlxrNVOSVrd5+6cnZ+yAm5VoGbV+s/Tl18SWyyjsj82x179Lee9y7n0N
  qym+nVsZRUjXWRp65NF4riCvq3e8sppVPhzd51x5yub/l+dMbFLsV6liAB/f1/Io9PmKq5MNW
  3yvq7Nc+WL3f+aQdefpi/Ufhg73SX+K/FJ7/Y9m5fsDPu7ofCh//r4xWUWIozEg21mIuKEwG6
  fNe2QAMAAA==
X-Env-Sender: wangmy@fujitsu.com
X-Msg-Ref: server-21.tower-267.messagelabs.com!1631112386!54461!1
X-Originating-IP: [62.60.8.84]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16270 invoked from network); 8 Sep 2021 14:46:26 -0000
Received: from unknown (HELO mailhost3.uk.fujitsu.com) (62.60.8.84)
  by server-21.tower-267.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 8 Sep 2021 14:46:26 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost3.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 188EkQBd021289
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Wed, 8 Sep 2021 15:46:26 +0100
Received: from localhost.localdomain.localdomain (10.167.225.33) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Wed, 8 Sep 2021 15:46:24 +0100
From: "wangmy" <wangmy@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
CC: Wang Mingyu <wangmy@fujitsu.com>
Subject: [oe] [meta-oe] [PATCH] libqmi: upgrade 1.30.0 -> 1.30.2
Date: Wed, 8 Sep 2021 22:46:01 +0800
Message-ID: <1631112363-19399-3-git-send-email-wangmy@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
In-Reply-To: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
References: <1631112363-19399-1-git-send-email-wangmy@fujitsu.com>
MIME-Version: 1.0
X-Originating-IP: [10.167.225.33]
X-ClientProxiedBy: G08CNEXCHPEKD07.g08.fujitsu.local (10.167.33.80) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

Signed-off-by: Wang Mingyu <wangmy@fujitsu.com>
---
 .../libqmi/{libqmi_1.30.0.bb => libqmi_1.30.2.bb}               | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-oe/recipes-connectivity/libqmi/{libqmi_1.30.0.bb => libqmi_1.30.2.bb} (90%)

diff --git a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.0.bb b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
similarity index 90%
rename from meta-oe/recipes-connectivity/libqmi/libqmi_1.30.0.bb
rename to meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
index 61fe0eef81..c337abde37 100644
--- a/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.0.bb
+++ b/meta-oe/recipes-connectivity/libqmi/libqmi_1.30.2.bb
@@ -14,7 +14,7 @@ inherit autotools pkgconfig bash-completion gobject-introspection
 
 SRC_URI = "http://www.freedesktop.org/software/${BPN}/${BPN}-${PV}.tar.xz"
 
-SRC_URI[sha256sum] = "c039cdb5d3522b45a50d2287ab6311cdc9f99d46a719a1ea4beb7591787b8a1b"
+SRC_URI[sha256sum] = "be01ece0ea2c2194cbea5744bf5aaf06c04ba5fb7ec7887a13116c76d114fedd"
 
 PACKAGECONFIG ??= "udev mbim"
 PACKAGECONFIG[udev] = ",--without-udev,libgudev"
-- 
2.25.1

