Return-Path: <flavian.manea@rinftech.com>
X-Greylist: delayed 7218 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 27 Jul 2017 04:30:54 UTC
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
	(mail-db5eur01on0137.outbound.protection.outlook.com [104.47.2.137])
	by mail.openembedded.org (Postfix) with ESMTP id 16BF660806
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 27 Jul 2017 04:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=rinfromania.onmicrosoft.com; s=selector1-rinftech-com;
	h=From:Date:Subject:Message-ID:Content-Type:MIME-Version;
	bh=/kbHKIEgHOGE83hbFhedeTyq6fMLsSB/SgdJKd6vcdk=;
	b=t4HIdYpi2oKKI2Y9BAWybSlSzvAJKkEXokP8bQ4r2R3tJeCuPqoQ7vQNRa2RWbob5727a1W5KMAmRgix0WCPxOh1aYEA2DiVfn2ByYpX4d4NSYOgC/yq6Qf7mcO4cVqhVjImVZrUjzou8+VAUOBVhxp3CyqfdZV+xvgdnrSZSRg=
Received: from VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM (10.167.202.142) by
	VI1PR10MB1709.EURPRD10.PROD.OUTLOOK.COM (10.165.194.30) with Microsoft
	SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
	15.1.1282.10; Wed, 26 Jul 2017 16:22:12 +0000
Received: from VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM
	([fe80::999d:7cc3:ab11:91f6]) by
	VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM
	([fe80::999d:7cc3:ab11:91f6%14]) with mapi id 15.01.1282.020;
	Wed, 26 Jul 2017 16:22:11 +0000
From: Flavian Manea <flavian.manea@rinftech.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: OpenJdk9
Thread-Index: AQHTBinkvBhx7JjCykuDY4N9nd6AUg==
Date: Wed, 26 Jul 2017 16:22:11 +0000
Message-ID: <VI1PR10MB068863542F730ACA8867F5FE8FB90@VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM>
Accept-Language: ro-RO, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
	smtp.mailfrom=flavian.manea@rinftech.com; 
x-originating-ip: [93.122.146.162]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1; VI1PR10MB1709;
	7:5qQ0/3BV1e7mWlKOHEMFaxo8kylYtTPjLPp9OW4oYiq9iS8Bav6RRGFxecWbj4aniXdsgL2yUV9hZjCk32ks9Qchu8jmvLvRc6LRw28fPjDPy6F60FElpbCnfJGpd6Pftojz9YChqmybRmu04JtWC81Q+dNXe4eAnpOMpWdsKe6rmjp4Hi7bqtGT9S4An/ezWdXlNVNWgrd4Jz1OaQRruZq/v1VYON07rNeHF29zlJgRe1+nED6RwMx+R+1NvQSvND0dRO0TahnCC25LI9YKBAsBWdsm4PRIh4XqD5WofEmAL6eyrRPipioLp7jsc/byJUVpKwaKCAmFr/RjCLEKZUfRuuv7X0n5HBa5mfChBjvXMXznsXwquJQypFf0XvZThcEQ05CX///XI+SUwQE33Eef3JdjTaxFb1pHktARyUw1S2toIDxc3fZwryOFjiaDuejFEoIk9bFfLlE8zM+1c1xQB9lwv7/zp47ciGVO2AvW74pAsefBvSOtWsT8Xd1ZkisgFJc1v/CxUW3Nk84vHvDrrVbQTGvJY4Sz3INegHXNMdonZDQd/6I31fwFKv+37x3sv/Ejhyo+PKcuW26d3HhzesOZuzlE1lwskZ6cV7XTz87bDuk5+EVj0Szsf8WqA8luMdqD+gQa8LgG9d9/h/EC1CUeLqZjJkzZWr8YbmECAZgx9w3asS+dhv2+aTt+nF39ST2EfD2fea7zuRIwyLT7cJOg4bffpyZe/4oS0Pkogi1JE8lJFBx+vnikKri5DyWI534myKBHy7ql3HFKN9xuLnxnd+YUS+ud5iag2Rs=
x-forefront-antispam-report: SFV:SKI; SCL:-1; SFV:NSPM;
	SFS:(10019020)(39840400002)(39410400002)(39400400002)(39450400003)(199003)(189002)(6606003)(25786009)(110136004)(189998001)(5660300001)(81156014)(606006)(2900100001)(6436002)(107886003)(105586002)(7116003)(2906002)(19627405001)(5640700003)(8936002)(97736004)(81166006)(2351001)(106356001)(38730400002)(54356999)(8676002)(53936002)(66066001)(101416001)(53386004)(7736002)(2501003)(50986999)(5250100002)(86362001)(4326008)(74316002)(236005)(3846002)(6306002)(9686003)(54896002)(55016002)(102836003)(3280700002)(6916009)(33656002)(6116002)(14454004)(478600001)(68736007)(3660700001)(7696004)(6506006)(298575003);
	DIR:OUT; SFP:1102; SCL:1; SRVR:VI1PR10MB1709;
	H:VI1PR10MB0688.EURPRD10.PROD.OUTLOOK.COM; FPR:; SPF:None;
	PTR:InfoNoRecords; A:1; MX:1; LANG:en; 
