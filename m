Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLY8R-0007WK-Tl
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 10:29:01 +0100
Received: by mail-iw0-f175.google.com with SMTP id 7so859110iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 01:27:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=sC627fOeGy3rJaOk+6zU4JsEFGJK4dkqkIW2rvgSQb4=;
	b=fR+DYKBSY6bY3KE8jlk+ZFI5A+YM9OA3K1hSMG89jbqRZH6emVKrmDm8t02MgHZvk/
	3uBLtWx7AALFiMcOpfbUEPeiMD9jpG74jTkccRuTwxA8yodeQ+I1ypzaDrDD2IMaBMII
	f3OHszeqa6TYtrvj+ymD63AWyK1TJOzLIsbkI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=r2+a/2UzldAAWOSNQQTvDuZrZZRclwUJl998Ko2DqIvKJEE+a0OcBqKL8E2KdHoSyy
	m20+lLd33D2y/1rnIxgNXMi1KPuPIi1I+ErNCtcUl2z7nyIluQWAddT2zqS+o3M9r/12
	sxveqVdDg4/UowtxsAEHp6MqR+Vhx9mjFEknE=
MIME-Version: 1.0
Received: by 10.231.37.197 with SMTP id y5mr355475ibd.151.1290677266762; Thu,
	25 Nov 2010 01:27:46 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Thu, 25 Nov 2010 01:27:46 -0800 (PST)
In-Reply-To: <1290676461-13283-4-git-send-email-eric@eukrea.com>
References: <1290676461-13283-1-git-send-email-eric@eukrea.com>
	<1290676461-13283-2-git-send-email-eric@eukrea.com>
	<1290676461-13283-3-git-send-email-eric@eukrea.com>
	<1290676461-13283-4-git-send-email-eric@eukrea.com>
Date: Thu, 25 Nov 2010 10:27:46 +0100
Message-ID: <AANLkTikVziTP0BxQBhBgcn8t+-c6uGL9PK52rB=zjUDp@mail.gmail.com>
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
Subject: Re: [PATCH 4/5] busybox-static: switch to 1.17.4
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
X-List-Received-Date: Thu, 25 Nov 2010 09:29:01 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/11/25 Eric B=E9nard <eric@eukrea.com>:
> before removing busybox-1.17.3
>
> Signed-off-by: Eric B=E9nard <eric@eukrea.com>

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
> ---
> =A0recipes/busybox/busybox-static_1.17.3.bb | =A0 11 -----------
> =A0recipes/busybox/busybox-static_1.17.4.bb | =A0 11 +++++++++++
> =A02 files changed, 11 insertions(+), 11 deletions(-)
> =A0delete mode 100644 recipes/busybox/busybox-static_1.17.3.bb
> =A0create mode 100644 recipes/busybox/busybox-static_1.17.4.bb
>
> diff --git a/recipes/busybox/busybox-static_1.17.3.bb b/recipes/busybox/b=
usybox-static_1.17.3.bb
> deleted file mode 100644
> index 325752a..0000000
> --- a/recipes/busybox/busybox-static_1.17.3.bb
> +++ /dev/null
> @@ -1,11 +0,0 @@
> -require busybox_${PV}.bb
> -PR =3D "${INC_PR}.0"
> -
> -FILESPATHPKG =3D. "busybox-${PV}:"
> -S =3D "${WORKDIR}/busybox-${PV}"
> -
> -do_configure_append() {
> - =A0 =A0 =A0 sed -i -e '/CONFIG_STATIC/d' .config
> - =A0 =A0 =A0 echo "CONFIG_STATIC=3Dy" >>.config
> -}
> -
> diff --git a/recipes/busybox/busybox-static_1.17.4.bb b/recipes/busybox/b=
usybox-static_1.17.4.bb
> new file mode 100644
> index 0000000..325752a
> --- /dev/null
> +++ b/recipes/busybox/busybox-static_1.17.4.bb
> @@ -0,0 +1,11 @@
> +require busybox_${PV}.bb
> +PR =3D "${INC_PR}.0"
> +
> +FILESPATHPKG =3D. "busybox-${PV}:"
> +S =3D "${WORKDIR}/busybox-${PV}"
> +
> +do_configure_append() {
> + =A0 =A0 =A0 sed -i -e '/CONFIG_STATIC/d' .config
> + =A0 =A0 =A0 echo "CONFIG_STATIC=3Dy" >>.config
> +}
> +
> --
> 1.6.3.3
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


