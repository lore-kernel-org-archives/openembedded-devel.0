Return-Path: <f.suligoi@asem.it>
Received: from smtp.asem.it (smtp.asem.it [151.22.69.122])
	by mail.openembedded.org (Postfix) with ESMTP id AE60A60620
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 12:39:43 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 4.0.1) with ESMTP id SG002422523.MSG 
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Nov 2016 13:39:40 +0100AS
Received: from ASAS013.asem.intra ([172.16.16.50]) by ASAS014.asem.intra
	([172.16.16.51]) with mapi id 14.03.0319.002;
	Mon, 14 Nov 2016 13:39:41 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-browser] Chromium crash start the test
	www.html5test.com
Thread-Index: AQHSPm7z2zmPIcpxwUyzDFgQ7/2XZKDYajh2
Date: Mon, 14 Nov 2016 12:39:40 +0000
Message-ID: <3A8890C59B0943428C1CECF15A6881A743327DD3@ASAS013.asem.intra>
References: <3A8890C59B0943428C1CECF15A6881A74332681B@ASAS013.asem.intra>,
	<e9a8aedbf732444598e003ce0c553ab9@XCH-ALN-008.cisco.com>
In-Reply-To: <e9a8aedbf732444598e003ce0c553ab9@XCH-ALN-008.cisco.com>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.16.17.75]
MIME-Version: 1.0
X-SGHeloLookup-Result: pass smtp.helo=webmail.asem.it (ip=172.16.16.51)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0206.5829B08D.00BD, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
Subject: Re: [meta-browser] Chromium crash start the test	www.html5test.com
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
X-List-Received-Date: Mon, 14 Nov 2016 12:39:45 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Julien,=0A=
=0A=
I have two recurring errors.=0A=
The first one:=0A=
=0A=
imx6dl:~# export DISPLAY=3D:0.0=0A=
imx6dl:~# google-chrome =0A=
[837:837:1114/133445:ERROR:sandbox_linux.cc(338)] InitializeSandbox() calle=
d with multiple threads in process gpu-process=0A=
[811:811:1114/133447:ERROR:surface_display_output_surface.cc(100)] Not impl=
emented reached in virtual void cc::SurfaceDisplayOutputSurface::SetBeginFr=
ameSource(cc::SurfaceId, cc::BeginFrameSource*)=0A=
[811:811:1114/133451:ERROR:surface_display_output_surface.cc(100)] Not impl=
emented reached in virtual void cc::SurfaceDisplayOutputSurface::SetBeginFr=
ameSource(cc::SurfaceId, cc::BeginFrameSource*)=0A=
[811:811:1114/133451:ERROR:delegated_frame_host.cc(543)] Not implemented re=
ached in virtual void content::DelegatedFrameHost::SetBeginFrameSource(cc::=
SurfaceId, cc::BeginFrameSource*)=0A=
[811:811:1114/133451:ERROR:delegated_frame_host.cc(543)] Not implemented re=
ached in virtual void content::DelegatedFrameHost::SetBeginFrameSource(cc::=
SurfaceId, cc::BeginFrameSource*)=0A=
[811:811:1114/133451:ERROR:delegated_frame_host.cc(543)] Not implemented re=
ached in virtual void content::DelegatedFrameHost::SetBeginFrameSource(cc::=
SurfaceId, cc::BeginFrameSource*)=0A=
/usr/bin/google-chrome: line 11:   811 Segmentation fault      /usr/bin/chr=
omium/chrome ${CHROME_EXTRA_ARGS} $@=0A=
imx6dl:~# =0A=
=0A=
=0A=
The second one, cause by a big alloc of over 1.5 GBytes of RAM (my board ha=
s 1GB of RAM):=0A=
=0A=
imx6dl:~# export DISPLAY=3D:0.0=0A=
imx6dl:~# google-chrome www.google.com=0A=
[933:933:1114/133638:ERROR:sandbox_linux.cc(338)] InitializeSandbox() calle=
d with multiple threads in process gpu-process=0A=
[907:907:1114/133639:ERROR:surface_display_output_surface.cc(100)] Not impl=
emented reached in virtual void cc::SurfaceDisplayOutputSurface::SetBeginFr=
ameSource(cc::SurfaceId, cc::BeginFrameSource*)=0A=
[907:907:1114/133639:ERROR:delegated_frame_host.cc(543)] Not implemented re=
ached in virtual void content::DelegatedFrameHost::SetBeginFrameSource(cc::=
SurfaceId, cc::BeginFrameSource*)=0A=
[907:907:1114/133639:ERROR:delegated_frame_host.cc(543)] Not implemented re=
ached in virtual void content::DelegatedFrameHost::SetBeginFrameSource(cc::=
SurfaceId, cc::BeginFrameSource*)=0A=
[907:907:1114/133649:ERROR:delegated_frame_host.cc(543)] Not implemented re=
ached in virtual void content::DelegatedFrameHost::SetBeginFrameSource(cc::=
SurfaceId, cc::BeginFrameSource*)=0A=
[907:907:1114/133650:ERROR:delegated_frame_host.cc(543)] Not implemented re=
ached in virtual void content::DelegatedFrameHost::SetBeginFrameSource(cc::=
SurfaceId, cc::BeginFrameSource*)=0A=
tcmalloc: large alloc 1518362624 bytes =3D=3D (nil) @ =0A=
[907:923:1114/133650:FATAL:memory_linux.cc(43)] Out of memory.=0A=
#0 0x00005524ab52 <unknown>=0A=
#1 0x00005525a4fa <unknown>=0A=
#2 0x000055268096 <unknown>=0A=
#3 0x0000580ecdb6 tc_newarray=0A=
#4 0x0000555440be <unknown>=0A=
#5 0x000055544144 <unknown>=0A=
#6 0x000056c213d8 <unknown>=0A=
#7 0x000056c84b72 <unknown>=0A=
#8 0x000056c84f1a <unknown>=0A=
#9 0x000056c9078e <unknown>=0A=
#10 0x000056d3411a <unknown>=0A=
#11 0x000056c8ca30 <unknown>=0A=
#12 0x000056c94ee8 <unknown>=0A=
#13 0x000056c8e5ae <unknown>=0A=
#14 0x000056c8f1aa <unknown>=0A=
#15 0x00005528e182 <unknown>=0A=
#16 0x00005525e24a <unknown>=0A=
#17 0x00005525e7ca <unknown>=0A=
#18 0x00005525ea9c <unknown>=0A=
#19 0x00005525fdac <unknown>=0A=
#20 0x00005526bb34 <unknown>=0A=
#21 0x00005525dbcc <unknown>=0A=
#22 0x00005527b58c <unknown>=0A=
#23 0x0000552790aa <unknown>=0A=
=0A=
/usr/bin/google-chrome: line 11:   907 Aborted                 /usr/bin/chr=
omium/chrome ${CHROME_EXTRA_ARGS} $@=0A=
rt40-imx6dl:~# =0A=
=0A=
=0A=
=0A=
________________________________________=0A=
Da: openembedded-devel-bounces@lists.openembedded.org [openembedded-devel-b=
ounces@lists.openembedded.org] per conto di Julien Brianceau (jbriance) [jb=
riance@cisco.com]=0A=
Inviato: luned=EC 14 novembre 2016 12.50=0A=
A: openembedded-devel@lists.openembedded.org=0A=
Oggetto: Re: [oe] [meta-browser] Chromium crash start the test  www.html5te=
st.com=0A=
=0A=
Hi,=0A=
=0A=
Do you have a callstack or any debug information about this crash ?=0A=
=0A=
Julien=0A=
=0A=
-----Original Message-----=0A=
From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembedde=
d-devel-bounces@lists.openembedded.org] On Behalf Of Flavio Suligoi=0A=
Sent: vendredi 11 novembre 2016 12:18=0A=
To: openembedded-devel@lists.openembedded.org=0A=
Subject: [oe] [meta-browser] Chromium crash start the test www.html5test.co=
m=0A=
=0A=
Hi all,=0A=
=0A=
I'm using Yocto 2.1 Krogoth, with an i.MX6DL (DualLite) board and the meta-=
browser layer.=0A=
The chromium version is the classic" 48.0.2548.0.=0A=
=0A=
To call the executable I use the switches:=0A=
=0A=
  *   --use-gl=3Degl=0A=
  *   --gpu-no-context-lost=0A=
  *   --ignore-gpu-blacklist=0A=
  *   --user-data-dir=3D/home/root/.chromium/=0A=
=0A=
I use chromium in kiosk mode, with the web address directly written on the =
command line.=0A=
=0A=
This because chromium, when more than one tab is opened, always crashes.=0A=
=0A=
=0A=
Anyway, when I try to test the HTML5 compatibility using the website "www.h=
tml5test.com<http://www.html5test.com>" , chromium crashes immediately, aft=
er downloading the html5 code, even before starting the test.=0A=
=0A=
=0A=
Do you have any solution/patch to solve this problem?=0A=
=0A=
=0A=
Best regards,=0A=
=0A=
=0A=
Flavio=0A=
=0A=
=0A=
P.S.: html5test is a very used and common html5 test and I have to use it t=
o check the html5 compatibility of my board.=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=
--=0A=
_______________________________________________=0A=
Openembedded-devel mailing list=0A=
Openembedded-devel@lists.openembedded.org=0A=
http://lists.openembedded.org/mailman/listinfo/openembedded-devel=0A=

