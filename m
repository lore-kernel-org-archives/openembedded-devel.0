Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx08-00178001.pphosted.com
	[91.207.212.93])
	by mail.openembedded.org (Postfix) with ESMTP id 3C6A07F9C3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 15:07:44 +0000 (UTC)
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
	by mx08-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9OF27Tp028794 for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=/3dFSV3bSMLCJycEQuhRV7SENVUlxHdViiWnYeyTZac=;
	b=W600h+YuNz65y5vWSReHPLp8NTB9Rqs1qrUAnvHr7pWLpBgD/Z4NrRet2gd6XdymY5XA
	zXb3WLgE7t4B0YOxPdPMmdqGWi8E1646yO+mE3x3tKUAUgyDAPC/yFZXYCqb3psylxkX
	Xp/QhkMDhNll/gV+MbGk2XCjQPEM7oLK/RGT37WJFTLZ8PoC/5X/yl57JHC6MoPpYArk
	gqBhyAuLfc0eqAhhQ4NI739bbOOwXQ668p/YqOqtfvycqKrlfIflr8EVWGTkLQeWXsrX
	XOq2rdySbFXbKKigY8G6pSgqiHIJl1Cn5xYHC/0mM90pop5vPYVeZlaBh73jKcMHBCi0
	Yg== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx08-00178001.pphosted.com with ESMTP id 2vt9s52ex2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:45 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5566E100034
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:44 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node1.st.com [10.75.127.16])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4F8162C38D8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Oct 2019 17:07:44 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE1.st.com
	(10.75.127.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
	Thu, 24 Oct 2019 17:07:43 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Thu, 24 Oct 2019 17:07:43 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 3/9] Python: lazy object proxy: Clarify BSD
	license variant
Thread-Index: AQHVinzJyHAekPP9YUWyP7bj2gYl3g==
Date: Thu, 24 Oct 2019 15:07:43 +0000
Message-ID: <20191024150740.22983-3-christophe.priouzeau@st.com>
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
Subject: [meta-python][PATCH 3/9] Python: lazy object proxy: Clarify BSD license variant
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
X-List-Received-Date: Thu, 24 Oct 2019 15:07:44 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python lazy object proxy is BSD-2-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../recipes-devtools/python/python-lazy-object-proxy.inc        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-lazy-object-proxy.i=
nc b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
index 83d2ea3cd..b88afce0e 100644
--- a/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
+++ b/meta-python/recipes-devtools/python/python-lazy-object-proxy.inc
@@ -1,6 +1,6 @@
 SUMMARY =3D "A fast and thorough lazy object proxy"
 HOMEPAGE =3D "https://python-lazy-object-proxy.readthedocs.io/"
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-2-Clause"
 SECTION =3D "devel/python"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3Dec680df42d8ad56427a83308817658c=
c"
=20
--=20
2.17.1

