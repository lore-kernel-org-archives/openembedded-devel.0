Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69830EE49A0
	for <webhook@archiver.kernel.org>; Wed, 23 Aug 2023 10:48:46 +0000 (UTC)
Received: from alln-iport-8.cisco.com (alln-iport-8.cisco.com [173.37.142.95])
 by mx.groups.io with SMTP id smtpd.web11.8565.1692787723776327445
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Aug 2023 03:48:44 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: message contains an insecure body length tag" header.i=@cisco.com header.s=iport header.b=kIGpVZ4W;
 dkim=pass header.i=@cisco.com header.s=selector1 header.b=KRTS32lf;
 spf=pass (domain: cisco.com, ip: 173.37.142.95, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=2828; q=dns/txt; s=iport;
  t=1692787723; x=1693997323;
  h=from:to:subject:date:message-id:mime-version;
  bh=+G6Rl0tgb9j6P8L5o/N7w4mdDyUQdR8QzeV3nsKplSU=;
  b=kIGpVZ4Wo5b2v4i0fQVxacpQbutSdM9m1r/EO5SF86zl6fQiVloAeD7j
   yEORoy/YvelCOiqkgWl9ysnAfOWq6GDosiLAmayhLKyIyqtWwibnVdi0d
   MHMrAU2sap4ethlYbcD17TMRuyeuMxYPuaSfs765Iuwbru9lNtGSxRnAs
   M=;
X-IPAS-Result: =?us-ascii?q?A0BIBQAd4+VkmIYNJK1agQklgSqBMDFSdAJZKhJHiB0Dh?=
 =?us-ascii?q?S2gEUSGC4ElA1YPAQEBDQEBRAQBAYISgnQChmUCJTQJDgECAgIBAQEBAwIDA?=
 =?us-ascii?q?QEBAQEBAwEBBQEBAQIBBwQUAQEBAQEBAQEeGQUOECeFaAEMhh0bEwEBOBEBD?=
 =?us-ascii?q?CAbORQLBwEEEwgaglwBghZIAwGeWQGBQAKKJniBNIEBggkBAQYEBbJsCYFDi?=
 =?us-ascii?q?AIBgUqIMCcbQIFNgViGCAKBYjSDXoIuiWGUIiqBCAhfgW49Ag1UCwtjgRWCR?=
 =?us-ascii?q?wICEToTSnEbAwcDgQIQKwcEMiIGCRctJQZRBC0kCRMSQASDRAqBAz8RDhGCS?=
 =?us-ascii?q?2E4GUuCZgkVBjtOeBAuBBQYgQwIdB8VHjcREhkNAwh7HQI0PAMFAwQ2ChUNC?=
 =?us-ascii?q?yEFFEMDSAZLCwMCHAUDAwSBNANEHUADC209NRQbBQSBPwWeSAqBCagSox8KJ?=
 =?us-ascii?q?4NkoTkXqVwSQ4VPNpFQIKd6AgQCBAUCDgEBBoFjOoFbcBWCVgEBSlIZD445g?=
 =?us-ascii?q?1uPeXY7AgcLAQEDCYtIAQE?=
IronPort-PHdr: A9a23:VlDGCBwcXgaBMJ3XCzMRngc9DxPP853uNQITr50/hK0LKeKo/o/pO
 wrU4vA+xFPKXICO8/tfkKKWqKHvX2Uc/IyM+G4Pap1CVhIJyI0WkgUsDdTDCBjTJ//xZCt8F
 8NHBxd+53/uCUFOA47lYkHK5Hi77DocABL6YBF+JuXpAInep8+2zOu1vZbUZlYAiD+0e7gnN
 Byttk2RrpwPnIJ4I6Atyx3E6ndJYLFQwmVlZBqfyh39/cy3upVk9kxt
IronPort-Data: A9a23:SnD6O64KjbSJ3YvvKzo18AxRtCbHchMFZxGqfqrLsTDasY5as4F+v
 mRKW2jSbP2CZDeneNB2YYnn8BxVvcDSzoU2HAQ6pC82Zn8b8sCt6fZ1gavT04J+CuWZESqLO
 u1HMoGowPgcFyOa/lH3WlTYhSEUOZugHtIQM8aafHgoLeNYYH1500k7y7Ri2tcAbeWRWmthh
 /uj+6UzB3f9s9JEGjp8B3Wr8U4HUFza4Vv0j3RmDRx5lAa2e0o9UPrzEZqMw07QGeG4KAIVq
 9Hrl9lV9kuBl/sk50jMfrzTKiXmSZaKVeSCZ+Y/t6WK2nB/SiIOPqkTLtcOaR1lpxqwgsl49
 NN9kMToZBk4IfiZ8Agde0Ew/yBWNKlC/vrMJmKy9JXJiUbHaHDrhf5pCSnaP6VBpb0xWj8Ir
 KdecWtRBvyAr7reLLaTUeJsh9g5K8XDN4IEsXYmxjbcZRojacmfH/yWuoUEgF/cgOhWM7HSa
 Nc2VgAsdQrsXQBgMG84Up4hybLAan7XKm0E9w39SbAMy2/LwQp81bLgPNbYdpmGSNtYmm6cp
 3na5CL+GhwcOdmVxDaJ/37qgfXA9R4XQ6obELm+s/VtmlDWnzZVAxwNXlz9qv684qKjZz5BA
 1Y56Cp0n4QdzVGyR+X7bzjg+FOarwFJDrK8DNYGwA2Kz6PV5SOQCW4FUiNNZbQaWCkeGGJCO
 rihwo2BONB/jFGGYSnGrubO/VteLQBQfDFcOXJYJecQy4S7yLzfmC4jWTqK/ESdp9nxFDeYL
 9ui83Vm3+97YSLmK8yGEb3vijaooN3CSRQ4o1yNGGmk9Qh+IoWiYuRECGQ3D94ed+51rXHY4
 xDofvRyCshVXPlhcwTWEY0w8EmBvartDdElqQcH82Md3zqs4WW/Wotb/StzIkxkWu5dJ26zP
 xWC4VgMtM4JVJdPUUORS9zpYyjN5fa4fekJqtiPBjazSsErLVTerH0GibC4hjmzzCDAbp3Ty
 b/CIZrzUh72+IxszSG9QK8GwKQ3yyUlrV4/trilpylLJYG2PSbPIZ9caQPmRrlgsMus/l6Pm
 /4BbJTi9vmqeLCkCsUh2dRNfQliwLlSLc2elvG7gcbYe1o5SD19VqaMqV7jEqQ895loei7z1
 ijVcmdTyUH0gjvMLgDiV5ypQOmHsUpXxZ7jARERAA==
IronPort-HdrOrdr: A9a23:1TcLSa3gETEZ+laUY4AEeQqjBeFxeYIsimQD101hICG9Lfbo9P
 xGzc566farslcssSkb6K+90cm7LU80hqQFn7X5XI3SETUO3VHYTr2KgrGSuQEJlUfFh5NgPM
 tbAs9D4b7LfBRHZKTBkXWF+r8bqbHtntHM9IPjJhxWPHhXgtRbnnxE43GgYzVLrWd9dPwEPa
 vZzPBq4xCnfnMaZNm6AH4qY8jvzuegqLvWJTQ9K1oC8gehsROEgYSWL/Gf5HgjegIK5Y1n3X
 nOkgT/6Knmmeq80AXg22ja6IkTsMf9y/NYbfb8xPQ9G3HJsEKFdY5hU7qNsHQeu+e08msnl9
 HKvlMJI9lz0XXMZWu4yCGdmjUIkQxeq0MK+2Xow0cLkvaJAQ7SzPAxwb6xRyGpqHbIeusMl5
 6jkVjp8aa/Rimw7RgVr+K4Jy2C0HDE7kbLVYUo/iRiuUx0Us4JkaUPuExSC5sOByT89cQuF/
 RvFtjV4LJMfUqddG2xhBgm/DWAZAVEIv69eDlKhuWFlzxN2HxpxUoRw8IS2n8G6ZImUpFBo+
 DJKL5hmr1CRtIfKfsVPpZKfeKnTmjWBR7cOmObJlrqUKkBJnLWspbypLE4/vujdpAExIY73J
 7BTFRbv2gvfF+GM7zE4LRbthTWBGmtVzXkzc9To5B/p73nXbLudTaOTVg/+vHQ1Mn3wverL8
 pbFKgmdsMLd1Gearqh9zeOKaVvFQ==
X-Talos-CUID: 9a23:85RUvm5ci29K/VWBatss7mMGGpoXXlLk0W7ZH0mILD4xZaOEVgrF
X-Talos-MUID: 9a23:Gkp4fwbc9Ht+FeBTrxGriD5/G/hSoL2wJH4Qvp8+lJOIKnkl
X-IronPort-Anti-Spam-Filtered: true
Received: from alln-core-12.cisco.com ([173.36.13.134])
  by alln-iport-8.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 10:48:42 +0000
Received: from rcdn-opgw-3.cisco.com (rcdn-opgw-3.cisco.com [72.163.7.164])
	by alln-core-12.cisco.com (8.15.2/8.15.2) with ESMTPS id 37NAmggB002465
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 10:48:42 GMT
X-CSE-ConnectionGUID: 6oisXR8WSgCFSvSIr8FXmw==
X-CSE-MsgGUID: CclXBA5iS7CtfjZE0Sejjg==
Authentication-Results: rcdn-opgw-3.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.01,195,1684800000"; 
   d="scan'208,217";a="740118"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
  by rcdn-opgw-3.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2023 10:48:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4ypltiLDzyAkAf3QERcfCje3s5ZRamrjV1j5d9Z1/TbvN09LsNT87Jf2ppOt3c3BU6x8khKyoP9Mnd8QiwN45KFMVmuxIBnqrp9yg/ywW2ggZp0GIQ/nfPLvGg/ctxZ1NOk/W8nIym1BkKK7UBTRwam6BTYLmtaQ8Pnzmlj6sOpnFpgqO8OAdD9g1rcaVi2GE0Jw/Qz1V5kGwP/30voAe086FUI4CEXItjIl7bgsZfDfuSpeSknmd8iLCZb+WdluOQ0n6lgoFqzefRHazI70V6eVbyk4icrguz8Q0EQGfxKUnszjH6JIJtTLfr5zfPe5MQBqVxblmOf0OhgAf3E1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TuXHBuNO5KlWYM8ZQqNHqxijKF9yN3A7lcsXGcloSLQ=;
 b=ZxzMRGfTKEeKfObSanwD7nH1LzNCI1o+dooP/gtMDn7qqLN5qF7hQ5uBRM2LCb1PiikjP2cxn3Nw5fKbE5ME8vAOiYf2/pfJEzftEb1UxR6/Q9hNTk5O1s90dgPlSJr9Wutd6qDHvQZopSrIomfKvlping1a0bd8A8g7F5li1x6v4CAU5yRC11TagcAsKFSJtbDqphfXAMB58DzwbHa937mx3L8lrUc+YEvVAhz0Zxnri5rhhDSKZQZhPW7tKUTli/iGUFGZ63gLdfZPxc0wOAyxxZhtAa+oNRk3PttHRPvzMXVKUjv1AY3X2GmpCSPFxkF/0ide3ljflZIYyMZTaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TuXHBuNO5KlWYM8ZQqNHqxijKF9yN3A7lcsXGcloSLQ=;
 b=KRTS32lfP/yfpHlUvcr3peFwrC/0qcj7wGB9sScC/DImfdOdHfEsBdjmn8IqHtkx1hks4tyA2nd4wo1lliUvFwA4DM48b/3FxM2fwXZeu7Vt7TrRhNhTzv9jtJi/2WjkWN3X4ZJ5XbL0frdNf3pKlZKnHwYWmo6muSHHH5qhPvo=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CO1PR11MB5041.namprd11.prod.outlook.com (2603:10b6:303:90::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.26; Wed, 23 Aug
 2023 10:48:41 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::4da5:1905:dbff:fee0]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::4da5:1905:dbff:fee0%3]) with mapi id 15.20.6699.020; Wed, 23 Aug 2023
 10:48:40 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: subscribe
