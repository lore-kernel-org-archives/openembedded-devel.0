Return-Path: <soumya.sambu@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA9CE7718B
	for <webhook@archiver.kernel.org>; Fri, 27 Dec 2024 08:07:29 +0000 (UTC)
Received: from mx0b-0064b401.pphosted.com (mx0b-0064b401.pphosted.com [205.220.178.238])
 by mx.groups.io with SMTP id smtpd.web11.9627.1735286840247365907
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 27 Dec 2024 00:07:20 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: windriver.com, ip: 205.220.178.238, mailfrom: prvs=209189776c=soumya.sambu@windriver.com)
Received: from pps.filterd (m0250811.ppops.net [127.0.0.1])
	by mx0a-0064b401.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4BR6jMou023819
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 08:07:19 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2045.outbound.protection.outlook.com [104.47.66.45])
	by mx0a-0064b401.pphosted.com (PPS) with ESMTPS id 43njw0wcjb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
	for <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 08:07:18 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GHexo2VlU5eCP7bw21HpavKzPwRTyI9tuyiIwmkTB5LwYlm6FBlX78QYY4oTwqJ/jvHMNIOod3ZJTaxhKdUi+p+mRz9LpAzmIZpya2fr+MIo2PmOGcyNO0bGtgqezDiaF3uaD0TphqIFv7l5M5TX4nJpB6pauGH12OG7CAdQp10xOKgdqsY0k1/gfzo5EfMfhJWCcgO9XiJAcyTJ0QkBgDlVj/8NFjoD29BE5kFi672wy6JYEEXF5F/7Gms/dnziAFzR4nW8/xvDx56eOi8fXlLwfH4NiasiScKhvzzT5rfjvrRRg+fP+QKGTYfxgiYEnnaWS6wKtHR7H0mJZY56bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JachLqcMnUGNAbsCqJnXTA7aRHFiMB3RzGXicA0iYZM=;
 b=pnCh+KROf3Z71P0V8Bbm5LXXwY6GJHOT5yvZTII4tkYKCaHA5nt+sPAq8EbD0gmJ+dIL5Tkc1Y4bMX2hIO3f1dFukZho/pHledggq4CgG+4OX08S+Rbsn1spwczHUbPhIb66Wf/iNJa9VqnVzr8XNdme9hU6fpnSsLqmCCGIjKyHytsvl9Mx5a3MUsVDlTKhkk6eBrpBDILFe+2/ltCufURsHv3jZwxiCE8bDL0cy1rufjrlds9qX89P9ky0Ydb2euBiMxAmsx9GqxnsMMk0mYIJEb52FCgy/3+SteBSimTPFxJ/XB8K3/lZZeMkIMr9khnLW2iejgNuWAXx8UsNNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=windriver.com; dmarc=pass action=none
 header.from=windriver.com; dkim=pass header.d=windriver.com; arc=none
