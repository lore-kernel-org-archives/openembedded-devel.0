Received: from mail-qk1-f194.google.com (mail-qk1-f194.google.com [209.85.222.194])
 by mx.groups.io with SMTP id smtpd.web12.1897.1599088143227117235
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Sep 2020 16:09:03 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o6tXSupS;
 spf=pass (domain: gmail.com, ip: 209.85.222.194, mailfrom: raj.khem@gmail.com)
Received: by mail-qk1-f194.google.com with SMTP id g72so1382406qke.8
        for <openembedded-devel@lists.openembedded.org>; Wed, 02 Sep 2020 16:09:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=MU81gdQKQp7i0P5tG+CToTl1IfEYJ0FmnE5Enbrrmlg=;
        b=o6tXSupSof6fFvIPwbQ/YUNz6ZAZ+HYxWkHk3hXod23pT0YrMTg0qL26WovsgUBe+w
         6bBSHoP4tZ8kGn+wBzQL82NLGLTItl97fbQg2A1p5iJQ9af65nQo8FsDTW9M2bfkJd0G
         B0L1yf9Jfou/6aQZm25wpg2BvqiYsXg6Cun1xM/jOzwt6IEw9LjyEreN6XdYDjiVRrTf
         76Igqeezh3O6BDa0NSboufMawYLgb5VyfWHGLpgveo7vbWhfjiLYUURZEimHFdJ2ejwY
         Rie+9/CYAWw96bk5rrHwg57CSXJ7e8HSPwjT8070hCA85bihY26k16c+n0rsy1Fs6f/Z
         eD5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=MU81gdQKQp7i0P5tG+CToTl1IfEYJ0FmnE5Enbrrmlg=;
        b=UKH1XwhVuctQ23+CyhMA2U9mYdOfRdhVG+6YUb4GRF5UyB88FJbppGqM99reKBfJl0
         9zo3vImOp+gYNSkWrTJjPveXTHEKCk2hNeIpVW/CIejJmzcJC2fbbSrJb03JaJU5aN8+
         mDf/0KREJDV+fC3JQUZRPhNmz6kvGQyIl2E1JcvfIMQdfMCRVvebJDPQ5i35mtNXPFZj
         Z8TlSgcEkFCyi07og6JSSdAo4o+3Vq8t2Gyh9ubYjzPLwZ6Zk5oBl/RbLDl89L4oKblL
         a4DAdkv5EDa+2FoeTKKZZovijrYX9gw7QxK1VMy8dI5g9YwmixTeFXwcRp5nMsAjlBW9
         mZhg==
X-Gm-Message-State: AOAM530+voQf9fg2kGFHWvrWSoRT8NEBF0Nm4yztDg1YkCCfheqdo0kH
	djKNthmyHxIFgeyzJKEJzwE2YVWzFm9LmfXgjq8=
X-Google-Smtp-Source: ABdhPJy+2/AEDp1rBbCmiVyRoUjnoBZ8HSqS7MDLQf6fuWe8BlNKfGAwA28TxmXtqzMK5k9Lt6OFc/WrzjbG2i9tmm4=
X-Received: by 2002:a05:620a:48:: with SMTP id t8mr378982qkt.474.1599088142165;
 Wed, 02 Sep 2020 16:09:02 -0700 (PDT)
MIME-Version: 1.0
References: <20200902174600.675971-1-yann@blade-group.com> <CAMKF1soBvXpbfFL-dDSkKNftcvMjp0bmVjw1zHGB9SzL7JUjAQ@mail.gmail.com>
 <16310CDC982F58B4.28345@lists.openembedded.org> <CA+4=imbkEGTipiuEeXGNjeBLQtGz0KLzjDicZaB2+kEQ85u2Pw@mail.gmail.com>
In-Reply-To: <CA+4=imbkEGTipiuEeXGNjeBLQtGz0KLzjDicZaB2+kEQ85u2Pw@mail.gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Wed, 2 Sep 2020 16:08:36 -0700
Message-ID: <CAMKF1srky+yXXPK1FVV1ci2Md3BFNJwyhruvHOviEsLYwc-UWg@mail.gmail.com>
Subject: Re: [oe] [meta-oe][patch] New terminal emulator: st 0.8.4
To: Yann Dirson <yann.dirson@blade-group.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>, 
	Yann Dirson <yann@blade-group.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2020 at 2:32 PM Yann Dirson <yann.dirson@blade-group.com> wr=
ote:
>
>
>
> Le mer. 2 sept. 2020 =C3=A0 21:04, Yann Dirson via lists.openembedded.or=
g <yann.dirson=3Dblade-group.com@lists.openembedded.org> a =C3=A9crit :
>>
>>
>>
>> Le mer. 2 sept. 2020 =C3=A0 20:37, Khem Raj <raj.khem@gmail.com> a =C3=
=A9crit :
>>>
>>> On Wed, Sep 2, 2020 at 10:46 AM Yann Dirson <yann.dirson@blade-group.c=
om> wrote:
>>> >
>>> > From: Yann Dirson <yann@blade-group.com>
>>> >
>>> > Can be used as a replacement for matchbox-terminal, with much less
>>> > dependencies (does not need gtk and vte), and supports "-e" flag.
>>> >
>>>
>>> can you add it to
>>> meta-oe/recipes-core/packagegroups/packagegroup-meta-oe.bb as well
>>> and see if you can build meta-oe-ptest-image
>>
>>
>> Running now, will send an updated version once it has passed, looks lik=
e it's going to use some CPU :)
>
>
> Well, isn't there some CI runner somewhere with already a full sstate-ca=
che ?
>
> The qemux86-64 build fails in webkitgtk whose build takes up so much RAM=
 my poor brand new laptop OoMs...