Thread-Topic: subscribe
Thread-Index: AdnVrt8fAdwhbPWFSUK6h657tNpmBA==
Date: Wed, 23 Aug 2023 10:48:14 +0000
Deferred-Delivery: Wed, 23 Aug 2023 10:48:03 +0000
Message-ID: 
 <SJ0PR11MB67172A0AE1B53F83056F2B5CDC1CA@SJ0PR11MB6717.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CO1PR11MB5041:EE_
x-ms-office365-filtering-correlation-id: ea799bbe-cf64-454d-a2b4-08dba3c68389
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 Sb0tHS+IeFA5htmEQ9PMznhixcErbjM8m5FARZCpLekm6Igx+/F8fFOmG7XbnLm6JUt2M/XZco+SXFbhgeA4efZ47Y7xBYZwHw1ss8OoLwmSfQvUUgd64FkB/rt8oF4Qt7/og5h4Kir+YZXPWUzkiSgG0gZvi5aIMWhMKWmBBSXB1crqKIqJrjEGg/ChS7ABezKS/JsE37hnEpd2QQalVbzIZ0W4cS9UqKG3OxmqknpFIVaO7HoZct7YxUIhFnydjfQ+xbyhispo8CFKIBx4f1lSHz0/QiUp9Kpm7rWoKqSD2PFJ6ey3nSrLWKiMjbC0soFuhqyBt4qf+BzUBoRhi4JqKv/TTw4CJJ6vrczfr5ttCizDqMVBoJZ2QE29/h4PXs9vtKZR9CWen3MVgzBu2eSFe6tKXtrnA4kROODb994eAxMxIjcx6poYVScIADJIxmWKPuK9Jdi/B4Rra0iShbn/b03a+5rA2FoWN/A+foHXWAWrDl8FMGEaucOaihp8yRHfoKazCace3d2Tc7K5n+WdTUOtpQScrrJOFpOu7RmYOc6QKYPX91511mDAHedjMSu1LQlYD5PMnKo24Wx0t57d3pFFBLezkIV5RBYDHn0X7yGB4iJL4wziQasxTuro2QDp9c8KpHvxvE1eCLK9sBSudBA+Z3EWDRbK/NlzMkg=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(366004)(376002)(396003)(39860400002)(346002)(1800799009)(186009)(451199024)(2906002)(38100700002)(38070700005)(122000001)(33656002)(86362001)(558084003)(3480700007)(55016003)(9686003)(41300700001)(66446008)(64756008)(66476007)(66556008)(66946007)(76116006)(7696005)(6506007)(55236004)(316002)(6916009)(52536014)(7116003)(8936002)(8676002)(478600001)(6666004)(71200400001)(26005)(4270600006)(5660300002)(166393002)(220243001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?6wG3/ycXXkq6Bj+KiMxp7oQ6ho7RBCCuaYoTIIO/YSQ0B2AuNlasH2wdPh5i?=
 =?us-ascii?Q?+AEyU6ns7NFa1hx5Du3NCAayu53g51JAEovw5PlmruQPX30YmZYGSYGf22Wy?=
 =?us-ascii?Q?VQ2DPv4dTnhIfGuA678LEFnyDj2aK6QfGShByP3hvRG8YYy0KLLQ47U5dGjV?=
 =?us-ascii?Q?T4S3ZrOcmY4GJBLrNumw4Rls/1jGmIj+AxyRbVTQ7JNEGzfyR30HPjJpeHx4?=
 =?us-ascii?Q?hu7zbpCLYGa2H/Mxz/P7Gq9xELt+JsRuyjN1TDiVgkCuaILAfZLB6RUmADgn?=
 =?us-ascii?Q?N6AFcDbtGbNhOt32E1oGDFi8DI2uEw8eS/xwBdN/uJhTLdj+K4AWTRTgInAo?=
 =?us-ascii?Q?6qlBnLZvDGyWSBRGBfFxC9DPoHsrAC8Lnx5gqp+18YTEx9vq6mb6xc25C9yw?=
 =?us-ascii?Q?1IdURdYdK133foFwQHMwc6Ku7/U9lX9z/OLdfFVAPYpstc+y9B646dxjzldj?=
 =?us-ascii?Q?PFC55ttUOw3flrtpCGQJBG33cSI/Gdo+lUAgL3q4UvEbkUVAs6fUJ7R0Ia9x?=
 =?us-ascii?Q?GqONXrZivazYxXurrIgMC2BnulEFrQClsMTIor6osHUxYm9/PA442ijUm5Yj?=
 =?us-ascii?Q?0dP6Ke324egZ2jHnlUJOnhKnR3fd8/vuU8SJzevr69VvzCnpSnfbi/ParSND?=
 =?us-ascii?Q?2jZrPgOYIxqDwBXJf9gbonGzJuOE1TdewgtYvZ0p/2zITS28RyYcA0n8iSVB?=
 =?us-ascii?Q?sahP4eZXGukGWgBVmQkbHngP8325K9f/rWzz3Rj2yysAi4W2FhZKWV2W62J8?=
 =?us-ascii?Q?H+jBkqLKAG6mlJUuAwB5t7neLQXHQfxxDCjtSfyofNN8DImcGDkf4gMp2u9u?=
 =?us-ascii?Q?CL7nZ2WzNYmOHhNA2NBzdWR5+yZ5YCAOk11lW/dVlAzVNN6GWe/GaR0gI/ju?=
 =?us-ascii?Q?v56mu4cs6ATCyM+NXk26DXhujwx7aMaIu7DahyScWsXb9RN/IO7dKU2dS2vA?=
 =?us-ascii?Q?0hvMxtwcReRGG7BaCZ5py+OFxQQKN1KLcnFW3y8/owGTVSoN/3Ov661M31Dz?=
 =?us-ascii?Q?WbMBzEAODO5nOTjrcTtJ45flIuprPwgplzxBSa5iAr9V6/KyIr37yyJ3FYlq?=
 =?us-ascii?Q?gFllb62TxS6ogdQIQG9EHyLG5453RiufuSPy+LZyNL1DazvROa84zw1P27mr?=
 =?us-ascii?Q?mtsxxdLDTeAh17FLn+kiD0xnTcJx85DGONj6ZAPY3W7P3JyiV+fFCvATSU3Y?=
 =?us-ascii?Q?+x5Y9JsOdB1j9iuCSi7hIL4nxABxaJCB77Dp6FORFA976DSHU+Pj/fVbgWhj?=
 =?us-ascii?Q?GLBmM+hpx7AxSp10fnAycGgmOGcLV9966ITdftgY6x3at+HT6fZex8SoJs3q?=
 =?us-ascii?Q?MCJRCa0xyGNxjJ9Qm5ZHl2MKTgEP0Kfnh5Zd4ZjjbQv5ENwg4f2Kyzkpir87?=
 =?us-ascii?Q?rTU03Iws+4nWLki1mWxzE2O/yIqu0HM/nJ3hSvUmncRV/jrCDj1iE4gs+ZN8?=
 =?us-ascii?Q?cxNt6W1nXr4S1kPRShLpB0uu4hN6GQV9398Cev6WTuUkdDGk/DoNFpQdsaKb?=
 =?us-ascii?Q?9BdgOaz5zZAsdmageIGf5lKoI5kHrklUiVrYXoBBhXbRG6UuAcqitSj+qVyF?=
 =?us-ascii?Q?jtDJ5YTPn/ihn0vRy8CeaEbH8a0jbRGLjLpgFydv?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB67172A0AE1B53F83056F2B5CDC1CASJ0PR11MB6717namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea799bbe-cf64-454d-a2b4-08dba3c68389
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Aug 2023 10:48:40.8623
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: MmE9HV0oR8Tfo1hla809CjAUh0cVHvaoGQruZEBpz9XrMIGWbXfCqiPWF9W6gGV0FSF1894qINnW7SSOPj1rPg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5041
X-Outbound-SMTP-Client: 72.163.7.164, rcdn-opgw-3.cisco.com
X-Outbound-Node: alln-core-12.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Aug 2023 10:48:46 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/104536

--_000_SJ0PR11MB67172A0AE1B53F83056F2B5CDC1CASJ0PR11MB6717namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



Thanks & Regards,
Sanjay Chitroda
Software Engineer
schitrod@cisco.com<mailto:schitrod@cisco.com>


--_000_SJ0PR11MB67172A0AE1B53F83056F2B5CDC1CASJ0PR11MB6717namp_
Content-Type: text/html; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<html xmlns:v=3D"urn:schemas-microsoft-com:vml" xmlns:o=3D"urn:schemas-micr=
osoft-com:office:office" xmlns:w=3D"urn:schemas-microsoft-com:office:word" =
xmlns:m=3D"http://schemas.microsoft.com/office/2004/12/omml" xmlns=3D"http:=
//www.w3.org/TR/REC-html40">
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
<meta name=3D"Generator" content=3D"Microsoft Word 15 (filtered medium)">
<style><!--
/* Font Definitions */
@font-face
	{font-family:"Cambria Math";
	panose-1:2 4 5 3 5 4 6 3 2 4;}
@font-face
	{font-family:Calibri;
	panose-1:2 15 5 2 2 2 4 3 2 4;}
/* Style Definitions */
p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0cm;
	font-size:11.0pt;
	font-family:"Calibri",sans-serif;
	mso-ligatures:standardcontextual;
	mso-fareast-language:EN-US;}
