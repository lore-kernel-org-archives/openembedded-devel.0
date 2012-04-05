Received: from mail-wg0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrei@gherzan.ro>) id 1SFhLX-0001A8-0x
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2012 09:43:07 +0200
Received: by wgbdr12 with SMTP id dr12so869597wgb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2012 00:33:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:x-originating-ip:in-reply-to:references:date
	:message-id:subject:from:to:content-type:x-gm-message-state;
	bh=5UeAIurhpdFierXMrdd7RvPUzQcADBaN64rLpCigbgg=;
	b=F2/mGFdxwlXMkGeh6FsKz8lnwJ8SiX1DiWrqc9iF8LiorKFnTPycqUxO9d5FFq14QM
	ieyX2KuJYL8b0MVMs6KuSElbhfd70karhJT+0tTy2rCAwZLlQ98aq3B7Zw6zIXXwPqZx
	8DAF7PdDoMKQd3DpUINyPtqPoY5A/UJDALc9E7zhGloKGWOmzr7uf22j7MHe8KQjE6aA
	nApVZ2vUe4G8Q6UfiHeqxU2HqjBs6ag60LnAVdkThXBywmJZiqO7+yBskRS/PggY+s+q
	qHhfOJ6SExJHc+a283+bajkijvQV5FLnsq+A145Qm+5JiS+SOgUjpZYbPxATPwGr3Xc9
	ZlQQ==
MIME-Version: 1.0
Received: by 10.180.24.35 with SMTP id r3mr10398318wif.7.1333611235658; Thu,
	05 Apr 2012 00:33:55 -0700 (PDT)
Received: by 10.227.158.16 with HTTP; Thu, 5 Apr 2012 00:33:55 -0700 (PDT)
X-Originating-IP: [79.115.103.32]
Received: by 10.227.158.16 with HTTP; Thu, 5 Apr 2012 00:33:55 -0700 (PDT)
In-Reply-To: <20120404200036.GI4181@jama.jama.net>
References: <20120402210435.GA10553@hermes>
	<CAK18fxG5zusOY+WwnhBatbQ-3Kt8PUmHaafWoHTO=eWYzZ0Kyw@mail.gmail.com>
	<20120404195704.GA16410@hermes>
	<20120404200036.GI4181@jama.jama.net>
Date: Thu, 5 Apr 2012 10:33:55 +0300
Message-ID: <CAK18fxEqNka=VKjpF0yD-iExz6pBVpJuUvSCEhxtQfwmP8Qiig@mail.gmail.com>
From: Andrei Gherzan <andrei@gherzan.ro>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQmNToYQN+oVGpiJNBj6lofBiQhv4UoFSE0yR8OWsg7kFRh0PHcAK9Wjgcqqo3bpjkcUUSqS
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Package build failure
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 05 Apr 2012 07:43:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Or you can specify a tag in  src_uri. Something like SRC_URI =3D
"git://bla.git;protocol=3Dgit;tag=3Dmytag"
On Apr 4, 2012 11:01 PM, "Martin Jansa" <martin.jansa@gmail.com> wrote:

