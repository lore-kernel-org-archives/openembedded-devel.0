Received: from [209.85.132.251] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MJ9zi-0006gu-MA
	for openembedded-devel@openembedded.org; Tue, 23 Jun 2009 19:41:19 +0200
Received: by an-out-0708.google.com with SMTP id c38so96909ana.30
	for <openembedded-devel@openembedded.org>;
	Tue, 23 Jun 2009 10:30:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=l+p91EUv35y7S4ANvJ3L+jiAUo4mGC5k98fAzVT695o=;
	b=Wff4iIBNFTef4xIAs0Snt+FSa770k0lpJ6SjEEFQYxqxQ3bVUHiq8se4Ii2NIDipTp
	+1Kpl/3Tnz2ISsciVfbjvUHFVMUSSxRJmfpi00sq/4ZHUjJx741X1MJDftJDcf4MG0lW
	vZK/f2IKPmS0Ap34sddE1SKipZEnUQD06iwIE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=bARjeT75UCNtw2pVRBo0oQ0Bcc+KgEY1jnHaoaqnqC7MZuYR4GkNpmurxK8YQnonEI
	u91N51p6klrDgkHaL7U+i4TF4NOoVlEE6v9K+zedMkRCzDDVb6fltX10mJ7T/zaAnPY9
	kuw+m4vIk2UEG+3KrFrJ2DNRYY7eFjgBTsICg=
MIME-Version: 1.0
Received: by 10.231.14.3 with SMTP id e3mr123591iba.13.1245778213378; Tue, 23 
	Jun 2009 10:30:13 -0700 (PDT)
In-Reply-To: <f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
References: <1244836535.4151.140.camel@lenovo.internal.reciva.com>
	<1244838263.5958.34.camel@dax.rpnet.com>
	<f96d234e0906181109y4ee832bcu7b53037c917709be@mail.gmail.com>
Date: Tue, 23 Jun 2009 10:30:13 -0700
Message-ID: <19c1b8a90906231030i3e810672j13ca95b56c647022@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: openembedded-devel@openembedded.org
Subject: Re: [rfc] change default for BUILD_OPTIMIZATION, remove spurious 	assignments
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
X-List-Received-Date: Tue, 23 Jun 2009 17:41:21 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 18, 2009 at 11:09 AM, Cliff Brake<cliff.brake@gmail.com> wrote:
> On Fri, Jun 12, 2009 at 4:24 PM, Richard Purdie<rpurdie@rpsys.net> wrote:
>> On Fri, 2009-06-12 at 20:55 +0100, Phil Blundell wrote:
>>> I'd like to propose changing the bitbake.conf default for
>>> BUILD_OPTIMIZATION from "-O2" to "-O2 -g". =C2=A0There seems no harm in
>>> building debuggable binaries for host-side utilities and it makes life
>>> somewhat easier when things go wrong.
>>>
>>> Also, while investigating why assignments to this variable from
>>> local.conf didn't do what I was expecting, I discovered that a whole lo=
t
>>> of files inside conf/, notably all of the sane-toolchain-*.inc files,
>>> contain their own assignments to BUILD_OPTIMIZATION for no good reason
>>> that I can see. =C2=A0I would also propose to delete the assignments fr=
om
>>> those files. =C2=A0(There are a few other assignments in files that are
>>> either DISTRO or MACHINE specific but I intend to leave those alone.)
>>
>> Acked-by: Richard Purdie <rpurdie@linux.intel.com>
>>
>> Poky actually uses -ggdb now which makes the -dbg packages useful (if
>> huge).
>
> Poky currently uses:
> ##################################################################
> # Optimization flags.
> ##################################################################
>
> FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2 -ggdb -feliminate-unused-debug-types"
> DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -g"
> SELECTED_OPTIMIZATION =3D "${@bb.data.getVar(['FULL_OPTIMIZATION',
> 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d,
> 1)}"
> BUILD_OPTIMIZATION =3D "-O2"
>
> OE uses:
> ##################################################################
> # Optimization flags.
> ##################################################################
>
> FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2"
> DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -g"
> SELECTED_OPTIMIZATION =3D "${@bb.data.getVar(['FULL_OPTIMIZATION',
> 'DEBUG_OPTIMIZATION'][bb.data.getVar('DEBUG_BUILD', d, 1) =3D=3D '1'], d,
> 1)}"
> BUILD_OPTIMIZATION =3D "-O2 -g"
>
> I agree, debug symbols are nice in *dbg packages. =C2=A0Are there any oth=
er
> thoughts pro/con for changing OE to match Poky FULL_OPTIMIZATION
> settings?
>
> As to -ggdb3, the following information may be helpful.
>
> -ggdblevel
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Request debugging information and also=
 use level to specify
> how much information. =C2=A0The default level is 2.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Level 0 produces no debug information =
at all. =C2=A0Thus, -g0 negates -g.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Level 1 produces minimal information, =
enough for making
> backtraces in parts of the program that you don=E2=80=99t plan to debug.
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 This includes descriptions of function=
s and external
> variables, but no information about local variables and no line
> numbers.
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Level 3 includes extra information, su=
ch as all the macro
> definitions present in the program. =C2=A0Some debuggers support macro
> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 expansion when you use -g3.
>
> So maybe a good way to do this is:
> FULL_OPTIMIZATION =3D "-fexpensive-optimizations -fomit-frame-pointer
> -frename-registers -O2 -ggdb -feliminate-unused-debug-types"

-feliminate-unused-debug-types should only affect stabs which I guess we
do not use. We could use -feliminate-dwarf2-dups if we are using dwarf2
 -frename-registers was a workaround to get past a ARM GCC ICE in 4.2 IIRC
we should get rid of it.

-fexpensive-optimizations and -fomit-frame-pointer are passed by
default at O2 so we should get rid of them too.

Should we also use something SIZE_OPTIMIZATION combination ?

> DEBUG_OPTIMIZATION =3D "-O -fno-omit-frame-pointer -ggdb3"
> BUILD_OPTIMIZATION =3D "-O2 -ggdb"
>
> That way with *dbg packages installed, you could at least get a back
> trace with a normal build. =C2=A0If you needed line numbers, you could se=
t
> DEBUG_BUILD and rebuild packages of interest.
>
> Any thoughts on -g vs -ggdb for BUILD_OPTIMIZATION?
>
> Thanks,
> Cliff
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


