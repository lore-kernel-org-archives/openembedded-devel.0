Received: from [82.119.242.94] (helo=mail.suse.cz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <utx@penguin.cz>) id 1JfBfC-0002mV-Dx
	for openembedded-devel@openembedded.org; Fri, 28 Mar 2008 11:18:22 +0100
Received: from [10.20.1.86] (hammer.suse.cz [10.20.1.86])
	by mail.suse.cz (Postfix) with ESMTP id 3BB956280C6;
	Fri, 28 Mar 2008 11:18:22 +0100 (CET)
From: Stanislav Brabec <utx@penguin.cz>
To: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel@openembedded.org>
In-Reply-To: <1206696274.5029.14.camel@dax.rpnet.com>
References: <20080328011211.7c66e00b@zaurus>
	<1206696274.5029.14.camel@dax.rpnet.com>
Date: Fri, 28 Mar 2008 11:20:05 +0100
Message-Id: <1206699605.18251.39.camel@hammer.suse.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.22.0 
Subject: Re: binconfig.bbclass breaks packages QA
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 28 Mar 2008 10:18:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Richard Purdie wrote:
> On Fri, 2008-03-28 at 01:12 +0100, Stanislav Brabec wrote:

> > After the fix, maybe binconfig files could be moved to the
> > standard staging directory (it must be in build path then).
> >=20
> > Could anybody with deeper insight confirm it or do this change?
>=20
> We still need that mangling unfortunately.

Grr.

| CROSS COMPILE Badness: /usr/include in INCLUDEPATH: /usr/include/freety=
pe2
| cc1: internal compiler error: in add_path, at c-incpath.c:371

We may want -isysroot instead of -isystem (and report bug above to gcc
developers, as the report advices), but only for cross builds.

Exactly, we may want to set CFLAGS to -isysroot=3D (to root to target
system) and HOST_CFLAGS to -isystem=3D (to make visible our native stagin=
g
system) for cross builds and =EF=BB=BFCFLAGS to -isystem=3D for native bu=
ilds.
Maybe even more.

Automake based programs should be smart enough to discriminate between
build of native compile-time helper and target binary. (But I guess,
that some of them may fail.)

       -isystem dir
           Search dir for header files, after all directories specified b=
y -I
           but before the standard system directories.  Mark it as a syst=
em
           directory, so that it gets the same special treatment as is ap=
plied
           to the standard system directories.  If dir begins with "=3D",=
 then
           the "=3D" will be replaced by the sysroot prefix; see --sysroo=
t and
           -isysroot.
       -isysroot dir
           This option is like the --sysroot option, but applies only to
           header files.  See the --sysroot option for more information.
       --sysroot=3Ddir
           Use dir as the logical root directory for headers and librarie=
s.
           For example, if the compiler would normally search for headers=
 in
           /usr/include and libraries in /usr/lib, it will instead search
           dir/usr/include and dir/usr/lib.


> The problem is that package b
> should not be injecting the results from binconfig directly into a .pc
> file, it should be using things like -L${libdir}/foo, not
> -L/some/hardcoded/path.

No, in this case it is correct (at least from upstream aspect of view).
Application may never know, that ${prefix} of the foo-config is equal to
${prefix} of me. So it has to trust, that foo-config application
provided correct cflags.

> I'll have a look at that package and see if I can fix it.

I just tried to disable mangling and rebuilt from scratch.

I got QA error:
ERROR: Task 2095 (/OE/org.openembedded.dev/packages/fontconfig/fontconfig=
_2.4.1.bb, do_qa_configure) failed
=EF=BB=BF
So I disabled the QA check, and I got above mentioned internal compiler e=
rror.

=EF=BB=BFWell, I tried to replace -isystem by -isysroot, but native build=
s don't
like it:

shasum-native-1.0-r1:
main.c:1:19: error: stdio.h: No such file or directory

Hmmm. And I don't know, how to set CFLAGS differently for native and
cross builds.

--=20
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



