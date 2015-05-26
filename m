Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-pd0-f169.google.com (mail-pd0-f169.google.com
	[209.85.192.169])
	by mail.openembedded.org (Postfix) with ESMTP id 97B6865D6E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 09:30:28 +0000 (UTC)
Received: by pdbqa5 with SMTP id qa5so86843560pdb.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 May 2015 02:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=CBuA74KR0uh20llq2uq6NiZDlQ542qG/+J4XCkwoWzI=;
	b=sRj5TnHkjRqOJPV2PIgJH0n7Ej0VZ5fBPatwtqn5aR/tZLBi8l1Qfd54NwP4Uqf1x1
	+dOwPvnr5IhwmErrXohjnk6pVRFRoV+1kNO1BWlnEC1MlXwcGWq0Pa9OtM1wlRjelLrl
	7a15eqNWuQPNeqv0MSyEGr2/Z4FQBI0idq3BQjE1XdaTVKUMNKxDh1+wJbutlSJOcOdC
	QSpdZCLzw6rtBIWmxbkINxVjK6UiV+04fLKd65zfVOYeYsOWtqfjHWhpnWh1B+0m3Gm7
	7gKmGL0t906oje9K4dSu80sSac9AxilafZ5ev9kiDVay48QeSHMBaB1rcKG6PAkQwg/G
	xv8g==
MIME-Version: 1.0
X-Received: by 10.68.205.67 with SMTP id le3mr47646725pbc.94.1432632630198;
	Tue, 26 May 2015 02:30:30 -0700 (PDT)
Received: by 10.70.54.3 with HTTP; Tue, 26 May 2015 02:30:30 -0700 (PDT)
In-Reply-To: <CALbNGRRwf5wWYR9fwNQ0emgawgGMbOohVMWvZsSGwJ9hicoQpg@mail.gmail.com>
References: <1432588449-31413-1-git-send-email-schnitzeltony@googlemail.com>
	<1432588449-31413-4-git-send-email-schnitzeltony@googlemail.com>
	<CAHvQdo2+r3yjapSU2f=dCaOipuaLViCZ5EXNmDt=xVrLfGdZcw@mail.gmail.com>
	<CALbNGRRwf5wWYR9fwNQ0emgawgGMbOohVMWvZsSGwJ9hicoQpg@mail.gmail.com>
Date: Tue, 26 May 2015 11:30:30 +0200
Message-ID: <CALbNGRR5rxuRkWoDduChQGfgpVPB34xxq9zQXXJgSHpw-9s+bQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 03/12] poppler: update 0.33.0 to and enhance packageconfigs
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
X-List-Received-Date: Tue, 26 May 2015 09:30:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2015 at 11:16 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> On Tue, May 26, 2015 at 11:02 AM, Johannes Pointner
> <h4nn35.work@gmail.com> wrote:
>> Hello,
>>
>> I tried your patch but wasn't able to build poppler-qt5.
>> The do_configure gives me following log(only part of the log):
>> ...
>> checking for CAIRO... yes
>> checking for PDFTOCAIRO... yes
>> checking for fcntl.h... (cached) yes
>> checking for sys/mman.h... (cached) yes
>> checking for sys/stat.h... (cached) yes
>> checking for POPPLER_GLIB... yes
>> checking for gobject-introspection... no
>> checking for glib-mkenums...
>> /mnt/workspace/yocto_env/poky_fido/poky_ppt30/build/tmp/sysroots/x86_64-=
linux/usr/bin/glib-mkenums
>> checking for gtkdoc-check... no
>> checking for gtkdoc-rebase... no
>> checking for gtkdoc-mkpdf... no
>> checking whether to build gtk-doc documentation... no
>> checking for POPPLER_QT4... no
>> checking for POPPLER_QT5... yes
>> checking for POPPLER_QT5_TEST... yes
>> checking for arm-poky-linux-gnueabi-moc... no
>> checking for moc... moc
>> checking for Qt5 moc... no
>> checking for arm-poky-linux-gnueabi-moc-qt5... no
>> checking for moc-qt5... no
>> checking for Qt5 moc-qt5... checking for arm-poky-linux-gnueabi-qtchoose=
r... no
>> checking for qtchooser... qtchooser
>> checking for qtchooser... qtchooser: could not find a Qt installation of=
 'qt5'
>> not found
>> ...
>>
>> Have I missed something?
>> Other qt5 applications build without a problem.
>>
>> Thx,
>> Hannes
>>
> Will check what my configure says - maybe there are some missing
> dependencies caught by my environment
>
Guess we have some host pollution. Let me guess: you have qtchooser
installed on your host - as I haven't and my configure does not ask
for qtchooser.

Andreas

