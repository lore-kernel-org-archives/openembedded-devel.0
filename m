Return-Path: <ceggers@arri.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B92C433F5
	for <webhook@archiver.kernel.org>; Wed, 23 Feb 2022 18:41:38 +0000 (UTC)
Received: from EUR03-DB5-obe.outbound.protection.outlook.com
 (EUR03-DB5-obe.outbound.protection.outlook.com [40.107.4.96])
 by mx.groups.io with SMTP id smtpd.web08.262.1645641694958124434
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 23 Feb 2022 10:41:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@arrigroup.onmicrosoft.com
 header.s=selector1-arrigroup-onmicrosoft-com header.b=VUPJjaGY;
 spf=pass (domain: arri.de, ip: 40.107.4.96, mailfrom: ceggers@arri.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VoRRDHf9LnskMqusOcx5OSp82q2Yj2DkQYAKwsUbGoGAHwCIJYpO1L6ZS67aDOzgvMY6L4tVoRzukceQnAMElVDofyan3peap79AfgHDG3YPjCEMpKvyzsxu0Sv4tllb9i6mAgVIPPSaFtaroeWBD+twMFy3LJbMox1KXePZ+fLSnkgvTRREiUiXPeh8e9m1/iWkrchzQ/n4nAku7nLhjD+AIFEEUglMIwc+X+K4AmzVtLBRP1/KEY1C8kp7q53W07ZX6SCYUhys4QFyhBOrmohCNDx6QIxlPfwvq7Tt4HnIkUg4o7CLVSUlMka3gn07/4iwAIr2FojZVpRkdzgUGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0tINRXR7GYcmXhtb005CumQQENa6uRH+8xbP0KAJTU=;
 b=lTxqZViAVomAFj/M1A6x/prxRUEymlYeNgoHExrwU8HDmcQET9VvgseI7Q40Pt5AlTacyUxlyJoxpnbciT1NKmoKdO/J26d1CsDOeE6X/UntXR/dYZ81tfcj/YyIKDj4lS7rxFg1Wyf7t9pPPV+lfzjduz5ruPIHeiWkNBd9hjQeytoQWz6UKo/c2NBqI9WI/TsPicdPH77C1YGMtf/V+rv3db8hDMIjVjMHZxm09NggDkx4Dcimt5G+fbmsjzacIUPqkI8kuG4psPV3cEajnIlEA0GLLX/uuF3YjPWVIM1U6/DE9G19gzsPAH6btNpEEWJftl7GnGB/4Tr7elgYgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=temperror (sender ip
 is 217.111.95.7) smtp.rcpttodomain=gmail.com smtp.mailfrom=arri.de;
 dmarc=none action=none header.from=arri.de; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=arrigroup.onmicrosoft.com; s=selector1-arrigroup-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D0tINRXR7GYcmXhtb005CumQQENa6uRH+8xbP0KAJTU=;
 b=VUPJjaGYNSUeebxGFcKSS/eb3LDdmVuKSo05HWcRkw3unZx1P1AVi2KtBLlAw8MEo4Fh4X2fZKK8xHnlfyQ/AsP4RtMYK1eiC+v3dxRwAjLIJRPR7vCCnpB+mjBDE9MWhf05G2a1V/p0T/BybHX9di9YiBqMkzyMbcU0xyn7jDw=
Received: from AM7PR04CA0010.eurprd04.prod.outlook.com (2603:10a6:20b:110::20)
 by PA4PR07MB7423.eurprd07.prod.outlook.com (2603:10a6:102:cb::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.9; Wed, 23 Feb
 2022 18:41:31 +0000
Received: from AM5EUR02FT033.eop-EUR02.prod.protection.outlook.com
 (2603:10a6:20b:110:cafe::fa) by AM7PR04CA0010.outlook.office365.com
 (2603:10a6:20b:110::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.27 via Frontend
 Transport; Wed, 23 Feb 2022 18:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=temperror (sender IP is
 217.111.95.7) smtp.mailfrom=arri.de; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arri.de;
Received-SPF: TempError (protection.outlook.com: error in processing during
 lookup of arri.de: DNS Timeout)
Received: from mta.arri.de (217.111.95.7) by
 AM5EUR02FT033.mail.protection.outlook.com (10.152.8.86) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.5017.23 via Frontend Transport; Wed, 23 Feb 2022 18:41:28 +0000
Received: from localhost.localdomain (192.168.54.54) by mta.arri.de
 (10.10.18.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.7; Wed, 23 Feb
 2022 19:41:28 +0100
From: Christian Eggers <ceggers@arri.de>
To: Khem Raj <raj.khem@gmail.com>
CC: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	=?ISO-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>
Subject: Re: [oe] [meta-oe][PATCH RFC] pcapplusplus: add new recipe
Date: Wed, 23 Feb 2022 19:41:27 +0100
Message-ID: <4795452.0VBMTVartN@localhost.localdomain>
Organization: Arnold & Richter Cine Technik GmbH & Co. Betriebs KG
In-Reply-To: 
 <CAMKF1srreo8BKes+3DDnJWjkmu-ZdGqFKeGF7_x3dxUj08xrJQ@mail.gmail.com>
References: <20220222064130.17190-1-ceggers@arri.de>
 <CAMKF1srreo8BKes+3DDnJWjkmu-ZdGqFKeGF7_x3dxUj08xrJQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed; boundary="nextPart2582925.X9hSmTKtgW"
Content-Transfer-Encoding: 7Bit
X-Originating-IP: [192.168.54.54]
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4008a229-e85b-4188-6239-08d9f6fc1aa9
X-MS-TrafficTypeDiagnostic: PA4PR07MB7423:EE_
X-Microsoft-Antispam-PRVS: 
	<PA4PR07MB7423B87B8147E268285D5DD0BF3C9@PA4PR07MB7423.eurprd07.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	yb9YaRoFZXxQkVzMupPK4dxD6oUhL48yjfvCU/pnf4PPOdKKdGwy2b1lWNjIbTGeBL8auNCx0kHxhpiQliR87Rs5LPtYCPIytMLEZdYBwwIXC79PSTW56uy0eqbCuBjIwvVMEfwqbG6pxW6iS0c8tmiOZ1XRTkgvZZNo5aVaSC9nrEMBh4JuZZmRQcf3Uzg7v+Wt6BM3IcYPJE2LmSuP/EMKFi1Ry8Mv3hd4KLh1xo4E5D4LL+1VIrJ5+hRlvG7eWrahvHKil99s5UIGjf+xvaqV9mdsa34rg59OkX03TDAqJpgeMwkkQY7RxBRI6A6OBYj+HEledsvemKxlIL3HyFwOWMLB2tXsh5IMph5Mc1ocpcpwmE5PKGQ3mCN9GEMu8Rc8DfCimL6G9rwqdlQH2kRqYRjxF6QfQuoc8cl8ovDRrtQWAhq/1XKJyi0y/IEL6tXsTY5601M/JYZ5QSUM9FB44MIMdIDKpYqIETuwbe/IbP0fFsTKRy9kLK1i8cGcGYUUSvC3a4/uOwiWawDI6oZzc6yXLIrZceoqGSQ4wwBgNG7It6x1CAeuveUqDmAYA661l/a6/j+lyro2MJ32Q1ja1raO6qmovbQYMtw4oUuM3ngyJQr3CpiII4wDvtYKnipWQGxgXcUDeNSwb1qB1VzbZugWlSfffHAzQ68AkmvB55TEsI7+wNOB00UHczEnX0IUdzxLm5W0LJzbEfAxkljB5LRq8zzIfJ//aVqDwwokYpKi3cok5MWkU1miWep/1vUBO/GZbIHcK8zewWSxpb3oMDhixdsNtzAQAQsiyvVKMAHolhyMh/zJxrXHJpkP
X-Forefront-Antispam-Report: 
	CIP:217.111.95.7;CTRY:DE;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mta.arri.de;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230001)(4636009)(36840700001)(40470700004)(46966006)(54906003)(7696005)(81166007)(6916009)(63350400001)(966005)(316002)(36860700001)(86362001)(36916002)(82310400004)(47076005)(9686003)(4326008)(40460700003)(8676002)(8936002)(186003)(235185007)(2906002)(16526019)(55016003)(26005)(356005)(70586007)(70206006)(508600001)(336012)(5660300002)(426003)(39026012)(36900700001);DIR:OUT;SFP:1102;
X-OriginatorOrg: arri.de
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2022 18:41:28.8666
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 4008a229-e85b-4188-6239-08d9f6fc1aa9
X-MS-Exchange-CrossTenant-Id: e6a73a5a-614d-4c51-b3e3-53b660a9433a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=e6a73a5a-614d-4c51-b3e3-53b660a9433a;Ip=[217.111.95.7];Helo=[mta.arri.de]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM5EUR02FT033.eop-EUR02.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR07MB7423
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 23 Feb 2022 18:41:38 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95484

--nextPart2582925.X9hSmTKtgW
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"

On Wednesday, 23 February 2022, 18:21:00 CET, Khem Raj wrote:
> https://errors.yoctoproject.org/Errors/Details/636127/
> 
> NOTE: Applying patch '0001-Fix-timeval-to-timespec-conversions.patch' (sources/meta-openembedded/meta-oe/recipes-connectivity/pcapplusplus/pcapplusplus/0001-Fix-timeval-to-timespec-conversions.patch)
> ERROR: Applying patch '0001-Fix-timeval-to-timespec-conversions.patch' on target directory 'TOPDIR/build/tmp/work/mips32r2-yoe-linux/pcapplusplus/gitAUTOINC+1360d0ed91-r0/git'
> CmdError('quilt --quiltrc TOPDIR/build/tmp/work/mips32r2-yoe-linux/pcapplusplus/gitAUTOINC+1360d0ed91-r0/recipe-sysroot-native/etc/quiltrc push', 0, 'stdout: Applying patch 0001-Fix-timeval-to-timespec-conversions.patch
> patching file Pcap++/src/NetworkUtils.cpp
> Hunk #1 FAILED at 169 (different line endings).
> Hunk #2 FAILED at 436 (different line endings).
> 2 out of 2 hunks FAILED -- rejects in file Pcap++/src/NetworkUtils.cpp
> patching file Pcap++/src/PcapFileDevice.cpp
> Hunk #1 FAILED at 188 (different line endings).
> 1 out of 1 hunk FAILED -- rejects in file Pcap++/src/PcapFileDevice.cpp
> Patch 0001-Fix-timeval-to-timespec-conversions.patch does not apply (enforce with -f)

After cloning PcapPlusPlus on my machine, Pcap++/src/PcapFileDevice.cpp has
Windows line endings. The patch has the same for changed lines and the
context.

Is there an implicit conversion from Windows to Unix line endings on
the build machine (e.g. by git)? Are line feeds altered on when sent
via `git send-email`?

For reference, I have a attached the patch file to this email.

regards
Christian
--nextPart2582925.X9hSmTKtgW
Content-Disposition: attachment;
	filename="0001-Fix-timeval-to-timespec-conversions.patch.gz"
Content-Transfer-Encoding: base64
Content-Type: application/gzip;
	name="0001-Fix-timeval-to-timespec-conversions.patch.gz"

H4sICLB/FmIAAzAwMDEtRml4LXRpbWV2YWwtdG8tdGltZXNwZWMtY29udmVyc2lvbnMucGF0Y2gA
zVZbb9pIFH6OpfyHo1baQIxvYG5utwpKG22kTYoSqn2IIjQeH2C2Zux6xhC07X/fMzYkZJOmfejD
SsCMz23OfPN9Hs6KbAn90B/2gzgOuwEGQdjHYMiC2A+Hg7DTS9qdTjv2g/awAxeZhGvMIeiD70fV
B9q+H1hnVCaC00UhlBZMwof5HAsFbzlWkxNWFMJN8J31nmmMTJ0WtAM4w5jy220IOlG3E4VDsP3A
963rMv4buY7gZjyanP5xC2fiDrRY4oqljs4cM1U5cuCZXFF9kUllWROyAkWUqKBAXRYSE4g3MEdt
ErJZwjaNJizYCmEpeJEppPxEgZDWtngU6dW0JDusFyJF2C1EdjWVxi4USCZ3qa71NJMieiHEQkOD
aUiRKQ2Em8qouzxlepYVS9Vs1StYeyus7ldg6ZptFBylmZwfuTCSgHd5KjjV5KacMBv8UoqCNqgz
i60ykYDzlySYs7WQc1izQtKoPCRLYdr8lCtdIFs615rpUkVAGC+F1lThZqF1riLPmwu9KGOXZ0tP
YcqS2Btzlo/TUpmvl5dp6g2C8NayrsWcwHWy2cyJNz918I7jWGDK2banCu5dol5nxedPWqTK5XkO
AF8hBNv+T5yZnhFQ73ElOFaRX6ENNkW1YUYOBXzB5ByTFnToJBUW2tChYTeNIcEU62enaVmJmM3A
cWifwLyXmolf8lpCJngHcRLPBv1ZyDsD33X7pJZuZ9juI0+AONwLQ7Pnl9exbNv+wVonJ+AEvWGr
D3Y9kOGC8VGSFKgU7MdHETH9wdc4H6/CXZzIzaxVIfunWG3hPCZ8aLTgwPOAEz00UX5R0z4r9SE5
7qW2tcHv8I+xHxzIbO0SZw1lbWBFPqkDWoeW8+A1iji0bDIo4p3gU8Pft4bX7xp7IXBsMPObpvK3
N/R7WPdESYXhfE5qJj67MKHu6kc0KkgyiUZcpEjqu6DmaRPEhAVKjvCKuhoz/hn1FXKBK0xeVdIp
pRGHydMLkmiddFhBTS88A3U9kGEfwydY7zkbSidRRBIzhReZ0pIt8Rm4fwHUiVT/Q6ipqyvqnpSG
PwX296T4jN7jl/1bOfbimR/yIEk6AXPddrfX7Yah3+dd/7tyfKbWE0E+E1NJcjCoJFkNZIizLIVd
7BXtEIs6oyLKJd7pmoiNK7auZ79BsZs26QRKIfVgqo8hv9jUVroqGVFA4hq2zpv8s14khUvLpChv
zeEdLHHJ803jUVYL8kcP+1lNk/VazEj5M0Hv8Mb4dDSeTq4no4vxdHz14fT8+vzj5fRydPmxaej1
QEpl+LgrptWWkK3Hloph396A58XIGT3BmliTo7mK13S9VJcn1Lcn5AUxxVzecLRNPapuP65Llqab
+qI1lP5xE08p/6St5q/uC15jqtAcAum+5Hr3D6Xu8n79CnCURHjC0wGr7XZCN7CsfwF34bfHewkA
AA==


--nextPart2582925.X9hSmTKtgW--

