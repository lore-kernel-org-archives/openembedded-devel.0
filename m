Return-Path: <luca.fancellu@arm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FD14CDB46E
	for <webhook@archiver.kernel.org>; Thu, 12 Oct 2023 09:56:51 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.89])
 by mx.groups.io with SMTP id smtpd.web11.7725.1697104605202516565
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Oct 2023 02:56:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=83sGV3wn;
 dkim=pass header.i=@armh.onmicrosoft.com header.s=selector2-armh-onmicrosoft-com header.b=83sGV3wn;
 spf=pass (domain: arm.com, ip: 40.107.22.89, mailfrom: luca.fancellu@arm.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0CkEY6j/W2EPqqtBXtvDIXtNJq9a6gSnajQuqoyPzI=;
 b=83sGV3wn9uuDxlvoa78qyypMcDKpEs1oiQazIJ/CUN+3TLBh6Ar5mG97nrpDy+C8sYhBJjwS4jFh3QrKhVLqszKFaZw2yzYhNqgpMFGQ4QH/dp+H7r2csZrlfPgLc3nTplxphPomOcApXgPsC7p58b6M4vJKm7x933OvBV8vWME=
Received: from AS9PR05CA0241.eurprd05.prod.outlook.com (2603:10a6:20b:493::6)
 by AS8PR08MB8441.eurprd08.prod.outlook.com (2603:10a6:20b:569::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.45; Thu, 12 Oct
 2023 09:56:40 +0000
Received: from AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:20b:493:cafe::b4) by AS9PR05CA0241.outlook.office365.com
 (2603:10a6:20b:493::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38 via Frontend
 Transport; Thu, 12 Oct 2023 09:56:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
 pr=C
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 AM7EUR03FT055.mail.protection.outlook.com (100.127.141.28) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6886.29 via Frontend Transport; Thu, 12 Oct 2023 09:56:40 +0000
Received: ("Tessian outbound d219f9a4f5c9:v211"); Thu, 12 Oct 2023 09:56:40 +0000
X-CheckRecipientChecked: true
X-CR-MTA-CID: 719506ecc5a52fec
X-CR-MTA-TID: 64aa7808
Received: from dcce6fc0c0cc.2
	by 64aa7808-outbound-1.mta.getcheckrecipient.com id 69A83C25-7F4E-4FCA-9AAF-F429A361E3F6.1;
	Thu, 12 Oct 2023 09:56:33 +0000
Received: from EUR05-DB8-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id dcce6fc0c0cc.2
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Thu, 12 Oct 2023 09:56:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XZt85J9T6VXmo03PBPXPJIosLtaadwN3qRXVI1H/KYZuHesIdTtplD0TRHXwWXVNdjSzAHMVd/bNU8YJZ4oeBunY8+UURlVj+D364l2zTNHsTQ1abIbFZSAn1TeQnkJWKbMvlSkDAUpJ814LjckdzEd7ZBurAfr8Z/Y0DTbpKpqupTou9zfNTuHfaD+hFesrT3VtsA+CKB59t/KTuKxCxV82iU5n+0dLo2R7fZOWbJME5O5a7DLuYoZ4EnuBUwE97c4KdAXaE3OcR/h8MWwQH463Vx6uDXfsIrssevdYWFt8ZLhs+XzT13fD+VtxbNPdHDJ6IRdndhXRtY+sXNJvEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O0CkEY6j/W2EPqqtBXtvDIXtNJq9a6gSnajQuqoyPzI=;
 b=jU/k/i4PVlE9S6WaYNrBAuR/fBYIuQzO9mJze6VCbfPwQ8q85DLLecFeMi7KL+ptnpr14MuNcSdeJ73SfjRbdxoFWeNgPiQMcIq800HmW2En8/132HylNx+K0CDpCLLL5wxtj/GDFJEmCNZGeoe5cux9JcwXDtWb4iVkPbcNOtv5aBwrr6+Z5vL29pOCAtxfrPUqOyutc8qK32WNq4dr8uCM6DTJE8HmKjjTbUHguCUV9fx1TfU+KEFt9hpteySD5+Evtog5KafhWUz23ax4Qc35ByBROv3xekv+v5goKvCLGs4tDWMH7yTvbuO9OC8uO3MUBh92mjI5+aUIuKCZtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O0CkEY6j/W2EPqqtBXtvDIXtNJq9a6gSnajQuqoyPzI=;
 b=83sGV3wn9uuDxlvoa78qyypMcDKpEs1oiQazIJ/CUN+3TLBh6Ar5mG97nrpDy+C8sYhBJjwS4jFh3QrKhVLqszKFaZw2yzYhNqgpMFGQ4QH/dp+H7r2csZrlfPgLc3nTplxphPomOcApXgPsC7p58b6M4vJKm7x933OvBV8vWME=
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com (2603:10a6:20b:8f::22)
 by AS2PR08MB9319.eurprd08.prod.outlook.com (2603:10a6:20b:599::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.37; Thu, 12 Oct
 2023 09:56:31 +0000
Received: from AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338]) by AM6PR08MB3749.eurprd08.prod.outlook.com
 ([fe80::501a:489c:410b:338%7]) with mapi id 15.20.6863.043; Thu, 12 Oct 2023
 09:56:31 +0000
From: Luca Fancellu <Luca.Fancellu@arm.com>
To: Khem Raj <raj.khem@gmail.com>
CC: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>, Diego Sueiro
	<Diego.Sueiro@arm.com>, Rahul Singh <Rahul.Singh@arm.com>
Subject: Re: [oe] [meta-oe][PATCH 3/3] linuxptp: add systemd services
Thread-Topic: [oe] [meta-oe][PATCH 3/3] linuxptp: add systemd services
Thread-Index: AQHZ/GdyAyCpKBloHk6qHTQwtJqbLbBF6+WA
Date: Thu, 12 Oct 2023 09:56:31 +0000
Message-ID: <0AF6ED9B-AD74-4DC5-B65F-F1EE861818AA@arm.com>
References: <20231011163346.1856498-1-luca.fancellu@arm.com>
 <20231011163346.1856498-4-luca.fancellu@arm.com>
 <CAMKF1so89orai-uOFF3pKRUze2v9BEC6s5Yy7K8DFjWFH_CPyQ@mail.gmail.com>
In-Reply-To: 
 <CAMKF1so89orai-uOFF3pKRUze2v9BEC6s5Yy7K8DFjWFH_CPyQ@mail.gmail.com>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-mailer: Apple Mail (2.3774.100.2.1.4)
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
x-ms-traffictypediagnostic: 
	AM6PR08MB3749:EE_|AS2PR08MB9319:EE_|AM7EUR03FT055:EE_|AS8PR08MB8441:EE_
X-MS-Office365-Filtering-Correlation-Id: 4cce1678-9396-4f85-648d-08dbcb09884d
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: 
 FmZnAMP35B+nS/S3V1P3aBes70021w3IezGrOudK8R25rCoxC9VQ8hNAr947M9Rke8W6fgKWw69CLq8Pnqc5h10qDDgIXYzxwEy1kTMZQHmfhY4q3NLTBIY4vO6L4VJ+lcOaI7zj1/VvkGOcYphCrEaKo81kPpJcNF/i4/gXmm4meQUHi/+t/s2QG4YEdneDBC/ydI+WfEbVurTTKTJDMTNMDrr6CbPJ5YEabo9luct7tZfZbYiIVjg/EP+CrjaXoLa6N2mzQl1bceJPq5FwfM1fM77vDlW8y5lQuwCd4iCgq6p+HDh6RFaElsjv39ZGO9ckVJ0+nHTdW8iPBwN1JQ3UPWvUaOtTnWdHcfrEr870NU8ffiQkZlIapkXQGm8iDJ0sWZwYnKAMLgE3VfbZS46lSpdo5SD7QGmczvLNkcoigZrYciqWYP1Exz5RJ7sBFPC1u9B7K6mAqcKx7dqqZTzH29HNVXZcGKzviIJRwXdmhOvRZi4HRgVdSSoqXXABwoMv1ccMPyXOmuFcgeYTOAlgANw1i+hDub89h4n7kJIuUVpmQ/Kxr2jTvCM7N/Nflw5Jt4IUH/DI4tFUXUJygyW6i13wA5T+fBoAbQiuijIcCzsVQEzJvhcuST6XifxqL8h5/ZPWwrE8j0PLyVo8TQ==
X-Forefront-Antispam-Report-Untrusted: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM6PR08MB3749.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(376002)(346002)(396003)(366004)(230922051799003)(451199024)(186009)(1800799009)(64100799003)(6512007)(6506007)(2616005)(71200400001)(66556008)(2906002)(8936002)(5660300002)(8676002)(66476007)(66446008)(54906003)(76116006)(6916009)(6486002)(66946007)(64756008)(4326008)(26005)(83380400001)(38070700005)(316002)(478600001)(38100700002)(36756003)(33656002)(86362001)(122000001)(91956017)(41300700001)(45980500001);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-ID: <F85B374CBFCDA543B10A7473DF67753F@eurprd08.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS2PR08MB9319
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: 
 AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: 
	5ab2125d-85af-4f56-0546-08dbcb0982e5
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	rtXqJcQJCJYwxSIvcZOMSGks4cpqlPgf0CIZpdtBnO8CcCGM0wPyX5B/TJBDL8+I806ug2sfJZLiUOSZVCciCDm1dfEegcdffltPEH11HpQJBliII+nkjyg+WG679aM47xSK8mI4kmkTbdxToLu8mQkE8z8rkWKCcrBBESJv5q2/XsZ8SgcgCYhAhVGlbrAFQADutUGVFdBP+k/UodOaSH+B4uuLalE4fMQcL4upM+JVGuznPyYpoZGj3Ex1vgtb077lzRe0quFWxOy+St1LmC/944GNSp8o6JRGqI3DeNNLFa5sYyUYbkK9CXQP2VOBdSnhOvH2rhP5WeacQpPeX+6sZG5dpHcMGbOle8e+q1FaP/q/iUBj8FWiUgGYUxcGclkBLVDGhaXQ8YdD7j5PEwxVo2gD8SAmmDbfa3Ar/sVpQ6gc8AH6NhiNaBLzBDL/h1dwSQVOOKDk9HPAwJj5hktdS6raWVwiBZK2N9dX567riTxG/0wmbHqgjUdx87L654EwKGlyqtFxRxQs6VziQytzZgfDELXrJGCRFzUhybO3b/wIkmcLfn9jfL9i1UQNuQshR/7LZcbpnxnYc4y1+LgoMgCdoFRtbbdaQ+wl1k4sAU4DyuVlK0qFZ9eSPxqU1iSpi0dV1kWiYD3u3IpSlp+mr42ksfOguaDEYwOFOVn18Aa3VQivA92jGbXDYd4IB1rNep9fjzS98m+7K0BEKhVvxXEzJ1nY3+Q3djH2bJg=
X-Forefront-Antispam-Report: 
	CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230031)(4636009)(39860400002)(376002)(396003)(136003)(346002)(230922051799003)(186009)(451199024)(82310400011)(64100799003)(1800799009)(40470700004)(46966006)(36840700001)(40480700001)(6512007)(40460700003)(26005)(336012)(2616005)(81166007)(82740400003)(356005)(6486002)(41300700001)(5660300002)(8936002)(8676002)(6862004)(4326008)(86362001)(33656002)(2906002)(316002)(36756003)(70206006)(70586007)(54906003)(6506007)(478600001)(47076005)(36860700001)(83380400001);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Oct 2023 09:56:40.4349
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4cce1678-9396-4f85-648d-08dbcb09884d
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	AM7EUR03FT055.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB8441
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 12 Oct 2023 09:56:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/105443

