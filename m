Return-Path: <lewis.muhlenkamp@stryker.com>
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
	(mail-eopbgr710041.outbound.protection.outlook.com [40.107.71.41])
	by mail.openembedded.org (Postfix) with ESMTP id 918C66B96C
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Jan 2019 04:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=stryker.com;
	s=selector2;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
	bh=RcIPZtVALl9ihYrvO+yCGNfnCi41XLlXG+mkqEcF+54=;
	b=KFaTGlpXlkbv1+PEbt5rnjgeA3IO55ucp3IT3PcWIkfPyzwezFukiFNImIzD1JOc2bOyhnXBX/UJ23llRX6iWqUNehJf1AxCtPN6r4fny5q2mzNn81CbgXtWPMAs3pLyofYz3y9k7qyp/as/mGOk9t/xamSftIkO2Gr+sXj9gr0=
Received: from DM6PR01MB4636.prod.exchangelabs.com (20.177.216.161) by
	DM6PR01MB4108.prod.exchangelabs.com (20.176.105.13) with Microsoft SMTP
	Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
	15.20.1558.16; Wed, 23 Jan 2019 21:01:43 +0000
Received: from DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33]) by DM6PR01MB4636.prod.exchangelabs.com
	([fe80::9147:8c0b:ee2:6d33%3]) with mapi id 15.20.1537.031;
	Wed, 23 Jan 2019 21:01:43 +0000
From: "Muhlenkamp, Lewis" <lewis.muhlenkamp@stryker.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Thread-Topic: DATETIME seems to be getting updated
Thread-Index: AdSzXLh32X32/CN4S0Wp1vZ2xsrXJw==
Date: Wed, 23 Jan 2019 21:01:43 +0000
Message-ID: <DM6PR01MB4636E8A23560DB48A9F733678F990@DM6PR01MB4636.prod.exchangelabs.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=lewis.muhlenkamp@stryker.com; 
x-originating-ip: [165.225.32.61]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; DM6PR01MB4108;
	20:wtEFMxHebB1UQIRaUMPeC6AH9jmlQZevSFyUbXQcXQAZOXj9xrfJ+ErroyaPYFb4MHi/n4r2lfUyPgZMhFO7Nm2g3zY13y8sJqTodpk7XTdTcTcmz6CtPVaGT685ThyQbOV8DwXE+DnvkiB/lM6s+x9eA0DCHCdRj2q+Mh8L+S9Qz18IxWAOJ1upZkmbHp5JN5nHewIdMHJ+VzCjZxPLzLI9kvSTzt/qsCGFjCB1w+gQ4VNvygqZ3D6ql9o5dUEd;
	23:2eGDIuFv9dcGujwUc8MutqBLH2A3BIXIgXwUIS6jMPSdx31Z1sGPGr+hSpoWX/B1avHnmUZniiaH+ZTIx+VfK6r+2oAJJgivqRpgW/LcWLWdN/0se3K9k965gs1RaMIEy0dtQe+7ClcBo2PVaTJ1yg==
x-ms-office365-filtering-correlation-id: 1e299499-979e-4676-ea31-08d68175fa8d
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0; PCL:0;
	RULEID:(2390118)(7020095)(4652040)(8989299)(5600110)(711020)(4605077)(4618075)(4534185)(7168020)(4627221)(201703031133081)(201702281549075)(8990200)(2017052603328)(7167020)(7153060)(7193020);
	SRVR:DM6PR01MB4108; 
