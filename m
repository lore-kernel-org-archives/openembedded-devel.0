Return-Path: <danc@opengear.com>
X-Greylist: delayed 33934 seconds by postgrey-1.34 at layers.openembedded.org;
	Mon, 04 Mar 2019 23:29:43 UTC
Received: from NAM05-DM3-obe.outbound.protection.outlook.com
	(mail-eopbgr730082.outbound.protection.outlook.com [40.107.73.82])
	by mail.openembedded.org (Postfix) with ESMTP id D9F567C870
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 23:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=opengear.com;
	s=selector1;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=Gcak/WFuXl3hOloLh9Tpecx5HPx9imgDvdeJNfv+mbU=;
	b=V4nFsMZU2ysEQ9zgnjLSNDM8Uouygv1jvWmCLQuBqK2f7SXchPygPpjAFFzg4MXTEem10MD5FIi3k3xWOrQhHzKOixig7Jp2RfrcNv/Mq12oKuNWzm+VNNMzuHBgmEEgty9tC4QRxkdyc+fD3wQLnVMxajyiEc9LO+exzVuA5Ww=
Received: from SN6PR1501CA0032.namprd15.prod.outlook.com (2603:10b6:805::45)
	by BN8PR15MB3218.namprd15.prod.outlook.com (2603:10b6:408:75::26) with
	Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.1665.18;
	Mon, 4 Mar 2019 01:29:49 +0000
Received: from SN1NAM04FT011.eop-NAM04.prod.protection.outlook.com
	(2a01:111:f400:7e4c::206) by SN6PR1501CA0032.outlook.office365.com
	(2603:10b6:805::45) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.1665.16 via
	Frontend Transport; Mon, 4 Mar 2019 01:29:48 +0000
Authentication-Results: spf=permerror (sender IP is 60.241.24.90)
	smtp.mailfrom=opengear.com; lists.openembedded.org;
	dkim=none (message not
	signed) header.d=none;lists.openembedded.org; dmarc=fail action=none
	header.from=opengear.com;
Received-SPF: PermError (protection.outlook.com: domain of opengear.com used
	an invalid SPF mechanism)
Received: from postman.bne.opengear.com (60.241.24.90) by
	SN1NAM04FT011.mail.protection.outlook.com (10.152.88.104) with
	Microsoft SMTP
	Server id 15.20.1643.11 via Frontend Transport; Mon, 4 Mar 2019 01:29:48
	+0000
Received: from galangal.danc.bne.opengear.com (danc.bne.opengear.com
	[192.168.254.90])
	by postman.bne.opengear.com (Postfix) with ESMTPS id 3A072DFC4C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Mar 2019 11:29:46 +1000 (AEST)
Received: by galangal.danc.bne.opengear.com (Postfix, from userid 1090)
	id 1445A4295AAF; Mon,  4 Mar 2019 11:29:46 +1000 (AEST)
From: Dan Callaghan <dan.callaghan@opengear.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
In-Reply-To: <CAMKF1sr02V8Ngj=ou1UyukoeuMDZ3GgMuVriDxJ45vr7JRFJHQ@mail.gmail.com>
References: <20190225061757.24421-1-dan.callaghan@opengear.com>
	<CAMKF1so7ONWosmZ8ZLoESHnb9tRiWqA2tBYq=SstnoXq9CP0mw@mail.gmail.com>
	<1551245877-sup-2492@galangal.danc.bne.opengear.com>
	<CAMKF1sr02V8Ngj=ou1UyukoeuMDZ3GgMuVriDxJ45vr7JRFJHQ@mail.gmail.com>
Date: Mon, 4 Mar 2019 11:29:46 +1000
Message-ID: <1551662949-sup-8386@galangal.danc.bne.opengear.com>
User-Agent: Sup/0.22.1
X-EOPAttributedMessage: 0
X-Forefront-Antispam-Report: CIP:60.241.24.90; IPV:CAL; CTRY:AU; EFV:NLI;
	SFV:NSPM;
	SFS:(10009020)(346002)(136003)(376002)(396003)(39830400003)(2980300002)(448002)(189003)(199004)(316002)(36906005)(966005)(356004)(76176011)(478600001)(336012)(305945005)(11346002)(229853002)(186003)(7636002)(26005)(106466001)(126002)(8676002)(246002)(26826003)(52956003)(476003)(85326001)(5820100001)(6266002)(42186006)(486006)(8936002)(93886005)(4744005)(103686004)(6916009)(6306002)(47776003)(90966002)(426003)(23676004)(2906002)(446003)(5660300002)(2870700001)(44832011)(58126008)(6246003)(50466002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:BN8PR15MB3218;
	H:postman.bne.opengear.com; FPR:; SPF:PermError; LANG:en;
	PTR:brisbane.opengear.com; MX:1; A:1; 
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: c0942e17-6ab3-4d77-d7b9-08d6a040e41f
X-Microsoft-Antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600127)(711020)(4605104)(2017052603328)(7153060);
	SRVR:BN8PR15MB3218; 
