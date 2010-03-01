Received: from mail-iw0-f180.google.com ([209.85.223.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NmDvE-0003TK-Af
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 23:17:08 +0100
Received: by iwn10 with SMTP id 10so2674268iwn.16
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 14:14:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Uaw6wNE3pHaiXAogacc8aSyUeWXeCfpO106OVcJ/mIc=;
	b=Z6oLcmkLTnZRIUMmirnRqudMlJjHebz3Z/4WwM28TFGHjOEHwPbkX+gdUtxUCzNDoh
	JiasLm6nzorvJ0u5tHaVVtgU9p4m9shBIhjvwwboaWaWad8EAHV7OkeYWODrt6waGE/b
	0z/+uYf7sOusbcCsv9FFB86TZWxcqPXeosX68=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=b3YqGzttH0UtvyFmo+uYNZr8PyR7F9ZeqTqt6k8D4rnA7fXDXezuWQLLlAGFDlLqoD
	rVWOEs1IlKyn0gDYDYyMG5u/XVO5EGZj+/5oEvpAapOVHQhrqUx3y3d/cK3gKnxaeQnX
	OfXZFOi0DR3AGerqFZ+fBToT2INxycAn8ImO8=
MIME-Version: 1.0
Received: by 10.231.147.199 with SMTP id m7mr160826ibv.87.1267481653723; Mon, 
	01 Mar 2010 14:14:13 -0800 (PST)
In-Reply-To: <1267381940-6598-1-git-send-email-ospite@studenti.unina.it>
References: <1267381940-6598-1-git-send-email-ospite@studenti.unina.it>
Date: Mon, 1 Mar 2010 14:14:13 -0800
Message-ID: <19c1b8a91003011414p3610b861k136ea412526bff19@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.180
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC, PATCH] distros: prettier notation for dev snapshots version strings
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
X-List-Received-Date: Mon, 01 Mar 2010 22:17:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 28, 2010 at 10:32 AM, Antonio Ospite
<ospite@studenti.unina.it> wrote:
> Make archives names look a little better. Compare the current:
> =A0minimal-.dev-snapshot-20100216-i686-linux-armv5te-linux-gnueabi-toolch=
ain.tar.bz2
> to the proposed:
> =A0minimal-dev.snapshot.20100216-i686-linux-armv5te-linux-gnueabi-toolcha=
in.tar.bz2

may be just getting rid of that '-.' and using just '-' would be enough ?
is there any advantage of using . over -

>
> The -. string in the current form could suggest that some part was missin=
g
> when building the archive name.
>
> Signed-off-by: Antonio Ospite <ospite@studenti.unina.it>
> ---
> =A0conf/distro/minimal.conf =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A0conf/distro/oplinux-uclibc.conf | =A0 =A02 +-
> =A0conf/distro/oplinux.conf =A0 =A0 =A0 =A0| =A0 =A02 +-
> =A03 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/conf/distro/minimal.conf b/conf/distro/minimal.conf
> index 8e0ae2e..29ad9d2 100644
> --- a/conf/distro/minimal.conf
> +++ b/conf/distro/minimal.conf
> @@ -11,7 +11,7 @@
> =A0# NAME and VERSION
> =A0######################################################################=
#######
> =A0DISTRO_NAME ?=3D "minimal"
> -DISTRO_VERSION =3D ".dev-snapshot-${SRCDATE}"
> +DISTRO_VERSION =3D "dev.snapshot.${SRCDATE}"
> =A0#DISTRO_TYPE =3D "release"
> =A0DISTRO_TYPE ?=3D "debug"
>
> diff --git a/conf/distro/oplinux-uclibc.conf b/conf/distro/oplinux-uclibc=
.conf
> index b8617cc..59c6ede 100644
> --- a/conf/distro/oplinux-uclibc.conf
> +++ b/conf/distro/oplinux-uclibc.conf
> @@ -21,7 +21,7 @@ require conf/distro/include/sane-srcdates.inc
> =A0# Header
> =A0#
> =A0DISTRO_NAME =3D "OPLinux-uClibC"
> -DISTRO_VERSION =3D ".dev-snapshot-${SRCDATE}"
> +DISTRO_VERSION =3D "dev.snapshot.${SRCDATE}"
> =A0#DISTRO_TYPE =3D "release"
> =A0DISTRO_TYPE =3D "debug"
>
> diff --git a/conf/distro/oplinux.conf b/conf/distro/oplinux.conf
> index 43e8fad..5b9d7cd 100644
> --- a/conf/distro/oplinux.conf
> +++ b/conf/distro/oplinux.conf
> @@ -25,7 +25,7 @@ require conf/distro/include/sane-srcdates.inc
> =A0# Header
> =A0#
> =A0DISTRO_NAME =3D "OPLinux"
> -DISTRO_VERSION ?=3D ".dev-snapshot-${SRCDATE}"
> +DISTRO_VERSION ?=3D "dev.snapshot.${SRCDATE}"
> =A0#DISTRO_TYPE =3D "release"
> =A0DISTRO_TYPE =3D "debug"
>
> --
> 1.7.0
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


