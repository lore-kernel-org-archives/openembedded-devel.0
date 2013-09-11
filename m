Return-Path: <lpapp@archlinux.us>
Received: from mail-pd0-f179.google.com (mail-pd0-f179.google.com
	[209.85.192.179])
	by mail.openembedded.org (Postfix) with ESMTP id D7D286BB02
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 11:22:20 +0000 (UTC)
Received: by mail-pd0-f179.google.com with SMTP id v10so9104455pde.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Sep 2013 04:22:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:sender:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=Dk9F1VV7bcJWqKV4nPlGuvoR+P/1j8LuTPHgi8YAz/Q=;
	b=FTPvNdYz93F7z7d8+AWACsbhHMf9GROPOGn3Jh5Wg1P9jhNrIwvjZ9D13LcQ1nHBh8
	hS8RSt6ZA4u5Rbw3f3odT5YAJmmoxvykh4qaOP4hIBqHED6OcO8pWJ5G52oVOVNyWDog
	el/MG2HRmGzxkX+omhs5QegaJrURPy0Um/e7OSTx7wWr5NmcWVNyaAmC4Y9vu5QRrvWu
	qNzAvBqCZ/mphV1ozbKhMhsK7JVIurTGkHgcOuum3xrC2QIfbzsChQ2eBxqJh92jnu20
	koR6zJh9XMD3chzyKztDVsWwHDdNUiJR5Xvs4WheHzQTnOkN8l0R/j1ccIBRBIKp7RSH
	lGAw==
X-Gm-Message-State: ALoCoQns7sp5XUI21NXwevgcIWpk52OsM1FMJCAmmQIZh3eqD3hCGxLOayKgRkpkXxfwy1wPlSav
MIME-Version: 1.0
X-Received: by 10.66.192.132 with SMTP id hg4mr3085172pac.84.1378898542476;
	Wed, 11 Sep 2013 04:22:22 -0700 (PDT)
Sender: lpapp@archlinux.us
Received: by 10.70.57.234 with HTTP; Wed, 11 Sep 2013 04:22:22 -0700 (PDT)
In-Reply-To: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
References: <1378898387-7629-1-git-send-email-erik.boto@pelagicore.com>
Date: Wed, 11 Sep 2013 12:22:22 +0100
X-Google-Sender-Auth: 7wU_Cm0D5gP02KynjLdMuaLMmgQ
Message-ID: <CAOMwXhONd6pVJ4=Nut+xF5cyBVcF9-LGfd0OzQ8NL2oJQbMsRQ@mail.gmail.com>
From: Laszlo Papp <lpapp@kde.org>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-qt5][PATCH] Added module qtquickcontrols
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 11 Sep 2013 11:22:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Were you able to run an example after adding this?


On Wed, Sep 11, 2013 at 12:19 PM, Erik Bot=F6 <erik.boto@pelagicore.com>wro=
te:

> Signed-off-by: Erik Bot=F6 <erik.boto@pelagicore.com>
> ---
>  recipes-qt/qt5/qtquickcontrols.inc      | 3 +++
>  recipes-qt/qt5/qtquickcontrols_5.1.0.bb | 5 +++++
>  2 files changed, 8 insertions(+)
>  create mode 100644 recipes-qt/qt5/qtquickcontrols.inc
>  create mode 100644 recipes-qt/qt5/qtquickcontrols_5.1.0.bb
>
> diff --git a/recipes-qt/qt5/qtquickcontrols.inc
> b/recipes-qt/qt5/qtquickcontrols.inc
> new file mode 100644
> index 0000000..63e884e
> --- /dev/null
> +++ b/recipes-qt/qt5/qtquickcontrols.inc
> @@ -0,0 +1,3 @@
> +require qt5.inc
> +
> +DEPENDS +=3D "qtdeclarative"
> diff --git a/recipes-qt/qt5/qtquickcontrols_5.1.0.bb b/recipes-qt/qt5/
> qtquickcontrols_5.1.0.bb
> new file mode 100644
> index 0000000..fc880d7
> --- /dev/null
> +++ b/recipes-qt/qt5/qtquickcontrols_5.1.0.bb
> @@ -0,0 +1,5 @@
> +require qt5-${PV}.inc
> +require ${PN}.inc
> +
> +SRC_URI[md5sum] =3D "b3825124a173a36f63c2f8380dc61e81"
> +SRC_URI[sha256sum] =3D
> "88d39421d78464c3900c37616e8369fc8d998c1b0f611980e6e082f46569646b"
> --
> 1.8.1.2
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

