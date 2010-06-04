Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OKRbq-0004JY-H3
	for openembedded-devel@lists.openembedded.org;
	Fri, 04 Jun 2010 09:48:20 +0200
Received: by fxm9 with SMTP id 9so593328fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 04 Jun 2010 00:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=DshiaqBppzoyTRF4FRwfNYykmaV0aD5r9Ro0wobVUx0=;
	b=lUi5HghGeAVazsHeizrelMU9Wtds0O8+9j3VLQZVTnvVUC+znjbe4RYGjaBsKM3My/
	HqhQ4g1OGlj+Vadd39cwbjNhY6fWO3I/Wsk2TplVZyA8Nemsu3uBtDSu+v8edro4Ku3B
	gxIKhostwegG1RRq1waPZ3JHIVYwWPsn80KsA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=i7YFK/X69VVN43zVzoR7dpaLgXD7Vo4evbjR5eOeCOmNNhU+aj2yK95xRG464KaSzl
	b1UYO9e6CQ+tPcJpyd0gclgHY16CE6jfOl/jLEnvGnxJ9XSUt2/AQzRikmtuxICfsedl
	AXnB2WeJXlWxSXw6XiOEabNpLckNL+D6q0vNU=
MIME-Version: 1.0
Received: by 10.223.143.9 with SMTP id s9mr11402506fau.52.1275637333195; Fri, 
	04 Jun 2010 00:42:13 -0700 (PDT)
Received: by 10.223.106.138 with HTTP; Fri, 4 Jun 2010 00:42:13 -0700 (PDT)
In-Reply-To: <1275510896-30845-15-git-send-email-raj.khem@gmail.com>
References: <1275510896-30845-1-git-send-email-raj.khem@gmail.com>
	<1275510896-30845-15-git-send-email-raj.khem@gmail.com>
Date: Fri, 4 Jun 2010 09:42:13 +0200
Message-ID: <AANLkTints2-F_iYTpGBStTJuRspaD9YhLhAehKh2J3Wx@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 14/16] zlib.inc: Add -fforward-propagate on arm.
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
X-List-Received-Date: Fri, 04 Jun 2010 07:48:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 2, 2010 at 10:34 PM, Khem Raj <raj.khem@gmail.com> wrote:
> * Needed on -O1 compile. Generally we use -Os where
> =A0this option is already enabled. But we enable is anyway
> =A0so it gets picked at -O1 too which we use with DEBUG builds.
>
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> ---
> =A0recipes/zlib/zlib.inc | =A0 =A08 +++++++-
> =A01 files changed, 7 insertions(+), 1 deletions(-)
>
> diff --git a/recipes/zlib/zlib.inc b/recipes/zlib/zlib.inc
> index 0f7bea0..5b00ccf 100644
> --- a/recipes/zlib/zlib.inc
> +++ b/recipes/zlib/zlib.inc
> @@ -3,7 +3,13 @@ SECTION =3D "libs"
> =A0PRIORITY =3D "required"
> =A0HOMEPAGE =3D "http://www.gzip.org/zlib/"
> =A0LICENSE =3D "zlib"
> -INC_PR =3D"r6"
> +INC_PR =3D"r7"
> +
> +# Below option is added to overcome the GCC bug on ARM
> +# see http://gcc.gnu.org/PR42981 for further details.
> +# We could potentially take it off when its fixed in gcc 4.5
> +
> +CFLAGS_append_arm =3D " -fforward-propagate "
>
> =A0BBCLASSEXTEND =3D "native sdk"
>
> --
> 1.7.0.4
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