>

Oh, yes it will run in CI if you added it to packagegroup and sent a v2

>>
>> While preparing for that though, I stumbled on a strange issue (I'm not=
 using the tools for that usually,
>> but I confess it is convenient ;):
>>
>> build (master=3D)$ bitbake-layers add-layer ../../meta-openembedded/met=
a-networking/
>> NOTE: Starting bitbake server...
>>
>> build (master=3D)$ bitbake-layers add-layer ../../meta-openembedded/met=
a-filesystems/
>> NOTE: Starting bitbake server...
>> Traceback (most recent call last):
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/bin/bi=
tbake-layers", line 95, in <module>
>>     ret =3D main()
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/bin/bi=
tbake-layers", line 63, in main
>>     tinfoil.prepare(True)
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb=
/tinfoil.py", line 410, in prepare
>>     self.run_command('parseConfiguration')
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb=
/tinfoil.py", line 466, in run_command
>>     raise TinfoilCommandFailed(result[1])
>> bb.tinfoil.TinfoilCommandFailed: Traceback (most recent call last):
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb=
/command.py", line 81, in runCommand
>>     result =3D command_method(self, commandline)
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb=
/command.py", line 280, in parseConfiguration
>>     command.cooker.parseConfiguration()
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb=
/cooker.py", line 426, in parseConfiguration
>>     self.handleCollections(self.data.getVar("BBFILE_COLLECTIONS"))
>>   File "/home/yann/shadow/meta-blade/meta-shadow-os/poky/bitbake/lib/bb=
/cooker.py", line 1255, in handleCollections
>>     raise CollectionError("Errors during parsing layer configuration")
>> bb.cooker.CollectionError: Errors during parsing layer configuration
>>
>>
>> Same problem after adding it by hand, trying to add meta-python.  Addin=
g that one by hand as well does the trick.
>>
>>>
>>> > Signed-off-by: Yann Dirson <yann@blade-group.com>
>>> > ---
>>> >  meta-oe/recipes-graphics/suckless/st_0.8.4.bb | 28 ++++++++++++++++=
+++
>>> >  1 file changed, 28 insertions(+)
>>> >  create mode 100644 meta-oe/recipes-graphics/suckless/st_0.8.4.bb
>>> >
>>> > diff --git a/meta-oe/recipes-graphics/suckless/st_0.8.4.bb b/meta-oe=
/recipes-graphics/suckless/st_0.8.4.bb
>>> > new file mode 100644
>>> > index 000000000..7d7c20e46
>>> > --- /dev/null
>>> > +++ b/meta-oe/recipes-graphics/suckless/st_0.8.4.bb
>>> > @@ -0,0 +1,28 @@
>>> > +SECTION =3D "shadow"
>>> > +LICENSE =3D "MIT-X"
>>> > +LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D04c3ca13a702147c62db90f5=
56c5b3ca"
>>> > +SRC_URI =3D " \
>>> > + http://dl.suckless.org/${BPN}/${BPN}-${PV}.tar.gz \
>>> > +"
>>> > +
>>> > +inherit pkgconfig
>>> > +
>>> > +SRC_URI[sha256sum] =3D "d42d3ceceb4d6a65e32e90a5336e3d446db612c3fbd=
9ebc1780bc6c9a03346a6"
>>> > +
>>> > +DEPENDS +=3D "libx11 libxft fontconfig"
>>> > +
>>> > +RDEPENDS_${PN} +=3D "libx11-locale"
>>> > +
>>> > +do_compile() {
>>> > +    make INCS=3D'-I. `pkg-config --cflags x11 fontconfig xft`' LIBS=
=
=3D'-lm -lutil `pkg-config --libs x11 fontconfig xft`'
>>> > +}
>>> > +
>>> > +# don't use "make install" which builds terminfo, already in
>>> > +# ncurses-terminfo (and requires ncurses-native for "tic")
>>> > +
>>> > +do_install() {
>>> > +    mkdir -p ${D}${bindir}
>>> > +    install -m755 ${B}/st ${D}${bindir}/
>>> > +}
>>> > +
>>> > +RRECOMMENDS_${PN} +=3D "ncurses-terminfo"
>>> > --
>>> > 2.28.0
>>> >
>>> >
>>
>>
>>
>> --
>> Yann Dirson <yann@blade-group.com>
>> Blade / Shadow -- http://shadow.tech
>>
>>=20
>
>
>
> --
> Yann Dirson <yann@blade-group.com>
> Blade / Shadow -- http://shadow.tech
>
