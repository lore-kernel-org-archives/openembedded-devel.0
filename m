Received: from mail-vs1-f45.google.com (mail-vs1-f45.google.com [209.85.217.45])
 by mx.groups.io with SMTP id smtpd.web10.191664.1598260046180605996
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 24 Aug 2020 02:07:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=ZTkJMIT2;
 spf=pass (domain: gmail.com, ip: 209.85.217.45, mailfrom: alex.kanavin@gmail.com)
Received: by mail-vs1-f45.google.com with SMTP id a13so4042545vso.12
        for <openembedded-devel@lists.openembedded.org>; Mon, 24 Aug 2020 02:07:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=987FtIEvEZjhue5ryKibOV3WSBepmLNFaBoWRnmKUWs=;
        b=ZTkJMIT2YE/CGRZyHH6znplVTgizB9TWwa7hwrDpppuSodcFW8ui7HrZcJNOBUtq7T
         AY6C2SQOSz5NkyhTrbLPz1P5c+3qEm1kJr1xck5IonSIDgdIKdI7ySEP77eblPQ0GHRV
         8bsc5VYtRRrrrcY0JNODSJ+iZvxcPmGxv1RJJXDhn4IhvhDJbYsgPwIBHZyVWQA4Izi4
         1eZlf/efkkjAQT472vi4MGqcEPZSW2Q61a9kGO0+Rd5Y69rRAqY/qz1QjGRX7jbb2TEj
         g7sWBddty1Rg0Z/iIIjtJaSL1HBW7I3ut0Q93oevdI7QRH16okufdWNb77gcAihtNPJg
         5hBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=987FtIEvEZjhue5ryKibOV3WSBepmLNFaBoWRnmKUWs=;
        b=K9BpfccZYLo/LUUjeQii0TxTvDwcwybfmVA5QqRMM1AevAt973t/rogZZqxxvOe1CW
         cvCEdgVRG+4BOWn+mpm+fchitCPVzwspgUkVcOxBY0uK1XQUZRjG+2vdp4wiQqXh3E3/
         JKO45kGlzSUUW60RcuhIXjGY6XWrGZNTx4w0TNipLA0wmowRgNTRM/cZH/x1FuhE5sNW
         FD5FqawPqHWeuojwL9cbxpODRpsBLzsfuUVouMFUuQy4XI1Hrj9paGNhF1d4PE9+EWQe
         v82ezFwQnOKSL6m2RKhfjtM0d7Q/2DiUF+NeR4LxAbOUIjQPpmazielU5be6XnvV+y84
         5L1g==
X-Gm-Message-State: AOAM532Sz42yXVApzKnFLUuGhOsv/f6c1fPaj3/kEHbhXBHYinJEv8/i
	EuvviJr3FcoKNNEzTktHqksYRjhp1j4BDGD8Gog=
X-Google-Smtp-Source: ABdhPJzrFmp30FMSq1+PiycnV+XFYVP6JnzRh8GHwipx3k3v98pkLBigbJ5JQeif9quyI3cFckYOK4c8Gc8ekuIwQFQ=
X-Received: by 2002:a67:fd0a:: with SMTP id f10mr1631069vsr.35.1598260045350;
 Mon, 24 Aug 2020 02:07:25 -0700 (PDT)
MIME-Version: 1.0
References: <20200824062225.GD65616@pcleri> <30416287-890a-4fd1-2262-21b2a9b68ffd@gmail.com>
 <20200824083345.GG65616@pcleri>
In-Reply-To: <20200824083345.GG65616@pcleri>
From: "Alexander Kanavin" <alex.kanavin@gmail.com>
Date: Mon, 24 Aug 2020 11:07:13 +0200
Message-ID: <CANNYZj9BA_nPnJCHDAUcxtzz9Lz3zn8WSPh7jeKJY9omCTHRaA@mail.gmail.com>
Subject: Re: [oe] [meta-java] Changes from master-next merged to master
To: Richard Leitner <richard.leitner@skidata.com>
Cc: Jacob Kroon <jacob.kroon@gmail.com>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Content-Type: multipart/alternative; boundary="000000000000430be605ad9bea03"

--000000000000430be605ad9bea03
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This message is actually from 2017, and I would hope it does not apply to
openjdk specifically, and the site is down only temporarily. If I remember
right, there is commitment to OpenJDK in its various flavours for years to
come.

