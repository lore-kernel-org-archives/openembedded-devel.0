Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OYNZa-00065b-FH
	for openembedded-devel@lists.openembedded.org;
	Mon, 12 Jul 2010 20:20:22 +0200
Received: by iwn34 with SMTP id 34so4991359iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 12 Jul 2010 11:12:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=EyiC9c/9SsbF1Aht9fAicQy6rQ57FQsvcguck9ImrHE=;
	b=PoRiWwvQhVTk9wINysbYAjo0T27AMk3KZIUQxthTui0m8JJVn0zqEeTgsEhk1dcHv+
	HbjXdzaxEe0dXYjnJ6wFtO4yUiVBJ1llaJXSUhbkNLDNOh+AWGRGHMj7fuXXWN1BbDOw
	n+GiwHpFcA7CSDGC8V11CtAZDZc4SioXbjkjg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=vpxd2sJoTG1nM9F5AW6OhyY7lK/MnCuV3luaAZso2awQ7uTq/kcL1BpP5V6fBFuLhG
	NE53h9Vtwvhi4qOmX8jGMeYx4UbaGUGGYSuBG/dZuEsmDgDPVi9kNuK+gCm/hTl+6fIl
	T80fPoKglQXqRJ3rcYI+4GsD9kZ8OWOIxECZI=
Received: by 10.231.172.83 with SMTP id k19mr7205469ibz.114.1278958371160; 
	Mon, 12 Jul 2010 11:12:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.10.196 with HTTP; Mon, 12 Jul 2010 11:12:30 -0700 (PDT)
In-Reply-To: <4C3ABB63.4040004@gmail.com>
References: <4C3ABB63.4040004@gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 12 Jul 2010 11:12:30 -0700
Message-ID: <AANLkTimHCXbXrwAhwNVvnyzUprQiOqV2ONr3iGmJ09vV@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] perl_5.8.8.bb: Don't use hostperl's $Config{cppflags} with cross compiler.
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
X-List-Received-Date: Mon, 12 Jul 2010 18:20:23 -0000
X-List-Received-Date: Mon, 12 Jul 2010 18:20:23 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 11, 2010 at 11:51 PM, Graham Gower <graham.gower@gmail.com> wro=
te:
> Fixes /usr/local/include Badness.
>
> make[2]: Entering directory `/home/grg/oe2/tmp/work/mipsel-oe-linux/perl-=
5.8.8-r34/perl-5.8.8/ext/Errno'
> hostperl -I/home/grg/oe2/tmp/work/mipsel-oe-linux/perl-5.8.8-r34/perl-5.8=
.8/Cross/../fake_config_library -MConfig Errno_pm.PL Errno.pm
> CROSS COMPILE Badness: /usr/local/include in INCLUDEPATH: /usr/local/incl=
ude
> No error definitions found at Errno_pm.PL line 216.

while this patch looks ok. Can you check if this is needed on 5.10.1 as wel=
l.

>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/perl/perl_5.8.8.bb | =A0 =A03 ++-
> =A01 files changed, 2 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/perl/perl_5.8.8.bb b/recipes/perl/perl_5.8.8.bb
> index 4f4c468..f09360f 100644
> --- a/recipes/perl/perl_5.8.8.bb
> +++ b/recipes/perl/perl_5.8.8.bb
> @@ -104,7 +104,8 @@ do_configure() {
> =A0}
> =A0do_compile() {
> =A0 =A0 =A0 =A0 if test "${MACHINE}" !=3D "native"; then
> - =A0 =A0 =A0 =A0 =A0 =A0sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' e=
xt/Errno/Errno_pm.PL
> + =A0 =A0 =A0 =A0 =A0 =A0sed -i -e 's|/usr/include|${STAGING_INCDIR}|g' \
> + =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 -e 's|$Config{cppflags}||' ext/Errn=
o/Errno_pm.PL
> =A0 =A0 =A0 =A0 fi
> =A0 =A0 =A0 =A0 cd Cross
> =A0 =A0 =A0 =A0 oe_runmake perl LD=3D"${TARGET_SYS}-gcc"
> --
> 1.7.1
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


