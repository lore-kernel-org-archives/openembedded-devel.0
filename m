Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P3XBH-00059S-JK
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Oct 2010 18:49:30 +0200
Received: by iwn38 with SMTP id 38so485598iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Oct 2010 09:49:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=I+ZO3/WWHFBtqWhhEPEQ6vSC2x0ZRvLziSlSGhCxde0=;
	b=l5W6Yn3QDukocXRX6JMuU2vy/oDRHEx7/eCT/f0++dnxnRXnk3H3n0bhbs+tEnvC/3
	OizM/pd0zLZihvNcNSkvv7AKJX7UoMdvjCog37VOhG4dRxEZKUA01Xa//N1ZC1Ma1zko
	6SLVVg2JTPImzXx/n7cW1l1nOAejVsQUDbbgQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=NcXFWOarN1b0IImv9dWHY/PV4kkOf0W0TRuQQx7wc9kVb86Ejd2x01rLj7elR4Cd+0
	wSYBP6wYGUiSoeUnF4iDDjceTBkqox7Sct7yiW7nqXvApZgeIBpkpfOk43NctAq61uEv
	AL+hYUXlgJT9+yKNcv46KrthcDPLmDk7y9pP8=
MIME-Version: 1.0
Received: by 10.231.191.147 with SMTP id dm19mr14280628ibb.6.1286383681212;
	Wed, 06 Oct 2010 09:48:01 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Wed, 6 Oct 2010 09:48:00 -0700 (PDT)
In-Reply-To: <1286377178.3792.18.camel@mattotaupa>
References: <1286374262.3792.8.camel@mattotaupa>
	<1286377178.3792.18.camel@mattotaupa>
Date: Wed, 6 Oct 2010 18:48:00 +0200
Message-ID: <AANLkTikw-iPUnyWwT0ymVHM4cfP7+mzUy-bF1zCG0CDx@mail.gmail.com>
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
Subject: Re: [PATCH v2] msmcommd_git: Add `libfsotransport` to `DEPENDS`.
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
X-List-Received-Date: Wed, 06 Oct 2010 16:49:30 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Acked-by: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>

2010/10/6 Paul Menzel <paulepanter@users.sourceforge.net>:
> Date: Wed, 6 Oct 2010 13:00:42 +0200
>
> [=85]
> | checking for DEPS... configure: error: Package requirements (glib-2.0 >=
=3D 2.120
> | =A0 gio-2.0 >=3D 2.12.0
> | =A0 gobject-2.0 >=3D 2.12.0
> | =A0 gthread-2.0 >=3D 2.12.0
> | =A0 gee-1.0 >=3D 0.5
> | =A0 dbus-1 >=3D 1.2.16
> | =A0 dbus-glib-1 >=3D 0.84
> | =A0 fsotransport-2.0 >=3D 0.9
> | =A0 fso-glib-1.0 >=3D 2010.07.28.1
> | =A0 msmcomm-1.0 >=3D 0.5.0
> | =A0 msmcommd-specs-1.0 >=3D 0.1.0) were not met:
> |
> | No package 'fsotransport-2.0' found
> |
> | Consider adjusting the PKG_CONFIG_PATH environment variable if you
> | installed software in a non-standard prefix.
> |
> | Alternatively, you may set the environment variables DEPS_CFLAGS
> | and DEPS_LIBS to avoid the need to call pkg-config.
> | See the pkg-config man page for more details.
> |
> | ERROR: Function do_configure failed
> [=85]
>
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> v2: Do not bump `PR` since adding dependencies does not alter the resulti=
ng package.
> ---
> =A0recipes/freesmartphone/msmcommd_git.bb | =A0 =A01 +
> =A01 files changed, 1 insertions(+), 0 deletions(-)
>
> diff --git a/recipes/freesmartphone/msmcommd_git.bb b/recipes/freesmartph=
one/msmcommd_git.bb
> index e8f3887..abe98f8 100644
> --- a/recipes/freesmartphone/msmcommd_git.bb
> +++ b/recipes/freesmartphone/msmcommd_git.bb
> @@ -9,6 +9,7 @@ DEPENDS =3D " \
> =A0dbus \
> =A0dbus-glib \
> =A0libfso-glib \
> + libfsotransport \
> =A0libgee \
> =A0libmsmcomm \
> =A0msmcommd-specs \
> --
> 1.7.1
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