Received: from CY8PR11MB7921.namprd11.prod.outlook.com (2603:10b6:930:7d::15)
 by DM6PR11MB4756.namprd11.prod.outlook.com (2603:10b6:5:2a7::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.16; Fri, 27 Dec
 2024 08:07:12 +0000
Received: from CY8PR11MB7921.namprd11.prod.outlook.com
 ([fe80::9050:ad4d:49e1:e11a]) by CY8PR11MB7921.namprd11.prod.outlook.com
 ([fe80::9050:ad4d:49e1:e11a%5]) with mapi id 15.20.8293.000; Fri, 27 Dec 2024
 08:07:12 +0000
From: "Sambu, Soumya" <Soumya.Sambu@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
        "Sambu, Soumya"
	<Soumya.Sambu@windriver.com>
Subject: Re: [oe][meta-python][scarthgap][PATCH 1/1] python3-werkzeug: upgrade
 3.0.3 -> 3.0.6
Thread-Topic: [oe][meta-python][scarthgap][PATCH 1/1] python3-werkzeug:
 upgrade 3.0.3 -> 3.0.6
Thread-Index: AQHbPMgKSxBMKpLb00O2du9VyfSTELL58ua1
Date: Fri, 27 Dec 2024 08:07:12 +0000
Message-ID: 
 <CY8PR11MB7921968E5EE3685713612AC9810E2@CY8PR11MB7921.namprd11.prod.outlook.com>
References: <180A43144C9B85E3.32265@lists.openembedded.org>
In-Reply-To: <180A43144C9B85E3.32265@lists.openembedded.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY8PR11MB7921:EE_|DM6PR11MB4756:EE_
x-ms-office365-filtering-correlation-id: a2122d2d-626b-47e0-1d70-08dd264d77e4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|376014|1800799024|366016|7053199007|8096899003|38070700018;
x-microsoft-antispam-message-info: 
 =?us-ascii?Q?ZwO/q81aaZhQUqn9jn1w3NGq7E8Mo/hdDmJlQrgJYOfTcbALWKEEtcgxgxZ/?=
 =?us-ascii?Q?jLywfRJt7rXVaapFJN20xqfQTUpXqFcvfUuf7jaQHFu6a0QHRFS5HoUd7553?=
 =?us-ascii?Q?kH1sknp2va4c5lU1scmQuYbXcoKRRDxsli0gwK+wSCoS2x2xL9eJYFYbIHtO?=
 =?us-ascii?Q?epWvjCvRkhVG2AuqwuFhTZ5jdDvlZ8R113uEWFkQrgX7IXb8fpGJ8Q+mjUIU?=
 =?us-ascii?Q?Y1i5FW98798D3PYdMNvVYQyNpQqi0YZZmqFeNeGEwURMBGDuTXHeVkrWALCT?=
 =?us-ascii?Q?QHDMnHYwj9D6Jn6Q2CbLj5JcDdxMeYPsa3d/4qMOTsyhPf6qcnQsInsLuM0l?=
 =?us-ascii?Q?Ropc14iqCl6ID07QSwas7D4HEyQSWUkd2TlQG2uV6PRGkmLcsuwkc0iIRrVR?=
 =?us-ascii?Q?1IRrd3YEgwa1SR20O+yUXNG7q86KoCd+4+i+xcpOD4N4mhS1BZv47enqsHL+?=
 =?us-ascii?Q?2TxDHZQxgKbSuvBbJg6sxwMBJTS1qMBsQtOIPE5G7l2EgZM16cPbsGLJ45Qs?=
 =?us-ascii?Q?0PqpbSj/rzqb/wlzGUqv844aZvXX10BlijoghOcbNpVotL6FNjIBkkF/BiX+?=
 =?us-ascii?Q?rSD2Vc6HHYk47UgrUFXgPfgNlVgmZHvJ7wWoIB+nUtk9lUkA97qSKZVVhElv?=
 =?us-ascii?Q?+tRRIxAHHSoZLy7hPhkarXl0J+SsXIjEDMNUSW9ux0MBV5/d2+uVCedy/4DK?=
 =?us-ascii?Q?qdmaCJze58U1XtejGuWkND5Tuy+cJDYq0/gwKeYRHUdm6aWRXBa91YuovSos?=
 =?us-ascii?Q?3vSblidzjSccnSebQkArVFD2D6KiONsMjvRJkM2Eb8zlEvbdY5AG8Frq+P/6?=
 =?us-ascii?Q?Nd99F4tmF67s4yBSDy87ooGKawh8Q0kAxGFf58HEprpNzbuDWx9s96gQ188o?=
 =?us-ascii?Q?nU7yf8dGKib+vETUPlGP+cR1tU/I1bqwraFHFNawViaE+DW8dLWI3XWy/MpX?=
 =?us-ascii?Q?vki/RqEH268AS9ny67cC7WekYLdOvsUAj5AVi2zbpQP0bFp8gTpPWR/7DzZb?=
 =?us-ascii?Q?eZjPgQdp8VYhQ4cnIB4vc1afkh7GGO68lUhuAVdHFtRndFJb9m3S6I9zs7Qb?=
 =?us-ascii?Q?UAaWnn1rpQWR3OW2iltQMlorb7X8+KYiOD+/Fn7TqHVJ8IQBuyzFIanBgFz4?=
 =?us-ascii?Q?uHIMSdpJWCw9KTekzlVGmC84s22ZC77O5sSpPPk0V3YZ4L6h0m8PctEH/pO3?=
 =?us-ascii?Q?TRmNNoJUUWaRZ3gnYJsF0Sn1kRswHfVUFH6ybyE1v6Z7WpOPiFj8nZQNKDfL?=
 =?us-ascii?Q?xATAVSjXEoUSdoSvwHnSPKZLiIMlRy+VCWqzCXmYrKA7w3TZcBBmUYt9EGTs?=
 =?us-ascii?Q?a5kvSwW3GmcZuCrERu+BWWL2B0Dm08sj4llONVtui02Dxmuy0Can06pWxlh+?=
 =?us-ascii?Q?s61hHNsko57Yu78eb+s1k4wq4Lx9?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY8PR11MB7921.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007)(8096899003)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?T2gL0ksY7nLsntqIYBCnk7jOUAu2/wLhebLnMPkjMP/XAJTCuiWi7JMqvoIV?=
 =?us-ascii?Q?JkQOdVfEObxNX9bQttFdLTqfj0mmgAS/Uka7JH2aErhoFOxVjHnItl5EwPrP?=
 =?us-ascii?Q?MJQwD0+j13gPcxpbaLnXsgSvbrc7vvNy1LbK/0xtKjK9Fr/EP4UliwBABJHy?=
 =?us-ascii?Q?Jfel3a3XdMaw0Q6DyUTJhQgJxz6L6J2eA3+m7MKHKr++hDoaL94gU3gCtYhf?=
 =?us-ascii?Q?g9oj1eURdDerLS4g9T/V77IqgFOmT+hyAScKN0YQfkV9XZAlCh64hyqNzl0N?=
 =?us-ascii?Q?RW7TwPNhwxYgoCpQIHTMwq4F8AGHBxrG6eyJow7Kg4NXEfWaYGvVWTqiOQbm?=
 =?us-ascii?Q?tI+jCS5hRZrdbtOO2OE9phHK9pGoehYYEGpRUJ4FOZtZ2ULlQjoPmFATXr0r?=
 =?us-ascii?Q?ToNXY8JKNZa4tGMXV6wvXSDzgBtZfjG0/PVdB5y/7QMiWgazuomB88kCMnJh?=
 =?us-ascii?Q?Wame3fWrhrmvncUxihN665HlUmFYNGUqWgVnff+8OjIbi+vAtZjKem4U5adQ?=
 =?us-ascii?Q?+6fF4Ev+NrFkLJObILGkwgYqhfV9yQOt/nurE/LokgeLN7kjzAKGOHqZw/yt?=
 =?us-ascii?Q?y2CQIW9yE129yla/N/NN4M26sVL0l2TUIOStEgUaGabPav5mNiVXJqS2Z27B?=
 =?us-ascii?Q?mq50G9sxfIt4ui3+sxxMhwzLPXr6EaBT7LVbvtRySNOyCSi/6CtcPwYrswxm?=
 =?us-ascii?Q?kWNEPr5gps9m+GvyhjWYwWWsukhNgmsJIYt7RlPMSvruRHsR94jlf/qCGVZD?=
 =?us-ascii?Q?0cZq1sSxKNCq6RQjtSHFGX3EqqdbzoNOQQxBHvXlYMmKrDs43RSiHvi3/+Xr?=
 =?us-ascii?Q?eI27Ws+NGbw37umV3IfikIpANWvW5HTTDOubGEcJ70VQff8PmCtMX6wFzhJf?=
 =?us-ascii?Q?sYxKagvMzMXR4xwUo+avsq7pTSPpySZQFhsx3+CwJejppd1Fy2lvZ0XmVZYt?=
 =?us-ascii?Q?Q3eplFXeev347wKMB/b060KhVmGqd7KYJdx5sD0AZQPrXf5boPSKcKChYDSC?=
 =?us-ascii?Q?9hvY3pq/0HCo+yJf5lLKPFmt4Ei4dFs46le6j+oegT1pGNmx3lnDdr/rg6x1?=
 =?us-ascii?Q?bIo1O2eFdfPgELKcFG2QKFFp4psvmAUpTAybZSZzAmpHORI0eDvtlcZu9h6z?=
 =?us-ascii?Q?7dH55/srhD9SKz+Byu1d76tvqkp+XRg/K/MWWPO8zyDTu5iZih3/OeMqX3eM?=
 =?us-ascii?Q?ogtaZxAI7xqXtX/lhlKzMACm+q79sMqHjW/unv0gyJOMGEcSPWErmUfI7wmN?=
 =?us-ascii?Q?rQfTn5/LZlnW8HRmieKhKP+60g/gv/TH34J7dmUKQQSLAx2dT/dn45hVMw6a?=
 =?us-ascii?Q?YPR3mnN2Qaqf1Q6jLCm0WQ74UDHGRR6EYIWtm75fuvCHg4rd7Ob9Bg1rERvT?=
 =?us-ascii?Q?5W2Wmxr28sWzTsO7nzSyTXFNCx+crBLkyePZKoDbW/zBmG6PBVKWasdX8ENj?=
 =?us-ascii?Q?sMpbZgUbVfzLcEjOMHtVo0gkzzXfuWt499HPGxwro4zT0djhToiqB4iOvcKQ?=
 =?us-ascii?Q?QUtPG0EyQx6NCtbFZxb5juIaxK0XME3jLqUswSBw7X0s4pQjbVy5JY18huI9?=
 =?us-ascii?Q?AR1K3P2TuqhlFkI2ULtAa5X8KGR5aFJGWTkeNiWL?=
