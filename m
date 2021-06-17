Received: from esa14.fujitsucc.c3s2.iphmx.com (esa14.fujitsucc.c3s2.iphmx.com [68.232.156.101])
 by mx.groups.io with SMTP id smtpd.web08.3319.1623903198107530047
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 16 Jun 2021 21:13:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@fujitsu.com header.s=fj1 header.b=qSIBguG1;
 spf=pass (domain: fujitsu.com, ip: 68.232.156.101, mailfrom: ito-yuichi@fujitsu.com)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=fujitsu.com; i=@fujitsu.com; q=dns/txt; s=fj1;
  t=1623903199; x=1655439199;
  h=from:to:subject:date:message-id:references:in-reply-to:
   content-transfer-encoding:mime-version;
  bh=GiNz4ot2bJTKy74khALfP3GqWV3+lrMDXKjT0m5IuYw=;
  b=qSIBguG1nur2XqCuo+gqGHaWX7TlrHRCEwkx010m2sz2z7BpRk/Et9dT
   BppbHXvjqsq3KrdIdCXvSMErKSBTWzunEVuQWbU8q0fdHeHOfKnihmUm4
   C2rzCW3KsM6x+qjLB5pTOjK9U7cg8UdrBOccENIVCLZODtZ8D2lfgZM8K
   IIKkcR8KYdzyvufzqipu6safzPP2NTVtXoeU3H1XEH/LZdVBCQQv4qChv
   QsZ3ZRPvrdWJO54slJkOwucFZpXZhFctK5ixkvbn9dpK7wS7OEattNwgC
   dNNc3jgDuoV8z5ns+viOC/3AQTwwvO7sYz+C1A1w2pQg+WQV2/9H+d0uB
   A==;
IronPort-SDR: c7tuW04MhWfQ+EFYSOiTkCBGwy95Sex8Q2c0OdTj9DACGWdRdTc/Ltx1jqz+aJeE4/WaS1WACZ
 s11M5RKO63KgQlXdIdrAUGlLiMEWZjRUE885vJZXFzcmqCVHOOGD3ONMqkDys4mELMOrrwclr6
 feVo/DaB4D3daoMI5DirMUzq0pivD2POXDVdVRhoQJD9GhQlbEkzl8q0RJZtrfV7cKkAIdZ9hE
 4trfo+ZIuARMPTS/lnoe7TTtd3OLCNpi0egSAxjzCQ5kQqVUrOMiA7peSO0Y5xpdJBfLzR8Ar/
 rJE=
X-IronPort-AV: E=McAfee;i="6200,9189,10017"; a="33168520"
X-IronPort-AV: E=Sophos;i="5.83,278,1616425200"; 
   d="scan'208";a="33168520"
Received: from mail-os2jpn01lp2055.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([104.47.92.55])
  by ob1.fujitsucc.c3s2.iphmx.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2021 13:13:16 +0900
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Uo+nkj2X11K+tGovtMpm7Sfy77lClCb/DuA0i8w2rqMV2e+fVteAo+PA6EfieFcjYKwmF55ug/OFet8Yq3gvn51O5QBYvFpIVbV67VPPgM3WZ5f4V0oKYoyH9i65dw8k0RXWFJs9/qee2Ybd+6oPC1Jreokv1hVTk3pEfZ8kGOPvCDeuiZosfvFTsXIS3yow4tat1Uchf/c4xiVHUtmLhGicHu6xwMPUKzaQgSfWh5WbOGXWUUjkPryeIqksq/VNImcVDvVgzlo59dhl+53m3pNalw0TYPynTz27swJ/k22zHbOeM4ews1JpNx2XPHcOgXGmh2wQTe0FRK3ifRsl9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K+B3P3hE3olQIZyFc5SUSoIS+UVoIdrGxrpVeTFka4=;
 b=AGRe87O8KP6D2uHF4ztlrBRbqzOPlW9ayeRC68j8c7qKdA56HqVPO5+RL4qAPhikeOs8/LW06Ab2bMOpNMLGZPNrzGknFFhaFa/hn8DDtyK23UqnJtyJvCEv31sJ2D0EzDIOphZ1UyXc65S8cp9+V3pWu199jqkho6WfjmGy1+M2o9D0OYzY5W1e7QJkfjJp82l1vU5ktYtU6lDxJPRULRTAQcCxp73m7LGvPhRt/wKLsqKZK4GykSD/t7c7lS8a+rs3FhZDq7aFv/qNO/6RNOFksxi1CFXr8Inrgeq7QR3kd76ul4KP4LG0j119Y2aJBcDs32T5jL8acJmFZRYvHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=fujitsu.com; dmarc=pass action=none header.from=fujitsu.com;
 dkim=pass header.d=fujitsu.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fujitsu.onmicrosoft.com; s=selector2-fujitsu-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9K+B3P3hE3olQIZyFc5SUSoIS+UVoIdrGxrpVeTFka4=;
 b=W7X5xbldLKk3JxPHFiQOSGTMNsfwEpQGyoaQI4menSMc7CDalYO1cBqIVlZOaTmzH7KRkl+7gH4Bnk8QsJxwcv8iW8zPvyFLDpKo3CKRQfvjf+qk+IpGEQmLyiNf6EaJrUTK44rVE8AXJ8hVe9w2w5Ql2qnQ9BrkpGthwv8p4qM=
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com (2603:1096:400:41::9)
 by TYYPR01MB6556.jpnprd01.prod.outlook.com (2603:1096:400:e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4242.16; Thu, 17 Jun
 2021 04:13:12 +0000
Received: from TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b]) by TYCPR01MB5599.jpnprd01.prod.outlook.com
 ([fe80::446a:7e01:7ec1:953b%4]) with mapi id 15.20.4242.019; Thu, 17 Jun 2021
 04:13:12 +0000
