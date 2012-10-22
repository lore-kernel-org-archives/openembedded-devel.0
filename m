Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <rangers.av@gmail.com>) id 1TQJyv-0001pS-Kv
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Oct 2012 17:32:05 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so1570484lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Oct 2012 08:18:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=QzNid935g4yLI0OrhJEqnbLDjfz3pLD9V4hUM7tp5zQ=;
	b=Vj4O/ualSj8xgaPMrpBGiFg9EdAds7YTWv/rAN8Jp/XeKFxtL44bOuv1lWy+RCV0wW
	uBnLmesvD0fFCZm3c5D5FBDNiCHB9Tqm9WRa41p2TE88s55g8tcktKEP0aMbQ/05mDkT
	CfZQgMcwx/mTg2OjnfBOxgOE0q4PF/MCGHcOUueQtxq2sHQK4ysPi+WBnp9hYhXQzubI
	Kr0EyUIkzxLAknehNeSjYhmc3GSUhozPc3jhkkFsX8/7vSTU2zaPhDIntS8Enp6a/kfz
	7Jr4ZsCqul0LHqJ8y/6rUkqsBl/eNdWre8g3/w3X3QFz3WpcDvG6MntFW04qKkvrizGm
	RAEA==
MIME-Version: 1.0
Received: by 10.112.102.10 with SMTP id fk10mr3845833lbb.40.1350919112618;
	Mon, 22 Oct 2012 08:18:32 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Mon, 22 Oct 2012 08:18:32 -0700 (PDT)
Received: by 10.112.28.8 with HTTP; Mon, 22 Oct 2012 08:18:32 -0700 (PDT)
In-Reply-To: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
References: <1350918808-23478-1-git-send-email-s.stirtzel@googlemail.com>
Date: Mon, 22 Oct 2012 20:48:32 +0530
Message-ID: <CAMQ5J2bVMpK6+uX4Rbi0spKLduy5of4JX2esXZbOE5k_muvATg@mail.gmail.com>
From: RaNgErS <rangers.av@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [meta-oe][PATCH v3] libjpeg-turbo: Add RPROVIDES to fix errors when rdepending on jpeg
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
X-List-Received-Date: Mon, 22 Oct 2012 15:32:06 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I had a problem with do_rootfs. Using master branch and 2012. Distro.
On Oct 22, 2012 8:44 PM, "Samuel Stirtzel" <s.stirtzel@googlemail.com>
wrote:

> This fixes "ERROR: Multiple .bb files are due to be built which each
> provide jpeg"
>
> Signed-off-by: Samuel Stirtzel <s.stirtzel@googlemail.com>
> ---
>  meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb |    5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bbb/meta-oe/recipes-core/jpeg/
> libjpeg-turbo_svn.bb
> index 2aefe1f..d87743b 100644
> --- a/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> +++ b/meta-oe/recipes-core/jpeg/libjpeg-turbo_svn.bb
> @@ -7,7 +7,7 @@ LIC_FILES_CHKSUM =
> "file://cdjpeg.h;endline=12;md5=78fa8dbac547bb5b2a0e6457a6cfe
>
>  file://djpeg.c;endline=13;md5=e85613b52f2906c5dfc0e21ec902cb33 \
>  "
>  PV = "8d+1.2.1"
> -PR = "r1"
> +PR = "r2"
>  SRCREV = "837"
>  SRC_URI = "svn://
> libjpeg-turbo.svn.sourceforge.net/svnroot/libjpeg-turbo;protocol=https;module=trunk
> "
>
> @@ -15,6 +15,9 @@ S = "${WORKDIR}/trunk"
>
>  # Drop-in replacement for jpeg
>  PROVIDES = "jpeg"
> +RPROVIDES_${PN} += "jpeg"
> +RREPLACES_${PN} += "jpeg"
> +RCONFLICTS_${PN} += "jpeg"
>
>  inherit autotools pkgconfig
>
> --
> 1.7.9.5
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