Content-Type: multipart/alternative;
	boundary="_000_CY8PR11MB7921968E5EE3685713612AC9810E2CY8PR11MB7921namp_"
MIME-Version: 1.0
X-OriginatorOrg: windriver.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7921.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2122d2d-626b-47e0-1d70-08dd264d77e4
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Dec 2024 08:07:12.1735
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 8ddb2873-a1ad-4a18-ae4e-4644631433be
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Vl/GJ5/HcYvxfePQlbW8Q8HsrX3djyYPFM8hVs07PqA+0pke9HnU89Ykkm646FtgIb/sGOtabRO5ufDSFq+uEhuqML3bjf7rOZNBSvGsQHs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4756
X-Authority-Analysis: v=2.4 cv=Yc5H5xRf c=1 sm=1 tr=0 ts=676e6037 cx=c_pps a=smr7v+wKk2SgYJk0SwJNKg==:117 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=RZcAm9yDv7YA:10 a=bRTqI5nwn0kA:10 a=NEAV23lmAAAA:8
 a=YPyeh4z1AAAA:8 a=Q4-j1AaZAAAA:8 a=t7CeM3EgAAAA:8 a=pGLkceISAAAA:8 a=1LiM2mn5wCEHQ-l7AnwA:9 a=CjuIK1q_8ugA:10 a=AJekpf_JfDo_URcgYY4A:9 a=-YaznJJdmTcK5MRs:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10 a=lqcHg5cX4UMA:10 a=T1a-OTYGVawA:10 a=ImwWUX5h3JJ3gRE9moBe:22
 a=w8JrRwqxyiy52LetAMdd:22 a=9H3Qd4_ONW2Ztcrla5EB:22 a=FdTzh2GWekK77mhwV6Dw:22
