Received: from mail-lpp01m010-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1S521V-00016B-Tj
	for openembedded-devel@lists.openembedded.org;
	Tue, 06 Mar 2012 22:34:22 +0100
Received: by lagw12 with SMTP id w12so6802856lag.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 06 Mar 2012 13:25:45 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.112.85.70 as permitted sender) client-ip=10.112.85.70; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.112.85.70 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.112.85.70])
	by 10.112.85.70 with SMTP id f6mr12378806lbz.16.1331069145856 (num_hops
	= 1); Tue, 06 Mar 2012 13:25:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=u8ISR4azC3IunNh+LMGdgL2viUNX4yqsBzurvwMxFgI=;
	b=KG6ZErXJ5gBFDTvz1vEdSUlsXUboO19ig1qxwHI4BScpuY4hXh9H6w4BG9EoypxTsZ
	/ZBPr0jcv/8BjTuBvbwswFSGt8fN5vWc8N+VHsjy+84k9IihiUGuoUx0EQOouUHIHYBH
	sWnBQSFZyJYjry8l2jH4irGY6ffbknzKGNgi9BQKE8Wa7puNbloyGJ9Ljb6I0ricHM7w
	bVz1L8qRYUb6qneEuQZ7q378XjQjAtvlLW8ub0vzK2HBi5lYykoR4CVy+G8qLuO7QbfD
	INIBacoM4pZaes2q/1Jpjcyykq1GvQ+FNxCb/UAHBv1bJjozD70P/J611ppgEB0c6E7R
	R53Q==
Received: by 10.112.85.70 with SMTP id f6mr10125997lbz.16.1331069145394; Tue,
	06 Mar 2012 13:25:45 -0800 (PST)
MIME-Version: 1.0
Received: by 10.152.27.109 with HTTP; Tue, 6 Mar 2012 13:25:14 -0800 (PST)
In-Reply-To: <4F56622F.8040803@gmail.com>
References: <1330980801-19523-1-git-send-email-tworaz666@gmail.com>
	<20120306015941.GC6841@sakrah.homelinux.org>
	<4F56622F.8040803@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 6 Mar 2012 13:25:14 -0800
Message-ID: <CAMKF1sqqCDcFv970c0TZU-tn41wpuH_rKDyYf5_xciuWwETajw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe] zsh: Add initial recipe for version 4.3.17.
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
X-List-Received-Date: Tue, 06 Mar 2012 21:34:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 6, 2012 at 11:14 AM, Piotr Tworek <tworaz666@gmail.com> wrote:
> On 03/06/2012 02:59 AM, Khem Raj wrote:
>> On (05/03/12 21:53), Peter Tworek wrote:
>>> Run tested on netbook pro.
>>>
>>> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
>>> ---
>>> =C2=A0meta-oe/recipes-extended/zsh/zsh_4.3.17.bb | =C2=A0 51 ++++++++++=
++++++++++++++++++
>>> =C2=A01 files changed, 51 insertions(+), 0 deletions(-)
>>> =C2=A0create mode 100644 meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>>>
>>> diff --git a/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb b/meta-oe/recip=
es-extended/zsh/zsh_4.3.17.bb
>>> new file mode 100644
>>> index 0000000..9192f20
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/zsh/zsh_4.3.17.bb
>>> @@ -0,0 +1,51 @@
>>> +DESCRIPTION =3D "UNIX Shell similar to the Korn shell"
>>> +HOMEPAGE=3D"http://www.zsh.org"
>>> +SECTION =3D "base/shell"
>>> +
>>> +LICENSE =3D "ZSH"
>>> +LIC_FILES_CHKSUM =3D "file://LICENCE;md5=3Dad234d4b46db63491c4a9789da4=
fb341"
>>> +
>>> +DEPENDS =3D "ncurses libcap libpcre gdbm groff-native"
>>> +
>>> +SRC_URI =3D "ftp://ftp.zsh.org/pub/${P}.tar.bz2"
>>> +SRC_URI[md5sum] =3D "8258967060b2654f30001a011946ac6a"
>>> +SRC_URI[sha256sum] =3D "054e0452afd9c742c9f1489465175e1d4d7db50d88b602=
d132551d850cf7a704"
>>> +
>>> +FILES_${PN}-dbg +=3D "\
>>> + =C2=A0 =C2=A0${libdir}/${PN}/${PV}/${PN}/.debug/*.so \
>>> + =C2=A0 =C2=A0${libdir}/${PN}/${PV}/${PN}/db/.debug/*.so \
>>> + =C2=A0 =C2=A0${libdir}/${PN}/${PV}/${PN}/net/.debug/*.so \
>>> + =C2=A0 =C2=A0"
>>> +
>>> +inherit autotools
>>> +
>>> +EXTRA_OECONF =3D " \
>>> + =C2=A0 =C2=A0--bindir=3D${base_bindir} \
>>> + =C2=A0 =C2=A0--enable-etcdir=3D${sysconfdir} \
>>> + =C2=A0 =C2=A0--enable-fndir=3D${datadir}/${PN}/${PV}/functions \
>>> + =C2=A0 =C2=A0--enable-site-fndir=3D${datadir}/${PN}/site-functions \
>>> + =C2=A0 =C2=A0--enable-function-subdirs \
>>> + =C2=A0 =C2=A0--with-term-lib=3D'ncursesw ncurses' \
>>> + =C2=A0 =C2=A0--with-tcsetpgrp \
>>> + =C2=A0 =C2=A0--enable-pcre \
>>> + =C2=A0 =C2=A0--enable-cap \
>>> + =C2=A0 =C2=A0--enable-multibyte \
>>> + =C2=A0 =C2=A0--enable-gdbm \
>>> + =C2=A0 =C2=A0--enable-dynamic \
>>> + =C2=A0 =C2=A0zsh_cv_shared_environ=3Dyes \
>>> + =C2=A0 =C2=A0"
>>> +
>>> +do_configure () {
>>> + =C2=A0 =C2=A0oe_runconf
>>> +}
>>> +
>> why do you need to run oe_runconf explicitly.
>
> Because I want to avoid invoking autotools, I just need to run
> configure. I wrote this recipe some time ago, but from what I remember
> zsh comes with some preloaded m4 macros that cause problems when default
> autootols do_configure() step is executed. The preloaded configure
> scripts works fine, even when cross-compiling. IMO it's better to use it
> than to patch the package.

generated .la files will not work which may not be so much of an issue
for zsh. Usually we autoreconf and thats to avoid compatibility issues


