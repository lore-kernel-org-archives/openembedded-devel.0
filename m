Return-Path: <schitrod@cisco.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72EC6EB64D9
	for <webhook@archiver.kernel.org>; Thu, 15 Jun 2023 16:13:02 +0000 (UTC)
Received: from rcdn-iport-1.cisco.com (rcdn-iport-1.cisco.com [173.37.86.72])
 by mx.groups.io with SMTP id smtpd.web11.22910.1686845576637852059
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 15 Jun 2023 09:12:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cisco.com header.s=iport header.b=YwSdIiL5;
 spf=pass (domain: cisco.com, ip: 173.37.86.72, mailfrom: schitrod@cisco.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=cisco.com; i=@cisco.com; l=12757; q=dns/txt;
  s=iport; t=1686845576; x=1688055176;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:mime-version;
  bh=r/vTnlI87oUp32pbH7IHi3BN2itLUNXF9taWAxXPUdU=;
  b=YwSdIiL5GG874I7zt+OC9DMA8vaXJ40tamJluLTmE350VOgn6e+xCTQs
   u7ZG1eGj9WfVCprgeJpcogW9KDjqyc48Yy9FAq9zqYPKD632dcZX4u3qO
   jef7hdgRdbQ4ZkEmKe6/xhRTqD+J5Bq2Tk/t0nrs11AL4DpBpe9pJ8ho6
   c=;
X-IPAS-Result: =?us-ascii?q?A0AaAABGOItkmJBdJa1aHAEBAQEBAQcBARIBAQQEAQFAJ?=
 =?us-ascii?q?YEWBwEBCwGBKzFScwJZKhJHiB0DhE5fiFUDlyCGTxSBEQNWDwEBAQ0BAS4BD?=
 =?us-ascii?q?AkEAQGEQEYChXsCJTQJDgECAgIBAQEBAwIDAQEBAQEBAwEBBQEBAQIBBwQUA?=
 =?us-ascii?q?QEBAQEBAQEeGQUOECeFaA2GBAEBAQEDAREbEwEBNwELBAIBCBEEAQEWEgcoC?=
 =?us-ascii?q?hQJCAIEAQ0FCBqCXAGCFUcDARCjQwGBQAKJcDV4gTSBAYIIAQEGBAWBSgJDn?=
 =?us-ascii?q?RcJgUIBiTeDYBeEMScbQIFNgRVDgmg+gQWBXQEBA4EWCAoBEgEjBQcfCQgBg?=
 =?us-ascii?q?1WCLoIXh0SEUYZ/iVeBKG+BHoEifwIJAhFngQgIXoFxQAINVAsLY4EcUjweg?=
 =?us-ascii?q?SgCAhE8DwVSeR0DBwOBBRAvBwQyCRYJBgkYLyUGUQctJAkTFUEEg1gKgQ0/F?=
 =?us-ascii?q?Q4RglokAgc2PxtUgQ0HNgNEHUADC209NQYOHwUEaoFXMECBEQIiJJ8hLAODE?=
 =?us-ascii?q?IEQCBQQIHEHAwRLKR8YknEKMI4FowcKJ4Nhi3yNGoggF4VXpAALliKBaiCNO?=
 =?us-ascii?q?pUghRQCBAIEBQIOAQEGgWM6az8cAwsHcBWDIglJGQ+OIBmDW4F/gxWKZXULM?=
 =?us-ascii?q?AIHCwEBAwmIcC2CKwEB?=
IronPort-PHdr: A9a23:bj7T/hCeiKoLNURzo6gXUyQVoBdPi9zP1kY98JErjfdJaqu8us2kN
 03E7vIrh1jMDs3X6PNB3vLfqLuoGXcB7pCIrG0YfdRSWgUEh8Qbk01oAMOMBUDhav+/Ryc7B
 89FElRi+iLzKlBbTf73fEaauXiu9XgXExT7OxByI7HuEY7Tk96w28i5+obYZENDgz/uKb93J
 Q+9+B3YrdJewZM3M7s40BLPvnpOdqxaxHg9I1WVkle06pK7/YVo9GJbvPdJyg==
IronPort-Data: A9a23:dLVZKai3V8JoRqT4kXUiVgDyX161YRAKZh0ujC45NGQN5FlHY01je
 htvXzjVPqzfN2X8c9x3bomzp0kBsZTcnYRlS1NorSg8EnxjpJueD7x1DKtf0wB+jyHnZBg6h
 ynLQoCYdKjYdleF+lH1dOKJQUBUjclkfJKkYAL/En43HVcMpBsJ00o5wLZn29Mw27BVPivU0
 T/Mi5yHULOa82Yc3lI8s8pvfzs24ZweEBtB1rAPTagjUG32zhH5P7pDTU2FFEYUd6EPdgKMq
 0kv+5nilo/R109F5tpICd8XeGVSKlLZFVDmZna7x8FOjzAazhHe3JrXO9I1WWJXtjqqnulAk
 tx9rLu7Tx13ArTDzbF1vxlwS0mSPIVc87PBZHO4q8HWnwvNcmDnxLNlC0Re0Y8wo7ksRzoRs
 61DbmlRMnhvhMruqF6/YvJnhsU/Ns7nFIgeoXpnizreCJ7KRLicGPuQvoUBhF/cgOhTGqrgX
 ukkaANsaSbxSB9tAg0dFIgHybLAan7XKm0E9w39SbAMy2/LwQp81bLgPNbYdpmGSNtYmm6cp
 3na5CL+GhwcOdmVxDaJ/37qgfXA9R4XQ6oIH7G+s/VtmlDWlioYCQYdUh2wpvzRZlOCt8x3A
 nwx+hchjqkLxRaifsDaVBui/kKdsUtJMzZPKNES5AaIw6vSxg+WAGkYUzJMAODKUudrGFTGM
 XfUwrvU6SxTXK69Ei3Cq+/Fxd+mEW1Ecj9YPH5soR4tuoG7+OkOYgTzosGP+ZNZY/XvEj32h
 juNtiV71/MYjNUA0OOw+lWvb9OQSnrhE1FdCub/BzLNAuZFiGiNO9bABb/zsa4oEWphZgPd1
 EXoYuDHhAz0MbmDlTaWXMIGF6yz6vCOPVX02AA/Qcl9rW3xoib/LOi8BQ2Swm80Y67onhe3O
 CfuVf95v/e/wVPzN/YsOtLtYyjU5fG6SIqNug/ogipmO8gtK1DvENBGbk+L1Geli1k3jaw6I
 v+mnTWEUx4n5VBc5GPuHY81iOZzrghnnD+7bc6glXyPj+HBDEN5vJ9YajNimMhjsvPdyOgUm
 v4CX/a3J+J3DLWvOnSPqNRMcjjn7xETXPjLliCeTcbaSiJOE2A6APiXyrQkE7GJVYwPz72gE
 q2VMqOA9GfCuA==
IronPort-HdrOrdr: A9a23:V3erE61fPwMzmAuiBkdOPAqjBRJyeYIsimQD101hICG9Lfb4qy
 n+ppomPEHP5wr5AEtQ5+xoWJPrfZvdnaQFhrX5To3SLTUO2VHYY72KiLGD/9SOIVyEygbSv5
 0QCZSWZOeAaGSSyPyKnzVQcOxQjuVvkprY+Ns2pk0FJWoHGsIQjTuRSDzrbnGeLzM2Y6bRYa
 Dsnvav0ADQAEj/AP7LYkXtWdKvm/T70LbdJTIWDR8u7weDyRmy7qThLhSe1hACFxtS3LYL6w
 H+4kzEz5Tml8v+5g7X1mfV4ZgTssDm0MF/CMuFjdVQAinwizyveJ9qV9S5zXMISaCUmRQXee
 v30lMd1vdImjTsl6aO0F3QMjzboXMTArnZuAalaDXY0JTErXkBerp8bMpiA2jkAgwbzZBBOG
 Yh5RPCi3KRZimwxxgU67XzJmNXv1vxrnw4neEJiXtDFYMYdb9KtIQauFhYCZEaAUvBmcoa+c
 RVfYnhDcxtABinRmGcunMqzM2nX3w1EBvDSk8eutaN2zwTmHxi1UMXyMEWg39FrfsGOtV5zv
 WBNr4tmKBFT8cQY644DOAdQdGvAmiIRR7XKmqdLVnuCalCMXPQrJz85qkz+YiRCdE15Yp3nI
 6EXEJTtGY0dU6rAcqS3IdT+hSIW2m5VSSF8LAW23G4gMyLeFPGC1z1dLl1qbrUnxw2OLyuZ8
 qO
X-Talos-CUID: 9a23:MZtIX2OtUzP+He5DcRlC9HMbOcEcQyfU/G73KEmiV1pwR+jA
X-Talos-MUID: 9a23:dR5xtQoeakLCeNb5MwcezyxlaPlRwJmvMUMIo6Qtueu8byZsIQ7I2Q==
X-IronPort-Anti-Spam-Filtered: true
Received: from rcdn-core-8.cisco.com ([173.37.93.144])
  by rcdn-iport-1.cisco.com with ESMTP/TLS/DHE-RSA-SEED-SHA; 15 Jun 2023 16:12:40 +0000
Received: from rcdn-opgw-1.cisco.com (rcdn-opgw-1.cisco.com [72.163.7.162])
	by rcdn-core-8.cisco.com (8.15.2/8.15.2) with ESMTPS id 35FGCdl9015014
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 16:12:39 GMT
Authentication-Results: rcdn-opgw-1.cisco.com; dkim=pass (signature verified) header.i=@cisco.com; spf=Pass smtp.mailfrom=schitrod@cisco.com; dmarc=pass (p=quarantine dis=none) d=cisco.com
X-IronPort-AV: E=Sophos;i="6.00,245,1681171200"; 
   d="scan'208,217";a="3020518"
Received: from mail-co1nam11lp2175.outbound.protection.outlook.com (HELO NAM11-CO1-obe.outbound.protection.outlook.com) ([104.47.56.175])
  by rcdn-opgw-1.cisco.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2023 16:12:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyjFnXjqrMlvFN/6WnMR4mls6vtSHAMixqHfkJfwVKGdbCNw4s7E5H1VsICKZ/9sgz1IlKJ44InQ/DpF5Uo4ThPid0NXIa+s5G54XrdVJ9Crirx3y63O4MwPMvX13KKwh63wHYVAmaddD1ruQJ+oRLn/w6rvC+XUahet5K7MMK0zTzaGO6eq959l1lv13+m9lcF2+/Re2bue3xhCzkcyFHHQW3gETKRKBcBdW6943cCGrdJNaamApsTfi0dGC+LRUeHpC02Hqx+en4gATvTin6dZz3vauoefFnGOsRz5nHQeVcd1SRLyrE/Q5rCkykcJyg7fIjzA37i1i2fgVmaH2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhEWtZ2PV46Jbwe087xYhDeBQCxyyDEJNT5kwDo+IOk=;
 b=D8uAmLfdGOiDVQkKtlj0xnmb5e6jhv+xyi3WXNaz+LFLu2fplQKKTerAVRvdtuEWNsLx7iOMub8CzrFymglixoquifIMbz7IXyV7MJR/t2V7HcqRCZGaybE5KPTtAeynNCu9XU/V1TcyeSLxQDzQPaAPvFtQFGaqWWGmCs4wgAMhTwjjkwu6SaeLvpmzB+kJQcDyTPaxa9kf/g1+v8PnkMjE67HT9CWIFHnchbKo7LnYNQJz44BoNb77mz92NzOJ6rcnNNCTzu8oaKjjaBTOfEBPSe40J3ybYoJWEv9AJVmoEGhTUMVquXACYP50FdfjnWTT/L1OPACQtrmX+hYw5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cisco.com; dmarc=pass action=none header.from=cisco.com;
 dkim=pass header.d=cisco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cisco.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhEWtZ2PV46Jbwe087xYhDeBQCxyyDEJNT5kwDo+IOk=;
 b=OSvc9q0dCRXyqzTxOwSLyYQszIWY8YyawW2CcAR0daqrZmCsPDZmNSHuuBfESCNJUEbod/7fR/20/elbTBqffvwGrQtJ946IoG5+Iv4ERDramvOv2k1pnl56Qhuan3LhMXMYwjbDhzqlsWF3FQ9BFoL3zO0J5qF4N+JI8u9oMuE=
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com (2603:10b6:a03:44f::9)
 by CH3PR11MB7761.namprd11.prod.outlook.com (2603:10b6:610:151::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6477.37; Thu, 15 Jun
 2023 16:12:37 +0000
Received: from SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a]) by SJ0PR11MB6717.namprd11.prod.outlook.com
 ([fe80::2ddb:3ab6:484a:673a%5]) with mapi id 15.20.6477.037; Thu, 15 Jun 2023
 16:12:37 +0000