X-Proofpoint-ORIG-GUID: Pvc7lw436v2izzbR3m_qCfbVhQ0rnqbO
X-Proofpoint-GUID: Pvc7lw436v2izzbR3m_qCfbVhQ0rnqbO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2024-12-27_03,2024-12-24_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 malwarescore=0 spamscore=0 impostorscore=0 mlxscore=0 mlxlogscore=999
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 bulkscore=0 classifier=spam authscore=0 adjust=0 reason=mlx scancount=1
 engine=8.21.0-2411120000 definitions=main-2412270068
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 27 Dec 2024 08:07:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/114555

--_000_CY8PR11MB7921968E5EE3685713612AC9810E2CY8PR11MB7921namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Gentle reminder.

Regards,
Soumya
________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Soumya via lists.openembedded.org <soumya.sam=
bu=3Dwindriver.com@lists.openembedded.org>
Sent: Friday, November 22, 2024 3:49 PM
To: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.ope=
nembedded.org>
Subject: [oe][meta-python][scarthgap][PATCH 1/1] python3-werkzeug: upgrade =
3.0.3 -> 3.0.6

From: Soumya Sambu <soumya.sambu@windriver.com>

Includes fix for CVE-2024-49767

Changelog:
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
https://github.com/pallets/werkzeug/blob/3.0.6/CHANGES.rst

Signed-off-by: Soumya Sambu <soumya.sambu@windriver.com>
Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../{python3-werkzeug_3.0.3.bb =3D> python3-werkzeug_3.0.6.bb}    | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)
 rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.3.bb =3D>=
 python3-werkzeug_3.0.6.bb} (90%)

diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb =
b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
similarity index 90%
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
index e79343034..7a56350ee 100644
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb
@@ -10,7 +10,7 @@ HOMEPAGE =3D "https://werkzeug.palletsprojects.com"
 LICENSE =3D "BSD-3-Clause"
 LIC_FILES_CHKSUM =3D "file://LICENSE.txt;md5=3D5dc88300786f1c214c1e9827a52=
29462"

-SRC_URI[sha256sum] =3D "097e5bfda9f0aba8da6b8545146def481d06aa7d3266e7448e=
2cccf67dd8bd18"
+SRC_URI[sha256sum] =3D "a8dd59d4de28ca70471a34cba79bed5f7ef2e036a76b3ab083=
5474246eb41f8d"

 inherit pypi python_flit_core

