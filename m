Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Q48Kt-0007Sp-Lk
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Mar 2011 11:02:08 +0200
Received: by pvc30 with SMTP id 30so452891pvc.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Mar 2011 02:00:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type:content-transfer-encoding;
	bh=R2czbhQscgQ6aBwgyEc2pLQOd5oNqXHJ/riMdLcAshI=;
	b=Pe00mjWPyRCmybfUvRMiCaul3fk8FqWxWI50a4rumuOx3zIlI8Uq7urawM47HINorz
	LCHrf2U3wClHlKLE8zgjgZCLVxrnqEMngYt/fuRII3KrZfSqPAIkTMxvHnuO46Q8Oyj4
	RthVF+5gTredk+azzvIZ2Sc8psSjL3R2Tj0D4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=OMFn4cEk7pDc4yoOr0iowHkFoBmipofCURaFcmiH9vKC1ADofy8lObYs4QXD1gjQ8F
	Fo21Q/m/7QbOpnVNpBA5SEsgxWaTafYp9a4tXjTxTw6/B9XP/xLQD55MUvI0xsauEKtB
	EZ9wlPPLmwmWkSZMLbOxhf7/xEqcduTfmuPQQ=
MIME-Version: 1.0
Received: by 10.142.126.18 with SMTP id y18mr537052wfc.361.1301302806872; Mon,
	28 Mar 2011 02:00:06 -0700 (PDT)
Received: by 10.142.136.15 with HTTP; Mon, 28 Mar 2011 02:00:06 -0700 (PDT)
In-Reply-To: <20110328083149.GA7337@xora-eee.xora.org.uk>
References: <E1Q3y4q-00047f-Ns@melo.openembedded.org>
	<20110328083149.GA7337@xora-eee.xora.org.uk>
Date: Mon, 28 Mar 2011 11:00:06 +0200
Message-ID: <AANLkTikP801Wp0c2BVr+9EQ5S0yfrzO8ONa7V3cU1BCp@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Andrea Adami : udev: remove udev-compat for Zaurus devices since we use 2.6 .38 finally.
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
X-List-Received-Date: Mon, 28 Mar 2011 09:02:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 28, 2011 at 10:31 AM, Graeme Gregory <dp@xora.org.uk> wrote:
> Shouldnt this patch have a PR bump so udev already on devices is updated?
>
> Graeme

Ah, yes ...if we only had working images on devices ;)
IIRC udev-compat was not accepted in Narcissus.
ATM for Z best is build from scratch. Things will change hopefully soon.

BTW, editing that files I've seen the 'udev-compat' layer is used by
only another machine (palmpre) in a single udev recipe.
Should we clean the other recipes from those bits now?

Andrea

