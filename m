Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com
	[209.85.222.179])
	by mail.openembedded.org (Postfix) with ESMTP id 13C5C79703
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 14:24:43 +0000 (UTC)
Received: by mail-qk1-f179.google.com with SMTP id v18-v6so6208244qka.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Sep 2018 07:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=YP0N8tbzSYyG61evimSdh/eYG6RPjaBqRIyvBAxwHgc=;
	b=YlGz7UdyTaxM6Vwl2mqmXOlkDRh66BABGcfAqPRTQRLyP2q4QXX/zx1d0Vv5imcSt4
	Tv3sDKZa/5iUeQbYcsYSRkNoLWVE9e+AHzhENkYQGImmhRJnCxarnuDCJv9qBUvk3ZtJ
	fiNEO9NJ0JNWK/CZswRW4on1/ypfTrcES+pGcvmpJh15FJVtS9rdZPidAMFSxoKLI73z
	v3RaIhYe5Ctn8PDjCvbM4xBApuXGm83CYY5Ngr1LnXQbyCIZcFZCEh6iEoOlJvbNHvF8
	e1VY/R2E+TggJvhELQtPNJtrsp6XSOF7FO2zLz4Wk6jJ18WPmfhEYmz53YARQ8pmH1+X
	V2ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=YP0N8tbzSYyG61evimSdh/eYG6RPjaBqRIyvBAxwHgc=;
	b=Tqg0oiHqAhZAsM9LmRw31T+5u+1j5LqgWb8scpsQRq8A5rxz7NsYl0Mf9KQRNS2mMp
	wyNyfD4xt+8/AgYNCZbaS0rO3qQcSYt+I7dvjdI/JEfj2SN5epMXzvQrn/ltTlDw+6fL
	To580gng0tKOxi6I8XShpk4z+ub5Y15GCPv/JlKcfaxJTf5UlPLJDerTnQeG0a9lUBcg
	H55VvDysQ4ZFvb/9Lf6h/noTBcxvTSx/U+mX55EPddRByheNCfNdmS/rxF7+YvWd3gFZ
	W+QQRzX0/+nun9GtilVX59A5B8OaRw+JNWDLJ056GI9ifmtwo9itBlEoTS6gtPz80gQd
	mq+Q==
X-Gm-Message-State: ABuFfoi4DEfpGbzh0G7Gwm3mIYI+xEVXmTSfoSjfu0aYdShL5mhMS5sU
	z8gJu7MVMMJ+sAlWMqWCGsF6o4tYULi6ns6/6Yk=
X-Google-Smtp-Source: ACcGV61POMlSvhWjYPoWX5RDTGt7pY3I4vKxWdUaOXCVWiMNIwGyLoxmQSmqzVpVqG/h/ak5aBRTGjzB4s3Ru6JIHVU=
X-Received: by 2002:a37:ac02:: with SMTP id e2-v6mr4460093qkm.2.1537971884625; 
	Wed, 26 Sep 2018 07:24:44 -0700 (PDT)
MIME-Version: 1.0
References: <20180926132115.10455-1-max+openembedded@blarg.de>
In-Reply-To: <20180926132115.10455-1-max+openembedded@blarg.de>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 26 Sep 2018 07:24:18 -0700
Message-ID: <CAMKF1soJtjx9nww37op-WSi3dhC8=zPD1tG2hBLUQZ7YiQHYTA@mail.gmail.com>
To: max+openembedded@blarg.de
Cc: Max Kellermann <max.kellermann@gmail.com>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 1/7] mpd: sort PACKAGECONFIGs again
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
X-List-Received-Date: Wed, 26 Sep 2018 14:24:44 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Max

Please reabse this on top of current master, some of these patches are
already in
On Wed, Sep 26, 2018 at 6:21 AM Max Kellermann
<max+openembedded@blarg.de> wrote:
>
> From: Max Kellermann <max.kellermann@gmail.com>
>
> The new ones I added were not sorted.
>
> Signed-off-by: Max Kellermann <max.kellermann@gmail.com>
> ---
>  meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> index c0d4c8c2b..9b506ba10 100644
> --- a/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> +++ b/meta-multimedia/recipes-multimedia/musicpd/mpd_0.20.21.bb
> @@ -45,13 +45,13 @@ PACKAGECONFIG[lame] = "--enable-lame-encoder,--disable-lame-encoder,lame"
>  PACKAGECONFIG[libsamplerate] = "--enable-lsr,--disable-lsr,libsamplerate0"
>  PACKAGECONFIG[mad] = "--enable-mad,--disable-mad,libmad"
>  PACKAGECONFIG[mms] = "--enable-mms,--disable-mms,libmms"
> -PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
>  PACKAGECONFIG[modplug] = "--enable-modplug,--disable-modplug,libmodplug"
> +PACKAGECONFIG[mpg123] = "--enable-mpg123,--disable-mpg123,mpg123"
> +PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
> +PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
>  PACKAGECONFIG[smb] = "--enable-smbclient,--disable-smbclient,samba"
>  PACKAGECONFIG[sndfile] = "--enable-sndfile,--disable-sndfile,libsndfile1"
>  PACKAGECONFIG[upnp] = "--enable-upnp,--disable-upnp,libupnp"
> -PACKAGECONFIG[openal] = "--enable-openal,--disable-openal,openal-soft"
> -PACKAGECONFIG[opus] = "--enable-opus,--disable-opus,libopus libogg"
>  PACKAGECONFIG[vorbis] = "--enable-vorbis,--disable-vorbis,libvorbis libogg"
>  PACKAGECONFIG[wavpack] = "--enable-wavpack,--disable-wavpack,wavpack"
>  PACKAGECONFIG[zlib] = "--enable-zlib,--disable-zlib,zlib"
> --
> 2.19.0
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