X-MS-TrafficTypeDiagnostic: DM6PR01MB4108:|DM6PR01MB4108:
x-microsoft-antispam-prvs: <DM6PR01MB41086A77D2F2FFCA10E915128F990@DM6PR01MB4108.prod.exchangelabs.com>
x-forefront-prvs: 0926B0E013
x-forefront-antispam-report: SFV:NSPM;
	SFS:(10009020)(346002)(39860400002)(366004)(136003)(396003)(376002)(189003)(199004)(15650500001)(25786009)(6916009)(2420400007)(478600001)(9326002)(2906002)(10710500007)(33656002)(68736007)(97736004)(7110500001)(316002)(7696005)(71190400001)(7736002)(53936002)(74316002)(71200400001)(106356001)(105586002)(256004)(186003)(6116002)(476003)(8936002)(66066001)(99286004)(8676002)(102836004)(55016002)(14454004)(26005)(790700001)(55236004)(6506007)(9686003)(6436002)(6306002)(54896002)(86362001)(486006)(81166006)(81156014)(3846002);
	DIR:OUT; SFP:1101; SCL:1; SRVR:DM6PR01MB4108;
	H:DM6PR01MB4636.prod.exchangelabs.com; FPR:; SPF:None; LANG:en;
	PTR:InfoNoRecords; MX:1; A:1; 