Otherwise, here are a couple of decent options:
https://github.com/AdoptOpenJDK/openjdk-jdk8u
http://deb.debian.org/debian/pool/main/o/openjdk-8/

Alex

On Mon, 24 Aug 2020 at 10:33, Richard Leitner <richard.leitner@skidata.com=
>
wrote:

> On Mon, Aug 24, 2020 at 09:50:41AM +0200, Jacob Kroon wrote:
> >
> > After updating master I'm getting:
> >
> > > WARNING: openjdk-8-native-265-r0 do_fetch: Failed to fetch URL
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;down=
loadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk,
> attempting MIRRORS if available
> > > ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure: Fetch
> command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; ex=
port
> DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export
> SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export
> PATH=3D"/home/jkroon/Projects/foo-linux/openembedded-core/scripts/native=
-intercept:/home/jkroon/Projects/foo-linux/openembedded-core/scripts:/tmp/r=
amdisk/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0/rec=
ipe-sysroot-native/usr/bin/x86_64-linux:/tmp/ramdisk/foo-linux-master-glibc=
/work/x86_64-linux/openjdk-8-native/265-r0/recipe-sysroot-native/usr/bin:/t=
mp/ramdisk/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0=
/recipe-sysroot-native/usr/sbin:/tmp/ramdisk/foo-linux-master-glibc/work/x8=
6_64-linux/openjdk-8-native/265-r0/recipe-sysroot-native/usr/bin:/tmp/ramdi=
sk/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0/recipe-=
sysroot-native/sbin:/tmp/ramdisk/foo-linux-master-glibc/work/x86_64-linux/o=
penjdk-8-native/265-r0/recipe-sysroot-native/bin:/home/jkroon/Projects/foo-=
linux/bitbake/bin:/tmp/ramdisk/foo-linux-master-glibc/hosttools";
> export HOME=3D"/home/jkroon"; /usr/bin/env wget -t 2 -T 30 --passive-ftp
> --no-check-certificate -O
> /home/jkroon/Downloads/yocto/openjdk8-265-jdk8u-jdk8u265-ga.tar.bz2 -P
> /home/jkroon/Downloads/yocto '
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2'
> --progress=3Ddot -v failed with exit code 4, output:
> > > --2020-08-24 07:30:12--
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
> > > Resolving hg.openjdk.java.net (hg.openjdk.java.net)... 137.254.56.63
> > > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.6=
3|:443...
> connected.
> > > HTTP request sent, awaiting response... Read error (Success.) in
> headers.
> > > Retrying.
> > >
> > > --2020-08-24 07:30:44--  (try: 2)
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
> > > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.6=
3|:443...
> connected.
> > > HTTP request sent, awaiting response... Read error (Success.) in
> headers.
> > > Giving up.
> > >
> > >
> > > ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure for URL: '
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;down=
loadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk'.
> Unable to fetch URL from any source.
> > > ERROR: Logfile of failure stored in:
> /tmp/ramdisk/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/2=
65-r0/temp/log.do_fetch.756296
> > > ERROR: Task
> (/home/jkroon/Projects/foo-linux/build/../meta-java/recipes-core/openjdk=
/openjdk-8-native_265.bb:do_fetch)
> failed with exit code '1'
> > > WARNING: openjre-8-265-r0 do_fetch: Failed to fetch URL
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;down=
loadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk,
> attempting MIRRORS if available
> > > ERROR: openjre-8-265-r0 do_fetch: Fetcher failure: Fetch command
> export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; export
> DBUS_SESSION_BUS_ADDRESS=3D"unix:path=3D/run/user/1000/bus"; export
> SSH_AUTH_SOCK=3D"/run/user/1000/keyring/ssh"; export
> PATH=3D"/home/jkroon/Projects/foo-linux/openembedded-core/scripts:/tmp/r=
amdisk/foo-linux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sy=
sroot-native/usr/bin/i686-oe-linux:/tmp/ramdisk/foo-linux-master-glibc/work=
/i686-oe-linux/openjre-8/265-r0/recipe-sysroot/usr/bin/crossscripts:/tmp/ra=
mdisk/foo-linux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sys=
root-native/usr/sbin:/tmp/ramdisk/foo-linux-master-glibc/work/i686-oe-linux=
/openjre-8/265-r0/recipe-sysroot-native/usr/bin:/tmp/ramdisk/foo-linux-mast=
er-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sysroot-native/sbin:/tm=
p/ramdisk/foo-linux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe=
-sysroot-native/bin:/home/jkroon/Projects/foo-linux/bitbake/bin:/tmp/ramdis=
k/foo-linux-master-glibc/hosttools";
> export HOME=3D"/home/jkroon"; /usr/bin/env wget -t 2 -T 30 --passive-ftp
> --no-check-certificate -O
> /home/jkroon/Downloads/yocto/openjdk8-265-jdk8u-jdk8u265-ga.tar.bz2 -P
> /home/jkroon/Downloads/yocto '
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2'
> --progress=3Ddot -v failed with exit code 4, output:
> > > --2020-08-24 07:31:15--
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
> > > Resolving hg.openjdk.java.net (hg.openjdk.java.net)... 137.254.56.63
> > > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.6=
3|:443...
> connected.
> > > HTTP request sent, awaiting response... Read error (Success.) in
> headers.
> > > Retrying.
> > >
> > > --2020-08-24 07:31:47--  (try: 2)
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2
> > > Connecting to hg.openjdk.java.net (hg.openjdk.java.net)|137.254.56.6=
3|:443...
> connected.
> > > HTTP request sent, awaiting response... Read error (Success.) in
> headers.
> > > Giving up.
> > >
> > >
> > > ERROR: openjre-8-265-r0 do_fetch: Fetcher failure for URL: '
> https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;down=
loadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk'.
> Unable to fetch URL from any source.
> > > ERROR: Logfile of failure stored in:
> /tmp/ramdisk/foo-linux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/=
temp/log.do_fetch.756297
> > > ERROR: Task
> (/home/jkroon/Projects/foo-linux/build/../meta-java/recipes-core/openjdk=
/openjre-8_265.bb:do_fetch)
> failed with exit code '1'
> > > NOTE: Tasks Summary: Attempted 3854 tasks of which 3586 didn't need =
to
> be rerun and 2 failed.
> > > NOTE: Writing buildhistory
> > > NOTE: Writing buildhistory took: 1 seconds
> > >
> > > Summary: 2 tasks failed:
> > >
>  /home/jkroon/Projects/foo-linux/build/../meta-java/recipes-core/openjdk=
/openjdk-8-native_265.bb:
> do_fetch
> > >
>  /home/jkroon/Projects/foo-linux/build/../meta-java/recipes-core/openjdk=
/openjre-8_265.bb:
> do_fetch
> > > Summary: There were 2 WARNING messages shown.
> > > Summary: There were 4 ERROR messages shown, returning a non-zero exi=
t
> code.
>
>
> It seems Oracle shut down the complete java.net site...
>
> "We're sorry the java.net site has closed.
>
> Most Open Source projects previously hosted on java.net have been
> relocated. Please contact the corresponding project administrator for
> relocation information."
>
> Does anybody know where the official repository was relocated to?
>
> The only thing I'm aware of is the read only mirror at
> https://github.com/openjdk/jdk which doesn't host the jdk8u AFAIK...
>
> regards;rl
>
>=20
>

