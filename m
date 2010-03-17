Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Ns2LI-0006LE-De
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Mar 2010 00:08:06 +0100
Received: by iwn14 with SMTP id 14so1291316iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Mar 2010 16:04:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=skO8YYWTwhu49Roe1/OynTieYkutZxX0unt4dkQrBVk=;
	b=eYKPrEGEFG7+q55yWbw0lb0Q0UknHOzjbcPfL+IFVUeIU+KZdv0P3TXKodGxesXgt0
	G6aumJuynwKke2rGEbfTtLi7EQhXSyGmk0ACsOplPo82pGMLSbMjAqiGD+Cg2DlJW80O
	4R7VUS39oWQJCLWqNNTmYd+AHLM0X6eRGs1u8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=v8/RQxjPNMMS67/JH3AOYzo0HLc6pWbE4v8qz90ukZkLCS/Wlupn0ixFL9NqdhcpU9
	PuX3G463/fSvZl3XJiRSnuiDjS4jYD5N0rxFHUNOamV9tdKa7EE7LD5rpuPRGtKH4PNf
	f51TzvBSqRBDVBhZe3joGDDvuEHTVjHup9X5o=
MIME-Version: 1.0
Received: by 10.231.148.16 with SMTP id n16mr806928ibv.37.1268867096046; Wed, 
	17 Mar 2010 16:04:56 -0700 (PDT)
In-Reply-To: <1268857354-30377-1-git-send-email-sledz@dresearch.de>
References: <1268857354-30377-1-git-send-email-sledz@dresearch.de>
Date: Wed, 17 Mar 2010 16:04:55 -0700
Message-ID: <19c1b8a91003171604nbe1f9aega247ce4b331b6350@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] libunwind: new recipe
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
X-List-Received-Date: Wed, 17 Mar 2010 23:08:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 17, 2010 at 1:22 PM, Steffen Sledz <sledz@dresearch.de> wrote:
> a portable and efficient C programming interface (API) to determine the
> call-chain of a program
>
> Signed-off-by: Steffen Sledz <sledz@dresearch.de>
> ---
> =A0recipes/libunwind/libunwind.inc =A0 =A0 | =A0 13 +++++++++++++
> =A0recipes/libunwind/libunwind_0.99.bb | =A0 =A05 +++++
> =A02 files changed, 18 insertions(+), 0 deletions(-)
> =A0create mode 100644 recipes/libunwind/libunwind.inc
> =A0create mode 100644 recipes/libunwind/libunwind_0.99.bb
>
> diff --git a/recipes/libunwind/libunwind.inc b/recipes/libunwind/libunwin=
d.inc
> new file mode 100644
> index 0000000..8513dc2
> --- /dev/null
> +++ b/recipes/libunwind/libunwind.inc
> @@ -0,0 +1,13 @@
> +DESCRIPTION =3D "a portable and efficient C programming interface (API) =
to determine the call-chain of a program"
> +DEPENDS =3D ""
> +HOMEPAGE =3D "http://www.nongnu.org/libunwind"
> +LICENSE =3D "MIT"
> +INC_PR =3D "r1"

a new recipe should start with r0

> +
> +SRC_URI =3D "http://download.savannah.nongnu.org/releases/libunwind/${PN=
}-${PV}.tar.gz;name=3Darchive"

may be use name=3Dlibunwind  for better readability

> +
> +S =3D "${WORKDIR}/${PN}-${PV}"
> +
> +inherit autotools
> +
> +BBCLASSEXTEND =3D "native"

is native recipe needed by some other recipe ?

> diff --git a/recipes/libunwind/libunwind_0.99.bb b/recipes/libunwind/libu=
nwind_0.99.bb
> new file mode 100644
> index 0000000..b7d0612
> --- /dev/null
> +++ b/recipes/libunwind/libunwind_0.99.bb
> @@ -0,0 +1,5 @@
> +require libunwind.inc
> +PR =3D "${INC_PR}.0"
> +
> +SRC_URI[archive.md5sum] =3D "3e9ca08118e22165a7f07d01d61a2d0d"
> +SRC_URI[archive.sha256sum] =3D "56083aae17eab3ccb7a36b95f0430f5a5f258755=
bf193bb5ca4fd4b918356164"
> --
> 1.6.4.2
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


