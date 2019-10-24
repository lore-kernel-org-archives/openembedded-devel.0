Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id D7F8E7F9C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:07:44 +0000 (UTC)
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OF1ZtA024892 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=Q3EyqmSNZKIWTDbILgDJHf/lCjqPibmA8nhiBn10MHE=;
	b=ruE2Bcvg50SBwwNKfwPqH8kYLJUM5MvYERPpQ/40soJN9A8iuqXEDrdaIX6eRsuiD9+C
	IGPL1c150F1fKqE7TpzBlal+5cRQ+D9h72iC8c/InXwv9kc7NvcX5gvgQ4J6RKkge2Gx
	D2BuxeN2wQF1SYOA0rAkBSm1Gs3fQpWDCywdrPAYgeXmyXMq1UXHUenX0BxXBPOI+Xj8
	xfIyaRQ/hOBpoC1Zj1MRl7DzhEYlbA6ZPurXLIusCgh2YRzh2LvIj+dB3bZGGL5PhmfB
	amzblKGmS+j8ie0On0JJIe0fXp1J+xn9YZ2bZzdezroGU9C2N77vLdMWNwvAjtljf1AP
	aw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s7aeg5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 14003100038
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0E5122C38D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 17:07:44 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 17:07:44 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 5/9] Python: pyserial: Clarify BSD license
	variant
Thread-Index: AQHVinzJVtJs+tM0o0CItPFu8ZiJVw==
Date: Thu, 24 Oct 2019 15:07:44 +0000
Message-ID: <20191024150740.22983-5-christophe.priouzeau@st.com>
References: <20191024150740.22983-1-christophe.priouzeau@st.com>
In-Reply-To: <20191024150740.22983-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.46]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-24_09:2019-10-23,2019-10-24 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 5/9] Python: pyserial: Clarify BSD license variant
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 24 Oct 2019 15:07:45 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python pyserial is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 meta-python/recipes-devtools/python/python-pyserial.inc | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-pyserial.inc b/meta=
-python/recipes-devtools/python/python-pyserial.inc
index 870f1d8a8..c9580de26 100644
--- a/meta-python/recipes-devtools/python/python-pyserial.inc
+++ b/meta-python/recipes-devtools/python/python-pyserial.inc
@@ -1,5 +1,5 @@
 SUMMARY =3D "Serial Port Support for Python"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3Dd476d94926db6e0008a5b3860d1=
f5c0d"
=20
 SRC_URI[md5sum] =3D "ed6183b15519a0ae96675e9c3330c69b"
--=20
2.17.1

