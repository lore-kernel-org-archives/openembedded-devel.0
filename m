Received: from [209.85.221.183] (helo=mail-qy0-f183.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Mfgd1-000734-2z
	for openembedded-devel@lists.openembedded.org;
	Mon, 24 Aug 2009 22:58:59 +0200
Received: by qyk13 with SMTP id 13so336552qyk.3
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2009 13:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=SXyJ3UVmObxT8fmnMHKrPilRaSjAotQn0XRp0CRUKp0=;
	b=JQoWt80Lm9RPGPgzmmD/OZR03seam+6/nEZ/ev6kh50OhFnCxGOaEfEZoiW5nU5r9r
	HL91wunZ0uPGuXisOn9ld/aLBymWgMioKVOfwe+Mzbtwc8zmW3SXb1p6w1LwHIDdpNhP
	z1PQ2NGUoAhz4pNwGlUAFYHoDBUSeNzvdcei0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=FrfCOyfb+fKbrbM3Gvt/vwPbvPbl2jQ0psuXIe3XHPpZzuHPS3IbYyu/uK6OwloNu8
	s4cMs0b2hI42zMe7le3EEG1tGZfi+4liUOUfBqB8Ja32KpWmZ8hGNBBbMzhfkxWDvo6l
	DKkNXL1ilMIdYoDMS4Hu5mtd+E8k3QEGgpNiw=
MIME-Version: 1.0
Received: by 10.229.41.74 with SMTP id n10mr1131466qce.13.1251146471171; Mon, 
	24 Aug 2009 13:41:11 -0700 (PDT)
In-Reply-To: <1251126024-5516-1-git-send-email-edoiron@cbnco.com>
References: <1251126024-5516-1-git-send-email-edoiron@cbnco.com>
Date: Mon, 24 Aug 2009 13:41:11 -0700
Message-ID: <19c1b8a90908241341r5883ce17hd16ebd7cc0828d46@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Evan Doiron <edoiron@cbnco.com>
Subject: Re: [PATCH] dmidecode: add v2.10
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
X-List-Received-Date: Mon, 24 Aug 2009 20:58:59 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 24, 2009 at 8:00 AM, Evan Doiron<edoiron@cbnco.com> wrote:
> Signed-off-by: Evan Doiron <edoiron@cbnco.com>
> ---
> =C2=A0conf/checksums.ini =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 | =C2=A0 =
=C2=A04 ++++
> =C2=A0.../{dmidecode_2.9.bb =3D> dmidecode_2.10.bb} =C2=A0 =C2=A0 =C2=A0 =
=C2=A0| =C2=A0 =C2=A09 +--------
> =C2=A02 files changed, 5 insertions(+), 8 deletions(-)
> =C2=A0copy recipes/dmidecode/{dmidecode_2.9.bb =3D> dmidecode_2.10.bb} (6=
1%)
>
> diff --git a/conf/checksums.ini b/conf/checksums.ini
> index 85de9c2..2c85594 100644
> --- a/conf/checksums.ini
> +++ b/conf/checksums.ini
> @@ -4982,6 +4982,10 @@ sha256=3Df1a6dea51be9798903a0543fb50f463b0594b1f11=
b897bc50e40825fb7527c61
> =C2=A0md5=3Df92e5606c23a8092f3d5694e8d1c932e
> =C2=A0sha256=3Dd3be5c6eec24950cb3bd67dbfbcdf036f1278fae5fd78655ef8cdf9e91=
1e428a
>
> +[http://savannah.nongnu.org/download/dmidecode/dmidecode-2.10.tar.bz2]
> +md5=3D3c9c4d55a40b78600f3b43bfa64616f9
> +sha256=3D4d74a3e93353320317a424816f9a045df06d9ed4b5b80881e16fdfcc74c9e2c=
0
> +
> =C2=A0[http://savannah.nongnu.org/download/dmidecode/dmidecode-2.9.tar.bz=
2]
> =C2=A0md5=3D3dac4b1817012ffebd78671473d8f56c
> =C2=A0sha256=3D888eb2c25bdcef5ee34c38cd5cb0f491d7dd82029dc0f4ae96183a0088=
a5e015
> diff --git a/recipes/dmidecode/dmidecode_2.9.bb b/recipes/dmidecode/dmide=
code_2.10.bb
> similarity index 61%
> copy from recipes/dmidecode/dmidecode_2.9.bb
> copy to recipes/dmidecode/dmidecode_2.10.bb
> index 2186120..d3a646d 100644
> --- a/recipes/dmidecode/dmidecode_2.9.bb
> +++ b/recipes/dmidecode/dmidecode_2.10.bb
> @@ -5,14 +5,7 @@ PR =3D "r0"
>
> =C2=A0SRC_URI =3D "http://savannah.nongnu.org/download/dmidecode/${P}.tar=
.bz2"
>
> -COMPATIBLE_HOST =3D "i.86.*-linux"
> -
> -do_unpack_extra() {
> - =C2=A0 =C2=A0 =C2=A0 sed -i \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 -e '/^prefix/s:/usr/local:/usr:' \
> - =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Makefile
> -}
> -addtask unpack_extra after do_unpack before do_patch
> +COMPATIBLE_HOST =3D "(i.86|x86_64).*-linux"
>
> =C2=A0do_install() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0oe_runmake DESTDIR=3D"${D}" install
> --

Looks ok.

Acked-by: Khem Raj <raj.khem@gmail.com>

> 1.6.0.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


