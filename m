Return-Path: <peter.marko@siemens.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06A47CCFA02
	for <webhook@archiver.kernel.org>; Sat,  1 Nov 2025 21:07:26 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.5])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.14326.1762031239603901486
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 01 Nov 2025 14:07:20 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@siemens.com header.s=selector2 header.b=CiThXq00;
 spf=pass (domain: siemens.com, ip: 52.101.65.5, mailfrom: peter.marko@siemens.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ky+VbNH6QLCX2ERNra3FWXQ34aCm7y6IsRUNY4PhqxDcEdiREbxmJTi3N2y8ATrVDBYiBCTYll3EghDIBIa5aBlvx5oKTYYQQhaeq4xxs980K4u1RpYcIareTMAdLwmHP5CLvE12mcqFbUVFTqAtBFSX7zj9jCcH+pYGvIKe9yshbjRQRgLN3YPamzngTU33pXn0U8iWBDv9CbvTIgdQ6PFw0r64Po63rC9qmN1/sT7in9mifAbEItcI+AfxatHU1nbuQxp9a2eSXOXRsM2yAhmfxqrQAY4OKCtZ5+5hhCa7wsOAieUKAyTk+ZPZTaTaRYbN1jwyaG/OjnfoO99MEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rcch55BiHg+gIXBZFjdFRjfD4KapoK14i5vVVudnpwg=;
 b=gp7sKrvaS3aQz4l/7QCuSPRwf73RnMVTuQSSziu4f+WLyeE/rnAa9jT4p8DhCA7wC69XYlBFtevEGbUzp9RbUH0O2cPRvi3m5JYaNq5WWBNQ9RwzA3jtNeqq/u6Dy2n2nH5XMx5Kpl5W7kGeH/DRt+ZgY6hsHCArEt/RsOqW3+Noos5j89k3VsJGGPUeA+BUNf3Hk41xMw1PI3FtxpICqpB6e2xXQT0lOMq7SneGsAW5d/UgxD1SSXwZfG45vL9WoQVmoRxKT91DmRw75USyYb/v68QSAXrDyLoYCbrrqxcx64dB0BzqOcRd5FuWHuKXA9V+l/EdIqXblNtSNTJKew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=siemens.com; dmarc=pass action=none header.from=siemens.com;
 dkim=pass header.d=siemens.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=siemens.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rcch55BiHg+gIXBZFjdFRjfD4KapoK14i5vVVudnpwg=;
 b=CiThXq00HV6OhdruDEtUk8bLCHWAk3Stpn28KjK6DILhpiRFs6KWeOetp4u4MKSt4j+ZZahKPt1n1gQrnQdMCSeD98r+Uw0ydW6L3Vki+HPcnX4ti96gOgSUcCq/mXn6YYPOqAaxbIKIRslb0Tac0ExCe3eIi1tfIEbO/1M4WAmhY1T5PpB3vLnViCpMIDFIF2+InO1D8ep9JBbzr2L1tLtxSwv8gOXe99zNUDL4cmsyVI7Yt0H4Hl/U4vptz9RSRdUBwg0n+gpHwceKt9Q2I+Xr0qoZIK/HbC3N20g9cTi/Uk7VabFOyAzRCLs8591ewwVgoFKs0Vd48NHwF0JfWg==
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:20b:479::20)
 by PAWPR10MB7652.EURPRD10.PROD.OUTLOOK.COM (2603:10a6:102:35a::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Sat, 1 Nov
 2025 21:07:16 +0000
Received: from AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2]) by AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
 ([fe80::6c68:267b:6fd1:d3f2%6]) with mapi id 15.20.9275.013; Sat, 1 Nov 2025
 21:07:15 +0000
From: "Marko, Peter" <Peter.Marko@siemens.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: RE: [oe] [meta-oe][PATCH] wpa-supplicant: patch CVE-2025-24912
Thread-Topic: [oe] [meta-oe][PATCH] wpa-supplicant: patch CVE-2025-24912
Thread-Index: AQHcS3Nq3IJqrYxJ40myeaMTcT01ArTeUAYg
Date: Sat, 1 Nov 2025 21:07:15 +0000
Message-ID: 
 <AS1PR10MB569711D832B9C1B5954F86D1FDF9A@AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM>
