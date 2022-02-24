Return-Path: <shin.matsunaga@fujitsu.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 486DEC433F5
	for <webhook@archiver.kernel.org>; Thu, 24 Feb 2022 08:40:35 +0000 (UTC)
Received: from esa16.fujitsucc.c3s2.iphmx.com (esa16.fujitsucc.c3s2.iphmx.com
 [216.71.158.33])
 by mx.groups.io with SMTP id smtpd.web11.7991.1645692033032781779
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 24 Feb 2022 00:40:34 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=pPNxqLbd;
 spf=neutral (domain: fujitsu.com, ip: 216.71.158.33,
 mailfrom: shin.matsunaga@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1645692034; x=1677228034;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=NPbaRHpGssR7qWXf1aZcjWk0XWQnDDZcyM3I3zN/QN0=;
  b=pPNxqLbd0IGK9eAe4WvatjV/OkBnoFD1B25UUkagF37fGRNb0leIyBcR
   jcHvfQHQ0JpTWZOa/zim34gHDItdZMdG/mKeiJn1f80SM96DnOAqP8dYn
   T5ujTLLTP7Gy3taLyoUmmrm49zr62WUOBEvATCa1Gzb9QZs7UCwgxmmZp
   lMwFP2ZjamDlZvE2zG3g6NeFP/dzhvwga6B9/yBtfAW89U5dd6R7pvlrJ
   DwYtgYKFZJCjiCFePxFEmpeX4C24L6HJJQCu/st78hpfjalyJAzpWW7eW
   Ijc35YkI/vci6yDTk7h0SD1dtdRbjH4KAPnuDa+GmQr3rIavczEdsqOw9
   Q==;
X-IronPort-AV: E=McAfee;i="6200,9189,10267"; a="50354584"
X-IronPort-AV: E=Sophos;i="5.88,393,1635174000";
   d="scan'208";a="50354584"
Received: from mail-os0jpn01lp2112.outbound.protection.outlook.com (HELO
 JPN01-OS0-obe.outbound.protection.outlook.com) ([104.47.23.112])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 24 Feb 2022 17:40:30 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=G2BW5YZCMkekWNkhPCkym/TI73HmTWJaOmtXyUiIwjbr2yh6xh36eTHgH3EzMmykhLuj6HJGvjVTDjvq8AjkzhQusXR+5Yf69+cq5dEcm2XUNucPfE7xRWOydL7jSzZxkg9a7UjtbplEQGpu3/TrH9ua40Zdmq5+1Y7BfmkiRLPas2vyYz5fs4AosELHXKlW1IjtE07zIDN7sZb8+oY43y32Sy2OysO28Q3qZyf8bJuiRHwqvVYyXG1D3zhxAjuTfjV1zBbL3xm6cycz7Gj1oMoIgHzRnWJ6YyeYdm8B6G1qn+ugnOvnrU3niqB/UCLxbZSDBrYeCVOx50ClFOdNjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hsiRJ8klOjAVTxt7RoySdECs/vf/MPdazyktPg1jJHM=;
 b=RPY0kG1ep18IexK2fjyuoFWSFzGsOimy+T5wHiPki5UzVJcc8F2f91JLq/FKR+UwCSFGhX2vgPdlbtgViEf183f0438TRaLqlcY91K4ayF2df1alEXqnWPfWOfRWFm54cr02tQ05eJg78KCXExYwcTxKfdNWzD6i/nx9ODVm2G/2YdJA76eX32SnSuTV5nptLUlcHe6IAaMLt+LMM0odLVZZ5vgJ36YxLihK+Pajk+iKSa1jdCu92gvWZA3B+pCaYDVJnx1cnlxapBY9DT8yR0BiMh5gXgjuE9WlfUACswLXyKHjQoN2PRa/4Y1lRA2wa2Wj4UCRv3WY+Afz0PaKhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hsiRJ8klOjAVTxt7RoySdECs/vf/MPdazyktPg1jJHM=;
 b=gDQxHdsQYdUSxhNHcVHvdIWnkYIq0Ia3LxbtI6XNKqxBg0EUr6MDsv2pXcKfjAGR1xzdk6VHTBg6cpIN2E1Zln7WMZy7dfNXvBTSXbNmOKArxWh/qPLkb0gXBbQbLEpWDUR/DlTcoSqG/dwGOANAeSTL7Uvc9rCGtRsNt0ZVnqs=
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com (2603:1096:404:75::15)
 by OSBPR01MB4342.jpnprd01.prod.outlook.com (2603:1096:604:73::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17; Thu, 24 Feb
 2022 08:40:25 +0000
Received: from TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::5dc4:710b:bec2:30f5]) by TY2PR01MB3289.jpnprd01.prod.outlook.com
 ([fe80::5dc4:710b:bec2:30f5%5]) with mapi id 15.20.4995.027; Thu, 24 Feb 2022
 08:40:25 +0000