received-spf: None (protection.outlook.com: stryker.com does not designate
	permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: JGRkOrrrX2QlmDqTr5EcLS9CJCLZMozqIBXS6gdS1g5MhJiXDl4etH4NH/6NwCR67k7WFd5aWomaDO8BxCkEsfRMF+719uTU36+AkeMtcKLOr5mY1lhmp14PbnuQPzNt20y7g1P9QUaqur1GK2+W35VZQsHR+IgRi40TLTRn4kZgbK62ZzXP8ud3P+Cpul1emvvyBE+kAn7ESWIIQqp3JxMbvD9YQrr43bg2ot/SkKIGA277UD/RKmDGGIZ4wTJHXXokunq0TsAz3qwqCE5+X8UwolUFjUJ1QSOWITJzWnoJtJhASgxd/lLL/xguQA8Yq46xzjmXIif/Qyu2y1jO50jnxa2fajXziDR1YjIexLJjJvmGJUcgfr+WfTG5VwrHpHWeZxdDJKCjEfktPErkD2OyfHHeGtHEZ9nzi+vGyPE=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e299499-979e-4676-ea31-08d68175fa8d
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Jan 2019 21:01:43.3094 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e9dbbfb-394a-4583-8810-53f81f819e3b
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR01MB4108
X-OriginatorOrg: stryker.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: DATETIME seems to be getting updated
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
X-List-Received-Date: Thu, 24 Jan 2019 04:32:40 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hello,

It appears that the DATETIME variable is being updated.  From what I read t=
his should not be happening, correct?

I want to include into the /etc/os-release the timestamp associated with th=
e build.  The ISO I create has that timestamp in its name.  I figured this =
would be a good way of keeping track of which image I installed.

I put the following into my local.conf file

    DISTRO_VERSION ?=3D "${DATETIME}"


When I run "bitbake -e core-image-minimal | grep '^DATETIME=3D'", and then =
"bitbake -e core-image-minimal | grep _date_", everything shows up with hav=
ing the same datetime value.  However, when I do the actual bitbake build, =
I get different values.

The name of my most recent ISO is core-image-minimal-intel-corei7-64-201901=
23183514.iso.

The VERSION and VERSION_ID strings in /etc/os-release on the target VM have=
 20190123182555.

I could not find anything in some cursory greps of the different layer dire=
ctories finding where DATETIME gets updated multiple times.  So, surprised =
that I have different values.

Also, in a couple of builds I got error messages like the following:

=3D=3D=3D Start ERROR messages =3D=3D=3D
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb.do_install, the basehash value ch=
anged from 6b53ad9daacf50cf3963fe9b33d67109 to b48c00441dc775ec13e33397d5be=
3b7d. The metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: base-files-3.0.14-r89 do_install: Taskhash mismat=
ch 9b77f8c3b1da203560564376ac6ab9f3 versus 0e74d1ce2642ed224a6ecc04d44fc7d8=
 for /home/lmuhlenkamp/oe-core/meta/recipes-core/base-files/base-files_3.0.=
14.bb.do_install
20190123182535.log:ERROR: Taskhash mismatch 9b77f8c3b1da203560564376ac6ab9f=
3 versus 0e74d1ce2642ed224a6ecc04d44fc7d8 for /home/lmuhlenkamp/oe-core/met=
a/recipes-core/base-files/base-files_3.0.14.bb.do_install
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb.do_install, the basehash value ch=
anged from 6b53ad9daacf50cf3963fe9b33d67109 to b48c00441dc775ec13e33397d5be=
3b7d. The metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb.do_install, the basehash value ch=
anged from 6b53ad9daacf50cf3963fe9b33d67109 to b48c00441dc775ec13e33397d5be=
3b7d. The metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb.do_install, the basehash value ch=
anged from 6b53ad9daacf50cf3963fe9b33d67109 to b48c00441dc775ec13e33397d5be=
3b7d. The metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/os-release/os-release.bb.do_compile, the basehash value changed f=
rom eb9dd6843133966143e503adeb3391af to 367cb7da87f3447116c5ef0ebab2fc56. T=
he metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: os-release-1.0-r0 do_compile: Taskhash mismatch 0=
fed1c21203c903b141b34e4cce6ce41 versus e71d060b8708e6420f1271ad3d046b1c for=
 /home/lmuhlenkamp/oe-core/meta/recipes-core/os-release/os-release.bb.do_co=
mpile
20190123182535.log:ERROR: Taskhash mismatch 0fed1c21203c903b141b34e4cce6ce4=
1 versus e71d060b8708e6420f1271ad3d046b1c for /home/lmuhlenkamp/oe-core/met=
a/recipes-core/os-release/os-release.bb.do_compile
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/os-release/os-release.bb.do_compile, the basehash value changed f=
rom eb9dd6843133966143e503adeb3391af to 367cb7da87f3447116c5ef0ebab2fc56. T=
he metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/os-release/os-release.bb.do_compile, the basehash value changed f=
rom eb9dd6843133966143e503adeb3391af to 367cb7da87f3447116c5ef0ebab2fc56. T=
he metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/os-release/os-release.bb.do_compile, the basehash value changed f=
rom eb9dd6843133966143e503adeb3391af to 367cb7da87f3447116c5ef0ebab2fc56. T=
he metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb.do_install, the basehash value ch=
anged from 6b53ad9daacf50cf3963fe9b33d67109 to b48c00441dc775ec13e33397d5be=
3b7d. The metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/os-release/os-release.bb.do_compile, the basehash value changed f=
rom eb9dd6843133966143e503adeb3391af to 367cb7da87f3447116c5ef0ebab2fc56. T=
he metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/base-files/base-files_3.0.14.bb.do_install, the basehash value ch=
anged from 6b53ad9daacf50cf3963fe9b33d67109 to b48c00441dc775ec13e33397d5be=
3b7d. The metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/os-release/os-release.bb.do_compile, the basehash value changed f=
rom eb9dd6843133966143e503adeb3391af to 367cb7da87f3447116c5ef0ebab2fc56. T=
he metadata is not deterministic and this needs to be fixed.
20190123182535.log:ERROR: When reparsing /home/lmuhlenkamp/oe-core/meta/rec=
ipes-core/os-release/os-release.bb.do_compile, the basehash value changed f=
rom eb9dd6843133966143e503adeb3391af to 367cb7da87f3447116c5ef0ebab2fc56. T=
he metadata is not deterministic and this needs to be fixed.
=3D=3D=3D End ERROR messages =3D=3D=3D

I do not get these errors all of the time.  I never get them if I do not ha=
ve DISTRO_VERSION defined to use DATETIME in the local.conf file.

Am I missing something?  Do I have something misconfigured?  Have I found a=
 bug?

I would appreciate if anyone could shed any light on this.

Thank you

Lewis Muhlenkamp