Hi Khem,

>>=20
>> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2=
sys@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2s=
ys@.service
>> new file mode 100644
>> index 000000000000..dd2512bdca11
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/phc2sys@.se=
rvice
>> @@ -0,0 +1,13 @@
>> +[Unit]
>> +Description=3DSynchronize system clock or PTP hardware clock (PHC)
>> +Documentation=3Dman:phc2sys
>> +Requires=3Dptp4l.service
>> +After=3Dptp4l.service
>> +Before=3Dtime-sync.target
>> +
>> +[Service]
>> +Type=3Dsimple
>> +ExecStart=3D/usr/sbin/phc2sys -w -s %I
>=20
> Can these paths be derived from ${sbindir} during do_install.
>=20
>=20
>> +
>> +[Install]
>> +WantedBy=3Dmulti-user.target
>> diff --git a/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4=
l@.service b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.=
service
>> new file mode 100644
>> index 000000000000..1bad2d72df6b
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/linuxptp/linuxptp/systemd/ptp4l@.serv=
ice
>> @@ -0,0 +1,11 @@
>> +[Unit]
>> +Description=3DPrecision Time Protocol (PTP) service for %I
>> +Documentation=3Dman:ptp4l
>> +After=3Dsys-subsystem-net-devices-%i.device
>> +
>> +[Service]
>> +Type=3Dsimple
>> +ExecStart=3D/usr/sbin/ptp4l -f /etc/linuxptp/ptp4l.conf -i %I
>=20
> Can these paths be derived from ${sbindir} and ${sysconfdir} bitbake vari=
ables
> during do_install ? This should make them more portable

Yes I can do that, for both ${sbindir} and ${sysconfdir}, I see the makefil=
e sets
sbindir =3D $(prefix)/sbin, we already pass ${prefix} in the make command l=
ine,
do you think we should pass also sbindir=3D to ensure consistency?


