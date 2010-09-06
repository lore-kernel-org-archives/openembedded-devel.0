Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Osauz-0002dU-Db
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Sep 2010 14:35:26 +0200
Received: by iwn2 with SMTP id 2so4128029iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Sep 2010 05:34:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=BVTdaVqOsHVCoWcxDUfqpXeT1COqMWea0sFtxeE9UPM=;
	b=TCsivsF42ZVobQ47FwzTyma+/WJET8cUi/eWLaN6A9fzT8xoaV94TjYnApQougolEm
	H1wOjIJCNTfavV9cimQicOcqJgl9aA45Qfwf+Uqpj3InvzTzl49w7Y5o//pOgeNPRhm+
	eENIosgk8R1rMWkl7zoaga3gLHgKWPKT2/24g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=WU2K8Le2u28rEOrST1d5M0AzLG6mAsufdCvLUoPUOyZ/5/6/CHz9ell4cN42Pga7pE
	8sHtF6+/q/rk4rnL3jPvFQnHJOa5C5Sh8RypWgzwf10lZa1/BYZJf2aMszzyWJW36uRA
	doXwjo3ZUOfBTV7G/4c9cGNmaFmzXtxbxJzZ8=
MIME-Version: 1.0
Received: by 10.231.192.67 with SMTP id dp3mr5908960ibb.180.1283776483716;
	Mon, 06 Sep 2010 05:34:43 -0700 (PDT)
Received: by 10.231.208.17 with HTTP; Mon, 6 Sep 2010 05:34:43 -0700 (PDT)
In-Reply-To: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>
References: <1283775540-13164-1-git-send-email-noor_ahsan@mentor.com>
Date: Mon, 6 Sep 2010 14:34:43 +0200
Message-ID: <AANLkTimzZ65faJVfh95+TgfKiNBJCTG5LJ=L9NxhFgN5@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libsdl-native: Convert to new style staging, remove do_stage
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
X-List-Received-Date: Mon, 06 Sep 2010 12:35:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/9/6 Noor Ahsan <noor_ahsan@mentor.com>:
> * Remove do_stage ()
> * Replace tabs with 8 spaces in do_configure
> * Bump INC_PR =3D "r3"
>
> Signed-off-by: Noor Ahsan <noor_ahsan@mentor.com>
> ---
> =A0recipes/libsdl/libsdl-native.inc | =A0 18 +++++++-----------
> =A01 files changed, 7 insertions(+), 11 deletions(-)
>
> diff --git a/recipes/libsdl/libsdl-native.inc b/recipes/libsdl/libsdl-nat=
ive.inc
> index 783797a..faae90c 100644
> --- a/recipes/libsdl/libsdl-native.inc
> +++ b/recipes/libsdl/libsdl-native.inc
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "Simple DirectMedia Layer - native Editio=
n"
> =A0HOMEPAGE =3D "http://www.libsdl.org"
> =A0SECTION =3D "libs"
> =A0LICENSE =3D "LGPL"
> -INC_PR =3D "r2"
> +INC_PR =3D "r3"
>
> =A0SRC_URI =3D "http://www.libsdl.org/release/SDL-${PV}.tar.gz \
> =A0"
> @@ -23,15 +23,11 @@ EXTRA_OECONF =3D "--disable-debug --disable-cdrom --e=
nable-threads --enable-timers
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 --disable-video-picogui --disable-video-q=
topia --enable-dlopen"
>
> =A0do_configure() {
> - =A0 =A0 =A0 gnu-configize
> - =A0 =A0 =A0 oe_runconf
> - =A0 =A0 =A0 cd ${S}
> - =A0 =A0 =A0 # prevent libtool from linking libs against libstdc++, libg=
cc, ...
> - =A0 =A0 =A0 cat ${TARGET_PREFIX}libtool | sed -e 's/postdeps=3D".*"/pos=
tdeps=3D""/' > ${TARGET_PREFIX}libtool.tmp
> - =A0 =A0 =A0 mv ${TARGET_PREFIX}libtool.tmp ${TARGET_PREFIX}libtool
> + =A0 =A0 =A0 =A0gnu-configize
> + =A0 =A0 =A0 =A0oe_runconf
> + =A0 =A0 =A0 =A0cd ${S}
> + =A0 =A0 =A0 =A0# prevent libtool from linking libs against libstdc++, l=
ibgcc, ...
> + =A0 =A0 =A0 =A0cat ${TARGET_PREFIX}libtool | sed -e 's/postdeps=3D".*"/=
postdeps=3D""/' > ${TARGET_PREFIX}libtool.tmp
> + =A0 =A0 =A0 =A0mv ${TARGET_PREFIX}libtool.tmp ${TARGET_PREFIX}libtool
> =A0}
>
> -do_stage() {
> - =A0 =A0 =A0 autotools_stage_all
> - =A0 =A0 =A0 install -m 0644 build/libSDLmain.a ${STAGING_LIBDIR}
> -}

when you build is tlibSDLmain.a still moved to staging ?

Frans


