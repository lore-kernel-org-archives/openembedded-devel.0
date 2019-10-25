Return-Path: <christophe.priouzeau@st.com>
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com
	[62.209.51.94])
	by mail.openembedded.org (Postfix) with ESMTP id DF5EC7FA5B
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 07:40:42 +0000 (UTC)
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
	x9P7Zl8Z020010 for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:43 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com;
	h=from : to : cc : subject
	: date : message-id : references : in-reply-to : content-type :
	content-transfer-encoding : mime-version; s=STMicroelectronics;
	bh=fPi4UoC3ILJj//qwM2ZLg+CHaJt/llCiuzxeFJFTOmc=;
	b=Np/6F/TlbAfU0GXNgCkmjjWMpwIPdXig/eRT6m6ljvGwYIUba/gilpU3oRWL2OaZCBMV
	c+B6ROA6gNfHEd602QYH5Hm1E8s+D03bDudg2/QsVbsuTl/dwcaUie9GqneBEgrTMlIc
	PG3/KJfu+7oNf6TbtDIblXcOKOyJXtjY6A+kKa+a55ttnJNCQBLtxwvbQ+q72kLSNAPp
	7NdkmkFk1dF+goFPbjeW3+S6p3WYF7dOIyJXRZ63bzbyhx0S1F6U/nKBvgJ+BaTyfcBo
	nSXiLoXrlvdExmU0DXfcDAiOQlWAp82gvtZRmfBWm4P2KlGHTpky/rezSU56AHdnyIoy
	ww== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 2vt9s1x91m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NOT) for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:43 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E059C10003A
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:42 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node2.st.com [10.75.127.17])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D9DAE2B97A1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Oct 2019 09:40:42 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE2.st.com
	(10.75.127.17) with Microsoft SMTP Server (TLS) id 15.0.1347.2;
	Fri, 25 Oct 2019 09:40:42 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
	SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
	15.00.1347.000; Fri, 25 Oct 2019 09:40:42 +0200
From: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-python][PATCH 02/10] Python: flask bcrypt: Clarify BSD
	license variant
Thread-Index: AQHViweA/UErw7unK0Gfzx2IzfVhIQ==
Date: Fri, 25 Oct 2019 07:40:41 +0000
Message-ID: <20191025074040.16602-2-christophe.priouzeau@st.com>
References: <20191025074040.16602-1-christophe.priouzeau@st.com>
In-Reply-To: <20191025074040.16602-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.95,1.0.8
	definitions=2019-10-25_04:2019-10-23,2019-10-25 signatures=0
Cc: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-python][PATCH 02/10] Python: flask bcrypt: Clarify BSD license variant
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
X-List-Received-Date: Fri, 25 Oct 2019 07:40:43 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

The License of python flask bcrypt is BSD-3-Clause.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 .../recipes-devtools/python/python-flask-bcrypt_0.7.1.bb        | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.=
bb b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
index f035862de..d090b345e 100644
--- a/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
+++ b/meta-python/recipes-devtools/python/python-flask-bcrypt_0.7.1.bb
@@ -1,5 +1,5 @@
 DESCRIPTION =3D "Bcrypt hashing for Flask."
-LICENSE =3D "BSD"
+LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D0ee2ee5bee7fe96597770e92db5719a=
8"
=20
 SRC_URI[md5sum] =3D "d345c36ac6637d3ca9fa942e238d00ca"
--=20
2.17.1

