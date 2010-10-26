Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PAd9t-0003Wl-By
	for openembedded-devel@lists.openembedded.org;
	Tue, 26 Oct 2010 08:37:23 +0200
Received: by iwn42 with SMTP id 42so577026iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 25 Oct 2010 23:36:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=XyB8EwsyE29isBAoGY1IJoyNHB2Emc1+VpwZqqhgDd4=;
	b=eQvSSF9vTzZyzfRKxLrateYk2OkitCp8ygD19TtomLrjT1UjOzTeWt/8vpkCCUfWO+
	Phv4S+k1lINGbX0JzpOw1wYbaEM6XCenva/zpEHrlO9SGLV2XJRhPdVqQHbS2HIcZkLu
	KbTQdvCIVNOD362ttuiKiQcZfUEFf5OxEbrfU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=laU0NuRqTTTRw4dgjubv+7NcyWn59LrNpZA//COWHwfxAZL4zk9OgTqPsjwfn88x70
	JA/t9apVFAsoxs2jP7XsVDYJJe9r0lvWriSsdJEexqhqGD8ZGqgN4/TXZ/VQItYsMW1Y
	9CYyspkuv3uJSR6IjQ37CCk+CHXV8ybklHYME=
MIME-Version: 1.0
Received: by 10.231.33.132 with SMTP id h4mr6759363ibd.150.1288074999371; Mon,
	25 Oct 2010 23:36:39 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Mon, 25 Oct 2010 23:36:39 -0700 (PDT)
In-Reply-To: <4CC61633.3080808@gmail.com>
References: <4CC61633.3080808@gmail.com>
Date: Tue, 26 Oct 2010 08:36:39 +0200
Message-ID: <AANLkTikkXFLFr0iTWTmxzF6iUM9RMmfvQppxvptuNyLG@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] espgs_8.15.3.bb: Depend on cups as EXTRA_OECONF has --enable-cups.
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
X-List-Received-Date: Tue, 26 Oct 2010 06:37:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/10/26 Graham Gower <graham.gower@gmail.com>:
>
> pstoraster/gdevcups.c:74:25: fatal error: cups/raster.h: No such file or =
directory
>
> Signed-off-by: Graham Gower <graham.gower@gmail.com>
> ---
> =A0recipes/espgs/espgs_8.15.3.bb | =A0 =A02 +-
> =A01 files changed, 1 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/espgs/espgs_8.15.3.bb b/recipes/espgs/espgs_8.15.3.b=
b
> index ba03f00..c2349e0 100644
> --- a/recipes/espgs/espgs_8.15.3.bb
> +++ b/recipes/espgs/espgs_8.15.3.bb
> @@ -2,7 +2,7 @@ DESCRIPTION =3D "ESP Ghostscript is an up-to-date GNU Gho=
stscript distribution \
> =A0including bug fixes, new drivers, and additional support for CUPS."
> =A0HOMEPAGE =3D "http://www.cups.org/espgs/"
> =A0SECTION =3D "libs"
> -DEPENDS =3D "jpeg zlib libpng tiff fontconfig"
> +DEPENDS =3D "jpeg zlib libpng tiff fontconfig cups"
> =A0LICENSE =3D "GPL"
> =A0PR =3D "r1"
>
>

Three small remarks:
- not sure if changes like this require a PR bump. I always choose the
the safe way and bump when in doubt.
- it would be nice if, when you are fixing a recipe you would also
improve the LICENSE =3D "GPL" thing
- and there is also a 7.07.1 recipe. Should this apply to this version
as well (or alternately should we remove that recipe?)

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


