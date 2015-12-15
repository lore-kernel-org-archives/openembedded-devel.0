Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f43.google.com (mail-vk0-f43.google.com
	[209.85.213.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2D40B6FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 23:38:03 +0000 (UTC)
Received: by mail-vk0-f43.google.com with SMTP id a188so16299484vkc.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 15:38:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=VFunjZlRM4v8eh5bTqtBVqE1wWbvvvhts6nuJGuUllQ=;
	b=Q/EM6f/cqaGt+Esax3SAjBEkVDqGqnaL30ZfewOe/fIvrW1ePcLMXi+OUoWo05a6mZ
	PZZjwq7wOgpR/lINSxAaJXjW/DVmAnyBlQVpU2WBPJBeCN8eC6+/MsieCqLJJ71mm0wc
	zjF/AAT/J6SD1TAR/bmpkRVa+X9wlFmwuF1g/zwZmg0ljn55v8H+x8aH+5A/N88f8+l4
	wTmTFoNRfyKWOmG/5zcnOFEPZeZE6uneNPk7m/ZxNbWV2Dljv7GDLDfhMFX5vYqqaOdi
	CnZD1uaWQ4MBrI54HRbiIpUIm9EqwTyoYSeF3PMwciUiQCBzfWJWQz2xJ/B2xfKGld+Z
	Gupw==
X-Received: by 10.31.3.207 with SMTP id f76mr12234736vki.15.1450222684323;
	Tue, 15 Dec 2015 15:38:04 -0800 (PST)
MIME-Version: 1.0
Received: by 10.31.166.146 with HTTP; Tue, 15 Dec 2015 15:37:44 -0800 (PST)
In-Reply-To: <e230104b40e44ffd95a1dc7dab186765@XCH-ALN-008.cisco.com>
References: <CADySD0Eg_YH_kr7K73+58q+8ZmfeysPV1vECwQZ=HKNxN6hjZg@mail.gmail.com>
	<db278e3a48e24cc1b48e6630554815c0@XCH-ALN-008.cisco.com>
	<CADySD0FqHWC57y4YOeMMENAzisbzpewuY=asaubzgsvN_MXLSg@mail.gmail.com>
	<e230104b40e44ffd95a1dc7dab186765@XCH-ALN-008.cisco.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Wed, 16 Dec 2015 12:37:44 +1300
Message-ID: <CADySD0Hwn4_ywxE9pTRLKXy8eAnErsV7u5cwiMp83Mw_aGZX-Q@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: QT5 application NOT generating core dump upon receiving segmentation fault
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
X-List-Received-Date: Tue, 15 Dec 2015 23:38:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Julien,

I am getting core dumps after exporting QT_QPA_ENABLE_TERMINAL_KEYBOARD=3D1

Many thanks for your help.

After going through void qt_signal_handler(int sig), I also noticed that if
I don't export QT_QPA_ENABLE_TERMINAL_KEYBOARD but export
QT_CRASH_OUTPUT=3D/home/coredump.log , then also there is no core dump in
/home/coredump.log
What else am I missing here ?=E2=80=8B


regards
Ankur

"Knowledge is knowing tomato is a fruit, wisdom is not putting it in a
fruit salad"

On Wed, Dec 16, 2015 at 12:25 AM, Julien Brianceau (jbriance) <
jbriance@cisco.com> wrote:

> Just to be sure, can you try the following export before launching your Q=
t
> app on your target:
>
>     export QT_QPA_ENABLE_TERMINAL_KEYBOARD=3D1
>
> It could workaround the signal handler installation, cf.
> http://code.qt.io/cgit/qt/qtbase.git/tree/src/platformsupport/fbconvenien=
ce/qfbvthandler.cpp?h=3D5.4#n71
>
> Julien
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Ankur
> Tyagi
> Sent: mardi 15 d=C3=A9cembre 2015 12:06
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] QT5 application NOT generating core dump upon receiving
> segmentation fault
>
> Hi,
>
> I am using Qt5.4.1 with eglfs QPA.
>
> Is there a way to avoid qt signal handler during compilation ? I would li=
ke
> avoid patching Qt code.
>
> Thanks
> Ankur
> On 16-Dec-2015 12:00 am, "Julien Brianceau (jbriance)" <jbriance@cisco.co=
m
> >
> wrote:
>
> > Hi,
> >
> > What exact version of Qt5 and which Qt QPA platform do you use with you=
r
> > kit ?
> >
> > A quick grep shows this:
> >
> http://code.qt.io/cgit/qt/qtbase.git/tree/src/corelib/kernel/qcrashhandle=
r.cpp?h=3D5.5#n409
> ,
> > it could explain your issue if it is called.
> >
> > Julien
> >
> > -----Original Message-----
> > From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> > openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Ankur
> > Tyagi
> > Sent: mardi 15 d=C3=A9cembre 2015 11:27
> > To: openembedded-devel@lists.openembedded.org
> > Subject: [oe] QT5 application NOT generating core dump upon receiving
> > segmentation fault
> >
> > Hi,
> >
> > I am running a QT5 based application on TI AM335x EVM kit. I am using
> > meta-arago daisy configuration.
> >
> > My system is configured to generate core dump and core dumps are
> generated
> > whenever application receives segmentation fault (expected).
> >
> > But when my QT5 based application received SIGSEGV, then no core dump i=
s
> > generated. It dies without "Segmentation fault" message on stdout.
> >
> > To debug this further, I added nullptr dereference in my application
> main()
> > before QApplication object is created and when executed, core dump was
> > created.
> > When I moved nullptr dereference after QApplication object is created,
> then
> > no core dump was created. Application died without any message.
> >
> > So it seems QT is handling SIGSEGV and not allowing to create core dump=
.
> >
> > Is it expected ? I believe not. What wrong am I doing and how to fix
> this ?
> >
> > thanks
> > Ankur
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