References: <1873FE07EDBE1339.121778@lists.openembedded.org>
In-Reply-To: <1873FE07EDBE1339.121778@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
 MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ActionId=da73d8b8-b58f-4b9f-894e-811cc506b00e;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_ContentBits=0;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Enabled=true;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Method=Standard;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Name=restricted;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SetDate=2025-11-01T21:06:59Z;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_SiteId=38ae3bcd-9579-4fd4-adda-b42e1495d55a;MSIP_Label_9d258917-277f-42cd-a3cd-14c4e9ee58bc_Tag=10,
 3, 0, 1;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=siemens.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: AS1PR10MB5697:EE_|PAWPR10MB7652:EE_
x-ms-office365-filtering-correlation-id: b4651f10-ed93-4f10-0e5a-08de198aa2ae
x-ms-exchange-atpmessageproperties: SA
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|38070700021|7053199007;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?MocSeHS5308Pd4xtn9f5aAAgm7wyaB74QvC6nMG1l7idQbwO4NCfpFhK3Ofy?=
 =?us-ascii?Q?0/CWniDjbjgUad+QIM9uxWIidAZagFd5PLPcMfWQaNUfpxbzeXePzLLDOOA/?=
 =?us-ascii?Q?T2CauLAAgitFIisQI8tGT44Pk6nrfGhKkUpenL9VlgeQppp19sn/2zyybzNi?=
 =?us-ascii?Q?4s6NjxARgYvJyG9jm3gmJDp4CN8XI7lVa2ktAhDk3OvC74cVrzQhWmZ1JBKA?=
 =?us-ascii?Q?BFjXCs0O8VnT4yW0y9K4eGVLolkc5NmKv84+8s/mh1CNHkW4gvTsj5jc1DV1?=
 =?us-ascii?Q?AuEQvEAq1UPrf3IRWS+6BXbbIKPeRAZYJueA29hz/zamYfrN+rhYRTXfMzax?=
 =?us-ascii?Q?ITO1/AnsSRbIUjLi4WcEKmy4s0x7QHMn1jTg9YqDyJBEGMZy4kIkVEpozhA8?=
 =?us-ascii?Q?o7Dd/MSOQB4bDZ2sy6tH4SoHeM0WpshfHrm/VXZyti8OIfhjH+qgffRM7+Qr?=
 =?us-ascii?Q?Gn4eGxF79yOA7LUxz3gfZoTYImqFwjGlSQ3tjpoJPGZlfKEpW7vq2nIhwUfB?=
 =?us-ascii?Q?FsKZtcO40HEElAJ246XixMUMcrRSnC6e8SKg4R9WWMT/76VnrnUbonuzmqQT?=
 =?us-ascii?Q?nRNHVubVrIyewiycW9eIht2U6YtzpCBI6vMdU97GkJ4Piz7fGthGuI3u4N2j?=
 =?us-ascii?Q?L0qgZtqFHEEBV3z/s5xcVvcT8EbZQnDrfA7CvTH59pbGSspVM0gOt1bpTNhu?=
 =?us-ascii?Q?kCnD7VGej4QwvRIPfBM/RKlJJ6R3EDCVJ0ay2AaaS0PJE1Cp9wrnB0LtSLFV?=
 =?us-ascii?Q?OFZugGQviJ/erjZa/BaMYpfjrWAm3NDr7XrdcFvdOppQrJvhlxfy/b5gcNpE?=
 =?us-ascii?Q?O82xyBi0T0cg3XjgvJmZrv5ooEql3Uy19EP42aUzedd3Clt9CX8x/UXArTZN?=
 =?us-ascii?Q?DdVgEGKil+FlzEOtdFiazY1YUIfM0UYHMU2t/P8OfUtVqsEUW6bWaWSe2V83?=
 =?us-ascii?Q?gzo9Wq9khnnPSp3E2IsdDMh56bUXx2vI9YJ0I/B1Py9ZmM2y5gKwK89UYJRH?=
 =?us-ascii?Q?rifm/Pk+H60+8uu2xCDQqNE1wW0UM7rWlEyAoMFO36gtNixj4pJftOgDzSsX?=
 =?us-ascii?Q?I3mWgHmhi9whCiMcWHmQR1jc8YKkpYVtWGm51rB52GBrsRFjR/6c3+eLj/61?=
 =?us-ascii?Q?nqAzS8dbfgoKUciqlACiwLCPxAXDnSof/U9xVSjbZDzjRgXFKv7Dv2dXQ0qp?=
 =?us-ascii?Q?WSDiw8qfRPz/x0rgUahCFAwFOt+4tdBj85ClCz5x5e/h4GNPrt5Nu6TpsgMx?=
 =?us-ascii?Q?drRMKPFK+wrHiS6iTSPOYPUaJoygd3vh+a2T1pFPswv+QukUItLLLUMl4STX?=
 =?us-ascii?Q?dOVOIbj+QWDwIeQXaDmaDBXT1RIhHmsLGoapyZOKrQAcQWNCkDJUiQM3IOZ6?=
 =?us-ascii?Q?4E79h0IHP83uvNgDz9Ep0wINm+z8vLN2nnDjcxs4kfmZiw/4teK60YqqoUFK?=
 =?us-ascii?Q?Etb8ReZkbSugmvn2kNaMh1mlDAeYl4FCNdevmXYPqTYE1V9T9TJuJA=3D=3D?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(38070700021)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?vKLZ+NWjhJ3WiKJK1FFMMQBPapfiPW/qwhKuxksh6DjbpgjO/aRcAscAT5n3?=
 =?us-ascii?Q?grXyd7o/at0ahRTB7++BGYK5NVKmut9Cf6M/pdcRvWeT2bvi1H8AQYIYF8rA?=
 =?us-ascii?Q?2pPQ5zPykxfIcPjeykcjI9uwIcL8LDB72u+lvqqGvhNQf7FnnUXHjOQyqNgk?=
 =?us-ascii?Q?jDOEAlTZl24BUaorfiBKSsY0psdiTtz4uDzaTKrey/DJJKT/hM/wcFOo6ifz?=
 =?us-ascii?Q?ZtmD7kTohzjWXo1n6iaSXl2WMcAEm2FdWBPKW1dpkz9rPvDmjfh/QNd4ndWZ?=
 =?us-ascii?Q?UNOULSyXzyQsIE7L8dvtzV2I0th1RmvCSeTkflYsOpa7NJ1zM7/K6DDzOWJH?=
 =?us-ascii?Q?7XWiezE7GjzDEwWccLLpUriKSyrJ4QBa0gSZ6KmI+NZZk1HsLlKa3Wt0LD4G?=
 =?us-ascii?Q?47JPgxZaX1k9WhwnOrk5isOXUZKI35JWh3+I6opuVOtQmHhzerUC9Dqb/RnL?=
 =?us-ascii?Q?jW55/V+Zp5C4mnamq5G11NmzJiHm4VVxqO/3QKl5uTO2VAB77oInyZw7abq7?=
 =?us-ascii?Q?P432gscp77XVKh4VAioFHl4L1TVvrITSbmQLe2jIDWYmjk4An/jiTcoQ3y3A?=
 =?us-ascii?Q?v1XUbFQuN8IWEgrKTDErduYI1Go0lhjW/FU02XLl6xcC0t8/MgqI7p8ruvz6?=
 =?us-ascii?Q?y7C1YcnG386CU2f0MICUlJueXxFDSMekzWcwMQpxxY+qlZBO/nHgBDN7yPnv?=
 =?us-ascii?Q?vIYaOx8oWf5EZN7PkbDNs55atau4T7/ZFObZggLjl2X+gapAzQbsAg4HOkds?=
 =?us-ascii?Q?MnOGtC7yiMuSYgg4rTEsQApn/whHExNYCS3zZkxtqLy/X0nsa40qXMK0Tkcy?=
 =?us-ascii?Q?5tZwVfs76w5jgsqHgqelKMKT9qzONb0VN5lxG548EodTIbOuhJTw/lPb40RX?=
 =?us-ascii?Q?lk/LXKvb9/YDEiXe3XnzTFEFCkGsKuj/dZYUdV1gxZMp9e00taBDPyy8FP6T?=
 =?us-ascii?Q?2fuhaKrgARSb7CCoq/c4KwJFbiEXzxiS9OSM1yedrUuan0kXnN+1XhEiKwnZ?=
 =?us-ascii?Q?emkPJihSpDSURFj8YUaMdlojbcPNS1wTarUN4r4L6y00fWCH9+5srWLN1uPx?=
 =?us-ascii?Q?3U5O3jKsQWQ8IsIqYU9woC0q3MH0XLOGTiqSL4ViR4QFoCefaTrg0ARXvRtp?=
 =?us-ascii?Q?6yU0AjRRddOvXAFgAH/sNZJbq7SZvxzlE0VrXcfeG5jqxGjba67/WnSH6cVw?=
 =?us-ascii?Q?ydsXO3OJsH5omFyeusrSZDlGLDU3h3qrEqF/q9tLExSjJ29StzzHbSw5nxQF?=
 =?us-ascii?Q?CoGLReaQKKzT+jmqGDzIdiyONXrb5AZlq+jDqnv45c7Wv/RwYTHJU2t1MDqE?=
 =?us-ascii?Q?9hOByuooh2gEEXZ51eCfu7h8z9PZTfttwgH07ulzw/L2f+7sysFZzXWtXq52?=
 =?us-ascii?Q?VHcQCjZcj8Xwi2mTSjqLAh46oTTVOCdifBXLa5Ee9oHtGjJSajKVF/SroXk4?=
 =?us-ascii?Q?yEvyYxg/exJ7HACfpjsMTXXiDlsKFExrnosxbFBmWb65lW8EL+/OvwjKE+lx?=
 =?us-ascii?Q?DVxs6RcNcK1gISRJbOg0fAwLzpjdqk8KX+xSkgXjHgSRrXMpFjubcjw68lQ7?=
 =?us-ascii?Q?oyEoVpm8hxojLO+En96RwVuV0aNdDKXw8og20YhK?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: siemens.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: AS1PR10MB5697.EURPRD10.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-Network-Message-Id: b4651f10-ed93-4f10-0e5a-08de198aa2ae
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Nov 2025 21:07:15.8340
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 38ae3bcd-9579-4fd4-adda-b42e1495d55a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6hG0E9zxXMejxJA8K+7+Pn1itDk/DDDxov27MV4xxzCDPrJPQleeS40yVumeH8G4tsJJ+76hw2rDWxOem+f0dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR10MB7652
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 01 Nov 2025 21:07:26 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/121253

