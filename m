Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web10.1573.1627942621301197885
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 02 Aug 2021 15:17:01 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=i/3o4lIi;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: b.hutchman@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id z3so20018620plg.8
        for <openembedded-devel@lists.openembedded.org>; Mon, 02 Aug 2021 15:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CH+9leg9yuKjDS+YRKNzkdng/h3I2Z0vd/C93NloM4c=;
        b=i/3o4lIio7jYbmtz/48RZg3g/g4sALrW5Jmd+3EnGsvS91VfWjJ1we6AYuDCm1smTD
         K1HV+taeWruWRnu/gwagnJWZWFobHvL9PAA3V3+KTQ4QGoCZTbm+MqfnVogbo3bdq/0P
         uoKDU6yRwK/YNVShsV2L/zKpERHXOXj/qFGTE5eQNl4YfdUEHI5PeOHQGgTKQFYX+KKE
         wsJ2hiOuIXcZ0/vEVqpK3IJ5o611GpDI6t+5+Fqc871swU4NAhJBuAnNFwMaFuhmE5aP
         O6goWOFylKmBoIea8Dnu/fo51tfabH13aHQqlg48fZlwHQfMJjfP3Mzk/U6D+lD8WHEo
         YoFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CH+9leg9yuKjDS+YRKNzkdng/h3I2Z0vd/C93NloM4c=;
        b=eblG8QBG3o+gnFsRx/tZmnTOZuKF+smOkeoqhNd7FhiAHhahV8/sNmLk9ukHbafwfb
         KOr5Izsvru6pZbdLokujKO0QDUuj0cVxPMkFXhYM7GFcbrXZyfgY8bGYyWi96qBI6EBB
         yZbFUF8KTd+Wvm2yz/2kQt9eF+lvrUyYYZJQzka09J1BrZPhiESHeJNLuNeqtRf95ksj
         bVdAKoXkVu4Hieg7/ntp/WfRO3OKfG9dHZE6flgKfQS8cvVaIuoXBOP9/g0+YtUMLkGC
         dnZamdtec2f5tC2NjJjrQSAKLR0D/t7LiMBJ4opC5B4ykMG73y9wUN5r9cfFILwohNr9
         NbsQ==
X-Gm-Message-State: AOAM531XDHpjmuZeJEPnLlIIRY8lFXcH1Df8Bs+blimFiF17apqrXmhk
	7194TSnfNsVV/q2FVhKhja0PdbK6ugfqeZI5drI=
X-Google-Smtp-Source: ABdhPJxvhSE6x9st9tHdLH+jeW4qe/VrVkDrurooqNkClcVpidM9GDup9Cnl/7cuDyiEOFmdYTICrb7N8/szD+IucTk=
X-Received: by 2002:a65:4307:: with SMTP id j7mr2989755pgq.387.1627942620743;
 Mon, 02 Aug 2021 15:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <CAFZh4h8HhO5EMV8k4y6a8pMFOMO9Wv68zAO+Zy6KJSEUFePRFw@mail.gmail.com>
 <6c1da27d-dc2b-7a32-ad5d-cade68a796f8@gmail.com>
In-Reply-To: <6c1da27d-dc2b-7a32-ad5d-cade68a796f8@gmail.com>
From: "Brian Hutchinson" <b.hutchman@gmail.com>
Date: Mon, 2 Aug 2021 18:16:49 -0400
Message-ID: <CAFZh4h8r3XOuNWA-3h9yraUZ+U7PLnPd7hxDLcyEQGiVM6EqrA@mail.gmail.com>
Subject: Re: [oe] Any way to make cryptsetup smaller? I have a small 32M NOR flash and 11M SquashFS rootfs.
To: Khem Raj <raj.khem@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: multipart/alternative; boundary="0000000000009fcd3605c89aed8f"

--0000000000009fcd3605c89aed8f
Content-Type: text/plain; charset="UTF-8"

Hey Khem,

On Mon, Aug 2, 2021 at 4:05 PM Khem Raj <raj.khem@gmail.com> wrote:

>
>
> On 8/2/21 11:07 AM, Brian Hutchinson wrote:
> > Hi,
> >
> > I have a 32M NOR that I boot from and it uses a 11M SquashFS rootfs made
> > from core-image-minimal.  I'd like to add cryptsetup but doing so blows
> > my SquashFS up to 35M.
> >
> > I've looked at the recipe and package config and I see things like
> > --enable-static and other settings that look doubtful that I can build
> > cryptsetup package and get it to fit my size constraints.
> >
> > All I'm wanting to do is encrypt a filesytem and mount it as ext4.
> >
>
> Can you list all the direct/indirect dependencies that cryptsetup is
> bringing in ? perhaps buildhistory will be handy to get that information
>
> You mean something like this:

bitbake -g cryptsetup && cat pn-buildlist | grep -ve "native" | sort | uniq
WARNING: You have included the meta-virtualization layer, but
'virtualization' has not been enabled in your DISTRO_FEATURES. Some
bbappend files may not take effect. See the meta-virtualization README for
details on enabling virtualization support.
Loading cache: 100%
|###############################################################################################################################################################################################################################################|
Time: 0:00:00
Loaded 5177 entries from dependency cache.
NOTE: Resolving any missing task queue dependencies
NOTE: PN build list saved to 'pn-buildlist'
NOTE: Task dependencies saved to 'task-depends.dot'

Summary: There was 1 WARNING message shown.
acl
attr
autoconf
autoconf-archive
automake
base-files
base-passwd
bash
bash-completion
bc
binutils
binutils-cross-aarch64
bison
boost
btrfs-tools
bzip2
ca-certificates
coreutils
cryptsetup
db
dbus
dbus-test
depmodwrapper-cross
diffutils
e2fsprogs
elfutils
eudev
expat
findutils
flex
gawk
gcc
gcc-cross-aarch64
gcc-runtime
gcc-source-9.3.0
gdbm
gettext
glib-2.0
glibc
glibc-locale
gmp
gnome-desktop-testing
gnu-config
grep
icu
initscripts
iproute2
iptables
json-c
kmod
libaio
libcap
libcap-ng
libcroco
libdevmapper
liberror-perl
libffi
libgcc
libgcc-initial
libmnl
libmodule-build-perl
libmpc
libnsl2
libpcre
libtirpc
libtool
libtool-cross
libxcrypt
libxml2
linux-fslc-imx
linux-libc-headers
lvm2
lzo
m4
make
mdadm
mpfr
ncurses
openssl
opkg-utils
packagegroup-core-buildessential
perl
pkgconfig
popt
procps
ptest-runner
python3
readline
sed
shadow
shadow-securetty
shadow-sysroot
shared-mime-info
socat
sqlite3
tcp-wrappers
thin-provisioning-tools
tzdata
unzip
update-rc.d
util-linux
which
xz
zlib

Looks like everything but the kitchen sink.

Thanks,

Brian

--0000000000009fcd3605c89aed8f
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr">Hey Khem,<br></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Mon, Aug 2, 2021 at 4:05 =
PM Khem Raj &lt;<a href=3D"mailto:raj.khem@gmail.com">raj.khem@gmail.com</a=
>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px=
 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><br=
>
<br>
On 8/2/21 11:07 AM, Brian Hutchinson wrote:<br>
&gt; Hi,<br>
&gt; <br>
&gt; I have a 32M NOR that I boot from and it uses a 11M SquashFS rootfs ma=
de <br>
&gt; from core-image-minimal.=C2=A0 I&#39;d like to add cryptsetup but doin=
g so blows <br>
&gt; my SquashFS up to 35M.<br>
&gt; <br>
&gt; I&#39;ve looked at the recipe and package config and I see things like=
 <br>
&gt; --enable-static and other settings that look doubtful that I can build=
 <br>