>
> On Sun, Mar 27, 2011 at 10:04:52PM +0000, git version control wrote:
>> Module: openembedded.git
>> Branch: org.openembedded.dev
>> Commit: e0b9730eeb42cab4a16983777d1a7fc3986f4933
>> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcom=
mit;h=3De0b9730eeb42cab4a16983777d1a7fc3986f4933
>>
>> Author: Andrea Adami <andrea.adami@gmail.com>
>> Date: =A0 Sun Mar 27 23:59:02 2011 +0200
>>
>> udev: remove udev-compat for Zaurus devices since we use 2.6.38 finally.
>> Signed-off-by: Andrea Adami <andrea.adami@gmail.com>
>>
>> ---
>>
>> =A0recipes/udev/udev.inc =A0 =A0| =A0 16 ----------------
>> =A0recipes/udev/udev_151.bb | =A0 16 ----------------
>> =A0recipes/udev/udev_154.bb | =A0 16 ----------------
>> =A0recipes/udev/udev_162.bb | =A0 16 ----------------
>> =A0recipes/udev/udev_165.bb | =A0 16 ----------------
>> =A05 files changed, 0 insertions(+), 80 deletions(-)
>>
>> diff --git a/recipes/udev/udev.inc b/recipes/udev/udev.inc
>> index 0c8a662..79f43dc 100644
>> --- a/recipes/udev/udev.inc
>> +++ b/recipes/udev/udev.inc
>> @@ -44,22 +44,6 @@ EXTRA_OEMAKE =3D "-e \
>> =A0 =A0 =A0 =A0 =A0 =A0 =A0 'STRIP=3Decho'"
>>
>> =A0RPROVIDES_udev_append =3D " udev-compat-wrapper"
>> -RDEPENDS_udev_spitz +=3D "udev-compat"
>> -do_unpack_append_spitz() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_akita +=3D "udev-compat"
>> -do_unpack_append_akita() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_c7x0 +=3D "udev-compat"
>> -do_unpack_append_c7x0() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_poodle +=3D "udev-compat"
>> -do_unpack_append_poodle() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>>
>> =A0# Modify init script on platforms that need to boot old kernels:
>> =A0do_apply_compat_wrapper() {
>> diff --git a/recipes/udev/udev_151.bb b/recipes/udev/udev_151.bb
>> index d31d99a..e7f78f2 100644
>> --- a/recipes/udev/udev_151.bb
>> +++ b/recipes/udev/udev_151.bb
>> @@ -85,22 +85,6 @@ FILES_${PN} +=3D "/lib/udev* ${libdir}/ConsoleKit"
>> =A0FILES_${PN}-dbg +=3D "/lib/udev/.debug"
>>
>> =A0RPROVIDES_udev_append =3D " udev-compat-wrapper"
>> -RDEPENDS_udev_append_spitz =3D " udev-compat"
>> -do_unpack_append_spitz() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_akita =3D " udev-compat"
>> -do_unpack_append_akita() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_c7x0 =3D " udev-compat"
>> -do_unpack_append_c7x0() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_poodle =3D " udev-compat"
>> -do_unpack_append_poodle() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>>
>> =A0# Modify init script on platforms that need to boot old kernels:
>> =A0do_apply_compat_wrapper() {
>> diff --git a/recipes/udev/udev_154.bb b/recipes/udev/udev_154.bb
>> index 44d7b13..8b416e2 100644
>> --- a/recipes/udev/udev_154.bb
>> +++ b/recipes/udev/udev_154.bb
>> @@ -77,22 +77,6 @@ FILES_${PN} +=3D "/lib/udev* ${libdir}/ConsoleKit"
>> =A0FILES_${PN}-dbg +=3D "/lib/udev/.debug"
>>
>> =A0RPROVIDES_udev_append =3D " udev-compat-wrapper"
>> -RDEPENDS_udev_append_spitz =3D " udev-compat"
>> -do_unpack_append_spitz() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_akita =3D " udev-compat"
>> -do_unpack_append_akita() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_c7x0 =3D " udev-compat"
>> -do_unpack_append_c7x0() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_poodle =3D " udev-compat"
>> -do_unpack_append_poodle() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>>
>> =A0# Modify init script on platforms that need to boot old kernels:
>> =A0do_apply_compat_wrapper() {
>> diff --git a/recipes/udev/udev_162.bb b/recipes/udev/udev_162.bb
>> index 40104be..6611d8c 100644
>> --- a/recipes/udev/udev_162.bb
>> +++ b/recipes/udev/udev_162.bb
>> @@ -88,22 +88,6 @@ FILES_${PN} +=3D "/lib/udev* ${libdir}/ConsoleKit"
>> =A0FILES_${PN}-dbg +=3D "/lib/udev/.debug"
>>
>> =A0RPROVIDES_udev_append =3D " udev-compat-wrapper"
>> -RDEPENDS_udev_append_spitz =3D " udev-compat"
>> -do_unpack_append_spitz() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_akita =3D " udev-compat"
>> -do_unpack_append_akita() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_c7x0 =3D " udev-compat"
>> -do_unpack_append_c7x0() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_poodle =3D " udev-compat"
>> -do_unpack_append_poodle() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> =A0RDEPENDS_udev_append_palmpre =3D " udev-compat"
>> =A0do_unpack_append_palmpre() {
>> =A0 =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> diff --git a/recipes/udev/udev_165.bb b/recipes/udev/udev_165.bb
>> index 63e62f1..d426aff 100644
>> --- a/recipes/udev/udev_165.bb
>> +++ b/recipes/udev/udev_165.bb
>> @@ -88,22 +88,6 @@ FILES_${PN} +=3D "/lib/udev* ${libdir}/ConsoleKit"
>> =A0FILES_${PN}-dbg +=3D "/lib/udev/.debug"
>>
>> =A0RPROVIDES_udev_append =3D " udev-compat-wrapper"
>> -RDEPENDS_udev_append_spitz =3D " udev-compat"
>> -do_unpack_append_spitz() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_akita =3D " udev-compat"
>> -do_unpack_append_akita() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_c7x0 =3D " udev-compat"
>> -do_unpack_append_c7x0() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>> -RDEPENDS_udev_append_poodle =3D " udev-compat"
>> -do_unpack_append_poodle() {
>> - =A0 =A0 bb.build.exec_func('do_apply_compat_wrapper', d)
>> -}
>>
>> =A0# Modify init script on platforms that need to boot old kernels:
>> =A0do_apply_compat_wrapper() {
>>
>>
>> _______________________________________________
>> Openembedded-commits mailing list
>> Openembedded-commits@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


