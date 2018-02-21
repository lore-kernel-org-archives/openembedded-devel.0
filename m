Return-Path: <schnitzeltony@gmail.com>
Received: from mail-yb0-f177.google.com (mail-yb0-f177.google.com
	[209.85.213.177])
	by mail.openembedded.org (Postfix) with ESMTP id 510F87875C
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 13:59:29 +0000 (UTC)
Received: by mail-yb0-f177.google.com with SMTP id e3-v6so534969ybk.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 21 Feb 2018 05:59:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-transfer-encoding;
	bh=UtlfkI56S6utMG8YEzovTbsDiZ7ng96UZwxok4Fjyxw=;
	b=B7A1E3ms7pUMdijObgW6XwNXltQtfluAC9fcj0g6NZ9lWNoWDiPPalsnKHuGZEBHTr
	3P2CjRnrN+acjGvahrsuM4Nk4tOvJebjfUtdhY9YPzTKiJA0Jp1U/DS34DANRXODFZc6
	fb8Bg4tsOfoLCAB5MojxI/aG0fScNcFYOWUpMufssBuQL99vyP0lInBCrL1RdiP1DMdK
	2WR4/OzkE8DMdukbkCF12VrkYf1IAX8aTWx93rl3PiqTlQYBL/7awKd8duuq3ngrrdf8
	sQrgbYM8vuBVLstZoKt3xaZREoikseSliLHKNFQ4kS3kVLIwf4RgnmJXN9gy+ioNr0Tm
	Z2SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:content-transfer-encoding;
	bh=UtlfkI56S6utMG8YEzovTbsDiZ7ng96UZwxok4Fjyxw=;
	b=LdXMCOE6G9PfxDi47yaSRUgD8ASiUFD8eolFBndqsnGGYBBK0Ceh6Kkb9UhAwlC73o
	9KwK701Dzv8weblYiATuTGpAlnt+6q+8Ooku+i4Zppq9katLpwAeDIuLlPGgvZS1dijU
	ZzjS1YqKz2p9a3D4W/iYMbHvJx3gZE1HGAjQ4LYWp9ogATPjQ/886p+kQ3RqB0/9VHpo
	r2iYdFD+1PMagfbYL+U1rP3AO49wndR9P60PUxHajUrpZTYTXgErNuZ4h5Lix+87q22H
	4o+K43lXulttIe+LJhmmC29yHp1/wt25eAS77iZ3wE+SNrrpq1tk5yy5+BwLjLgZkcs0
	Q+Ng==
X-Gm-Message-State: APf1xPAzdx7e5NRyjQTpZts36RQ9Ro1k33AHEh770bBAYLpp1Ss7fA3z
	42XO1R8xgfwJIjTxNRXtGqgoWgFX9y7UZW0K+Sr+/g==
X-Google-Smtp-Source: AH8x226w5NcNbEyo6mC+Rvgry85xYO260FQQa6vY/EiujnEi2qmy+dQ+eZFH2IFvOTAPgViiFd+zwggiFNkJu1EzD/U=
X-Received: by 2002:a25:6281:: with SMTP id
	w123-v6mr2128149ybb.237.1519221570909; 
	Wed, 21 Feb 2018 05:59:30 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a25:c787:0:0:0:0:0 with HTTP; Wed, 21 Feb 2018 05:59:30
	-0800 (PST)
In-Reply-To: <CALbNGRRAoHBSpsC0Ngenp2dPVxccOb+OeTerw44Bi4Of+bOACA@mail.gmail.com>
References: <CALbNGRRAoHBSpsC0Ngenp2dPVxccOb+OeTerw44Bi4Of+bOACA@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 21 Feb 2018 14:59:30 +0100
Message-ID: <CALbNGRS4ENbv=WU5LxiKeSYKpfNXmXYEriCM7zVQGfwXT07vbw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] qtbase-native/qmake broken for 5.10?
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
X-List-Received-Date: Wed, 21 Feb 2018 13:59:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 20, 2018 at 10:54 AM, Andreas M=C3=BCller
<schnitzeltony@gmail.com> wrote:
> Hi,
>
> giving Qt 5.10.0 a build I ran into the following issue detected by
> meta-qt5-extra/sddm build failure:
>
> Running native 'qmake -query' outputs
>
> | qmake -query
> | Empty filename passed to function
> | QT_SYSROOT:/home/superandy/tmp/oe-core-glibc/work/x86_64-linux/qtbase-n=
ative/5.10.0+gitAUTOINC+50117d738a-r0/recipe-sysroot-native
> | ...
>
> ask for a certain property e.g QT_INSTALL_IMPORTS (this is what sddm
> does during build):
>
> | qmake -query QT_INSTALL_IMPORTS
> | Empty filename passed to function
> | /home/superandy/tmp/oe-core-glibc/work/x86_64-linux/qtbase-native/5.10.=
0+gitAUTOINC+50117d738a-r0/recipe-sysroot-native/home/superandy/tmp/oe-core=
-glibc/work/x86_64-linux/qtbase-native/5.10.0+gitAUTOINC+50117d738a-r0/reci=
pe-sysroot-native/usr/lib/qt5/imports
>
> First line always reports 'Empty filename passed to function' which is
> not exactly useful when expecting a path.
>
> I've searched the web without success for this so I decided to start
> debugging. Due to standard optimization most interesting variables are
> optimized out :(
>
> So before I rebuild qtbase-native without optimization and debug again
> I thought there might be someone here knowing something helpful
> regarding this issue.
>
> Thanks in advance
>
Fixed for sddm:
sddm is a bit special: It asks qmake from within cmake for paths.
Debugging showed that environment OE_QMAKE_QTCONF_PATH was missing.
Exporting this in sddm recipe did the job.

See qtbase source:

QSettings *QLibraryInfoPrivate::findConfiguration()
{
#ifdef QT_BUILD_QMAKE
    QByteArray config =3D getenv("OE_QMAKE_QTCONF_PATH");
    QString qtconfig =3D QFile::decodeName(config);
    if(!QFile::exists(qtconfig))    <<<<<-- This caused "Empty
filename passed to function"
...

Seems qmake-native 5.9 behaved differently here...

Thinking this more over I wonder if there might be another common
place for exporting OE_QMAKE_QTCONF_PATH. How about
qmake5_paths.bbclass?

Andreas

