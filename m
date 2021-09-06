Received: from mail1.bemta25.messagelabs.com (mail1.bemta25.messagelabs.com [195.245.230.5])
 by mx.groups.io with SMTP id smtpd.web11.19772.1630917693537735720
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 06 Sep 2021 01:41:34 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=170520fj header.b=va3aaRD0;
 spf=pass (domain: fujitsu.com, ip: 195.245.230.5, mailfrom: zangrc.fnst@fujitsu.com)
Return-Path: <zangrc.fnst@fujitsu.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fujitsu.com;
	s=170520fj; t=1630917691; i=@fujitsu.com;
	bh=jyjxDhsbYsJvzZ7mPYGabQHhqY6x3R0PW31Bldyke5E=;
	h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type;
	b=va3aaRD0Na21HSk5U1FsvVtUZ5FJWrPXtHyD2iIxmN1t5THYIYWXEd9ldLCXPZrqB
	 jb+g7DdXwBcY0BdcuHQGtvLPQOpm0aC4YiAgQaC2DCkF2r3DEo+kUojzO0/HPMAeAW
	 DRrWH9TvpOhFCmZonGT7QP6tHKB9zmE8W9azT2r2XKWaRZ1GRdqmM25opr7e2SxFFv
	 Qy3jqHcYcZWIRqJlS/7izUnv1Mz+CAJXt6pWy6o1xrrp6icRcFU+tFB6mjCvKq0uv9
	 oGBz3XmOEBb490PhbiPuirC/U692UZsXtSvJ8lkyrbzhGxb/PAd9WUO7oy2zoWor8O
	 H7nsdqHrxAJvQ==
Received: from [100.112.194.253] (using TLSv1.2 with cipher DHE-RSA-AES256-GCM-SHA384 (256 bits))
	by server-5.bemta.az-a.eu-west-1.aws.symcld.net id C0/78-08357-B34D5316; Mon, 06 Sep 2021 08:41:31 +0000
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprKIsWRWlGSWpSXmKPExsViZ8MRqmt1xTT
  R4MIfa4uLh5cyOzB6nNu4gjGAMYo1My8pvyKBNePUfMmCRzwVJ3pOsTUwbuTuYuTkEBKYxSTx
  855zFyMXkH2cUaJhYxMjSIJNQEei40U3C4gtIqAvsXT2HmYQW1ggWGJ7+zwmEJtFQEXixsQOs
  DivgLvE0mkLwGwJAQWJKQ/fQ8UFJU7OfAI2h1lAQuLgixdQNYoS23eeYYGwKyReH77EPIGRZx
  aSlllIWhYwMq1iNE8qykzPKMlNzMzRNTQw0DU0NNI1tDTSNTHRS6zSTdRLLdUtTy0u0TXUSyw
  v1iuuzE3OSdHLSy3ZxAgMoZSCAzo7GH+++qB3iFGSg0lJlPfZQdNEIb6k/JTKjMTijPii0pzU
  4kOMMhwcShK8Fy8B5QSLUtNTK9Iyc4DhDJOW4OBREuGNvQyU5i0uSMwtzkyHSJ1i1OV493PxI
  mYhlrz8vFQpcV4/kCIBkKKM0jy4EbDYusQoKyXMy8jAwCDEU5BalJtZgir/ilGcg1FJmDcFZA
  pPZl4J3KZXQEcwAR3R9tAE5IiSRISUVANT08USqfUdqfcKVLg8GJ2bxSokVKNnOOhGXL3e9PC
  ua9m2X+L/Owp4QmWiHx9dYz0nb9GhXwqta79z9vmbmq2R9q1X5L5y2alPYbn2pM1r1CRf/vqi
  cS2dN3IVlxHnLqfWX2zPF5/YWHXqzYEtAqUJ23ez/D7vZ7r12t0H62Y6RB5aGtp2p33RvvZer
  XLZN6m1j6dUrrrD/kLg2TVRnROvdzxjb9RkO/R9r7HvlFL97cc+7LvPwJOVtWGnvIX20sDrFv
  +vm1dLvrHwWbTqi61vYOzmxcvKvKc0Hy5Mdmc02ry3uOjjXKVDb75Pq2WcFtehpHiyPiclLeD
  zQ8ufq2KNjEIv/kn2fOKx+xmvdr6OEktxRqKhFnNRcSIAse4/pCgDAAA=
