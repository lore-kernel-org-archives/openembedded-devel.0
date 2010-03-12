Received: from mail-iw0-f174.google.com ([209.85.223.174])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NqBKn-0002dd-0H
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Mar 2010 21:19:49 +0100
Received: by iwn4 with SMTP id 4so150046iwn.3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Mar 2010 12:16:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=Ca1Ekx0WzmEQI7cYCq5QpGhlz12KCxa1yaBa7k+5Sps=;
	b=BMAWcCaBO3CgwE+DvHwgTP6f6XHJvWf3aMZs3goNpFR1D31+a7TokGktFXUWWaTPJg
	mdjE0L8cXbWXbMpR9liOFyIv4zIg/qR4xaV3PnHS25pZCEJKLAC6iGXOfwdLSxfJWqZl
	UCHiZVvewJUPeFU0zgSh2/dFzLeuoqF9Bc94s=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=HHOSeedUWsVmpuF0ZKI/lgVxvxbl2Rz2WKPeYOfZzYtu/loPSIQdpU/3/hZI5SMMPB
	huk1h01J87f3hx/9PUGbwAOYRuTr1PGO/8IjINurorVc6R8R/DpUpPUI7Tx49inPH3m/
	ByFrJFWx4EFYQiiEbhiIUmwrCZCIZmEVNCb5A=
MIME-Version: 1.0
Received: by 10.231.60.17 with SMTP id n17mr164551ibh.24.1268425008908; Fri, 
	12 Mar 2010 12:16:48 -0800 (PST)
In-Reply-To: <1268396830-12108-1-git-send-email-ospite@studenti.unina.it>
References: <20100305092145.6037080d.ospite@studenti.unina.it>
	<1268396830-12108-1-git-send-email-ospite@studenti.unina.it>
Date: Fri, 12 Mar 2010 12:16:48 -0800
Message-ID: <19c1b8a91003121216q7e6c0e7bwad4c6ef98e5578fa@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Antonio Ospite <ospite@studenti.unina.it>
X-SA-Exim-Connect-IP: 209.85.223.174
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] distros: remove leading dots in DISTRO_VERSIONs
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
X-List-Received-Date: Fri, 12 Mar 2010 20:19:49 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 12, 2010 at 4:27 AM, Antonio Ospite
<ospite@studenti.unina.it> wrote:
> Having a leading dot in DISTRO_VERSION will result in a '-.' string when
> building archive names; this may lead to mistakenly think that something =
is
> missing in the archive name.
>
> Example:
> minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-toolchain=
.tar.bz2
> =A0 =A0 =A0 ^^
>
> Remove the leading dot in DISTRO_VERSIONs to avoid such possible
> confusion.
>
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>

looks ok to me
Acked-by: Khem Raj <raj.khem@gmail.com>


> ---
> Changes since RFC/v1:
> Just strip the leading dot as suggested by Khem Raj.
>
> Thanks,
> =A0 Antonio
>
> =A0conf/distro/minimal.conf =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0conf/distro/oplinux-uclibc.conf | =A0 =A02 +-
> =A0conf/distro/oplinux.conf =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A03 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 8e0ae2e..7aa6c58 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -11,7 +11,7 @@
> =A0# NAME and VERSION
> =A0######################################################################=
#######
> =A0DISTRO_NAME ?=3D "minimal"
> -DISTRO_VERSION =3D ".dev-snapshot-${SRCDATE}"
> +DISTRO_VERSION =3D "dev-snapshot-${SRCDATE}"
> =A0#DISTRO_TYPE =3D "release"
> =A0DISTRO_TYPE ?=3D "debug"
>
> diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc=
.conf
> index b8617cc..480602b 100644
> --- a/conf/distro/oplinux-uclibc.conf
> +++ b/conf/distro/oplinux-uclibc.conf
> @@ -21,7 +21,7 @@ require conf/distro/include/sane-srcdates.inc
> =A0# Header
> =A0#
> =A0DISTRO_NAME =3D "OPLinux-uClibC"
> -DISTRO_VERSION =3D ".dev-snapshot-${SRCDATE}"
> +DISTRO_VERSION =3D "dev-snapshot-${SRCDATE}"
> =A0#DISTRO_TYPE =3D "release"
> =A0DISTRO_TYPE =3D "debug"
>
> diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
> index 43e8fad..b64477c 100644
> --- a/conf/distro/oplinux.conf
> +++ b/conf/distro/oplinux.conf
> @@ -25,7 +25,7 @@ require conf/distro/include/sane-srcdates.inc
> =A0# Header
> =A0#
> =A0DISTRO_NAME =3D "OPLinux"
> -DISTRO_VERSION ?=3D ".dev-snapshot-${SRCDATE}"
> +DISTRO_VERSION ?=3D "dev-snapshot-${SRCDATE}"
> =A0#DISTRO_TYPE =3D "release"
> =A0DISTRO_TYPE =3D "debug"
>
> --
> 1.7.0
>
>