> On Wed, Apr 04, 2012 at 09:57:04PM +0200, Apelete Seketeli wrote:
> > Le 03-Apr-12, Andrei Gherzan a =E9crit:
> > > On Tue, Apr 3, 2012 at 00:04, Apelete Seketeli <apelete@seketeli.net>
> wrote:
> > > >
> > > > It seems http://svn.openmoko.org is unreachable.
> > > > How can I resolve this issue ?
> > > >
> > > >
> > > You actually cant solve this issue as the upstream link is down. You
> have
> > > two simple choices:
> > > 1. Find an upstream mirror
> > > 2. Use a local archive instead.
> >
> > Thanks for the advice.
> > I decided to try this upstream mirror:
> > http://git.yoctoproject.org/cgit/cgit.cgi/opkg-utils/.
> >
> > So I replaced the SRC_URI as follow (hereafter is the content of
> > opkg-utils_svn.bb):
>
> You need at least replace SRCREV with something valid for git as error
> suggests.. see
>
> http://git.openembedded.org/openembedded-core/tree/meta/recipes-devtools/=
opkg-utils/opkg-utils_git.bb
>
> >
> >
> > ~~ beginning of file ~~
> > DESCRIPTION =3D "OPKG Package Manager Utilities"
> > SECTION =3D "base"
> > HOMEPAGE =3D "http://wiki.openmoko.org/wiki/Opkg"
> > PRIORITY =3D "optional"
> > LICENSE =3D "GPLv2"
> > RDEPENDS_${PN} =3D "python"
> > RDEPENDS_${PN}_virtclass-native =3D ""
> > SRCREV =3D "4747"
> > PV =3D "0.1.8+svnr${SRCPV}"
> > PR =3D "r7"
> >
> > SRC_URI =3D "git://git.yoctoproject.org/opkg-utils;protocol=3Dgit \
> >            file://index-ignore-filenotfound.patch \
> >            file://arfile_header_split.patch \
> >            file://mtime-int.patch"
> >
> > S =3D "${WORKDIR}/opkg-utils"
> >
> > # Avoid circular dependencies from package_ipk.bbclass
> > PACKAGES_virtclass-native =3D ""
> >
> > do_install() {
> >         oe_runmake PREFIX=3D${prefix} DESTDIR=3D${D} install
> > }
> >
> > BBCLASSEXTEND =3D "native"
> > TARGET_CC_ARCH +=3D "${LDFLAGS}"
> > ~~ end of file ~~
> >
> >
> > During the execution of my test command 'bitbake nano' I get the
> > following error:
> >
> >
> > ~~ beginning of build output ~~
> > NOTE: Running task 352 of 557 (ID: 70,
> virtual:native:/home/apelete/devel/openembedded/master/recipes/opkg-utils=
/
> opkg-utils_svn.bb, do_fetch)
> > NOTE: package opkg-utils-native-0.1.8+svnr0+4747-r7: task do_fetch:
> Started
> > NOTE: package gcc-cross-4.5-r38.1+svnr170880: task do_populate_sysroot:
> Succeeded
> > NOTE: Running task 353 of 557 (ID: 156,
> /home/apelete/devel/openembedded/master/recipes/libtool/
> libtool-cross_2.4.bb, do_configure)
> > NOTE: package libtool-cross-2.4-r28.2: task do_configure: Started
> > From git://git.yoctoproject.org/opkg-utils
> >   * branch            master     -> FETCH_HEAD
> >  fatal: Not a valid object name 4747
> > WARNING: /usr/lib/pymodules/python2.7/bb/fetch/git.py:191:
> DeprecationWarning: Call to deprecated function bb.mkdirhier: Please use
> bb.utils.mkdirhier instead.
> >   bb.mkdirhier(codir)
> >
> > NOTE: package opkg-utils-native-0.1.8+svnr0+4747-r7: task Fetch failed:
> Unable to fetch URL git://git.yoctoproject.org/opkg-utils;protocol=3Dgitf=
rom any source.: Failed
> > ERROR: Function 'Fetch failed: Unable to fetch URL git://
> git.yoctoproject.org/opkg-utils;protocol=3Dgit from any source.' failed
> > ERROR: Task 70
> (virtual:native:/home/apelete/devel/openembedded/master/recipes/opkg-util=
s/
> opkg-utils_svn.bb, do_fetch) failed with exit code '1'
> > Waiting for 1 active tasks to finish:
> > 0: libtool-cross-2.4-r28.2 do_configure (pid 12101)
> > NOTE: package libtool-cross-2.4-r28.2: task do_configure: Succeeded
> > ERROR:
> 'virtual:native:/home/apelete/devel/openembedded/master/recipes/opkg-util=
s/
> opkg-utils_svn.bb' failed
> > ~~ end of build output ~~
> >
> >
> > My guess is that the opkg-utils_svn.bb file now needs more changes, to
> > adapt to the new SRC_URI: it was an svn link and the mirror is now a
> > git link.
> >
> > Somebody care to help some more ?
> > --
> >         Apelete
> >
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>

