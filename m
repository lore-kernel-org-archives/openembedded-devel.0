Received: from alln-iport-6.cisco.com (alln-iport-6.cisco.com [173.37.142.93])
 by mx.groups.io with SMTP id smtpd.web12.1563.1616688498601123807
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 25 Mar 2021 09:08:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=S51sFkj4;
 spf=pass (domain: cisco.com, ip: 173.37.142.93, mailfrom: dzagorui@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3846; q=dns/txt; s=iport;
  t=1616688498; x=1617898098;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=6UU15T7fdQO52TG32gLQJ5JYILDv+eUHPNEM8F6R+2g=;
  b=S51sFkj4ZmQTzRk61+qlwhxz6lRq/gcnK4JoCRbN01OkhzdPelFAHBi8
   By+0qPW4oCeCavfJMJuAjHvrm5ZlX+XapWEg82jIi3NeQ2JOhR7J860cC
   TncriGINMJre2sSXQ9s3dvmem0zXFr5VeHShfFEe+f37suUHyKXwpwkEv
   w=;
X-IPAS-Result: =?us-ascii?q?A0AhAgBVtFxgmJFdJa1aHgEBCxIMQIFFC4FTUX1aNjEKi?=
 =?us-ascii?q?AADhTmIRQOKKo8KgS6BJQNUCwEBAQ0BAR0LCgIEAQGBFgGDOQKBfAIlNAkOA?=
 =?us-ascii?q?gMBAQEDAgMBAQEBBQEBAQIBBgQUAQEBAQEBAQGGNg2GRAEBAQECAQE5BgEBD?=
 =?us-ascii?q?CsBDwIBCBECAgEBAR4QIQcJAR0IAgQOBQgVBIJPAYJVAw4hAQ6gJwKKHnWBN?=
 =?us-ascii?q?IMEAQEGgTMBg2cNC4ITCYE5gnaDeoZTJhyBSUKBVYJZPoIeQgQBgVsCg0mCK?=
 =?us-ascii?q?4JLgQ8rIjszCU4VBWQPuUxbCiGCZYlZi3KBZYVUhQWfS6BngxSUFQICAgIEB?=
 =?us-ascii?q?QIOAQEGgVQ4gVtwFYMkCUcXAg2OHxmCMYEMGYUUhUVzAjYCBgoBAQMJfIViA?=
 =?us-ascii?q?YEOAQE?=
IronPort-PHdr: A9a23:7Df7uBe7N9YtF4PKAwXj1RR3lGM/QYqcDmYuwpM6l7JDdLii9J3+P
 UvZoO9gl0LNQZ6zw/1BguvS9avnXD9I7ZWAtSUEd5pBH18AhN4NlgMtSMiCFQXgLfHsYiB7e
 aYKVFJs83yhd0QAHsH4ag7dp3Sz6XgZHRCsfQZwL/7+T4jVicn/3uuu+prVNgNPgjf1Yb57I
 Bis6wvLscxDiop5IaF3wRzM8RN1
IronPort-HdrOrdr: A9a23:1+SYMqwvIq8pp47A8WfxKrPxXe8kLtp033Aq2lEZdDV8Sebdv9
 yynfgdyB//gCsQXnZlotybJKycWxrnlKJdybI6eZOvRhPvtmftFoFt6oP+3ybtcheRysd07o
 0lSaR3DbTLYmRSpczx7BCkV/Mpx9ea+K6l7N2usEtFZysCUdAG0y5SDAGHHkpqACxPApQkHJ
 SRj/A32QaIU3IRc8i9Gz05RODFvdLGj9bLZhQBCh4h5mC1/HKVwZT9FAWV2QpbbiNXzd4ZgC
 b4uiHaxoHmifG0zRfAy3Tehq43pPLNwsZObfb88fQ9BS7rjm+TFeFccp2E+As4ueS+rGst+e
 O83ysIG+RWxzfvcnquoR3rsjOQkAoGz3P501eXjT/CjKXCNUgHIvFMj45YbRfVgnBI1LoXvc
 47vBP6i7NtARzNhyj77dTTPisa63acm2YokuIYkhVkIO0jQYJRtoAW8Qd0F5oNDUvBmfgaOd
 RuF83V6bJqd0qbZRnizxBS6eGrN05DeiuucwwngIi4wjJWlHd2ww8z38oEhEoN85o7Vt1t+/
 nEGr4ArsAMcuYmKYZGQMsRS8q+DWLABTjWNniJHFjhHKYbf1rQtp/M5qkv7u3CQu1L8LIC3L
 D6FH9Iv287fEzjTeeU2odQzxzLSGKhGRPg199Z/Jo8nrHnXrLkPWmiRTkV4o6disRaJveed+
 e4OZpQDfOmB3DpA5x10wr3XIQXJmIZVMETp9YnS1ODqs/GMeTRx6vmWceWAICoPScvW2v5DH
 dGdiP0Pt984keiXWK9gBW5YQKqRmXPubZLVITK9ekaz4YAcqdWtBIOtFi/7saXbTlLsqk8el
 piMKrq+5nL/FWezCLt1SFEKxBdBkFa7PHLSHVRvzIHNEvybPIEoNWQeWdb2XOdPR9hR8bKEA
 pSzm4HvZ6fHti1/2QPGtinOmWVgz84v3SRVaoRnaWF+IP4YJ8iF40nX6ZwDA3PEBRwlW9R2T
 9+QT5BYnWaOiLliK2jgpBROfrWcMNkhhy3ZeROr2jEiEmarcYzZ3cSUjK0S/SLiQI2Szc8vC
 wrz4YvxJ673RemMy8WnfkxOlwkUhXnPJt2SCC+ILhytp+uUgdqVmuOjSGdkHgICxrX3nRXoH
 fgIy2ScezMGXxHtBljo/zX2WIxUHmBdERtbX0/lotxGQ39yypO+N7OQLav2G2MbVZH+MUhCX
 XuZDsfJR4G/aHr6DechCuCGXI6xp8nI+zaC/A5f6vO3262Qbf45p0uDrta+o1oO8vptfJOWe
 WDexWNJDe9EO8x3ReJz0xVdRVcuT0hkfny3gfi43X91HkjAeDKKFAOfcBRH/iMq2zlTe2Pyp
 N3kJY8uvaxKHz4bpqDxbvMZzBObhPVrmjedZBjlblE+aYzvqB0BZ/VTH/B02xGxgw3KIPsj1
 wFKZ4LlozpK8tqZYgfaihZ9l0mmJCGK1YqqBX/Bqs7cUs2h3HWMtuV69Pz2PYSK1zEoBG1NU
 iU8iVb8fuARSeF2LIAA687IGhdaiEHmTxf1fLHc5eVBBShdulF8lb/L2S0d6VFTrOZXboXtR
 R37riz7qCqXju93BqVuzR1IqhDqTn6BcyzBR+BAu5O/ZixP0+Wjq6j/c60i3P2RFKAGjAlrJ
 wAcVZVaMJJziQmhskw1CO5T6TsuEIrk1dE+1hc5xfQ85nj5H2eBF1MNA3Sn45fUjZSOGWZlM
 ity5ns6F3tpDxenYTZHEhefttSC8EdQ4j+ISBpM9URtteTjt0SqzUGZgwvAW46gC382O0j3a
 7R4oShZ9Hf
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,277,1610409600"; 
   d="scan'208";a="709169711"
Received: from rcdn-core-9.cisco.com ([173.37.93.145])
  by alln-iport-6.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 25 Mar 2021 16:08:17 +0000
Received: from mail.cisco.com (xbe-rcd-006.cisco.com [173.37.102.21])
	by rcdn-core-9.cisco.com (8.15.2/8.15.2) with ESMTPS id 12PG8G2j010978
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK);
	Thu, 25 Mar 2021 16:08:17 GMT
