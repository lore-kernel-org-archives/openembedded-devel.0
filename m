Return-Path: <f.suligoi@asem.it>
Received: from smtp.asem.it (smtp.asem.it [151.22.69.122])
	by mail.openembedded.org (Postfix) with ESMTP id 2E25A7762B
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 13:18:49 +0000 (UTC)
Received: from webmail.asem.it by asem.it (smtp.asem.it)
	(SecurityGateway 4.0.1) with ESMTP id SG002482162.MSG 
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 14:18:47 +0100S
Received: from ASAS044.asem.intra (172.16.16.44) by ASAS044.asem.intra
	(172.16.16.44) with Microsoft SMTP Server (TLS) id 15.1.225.42;
	Thu, 22 Dec 2016 14:18:48 +0100
Received: from ASAS044.asem.intra ([::1]) by ASAS044.asem.intra ([::1]) with
	mapi id 15.01.0225.041; Thu, 22 Dec 2016 14:18:48 +0100
From: Flavio Suligoi <f.suligoi@asem.it>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [OE][meta-qt5] Runtime error with qt5.7
Thread-Index: AQHSW31TdqiV16rJ006UbtWQtIMkqaETaYgAgACKCIw=
Date: Thu, 22 Dec 2016 13:18:48 +0000
Message-ID: <4a4f95b4feb6470aa17f9fbe6c841038@asem.it>
References: <32e1bacb35684936a5f570af7030495a@asem.it>,
	<65F88FD8-A243-4EC7-83FE-B59F8DF721FE@gmail.com>
In-Reply-To: <65F88FD8-A243-4EC7-83FE-B59F8DF721FE@gmail.com>
Accept-Language: it-IT, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ms-exchange-messagesentrepresentingtype: 1
x-originating-ip: [172.16.17.75]
MIME-Version: 1.0
X-SGHeloLookup-Result: hardfail smtp.helo=webmail.asem.it (does not match
	172.16.16.44)
X-SGSPF-Result: none (smtp.asem.it)
X-SGOP-RefID: str=0001.0A0B0206.585BD2B9.0027, ss=1, re=0.000, recu=0.000,
	reip=0.000, cl=1, cld=1, fgs=0 (_st=1 _vt=0 _iwf=0)
Subject: Re: [meta-qt5] Runtime error with qt5.7
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
X-List-Received-Date: Thu, 22 Dec 2016 13:18:50 -0000
Content-Language: it-IT
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi Raj,

I've already used in my image .bb recipe the parameter:

DISTRO_FEATURES +=3D "x11 opengl"

to enable the "-opengl desktop" swith in qtbase_git.bb receipe, but It does=
n't work, I always have this error.

Any other idea or other point where start to investigate?
Or do you have a image recipe with x11 and the QT5.7 ?

Thanks,

Flavio

________________________________________
Da: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-b=
ounces@lists.openembedded.org> per conto di Khem Raj <raj.khem@gmail.com>
Inviato: gioved=EC 22 dicembre 2016 07:00
A: openembedded-devel@lists.openembedded.org
Oggetto: Re: [oe] [OE][meta-qt5] Runtime error with qt5.7

> On Dec 21, 2016, at 4:50 AM, Flavio Suligoi <f.suligoi@asem.it> wrote:
>
> QXcbIntegration: Cannot create platform OpenGL context, neither GLX nor E=
GL are enabled
> Failed to create OpenGL context for format QSurfaceFormat(version 2.0, op=
tions QFlags(), depthBufferSize 24, redBufferSize -1, greenBufferSize -1, b=
lueBufferSize -1, alphaBufferSize -1, stencilBufferSize 8, samples -1, swap=
Behavior 2, swapInterval 1, profile  0)
> Aborted

You might want to check if you have enabled egl in PACKAGECONFIG for qtbase=
 may be you need to enable opengl in DISTRO_FEATURES and/or set
packageconfig for qtbase
--
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.openembedded.org/mailman/listinfo/openembedded-devel

