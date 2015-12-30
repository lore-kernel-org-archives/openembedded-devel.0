Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 98C3060088
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 11:52:54 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id b14so46249820wmb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Dec 2015 03:52:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	bh=AiMzeHMxJkqr892DnOczeluUpgO2Us6uPtQrGE07ObM=;
	b=JIvMdLjvug9CsE8vkS/oJZm//KpVwDk/ta59wRupvPusT247pjtl+0ZmatIx1GN5DT
	zRL7FDbhNDVdyA0x3UZKWBuErbyIdXBbsGtXyK20CIAfCOgivz0Wd8Qzkp8KqHm5JIIj
	Em3IH+52Rsjx2CzPWwzbzFCRTIy3KV2567b9beEqfVRp7kzpP3sJ6x5JVjVE2KaG0s7G
	/Vk56iMCX+7qEatZcIvezyHdx0mPOau3GlxAAXaQEclotVCXhCPFhM8X2Nn/h7OnlP4b
	/BoWh4rgBdRpatprhLFP7YKgzUNq42fLYJKG9gm7h2YglOswaeJExFMUXuGHMH99LY5W
	jxwA==
X-Received: by 10.28.212.85 with SMTP id l82mr21302622wmg.11.1451476375154;
	Wed, 30 Dec 2015 03:52:55 -0800 (PST)
Received: from localhost (ip-86-49-34-37.net.upcbroadband.cz. [86.49.34.37])
	by smtp.gmail.com with ESMTPSA id
	u126sm56879026wme.3.2015.12.30.03.52.53
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 30 Dec 2015 03:52:53 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Wed, 30 Dec 2015 12:56:29 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20151230115629.GA2263@jama>
References: <1450995226-16494-1-git-send-email-cleitonrbueno@gmail.com>
MIME-Version: 1.0
In-Reply-To: <1450995226-16494-1-git-send-email-cleitonrbueno@gmail.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Cc: Cleiton Bueno <cleitonrbueno@gmail.com>
Subject: Re: [PATCH] Change false to FALSE and 1 to TRUE, FIX qtwebengine compile
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
X-List-Received-Date: Wed, 30 Dec 2015 11:52:57 -0000
X-Groupsio-MsgNum: 59214
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline

--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 24, 2015 at 08:13:46PM -0200, Cleiton Bueno wrote:
> Signed-off-by: Cleiton Bueno <cleitonrbueno@gmail.com>

Where do you want this to be applied? If it's for qtwebengine recipe in
meta-qt5 then you should send change for meta-qt5 repo (which includes
=2Epatch for qtwebengine), not patch for qtwebengine repo.

> ---
>  src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc b/src/3rdpa=
rty/chromium/ui/gfx/codec/jpeg_codec.cc
> index 8a08fe0..32b2a05 100644
> --- a/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
> +++ b/src/3rdparty/chromium/ui/gfx/codec/jpeg_codec.cc
> @@ -120,7 +120,7 @@ boolean EmptyOutputBuffer(jpeg_compress_struct* cinfo=
) {
>    // tell libjpeg where to write the next data
>    cinfo->dest->next_output_byte =3D &(*state->out)[state->image_buffer_u=
sed];
>    cinfo->dest->free_in_buffer =3D state->out->size() - state->image_buff=
er_used;
> -  return 1;
> +  return TRUE;
>  }
> =20
>  // Cleans up the JpegEncoderState to prepare for returning in the final =
form.
> @@ -261,7 +261,7 @@ bool JPEGCodec::Encode(const unsigned char* input, Co=
lorFormat format,
>    cinfo.data_precision =3D 8;
> =20
>    jpeg_set_defaults(&cinfo);
> -  jpeg_set_quality(&cinfo, quality, 1);  // quality here is 0-100
> +  jpeg_set_quality(&cinfo, quality, TRUE);  // quality here is 0-100
> =20
>    // set up the destination manager
>    jpeg_destination_mgr destmgr;
> @@ -273,7 +273,7 @@ bool JPEGCodec::Encode(const unsigned char* input, Co=
lorFormat format,
>    JpegEncoderState state(output);
>    cinfo.client_data =3D &state;
> =20
> -  jpeg_start_compress(&cinfo, 1);
> +  jpeg_start_compress(&cinfo, TRUE);
> =20
>    // feed it the rows, doing necessary conversions for the color format
>  #ifdef JCS_EXTENSIONS
> @@ -359,7 +359,7 @@ void InitSource(j_decompress_ptr cinfo) {
>  //   set to a positive value if TRUE is returned. A FALSE return should =
only
>  //   be used when I/O suspension is desired."
>  boolean FillInputBuffer(j_decompress_ptr cinfo) {
> -  return false;
> +  return FALSE;
>  }
> =20
>  // Skip data in the buffer. Since we have all the data at once, this ope=
ration
> @@ -487,8 +487,8 @@ bool JPEGCodec::Decode(const unsigned char* input, si=
ze_t input_size,
>    cinfo.client_data =3D &state;
> =20
>    // fill the file metadata into our buffer
> -  if (jpeg_read_header(&cinfo, true) !=3D JPEG_HEADER_OK)
> -    return false;
> +  if (jpeg_read_header(&cinfo, TRUE) !=3D JPEG_HEADER_OK)
> +    return FALSE;
> =20
>    // we want to always get RGB data out
>    switch (cinfo.jpeg_color_space) {
> --=20
> 1.8.1.2
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAlaDxmwACgkQN1Ujt2V2gBzN2QCdHguI2qS1ZT2W/3U3k7eW8Mka
L8EAoJWZWE1r8zIbsQUan/wDbXF7fes0
=EUut
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--
