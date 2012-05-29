Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1SZOpx-0004Lq-2f
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 May 2012 17:59:57 +0200
Received: by eaal1 with SMTP id l1so1360517eaa.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 May 2012 08:49:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	bh=cnZuEHBmuLOPa3oHaDVzYWJTM6/8EnD/VV/qBAL/pr8=;
	b=laZh4x5bUuBAEHw6mktibM8jTzpXXSgcv0SJuDOVXl36Pvu9rrqap5xBxcbI3JAxXT
	YgvuxJyh/b6x6rYK77x/881+WajItP1Ws6Icg3/8HaH90PggSZ8oDdp8tti43Rsa3U9k
	tq5suzXWR5sx547ngYPBVXlVuroxbyN+UI4K4IXnq/gjhR9BqCyP6q4BRgv4csvyBGcu
	WtzdxOOQzDWQQVergXtO3tbR+FrDo6Vq5elkKbvXRDUIJxGi9NCAXxzc02SoJ0VZ82rl
	WkmBnWvjfdRV3PrULXCTtvbDbA5uF+6u04bkek0yTL0O7i12H8fnZHfSf97t8ZSnB4sC
	QuJw==
Received: by 10.14.97.135 with SMTP id t7mr4099726eef.177.1338306579775; Tue,
	29 May 2012 08:49:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.188.11 with HTTP; Tue, 29 May 2012 08:49:09 -0700 (PDT)
In-Reply-To: <loom.20120529T123552-567@post.gmane.org>
References: <CAG2TeNrp6cR1UmrPU0+UKHerR113q2_O_56HHZoBOfnGRrccTw@mail.gmail.com>
	<loom.20120529T123552-567@post.gmane.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 May 2012 08:49:09 -0700
Message-ID: <CAMKF1so_h2zQ1PiWrHQv==soM+FmOoakyvg8R_KC8TJTOTPzvg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: Compile error in openssl 1.0.0e
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
X-List-Received-Date: Tue, 29 May 2012 15:59:57 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, May 29, 2012 at 3:40 AM, Chris Diamand <chris@diamand.org> wrote:
>> =C2=A0 =C2=A0if ( data->connected )
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=3Dwritesocket(b->num,in,inl);
>> =C2=A0 =C2=A0else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0int peerlen =3D sizeof(data->peer);
>>
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (data->peer.sa.sa_family =3D=3D AF_INET)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0peerlen =3D sizeof(data->peer.s=
a_in);
>> #if OPENSSL_USE_IPV6 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 /**** HERE ****/
>> =C2=A0 =C2=A0case BIO_C_FILE_TELL:
>> =C2=A0 =C2=A0case BIO_CTRL_INFO:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=3D0;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0case BIO_C_SET_FD:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0dgram_clear(b);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0b->num=3D *((int *)ptr);
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0b->shutdown=3D(int)num;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0b->init=3D1;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0case BIO_C_GET_FD:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0if (b->init)
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0{
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ip=3D(int *)ptr;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0if (ip !=3D NULL) *ip=3Db->num;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=3Db->num;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0}
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0else
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=3D -1;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0case BIO_CTRL_GET_CLOSE:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0ret=3Db->shutdown;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0case BIO_CTRL_SET_CLOSE:
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0b->shutdown=3D(int)num;
>> =C2=A0 =C2=A0 =C2=A0 =C2=A0break;
>> =C2=A0 =C2=A0case BIO_CTRL_PENDING:
>> ...
>>
>> If OPENSSL_USE_IPV6 is defined it puts a random case label (sans
>> switch() ) in the middle of the function. This is clearly not going to
>> work.
>>
>> This has been fixed in the latest version, 1.0.1c, which compiles
>> without errors.
>>
>> Could the openssl recipe be updated to the latest version which actually
> builds?
>>
>> Cheers,
>> Chris.
>>
>
> Just looked again. The openssl source actually appears to be fine - it's =
this
> sed line in
> recipes/openssl/openssl.inc:
>
> diff --git a/recipes/openssl/openssl.inc b/recipes/openssl/openssl.inc
> index 2aff24a..d087a8b 100644
> --- a/recipes/openssl/openssl.inc
> +++ b/recipes/openssl/openssl.inc
> @@ -106,7 +106,8 @@ do_configure () {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0perl ./Configure ${EXTRA_OECONF} shared --pref=
ix=3D$useprefix --
> openssldir=3D${libdir}/ssl $target
>
> =C2=A0 =C2=A0 =C2=A0 =C2=A0eval "${@base_contains('DISTRO_FEATURES', 'lar=
gefile', '', 'sed -i -e
> "/_FILE_OFFSET_BITS/,/#endif/d" ${S}/crypto/bio/bss_file.c', d)}"
> - =C2=A0 =C2=A0 =C2=A0 eval "${@base_contains('DISTRO_FEATURES', 'ipv6', =
'', 'sed -i -e
> "/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
> +
> + =C2=A0 =C2=A0 =C2=A0 # eval "${@base_contains('DISTRO_FEATURES', 'ipv6'=
, '', 'sed -i -e
> "/AF_INET6/,/break/d" ${S}/crypto/bio/bss_dgram.c', d)}"
> =C2=A0}
>
> =C2=A0do_compile () {
>
>
> Cheers.


would you send it as a proper git formatted patch please