--
2.40.0


--_000_CY8PR11MB7921968E5EE3685713612AC9810E2CY8PR11MB7921namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Gentle reminder.<br>
<br>
</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Regards,</div>
<div class=3D"elementToProof" style=3D"font-family: Aptos, Aptos_EmbeddedFo=
nt, Aptos_MSFontService, Calibri, Helvetica, sans-serif; font-size: 12pt; c=
olor: rgb(0, 0, 0);">
Soumya</div>
<div id=3D"appendonsend"></div>
<hr style=3D"display:inline-block;width:98%" tabindex=3D"-1">
<div id=3D"divRplyFwdMsg" dir=3D"ltr"><font face=3D"Calibri, sans-serif" st=
yle=3D"font-size:11pt" color=3D"#000000"><b>From:</b> openembedded-devel@li=
sts.openembedded.org &lt;openembedded-devel@lists.openembedded.org&gt; on b=
ehalf of Soumya via lists.openembedded.org &lt;soumya.sambu=3Dwindriver.com=
@lists.openembedded.org&gt;<br>
<b>Sent:</b> Friday, November 22, 2024 3:49 PM<br>
<b>To:</b> openembedded-devel@lists.openembedded.org &lt;openembedded-devel=
@lists.openembedded.org&gt;<br>
<b>Subject:</b> [oe][meta-python][scarthgap][PATCH 1/1] python3-werkzeug: u=
pgrade 3.0.3 -&gt; 3.0.6</font>
<div>&nbsp;</div>
</div>
<div class=3D"BodyFragment"><font size=3D"2"><span style=3D"font-size:11pt;=
">
<div class=3D"PlainText">From: Soumya Sambu &lt;soumya.sambu@windriver.com&=
gt;<br>
<br>
Includes fix for CVE-2024-49767<br>
<br>
Changelog:<br>
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D<br>
<a href=3D"https://github.com/pallets/werkzeug/blob/3.0.6/CHANGES.rst">http=
s://github.com/pallets/werkzeug/blob/3.0.6/CHANGES.rst</a><br>
<br>
Signed-off-by: Soumya Sambu &lt;soumya.sambu@windriver.com&gt;<br>
Signed-off-by: Khem Raj &lt;raj.khem@gmail.com&gt;<br>
---<br>
&nbsp;.../{python3-werkzeug_3.0.3.bb =3D&gt; python3-werkzeug_3.0.6.bb}&nbs=
p;&nbsp;&nbsp; | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
&nbsp;rename meta-python/recipes-devtools/python/{python3-werkzeug_3.0.3.bb=
 =3D&gt; python3-werkzeug_3.0.6.bb} (90%)<br>
<br>
diff --git a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb =
b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb<br>
similarity index 90%<br>
rename from meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb<b=
r>
rename to meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb<br>
index e79343034..7a56350ee 100644<br>
--- a/meta-python/recipes-devtools/python/python3-werkzeug_3.0.3.bb<br>
+++ b/meta-python/recipes-devtools/python/python3-werkzeug_3.0.6.bb<br>
@@ -10,7 +10,7 @@ HOMEPAGE =3D &quot;<a href=3D"https://werkzeug.palletspro=
jects.com">https://werkzeug.palletsprojects.com</a>&quot;<br>
&nbsp;LICENSE =3D &quot;BSD-3-Clause&quot;<br>
&nbsp;LIC_FILES_CHKSUM =3D &quot;<a href=3D"file://LICENSE.txt;md5=3D5dc883=
00786f1c214c1e9827a5229462">file://LICENSE.txt;md5=3D5dc88300786f1c214c1e98=
27a5229462</a>&quot;<br>
&nbsp;<br>
-SRC_URI[sha256sum] =3D &quot;097e5bfda9f0aba8da6b8545146def481d06aa7d3266e=
7448e2cccf67dd8bd18&quot;<br>
+SRC_URI[sha256sum] =3D &quot;a8dd59d4de28ca70471a34cba79bed5f7ef2e036a76b3=
ab0835474246eb41f8d&quot;<br>
&nbsp;<br>
&nbsp;inherit pypi python_flit_core<br>
&nbsp;<br>
-- <br>
2.40.0<br>
<br>
</div>
</span></font></div>
</body>
</html>

--_000_CY8PR11MB7921968E5EE3685713612AC9810E2CY8PR11MB7921namp_--

