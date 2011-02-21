Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1PrRFD-0003l8-9g
	for openembedded-devel@lists.openembedded.org;
	Mon, 21 Feb 2011 09:35:47 +0100
Received: by fxm8 with SMTP id 8so1225278fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Feb 2011 00:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-type:content-transfer-encoding;
	bh=muGUDhlRQVbX+vD7+/Dgk/JPkasodNdB0G3XyGAyg3U=;
	b=s47057uNScsMpiAc363X6xKV4r6uV3WiOPsXZilHdAx9neV2vZcvyZwnstg6CpQKd1
	q+guIoafisIpWg5ym43hUcIf6SIrHqmKTgr3stqi7H42AayaqThLGASPbrXEke/RH590
	vq53XkPgqDVcEwEfG0nlxwnNXb6O8ddNBZhAs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-type:content-transfer-encoding;
	b=YHbwyYzYg8B2wjvxrDZJoZCJCFjT8SP0oZHipNeItdMiBbOdpMz5SJ6GR0o89JGe7k
	T3f2/Cd6maZc9hsaQOgFFT2U+I4jx03b6Od6+iWKn/Bw52KJ2rJsUV9J6c436KCrYIcy
	Nen8oDF2HPqwjHq6Wuq23dz33mMxWnQ4hCRHg=
Received: by 10.223.71.199 with SMTP id i7mr1536360faj.57.1298277270556; Mon,
	21 Feb 2011 00:34:30 -0800 (PST)
MIME-Version: 1.0
Received: by 10.223.30.151 with HTTP; Mon, 21 Feb 2011 00:34:08 -0800 (PST)
In-Reply-To: <4D61CA73.7000306@mwester.net>
References: <4D61CA73.7000306@mwester.net>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 21 Feb 2011 00:34:08 -0800
Message-ID: <AANLkTimUMs9CBky1JmzY7BUMQTdHfUsyRqdMa7JvgufX@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] squid: fix references to host headers and libs
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
X-List-Received-Date: Mon, 21 Feb 2011 08:35:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 20, 2011 at 6:14 PM, Mike Westerhof <mike@mwester.net> wrote:
> This patch changes hard-coded references to /usr and /opt in the various
> squid config.test scripts to point to the correct sysroot paths.
>
> Signed-off-by: Mike Westerhof <mike@mwester.net>
> ---
> diff --git a/recipes/squid/squid_3.1.9.bb b/recipes/squid/squid_3.1.9.bb
> index 713b1ea..ecd6fdc 100644
> --- a/recipes/squid/squid_3.1.9.bb
> +++ b/recipes/squid/squid_3.1.9.bb
> @@ -1,4 +1,4 @@
> -PR =3D "${INC_PR}.0"
> +PR =3D "${INC_PR}.1"
>
> =C2=A0include squid.inc
>
> @@ -18,6 +18,11 @@ do_configure_prepend() {
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export ac_cv_epoll_ctl=3Dyes
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export ac_cv_epoll_works=3Dyes
> =C2=A0 =C2=A0 =C2=A0 =C2=A0export ac_cv_func_setresuid=3Dyes
> + =C2=A0 =C2=A0 =C2=A0 # Patch up the various config scripts to refer to =
sysroot
> + =C2=A0 =C2=A0 =C2=A0 for i in `find ${S} -name config.test`; do
> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 sed -i -e 's|/usr|${STAGING_DIR_HOST=
}/usr|g' \

I dont know if this works for say micro distro. May be using
 STAGING_EXECPREFIXDIR instead of ${STAGING_DIR_HOST}/usr

or using

 ${STAGING_DIR_HOST}${exec_prefix}

would be more portable

> + =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-e 's|/op=
t|${STAGING_DIR_HOST}/opt|g' "$i"
> + =C2=A0 =C2=A0 =C2=A0 done
> =C2=A0}
>
> =C2=A0do_install_append() {
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