From: "Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at
 Cisco)" <schitrod@cisco.com>
To: "Polampalli, Archana" <Archana.Polampalli@windriver.com>,
        "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
CC: "G Pillai, Hari" <Hari.GPillai@windriver.com>
Subject: RE: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2022-41916
Thread-Topic: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix
 CVE-2022-41916
Thread-Index: AQHZn3E6IiIqjRah0EumUxSPsEbhJK+LrHFwgAAHnx2AAFNosA==
Date: Thu, 15 Jun 2023 16:12:19 +0000
Deferred-Delivery: Thu, 15 Jun 2023 16:11:48 +0000
Message-ID: 
 <SJ0PR11MB6717A1818E219498A9E1F186DC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
References: <20230615100658.543762-1-archana.polampalli@windriver.com>
 <SJ0PR11MB671749E856BD1A629D4E062CDC5BA@SJ0PR11MB6717.namprd11.prod.outlook.com>
 <MW4PR11MB5822AC64F8414AEA0D2E77A0845BA@MW4PR11MB5822.namprd11.prod.outlook.com>
In-Reply-To: 
 <MW4PR11MB5822AC64F8414AEA0D2E77A0845BA@MW4PR11MB5822.namprd11.prod.outlook.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR11MB6717:EE_|CH3PR11MB7761:EE_
