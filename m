Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-vk0-f42.google.com (mail-vk0-f42.google.com
	[209.85.213.42])
	by mail.openembedded.org (Postfix) with ESMTP id 3DE656FFCE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 11:05:46 +0000 (UTC)
Received: by mail-vk0-f42.google.com with SMTP id a189so2985658vkh.2
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Dec 2015 03:05:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=B/0p/iS1EjmAooM8mRtcNP2WYhrImWVfKBbeL0Gtb6c=;
	b=zSkTUxzk+QoObySXzuSqYbPmq+qtGXI2/Ameg5MjQjUo8ZPIn3CUiokUuSlEtdNBoi
	JBhsziCoIMqpQfDJEdx/C2Fd8Zsyhau7uAJKDcwYgoZ/SGJhOsvCayGROmksU4me3FZg
	8BSH1mO1O7mgvYgd96q/1vSJcygScaIbX7eb0dFDZbDIyyabY6Xpl7pDssaaaZkil8y+
	n+JpH1KoaLHulZycykiXrnYx9aIvLLQvNEmzPyE39xws5idNR8MVokX50VyX0M5N241X
	YCAtXxfm9aZBgpz4p1GiN2X5J9Shv5t0D5VWlvgy2wJdXwyMhk/mG8wX+FzVAhZ0X/z7
	cJLQ==
MIME-Version: 1.0
X-Received: by 10.31.152.195 with SMTP id a186mr26034929vke.137.1450177547201; 
	Tue, 15 Dec 2015 03:05:47 -0800 (PST)
Received: by 10.31.166.146 with HTTP; Tue, 15 Dec 2015 03:05:47 -0800 (PST)
Received: by 10.31.166.146 with HTTP; Tue, 15 Dec 2015 03:05:47 -0800 (PST)
In-Reply-To: <db278e3a48e24cc1b48e6630554815c0@XCH-ALN-008.cisco.com>
References: <CADySD0Eg_YH_kr7K73+58q+8ZmfeysPV1vECwQZ=HKNxN6hjZg@mail.gmail.com>
	<db278e3a48e24cc1b48e6630554815c0@XCH-ALN-008.cisco.com>
Date: Wed, 16 Dec 2015 00:05:47 +1300
Message-ID: <CADySD0FqHWC57y4YOeMMENAzisbzpewuY=asaubzgsvN_MXLSg@mail.gmail.com>
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
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
X-List-Received-Date: Tue, 15 Dec 2015 11:05:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi,

I am using Qt5.4.1 with eglfs QPA.

Is there a way to avoid qt signal handler during compilation ? I would like
avoid patching Qt code.

Thanks
Ankur
On 16-Dec-2015 12:00 am, "Julien Brianceau (jbriance)" <jbriance@cisco.com>
wrote:

> Hi,
>
> What exact version of Qt5 and which Qt QPA platform do you use with your
> kit ?
>
> A quick grep shows this:
> http://code.qt.io/cgit/qt/qtbase.git/tree/src/corelib/kernel/qcrashhandle=
r.cpp?h=3D5.5#n409,
> it could explain your issue if it is called.
>
> Julien
>
> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:
> openembedded-devel-bounces@lists.openembedded.org] On Behalf Of Ankur
> Tyagi
> Sent: mardi 15 d=C3=A9cembre 2015 11:27
> To: openembedded-devel@lists.openembedded.org
> Subject: [oe] QT5 application NOT generating core dump upon receiving
> segmentation fault
>
> Hi,
>
> I am running a QT5 based application on TI AM335x EVM kit. I am using
> meta-arago daisy configuration.
>
> My system is configured to generate core dump and core dumps are generate=
d
> whenever application receives segmentation fault (expected).
>
> But when my QT5 based application received SIGSEGV, then no core dump is
> generated. It dies without "Segmentation fault" message on stdout.
>
> To debug this further, I added nullptr dereference in my application main=
()
> before QApplication object is created and when executed, core dump was
> created.
> When I moved nullptr dereference after QApplication object is created, th=
en
> no core dump was created. Application died without any message.
>
> So it seems QT is handling SIGSEGV and not allowing to create core dump.
>
> Is it expected ? I believe not. What wrong am I doing and how to fix this=
 ?
>
> thanks
> Ankur
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