--000000000000430be605ad9bea03
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div>This message is actually from 2017, and I would hope =
it does not apply to openjdk specifically, and the site is down only tempor=
arily. If I remember right, there is commitment to OpenJDK in its various f=
lavours for years to come.<br></div><div><br></div><div>Otherwise, here are=
 a couple of decent options:</div><div><a href=3D"https://github.com/AdoptO=
penJDK/openjdk-jdk8u">https://github.com/AdoptOpenJDK/openjdk-jdk8u</a></di=
v><div><a href=3D"http://deb.debian.org/debian/pool/main/o/openjdk-8/">http=
://deb.debian.org/debian/pool/main/o/openjdk-8/</a></div><div><br></div><di=
v>Alex<br></div></div><br><div class=3D"gmail_quote"><div dir=3D"ltr" class=
=
=3D"gmail_attr">On Mon, 24 Aug 2020 at 10:33, Richard Leitner &lt;<a href=
=3D"mailto:richard.leitner@skidata.com">richard.leitner@skidata.com</a>&gt=
; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px=
 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">On Mon,=
 Aug 24, 2020 at 09:50:41AM +0200, Jacob Kroon wrote:<br>
&gt; <br>
&gt; After updating master I&#39;m getting:<br>
&gt; <br>
&gt; &gt; WARNING: openjdk-8-native-265-r0 do_fetch: Failed to fetch URL <=
a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.b=
z2;downloadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk=
" rel=3D"noreferrer" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/jd=
k8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=3Dopenjdk8-265-jdk8u-jdk8u=
265-ga.tar.bz2;name=3Dopenjdk</a>, attempting MIRRORS if available<br>
&gt; &gt; ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure: Fetch =
command export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; expor=
t DBUS_SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/user/1000/bus&quot;; ex=
port SSH_AUTH_SOCK=3D&quot;/run/user/1000/keyring/ssh&quot;; export PATH=3D=
&quot;/home/jkroon/Projects/foo-linux/openembedded-core/scripts/native-inte=
rcept:/home/jkroon/Projects/foo-linux/openembedded-core/scripts:/tmp/ramdis=
k/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0/recipe-s=
ysroot-native/usr/bin/x86_64-linux:/tmp/ramdisk/foo-linux-master-glibc/work=
/x86_64-linux/openjdk-8-native/265-r0/recipe-sysroot-native/usr/bin:/tmp/ra=
mdisk/foo-linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0/reci=
pe-sysroot-native/usr/sbin:/tmp/ramdisk/foo-linux-master-glibc/work/x86_64-=
linux/openjdk-8-native/265-r0/recipe-sysroot-native/usr/bin:/tmp/ramdisk/fo=
o-linux-master-glibc/work/x86_64-linux/openjdk-8-native/265-r0/recipe-sysro=
ot-native/sbin:/tmp/ramdisk/foo-linux-master-glibc/work/x86_64-linux/openjd=
k-8-native/265-r0/recipe-sysroot-native/bin:/home/jkroon/Projects/foo-linux=
/bitbake/bin:/tmp/ramdisk/foo-linux-master-glibc/hosttools&quot;; export HO=
ME=3D&quot;/home/jkroon&quot;; /usr/bin/env wget -t 2 -T 30 --passive-ftp -=
-no-check-certificate -O /home/jkroon/Downloads/yocto/openjdk8-265-jdk8u-jd=
k8u265-ga.tar.bz2 -P /home/jkroon/Downloads/yocto &#39;<a href=3D"https://h=
g.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2" rel=3D"noreferr=
er" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u=
265-ga.tar.bz2</a>&#39; --progress=3Ddot -v failed with exit code 4, output=
:<br>
&gt; &gt; --2020-08-24 07:30:12--=C2=A0 <a href=3D"https://hg.openjdk.java=
.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2" rel=3D"noreferrer" target=3D"=
_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2=
</a><br>
&gt; &gt; Resolving <a href=3D"http://hg.openjdk.java.net" rel=3D"noreferr=
er" target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.openjdk=
.java.net" rel=3D"noreferrer" target=3D"_blank">hg.openjdk.java.net</a>)...=
 137.254.56.63<br>