x-ms-office365-filtering-correlation-id: faa3dc7a-94e4-4f93-b1d9-08d4d44277fb
x-microsoft-antispam: UriScan:; BCL:0; PCL:0;
	RULEID:(300000500095)(300135000095)(300000501095)(300135300095)(22001)(300000502095)(300135100095)(2017030254075)(300000503095)(300135400095)(2017052603031)(201703131423075)(201702281549075)(300000504095)(300135200095)(300000505095)(300135600095)(300000506095)(300135500095);
	SRVR:VI1PR10MB1709; 
X-MS-TrafficTypeDiagnostic: VI1PR10MB1709:|VI1PR10MB1709:
x-exchange-antispam-report-test: UriScan:;
x-microsoft-antispam-prvs: <VI1PR10MB1709C14311B0A5E0982D64498FB90@VI1PR10MB1709.EURPRD10.PROD.OUTLOOK.COM>
x-exchange-antispam-report-cfa-test: BCL:0; PCL:0;
	RULEID:(100000700101)(100105000095)(100000701101)(100105300095)(100000702101)(100105100095)(6040450)(601004)(2401047)(5005006)(8121501046)(10201501046)(93006095)(93001095)(3002001)(100000703101)(100105400095)(6041248)(20161123564025)(20161123558100)(20161123555025)(2016111802025)(201703131423075)(201702281528075)(201703061421075)(201703061406153)(20161123562025)(20161123560025)(6072148)(6043046)(100000704101)(100105200095)(100000705101)(100105500095);
	SRVR:VI1PR10MB1709; BCL:0; PCL:0;
	RULEID:(100000800101)(100110000095)(100000801101)(100110300095)(100000802101)(100110100095)(100000803101)(100110400095)(100000804101)(100110200095)(100000805101)(100110500095);
	SRVR:VI1PR10MB1709; 
x-forefront-prvs: 038002787A
received-spf: None (protection.outlook.com: rinftech.com does not designate
	permitted sender hosts)
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Jul 2017 16:22:11.0590 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 60914503-8006-4cef-bade-17cd949c5a30
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR10MB1709
X-Microsoft-Exchange-Diagnostics: 1; VI1PR10MB1709;
	23:yfI3x3r9izfotyb52DNW6yyWjT0qOGJmPIiQ8XPBJLCnCfQV1eNQtbVlGjAY1NhFqMqujOq0qQMXcQLYPJOFBBakaggylS5wpxmwXprnXLyL8Ukpd5PlZXFt4pWssts+QnhxAjjlrN19aiqflyfvyQ==
X-OriginatorOrg: rinftech.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Stefan Andritoiu <stefan.andritoiu@rinftech.com>
Subject: OpenJdk9
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
X-List-Received-Date: Thu, 27 Jul 2017 04:30:55 -0000
Content-Language: ro-RO
Content-Type: text/plain; charset="windows-1250"
Content-Transfer-Encoding: quoted-printable

Hello guys,



I am trying to make an openJdk9, based on what have been done on the openJd=
k8 recipes (excluding patches)., and I am struggling with some problems rel=
ating to "./configure" part, in the do_configure step (which is not specifi=
ed in the recipe).


I suspect that yocto/autotools/autoconf tries to look for configure.ac, but=
 in our case, the ./configure script comes directly configured from the rep=
ository and there is no need "regenerate" it.


A part of the log can be seen here:

"

| autoreconf: configure.ac: tracing
| autoreconf: configure.ac: creating directory $TOPDIR/common/autoconf/buil=
d-aux
| autoreconf: cannot create $TOPDIR/common/autoconf/build-aux: No such file=
 or directory
| autoreconf: configure.ac: not using Libtool
| autoreconf: running: /home/fmanea/buildPulsar8/wr-core/build-intel-x86/tm=
p/sysroots/x86_64-linux/usr/bin/autoconf --include=3D/home/fmanea/buildPuls=
ar8/wr-core/build-intel-x86/tmp/work/x86_64-linux/openjdk-9-native/102b14-r=
0/jdk9-d2982a786f53/common/autoconf/ --include=3D/home/fmanea/buildPulsar8/=
wr-core/build-intel-x86/tmp/work/x86_64-linux/openjdk-9-native/102b14-r0/jd=
k9-d2982a786f53/common/autoconf/build-aux/ --force
| autoreconf: configure.ac: not using Autoheader
| autoreconf: configure.ac: not using Automake
| autoreconf: running: gnu-configize
| gnu-configize: cannot create $TOPDIR/common/autoconf/build-aux: No such f=
ile or directory
| cp: cannot create regular file '/common/autoconf/build-aux/': No such fil=
e or directory
| gnu-configize: cp failed with exit status: 1
| autoreconf: gnu-configize failed with exit status: 1
| ERROR: autoreconf execution failed.
| ERROR: Function failed: do_configure (log file is located at /home/fmanea=
/buildPulsar8/wr-core/build-intel-x86/tmp/work/x86_64-linux/openjdk-9-nativ=
e/102b14-r0/temp/log.do_configure.16943)
"


Has anyone struggled with ./configure/make parts in yocto, or is this issue=
 familiar to someone?


Thank you,

Flavian


RINF Tech
Flavian Manea
flavian.manea<mailto:gabriel.simion@rinftech.com>@rinftech.com<mailto:gabri=
el.simion@rinftech.com> | www.rinftech.com<http://www.rinftech.com>
4 Gara Herastrau Street, Building B =96 Skanska Green Court, 3rd floor, 2nd=
 District, Bucharest Romania