&gt; cryptsetup package and get it to fit my size constraints.<br>
&gt; <br>
&gt; All I&#39;m wanting to do is encrypt a filesytem and mount it as ext4.=
<br>
&gt; <br>
<br>
Can you list all the direct/indirect dependencies that cryptsetup is <br>
bringing in ? perhaps buildhistory will be handy to get that information<br=
>
<br></blockquote><div>You mean something like this:</div><div><br></div><di=
v><span style=3D"font-family:monospace"><span style=3D"color:rgb(0,0,0);bac=
kground-color:rgb(255,255,255)">bitbake -g cryptsetup &amp;&amp; cat pn-bui=
ldlist | grep -ve &quot;native&quot; | sort | uniq
</span><br><span style=3D"font-weight:bold;color:rgb(255,255,84);background=
-color:rgb(255,255,255)">WARNING</span><span style=3D"color:rgb(0,0,0);back=
ground-color:rgb(255,255,255)">: </span><span style=3D"color:rgb(178,104,24=
);background-color:rgb(255,255,255)">You have included the meta-virtualizat=
ion layer, but &#39;virtualization&#39; has not been enabled in your DISTRO=
_FEATURES. Some bbappend files may not take effect. See the meta-virtualiza=
tion README for details on enabling virtualization support.</span><span sty=
le=3D"color:rgb(0,0,0);background-color:rgb(255,255,255)">
</span><br>Loading cache: 100% |###########################################=
###########################################################################=
###########################################################################=
##############################################| Time: 0:00:00
<br>Loaded 5177 entries from dependency cache.
<br><span style=3D"font-weight:bold;color:rgb(0,0,0);background-color:rgb(2=
55,255,255)">NOTE</span><span style=3D"color:rgb(0,0,0);background-color:rg=
b(255,255,255)">: Resolving any missing task queue dependencies
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0);background-colo=
r:rgb(255,255,255)">NOTE</span><span style=3D"color:rgb(0,0,0);background-c=
olor:rgb(255,255,255)">: PN build list saved to &#39;pn-buildlist&#39;
</span><br><span style=3D"font-weight:bold;color:rgb(0,0,0);background-colo=
r:rgb(255,255,255)">NOTE</span><span style=3D"color:rgb(0,0,0);background-c=
olor:rgb(255,255,255)">: Task dependencies saved to &#39;task-depends.dot&#=
39;
</span><br>
<br>Summary: There was 1 WARNING message shown.
<br>acl
<br>attr
<br>autoconf
<br>autoconf-archive
<br>automake
<br>base-files
<br>base-passwd
<br>bash
<br>bash-completion
<br>bc
<br>binutils
<br>binutils-cross-aarch64
<br>bison
<br>boost
<br>btrfs-tools
<br>bzip2
<br>ca-certificates
<br>coreutils
<br>cryptsetup
<br>db
<br>dbus
<br>dbus-test
<br>depmodwrapper-cross
<br>diffutils
<br>e2fsprogs
<br>elfutils
<br>eudev
<br>expat
<br>findutils
<br>flex
<br>gawk
<br>gcc
<br>gcc-cross-aarch64
<br>gcc-runtime
<br>gcc-source-9.3.0
<br>gdbm
<br>gettext
<br>glib-2.0
<br>glibc
<br>glibc-locale
<br>gmp
<br>gnome-desktop-testing
<br>gnu-config
<br>grep
<br>icu
<br>initscripts
<br>iproute2
<br>iptables
<br>json-c
<br>kmod
<br>libaio
<br>libcap
<br>libcap-ng
<br>libcroco
<br>libdevmapper
<br>liberror-perl
<br>libffi
<br>libgcc
<br>libgcc-initial
<br>libmnl
<br>libmodule-build-perl
<br>libmpc
<br>libnsl2
<br>libpcre
<br>libtirpc
<br>libtool
<br>libtool-cross
<br>libxcrypt
<br>libxml2
<br>linux-fslc-imx
<br>linux-libc-headers
<br>lvm2
<br>lzo
<br>m4
<br>make
<br>mdadm
<br>mpfr
<br>ncurses
<br>openssl
<br>opkg-utils
<br>packagegroup-core-buildessential
<br>perl
<br>pkgconfig
<br>popt
<br>procps
<br>ptest-runner
<br>python3
<br>readline
<br>sed
<br>shadow
<br>shadow-securetty
<br>shadow-sysroot
<br>shared-mime-info
<br>socat
<br>sqlite3
<br>tcp-wrappers
<br>thin-provisioning-tools
<br>tzdata
<br>unzip
<br>update-rc.d
<br>util-linux
<br>which
<br>xz
<br>zlib<br></span></div><div><span style=3D"font-family:monospace"><br></s=
pan></div><div><span style=3D"font-family:monospace">Looks like everything =
but the kitchen sink.</span></div><div><span style=3D"font-family:monospace=
"><br></span></div><div><span style=3D"font-family:monospace">Thanks,</span=
></div><div><span style=3D"font-family:monospace"><br></span></div><div><sp=
an style=3D"font-family:monospace">Brian<br></span> </div></div></div>

--0000000000009fcd3605c89aed8f--