x-ms-office365-filtering-correlation-id: 98928b32-b4d6-4994-95ad-08db6dbb55ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: 
 BQwxZZnGzfEx0b4zafsiXHfzMznKC/Tw8pLpEgGywiHYYH0DTpsiz16+5SvE+61dLF9pG+m03o4HoN0k3ZDxCX8AAjjKvKDoZ2Ns7Gu9kWTcephzcdV80U1Y1EB+C2rsRhkHJRLn+4IQZ6Qy6eT66fDM8mKR0CRkYeW/9oLeb35iwETKMZAU/IFXJ/4NvEgEvehDOrus8nVc5fYKvjHdIR2C36nqTHpNhGAOVfCbPkf0uIoZrt5yugggxyuK9xvZzUjvgiOaLoCviYXil18T/shcnZB/RTiGRnqSfhbiI74/2OhXopJ+Eabw8qkt/WRcWg4INk1QsGw9PbEORt9QlqgyA1BXw9m1KneRsEG5b1ilmFjvdyuIy0ZwjZia+wzt+r9DLDL/uoeRzf3FI6DUiXUK6K5tGvyATMiQKGOXylWS+U25566m1rq0QKa4PDJvyW2gfCkmDEcl9A0qY3nvlW3mjYjvY4RpKXhTb3HmBKIQiJn8pKKNe3SvLQipZ5tk/HIdE61fTrfSwomgO1P7wyaoA3aqoqH64AwKrKE5xr2vzUPqO+Yo1MsFjUudmqfepZhSXwa0+eMqDw7+KTPUKcXwl39+xp3ZYm0oaRT3DSyCFPpF0N/akqg7mnu86R4wNJo5NQLvD0n3Yh+YM84Hpw==
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR11MB6717.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(366004)(136003)(396003)(346002)(39860400002)(451199021)(5660300002)(52536014)(166002)(8676002)(8936002)(9326002)(41300700001)(2906002)(38070700005)(33656002)(55016003)(478600001)(53546011)(26005)(9686003)(6506007)(86362001)(83380400001)(966005)(7696005)(122000001)(71200400001)(6666004)(38100700002)(4326008)(66556008)(66476007)(66446008)(64756008)(76116006)(66946007)(316002)(186003)(110136005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?us-ascii?Q?/BqAjgQysTrm66BfwuDNvRKq9u+4UoV14pIYEhwJLX/eNYBoCRl7dj70v+Og?=
 =?us-ascii?Q?mFcq/ITB1Iq43b7WXml+GfqtMcGqKsmgCYSMMQuO5FdwAsOxdQ56PmV7JGYm?=
 =?us-ascii?Q?ESCcVAcG9NjSJonLLdslrjRWHUdj4Wf7UdKyypIlaTD0X8MyW2Eu8h3MbvbL?=
 =?us-ascii?Q?RCGkzvGgeiJUbecjqqoGCW/hL7amX5/Q62jqLZdf/gRhrWu/x5iUpbbUjtCh?=
 =?us-ascii?Q?6oZIZdVEKRQscdB31ONmkvd9PfhvV7xbGC/AzjngFJuRB88B0MCdUrNAk5RS?=
 =?us-ascii?Q?D0GgA4qW/EhmM6QUK2s8aQzAWUxE3yQsm3NY6Vix5/rjKhE9cRCwKRG5Q09b?=
 =?us-ascii?Q?l1bM1xXD5OVrutzaWiZ4AOfGjPqcfMbAcBQwBchXsTVF8yjSMpjRmx2ABb69?=
 =?us-ascii?Q?VQ/K/XFIdfH/61DVLoBL6CQ/YO5NuwkOLFx+ErlOql/Jaf5LwuYpXYt1Y8GK?=
 =?us-ascii?Q?d1yWVeReQuzZsq53TQNoAs/8dp9SAzr4SUE/hT4otZwQksilz5LV25YOSk33?=
 =?us-ascii?Q?frohivXUIwAS0RReJFiXkvUqw8wZJyqTYhTwZK7h1BSsC0ykUJKKS4htHfdN?=
 =?us-ascii?Q?AoPygxGzSWh981woc0sfIFUzQJy8zYWn5qfM6gSesi5yiGs1Dw0HaSqYVq3n?=
 =?us-ascii?Q?L/oBOi9kV/oRCbqj6w7yCqM38n+V61ZRUxrfQwpcyzfP0rQXqyKBGdVRpACZ?=
 =?us-ascii?Q?HUJEsmGEqSNSjVdSaPtKARscTwdpQUtrv0kzmh3LjM+LJ8RfNvZpfY4EpKha?=
 =?us-ascii?Q?eYCGbo26SCBZ3DximM4M7QEgkH+7zax8SgQtTuFR5npFFl4BlX0oeRVs7Kqw?=
 =?us-ascii?Q?7JLRm35xZCEFkCVmIZcHqeRlVsFYz6Xsu3svo/ARgA62EIy+4FgHeyFXEvZJ?=
 =?us-ascii?Q?948vzG/rgbBowcqGrGiRT3vIAhw+CQ9ZYO9XaAyUJc6xx5rc+nxLFH5+pMbQ?=
 =?us-ascii?Q?5uaoYX9dkWTfvfwzzgBzkLgAcGKS4GsZmK+sJPXHuc0RNgGVdiMApeEkltnr?=
 =?us-ascii?Q?GaVcSDMTnwfeprfrgWITuPlhBuOtjoFck7XgWFikt+EYuDalffVvVXDF6Yak?=
 =?us-ascii?Q?jXhqC+cl31HxP+QnfkRX+NAHXH6c86Cn1SViHjwMUSUZ0yvSKBEpO6YU/6ZH?=
 =?us-ascii?Q?DuCvjRj7tMgzs/y8leqo2JzltHtEIkiOA0+1jn+GKFJbxbt9y7Ba5LudqOe7?=
 =?us-ascii?Q?glbTEsE9RfRVFlPEiGEOcD3vaBBpvd62WTKafUrFmp1zgtrXXImzvsZSwKiv?=
 =?us-ascii?Q?GMpxp3rnIPUiCW5RPoscJq6ha+S1oaWbg7QG3cvWVQsneGfHIxz34Jta89Vn?=
 =?us-ascii?Q?5IUHXZluH5PshhEE4TqMXaZIbCXcAmwaSyZTEvsLpmyZYYXDiYA8hDN8QoYm?=
 =?us-ascii?Q?x6KpZUWegyoankofFs//lIjCNlCjccWLOWUWEBZ3aEvum3Ib7RehusNBxVa9?=
 =?us-ascii?Q?Wty5qiMlGfDKLdSHyEqQxItWsVTdUN1tjayRDseOKZH+mKSKfK2MKB0G4v7o?=
 =?us-ascii?Q?XbhaWZ4tsQaNLlgry7J9z6dGIJhI9zmbCca9FdeW15szDU4kYgVGmkFSDenR?=
 =?us-ascii?Q?67PHrwKC63nedLp9VJsD5mnkbOQxAVoGW01sZcdX?=
Content-Type: multipart/alternative;
	boundary="_000_SJ0PR11MB6717A1818E219498A9E1F186DC5BASJ0PR11MB6717namp_"
MIME-Version: 1.0
X-OriginatorOrg: cisco.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR11MB6717.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98928b32-b4d6-4994-95ad-08db6dbb55ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Jun 2023 16:12:37.0523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 5ae1af62-9505-4097-a69a-c1553ef7840e
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OF17LF8TLVVJMFWAv5jlZemYzSeLkU+zeoxwGNnefpNmBDUneuzcbV+/UNtXrfMsl08FrU39aQUVlyieLScT4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7761
X-Outbound-SMTP-Client: 72.163.7.162, rcdn-opgw-1.cisco.com
X-Outbound-Node: rcdn-core-8.cisco.com
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 15 Jun 2023 16:13:02 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103316

--_000_SJ0PR11MB6717A1818E219498A9E1F186DC5BASJ0PR11MB6717namp_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi Archana,

As I mentioned it will be advisable and good if we can make standard format=
.
We don't have strict guideline for this, but we always recommend to follow =
this, specifically for CVE patches.

We would appreciate, If you can consider this point and share the updated p=
atchset.

Thanks,
Sanjay


From: Polampalli, Archana <Archana.Polampalli@windriver.com>
Sent: Thursday, June 15, 2023 4:40 PM
To: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cisco=
) <schitrod@cisco.com>; openembedded-devel@lists.openembedded.org
Cc: G Pillai, Hari <Hari.GPillai@windriver.com>
Subject: Re: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-202=
2-41916

