Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta12.messagelabs.com (mail1.bemta12.messagelabs.com
	[216.82.251.4])
	by mail.openembedded.org (Postfix) with ESMTP id A5D2460132
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Jan 2015 16:51:27 +0000 (UTC)
Received: from [216.82.249.147] by server-4.bemta-12.messagelabs.com id
	61/8F-03166-E86BBC45; Fri, 30 Jan 2015 16:51:26 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-2.tower-29.messagelabs.com!1422636685!36678667!1
X-Originating-IP: [66.77.174.14]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 16236 invoked from network); 30 Jan 2015 16:51:26 -0000
Received: from mail.mx2.digi.com (HELO mcl-sms-ns2.DIGI.COM) (66.77.174.14)
	by server-2.tower-29.messagelabs.com with RC4-SHA encrypted SMTP;
	30 Jan 2015 16:51:26 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx2.digi.com
	(172.16.1.14) with Microsoft SMTP Server (TLS) id 8.3.389.2;
	Fri, 30 Jan 2015 10:51:09 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 30 Jan 2015 10:51:24 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0224.002;
	Fri, 30 Jan 2015 17:51:22 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and
	dizzy
Thread-Index: AdA8rPh2Zfsck6QFTD2cTRlgCM//eA==
Date: Fri, 30 Jan 2015 16:51:22 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB0D86B1@dor-sms-xch01.digi.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.188]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Subject: [meta-networking] crda-1.1.3 broken in dylan, dora, daisy and dizzy
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
X-List-Received-Date: Fri, 30 Jan 2015 16:51:30 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Seems that CRDA maintainers did some changes that broke the fetch of the pa=
ckage for all those releases.

These are the URIs in the package recipe:

http://wireless.kernel.org/download/crda/crda-1.1.3.tar.bz2
http://wireless.kernel.org/download/wireless-regdb/regulatory.bins/2013.01.=
11-regulatory.bin

The correct ones are:

https://www.kernel.org/pub/software/network/crda/crda-1.1.3.tar.bz2
https://www.kernel.org/pub/software/network/wireless-regdb/wireless-regdb-2=
013.01.11.tar.bz2

Notice that they not only changed the address but also now the regulatory b=
inary is packed in a tarball.

So at this point there are two options here:

1. Rework the recipe with the new locations, checksums and adapting the 'do=
_install' to copy the regulatory binary from a different directory. This ha=
s to be done for all the releases in the subject.

2. Just put the 'crda-1.1.3.tar.bz2' and '2013.01.11-regulatory.bin' in the=
 openembedded mirror and let all the old releases work without changes in t=
he recipes.

My preference is number 2, along with an upgrade of the package to the new =
version 3.13 for the not-yet-released 'master' branch (there is currently a=
 patch for that in the mailing list).

Comments?

-
Javier Viguera
Software Engineer


