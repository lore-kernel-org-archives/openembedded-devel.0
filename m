Return-Path: <trini@konsulko.com>
Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com
	[209.85.219.170])
	by mail.openembedded.org (Postfix) with ESMTP id 97F0D7F6AA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 14:19:34 +0000 (UTC)
Received: by mail-yb1-f170.google.com with SMTP id 206so742196ybc.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Oct 2019 07:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=Rb7+g9abvNl3Jx6hTI4EdyBEGKBsiy2q3YU5g1kVW/g=;
	b=PqM2Iy3yj3DkuM59X76Cc9BvCtqBrC3rW0N85C3x2sRrhlH4FnOpmJDvEFIY/QDjiO
	12FiaX5Y6j2tj3RJVO33IaqMGOk3DntUaQPgly9Kt2a2EK8/CEh+OcC4/laaDFdXhCY8
	YjiLKcoSiByyE9+j4LQDrvsnWs5TcHmOOVaPs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:date:from:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=Rb7+g9abvNl3Jx6hTI4EdyBEGKBsiy2q3YU5g1kVW/g=;
	b=GRGSUVFU1rY6Je1F9hpiU5rFnmaWGNRcFa+3FzkOkQ7cBxqHc2lbFC0tMhWVZML86O
	63pcm/QNrF7fJg3ac3BztGGHScIKeDHcAzq6dg2oFdmbCMLTo1GkUExGHvaCxso+mWva
	zcM2HbuBf9ikokmtQG+2ZsC8IxkkB9YmuHC1m7hg8XJVYeCkbXjqaFOQSpcTtNMX4gZy
	GvIfQA2J1SeOxOMny9GCqibjb4ASrL92+KEnvuykqJHdZ4h9FDc4o8aLrbM549iDRGep
	kGK6GRihwrACAKhKfW8GNBB5AVeGtO8W2f2dJkS3VxlwbG6jkF7W2DjwMHlZ/GmZfS49
	WGKQ==
X-Gm-Message-State: APjAAAU+mICBu12yibl2tBz80Up+N2VlvwymKgDFNza68Za2KUuMLmnj
	chIvjzxkCG5fXoJvqRD5to0iAA==
X-Google-Smtp-Source: APXvYqwVAYG0CsZ46nXLPAzwwrk6uu5ZYEkgjVInND3wKyGhRNmN0b5//pG4r43J9UkuqIZx2tD2pQ==
X-Received: by 2002:a25:7543:: with SMTP id q64mr2429598ybc.414.1571321975250; 
	Thu, 17 Oct 2019 07:19:35 -0700 (PDT)
Received: from bill-the-cat (cpe-65-184-142-8.ec.res.rr.com. [65.184.142.8])
	by smtp.gmail.com with ESMTPSA id h74sm552257ywc.15.2019.10.17.07.19.33
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Thu, 17 Oct 2019 07:19:34 -0700 (PDT)
Date: Thu, 17 Oct 2019 10:19:32 -0400
From: Tom Rini <trini@konsulko.com>
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>
Message-ID: <20191017141932.GJ16029@bill-the-cat>
References: <20191017135309.32441-1-trini@konsulko.com>
	<a481c7b712504bb4a40364fab7ff1a0b@XBOX03.axis.com>
MIME-Version: 1.0
In-Reply-To: <a481c7b712504bb4a40364fab7ff1a0b@XBOX03.axis.com>
X-Clacks-Overhead: GNU Terry Pratchett
User-Agent: Mutt/1.9.4 (2018-02-28)
Cc: George Kiagiadakis <george.kiagiadakis@collabora.com>,
	"openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>,
	Jan-Simon =?iso-8859-1?Q?M=F6ller?= <jsmoeller@linuxfoundation.org>
Subject: Re: [meta-oe][PATCHv2] pipewire: Initial add of 0.2.7
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
X-List-Received-Date: Thu, 17 Oct 2019 14:19:34 -0000
X-Groupsio-MsgNum: 80197
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ozzXYiujz/5xFLN+"
Content-Disposition: inline

--ozzXYiujz/5xFLN+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 17, 2019 at 02:11:11PM +0000, Peter Kjellerstedt wrote:

> Just to add to this, I have attached a recipe for pipewire that we used=
=20
> to use (we have not used it for a while so it is not up-to-date). It=20
> should hopefully give you some more ideas. E.g., it uses automatic=20
> splitting of all the spa and module packages similar to how the GStreamer=
=20
> plugins are automatically split into separate packages.

I hesitate on adding stuff like this right now in that with 0.3 (and
audio support) a bunch more stuff changes.  One of my goals right now is
to get pipewire 0.2.7 in such that it meets Andreas' needs and then with
0.3 later being able to confirm his use case still works when updating.

--=20
Tom

--ozzXYiujz/5xFLN+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE6HLbQJwaaH776GM2h/n2NdMddlIFAl2oeHMACgkQh/n2NdMd
dlKE9g//Zx8KASBigTJGHA0GLp96vZ4E4ViO5oruOmEi98SsVPScFyMRQa0uBC6R
Z6U5RliMpWSP2jk/0d7OR2uGi6TqHrzh0+sKIWoaam88nJX0c758C13RCxDjBvaQ
2bxIfqnep7kbYCh0vXVkC0hZVvbiqfvdwBWcU6ILgzGo8SgPtXVGpeqbavn/uYRn
r/xL+/r75rziPzA1SDCZoVb24V+W4ecKBvfJZ+Kenwp/0FGI7ypdWkEBuO+6xGzw
DL5zwdT2sSynQUMTm78kzxooL68VJEHImEB/TnqadXAbKEkrAuqpOuMU0gQ8y6qO
m0ljXARBWnvwOAhagzehq7ricc9aLw0EiBqBKhsQY0weJ4FGREhkhCLZS2LxysSl
AUtNNTQYgd3GRKNCSIFyOv1QXwiIf1W1Qdl9+t56sCSwfAyAct/m/vD4IE7BsNLw
s+Tv1KKp41CTLKn555GzxQ0JVfJBQGQvRSpeM1VaH/Ql9hI17AtVvFJONjaxaCqW
9S8Su5zLXd5OEi9Ko8xCLSQjI2jibKXj2znXRtNVDth+yTL3RVvckoTe8yEfh9k5
P2hmZSwhKVvVH5KUKNOFpq9SaOX1EjnfyD+Qlie9KhpKQby+K4YsdH8F9+slzEzv
4go7gd8InxXCnq2+iohovDOjgrrOzMmAFU7URUxlnQ0Qi5G01tY=
=YiWW
-----END PGP SIGNATURE-----

--ozzXYiujz/5xFLN+--
