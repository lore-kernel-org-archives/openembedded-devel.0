Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com
	[209.85.222.176])
	by mail.openembedded.org (Postfix) with ESMTP id E02066B073
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 20:23:32 +0000 (UTC)
Received: by mail-qk1-f176.google.com with SMTP id a1so7294028qkc.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jan 2019 12:23:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=LhJVOIqGqkECRQRuL3x93YRIZQ6CZYnUCoQ1RmqlVJo=;
	b=dI+s5esoj762iUF7cT5Tpnbxl7HeG0l/vyaLD//txq5M0tsDJkXTAEaRH3m1lj+/BP
	5BD6YAQ2t8Nnj4eRZeo0wTI1mrqAIStncYTtfwhguYRZFi27CeOoZfArN024l1N7ZE/t
	zdcbeR51fDWos9B3EF6/dp+LfK3k0iSK+wKSlXfRO/C2ssoBqK355Ka/NFvybCl2XIvG
	FXkwUZz70dQNX/l7+PttUjzJVLnKKuAEIKNPk9jamAw+i118Vg5XyrQkRRk77NwrI3xF
	Y0xbGgVs7iSGxNapYj8aaGTNoBvMxarBFDkupOpUyHV9Yub4GiXU+BSB5AKLshCmKHMk
	YXUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=LhJVOIqGqkECRQRuL3x93YRIZQ6CZYnUCoQ1RmqlVJo=;
	b=bH7q9TFFeYAIFQQoWh8xjdYlb8lD9XUA6r8zlfGCgh6S7JzdJbQlXNyci/lgDDbfMH
	EtGR7RiuXInguMftEUlD/2M/tvVeU7kp4Vp+FNch81brY9ZyIzQlxsJNT+H+EBmPsMD6
	SxyRX8QaVHB20b5Jk7xoPSXjpspVu1fUw4SOZvNeR6O8mGzhw9i6mOBpw0hRvrdsACAf
	rHdYHulvXrvqOHQRAERCi5csGTcjD/fG4ORdd7SC2uyR0p+4ewR9DMkCeJBRdLOtvhpZ
	Fb1cOihMUYrNqPIPcBvOA71d4movSMrRrtwj1qGRGKzQ2Vq8o6s870ZU/QRLtu6zglPu
	dSeQ==
X-Gm-Message-State: AJcUukfcnW/GQY6Qng+58p8FJVqmODXzOGrcUi25aJHohFIOeoXMzHxU
	2fJJJdMQIk/AFGmJOPxrHaTVd96H8UcPTtKXuZfFQg==
X-Google-Smtp-Source: ALg8bN6PS+CbAsJF8O/m7uvNUVkmGwz5EIdU5xDGEhJrGzOdjDri4Z5NJ9nq8FDoXj02O/pAjpGfY9b+8IR/OprZ0yo=
X-Received: by 2002:ae9:dc43:: with SMTP id q64mr14095526qkf.223.1547238213506;
	Fri, 11 Jan 2019 12:23:33 -0800 (PST)
MIME-Version: 1.0
References: <20190111191454.GA7211@mrt.bozoland.org>
In-Reply-To: <20190111191454.GA7211@mrt.bozoland.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 11 Jan 2019 12:23:21 -0800
Message-ID: <CAMKF1so5Ud+XMnMyMFopQKg=DSh7iqrc+Ahu0RRNps8nrNpeZg@mail.gmail.com>
To: "Theodore A. Roth" <troth@openavr.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Matthew Stanger <matthew_stanger@trimble.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH] modemmanager: Add libxslt-native to DEPENDS
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jan 2019 20:23:33 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 11, 2019 at 11:15 AM Theodore A. Roth <troth@openavr.org> wrote=
:

> Addresses the following build error:
>
> | make[2]: Entering directory
> '/home/matt/renew_thud/build/tmp/work/armv5e-poky-linux-gnueabi/modemmana=
ger/1.8.2-r0.tr0/build/include'
> | xsltproc --xinclude --nonet
> ../../ModemManager-1.8.2/build-aux/header-generator.xsl
> ../../ModemManager-1.8.2/introspection/all.xml > ModemManager-names.h
> | /bin/bash: xsltproc: command not found
> | make[2]: *** [Makefile:651: ModemManager-names.h] Error 127
>
> Problem doesn't manifest if the host has already installed xsltproc
> outside of OE environment.


The fix is good but I wonder how it=E2=80=99s able to peek st the one insta=
lled on
host do we have it in whitelist for hosttools

>
>
> Signed-off-by: Theodore A. Roth <troth@openavr.org>
> Signed-off-by: Matthew Stanger <matthew_stanger@trimble.com>
> Signed-off-by: Theodore A. Roth <theodore_roth@trimble.com>
> ---
>  meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.8.2.bb b/meta-oe/recipes-connectivity/modemmanager/
> modemmanager_1.8.2.bb
> index f8e074a87..b374cb77a 100644
> --- a/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
> +++ b/meta-oe/recipes-connectivity/modemmanager/modemmanager_1.8.2.bb
> @@ -9,7 +9,7 @@ LIC_FILES_CHKSUM =3D " \
>
>  inherit gnomebase gettext systemd vala gobject-introspection
> bash-completion
>
> -DEPENDS =3D "glib-2.0 libgudev dbus-glib intltool-native"
> +DEPENDS =3D "glib-2.0 libgudev dbus-glib intltool-native libxslt-native"
>
>  SRC_URI =3D "
> http://www.freedesktop.org/software/ModemManager/ModemManager-${PV}.tar.x=
z
> \
>             file://0001-Do-not-set-Wno-unused-but-set-variable.patch \
> --
> 2.17.1
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

