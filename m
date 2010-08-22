Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OnDMh-0000ii-Q7
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Aug 2010 18:25:48 +0200
Received: by mail-iw0-f175.google.com with SMTP id 2so2211754iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Aug 2010 09:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=xj5b2NeqsWO0UeSzih8nJF9Du7N+MbBr/5kl+pkReAs=;
	b=o026Ni8nmBixhvZAkIvmPJ96N5TxSslRUb1H6k/4hdFBTk7ipgiPkGCJOGPohkdAPB
	ZpC3hDeWRObxGuOzDxii7OeiiOSEnKCpMYd0csFeuzArp3C6rxup1oFgACzeTo/UU/se
	Fq8u8V1ndv40BBqR+r2OxvM1z/IUXvqhj7YjQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=rTLr6+OgLcP4dyMs6RE0yWBU5U5PiZBHsVBEmm81UuFoUwpUs6iGBZsJ9m1XQZReyA
	Y2RXz54go883RvpHNfyy4fnXWhLcQG1bqRPAZHn6DcE5+I4vtp0SjKKdmG3iFEk6g8GG
	sRIK0aC8FVtA/RXFtFlNuyThZAieaF7/rlrgg=
MIME-Version: 1.0
Received: by 10.231.169.149 with SMTP id z21mr5217964iby.11.1282494326352;
	Sun, 22 Aug 2010 09:25:26 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sun, 22 Aug 2010 09:25:26 -0700 (PDT)
In-Reply-To: <1282493728-2421-1-git-send-email-khimov@altell.ru>
References: <1282493728-2421-1-git-send-email-khimov@altell.ru>
Date: Sun, 22 Aug 2010 18:25:26 +0200
Message-ID: <AANLkTin-72pt6xR4zkBaSO9L-ieZpTSevocE4hWLOzOe@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/2] ethtool: add version 2.6.35
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
X-List-Received-Date: Sun, 22 Aug 2010 16:25:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/22 Roman I Khimov <khimov@altell.ru>:
> Signed-off-by: Roman I Khimov <khimov@altell.ru>
> ---
> =A0recipes/ethtool/ethtool_2.6.35.bb | =A0 =A05 +++++
> =A01 files changed, 5 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/ethtool/ethtool_2.6.35.bb
>
> diff --git a/recipes/ethtool/ethtool_2.6.35.bb b/recipes/ethtool/ethtool_=
2.6.35.bb
> new file mode 100644
> index 0000000..b4473d5
> --- /dev/null
> +++ b/recipes/ethtool/ethtool_2.6.35.bb
> @@ -0,0 +1,5 @@
> +require ethtool.inc
> +PR =3D "r0"
> +
> +SRC_URI[md5sum] =3D "e0f617779a58b77af061a9e5178d0b25"
> +SRC_URI[sha256sum] =3D "be0a7b0fbe56fd455bcef24af7f047b02cefecfb422f4ebc=
3e4e924bce30e891"
> \ No newline at end of file
> --
> 1.6.4.2
>
If you add a newline after that last checksum:
Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>