Hi Sanjay,

Thank you for you're review comment on patch format.

Shall I send V2 with updated format?.

Regards,
Archana


________________________________
From: Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC at Cis=
co) <schitrod@cisco.com<mailto:schitrod@cisco.com>>
Sent: Thursday, June 15, 2023 4:17 PM
To: Polampalli, Archana <Archana.Polampalli@windriver.com<mailto:Archana.Po=
lampalli@windriver.com>>; openembedded-devel@lists.openembedded.org<mailto:=
openembedded-devel@lists.openembedded.org> <openembedded-devel@lists.openem=
bedded.org<mailto:openembedded-devel@lists.openembedded.org>>
Cc: G Pillai, Hari <Hari.GPillai@windriver.com<mailto:Hari.GPillai@windrive=
r.com>>
Subject: RE: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-202=
2-41916

CAUTION: This email comes from a non Wind River email account!
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.

Hi Hari,

Regarding format only nothing specific to review of fix,

I saw many developers has contributed to samba package fixes.
I would be great if we can keep common format inside .patch file as followi=
ng.

----------------------------------------------
CVE: CVE-2022-41916
Upstream-Status: Backport [https://github.com/heimdal/heimdal/commit/eb87af=
0c2d18]

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com<mailto:=
archana.polampalli@windriver.com>>
----------------------------------------------