&gt; &gt; Connecting to <a href=3D"http://hg.openjdk.java.net" rel=3D"nore=
ferrer" target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.ope=
njdk.java.net" rel=3D"noreferrer" target=3D"_blank">hg.openjdk.java.net</a>=
)|137.254.56.63|:443... connected.<br>
&gt; &gt; HTTP request sent, awaiting response... Read error (Success.) in=
 headers.<br>
&gt; &gt; Retrying.<br>
&gt; &gt; <br>
&gt; &gt; --2020-08-24 07:30:44--=C2=A0 (try: 2)=C2=A0 <a href=3D"https://=
hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2" rel=3D"norefer=
rer" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8=
u265-ga.tar.bz2</a><br>
&gt; &gt; Connecting to <a href=3D"http://hg.openjdk.java.net" rel=3D"nore=
ferrer" target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.ope=
njdk.java.net" rel=3D"noreferrer" target=3D"_blank">hg.openjdk.java.net</a>=
)|137.254.56.63|:443... connected.<br>
&gt; &gt; HTTP request sent, awaiting response... Read error (Success.) in=
 headers.<br>
&gt; &gt; Giving up.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; ERROR: openjdk-8-native-265-r0 do_fetch: Fetcher failure for URL=
: &#39;<a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-=
ga.tar.bz2;downloadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=
=3Dopenjdk" rel=3D"noreferrer" target=3D"_blank">https://hg.openjdk.java.n=
et/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=3Dopenjdk8-265-=
jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk</a>&#39;. Unable to fetch URL from=
 any source.<br>
