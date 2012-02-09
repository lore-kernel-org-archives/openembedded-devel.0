Received: from mail-lpp01m020-f175.google.com ([209.85.217.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1RvdMU-00086l-1B
	for openembedded-devel@lists.openembedded.org;
	Fri, 10 Feb 2012 00:25:10 +0100
Received: by lbol12 with SMTP id l12so1147508lbo.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 09 Feb 2012 15:17:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0vXjAlKFj6BNKv0gD34OGaiOI4EK6ZfxDfiXbsapLD8=;
	b=tP3a2QJj9y5DPIhe+D3tNFva5RFyDRS631AMc3pfzFX6/kOXOm6ZfdJfGa6iRhdm77
	rJ4A5qx3u1HlgF1EAYRZp0RLiFo2iGZFl+qYj9HKWlrHfC6fYHIQFJmMHKFFLg+O5E5b
	vP3WrYGDvEt+ZyrqNqhJLSIkc3M97/B4Wxtd8=
MIME-Version: 1.0
Received: by 10.152.130.98 with SMTP id od2mr2659884lab.3.1328829424902; Thu,
	09 Feb 2012 15:17:04 -0800 (PST)
Received: by 10.112.102.165 with HTTP; Thu, 9 Feb 2012 15:17:04 -0800 (PST)
In-Reply-To: <1328556539-8036-1-git-send-email-tworaz666@gmail.com>
References: <1328380249-11697-1-git-send-email-tworaz666@gmail.com>
	<1328556539-8036-1-git-send-email-tworaz666@gmail.com>
Date: Fri, 10 Feb 2012 00:17:04 +0100
Message-ID: <CALbNGRRXRVVjAN-soiseru_RBJkM0KQMBWnAzfy4Ah4AEDaDZA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][PATCH 3/3 v2] xfce4-panel: Remove static version of panel plugins.
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
X-List-Received-Date: Thu, 09 Feb 2012 23:25:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 6, 2012 at 8:28 PM, Peter Tworek <tworaz666@gmail.com> wrote:
> They have no actual use and trigger QA warnings.
>
> Signed-off-by: Peter Tworek <tworaz666@gmail.com>
> ---
> =A0.../recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb =A0| =A0 =A07 ++++--=
-
> =A01 files changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb b/me=
ta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> index 0cd8eba..6bbbc05 100644
> --- a/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-panel/xfce4-panel_4.8.6.bb
> @@ -19,6 +19,10 @@ python populate_packages_prepend() {
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 =A0 =A0 =A0 '${bindir}/*%s*'])
> =A0}
>
> +do_install_append () {
> + =A0 =A0find "${D}/${libdir}/xfce4/panel/plugins" -name '*.a' -exec rm -=
f {} +
> +}
> +
> =A0PACKAGES_DYNAMIC =3D "${PN}-plugin-*"
>
> =A0FILES_${PN} +=3D "${libdir}/xfce4/panel/migrate \
> @@ -27,8 +31,5 @@ FILES_${PN} +=3D "${libdir}/xfce4/panel/migrate \
> =A0FILES_${PN}-dbg +=3D "${libdir}/xfce4/panel/plugins/.debug \
> =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
>
> -FILES_${PN}-dev +=3D "${libdir}/xfce4/panel/plugins/*.*a \
> - =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 "
> -
> =A0SRC_URI[md5sum] =3D "9d7bf0503d5867c4044cef04bb5845b1"
> =A0SRC_URI[sha256sum] =3D "66f1266a1242ee5ecada995a4a584dd9802aa24456759b=
40b0c29227c39bed03"
> --
> 1.7.3.4
>
Sorry for late answer but you forgot PR-bump in V2.

Andreas


