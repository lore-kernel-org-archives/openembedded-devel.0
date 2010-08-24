Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <openembedded@rkmorris.us>) id 1Onjyp-0004NV-Cd
	for openembedded-devel@lists.openembedded.org;
	Tue, 24 Aug 2010 05:15:25 +0200
Received: from server ([unknown] [71.170.86.183]) by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0L7M00D2EZODCSB0@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	23 Aug 2010 22:14:38 -0500 (CDT)
Received: from server [127.0.0.1] by server (Axigen)
	with ESMTPSA id 39B1D7; Mon, 23 Aug 2010 22:14:37 -0500
Received: from [192.168.1.3] by rkmorris.us with HTTP; Mon,
	23 Aug 2010 22:14:36 -0500
From: <openembedded@rkmorris.us>
Date: Mon, 23 Aug 2010 22:14:36 -0500
X-Mailer: Axigen WebMail
To: openembedded-users@linuxtogo.org, openembedded-issues@linuxtogo.org,
	openembedded-devel@lists.openembedded.org
Message-id: <1282619676244726500@rkmorris.us>
In-reply-to: <1282482111330517500@rkmorris.us>
References: <1282482111330517500@rkmorris.us>
Importance: Normal
MIME-version: 1.0
X-AxigenVirus-Level: 1
X-AxigenSpam-Level: 5
X-SA-Exim-Connect-IP: 206.46.173.19
X-SA-Exim-Rcpt-To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Mail-From: openembedded@rkmorris.us
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	MIME_QP_LONG_LINE autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: H1940 Boot Issue
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
X-List-Received-Date: Tue, 24 Aug 2010 03:15:25 -0000
Content-Type: text/plain;
	charset="utf-8"
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi,
One more observation after a bit of debugging here - I am able to use my OE=
 generated kernel with an older (non-OE) initrd was able to find ... so it =
seems that the OE generated file system / initrd is the issue. I have tried=
 using a ramdisk, and also a SD partition, to debug the issue - but the boo=
t hangs before anything is written to the log files (on the SD partition).
Any suggestions how to debug this?
Thanks!


On Sun, Aug 22, 2010 08:01  AM, <openembedded@rkmorris.us> wrote:
>=20
>=20
 *      1024x768=20
 *=20
 *    Clean            false  false  false    EN-US  X-NONE  X-NONE        =
                               MicrosoftInternetExplorer4       =20
>   =20
>                                                                          =
                                                                           =
                                                                           =
                                                                           =
     /* Style Definitions */  table.MsoNormalTable	{mso-style-name:"Table N=
ormal";	mso-tstyle-rowband-size:0;	mso-tstyle-colband-size:0;	mso-style-nos=
how:yes;	mso-style-priority:99;	mso-style-qformat:yes;	mso-style-parent:"";=
	mso-padding-alt:0in 5.4pt 0in 5.4pt;	mso-para-margin:0in;	mso-para-margin-=
bottom:.0001pt;	mso-pagination:widow-orphan;	font-size:11.0pt;	font-family:=
"Calibri","sans-serif";	mso-ascii-font-family:Calibri;	mso-ascii-theme-font=
:minor-latin;	mso-hansi-font-family:Calibri;	mso-hansi-theme-font:minor-lat=
in;	mso-bidi-font-family:"Times New Roman";	mso-bidi-theme-font:minor-bidi;=
}     Hi,
=20
My apologies in advance =E2=80=93 as this is a fairly basicoperating questi=
on (so likely just me doing something stupid =E2=80=A6 L), and I=E2=80=99m =
notsure which list to post this to =E2=80=A6 so for now I=E2=80=99m posting=
 to allthree (so sorry for the spam!).
=20
I am trying to get OpenEmbeddedrunning on my iPAQ 1940. I have to do this m=
yself, asAngstrom does not seem to have a build setup for this target hardw=
are. However,I have been able to follow the OE wiki, and have the build up =
and running justfine now =E2=80=93 or at least I=E2=80=99m able to generate=
 all the requiredoutputs it seems =E2=80=A6 I say this, because it=E2=80=99=
s not quite working on myiPAQ. Let me explain what I see =E2=80=A6
=20
1)     The kernel does seem to come up fine =E2=80=93 andif I turn kernel l=
ogging on (using loglevel in thecommand line passed over by HaRET) I do see=
 expectedoutputs on the screen (as I=E2=80=99m directing console output to =
tty0).
2)     I seem to get to the point where the kernel istrying to launch the f=
ile system =E2=80=93 but that=E2=80=99s where everything justseems to hang.=
 I see a message about loading a RAMDISK (if I use initrd), or mounting the=
 file system if I create apartition and file system on my SD card. The same=
 result in either case =E2=80=93the RAMDISK / mount message, then a console=
 output noting that some initial memoryhas been freed up =E2=80=A6 then not=
hing more. The system is not dead, as I doget messages on the console if I =
plug / unplug the USB cable, or if I presskeys on the iPAQ =E2=80=A6 but th=
e system does notboot.
3)     I took the same initrdimages and tried running them under QEMU (I re=
ally did try to debug this myselffirst! =E2=80=A6 J).I have to use a differ=
ent kernel =E2=80=A6 which I don=E2=80=99t quite understandyet, so if someo=
ne could explain this also I would appreciate it, but that=E2=80=99sa side =
issue. In any case, QEMU boots off its own kernel (for an ARM processoralso=
), and they happily launches my initrd and worksjust fine. I have tried thr=
ee images =E2=80=A6 console-image, x11-image, and opie-image =E2=80=93 they=
 all work fine in QEMU (but not onthe iPAQ itself).
4)     I tried moving from initrd(RAMDISK) to the file system on the SD car=
d, hoping then to see someinformation in the Linux logs that would help me =
out (i.e. /var/log),but after I (forcefully) reboot the iPAQ and pull theSD=
 card back out there is nothing here =E2=80=A6 so no help unfortunately.
=20
Does anyone have any debugging tricks or pointers that theycan pass on to m=
e? I=E2=80=99m definitely open to any suggestions! Of course, ifyou have se=
en similar issues and know how to resolve this it would be greatlyappreciated. Unfortunately I seem to be stuck right now.
=20
Thanks in advance for your help!!!
=20
=20