&gt; &gt; ERROR: Logfile of failure stored in: /tmp/ramdisk/foo-linux-mast=
er-glibc/work/x86_64-linux/openjdk-8-native/265-r0/temp/log.do_fetch.756296=
<br>
&gt; &gt; ERROR: Task (/home/jkroon/Projects/foo-linux/build/../meta-java/=
recipes-core/openjdk/openjdk-8-native_265.bb:do_fetch) failed with exit cod=
e &#39;1&#39;<br>
&gt; &gt; WARNING: openjre-8-265-r0 do_fetch: Failed to fetch URL <a href=
=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2;do=
wnloadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjdk" rel=
=
=3D"noreferrer" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/=
archive/jdk8u265-ga.tar.bz2;downloadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-=
ga.tar.bz2;name=3Dopenjdk</a>, attempting MIRRORS if available<br>
&gt; &gt; ERROR: openjre-8-265-r0 do_fetch: Fetcher failure: Fetch command=
 export PSEUDO_DISABLED=3D1; unset _PYTHON_SYSCONFIGDATA_NAME; export DBUS_=
SESSION_BUS_ADDRESS=3D&quot;unix:path=3D/run/user/1000/bus&quot;; export SS=
H_AUTH_SOCK=3D&quot;/run/user/1000/keyring/ssh&quot;; export PATH=3D&quot;/=
home/jkroon/Projects/foo-linux/openembedded-core/scripts:/tmp/ramdisk/foo-l=
inux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sysroot-native=
/usr/bin/i686-oe-linux:/tmp/ramdisk/foo-linux-master-glibc/work/i686-oe-lin=
ux/openjre-8/265-r0/recipe-sysroot/usr/bin/crossscripts:/tmp/ramdisk/foo-li=
nux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sysroot-native/=
usr/sbin:/tmp/ramdisk/foo-linux-master-glibc/work/i686-oe-linux/openjre-8/2=
65-r0/recipe-sysroot-native/usr/bin:/tmp/ramdisk/foo-linux-master-glibc/wor=
k/i686-oe-linux/openjre-8/265-r0/recipe-sysroot-native/sbin:/tmp/ramdisk/fo=
o-linux-master-glibc/work/i686-oe-linux/openjre-8/265-r0/recipe-sysroot-nat=
ive/bin:/home/jkroon/Projects/foo-linux/bitbake/bin:/tmp/ramdisk/foo-linux-=
master-glibc/hosttools&quot;; export HOME=3D&quot;/home/jkroon&quot;; /usr/=
bin/env wget -t 2 -T 30 --passive-ftp --no-check-certificate -O /home/jkroo=
n/Downloads/yocto/openjdk8-265-jdk8u-jdk8u265-ga.tar.bz2 -P /home/jkroon/Do=
wnloads/yocto &#39;<a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/archi=
ve/jdk8u265-ga.tar.bz2" rel=3D"noreferrer" target=3D"_blank">https://hg.ope=
njdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2</a>&#39; --progress=
=3Ddot -v failed with exit code 4, output:<br>
&gt; &gt; --2020-08-24 07:31:15--=C2=A0 <a href=3D"https://hg.openjdk.java=
.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2" rel=3D"noreferrer" target=3D"=
_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2=
</a><br>
&gt; &gt; Resolving <a href=3D"http://hg.openjdk.java.net" rel=3D"noreferr=
er" target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.openjdk=
.java.net" rel=3D"noreferrer" target=3D"_blank">hg.openjdk.java.net</a>)...=
 137.254.56.63<br>
&gt; &gt; Connecting to <a href=3D"http://hg.openjdk.java.net" rel=3D"nore=
ferrer" target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.ope=
njdk.java.net" rel=3D"noreferrer" target=3D"_blank">hg.openjdk.java.net</a>=
)|137.254.56.63|:443... connected.<br>
&gt; &gt; HTTP request sent, awaiting response... Read error (Success.) in=
 headers.<br>
