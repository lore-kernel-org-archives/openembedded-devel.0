Received: from alln-iport-1.cisco.com (alln-iport-1.cisco.com [173.37.142.88])
 by mx.groups.io with SMTP id smtpd.web08.2770.1616574224904441625
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 01:23:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=jUF88XlY;
 spf=pass (domain: cisco.com, ip: 173.37.142.88, mailfrom: oobitots@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=3044; q=dns/txt; s=iport;
  t=1616574225; x=1617783825;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=Ixl7LtgzoteI06d7evTIVSH705AoQSA2/pUUmgqGWgY=;
  b=jUF88XlYxJMi1T4pZozX7qO/w9u7Ex/Lv1I/GDosLWzqh9gdM0dbQzrr
   5THlUOEOSVOUYUBCx+jn4zW5DZa7WZOk8TBuToanb23vPU5xbExA6tSwv
   Jj98r0AR9YBJXZ4ojK8wSMcZK2n/H1SAIGYURTNC1q7bq2P8AvWR+oCLQ
   w=;
X-IPAS-Result: =?us-ascii?q?A0AnAACj9lpgmIoNJK1aHAEBAQEBAQcBARIBAQQEAQFAg?=
 =?us-ascii?q?T0GAQELAYFSUX1aNjEKiAADhTmHV2sDgQmYK4EugSUDVAsBAQENAQEdDQgCB?=
 =?us-ascii?q?AEBgRYBgzkCgXsCJTUIDgIDAQEBAwIDAQEBAQUBAQECAQYEFAEBAQEBAQEBh?=
 =?us-ascii?q?jYNhkQBAQEEATkGAQEJAS0BDwIBCBEEAQEfECgKHQgCBAENBQiCaAGCVQMvA?=
 =?us-ascii?q?Q6gGQKKHnWBNIMEAQEGgQYBLAGDZxiCEwmBOQGCdYpNJhyCC4ESQ4IkNT6CY?=
 =?us-ascii?q?AICgVwCg0mCK4JLbwwTLHsgKTgBBQEBCJxwnhkKIYJliViLcIc4g0eBPIkul?=
 =?us-ascii?q?hYtlFiJXYIDkk6EUwIEAgQFAg4BAQaBVgE1gVtwFYMkCUcXAg2OHw0MCYNNh?=
 =?us-ascii?q?RSFRXMCNgIGCgEBAwl8hjIBgQ4BAQ?=
IronPort-PHdr: A9a23:dPP8xxFhQdw/KxDb7wx+PZ1Gft4Y04WcBSYc94YnhrRSc6+q45XlO
 gnF6O5wiEPSNa3R7/tIhq/Zqaf9QSoL5pPS+HwBcZkZURgDhI1WmgE7G8eKBAX9K+KidC01G
 slOFToHt3G2OERYAoDyMlvVpHDh5zobFhi6OhByO/yzEYnX3Iy70umo8MjVZANFzDO2fbJ1K
 kCwqgPc/skbiIdvMOA/0BzM93BJYO9Rg2hvIAH7og==
IronPort-HdrOrdr: A9a23:chh4EKGRkmWGlpPHpLqFmZXXdLJzesId70hD6mlYcjYQWtCEls
 yogfQQ3QL1jjFUY307hdWcIsC7IE/03aVepa0cJ62rUgWjgmunK4l+8ZDvqgePJwTXzcQY76
 tpdsFFZ+HYJVJxgd/mpCyxFNg9yNeKmZrY+tv25V0Fd3AMV4hL6QBlBgGHVmh/QwdbDZQ0fa
 DsmPZvjTymZHgRc4CHHXEDRefOvJnmk5jhbB4ACXccmUizpBmv76P3FAXd4wcGX1p0sPkf2E
 Xmsyi83KWstPmn1gTRvlWy0716kMbso+Ezf/CkpdMSLlzX+2OVTaRnH4aPpTUk5NyogWxa7O
 XkhzcFE4BN52jKfmezyCGdmzXI9Do18XftxRu5rBLY0LbEbQk3AcZAmo5VGyGxgyFL0b0Ms9
 Mo40uju5VaFh/GlijmjuK4Ki1CrFa+onYpjIco/hpieLYec7NYoMg++05YAf47bVrHwb0nC+
 VnAYXg4u9XezqhHgnkl1RoqebcOkgbL1OjeAwvq8aV2z9ZkDRS1E0D3vESmX8G6dYUV4REz/
 6sCNUqqJh+CustKY5tDuYIRsW6TkbXRwjXDW6UKVP7UIkaJnP2rYLt6rld3pDpRLU4iL8J3L
 jRWlJRsmA/P2j0D9eV4ZFN+hfRBEKwQCrq0cMbw5RioLXzSP7KPES4ORUTuvrlh89aLtzQWv
 61Np4TKeTkN3HSFYFA2BC7VIJVLXUYTc0Jqtc2U1+DuavwW8rXn92eVMyWCKvmED4iVG+6KG
 AERiLPKMJJ6V3uWnKQummWZ1rdPmjEub5gGqnT+OYejKIXMJdXjwQTgVOlosWCKThItL0qbF
 JzSYmXy5+TlC2TxyLl/m9pMh1SAgJ++7P7SU5HogcMLgfzarYMu9KWfGhIx3uZLhpjT8fbeT
 Qv42hfyOaSFdi91CoiA9WoPiaxlH0Ivk+HSJ8ah+me/8v/Y4g5CZwnQaR1Eg3OG3VO6F5XgV
 YGTDVBal7UFzvoh6ngsYcdA/vHccJgxC2xJ9RPlH7ZvUKAhM0mS3cBRQSyWcqPjQtGfUsOun
 RBt4skxJuJg3KGNHY2iuVQCiw8VE2nRJZ9SDmjSKoRsLbxYw10RXqNnlWh+mEOU1uv0V4TiG
 znJTCTYtfRDDNmyypl+5ev1k9ofWOAeE81TXZ2veRGZDj7k0c29/OXbayu1GbUUH8++6U2NT
 HIZiZ6GHIy+/m+yAOVlDGeFX8v25UpOajHAK4+dqzIs0ndW7GghOUIGeRZ841iM82ruugXUf
 iHcwvQNz/gDfg1sjbl6koNKW1xqHM+l+nv1wCg5G+k3GQnCf66GiUte5gLZ9Wd5XPjXfCGzd
 Fwis80p/K5NiH0ZsSdwa/aKz5FJRW7mx/6c8g47ZRVt7k1rr19At3SVibJzmhO2FEmN9jv/X
 luNphT8fTEIMtibsYScyVW8h4gk8mONlIitkjzDvUldV8ggnfHN7qykvX1gKtqBlfEqBr7OF
 GZ/SEY5fvDUieZ3bMRCq47Iw1tGQMBwWUn+PnHe5zbCQ2see0G4UGzNWWldqRBDKeCArcdo3
 9Bkpi1tv7SczC93g/evTF2eP0Tt2mmRN6/GwKKF6pD9cegNVGFn6ut54qygV7MOE+GQlVdgZ
 cAc0oaKtlHgH0lioY81yCpUKz5ok4/iTJlkHlav0+o3pLj+XvRGEFNLBbQjZpXVyRCK3Tgt7
 WxzcGIkHDmpCVf0ZbNFE1MbshDFtgZQI/wNTpvI6ErzcmV1rtqhD9CbhcoB3M9jz643/oO58
 bK5Mnv
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-AV: E=Sophos;i="5.81,274,1610409600"; 
   d="scan'208";a="665421199"
Received: from alln-core-5.cisco.com ([173.36.13.138])
  by alln-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 24 Mar 2021 08:23:21 +0000
Received: from mail.cisco.com (xbe-rcd-005.cisco.com [173.37.102.20])
	by alln-core-5.cisco.com (8.15.2/8.15.2) with ESMTPS id 12O8NLwu018727
	(version=TLSv1.2 cipher=AES256-SHA bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 08:23:21 GMT
Received: from xfe-rcd-001.cisco.com (173.37.227.249) by xbe-rcd-005.cisco.com
 (173.37.102.20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Wed, 24 Mar 2021
 03:23:20 -0500
Received: from xfe-rcd-004.cisco.com (173.37.227.252) by xfe-rcd-001.cisco.com
 (173.37.227.249) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3; Wed, 24 Mar 2021
 03:23:20 -0500
Received: from NAM02-BL2-obe.outbound.protection.outlook.com (72.163.14.9) by
 xfe-rcd-004.cisco.com (173.37.227.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.792.3
 via Frontend Transport; Wed, 24 Mar 2021 03:23:20 -0500
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JQkrWS9YS/7cx5fuz2D+hXhUPpJFxDLvFGiJM/JMe1ngOyX9aZYiZv6g4fu9COxiIw8ITtBP6Bll4Pv0RKj/lxYgSpmj+v79Dyqy91KZi3O4kfo1+eWGjBNupYwsHIdevWlY3V/M4Tjj8xM5mjUrFHKZ0c/4LWtADVQxdtxrP38A4451QjBKfmcKGeONFz68RpJLBvg9FnwzV9BcAETn9j6ra3Z4S2RpFRR8ycUZWNj3uJEifeR2cIf6XCCbpTv155gqzxrneY/KTJBkC9YzF36l916huqksymxt4GRHeTPpGX5YD/IYoS1WFTPyBbxR6IaSl8Gciz/NocC9FZMDNw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2/aQVof8rZAMsRnQPFcVjJv2mgHwNaoiEfcSySpOI8=;
 b=RwFGkh4EDam0gqYXVXM9r6Jzyup/P/WRD8T2HrN+VZ09ZzEBKtDR2RAv1aFB2726TJ1tWMOjY7n8JzUK5WbelDqk/DDkpsG5pOCnJyAI6lk2E5vmKfR5hD2jNFyfnTpAtZgEanhj98x3+a3b2iJd9ZvmK6om6lldUx+v9DVHrhruxo7mT0MNVV3bCGileLaS8aEKXzgOOJVzPMnuEbaBiSTzY54/Cdnq+Qj4j2CCXvw5O+uYp4fk9mPWgQpv1uLwbpnavSeMxHHoluqy7yMND02Z5ZfhCWe+MZBxqL2jk7bo+nb1XEhPNrNY2tR+MV2mbKXy0Gxe5GBdUt6Aq74hJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.onmicrosoft.com;
 s=selector2-cisco-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=v2/aQVof8rZAMsRnQPFcVjJv2mgHwNaoiEfcSySpOI8=;
 b=Q82AWqB1Ejy34SchoR9xaScA417I0kvsRsD9fpBDwqC8cpYASJRvZNRJo/xcDLrDAmGTv+YU5IV57EC2XX+dOdyJ+VuWGSjVUqn67t7pC8N9VEtFF5w0JuJt8fze20e5J5cdX7fYnGqjQlp7n/X1vcmUKTPW9/jN/F7qpUmO3lo=
Received: from PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5)
 by PH0PR11MB5126.namprd11.prod.outlook.com (2603:10b6:510:3a::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3977.25; Wed, 24 Mar
 2021 08:23:18 +0000
Received: from PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::710a:816:d2a7:baf5]) by PH0PR11MB4902.namprd11.prod.outlook.com
 ([fe80::710a:816:d2a7:baf5%7]) with mapi id 15.20.3977.025; Wed, 24 Mar 2021
 08:23:18 +0000
From: "Oleksiy Obitotskyy" <oobitots@cisco.com>
To: Yann Dirson <yann.dirson@blade-group.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: Yann Dirson <yann@blade-group.com>
Subject: Re: [oe] [meta-oe][patch] mpv: remove explicit LICENSE_FLAGS
Thread-Topic: [oe] [meta-oe][patch] mpv: remove explicit LICENSE_FLAGS
Thread-Index: AQHXIAeZmnvRfSsTe0uousvWKYH58qqSzXx4
Date: Wed, 24 Mar 2021 08:23:18 +0000
Message-ID: <PH0PR11MB4902C7290C76EC692025A1D9D7639@PH0PR11MB4902.namprd11.prod.outlook.com>
References: <20210323171107.812146-1-yann@blade-group.com>
In-Reply-To: <20210323171107.812146-1-yann@blade-group.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: blade-group.com; dkim=none (message not signed)
 header.d=none;blade-group.com; dmarc=none action=none header.from=cisco.com;
x-originating-ip: [173.38.209.7]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 2aaee9d0-f33e-4666-7a58-08d8ee9e147c
x-ms-traffictypediagnostic: PH0PR11MB5126:
x-microsoft-antispam-prvs: <PH0PR11MB5126C56641610F8A6D7AD15FD7639@PH0PR11MB5126.namprd11.prod.outlook.com>
x-ms-exchange-transport-forked: True
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: E9S9PsUnu6Gjr2HKuB7tjoQAVoFWp3vTpytds1mINjyPGIBEwddTobwshsqgdGrWmjeDcFqQdHk2BPhaZcLxidEmah9f/wk4Ro56tvYgIygORP9vFB8eFKgqFAYlCkhY0l4HeC58qYUz1ZzBZvBa5fRI42hQNAesEO5w6mHLFi9HcS50wCs4S9qHYxVVzjhCvYhpZ6mc+bFf5sazrPU0eaJaOpyCdpT96Fdw0FzH4hf0ytq+BZvLwGXCtZFnEBycrDUpONLP+vP+G6vvG7VFCf1sIuEdRMZySwSKjCcSlHbRKw239h7qNlTC7EWvuG4s6XUr58vhXSkNQRaJr8xB71gOI9aj+DHofZutSG0yp57mDb7jmiIa3t/sWDGDgy58Ehf9k4W4zrnQGKyQCfhsTfxsZ/qPA0nTYQKfCh986+G2MmPEa6Fdce9r+UUKaY+50WtvVuUYL3Wbdd2W1+pf4eUecgxFn7WswcAJh+N9XVJnDomT2aDIrjZTpaq7BxPs2ljAEkFXfHgzErAJRX8NBICfCDFYrPp9MnA2CRtjlaqHiTKE5rnqToIVPD0Iy4KwqFPoE48QRgGMkUOhHhJC04Z2zzaiJsCMts+GctnvVpUA4W9Nptj3xNoBYk6Pc3ahfl0JJUhhliayuBNLbC+hVvmqadevO50ua2m8QGu9Zyzj0rKCiP+apRWE7aBDgNhW4D1EQ8WEFNK4zESTXzr/J+TnQ6dufxlDAoD/iXlsm0ixG1pZiYZ8ZaYHFqvluIo7
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR11MB4902.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(39860400002)(346002)(136003)(366004)(396003)(376002)(83380400001)(4326008)(9686003)(55016002)(8676002)(8936002)(107886003)(86362001)(186003)(71200400001)(26005)(52536014)(66476007)(66946007)(66556008)(110136005)(66446008)(7696005)(5660300002)(91956017)(76116006)(38100700001)(316002)(2906002)(478600001)(966005)(64756008)(53546011)(6506007)(33656002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?O4VHxivETvoR6h79vIR5+T/e0vtE4uu5D8VDDUjcTMi2d7zWMYj/bF8jN++e?=
 =?us-ascii?Q?vrP1Nap0OMYSMfcv1femC9GE95eXdoN3sHQPoQDAxRioRno0Ifc37YMQ7yO0?=
 =?us-ascii?Q?P0KfC/h6QcBBRt08yKI/mhlLQdLocGAsSVySDEPsFWTelj8Bptnf5BxmYnLN?=
 =?us-ascii?Q?OH7ei3u9DQoieZH6ZWmFrtA6OAUB7HRA/BBSnD43/4ZC0Ys4mAVJ9emVnean?=
 =?us-ascii?Q?p7bZIONWsXwByY5tth54NtgfcB/OP/DEmtWFbzqfucq92jzoPDFxC2wj+Yd7?=
 =?us-ascii?Q?gAJJltvHOou7nIgifwebbc/ifBlJj95r2ZbK7CjLDVtf9n0Da5jq1Tq0UV4b?=
 =?us-ascii?Q?gFacoAXfwUAiaMfBZIYsoigsrMgIMbTjATr+QD/PTcH4OKoxkc6ZY5bNhyKc?=
 =?us-ascii?Q?pJClda9tOyqTocHHv4Z98S7qsUxlxVA1maML64wEMkmiN2/R5U+byeb/NXUM?=
 =?us-ascii?Q?u6uLNpEqL51VEdLoBI1jZMSCEsKz3TYhIRDZejBrypMxqh/vL+J2gt3sgi4S?=
 =?us-ascii?Q?NvVv4Db/3x0miRhTdggsReOD5DxcQsZ9NPIKr9N6CqvDAzosyf8+Qe5kBkYU?=
 =?us-ascii?Q?8TTLVdKnu7KHfmWQfYa/VoE6gzBZEjy4503+DLy1VGrWSskPgCYHWJt/OT7d?=
 =?us-ascii?Q?xWlQUbCGqhhg9PUMyFWKLmVd7k+8C14bPtsGshwzFkTCuQlc0bidpX0R9JAb?=
 =?us-ascii?Q?SzZr3D5rhQaluxl0/99J3PDOaEnaNlwvBFY4W3TTq0xXh4Xx6PxvjNWAvuFJ?=
 =?us-ascii?Q?91LxNUnXt2fT/4rhylGQoQ0GiCNhSDJRyqpg7BjDxeBCsBuDd1TlV3teWuep?=
 =?us-ascii?Q?/SYjM+hJpX118byvOqZSc9ulYq7NkOmBJTmqivlu0AiJ5Jyza8pFX7JKs/4D?=
 =?us-ascii?Q?UPvbZsCkUysrFff5PyW+kOUR5J/Aw3oIm8WiHYKzXnBfS3jTqsaiOaV46HdL?=
 =?us-ascii?Q?fmap+FEE1a1zUATX4UOdarEVeqDsZfpiDAul0dTDnJW1nh9cWezq2EqT2H5w?=
 =?us-ascii?Q?kLD/Z4LhRFBnwLQtlzPL9U6sDK8oR/urqTT+zKccr0e2DwFJgbQHTXvvTEk7?=
 =?us-ascii?Q?qzLT1jeKpOn/+LdT7cyBghVfFdd3SvRQC7Z3PQuV3NTNK77qjfAAEoFHCqyu?=
 =?us-ascii?Q?1Y9h20NHCYSnEQ9kq1iOQLwzQPlmfGX5pMG9pWUQ0ceehay/RSDOrSMlqJ2x?=
 =?us-ascii?Q?GUx1+ECHSDa8+6C59W/xgIcjNnJqUiBUvZ6mR2mVU5w7jzGaBDXXxtHmiWOw?=
 =?us-ascii?Q?/3RtvrIQJEe2kwIaYkLvouAq27Ue7DMvWRUxqf+UEppmwdsHMx1bBpP7t9dl?=
 =?us-ascii?Q?TeE=3D?=
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR11MB4902.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2aaee9d0-f33e-4666-7a58-08d8ee9e147c
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Mar 2021 08:23:18.7934
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4fddnl18k/uOAqzn8vB3g30jmFfuF7ZcMx6dD016lKzM9sL5zAtdd+oo8IyUzUuEpKUaneRM4fP0RC33MKQ/Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB5126
X-OriginatorOrg: cisco.com
X-Outbound-SMTP-Client: 173.37.102.20, xbe-rcd-005.cisco.com
X-Outbound-Node: alln-core-5.cisco.com
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Could you please look into https://autobuilder.yoctoproject.org/typhoon/#/b=
uilders/88/builds/1071/steps/12/logs/stdio

NOTE: Resolving any missing task queue dependencies
ERROR: Nothing PROVIDES 'ffmpeg' (but /home/pokybuild/yocto-worker/meta-oe/=
build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb DE=
PENDS on or otherwise requires it)
ffmpeg was skipped: because it has a restricted license 'commercial'. Which=
 is not whitelisted in LICENSE_FLAGS_WHITELIST
NOTE: Multiple providers are available for runtime ssh (dropbear, openssh)
Consider defining a PREFERRED_RPROVIDER entry to match ssh
ERROR: Nothing RPROVIDES 'mpv' (but /home/pokybuild/yocto-worker/meta-oe/bu=
ild/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb RDEP=
ENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'mpv'
NOTE: Runtime target 'mpv' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mpv']
ERROR: Nothing RPROVIDES 'mpv-dev' (but /home/pokybuild/yocto-worker/meta-o=
e/build/meta-openembedded/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb =
RDEPENDS on or otherwise requires it)
No eligible RPROVIDERs exist for 'mpv-dev'
NOTE: Runtime target 'mpv-dev' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['mpv-dev']

Regards,
Oleksiy

________________________________________
From: openembedded-devel@lists.openembedded.org <openembedded-devel@lists.o=
penembedded.org> on behalf of Yann Dirson <yann.dirson@blade-group.com>
Sent: Tuesday, March 23, 2021 19:11
To: openembedded-devel@lists.openembedded.org
Cc: Yann Dirson
Subject: [oe] [meta-oe][patch] mpv: remove explicit LICENSE_FLAGS

From: Yann Dirson <yann@blade-group.com>

This flag does not describe the mpv package, but ffmpeg instead.
It gets in the way of using finer-grained LICENSE_FLAGS in ffmpeg.

It is above all not needed, the real problem is even more clear without it:

 ffmpeg was skipped: because it has a restricted license 'commercial'. Whic=
h is not whitelisted i  LICENSE_FLAGS_WHITELIST
 ERROR: Required build target 'mpv' has no buildable providers.
 Missing or unbuildable dependency chain was: ['mpv', 'ffmpeg']

Signed-off-by: Yann Dirson <yann@blade-group.com>
---
 meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb b/meta-oe/rec=
ipes-multimedia/mplayer/mpv_0.32.0.bb
index e04925d0f..6a3fd9715 100644
--- a/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
+++ b/meta-oe/recipes-multimedia/mplayer/mpv_0.32.0.bb
@@ -12,9 +12,6 @@ DEPENDS +=3D " \
 LICENSE =3D "GPLv2+"
 LIC_FILES_CHKSUM =3D "file://LICENSE.GPL;md5=3D91f1cb870c1cc2d31351a4d2595=
441cb"

-# While this item does not require it, it depends on ffmpeg which does
-LICENSE_FLAGS =3D "commercial"
-
 SRCREV_mpv =3D "70b991749df389bcc0a4e145b5687233a03b4ed7"
 SRC_URI =3D " \
     git://github.com/mpv-player/mpv;name=3Dmpv \
--
2.30.2

