Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f196.google.com (mail-yw0-f196.google.com
	[209.85.161.196])
	by mail.openembedded.org (Postfix) with ESMTP id AFD26719A4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 17:07:59 +0000 (UTC)
Received: by mail-yw0-f196.google.com with SMTP id p144so13213371ywp.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 10:08:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=i/OAGnpPGOPc/dPVCtedT128DunmU+nsvJ+WwhYnyPY=;
	b=mxly7iLRMPaP56WehjHDU9WLBPgZnlLmqK0i6Os3TTLvnwJ8H0tV6qpB5w1bEwqea0
	WmDavRBH2F4kLez8QXCbkrk1eIIsETO301MRcuhjTBmIMgd426TBGRCfhBWiFQQ2egOk
	6rbi70O0HldnmrKdqvl8bJnOpwvBw0x9P0KmZrHCmdgBo27okih1u8uSCCFxKpPTwyTl
	l4HBUa4jZZG3E8dyjEM9HxPrhB3zlVNBYTItBgJzgjx/xyIjRQP0qMHbUqJ4aI0HJgCc
	tFiRPCjS/VRG9MIFji1BfTunxju9LyvyBI5/Wj1Nki6EQToYUzPT4YzZhVlClx3MtsWP
	uBag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=i/OAGnpPGOPc/dPVCtedT128DunmU+nsvJ+WwhYnyPY=;
	b=rlDm8d0MANcZrP5mGII35A0gfFw3rB7+FVFLeE15SDc7N0LplbN5m+DtBZ9iftKkDa
	OOwDQG5kvU2gRPWgSibIHgHewNGIIVrxR1OTK/Nc+BRMxI/LfPocpv/DI9qVlf20hx2M
	fI6u/I+6ZkLJzn2s7xlxF0dlpO2Jw6Eey38oEMIlwwZHDmbaHIGAxj3OG/ZKAr9G3IBl
	RsgcyNEf/mgeGOEUhdkkfuGzZxEcNz3zY9fFEiIlBoGMMQ5IbYUmonSfDh7JeNNAcz7Z
	ursmoSbR58h+Cd8uchAWT34OyJ7VkfAo8BRX6auMMkJPja0qf3Cs2AqRj0IdBFApSM+V
	hs7w==
X-Gm-Message-State: AODbwcD028WAkUyuBmSodEZlvQPdpuD4xipJHhn6u6piEv81D0NPV6gk
	psmvCeT3rlZCy4FuWlUGavn2FBl0ww==
X-Received: by 10.129.82.68 with SMTP id g65mr21812976ywb.33.1495645680084;
	Wed, 24 May 2017 10:08:00 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.162.38 with HTTP; Wed, 24 May 2017 10:07:59 -0700 (PDT)
In-Reply-To: <CA+chaQcTOv_sa3_j7_4xH-k01mkhN+QLhrSoCasBfoSnJdABSA@mail.gmail.com>
References: <20170524153407.22969-1-dl9pf@gmx.de>
	<CAMKF1spe_4B86YGpY-SmNw6K-deJqnT5j1mDDSn7bqtiB1SpLg@mail.gmail.com>
	<CA+chaQc+Lzfkx0=0r_2cwLcRT3CuFhAqgq46Kdn7wh0_moE6BA@mail.gmail.com>
	<CA+chaQcTOv_sa3_j7_4xH-k01mkhN+QLhrSoCasBfoSnJdABSA@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 24 May 2017 19:07:59 +0200
Message-ID: <CA+chaQdQPSvbnz0FPvF30ga6dJgdZFUox1952qgnqJaFUJ3B_A@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>, Tom King <ka6sox@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] [meta-oe][master, morty] sg3-utils upstream SRC_URI unavailable
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
X-List-Received-Date: Wed, 24 May 2017 17:08:00 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I've fixed it for now.

sources.openembedded.org points to /home/home2/jenkins/htdocs/oe-sources/

While jenkins jobs rsync it to /home5/jenkins/htdocs/oe-sources/,

I don't know who moved it or why, so I've just rsynced current state:
$ rsync -avir /home5/jenkins/htdocs/oe-sources/
/home/home2/jenkins/htdocs/oe-sources/

Removed confusing and outdated index* files
$ rm -f /home/home2/jenkins/htdocs/oe-sources/index*

and some weird empty directories:
$ rmdir  fixes i586/ images/ licenses/ opensuse/ opkg/conf opkg pam.d porti=
ng
prefs scripts share test touchscreen/ x86_64/ iceweasel-branding/ arm
backport chromium-40/ debian-hacks/ debian1.0.2/ eglibc-2.17/ etc/default/
etc/init.d/ etc debian/fixes/ debian/

and a bit more:
jenkins@milla:/home/home2/jenkins/htdocs/oe-sources$ find home/
home/
home/jenkins
home/jenkins/oe
home/jenkins/oe/world
home/jenkins/oe/world/shr-core
home/jenkins/oe/world/shr-core/openembedded-core
home/jenkins/oe/world/shr-core/openembedded-core/scripts
home/jenkins/oe/world/shr-core/tmp-glibc
home/jenkins/oe/world/shr-core/tmp-glibc/work
home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi
home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/lsof
home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linux-gnueabi/lsof/=
4.88-r0

home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5e-oe-linu
x-gnueabi/lsof/4.88-r0/lsof_4.88
home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi
home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/lsof
home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/lsof=
/4.88-r0