From: "ito-yuichi@fujitsu.com" <ito-yuichi@fujitsu.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [PATCH] dovecot: add CVE-2016-4983 to allowlist
Thread-Topic: [oe] [PATCH] dovecot: add CVE-2016-4983 to allowlist
Thread-Index: AQHXYXs1RfiaWmEHoUauASH5MCRaJKsXmnfA
Date: Thu, 17 Jun 2021 04:13:12 +0000
Message-ID: 
 <TYCPR01MB5599CED629CC952CE45E5E9E8F0E9@TYCPR01MB5599.jpnprd01.prod.outlook.com>
References: <16889911C5E4B48C.20286@lists.openembedded.org>
In-Reply-To: <16889911C5E4B48C.20286@lists.openembedded.org>
Accept-Language: ja-JP, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Enabled=true;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SetDate=2021-06-17T04:10:36Z;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Method=Standard;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_Name=FUJITSU-RESTRICTED?;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_SiteId=a19f121d-81e1-4858-a9d8-736e267fd4c7;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ActionId=10c29ca9-9f29-4c2f-998f-8a46b0293cdd;
 MSIP_Label_a7295cc1-d279-42ac-ab4d-3b0f4fece050_ContentBits=0
authentication-results: lists.openembedded.org; dkim=none (message not signed)
 header.d=none;lists.openembedded.org; dmarc=none action=none
 header.from=fujitsu.com;
