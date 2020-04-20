Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [62.209.51.94])
 by mx.groups.io with SMTP id smtpd.web10.1282.1587366632767750497
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 20 Apr 2020 00:10:38 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@st.com header.s=stmicroelectronics header.b=F81kAvJB;
 spf=pass (domain: st.com, ip: 62.209.51.94, mailfrom: christophe.priouzeau@st.com)
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
	by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 03K77kiL011025
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 09:10:31 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : content-type : content-transfer-encoding :
 mime-version; s=STMicroelectronics;
 bh=q5lbapL76uBcVGjrJ9oHhtiDXjVmChUxqYlh5P6K86g=;
 b=F81kAvJBu0lHchaz3GdVFHZWZpmWjhkFSYiesU7Asinycks9Bb6XUUyZdM44XSEKsgRI
 Qf0LcvyeeAbWpmg934vuVLbJHhZ753DdZbVkF9oyLeX/IF+4aH/sjxutJN+NAQQ1CH29
 mHZA4yOEuq8W6IZ452JXAXKYEqFp+u01IFF1Wb+kXRJTFwP5Ay0K3HYs/d1n9PazNqfb
 nFtXk5FR/URU9P9d1o5wFiyjZUGWTRzxfx6NAACFhr/uoTOYBrjZ2gH23v3NHtUDfLtn
 OBpEGoakBUIN8D5qId1uRPMWh4nvqXh9rLb+o9gWwdRbYQOIp2l80/AOR9yYqxchYE0F aA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
	by mx07-00178001.pphosted.com with ESMTP id 30fq118s7y-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 09:10:30 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
	by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 9A1D810002A
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 09:10:30 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag6node3.st.com [10.75.127.18])
	by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 18BEF2AF597
	for <openembedded-devel@lists.openembedded.org>; Mon, 20 Apr 2020 09:10:30 +0200 (CEST)
Received: from SFHDAG6NODE2.st.com (10.75.127.17) by SFHDAG6NODE3.st.com
 (10.75.127.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 20 Apr
 2020 09:10:29 +0200
Received: from SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6]) by
 SFHDAG6NODE2.st.com ([fe80::a56f:c186:bab7:13d6%20]) with mapi id
 15.00.1347.000; Mon, 20 Apr 2020 09:10:29 +0200
From: "cpriouzeau" <christophe.priouzeau@st.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Christophe PRIOUZEAU <christophe.priouzeau@st.com>
Subject: [meta-oe][PATCH] utouch-evemu: correct Fix build for 32bit arches with 64bit time_t
Thread-Topic: [meta-oe][PATCH] utouch-evemu: correct Fix build for 32bit
 arches with 64bit time_t
Thread-Index: AQHWFuLGiwQh6ykpWE688LjthaVHyA==
Date: Mon, 20 Apr 2020 07:10:29 +0000
Message-ID: <20200420071019.27903-1-christophe.priouzeau@st.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-ms-exchange-transport-fromentityheader: Hosted
x-originating-ip: [10.75.127.51]
MIME-Version: 1.0
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.138,18.0.676
 definitions=2020-04-20_02:2020-04-17,2020-04-20 signatures=0
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

A pair of parenthesis are missing on correction which generate bad
behaviour at runtime.

Signed-off-by: Christophe Priouzeau <christophe.priouzeau@st.com>
---
 ...-build-on-32bit-arches-with-64bit-time_t.patch | 15 +++++++++------
 1 file changed, 9 insertions(+), 6 deletions(-)

diff --git a/meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-=
32bit-arches-with-64bit-time_t.patch b/meta-oe/recipes-support/utouch/utouc=
h-evemu/0001-Fix-build-on-32bit-arches-with-64bit-time_t.patch
index 71bf57269..7cfd47043 100644
--- a/meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-a=
rches-with-64bit-time_t.patch
+++ b/meta-oe/recipes-support/utouch/utouch-evemu/0001-Fix-build-on-32bit-a=
rches-with-64bit-time_t.patch
@@ -12,8 +12,8 @@ Upstream-Status: Pending
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  src/evemu-impl.h |  5 +++++
- src/evemu.c      | 16 +++++++++-------
- 2 files changed, 14 insertions(+), 7 deletions(-)
+ src/evemu.c      | 20 ++++++++++++--------
+ 2 files changed, 17 insertions(+), 8 deletions(-)
=20
 diff --git a/src/evemu-impl.h b/src/evemu-impl.h
 index acf2976..c08d861 100644
@@ -32,7 +32,7 @@ index acf2976..c08d861 100644
  #define EVPLAY_NBYTES	((EVPLAY_NBITS + 7) / 8)
 =20
 diff --git a/src/evemu.c b/src/evemu.c
-index 21187af..160c915 100644
+index 21187af..7489449 100644
 --- a/src/evemu.c
 +++ b/src/evemu.c
 @@ -363,7 +363,7 @@ int evemu_read(struct evemu_device *dev, FILE *fp)
@@ -55,16 +55,19 @@ index 21187af..160c915 100644
  	ev->type =3D type;
  	ev->code =3D code;
  	ev->value =3D value;
-@@ -411,12 +411,14 @@ int evemu_read_event_realtime(FILE *fp, struct input=
_event *ev,
+@@ -410,13 +411,16 @@ int evemu_read_event_realtime(FILE *fp, struct input=
_event *ev,
+ 		return ret;
 =20
  	if (evtime) {
- 		if (!evtime->tv_sec)
+-		if (!evtime->tv_sec)
 -			*evtime =3D ev->time;
 -		usec =3D 1000000L * (ev->time.tv_sec - evtime->tv_sec);
 -		usec +=3D ev->time.tv_usec - evtime->tv_usec;
++		if (!evtime->tv_sec) {
 +			evtime->tv_sec =3D ev->input_event_sec;
 +			evtime->tv_usec =3D ev->input_event_usec;
-+		usec =3D 1000000L * (ev->input_event_sec - evtime->tv_sec);
++		}
++		usec =3D (ev->input_event_sec - evtime->tv_sec) * 1000000L;
 +		usec +=3D ev->input_event_usec - evtime->tv_usec;
  		if (usec > 500) {
  			usleep(usec);
--=20
2.17.1