X-MS-TrafficTypeDiagnostic: BN8PR15MB3218:|BN8PR15MB3218:|BN8PR15MB3218:|BN8PR15MB3218:|BN8PR15MB3218:
X-MS-Exchange-PUrlCount: 2
X-Microsoft-Exchange-Diagnostics: 1; BN8PR15MB3218;
	20:tdfnBYDuDk9NiT/g7LqtPJPj1RnuNSW/m/WwqTT+T/oIb5xSR2vDhP913QBzE19RxTTQDqu1sFBXiizm301qAV+0WgtXbCHjFXjzm82IG8esLl+1ZbdgEl9OWtZqZI6M3BJPGf0WWBzeYkYoC46pYvY6VEg0Rh9HiPbqqvnkZts=
X-Microsoft-Antispam-PRVS: <BN8PR15MB32181BD452989DBA304801A2B8710@BN8PR15MB3218.namprd15.prod.outlook.com>
X-Forefront-PRVS: 09669DB681
X-Microsoft-Exchange-Diagnostics: =?utf-8?B?MTtCTjhQUjE1TUIzMjE4OzIzOmlNNWJlaTU0czJGeXFoaS9IbUVTbWRvRkhw?=
	=?utf-8?B?S05wVkR5ZHVTNFFQcHoxcTBpRmJPU3lsdnVpc1VTZllXSCtUL2hWRzlGdzE1?=
	=?utf-8?B?K1I2Q3I1b25UODRIb1I1bmFLa2xLc1FGN3NDTVlDa080QW5iQUxtSHZNa2tZ?=
	=?utf-8?B?d1V5NVo1Y1FNVGRka3JpZ24yLzBua1RaWjFicnp5QVpNVS9oMDdQRituUGFL?=
	=?utf-8?B?NEFkTmxueSswZ0FuZjhJSy9KUitlbVhXTFRsVmRSTndUbkFpUm8rUVh0MWVx?=
	=?utf-8?B?K28vRys1ZVBsZHRuelc2T1ZXZlk3ekFaK2JIeVZLRW9pcDE5QzAyaWhqZnRK?=
	=?utf-8?B?ZjBhRWZYd3BSRy9RWng1dUFPSGg1eUJ5WHZ5R0lQRkkzT3FIVTlnbTFOT3cx?=
	=?utf-8?B?TkhuSzlsSkpqZldkOGZtNnpqTEdiUVJiOTdpcEhQUHVuMHV6dlZtVTZ6dUdq?=
	=?utf-8?B?UzhpTnBFZloydjVzbWxxMGMraSsrWUZWSjBubGRqZkpxYzcxOWhxQ3lMV29S?=
	=?utf-8?B?S01GeW5oQTBwZUtnV1pZbEZrYVVueTQ5ZUtFUHV1MGVqNjhpSlFFeXA1NmJB?=
	=?utf-8?B?WUJOY043QWdNYU9RWEhEWlU3cS9OalBna2s5RmdDNnFvK0dVVzgrU2lTbUdO?=
	=?utf-8?B?Q295Y2t2RkxEYkNjd1VrUHloSGNoaHJXaWtRUFNEY2NrMllCYWRlcVBaUUR4?=
	=?utf-8?B?SFRsYmRsMVNPaDlvdHp4TlhaWVBUWCtmbUkwTUJ0L3pQWWtGMDdHTy93Q1g2?=
	=?utf-8?B?cGlNMVoydDlhUWZVMHp3aVBDZGd6UVdIaEUzdGprTmI3RlN2Q25jUzI2YmRD?=
	=?utf-8?B?dURqQ2hoN1lSckl2RUJ6UEhNMEd1NnRhaGxUb1h2VytiWkI5S1F4SDBDOG5k?=
	=?utf-8?B?eW5JejNpcHI5M1lhMUJJMTJ0QytZZ0Zza1BJS2pncUhZL2ppckROYTdsZE5B?=
	=?utf-8?B?ZVJndzBSQTBVUEpQUXZpWDZkUkc2Zm4wUTFsOG9QaWk3WmdrZFQrdXF0azk2?=
	=?utf-8?B?b01FakY1WjBkbnA3UHYxcjFYbFRuVHlmUWFzKzdxcloxTDlDeloveVpDVzdF?=
	=?utf-8?B?Rk16OTBFbzhySS9CYTNBTWIvbHlYWjdKQVg1UURaN3hBRE5ZeCsya1MrWDhq?=
	=?utf-8?B?WG42dkNzTmJSc0dmQUU0eThBci9uanZWMG1CRUhZYTlPUVpJa0tzbXluaS9G?=
	=?utf-8?B?NTdUUFc0QWNLYWRLa1hOL2htQVhsOEI3NllsYk12bkZVUmhJZGRhNUprUEZG?=
	=?utf-8?B?UzJCMG54NXRvczFUYlRrQ3A4M2hrVEZvdkFIQlpEMTZza3BwTWlkMVowYVNK?=
	=?utf-8?B?UDIydEZTT1BKWUVxRkgyVlY4amloNW9yZDFabVBTamZDaEVDN3E5U3hsUXAw?=
	=?utf-8?B?OXZpRDkvOTNmUEZVY0tBU1M2anlPMDFHQVJrckdYdWFNUlE4dDFUSVZ2VmNt?=
	=?utf-8?B?aUJWZk1lM2V1R090ZGcvZXdTM2JMUDZpZllTRkQ1MnNwdzQ4T2k5cFliU3Ir?=
	=?utf-8?Q?jh1Mr1onUHeCL1RrxOXPRfUiaJ37+4VRkLzds9pgqfmxEi?=
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam-Message-Info: I5UxWW5csU0pVcpbukZpBUq8vA/lSbPLlJ3IUGGpbCsbbo5GhxgOdNi2Gh5HIVvFKJqh2phhy1Bj6KyX5gOuZSYQOsoGVysaCB9CAa/NPvDUkesFB+oRZ1hVwzCcFgyD9zjWSy53LHqHDXj/x1Qia8ZAZjD5AfUceaRDQd9uAxUiIpPQv0ZIq/HeAmpJlYYOrly/PG2DpcUtUcgxdzkMjSuqJKspJvOP5ZfGXPA4jMgiu0EgeXKw6PdkF/HhLqOOkG7HMlbm7Q0id93aLYGrEJHRN/XGdYfEGHVVamaJu+WSE/RQVuFXpMV5KpByO7+DpVCxqsY5OtF7RqxGekthK33RtUw8u2BdF2bpo0AGCCyTqN8G+bfVRPzcZRMKxmBfw4S6AmNicsNqdvVKiGD3XNsyoZJYt016EpG/OewmHio=
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2019 01:29:48.1053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0942e17-6ab3-4d77-d7b9-08d6a040e41f
X-MS-Exchange-CrossTenant-Id: a6251c26-d21f-4164-a225-1f4eaebf5f9a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=a6251c26-d21f-4164-a225-1f4eaebf5f9a; Ip=[60.241.24.90];
	Helo=[postman.bne.opengear.com]
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN8PR15MB3218
X-Microsoft-Exchange-Diagnostics: 1; BN8PR15MB3218;
	23:56KxxNqW6TUDKKmhPZMT+grn6lwoue/Y2fIbv4D66v8oiTGtyzmqiB4QCxdIHZgYpd18FByvbDMTIJ56Py63CPrqP25IBAZGGIKSucX8fEwM5uLmu95EqFIvmIgAFoHC6omxiRQOvG4HFFp98670Dg==
X-OriginatorOrg: opengear.com
Subject: Re: [meta-networking][PATCH] firewalld: add new recipe
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
X-List-Received-Date: Mon, 04 Mar 2019 23:29:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit

Excerpts from Khem Raj's message of 2019-02-28 09:41:39 -08:00:
> fails to configure
> 
> https://errors.yoctoproject.org/Errors/Details/230627/

Ah sorry, we don't use systemd in our distro so I hadn't properly tested 
that configuration. Will post a v3.

-- 
Dan Callaghan <dan.callaghan@opengear.com>
Software Engineer
Opengear <https://opengear.com/>

