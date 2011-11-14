Received: from mail-am1.bigfish.com ([213.199.180.138]
	helo=AM1EHSOBE002.bigfish.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <B29882@freescale.com>) id 1RQ1r5-0005dd-Ry
	for openembedded-devel@lists.openembedded.org;
	Mon, 14 Nov 2011 20:06:08 +0100
Received: from mail30-am1-R.bigfish.com (10.3.201.243) by
	AM1EHSOBE002.bigfish.com (10.3.204.22) with Microsoft SMTP Server id
	14.1.225.22; Mon, 14 Nov 2011 18:59:16 +0000
Received: from mail30-am1 (localhost [127.0.0.1])	by mail30-am1-R.bigfish.com
	(Postfix) with ESMTP id 4967D58048D	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 19:00:16 +0000 (UTC)
X-SpamScore: -12
X-BigFish: VS-12(zz9371K1432N98dKzz1202hzz8275bhz2dh2a8h668h839h8e2h8e3h)
X-Forefront-Antispam-Report: CIP:70.37.183.190; KIP:(null); UIP:(null); IPV:NLI;
	H:mail.freescale.net; RD:none; EFVD:NLI
X-FB-SS: 13,
Received: from mail30-am1 (localhost.localdomain [127.0.0.1]) by mail30-am1
	(MessageSwitch) id 1321297216221425_5749;
	Mon, 14 Nov 2011 19:00:16 +0000 (UTC)
Received: from AM1EHSMHS004.bigfish.com (unknown [10.3.201.254])	by
	mail30-am1.bigfish.com (Postfix) with ESMTP id 319AA700043	for
	<openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2011 19:00:16 +0000 (UTC)
Received: from mail.freescale.net (70.37.183.190) by AM1EHSMHS004.bigfish.com
	(10.3.207.104) with Microsoft SMTP Server (TLS) id 14.1.225.22;
	Mon, 14 Nov 2011 18:59:13 +0000
Received: from 039-SN1MPN1-002.039d.mgd.msft.net ([169.254.2.83]) by
	039-SN1MMR1-001.039d.mgd.msft.net ([10.84.1.13]) with mapi id
	14.01.0339.002; Mon, 14 Nov 2011 12:59:39 -0600
From: McClintock Matthew-B29882 <B29882@freescale.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] GCC Error
Thread-Index: AQHMov+P3c/H1X3ltEmCHoq9Qg2a8A==
Date: Mon, 14 Nov 2011 18:59:39 +0000
Message-ID: <CAEsOVNf_5HnBQHuJpuOrAXJQDhhoM7kAF5L56bCF=fBFeOjxyA@mail.gmail.com>
References: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
In-Reply-To: <CALJpqJz0x63nDkXuJe3Xp9k014gyaMnONpFUWtds5VNCUrTnrA@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [99.47.177.27]
MIME-Version: 1.0
X-OriginatorOrg: freescale.com
Subject: Re: GCC Error
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 14 Nov 2011 19:06:08 -0000
Content-Language: en-US
Content-Type: text/plain; charset="iso-8859-1"
Content-ID: <E18B8CC857347442909958E254F6FB03@freescale.net>
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 14, 2011 at 12:55 PM, David Thomas
<david.thomas@microbee-systems.com> wrote:
> I am getting a gcc error
>
> cc1: error: -Werror=3Dunused-but-set-variable: No option -Wunused-but-set=
-variable
>
> Using the Angstrom scripts I can run machine=3Dbeagleboard and complete.
> However, machine=3Dcm-t35 with a cm-t35.conf file throws this error.
>
> I am having to guess that the machine file is all that was required,
> it seems to pich all the right arch, etc.
>
> I had asked on Angstrom for any CM-T35 related info to no avail...

This error is on by default for the compiler for OE now. You can get
around it by

1) Fixing the (potential) errors in the source code
2) Turning off the error in the build (EXTRA_CFLAGS =3D
"-Wno-error=3Dunused-but-set-variable" or something similiar)

-M=



