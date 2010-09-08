Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OtOa2-0002m5-Hc
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Sep 2010 19:37:08 +0200
Received: by pwj8 with SMTP id 8so165884pwj.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Sep 2010 10:36:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type
	:content-transfer-encoding;
	bh=hugokynQk+e93PFZzYIbBBiQa5wvm1J0BibaX2xeTHM=;
	b=cvbj4aGDU9iCtlArFeq7CvunE/Ggcen/vY9h9vzMURvuUTYg/lkXbakTVXm06gSISC
	QaSupkbHyFhZiI7I+LoDl5k00pGEQifhZPAyO5RokSk7ePh3f8oUoPL8yy5vhJo2RqVv
	u9UHP6Cht8FRhKXwqbtbyYqPmbYLheMS4cWPQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:content-transfer-encoding;
	b=Ayeaou+2HPNqjxA8MdSwifk5KqcP8Af9CfWoxXQvAqmFiZRi8ap5lGk71qIsFVk5QU
	M/3woUJoFMjlrsh2bxWjKz4f6nolvqK/EaUK7+LrqqctJB91bWvaSv6Wj+DDd7QuTFqz
	4t5PLyZ+yIF5O1renuKjH/qS7c1TXu1wuJu9k=
Received: by 10.114.161.20 with SMTP id j20mr99159wae.167.1283967383486; Wed,
	08 Sep 2010 10:36:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.205.134 with HTTP; Wed, 8 Sep 2010 10:36:03 -0700 (PDT)
In-Reply-To: <1283959092-6481-2-git-send-email-eric@eukrea.com>
References: <AANLkTinfxZO07kTjsaFWWZfXzwAdPgKNZAaWEKV-ZTVg@mail.gmail.com>
	<1283959092-6481-1-git-send-email-eric@eukrea.com>
	<1283959092-6481-2-git-send-email-eric@eukrea.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 8 Sep 2010 10:36:03 -0700
Message-ID: <AANLkTik4yZ+mNwa=dg4vxphMFnc=rRYOkLP58DNsh7Bx@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2 2/2] rlpr: upgrade to version 2.06
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
X-List-Received-Date: Wed, 08 Sep 2010 17:37:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 8, 2010 at 8:18 AM, Eric B=E9nard <eric@eukrea.com> wrote:
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Khem Raj <raj.khem@gmail.com>

> ---
> =A0recipes/rlpr/{rlpr_2.05.bb =3D> rlpr_2.06.bb} | =A0 =A08 ++++----
> =A01 files changed, 4 insertions(+), 4 deletions(-)
> =A0rename recipes/rlpr/{rlpr_2.05.bb =3D> rlpr_2.06.bb} (60%)
>
> diff --git a/recipes/rlpr/rlpr_2.05.bb b/recipes/rlpr/rlpr_2.06.bb
> similarity index 60%
> rename from recipes/rlpr/rlpr_2.05.bb
> rename to recipes/rlpr/rlpr_2.06.bb
> index 2751b9f..64220ce 100644
> --- a/recipes/rlpr/rlpr_2.05.bb
> +++ b/recipes/rlpr/rlpr_2.06.bb
> @@ -2,11 +2,11 @@ DESCRIPTION =3D "rlpr makes it possible to print files =
on remote sites to your net
> =A0HOMEPAGE =3D "http://freshmeat.net/projects/rlpr/"
> =A0SECTION =3D "console/network"
> =A0LICENSE =3D "GPL"
> -PR =3D "r1"
> +PR =3D "r0"
>
> -SRC_URI =3D "${DEBIAN_MIRROR}/main/r/rlpr/rlpr_2.05.orig.tar.gz"
> -SRC_URI[md5sum] =3D "64ee8ccd94aabc90b9f40d0b2ad79e79"
> -SRC_URI[sha256sum] =3D "6b1261c8a23a58c8e174d8ee1ad53c138ed0b9211f7ea3f3=
efe22d16af14ba9a"
> +SRC_URI =3D "http://linuxfocus.org/~guido/rlpr-2.06.tar.gz"
> +SRC_URI[md5sum] =3D "c3192d0e84ccae432e754640f6003478"
> +SRC_URI[sha256sum] =3D "32ae5893f4b9250b7a02c98a41b5929cfdd5731b6efbd7ed=
fc77c2c5314388f7"
>
> =A0inherit autotools
>
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