Thanks,
Sanjay

-----Original Message-----
From: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@l=
ists.openembedded.org> <openembedded-devel@lists.openembedded.org<mailto:op=
enembedded-devel@lists.openembedded.org>> On Behalf Of Polampalli, Archana =
via lists.openembedded.org
Sent: Thursday, June 15, 2023 3:37 PM
To: openembedded-devel@lists.openembedded.org<mailto:openembedded-devel@lis=
ts.openembedded.org>
Cc: Hari.GPillai@windriver.com<mailto:Hari.GPillai@windriver.com>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41=
916

Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.
Versions prior to 7.7.1 are vulnerable to a denial of service vulnerability=
 in Heimdal's PKI certificate validation library, affecting the KDC (via PK=
INIT) and kinit (via PKINIT), as well as any third-party applications using=
 Heimdal's libhx509. Users should upgrade to Heimdal 7.7.1 or 7.8. There ar=
e no known workarounds for this issue.

References:
https://nvd.nist.gov/vuln/detail/CVE-2022-41916

Upstream patches:
https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7daf483a47b03=
af80c2c

Signed-off-by: Archana Polampalli <archana.polampalli@windriver.com<mailto:=
archana.polampalli@windriver.com>>
---

--_000_SJ0PR11MB6717A1818E219498A9E1F186DC5BASJ0PR11MB6717namp_
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
<!--[if !mso]><style>v\:* {behavior:url(#default#VML);}
o\:* {behavior:url(#default#VML);}
w\:* {behavior:url(#default#VML);}
.shape {behavior:url(#default#VML);}
</style><![endif]--><style><!--
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
	font-family:"Calibri",sans-serif;}
a:link, span.MsoHyperlink
	{mso-style-priority:99;
	color:blue;
	text-decoration:underline;}
span.EmailStyle20
	{mso-style-type:personal-reply;
	font-family:"Calibri",sans-serif;
	color:windowtext;}
.MsoChpDefault
	{mso-style-type:export-only;
	font-size:10.0pt;
	mso-ligatures:none;}
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
<body lang=3D"EN-IN" link=3D"blue" vlink=3D"purple" style=3D"word-wrap:brea=
k-word">
<div class=3D"WordSection1">
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Hi Archan=
a,<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">As I ment=
ioned it will be advisable and good if we can make standard format.<o:p></o=
:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">We don&#8=
217;t have strict guideline for this, but we always recommend to follow thi=
s, specifically for CVE patches.<o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">We would =
appreciate, If you can consider this point and share the updated patchset.<=
o:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Thanks,<o=
:p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US">Sanjay<o:=
p></o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<p class=3D"MsoNormal"><span style=3D"mso-fareast-language:EN-US"><o:p>&nbs=
p;</o:p></span></p>
<div>
<div style=3D"border:none;border-top:solid #E1E1E1 1.0pt;padding:3.0pt 0cm =
0cm 0cm">
<p class=3D"MsoNormal"><b><span lang=3D"EN-US">From:</span></b><span lang=
=3D"EN-US"> Polampalli, Archana &lt;Archana.Polampalli@windriver.com&gt;
<br>
<b>Sent:</b> Thursday, June 15, 2023 4:40 PM<br>
<b>To:</b> Sanjaykumar kantibhai Chitroda -X (schitrod - E-INFO CHIPS INC a=
t Cisco) &lt;schitrod@cisco.com&gt;; openembedded-devel@lists.openembedded.=
org<br>
<b>Cc:</b> G Pillai, Hari &lt;Hari.GPillai@windriver.com&gt;<br>
<b>Subject:</b> Re: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix =
CVE-2022-41916<o:p></o:p></span></p>
</div>
</div>
<p class=3D"MsoNormal"><o:p>&nbsp;</o:p></p>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Hi Sanj=
ay,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Thank y=
ou for you're review comment on patch format.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Shall I=
 send V2 with updated format?.<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Regards=
,<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black">Archana=
<o:p></o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div>
<p class=3D"MsoNormal"><span style=3D"font-size:12.0pt;color:black"><o:p>&n=
bsp;</o:p></span></p>
</div>
<div class=3D"MsoNormal" align=3D"center" style=3D"text-align:center">
<hr size=3D"2" width=3D"98%" align=3D"center">
</div>
<div id=3D"divRplyFwdMsg">
<p class=3D"MsoNormal"><b><span style=3D"color:black">From:</span></b><span=
 style=3D"color:black"> Sanjaykumar kantibhai Chitroda -X (schitrod - E-INF=
O CHIPS INC at Cisco) &lt;<a href=3D"mailto:schitrod@cisco.com">schitrod@ci=
sco.com</a>&gt;<br>
<b>Sent:</b> Thursday, June 15, 2023 4:17 PM<br>
<b>To:</b> Polampalli, Archana &lt;<a href=3D"mailto:Archana.Polampalli@win=
driver.com">Archana.Polampalli@windriver.com</a>&gt;;
<a href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedded-d=
evel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-devel@li=
sts.openembedded.org">openembedded-devel@lists.openembedded.org</a>&gt;<br>
<b>Cc:</b> G Pillai, Hari &lt;<a href=3D"mailto:Hari.GPillai@windriver.com"=
>Hari.GPillai@windriver.com</a>&gt;<br>
<b>Subject:</b> RE: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix =
CVE-2022-41916</span>
<o:p></o:p></p>
<div>
<p class=3D"MsoNormal">&nbsp;<o:p></o:p></p>
</div>
</div>
<div>
<div>
<p class=3D"MsoNormal" style=3D"margin-bottom:12.0pt">CAUTION: This email c=
omes from a non Wind River email account!<br>
Do not click links or open attachments unless you recognize the sender and =
know the content is safe.<br>
<br>
Hi Hari,<br>
<br>
Regarding format only nothing specific to review of fix,<br>
<br>
I saw many developers has contributed to samba package fixes.<br>
I would be great if we can keep common format inside .patch file as followi=
ng.<br>
<br>
----------------------------------------------<br>
CVE: CVE-2022-41916<br>
Upstream-Status: Backport [<a href=3D"https://github.com/heimdal/heimdal/co=
mmit/eb87af0c2d18">https://github.com/heimdal/heimdal/commit/eb87af0c2d18</=
a>]<br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com">archana.polampalli@windriver.com</a>&gt;<br>
----------------------------------------------<br>
<br>
Thanks,<br>
Sanjay<br>
<br>
-----Original Message-----<br>
From: <a href=3D"mailto:openembedded-devel@lists.openembedded.org">openembe=
dded-devel@lists.openembedded.org</a> &lt;<a href=3D"mailto:openembedded-de=
vel@lists.openembedded.org">openembedded-devel@lists.openembedded.org</a>&g=
t; On Behalf Of Polampalli, Archana via lists.openembedded.org<br>
Sent: Thursday, June 15, 2023 3:37 PM<br>
To: <a href=3D"mailto:openembedded-devel@lists.openembedded.org">openembedd=
ed-devel@lists.openembedded.org</a><br>
Cc: <a href=3D"mailto:Hari.GPillai@windriver.com">Hari.GPillai@windriver.co=
m</a><br>
Subject: [oe][meta-networking][kirkstone][PATCH 1/1] samba: fix CVE-2022-41=
916<br>
<br>
Heimdal is an implementation of ASN.1/DER, PKIX, and Kerberos.<br>
Versions prior to 7.7.1 are vulnerable to a denial of service vulnerability=
 in Heimdal's PKI certificate validation library, affecting the KDC (via PK=
INIT) and kinit (via PKINIT), as well as any third-party applications using=
 Heimdal's libhx509. Users should
 upgrade to Heimdal 7.7.1 or 7.8. There are no known workarounds for this i=
ssue.<br>
<br>
References:<br>
<a href=3D"https://nvd.nist.gov/vuln/detail/CVE-2022-41916">https://nvd.nis=
t.gov/vuln/detail/CVE-2022-41916</a><br>
<br>
Upstream patches:<br>
<a href=3D"https://github.com/heimdal/heimdal/commit/eb87af0c2d189c25294c7d=
af483a47b03af80c2c">https://github.com/heimdal/heimdal/commit/eb87af0c2d189=
c25294c7daf483a47b03af80c2c</a><br>
<br>
Signed-off-by: Archana Polampalli &lt;<a href=3D"mailto:archana.polampalli@=
windriver.com">archana.polampalli@windriver.com</a>&gt;<br>
---<o:p></o:p></p>
</div>
</div>
</div>
</body>
</html>

--_000_SJ0PR11MB6717A1818E219498A9E1F186DC5BASJ0PR11MB6717namp_--