Will send again with correct commit message
Peter

-----Original Message-----
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> On Behalf Of Peter Marko via lists.openembedded.org
Sent: Saturday, November 1, 2025 22:06
To: openembedded-devel@lists.openembedded.org
Cc: Marko, Peter (FT D EU SK BFS1) <Peter.Marko@siemens.com>
Subject: [oe] [meta-oe][PATCH] wpa-supplicant: patch CVE-2025-24912

From: Peter Marko <peter.marko@siemens.com>

Pick patches as listed in NVD CVE report.

Note that Debian lists one of the patches as introducing the
vulnerability. This is against what the original report [1] says.
Also the commit messages provide hints that the first patch fixes this
issue and second is fixing problem with the first patch.

[1] https://jvn.jp/en/jp/JVN19358384/

Signed-off-by: Peter Marko <peter.marko@siemens.com>
---
 .../hostapd/hostapd/CVE-2025-24912-01.patch   | 79 +++++++++++++++++++
 .../hostapd/hostapd/CVE-2025-24912-02.patch   | 70 ++++++++++++++++
 .../hostapd/hostapd_2.11.bb                   |  2 +
 3 files changed, 151 insertions(+)
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-2=
4912-01.patch
 create mode 100644 meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-2=
4912-02.patch

diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01=
.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.pat=
ch
new file mode 100644
index 0000000000..36660b5880
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-01.patch
@@ -0,0 +1,79 @@
+From 726432d7622cc0088ac353d073b59628b590ea44 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <j@w1.fi>
+Date: Sat, 25 Jan 2025 11:21:16 +0200
+Subject: [PATCH] RADIUS: Drop pending request only when accepting the resp=
onse
+
+The case of an invalid authenticator in a RADIUS response could imply
+that the response is not from the correct RADIUS server and as such,
+such a response should be discarded without changing internal state for
+the pending request. The case of an unknown response (RADIUS_RX_UNKNOWN)
+is somewhat more complex since it could have been indicated before
+validating the authenticator. In any case, it seems better to change the
+state for the pending request only when we have fully accepted the
+response.
+
+Allowing the internal state of pending RADIUS request to change based on
+responses that are not fully validation could have allow at least a
+theoretical DoS attack if an attacker were to have means for injecting
+RADIUS messages to the network using the IP address of the real RADIUS
+server and being able to do so more quickly than the real server and
+with the matching identifier from the request header (i.e., either by
+flooding 256 responses quickly or by having means to capture the RADIUS
+request). These should not really be realistic options in a properly
+protected deployment, but nevertheless it is good to be more careful in
+processing RADIUS responses.
+
+Remove a pending RADIUS request from the internal list only when having
+fully accepted a matching RADIUS response, i.e., after one of the
+registered handlers has confirmed that the authenticator is valid and
+processing of the response has succeeded.
+
+Signed-off-by: Jouni Malinen <j@w1.fi>
+
+CVE: CVE-2025-24912
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=3D726432d7=
622cc0088ac353d073b59628b590ea44]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_client.c | 15 +++++++--------
+ 1 file changed, 7 insertions(+), 8 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index 2a7f36170..7909b29a7 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -1259,13 +1259,6 @@ static void radius_client_receive(int sock, void *e=
loop_ctx, void *sock_ctx)
+ 		       roundtrip / 100, roundtrip % 100);
+ 	rconf->round_trip_time =3D roundtrip;
+=20
+-	/* Remove ACKed RADIUS packet from retransmit list */
+-	if (prev_req)
+-		prev_req->next =3D req->next;
+-	else
+-		radius->msgs =3D req->next;
+-	radius->num_msgs--;
+-
+ 	for (i =3D 0; i < num_handlers; i++) {
+ 		RadiusRxResult res;
+ 		res =3D handlers[i].handler(msg, req->msg, req->shared_secret,
+@@ -1276,6 +1269,13 @@ static void radius_client_receive(int sock, void *e=
loop_ctx, void *sock_ctx)
+ 			radius_msg_free(msg);
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
++			/* Remove ACKed RADIUS packet from retransmit list */
++			if (prev_req)
++				prev_req->next =3D req->next;
++			else
++				radius->msgs =3D req->next;
++			radius->num_msgs--;
++
+ 			radius_client_msg_free(req);
+ 			return;
+ 		case RADIUS_RX_INVALID_AUTHENTICATOR:
+@@ -1297,7 +1297,6 @@ static void radius_client_receive(int sock, void *el=
oop_ctx, void *sock_ctx)
+ 		       msg_type, hdr->code, hdr->identifier,
+ 		       invalid_authenticator ? " [INVALID AUTHENTICATOR]" :
+ 		       "");
+-	radius_client_msg_free(req);
+=20
+  fail:
+ 	radius_msg_free(msg);
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02=
.patch b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.pat=
ch
new file mode 100644
index 0000000000..add2e47048
--- /dev/null
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd/CVE-2025-24912-02.patch
@@ -0,0 +1,70 @@
+From 339a334551ca911187cc870f4f97ef08e11db109 Mon Sep 17 00:00:00 2001
+From: Jouni Malinen <quic_jouni@quicinc.com>
+Date: Wed, 5 Feb 2025 19:23:39 +0200
+Subject: [PATCH] RADIUS: Fix pending request dropping
+
+A recent change to this moved the place where the processed RADIUS
+request was removed from the pending list to happen after the message
+handler had been called. This did not take into account possibility of
+the handler adding a new pending request in the list and the prev_req
+pointer not necessarily pointing to the correct entry anymore. As such,
+some of the pending requests could have been lost and that would result
+in not being able to process responses to those requests and also, to a
+memory leak.
+
+Fix this by determining prev_req at the point when the pending request
+is being removed, i.e., after the handler function has already added a
+new entry.
+
+Fixes: 726432d7622c ("RADIUS: Drop pending request only when accepting the=
 response")
+Signed-off-by: Jouni Malinen <quic_jouni@quicinc.com>
+
+CVE: CVE-2025-24912
+Upstream-Status: Backport [https://w1.fi/cgit/hostap/commit/?id=3D339a3345=
51ca911187cc870f4f97ef08e11db109]
+Signed-off-by: Peter Marko <peter.marko@siemens.com>
+---
+ src/radius/radius_client.c | 10 +++++++---
+ 1 file changed, 7 insertions(+), 3 deletions(-)
+
+diff --git a/src/radius/radius_client.c b/src/radius/radius_client.c
+index 7909b29a7..d4faa7936 100644
+--- a/src/radius/radius_client.c
++++ b/src/radius/radius_client.c
+@@ -1099,7 +1099,7 @@ static void radius_client_receive(int sock, void *el=
oop_ctx, void *sock_ctx)
+ 	struct radius_hdr *hdr;
+ 	struct radius_rx_handler *handlers;
+ 	size_t num_handlers, i;
+-	struct radius_msg_list *req, *prev_req;
++	struct radius_msg_list *req, *prev_req, *r;
+ 	struct os_reltime now;
+ 	struct hostapd_radius_server *rconf;
+ 	int invalid_authenticator =3D 0;
+@@ -1224,7 +1224,6 @@ static void radius_client_receive(int sock, void *el=
oop_ctx, void *sock_ctx)
+ 		break;
+ 	}
+=20
+-	prev_req =3D NULL;
+ 	req =3D radius->msgs;
+ 	while (req) {
+ 		/* TODO: also match by src addr:port of the packet when using
+@@ -1236,7 +1235,6 @@ static void radius_client_receive(int sock, void *el=
oop_ctx, void *sock_ctx)
+ 		    hdr->identifier)
+ 			break;
+=20
+-		prev_req =3D req;
+ 		req =3D req->next;
+ 	}
+=20
+@@ -1270,6 +1268,12 @@ static void radius_client_receive(int sock, void *e=
loop_ctx, void *sock_ctx)
+ 			/* fall through */
+ 		case RADIUS_RX_QUEUED:
+ 			/* Remove ACKed RADIUS packet from retransmit list */
++			prev_req =3D NULL;
++			for (r =3D radius->msgs; r; r =3D r->next) {
++				if (r =3D=3D req)
++					break;
++				prev_req =3D r;
++			}
+ 			if (prev_req)
+ 				prev_req->next =3D req->next;
+ 			else
diff --git a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb b/meta-oe=
/recipes-connectivity/hostapd/hostapd_2.11.bb
index daaf2dcd55..a6f7122847 100644
--- a/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
+++ b/meta-oe/recipes-connectivity/hostapd/hostapd_2.11.bb
@@ -12,6 +12,8 @@ SRC_URI =3D " \
     file://defconfig \
     file://init \
     file://hostapd.service \
+    file://CVE-2025-24912-01.patch \
+    file://CVE-2025-24912-02.patch \
 "
=20
=20

