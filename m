Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1OcmAl-00082L-KL
	for openembedded-devel@lists.openembedded.org;
	Sat, 24 Jul 2010 23:22:21 +0200
Received: by fxm12 with SMTP id 12so5713681fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 24 Jul 2010 14:22:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=ei9nOUm6k6FkKeNvLptOtp5E/OZ9Gb6OwvS+b5ud9NM=;
	b=Ei1I6h303J4TVViAbfEdHTL59BHUVIeoHVjehSHmPu/xQG8QAfsQGNAo6qiqdpMWoI
	SBivgUTwcaPvYLYDXtiWjkcq6TKMbuxRBaGsalwCVUDJ8oOPDaBgLmz2V3Kvu+n/MB0K
	TDikQ1pYHTa/igCC//qchxsEihqvAv4bmPl2M=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=ktP45TnC3/uhrfzPPziL/i3MXVdFffo4HVvM/xK8/LV1IW6w5AI2gGMe5Y0cwzALHc
	kR0j93JLYTy4JuOoHYLE0PbwFJam2i43rXpYTdQZmcjzMZOgRR8qU7atuPrJrZHE5yaH
	Pv5yiXSLCBua8Snc2q5xZZqOBoQMUKrYX05Kc=
MIME-Version: 1.0
Received: by 10.103.222.6 with SMTP id z6mr952620muq.94.1280006525230; Sat, 24 
	Jul 2010 14:22:05 -0700 (PDT)
Received: by 10.102.59.17 with HTTP; Sat, 24 Jul 2010 14:22:05 -0700 (PDT)
In-Reply-To: <E1OcfGN-0007DB-9C@melo.openembedded.org>
References: <E1OcfGN-0007DB-9C@melo.openembedded.org>
Date: Sat, 24 Jul 2010 23:22:05 +0200
Message-ID: <AANLkTik35dsZ6rMfu8KJNo7ZoKd6071ELAhYmzr6T7Y+@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org, utx@penguin.cz
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [oe-commits] Stanislav Brabec : akita.conf, spitz.conf: Set PREFERRED_PROVIDER for udev-compat to udev-compat141.
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
X-List-Received-Date: Sat, 24 Jul 2010 21:22:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Stanislav,

thx for your work.

Please note that other machines (c7x0 and poodle) are needing the same
preference, thus I propose you move this in zaurus-2.6.inc.
Collie and tosa are not concerned, having 2.6.3x kernel.

Regards

Andrea

On Sat, Jul 24, 2010 at 3:59 PM, git version control
<git@git.openembedded.org> wrote:
> Module: openembedded.git
> Branch: org.openembedded.dev
> Commit: b634978194d9b8f2a833863c540ceb5458b41e45
> URL: =A0 =A0http://gitweb.openembedded.net/?p=3Dopenembedded.git&a=3Dcomm=
it;h=3Db634978194d9b8f2a833863c540ceb5458b41e45
>
> Author: Stanislav Brabec <sbrabec@suse.cz>
> Date: =A0 Sat Jul 24 15:51:39 2010 +0200
>
> akita.conf, spitz.conf: Set PREFERRED_PROVIDER for udev-compat to udev-co=
mpat141.
>
> ---
>
> =A0conf/machine/akita.conf | =A0 =A03 +++
> =A0conf/machine/spitz.conf | =A0 =A03 +++
> =A02 files changed, 6 insertions(+), 0 deletions(-)
>
> diff --git a/conf/machine/akita.conf b/conf/machine/akita.conf
> index 4afa515..d2ff69e 100644
> --- a/conf/machine/akita.conf
> +++ b/conf/machine/akita.conf
> @@ -21,3 +21,6 @@ MACHINE_DISPLAY_PPI =3D "216"
> =A0UBOOT_MACHINE =3D "akita_config"
> =A0UBOOT_ENTRYPOINT =3D "0xA1000000"
> =A0UBOOT_LOADADDRESS =3D "${UBOOT_ENTRYPOINT}"
> +
> +# udev-141 is the latest version that works with linux-2.6.26-RP
> +PREFERRED_PROVIDER_udev-compat =3D "udev-compat141"
> diff --git a/conf/machine/spitz.conf b/conf/machine/spitz.conf
> index 0b5331e..314d346 100644
> --- a/conf/machine/spitz.conf
> +++ b/conf/machine/spitz.conf
> @@ -27,3 +27,6 @@ MACHINE_DISPLAY_PPI =3D "216"
> =A0UBOOT_MACHINE =3D "akita_config"
> =A0UBOOT_ENTRYPOINT =3D "0xA1000000"
> =A0UBOOT_LOADADDRESS =3D "${UBOOT_ENTRYPOINT}"
> +
> +# udev-141 is the latest version that works with linux-2.6.26-RP
> +PREFERRED_PROVIDER_udev-compat =3D "udev-compat141"
>
>
> _______________________________________________
> Openembedded-commits mailing list
> Openembedded-commits@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-commits
>