From: "shin.matsunaga@fujitsu.com" <shin.matsunaga@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: FW: [PATCH] openldap: add CVE-2015-3276 to allowlist
Thread-Topic: [PATCH] openldap: add CVE-2015-3276 to allowlist
Thread-Index: AQHYG7pxUUpJH13l5ECN2UdPIX0dTayiaoig
Date: Thu, 24 Feb 2022 08:40:25 +0000
Message-ID: 
 <TY2PR01MB3289EAE650652B4AAF588E11923D9@TY2PR01MB3289.jpnprd01.prod.outlook.com>
References: <20220207003045.3300116-1-shin.matsunaga@fujitsu.com>
In-Reply-To: <20220207003045.3300116-1-shin.matsunaga@fujitsu.com>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2022-02-24T07:34:56Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=5f95f113-06f5-4233-b5fc-019b39ecac49;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=fujitsu.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: ff84234e-c9e7-4998-7814-08d9f7714db9
x-ms-traffictypediagnostic: OSBPR01MB4342:EE_
x-microsoft-antispam-prvs: 
 <OSBPR01MB43420B4E014BB7693079D368923D9@OSBPR01MB4342.jpnprd01.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 E/mXJL/e07nMFmT/JikCO4NcSNmE461XIO3nCQzrzwlskFg8pgzzoYdsZ/uSoOz7R6r4z+ir7gcKQaYmNCrcccv8q7kOzp7+IjNBF9gSbHQhrF9UJAnoZZDL+LxPh5EuFNiTKfvUE13/8S187WQM8RyrJGnP49DBSo1YMckss546lTzDDbQHLWqd1ZVgCeRTYrzCc2B7NckHbJtfod/GawKnmonX8CY6NsMJjZm5bbJvFCT1hBzOnBNhXdfxGlolqHy6b7SQfzoHMQCDWgBKQY8B8LotrKFZQ5LbhCXdO18WdV3vH70fOBH58UlteajOh5UTW79xAw2hfS3TRVyiLgCi9HqHD/s3PUAj1xwZt9C3Bhkw4z7q+/Qc7AU6P+dxLON7UE/A/ppTCawi41oMF3GfdAYZojHpDFQVv/7iKVyd1wX5kEh3Xd8w/MU6PBk44BXvv8VO4yMmpAIMKxoMhf5yd4r0qVdu7L3gNRIFxBCo2sQjKGqsMpv7VhF6R0u8VFtRRsIHu9zXDbFJyYXkWVQoXvzzkXQs8SM+koQOA0df0oqm7QjOIJuI3O9NReP85+vlVAXHg/pb+cr+BdQ3zRvd4G8usjksMwmsfHF9fcvhqI13exUjnmbhheJIX8VRqehJMbTxTmJxgEc9VGAUW+8hYQrRYvrDGwVEdYwJTSpQ/B+fi5q23OVLSPXFK6iIIMYuBFKJI2rKZpkmuI2CKQ==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY2PR01MB3289.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(9686003)(6506007)(8936002)(53546011)(508600001)(5660300002)(38070700005)(38100700002)(82960400001)(52536014)(4744005)(2906002)(76116006)(186003)(66446008)(8676002)(55016003)(66476007)(86362001)(85182001)(71200400001)(33656002)(83380400001)(64756008)(26005)(6916009)(316002)(66946007)(66556008)(122000001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?YzhvRWkrUlMrYitQc1JjZS9aT1l6amdoT0duWDBGdkZPRkRwWC9FTnNK?=
 =?iso-2022-jp?B?K0VORUZVYXkrRHArejFXSzJEdVVldVNJNDhEQTN0eGo2OEJCeHlEaHMy?=
 =?iso-2022-jp?B?T3JQUTFyNWg1S2M3Vk5NUENxbVB1VzZOL05FWGdseEtCS1BWaUQyMkdG?=
 =?iso-2022-jp?B?OTM3Sm8ralEwNzgyQk1EZTdZaWRFdDZPVFhWT3UzdWZNanZJOGxtYmhM?=
 =?iso-2022-jp?B?cG1DQ3M5dUg0dTdBQTZUd3pQSG0zVWM3aTJDbjlMTHRibmpaNXM3c28v?=
 =?iso-2022-jp?B?UkYvV2hCY0JSTDVsa0hnRkNQNytjbUlRNlNmT2N3RFk2ZEQza242ekpq?=
 =?iso-2022-jp?B?eUxNOEF0NUJaSC9JODdYc0ZKZWhxQ2c1MGQxSUE4YUwrd0VZVTczUzFK?=
 =?iso-2022-jp?B?VzlyUFFJY3dQdkV2SDBPY0VPdlpzbXJGcGhPKzhJSUZYWFF5aldGTUZC?=
 =?iso-2022-jp?B?YU50aXZHaTlPbXl5TWVTTDlUZnZIRnRKYm1NT1hOQXozRVlCL2E2SWNt?=
 =?iso-2022-jp?B?VVJPS2FrTHhRalI1aWRWU3dWd3BYSmsrQkg4d2NZdWdodmtIS1RIK2do?=
 =?iso-2022-jp?B?b3pEeS9qUUplRkZaU0RBeDdSL3VKc2M4MFBUNUErcDU0MW95T0FUQmxs?=
 =?iso-2022-jp?B?NjRoOEVNTDEwOXpUNHlPenU5ZGtSWi9SWldkS3hCZElONW9VVGtFRTNZ?=
 =?iso-2022-jp?B?UGFXdDJESWpqV00rUmhkSjE3VFQwRDNkdWE1aDJCUFRIbTFsUWtqUG12?=
 =?iso-2022-jp?B?Mmw4c0JTZWtqcTJGVWRYRXQzSVB5cUlRS3FIN3hyWVRPQmptalc1SlJN?=
 =?iso-2022-jp?B?SnlZVDJ1aDZXRSt1N3BjN3RYOXFmcmxuckxxTjk0bXd1Wmp6UnRSamFw?=
 =?iso-2022-jp?B?UGcraFNSY3ZsSnBjendtcyt3VFdRWnBPazJFK1U4Z29FcFlpVXMzYkhW?=
 =?iso-2022-jp?B?bTRDMlZ6T0ZrWU9BMlAvVDJ4MExheXRBTWlkS3NsUi81ei9mV1NCOFZh?=
 =?iso-2022-jp?B?QmE5U1oxN05YbTd4QUtwb1NEYnFUVjg2bUpKSm9vSGVuNkYzM1dMRXBH?=
 =?iso-2022-jp?B?M3VhNng3UEx2RTNQaUhIdlRNQ0FvSlBBODA2RHNVV3dma2VjZFM0di9x?=
 =?iso-2022-jp?B?amlsWTRwS0N5QjQ5TGsrckNsNFIvQ3ZJOHhXYVBwMFQyTmQ4MDF1dnc1?=
 =?iso-2022-jp?B?M2dJUjJXWnRuZGdyYnpTdW1mbXF1d1ljS2hsS0QzR25EZDJ3OUt5UDQ3?=
 =?iso-2022-jp?B?WmxtbWV3eEJrNEdUaHZHM2dHeWtkVUVJUytkN0Y2dGhodDljOTZmTTJo?=
 =?iso-2022-jp?B?QlhTYWZCUkF0MEJLbkoyY0N2bkxFdjV1dmVJSHBoSWpzRDIyU3lvK2o4?=
 =?iso-2022-jp?B?ZU9ZOVFjVWFxVUcySk1EL1hMS2ZveEh0a2ZmN3FqSlpXNHVRSEszV3kv?=
 =?iso-2022-jp?B?Smlwd25XZmVsSjFPVmVXUFhoSkxDdjBEMjNRNXByeUg2c1A0ZW9tS1BS?=
 =?iso-2022-jp?B?bll3c0RrVlpvaEgyUlJFN01MdjVtNzdSUEpicGJWSFZoQXVLSWxlalVz?=
 =?iso-2022-jp?B?MUxjT3NHREg5c2c1eCt5dUNKdXVldzgzNkFwV2xGd3d3bHcyMjZoUXRK?=
 =?iso-2022-jp?B?V2RONEFRVFdaTmcxSUs0OVkxZHpUSVhhRFNTcWl5bExuTnp1K1pKTlU2?=
 =?iso-2022-jp?B?aFFyMExRZThqRGdhTW10TTZQQ3lWMWs0YzhOVUMydXlrcEdUOEFMeXgx?=
 =?iso-2022-jp?B?ZlR0WU1wNFZKRkJzTWJ6bE1OOWdqK2pwQWY4eldxSEZ3aDc4ZXVvWWFj?=
 =?iso-2022-jp?B?NnNUVlJJeFhKZFJTMnMvWm4xV1pTdkJjbmhwTXJ2UWhxUzFFTTBJNXQv?=
 =?iso-2022-jp?B?UzVCUXdURFIwQ2twOE1hTGRucTFPRWhPbG9IV3NEWVN6RnBQSGhBZHFp?=
 =?iso-2022-jp?B?a3NocVErQjhIQmxEWnZwNHF3bDFyVWdtL2d5akZwSnRBeThndWhxTWNO?=
 =?iso-2022-jp?B?UDZhbFVLWURBT1c3eXZqZk5GOWdHRDlMWHpJbFpEMzZnbDcwMEhLTzJ4?=
 =?iso-2022-jp?B?VWxGc1g3MVhLbm1NUUNpUXNoVGZJTm8yK2ovTFRpNjNxRnRYUmpuYlVu?=
 =?iso-2022-jp?B?WVhyRG9tREY1MlVQOFhkOUdkWjZWS05LM3BhbGJpU0lPTC9PZDNaelps?=
 =?iso-2022-jp?B?SmZMc2hTeWlZQXFEV0p1bTA5Y1QvZUFMRTZxOVRlTDlVWWJzWEJjeWFj?=
 =?iso-2022-jp?B?OUFUamtITHlKa0hyUkw3Vkw4bElUell2bWJvOGdNM1Jvei9Rcnl4OGRo?=
 =?iso-2022-jp?B?aHRXUkI0eGlSaW9ZQ0lxOHpUd3VnajFUeHJ3dlprYzkxOHJwOWYvZFBF?=
 =?iso-2022-jp?B?WjNCTjNBS1VUdGVzY1FDdjloV0t3ZW5FZXpCQVlRdjI4eHlsc3grbXgr?=
 =?iso-2022-jp?B?WFYrQnhRPT0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TY2PR01MB3289.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 ff84234e-c9e7-4998-7814-08d9f7714db9
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Feb 2022 08:40:25.6689
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 
 uW3qp56fLazV92NVMCTTfMeXqPR4kO2r23FfObr2Mc6cB8bHQa+DH9f7h1JZ/hcwKCThbxxvcjariYDpMt1keZjTUIcFqxd2LdVPrSpIYxU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSBPR01MB4342
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 24 Feb 2022 08:40:35 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95502

Ping.

-----Original Message-----
From: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>=20
Sent: Monday, February 7, 2022 9:31 AM
To: openembedded-devel@lists.openembedded.org
Cc: Matsunaga, Shinji/=1B$B>>1J=1B(B =1B$B?5;J=1B(B <shin.matsunaga@fujitsu=
.com>
Subject: [PATCH] openldap: add CVE-2015-3276 to allowlist

CVE-2015-3276 has no target code.

Signed-off-by: Matsunaga-Shinji <shin.matsunaga@fujitsu.com>
---
 meta-oe/recipes-support/openldap/openldap_2.5.9.bb | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb b/meta-oe/r=
ecipes-support/openldap/openldap_2.5.9.bb
index f3b8c6c98..a170b135f 100644
--- a/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
+++ b/meta-oe/recipes-support/openldap/openldap_2.5.9.bb
@@ -236,3 +236,6 @@ python populate_packages:prepend () {  }
=20
 BBCLASSEXTEND =3D "native"
+
+# CVE-2015-3276 has no target code.
+CVE_CHECK_WHITELIST +=3D "CVE-2015-3276"
--
2.17.1