span.EmailStyle17
	{mso-style-type:personal-compose;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-family:"Calibri",sans-serif;
	mso-fareast-language:EN-US;}
@page WordSection1
	{size:612.0pt 792.0pt;
	margin:72.0pt 72.0pt 72.0pt 72.0pt;}
div.WordSection1
	{page:WordSection1;}
--></style><!--[if gte mso 9]><xml>
<o:shapedefaults v:ext=3D"edit" spidmax=3D"1026" />
</xml><![endif]--><!--[if gte mso 9]><xml>
<o:shapelayout v:ext=3D"edit">
<o:idmap v:ext=3D"edit" data=3D"1" />
</o:shapelayout></xml><![endif]-->
</head>
<body lang=3D"EN-IN" link=3D"#0563C1" vlink=3D"#954F72" style=3D"word-wrap:=
break-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-ligatures:none;mso=
-fareast-language:EN-IN">Thanks &amp; Regards,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><b><span lang=3D"EN-US" style=3D"mso-ligatures:none;=
mso-fareast-language:EN-IN">Sanjay Chitroda<o:p></o:p></span></b></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-ligatures:none;mso=
-fareast-language:EN-IN">Software Engineer<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span lang=3D"EN-US" style=3D"mso-ligatures:none;mso=
-fareast-language:EN-IN"><a href=3D"mailto:schitrod@cisco.com">schitrod@cis=
co.com</a><o:p></o:p></span></p>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
</div>
</body>
</html>

--_000_SJ0PR11MB67172A0AE1B53F83056F2B5CDC1CASJ0PR11MB6717namp_--