&gt; &gt; Retrying.<br>
&gt; &gt; <br>
&gt; &gt; --2020-08-24 07:31:47--=C2=A0 (try: 2)=C2=A0 <a href=3D"https://=
hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.bz2" rel=3D"norefer=
rer" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8=
u265-ga.tar.bz2</a><br>
&gt; &gt; Connecting to <a href=3D"http://hg.openjdk.java.net" rel=3D"nore=
ferrer" target=3D"_blank">hg.openjdk.java.net</a> (<a href=3D"http://hg.ope=
njdk.java.net" rel=3D"noreferrer" target=3D"_blank">hg.openjdk.java.net</a>=
)|137.254.56.63|:443... connected.<br>
&gt; &gt; HTTP request sent, awaiting response... Read error (Success.) in=
 headers.<br>
&gt; &gt; Giving up.<br>
&gt; &gt; <br>
&gt; &gt; <br>
&gt; &gt; ERROR: openjre-8-265-r0 do_fetch: Fetcher failure for URL: &#39;=
<a href=3D"https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u265-ga.tar.=
bz2;downloadfilename=3Dopenjdk8-265-jdk8u-jdk8u265-ga.tar.bz2;name=3Dopenjd=
k" rel=3D"noreferrer" target=3D"_blank">https://hg.openjdk.java.net/jdk8u/j=
dk8u/archive/jdk8u265-ga.tar.bz2;downloadfilename=3Dopenjdk8-265-jdk8u-jdk8=
u265-ga.tar.bz2;name=3Dopenjdk</a>&#39;. Unable to fetch URL from any sourc=
e.<br>
&gt; &gt; ERROR: Logfile of failure stored in: /tmp/ramdisk/foo-linux-mast=
er-glibc/work/i686-oe-linux/openjre-8/265-r0/temp/log.do_fetch.756297<br>
&gt; &gt; ERROR: Task (/home/jkroon/Projects/foo-linux/build/../meta-java/=
recipes-core/openjdk/openjre-8_265.bb:do_fetch) failed with exit code &#39;=
1&#39;<br>
&gt; &gt; NOTE: Tasks Summary: Attempted 3854 tasks of which 3586 didn&#39=
;t need to be rerun and 2 failed.<br>
&gt; &gt; NOTE: Writing buildhistory<br>
&gt; &gt; NOTE: Writing buildhistory took: 1 seconds<br>
&gt; &gt; <br>
&gt; &gt; Summary: 2 tasks failed:<br>
&gt; &gt;=C2=A0 =C2=A0/home/jkroon/Projects/foo-linux/build/../meta-java/r=
ecipes-core/openjdk/openjdk-8-native_265.bb:do_fetch<br>
&gt; &gt;=C2=A0 =C2=A0/home/jkroon/Projects/foo-linux/build/../meta-java/r=
ecipes-core/openjdk/openjre-8_265.bb:do_fetch<br>
&gt; &gt; Summary: There were 2 WARNING messages shown.<br>
&gt; &gt; Summary: There were 4 ERROR messages shown, returning a non-zero=
 exit code.<br>
<br>
<br>
It seems Oracle shut down the complete <a href=3D"http://java.net" rel=3D"=
noreferrer" target=3D"_blank">java.net</a> site...<br>
<br>
&quot;We&#39;re sorry the <a href=3D"http://java.net" rel=3D"noreferrer" t=
arget=3D"_blank">java.net</a> site has closed.<br>
<br>
Most Open Source projects previously hosted on <a href=3D"http://java.net"=
 rel=3D"noreferrer" target=3D"_blank">java.net</a> have been<br>
relocated. Please contact the corresponding project administrator for<br>
relocation information.&quot;<br>
<br>
Does anybody know where the official repository was relocated to?<br>
<br>
The only thing I&#39;m aware of is the read only mirror at<br>
<a href=3D"https://github.com/openjdk/jdk" rel=3D"noreferrer" target=3D"_b=
lank">https://github.com/openjdk/jdk</a> which doesn&#39;t host the jdk8u A=
FAIK...<br>
<br>
regards;rl<br>
<br>
<br>
</blockquote></div>

--000000000000430be605ad9bea03--
