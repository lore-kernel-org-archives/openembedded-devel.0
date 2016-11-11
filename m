Return-Path: <f.suligoi@asem.it>
X-Greylist: delayed 304 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 11 Nov 2016 11:23:06 UTC
Received: from smtp.asem.it (smtp.asem.it [151.22.69.122])
	by mail.openembedded.org (Postfix) with ESMTP id 58235719CE
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2016 11:23:06 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 4.0.1) with ESMTP id SG002420082.MSG 
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Nov 2016 12:18:00 +0100AS
Received: from ASAS013.asem.intra ([172.16.16.50]) by ASAS014.asem.intra
	([172.16.16.51]) with mapi id 14.03.0319.002;
	Fri, 11 Nov 2016 12:18:00 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [meta-browser] Chromium crash start the test www.html5test.com
Thread-Index: AQHSPAzUK43W6vGvQEev/z3uKxBH2g==
Date: Fri, 11 Nov 2016 11:18:00 +0000
Message-ID: <3A8890C59B0943428C1CECF15A6881A74332681B@ASAS013.asem.intra>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.75]
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.51)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0208.5825A8E8.0148, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] Chromium crash start the test www.html5test.com
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
X-List-Received-Date: Fri, 11 Nov 2016 11:23:07 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi all,

I'm using Yocto 2.1 Krogoth, with an i.MX6DL (DualLite) board and the meta-=
browser layer.
The chromium version is the classic" 48.0.2548.0.

To call the executable I use the switches:

  *   --use-gl=3Degl
  *   --gpu-no-context-lost
  *   --ignore-gpu-blacklist
  *   --user-data-dir=3D/home/root/.chromium/

I use chromium in kiosk mode, with the web address directly written on the =
command line.

This because chromium, when more than one tab is opened, always crashes.


Anyway, when I try to test the HTML5 compatibility using the website "www.h=
tml5test.com<http://www.html5test.com>" , chromium crashes immediately, aft=
er downloading the html5 code, even before starting the test.


Do you have any solution/patch to solve this problem?


Best regards,


Flavio


P.S.: html5test is a very used and common html5 test and I have to use it t=
o check the html5 compatibility of my board.








