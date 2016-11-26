Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f67.google.com (mail-wm0-f67.google.com [74.125.82.67])
	by mail.openembedded.org (Postfix) with ESMTP id 199FC71B96
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 00:18:03 +0000 (UTC)
Received: by mail-wm0-f67.google.com with SMTP id g23so9877204wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 16:18:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=j3BdMQ1JmvK6FRQflsG+nyqVdY6j0m65+Db9whYc0vk=;
	b=S7TllIwYF91lNSMXC57wfDtaHCUQVppd7w/9NS3Elz8HKH8dyGkDEIk3LWD6XUOp++
	8zf36Fwe4Hv2JuXjxaNMRiDQbKKii/xXjxMhYOyXAmQrjKW/zmfKACNd+a/w1avSie7Y
	1EvJ9gMiNLD6g8ejhemuOzZGBVzbl1VPF2n4y7P0UFyFpX/68QtNA8Sx1ylp5ZyaHOkx
	xU0UoZLAgDiv1qXqPPoTCff+4R9tU+8SLlGCPdC06xZHREpkWI7VW55fvYJS1LjeQPaY
	LXvOLoK/qWBzozYQxl2q4szcvDYKjjVoHIouUpZMFc5JY66qMxgdBBwtDbLWSYN4ywP3
	0KfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=j3BdMQ1JmvK6FRQflsG+nyqVdY6j0m65+Db9whYc0vk=;
	b=CNq52b6/SI3Xg0d9mpnsCaFe65KdwE3Eo4vB92i7yYK66AbWLj6ZxNtK+aAR9M/R7n
	nsi206KomYvsWbvdqVlfSezfguQqpY7ni69R3PnDroUe2XXIB5mMhy5WDWrXjTarLk8L
	51ClSmbafLJO4iD2m4JQsyD6F8WDFMxTF0JuPoFbIC3yYBZbv9aqMbKUbU0QUd+66iwe
	6aYcVsXdys37y2deDKNj4EKo9b5K3AxjTifO1Kz5Xa0xT8omfdyRUAciun8i1XS5ov30
	zlPVVOHXa1sVBlIsxWwEWtefIKflBcQ43prnkAATXv7uWu7MSzunpt06UhBkHzTQHaSK
	xYcA==
X-Gm-Message-State: AKaTC029pQ9ESXns/RiNDCZoT/zR+bypJrQ9xifB+Wl6muWU0oB70ZVwaJDShbzxv1KZzA==
X-Received: by 10.28.210.195 with SMTP id j186mr9622214wmg.73.1480119484232;
	Fri, 25 Nov 2016 16:18:04 -0800 (PST)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	c133sm15943346wme.12.2016.11.25.16.18.03
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Fri, 25 Nov 2016 16:18:03 -0800 (PST)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Sat, 26 Nov 2016 01:18:08 +0100
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161126001808.GF8369@jama>
References: <20161123092209.23699-1-raj.khem@gmail.com>
	<20161123092209.23699-46-raj.khem@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20161123092209.23699-46-raj.khem@gmail.com>
User-Agent: Mutt/1.7.1 (2016-10-04)
Subject: Re: [meta-multimedia][PATCH 46/49] tvheadend: Update to 4.0.9
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
X-List-Received-Date: Sat, 26 Nov 2016 00:18:03 -0000
X-Groupsio-MsgNum: 64048
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="7mxbaLlpDEyR1+x6"
Content-Disposition: inline

--7mxbaLlpDEyR1+x6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Nov 23, 2016 at 01:22:06AM -0800, Khem Raj wrote:
> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> ---
>  .../tvheadend/0001-Fix-checks-for-sse2-mmx.patch   | 40 ++++++++++
>  ...efile-Ignore-warning-about-wrong-includes.patch | 31 ++++++++
>  ...end-specific-LD-CFLAGS-into-a-helper-vari.patch | 92 ----------------------
>  .../0001-disable-varargs-warning-on-clang.patch    | 32 ++++++++
>  .../0001-dvr-Use-labs-instead-of-abs.patch         | 37 +++++++++
>  ...verride-forced-overrdiing-og-CC-STRIP-and.patch | 40 ++++++++++
>  .../tvheadend/0002-fix-issues-with-gcc6.patch      | 46 -----------
>  .../recipes-dvb/tvheadend/tvheadend_git.bb         | 15 ++--
>  8 files changed, 189 insertions(+), 144 deletions(-)
>  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Fix-checks-for-sse2-mmx.patch
>  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Makefile-Ignore-warning-about-wrong-includes.patch
>  delete mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-Move-tvheadend-specific-LD-CFLAGS-into-a-helper-vari.patch
>  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-disable-varargs-warning-on-clang.patch
>  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-dvr-Use-labs-instead-of-abs.patch
>  create mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0001-hdhomerun-Override-forced-overrdiing-og-CC-STRIP-and.patch
>  delete mode 100644 meta-multimedia/recipes-dvb/tvheadend/tvheadend/0002-fix-issues-with-gcc6.patch

tvheadend-4.0.9+git64fec8120158de585e18be705055259484518d94:
/usr/bin/tvheadend contained in package tvheadend requires libucsi.so,
but no providers found in RDEPENDS_tvheadend? [file-rdeps]

http://lists.openembedded.org/pipermail/openembedded-devel/2016-November/110050.html


--7mxbaLlpDEyR1+x6
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCWDjUvwAKCRA3VSO3ZXaA
HDcxAJ9WzaGhqFg+aJUOTJqAEARGDBr4UQCghNo/GUxmB48UcgTW4wNTKeVza5U=
=hGXc
-----END PGP SIGNATURE-----

--7mxbaLlpDEyR1+x6--
