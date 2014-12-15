Return-Path: <Javier.Viguera@digi.com>
Received: from mail1.bemta7.messagelabs.com (mail1.bemta7.messagelabs.com
	[216.82.254.101])
	by mail.openembedded.org (Postfix) with ESMTP id CE9397113B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 15 Dec 2014 17:05:25 +0000 (UTC)
Received: from [216.82.254.195] by server-5.bemta-7.messagelabs.com id
	23/4D-03132-5D41F845; Mon, 15 Dec 2014 17:05:25 +0000
X-Env-Sender: Javier.Viguera@digi.com
X-Msg-Ref: server-16.tower-200.messagelabs.com!1418663119!22292732!1
X-Originating-IP: [66.77.174.13]
X-StarScan-Received: 
X-StarScan-Version: 6.12.5; banners=-,-,-
X-VirusChecked: Checked
Received: (qmail 29806 invoked from network); 15 Dec 2014 17:05:20 -0000
Received: from mail.mx3.digi.com (HELO mcl-sms-ns1.digi.com) (66.77.174.13)
	by server-16.tower-200.messagelabs.com with RC4-SHA encrypted SMTP;
	15 Dec 2014 17:05:20 -0000
Received: from MCL-VMS-XCH01.digi.com (10.5.8.49) by mail.mx1.digi.com
	(172.16.1.13) with Microsoft SMTP Server (TLS) id 8.3.377.0;
	Mon, 15 Dec 2014 11:05:27 -0600
Received: from DOR-VMS-XCH01.digi.com (10.49.8.98) by MCL-VMS-XCH01.digi.com
	(10.5.8.49) with Microsoft SMTP Server (TLS) id 14.3.210.2;
	Mon, 15 Dec 2014 11:05:18 -0600
Received: from DOR-SMS-XCH01.digi.com ([fe80::894b:3bdc:74ae:6efc]) by
	DOR-VMS-XCH01.digi.com ([::1]) with mapi id 14.03.0210.002;
	Mon, 15 Dec 2014 18:05:17 +0100
From: "Viguera, Javier" <Javier.Viguera@digi.com>
To: "'openembedded-devel@lists.openembedded.org'"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: Dizzy backports
Thread-Index: AdAYiUncxqUKFMf9Tr+wt3ODZ7DW5g==
Date: Mon, 15 Dec 2014 17:05:15 +0000
Message-ID: <DA8287CC96892A4EB4FCF4FB3FBDA1AB091792@dor-sms-xch01.digi.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.101.2.188]
x-kse-antivirus-interceptor-info: scan successful
x-kse-antivirus-info: Clean
MIME-Version: 1.0
Subject: Dizzy backports
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
X-List-Received-Date: Mon, 15 Dec 2014 17:05:26 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

Hi all,

Could the following commits be considered for Dizzy backporting? The first =
one is absolutely needed as the SRC_URI for imagemagick is currently wrong =
in Dizzy. The second one would be nice to have as it removes a possible sec=
urity hole.

Both of them are just a cherry-pick away so I don't include here the patche=
s.

commit 7e034ebd5424a19a1a3a6d7a0d00f3c0b138359a
Author: Peter Bigot <pab@pabigot.com>
Date:   Sat Nov 1 16:27:23 2014 -0500

    imagemagick: update URI to allow fetching current and previous releases
   =20
    The only version available at the original URI is patch 9.  All release=
s
    are available at the /releases sub-path.
   =20
    Signed-off-by: Peter A. Bigot <pab@pabigot.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


commit 56dd9cb399f55223899dbee60a384f752cbc5db7
Author: Javier Viguera <javier.viguera@digi.com>
Date:   Wed Nov 26 09:34:14 2014 +0100

    xserver-common: disable TCP connections
   =20
    For security reasons disable TCP connections to the xserver.
   =20
    Signed-off-by: Javier Viguera <javier.viguera@digi.com>
    Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>


-- jviguera