X-Env-Sender: zangrc.fnst@fujitsu.com
X-Msg-Ref: server-8.tower-271.messagelabs.com!1630917690!2879!1
X-Originating-IP: [62.60.8.85]
X-SYMC-ESS-Client-Auth: outbound-route-from=pass
X-StarScan-Received: 
X-StarScan-Version: 9.81.4; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 3877 invoked from network); 6 Sep 2021 08:41:30 -0000
Received: from unknown (HELO mailhost4.uk.fujitsu.com) (62.60.8.85)
  by server-8.tower-271.messagelabs.com with ECDHE-RSA-AES256-GCM-SHA384 encrypted SMTP; 6 Sep 2021 08:41:30 -0000
Received: from R01UKEXCASM126.r01.fujitsu.local ([10.183.43.178])
	by mailhost4.uk.fujitsu.com (8.14.5/8.14.5) with ESMTP id 1868fOgS021456
	(version=TLSv1/SSLv3 cipher=AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>; Mon, 6 Sep 2021 09:41:30 +0100
Received: from localhost.localdomain.localdomain (10.167.225.81) by
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178) with Microsoft SMTP Server
 (TLS) id 15.0.1497.23; Mon, 6 Sep 2021 09:41:22 +0100
From: "zangrc" <zangrc.fnst@fujitsu.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [oe] [meta-python] [PATCH] python3-ruamel-yaml: upgrade 0.17.13 -> 0.17.16
Date: Mon, 6 Sep 2021 16:41:15 +0800
Message-ID: <1630917675-67420-1-git-send-email-zangrc.fnst@fujitsu.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Originating-IP: [10.167.225.81]
X-ClientProxiedBy: G08CNEXCHPEKD08.g08.fujitsu.local (10.167.33.83) To
 R01UKEXCASM126.r01.fujitsu.local (10.183.43.178)
Content-Type: text/plain

[0, 17, 16]: 2021-08-28
  - also handle issue 397 when comment is newline

[0, 17, 15]: 2021-08-28
  - fix issue 397, insert comment before key when a comment between key and value exists
    (reported by `Bastien gerard <https://sourceforge.net/u/bagerard/>`__)

[0, 17, 14]: 2021-08-25
  - fix issue 396, inserting key/val in merged-in dictionary (reported by `Bastien gerard
    <https://sourceforge.net/u/bagerard/>`__)

Signed-off-by: Zang Ruochen <zangrc.fnst@fujitsu.com>
---
 ...-ruamel-yaml_0.17.13.bb => python3-ruamel-yaml_0.17.16.bb} | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-ruamel-yaml_0.17.13.bb => python3-ruamel-yaml_0.17.16.bb} (75%)

diff --git a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.13.bb b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
similarity index 75%
rename from meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.13.bb
rename to meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
index d28e8a12fe..e64f196004 100644
--- a/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.13.bb
+++ b/meta-python/recipes-devtools/python/python3-ruamel-yaml_0.17.16.bb
@@ -8,10 +8,12 @@ PYPI_PACKAGE = "ruamel.yaml"
 
 inherit pypi setuptools3
 
-SRC_URI[sha256sum] = "02f0ed93e98ea32498d25a2952635bbd9fabd553599b8ad67724b4ac88dd8f6c"
+SRC_URI[sha256sum] = "1a771fc92d3823682b7f0893ad56cb5a5c87c48e62b5399d6f42c8759a583b33"
 
 RDEPENDS:${PN} += "\
     ${PYTHON_PN}-shell \
+    ${PYTHON_PN}-datetime \
+    ${PYTHON_PN}-netclient \
 "
 
 do_install:prepend() {
-- 
2.25.1