x-originating-ip: [210.162.30.54]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 6ba7fcb9-7c15-4c4b-90c9-08d93146393e
x-ms-traffictypediagnostic: TYYPR01MB6556:
x-microsoft-antispam-prvs: 
 <TYYPR01MB655608B20258878820C644378F0E9@TYYPR01MB6556.jpnprd01.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:421;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 JKzoccZwahx/ekp9i9amWOJHZz+XL69iWo3IbAzTgHc829CSEChUccbAWTECniJEi6Q2kZEMv1zKpvu91VAr0UG97V0XJZqyNVPmWEX52sHFI5rrjLL74QSqJC9+7H40X/rHv+WsRC0ttj5Wv+t8WrBQimaRCzPaKz4MJFajI0z4CWLSSCTSZIiWmOtt8NzYG0rn5CpLFlsAEgyU9zAImtM4ZYy7jrIFh0+IHY7e+bVHsMLlWwOF5gv5HxXV0zeQybOxy/piBE88JMiDU3CIL0nrB/D06YwT1n5GHBy7F2qLWFmqULEt1QjJaztmHC8TTM6LYKJFWFMdYhwWrXCkfu5td7/ysLE4MQB+ofgn6rlMpnwDSdo6+qutUu0OkEOU6kNGn5WgQRrQ4xxj+LvvfXnwooOLhRpX0aFnoXUE45j7g+d1ypIRW/DU/ysdzOJYP+ZmkIshLu+ySk3EvVu2haaSYrKAXOC11RM/+11coVU3qhTU74hPpl58YsvvS7YJpEnmhCDU3iajbRa2FI1napGIwSlweCT3Od7vub5h9iW/TcF9eBvLLG3wlB6crJXGUT9+G7/0Zn6ZM2KQTfMDlRqoRZliGVRIz1Q2sjIPYiY=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYCPR01MB5599.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(346002)(396003)(39860400002)(136003)(66476007)(66556008)(316002)(9686003)(71200400001)(66446008)(66946007)(64756008)(52536014)(2906002)(76116006)(122000001)(26005)(53546011)(6916009)(6506007)(86362001)(33656002)(8936002)(55016002)(83380400001)(38100700002)(478600001)(85182001)(8676002)(7696005)(5660300002)(186003);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-2022-jp?B?VWlpRU81UGh1T3RzdVRpcTRlYmdFR1hsOHpybTFnNzM5UjFsS0ZWYUJN?=
 =?iso-2022-jp?B?RmU1bFNNZ0d0dk4yRW1kVVJOeUp0S1N1aDlINTBsamNjbjdhQjRKenFp?=
 =?iso-2022-jp?B?dlFXNDNXZFRCSzQzME9SRlorUGFvNnNMZk1hdE0xT2VJWnZXQmZTTERE?=
 =?iso-2022-jp?B?Qk1PeERwK0V2a25WRElIT1RMVDcwZ21KdmxoNmVJbzB4czhRa1pCUXNw?=
 =?iso-2022-jp?B?ZGlyQzNJYmxMUC9Fd2tmc2NzYTJkQk4yKytzcUlRcVJrbFJlU2dza1FD?=
 =?iso-2022-jp?B?aUYzYjk5RmQ3VnUybjAxL3Zad0dTNFYxcEM3cVcvSjFYYmROd2ZQdExs?=
 =?iso-2022-jp?B?V2JzUmlYS1ZHa3F3U1BwbzNKSWRPNFJzTUpydklUNU5UNm1kdk1sTi9B?=
 =?iso-2022-jp?B?OHJ4ZmtTSWhBNGh3aEpyR0JxdFZwWmFUNS9uaW04elBxVVp1dldTQTZF?=
 =?iso-2022-jp?B?dm90Y05YOGY2SnJrM0Y4ejBCNmJiWUJIMGxCaGFnRk1BWkVXdkZCQWs0?=
 =?iso-2022-jp?B?UUorNEZyZWo4aUg5RkdiRjlXekVjZlViWktReGx0OWRTQVBjYWRUMER6?=
 =?iso-2022-jp?B?Qmp1K1lyRlhjV283UmhrbjlQVDJ0a2ROQXEwSzhIdWI2WVJ6bUJoZ1h3?=
 =?iso-2022-jp?B?SUtFTWZrZ0xLSGU4L2I2dzE1cHBxd1htSXhYdmlmd3FmdnEzbTJtQ2hp?=
 =?iso-2022-jp?B?cEUzTEczRlMyWTlVbkNFcmFEWWlpdjhZUUhJUExqMUpYREJ6d1h3UnN5?=
 =?iso-2022-jp?B?T3ovanRIZTJ0aDd0U214VjZiOURjL0NQOEdDbmJpcjMwQmpDRjJPVGVw?=
 =?iso-2022-jp?B?S01YUjJWZHZMRiswU1JpUjNHeklJYkFHM0h5MEV1TjBzVVBmUWZ5U0Ni?=
 =?iso-2022-jp?B?MEQ1TGtCdFlXMWZQeWttdmljcFlUc0lVMW4vbkR1QlE2MjB5RjIyYndm?=
 =?iso-2022-jp?B?UjBQamt2NHprb0F6VmtQR0tsRXFPMFBDU0Z5QkxXb2xRZ0RKT1lkcXdj?=
 =?iso-2022-jp?B?WURueXhmZDN0VHJLdkZjZ0Z1TW9mYS9Gb1NDdEpNa0RvcWVkdDVrWHgz?=
 =?iso-2022-jp?B?YnJaa2RSRFlERktKQjBLcjV6UDJVbUt2T2tNWS9xdGtvYVB5Y2R6QkdG?=
 =?iso-2022-jp?B?d05XMmJqWG9yTGR4SlhNeFRFUVArVDVES0lRSnJoUHNBa2ZxM2RJR1k4?=
 =?iso-2022-jp?B?UHpWbFJIbHY3eDNhOVZ4cUNROElFeG50RDVkd3EvT0g0MlBmeEhNSVZa?=
 =?iso-2022-jp?B?Z2lPa0ZxbkpzOXdlSXFpSk9QY1NSdVpVcHJkRkI5WGo1anIrR251WGdZ?=
 =?iso-2022-jp?B?aW5kalZkU2EzVk84Y0VBS1c0MmZGWWpka1ZFWTRLSXAyOHRWd0lsQUNR?=
 =?iso-2022-jp?B?TnZmMVA4SCtGQ1NGZ0szL3FuMmVNeVNYRyttdk9zRW5VcFltR2FDbW55?=
 =?iso-2022-jp?B?Q0dTeVRROFJnT1lyanBvSHIyZWFPV24rM3JnUGJ6eTlVQVRJV0QxN3h2?=
 =?iso-2022-jp?B?QmZxbUFGK2hqNzJFazBDR2IwL0F5bm05NUhObmlpQjNCL3QvSTEzRCt6?=
 =?iso-2022-jp?B?dUZKclVubUZtaTZnTGVSM3Y1aXJDejlTK1lnVkFGdVh4RXdVQ1dTSEhp?=
 =?iso-2022-jp?B?eFBSWlArRk9GTVRldUg3WWsrSW1kbHVDTUxhVVFteHhrcVpXMElLc1VV?=
 =?iso-2022-jp?B?eFo5NWN2WlJOQ0ZjZmJZMGF1Mkc4N01RbzN3djFxS1FDQi9QaTJhYjhQ?=
 =?iso-2022-jp?B?WVM1ZXNkQWc1NldLZXBHRVFDTDlFbWNxTTJHbFU1Rkx2UVFqV05ZQmc1?=
 =?iso-2022-jp?B?WHBETktaZkUra1J2RU91eDVTWFRlRysvajRSRXFPRTFTL3NURmFkaVdW?=
 =?iso-2022-jp?B?LzVrd1pNUzhjRVdwdU95Ui96NDJyekhFSnE1aXN5Vi90aXJOWWJCaVp0?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-OriginatorOrg: fujitsu.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYCPR01MB5599.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ba7fcb9-7c15-4c4b-90c9-08d93146393e