Received: from xhs-rtp-001.cisco.com (64.101.210.228) by xbe-rcd-006.cisco.com
 (173.37.102.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.2.792.3; Thu, 25 Mar 2021
 11:08:16 -0500
Received: from xhs-rtp-002.cisco.com (64.101.210.229) by xhs-rtp-001.cisco.com
 (64.101.210.228) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Thu, 25 Mar
 2021 12:08:15 -0400
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (64.101.32.56) by
 xhs-rtp-002.cisco.com (64.101.210.229) with Microsoft SMTP Server (TLS) id
 15.0.1497.2 via Frontend Transport; Thu, 25 Mar 2021 12:08:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h+29muXdwJWLIwVAoPx6eCg8o4TdyXSONncRqowCzd8JSj9k7qJXU/5WLQop9HGX97dwJbudiPlN5DZlOkhacv2VHjbqfKVAELODsCMR9nervCi13Bnscf7jUh+3plMhlIKEiH5Lq2+d8tponhZeHbrjLmgJCYCfBnRowPlLqsbx6zunMLJHWs/DIMaMliIox+CpgaPsWif12zEKytPzIZlMajkz3LWC+lRUL0IMPnlt0+KYH+qSSaLYjZxECIWSWkudqbz17z7bBnZ1ht5+JKBjsbDErPe6V9lmFdq6x1PtYi3ba3qOQNTQ9+T0dI3pEJ7jLX86J39lXP0Bfj4Ycw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j80rFltLzRDBuNGqeLsECPJX0B+yXIE1FADsN/K+YA=;
 b=clgfPjAAZnF4jAw8/0z/CNENDr1TP1kZSxdLlaxoZKkQkEQFcyQtQCn5/EhEJYCakR4kuRdbcMOFflhfkcWPkCViCaH8RDDAs9QP6byNUfXp5a/Z23UQGFMk6714R1gPTLV7noa2PZlV/9ueDrQT6OVliGWfDDao/aKrPd90/DsqoSk4ZNuJq2dRIp4xC38m/AVT+bWSAqDhu2d7CvZed0k6mquyesY5jMFYHp0ySxPe4kbU7UKsp+a9pD6lxAgePnQEAdds2sGTQ9RAEpKexSc6/fAdS5eogzAD0Jy9YFvpI8P4MdkKytDS6YGV9Ps/ahFGmVyUtEktgLmX+xbNjg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+j80rFltLzRDBuNGqeLsECPJX0B+yXIE1FADsN/K+YA=;
 b=YFn89iJKI5MZZkz4iCKzAZBXQbsz70eS1CtQytMWigUJ1OAt46wW8K83iL1YBOBXjBkVGV4VCjhKPaooyYjKwlDWyrCxJQvVO9q/wDL8Q4LOX6txy0/5C8xioK0hwDAgQ9YWAAhVNFMol/nXB8jhb5711j8+qwqOHDsiBotX1Is=
Received: from BY5PR11MB4024.namprd11.prod.outlook.com (2603:10b6:a03:192::24)
 by BYAPR11MB3464.namprd11.prod.outlook.com (2603:10b6:a03:7d::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Thu, 25 Mar
 2021 16:08:14 +0000
Received: from BY5PR11MB4024.namprd11.prod.outlook.com
 ([fe80::6505:b3:4118:8336]) by BY5PR11MB4024.namprd11.prod.outlook.com
 ([fe80::6505:b3:4118:8336%4]) with mapi id 15.20.3955.027; Thu, 25 Mar 2021
 16:08:14 +0000
From: "Denys Zagorui -X (dzagorui - GLOBALLOGIC INC@Cisco)" <dzagorui@cisco.com>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [oe] [meta-oe][PATCH] bpftool: remove recipe from blacklist
Thread-Topic: [oe] [meta-oe][PATCH] bpftool: remove recipe from blacklist
Thread-Index: AQHXIY/vZiW5kfiR8E+0foohXoXprqqU3VzV
Date: Thu, 25 Mar 2021 16:08:14 +0000
Message-ID: <BY5PR11MB40243AA343BF104914E2DD24D9629@BY5PR11MB4024.namprd11.prod.outlook.com>
References: <20210325155401.37285-1-dzagorui@cisco.com>,<CAMKF1srwLM6vDDe5G30WjgbW7PNnjNJAmquq4fxhbMBxHYR9RQ@mail.gmail.com>
In-Reply-To: <CAMKF1srwLM6vDDe5G30WjgbW7PNnjNJAmquq4fxhbMBxHYR9RQ@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: gmail.com; dkim=none (message not signed)
 header.d=none;gmail.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.9]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: faec91ee-b9b0-4dfd-63b0-08d8efa83223
x-ms-traffictypediagnostic: BYAPR11MB3464:
x-microsoft-antispam-prvs: <BYAPR11MB34642AA77AB7EA1BC49F492BD9629@BYAPR11MB3464.namprd11.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:595;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 3eRezKZBEbznzoaF4Cx7h6LQ13a2OUAKpvAsfqXDZoGDo6sqbAhTXCZWC9Q93Wfm4yo2gBz3pf6UL4i412bZyZj3TZpqdBCmM2ZjkLMy043+eEa+02dPpO4F+c6g2hLu9xs3Pc3g5T8K282thj9eT4UTBD0uNbVmpEHpNdtruFZ0hbBxhv0gLnrvnIAVahYizqZYeowNlyZRGi/2kxDIksKxFBGxr52LjafLAfxIQkHD/B/vUcQeQvp4sqtSNvyzLn7RoNAADSY8lqDGW9wY86HgqqWm557Da4qtaw0fwXsMIJxb1B9q4thYIgEvXELDoEKEMyXk3jdGOBn8IXvdOaz5jAnvK3umezYj/iakdIdpoAHubDN9VV0e+tgNeoymZNYkuadbLZxqvBmj5rRxf+ZhSYFFEeYwealyFKm5QVofKHtD6CE9U1wSv6XLxx58JK4tbkFsC5lEdX/xVBI2bRL+eK4qVWSTYpFESC9qmrK3aU7t0LBtOx7UCPfFFPWXOSt/kHSnCeqrLh7ZGdQosM7f3deWOPm6t7jt/0jw72vv5r6FfrTMnXdBv5n6AsCVmj1HEW76IBo7OgR8K8+YAcw2OB2UrSHmUJ430qasRjiNP2w3m74Ivy3BFERZ0rNLYe7Elj1tgDWKnWChOSJL8j/u9JHhMI7BxMunETukSzbqTd+3uQXD6vQfLCUHh9rHlis1h9p//7qg5rTF2vE+QvmKmKmfQLvzbE7mzIoacz8=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR11MB4024.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(396003)(136003)(366004)(376002)(346002)(33656002)(478600001)(53546011)(4326008)(38100700001)(6506007)(8676002)(316002)(83380400001)(52536014)(7696005)(6916009)(71200400001)(76116006)(9686003)(186003)(55016002)(66946007)(5660300002)(91956017)(64756008)(66446008)(86362001)(26005)(66476007)(66556008)(966005)(2906002)(8936002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?pf6zH43GJTp5c3K3lQ09G0lNfWJLCmzeMCZ9fmC0poacnVPKN64Yjy4dqnV6?=
 =?us-ascii?Q?j7VsofjLp8jaBetW8b3WmBmS5m/eMAcFABDFCl3QVteFu1YNWVz+QjAW2T5i?=
 =?us-ascii?Q?VlunkB5O7iy+mB/DevzOrsKyviWtFBkU8bghYZtfBGlYiuSvIyH+tKmPKFiq?=
 =?us-ascii?Q?MRt1y5RkqhQ0+UDq5ByN/eT1mFgDWavCO1tdWRCpN8/ZDTqq3CMRm6Zch/MF?=
 =?us-ascii?Q?4jnp/CM++rAcEhxPpfbbsr2XNT9+S3xiGvw6fpUxm00+Wygu/gPYy5iffSb9?=
 =?us-ascii?Q?la24DuoBGUvtxhSik+E4jY1Z/2Gjt3UJRNTLt14W4rx7NhGNll6Mt8W4JVOc?=
 =?us-ascii?Q?rtAsCxIRR8B1vMEmU7VQQZf115aCH73fmcKTg3C5nQRFtPQ1P/gbDt+PDHSN?=
 =?us-ascii?Q?6H24Pd5r9ZzYaSDaJPrNs2bxm+xFDLX0T0WkBE9dUeFqhjhaKhD3c6LHAP1a?=
 =?us-ascii?Q?/T4MRpgq8zj+Ffqk0oq509oJ0Taf1Me1s16rl/4t+tffOQjoikPyWAQ59/hM?=
 =?us-ascii?Q?MfgWy1htxEdaOeLvOsDtdD9b4ak88etCXg/oQdRxyiVfM9ovA2tET+ZrVn/5?=
 =?us-ascii?Q?oPQvE8q4DVfMZGk2gs/ZbIGtw6kEcJFA9c6f27njflkar1xyRp/cr9C1rHrA?=
 =?us-ascii?Q?MWa0QK9Kds6YSzVZ1WnkdMi8+zelmTpuYHeeR8kSOSWLpwAz0Qbc+THrhYS6?=
 =?us-ascii?Q?CwgWDObPgEDtCtbhMUe/+HlQ5p93u3AJexLeyuDwkNkNy3QzdwflAd0AeAqo?=
 =?us-ascii?Q?PQhoySizYNsi96xsQPG4HcOn5fXyNdqxVO9Yh8+FWBSUn0veiEKK+6hku4gx?=
 =?us-ascii?Q?zaFh9gGVWhayVIFZ1UiCsYiiI0hMxVF7purWrGpMjECgof0/qEuvljQ05QXs?=
 =?us-ascii?Q?mB1iGUYwtWa519ZOX81EGunnGSa7xtdEXBHNvyDOpXZvdtO0poL5usqZcXRy?=
 =?us-ascii?Q?Hc3JTr2RESaJRbhVc3ntuaLwQmtUwZk947EnFPb5CszoDUmG+ekhyWFos1Dq?=
 =?us-ascii?Q?VgjYQ3W4NBjM2wNfEBUMfR0d1dST4fweTmwN6DtdvpTfPU3q8crAHEv6CVn4?=
 =?us-ascii?Q?f/o1OWxX91KFU/iDvZBrBuTWIzbAT2NVMEi5QnQcZYH3snJ7jGJJSVnH6Nyk?=
 =?us-ascii?Q?8vjnq36Kwb65L31bVk1Fx4Trfz91V3BTo40z9zbM0CYt2SQwohVe9W9Sa3YT?=
 =?us-ascii?Q?H5f31G5z4EOi8aFmSG8g4b0Q43OAFGeSVj2D2Bra6iuTVpDXDuNI9xCKlnbX?=
 =?us-ascii?Q?zL71NPNbUfWtQyawfX2ynsEFGj5tJ5k+srtQgtZc4BkJHvxjX1u4BL6y3y+W?=
 =?us-ascii?Q?JrM=3D?=
x-ms-exchange-transport-forked: True
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR11MB4024.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: faec91ee-b9b0-4dfd-63b0-08d8efa83223
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Mar 2021 16:08:14.5870
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: xxpjTlTtfrzRAVMmyQiHLEwCRNjC/KuEF2D/kH4eDR+P3IGLLAazF/Pcfekk4njla/3SrCe5L6xfYppBl6ztuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR11MB3464
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.21, xbe-rcd-006.cisco.com
X-Outbound-Node: rcdn-core-9.cisco.com
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

> >  RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch =3D "makedumpfile=
"
> >  RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 =3D "crash"
> > diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recip=
es-kernel/bpftool/bpftool.bb
> > index 1758430bc..e58bdd493 100644
> > --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> > @@ -32,4 +32,3 @@ python do_package_prepend() {
> >  }
> >
> >  B =3D "${WORKDIR}/${BPN}-${PV}"
> > -PNBLACKLIST[bpftool] ?=3D "Needs forward porting to kernel 5.2+"
>
> will it work on all architectures ? I wonder if its better to add
> compatible hosts that you plan to maintain.

I only tried on x86-64. Yes, i see, it is better to add only compatible ar=
ch

________________________________________
From: Khem Raj <raj.khem@gmail.com>
Sent: 25 March 2021 17:59
To: Denys Zagorui -X (dzagorui - GLOBALLOGIC INC at Cisco)
Cc: openembeded-devel
Subject: Re: [oe] [meta-oe][PATCH] bpftool: remove recipe from blacklist

On Thu, Mar 25, 2021 at 8:54 AM Denys Zagorui -X (dzagorui -
GLOBALLOGIC INC@Cisco) via lists.openembedded.org
<dzagorui=3Dcisco.com@lists.openembedded.org> wrote:
>
> Have not seen build issues for 5.4 and 5.10
> kernels so allow to build it
>
> Signed-off-by: Denys Zagorui <dzagorui@cisco.com>
> ---
>  meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb | 3 ++-
>  meta-oe/recipes-kernel/bpftool/bpftool.bb                  | 1 -
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb =
b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> index c717d45e5..eb3d51c62 100644
> --- a/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> +++ b/meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb
> @@ -597,6 +597,7 @@ RDEPENDS_packagegroup-meta-oe-graphics_remove_libc-m=
usl =3D "renderdoc"
>
>  RDEPENDS_packagegroup-meta-oe-kernel =3D"\
>      agent-proxy \
> +    bpftool \
>      crash \
>      cpupower \
>      ipmitool \
> @@ -613,7 +614,7 @@ RDEPENDS_packagegroup-meta-oe-kernel_append_poerpc64=
 =3D " libpfm4"
>
>  # Kernel-selftest does not build with 5.8 and its exluded from build to=
o so until its fixed remove it
>  RDEPENDS_packagegroup-meta-oe-kernel_remove =3D "kernel-selftest"
> -RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl =3D "crash intel-=
speed-select kernel-selftest minicoredumper turbostat"
> +RDEPENDS_packagegroup-meta-oe-kernel_remove_libc-musl =3D "bpftool cras=
h intel-speed-select kernel-selftest minicoredumper turbostat"
>
>  RDEPENDS_packagegroup-meta-oe-kernel_remove_mipsarch =3D "makedumpfile"
>  RDEPENDS_packagegroup-meta-oe-kernel_remove_mips64 =3D "crash"
> diff --git a/meta-oe/recipes-kernel/bpftool/bpftool.bb b/meta-oe/recipes=
-kernel/bpftool/bpftool.bb
> index 1758430bc..e58bdd493 100644
> --- a/meta-oe/recipes-kernel/bpftool/bpftool.bb
> +++ b/meta-oe/recipes-kernel/bpftool/bpftool.bb
> @@ -32,4 +32,3 @@ python do_package_prepend() {
>  }
>
>  B =3D "${WORKDIR}/${BPN}-${PV}"
> -PNBLACKLIST[bpftool] ?=3D "Needs forward porting to kernel 5.2+"

will it work on all architectures ? I wonder if its better to add
compatible hosts that you plan to maintain.

> --
> 2.26.2.Cisco
>
>
>=20
>
