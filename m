Return-Path: <bevenson@melinkcorp.com>
X-Greylist: delayed 7180 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 16 Apr 2015 18:28:11 UTC
Received: from na01-bl2-obe.outbound.protection.outlook.com
	(mail-bl2on0127.outbound.protection.outlook.com [65.55.169.127])
	by mail.openembedded.org (Postfix) with ESMTP id E7CDB6ABF7
	for <Openembedded-devel@lists.openembedded.org>;
	Thu, 16 Apr 2015 18:28:11 +0000 (UTC)
Received: from BN3PR0501MB1092.namprd05.prod.outlook.com (25.160.113.139) by
	BN3PR0501MB1124.namprd05.prod.outlook.com (25.160.113.146) with
	Microsoft
	SMTP Server (TLS) id 15.1.136.25; Thu, 16 Apr 2015 15:55:22 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com (25.160.113.12) by
	BN3PR0501MB1092.namprd05.prod.outlook.com (25.160.113.139) with
	Microsoft
	SMTP Server (TLS) id 15.1.136.25; Thu, 16 Apr 2015 15:55:21 +0000
Received: from BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) by
	BN3PR0501MB1090.namprd05.prod.outlook.com ([25.160.113.12]) with
	mapi id 15.01.0136.026; Thu, 16 Apr 2015 15:55:21 +0000
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "Openembedded-devel@lists.openembedded.org"
	<Openembedded-devel@lists.openembedded.org>
Thread-Topic: util-linux: Data file clash for lastb with sysvinit
Thread-Index: AdB4XT1KKxtJB05wQDO9bxnPLAE+XQ==
Date: Thu, 16 Apr 2015 15:55:21 +0000
Message-ID: <BN3PR0501MB1090943C5B3B41A6BF6D49E8BBE40@BN3PR0501MB1090.namprd05.prod.outlook.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 00E341C50099E400E34312
authentication-results: lists.openembedded.org; dkim=none (message not signed)
	header.d=none;
x-originating-ip: [98.100.91.242]
x-microsoft-antispam: UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1092;
	UriScan:; BCL:0; PCL:0; RULEID:; SRVR:BN3PR0501MB1124; 
x-forefront-antispam-report: BMV:1; SFV:NSPM;
	SFS:(10019020)(6009001)(33656002)(54356999)(50986999)(102836002)(66066001)(2656002)(46102003)(92566002)(87936001)(40100003)(74316001)(62966003)(86362001)(110136001)(2501003)(450100001)(229853001)(2351001)(77156002)(2900100001)(107886001)(76576001)(99286002);
	DIR:OUT; SFP:1102; SCL:1; SRVR:BN3PR0501MB1092;
	H:BN3PR0501MB1090.namprd05.prod.outlook.com; FPR:; SPF:None;
	MLV:sfv; LANG:en; 
x-microsoft-antispam-prvs: <BN3PR0501MB1092F0D75B370A76CF9D0E2DBBE40@BN3PR0501MB1092.namprd05.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(601004)(5002010)(5005006); SRVR:BN3PR0501MB1092; BCL:0;
	PCL:0; RULEID:; SRVR:BN3PR0501MB1092; 
x-forefront-prvs: 0548586081
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Apr 2015 15:55:21.2444 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: d06db0f9-efcc-42b5-9f8c-c934a01c9bfd
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN3PR0501MB1092
X-OriginatorOrg: melinkcorp.com
Subject: util-linux: Data file clash for lastb with sysvinit
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 16 Apr 2015 18:28:13 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All,

I've been working through several issues in order to get a clean upgrade an=
d I'm down to my last couple.  I found a conflict between sysvinit and util=
-linux that I have no idea how to handle and I'm looking for some help.  I'=
m using sysvinit for init and opkg for package management.

I am upgrading a system that is on poky/dylan-1.4.4 up to poky/dizzy-1.7.1.=
  One of the errors I see during upgrade is the following:

* check_data_file_clashes: Package util-linux wants to install file /usr/bi=
n/lastb
        But that file is already provided by package  * sysvinit

The chain I've found for the files on my system are:
/usr/bin/lastb -> last
/usr/bin/last -> /usr/bin/last.sysvinit

When I check which package owns lastb ("opkg search /usr/bin/lastb") opkg s=
ays util-linux has that file.  However, I don't see anything in the util-li=
nux recipe that mentions lastb.  I don't know how this softlink is getting =
created or how util-linux is the owner.

Any ideas on how util-linux is getting ownership of lastb and how to resolv=
e this conflict with sysvinit?

Regards,
Bryan