X-MS-Exchange-CrossTenant-originalarrivaltime: 17 Jun 2021 04:13:12.6871
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: a19f121d-81e1-4858-a9d8-736e267fd4c7
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: z0FsmOwoPrnRjX2Ztx6RSb29HKzv1QfCjXIT1FIugM3V4AHA84FhSaw9yMkiXjXZG15aYgUGV0+FGi/n98HLQowjOHv4ZjWivletFslsyVw=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYPR01MB6556
Content-Language: ja-JP
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable

Hi,

I would appreciate if you have any advice on this patch.

> -----Original Message-----
> From: openembedded-devel@lists.openembedded.org
> <openembedded-devel@lists.openembedded.org> On Behalf Of
> ito-yuichi@fujitsu.com
> Sent: Tuesday, June 15, 2021 9:13 AM
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] [PATCH] dovecot: add CVE-2016-4983 to allowlist
>=20
> CVE-2016-4983 affects only postinstall script on specific distribution, s=
o add
> it to allowlist.
>=20
> Signed-off-by: Yuichi Ito <ito-yuichi@fujitsu.com>
> ---
>  meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb | 3 +++
>  1 file changed, 3 insertions(+)
>=20
> diff --git a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> index 19ba2b1fc..26b4f5ee8 100644
> --- a/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> +++ b/meta-networking/recipes-support/dovecot/dovecot_2.3.14.bb
> @@ -72,3 +72,6 @@ FILES_${PN} +=3D "${libdir}/dovecot/*plugin.so
> \  FILES_${PN}-staticdev +=3D "${libdir}/dovecot/*/*.a"
>  FILES_${PN}-dev +=3D "${libdir}/dovecot/libdovecot*.so"
>  FILES_${PN}-dbg +=3D "${libdir}/dovecot/*/.debug"
> +
> +# CVE-2016-4983 affects only postinstall script on specific
> +distribution CVE_CHECK_WHITELIST +=3D "CVE-2016-4983"
> --
> 2.25.1