home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-
linux-gnueabi/lsof/4.88-r0/lsof_4.88
home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-linux-gnueabi/lsof=
/4.89-r0

home/jenkins/oe/world/shr-core/tmp-glibc/work/armv5te-oe-
linux-gnueabi/lsof/4.89-r0/lsof_4.89
home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux
home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lsof
home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lsof/4.88-r=
0

home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lsof/4.88-r=
0/lsof_4.88

home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lsof/4.89-r=
0

home/jenkins/oe/world/shr-core/tmp-glibc/work/core2-64-oe-linux/lsof/4.89-r=
0/lsof_4.89

home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux
home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lsof
home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lsof/4.88-r0
home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lsof/4.88-r0/ls=
of_4.88

home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/lsof/4.89-r0
home/jenkins/oe/world/shr-core/tmp-glibc/work/i586-oe-linux/
lsof/4.89-r0/lsof_4.89
$ rm -rf home/
$ du -hs git
581M    git
$ rm -rf git/ (someone with cow powers here will need to remove this as
some files were owned by different than jenkins account)
$ ls -lah git/www.sakoman.net.git.u-boot-omap3.git/.git/refs/tags/v20
09.06-rc1
-rw-r--r--+ 1 tking admin 41 Oct 27  2009 git/www.sakoman.net.git.u-boot
-omap3.git/.git/refs/tags/v2009.06-rc1
similarly with:
$ du -hs svn cvs hg bzr
1.4M    svn
932K    cvs
8.0K    hg
20K     bzr

Please also chown following 4 files to be owned by jenkins:jenkins
-rw-r--r--+  1 www-data www-data  4.4M Apr 14  2016 git2_git.lighttpd.net.
lighttpd.lighttpd-1.x.git.tar.gz
-rw-r--r--+  1 www-data www-data    89 Apr 14  2016 git2_git.lighttpd.net.
lighttpd.lighttpd-1.x.git.tar.gz.md5
-rw-r--r--   1 root     root      237K Apr 27  2016 zaurus-legacy-tar.gz
-rw-r--r--   1 root     root        55 Apr 27  2016 zaurus-legacy-tar.gz.md=
5

And in the end I've created backup if anyone misses
mv /home5/jenkins/htdocs/oe-sources/ /home5/jenkins/htdocs/oe-sources-old

and replaced the old one with symlink to /home/home2/jenkins/htdocs/oe-sour=
ces/
so it should be updated automatically until someone moves it again
somewhere else.

Regards,





On Wed, May 24, 2017 at 5:51 PM, Martin Jansa <martin.jansa@gmail.com>
wrote:

> +Tom
>
> the archives are correctly rsynced to milla:
>
> jenkins@milla:~$ ls htdocs/oe-sources/sg3*
> htdocs/oe-sources/sg3-utils_1.24.orig.tar.gz
> htdocs/oe-sources/sg3-utils_1.24.orig.tar.gz.md5
> htdocs/oe-sources/sg3_utils-1.31.tgz
> htdocs/oe-sources/sg3_utils-1.38.tgz
> htdocs/oe-sources/sg3_utils-1.40.tgz
> htdocs/oe-sources/sg3_utils-1.41.tgz
> htdocs/oe-sources/sg3_utils-1.42.tgz
>
>
> but they don't appear on http://sources.openembedded.org/ can you check
> what went wrong? The DNS might point to different host or something like
> that, because there are no archives from 2016 or 2017 (newest I've seen a=
re
> from April 2015) and I think it was working a bit longer than that.
>
> On Wed, May 24, 2017 at 5:45 PM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
>
>> Why do you introduce the bbappend instead of fixing it in
>> ./meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bb ?
>>
>> It should be on sources.openembedded.org (everything built in my bitbake
>> world should be rsynced there, will check where it got broken this time)=
.
>>
>> On Wed, May 24, 2017 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>>> On Wed, May 24, 2017 at 8:34 AM,  <dl9pf@gmx.de> wrote:
>>> > From: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
>>> >
>>> > This patch temporarily fixes the unavailable upstream URL for sg3-uti=
ls
>>> > with an bbappend that redirects the SRC_URI to a mirror.
>>> > Checksums match.
>>> >
>>> > Signed-off-by: Jan-Simon M=C3=B6ller <dl9pf@gmx.de>
>>> > ---
>>> >  meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend | 2 ++
>>> >  1 file changed, 2 insertions(+)
>>> >  create mode 100644 meta-oe/recipes-support/sg3-ut
>>> ils/sg3-utils_1.42.bbappend
>>> >
>>> > diff --git a/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappen=
d
>>> b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
>>> > new file mode 100644
>>> > index 000000000..aeef696cf
>>> > --- /dev/null
>>> > +++ b/meta-oe/recipes-support/sg3-utils/sg3-utils_1.42.bbappend
>>> > @@ -0,0 +1,2 @@
>>> > +# Upstream URL currently unavailable. Use mirror:
>>> > +SRC_URI =3D "https://fossies.org/linux/misc/sg3_utils-${PV}.tgz"
>>>
>>> Can we also host it on sources.openembedded.org please ?
>>>
>>> > --
>>> > 2.12.0
>>> >
>>> > --
>>> > _______________________________________________
>>> > Openembedded-devel mailing list
>>> > Openembedded-devel@lists.openembedded.org
>>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>> --
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>>
>>
>>
>

