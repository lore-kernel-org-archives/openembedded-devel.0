Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ig0-f171.google.com (mail-ig0-f171.google.com
	[209.85.213.171])
	by mail.openembedded.org (Postfix) with ESMTP id 96C567404E
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 16:11:27 +0000 (UTC)
Received: by igbkq10 with SMTP id kq10so38238894igb.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Sep 2015 09:11:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=0uqOEfUjXQbczhKUzuf1eMOfmGXUm5eZRDtdxoPfcXU=;
	b=jeCkXd7S6AZVYN/882p8NYTRS8lmooegG/aKRxMhw5GBMoWiSDq5GW8eFSICVe5rtm
	qJaMwVoVVnGYm8pMoFodk1fTniNBY73EtAWYqnr/4Kc/mCK17GuFmO40rNpOeYFALZ8E
	v3Lopwb9MfY3A92PHl7z1YKyhy4DuKmNPnJF102dFRncUg+C1V2puiwAZuRBKGflt8To
	TrWQl3A6BV1pnfqyRGAda6/tdqjMUFhZlz1mYwe5USLcbZ0YmO0V5jLAfw9pmaaj+qnh
	krq9AA5Fz4K45MQb1e1optplV+BOIWo2Wr+ArNHTpaD42OmRfJ8EWEybsONhkcWb+01u
	OnAw==
MIME-Version: 1.0
X-Received: by 10.50.111.113 with SMTP id ih17mr4656406igb.64.1442419887317;
	Wed, 16 Sep 2015 09:11:27 -0700 (PDT)
Received: by 10.36.98.5 with HTTP; Wed, 16 Sep 2015 09:11:27 -0700 (PDT)
In-Reply-To: <1442414158-15694-6-git-send-email-jussi.kukkonen@intel.com>
References: <1442414158-15694-1-git-send-email-jussi.kukkonen@intel.com>
	<1442414158-15694-6-git-send-email-jussi.kukkonen@intel.com>
Date: Wed, 16 Sep 2015 18:11:27 +0200
Message-ID: <CALbNGRQ2MfqSAjC7usaQ+c6HAPJi0q-48j0eWc+=gtfxADHAsQ@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 5/5] xfce4-settings: recommend adwaita, not gnome-icon-theme
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
X-List-Received-Date: Wed, 16 Sep 2015 16:11:29 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 16, 2015 at 4:35 PM, Jussi Kukkonen
<jussi.kukkonen@intel.com> wrote:
> RRECOMMEND adwaita-icon-theme instead of gnome-icon-theme (as latter
> is removed from oe-core).
>
> Signed-off-by: Jussi Kukkonen <jussi.kukkonen@intel.com>
> ---
>  meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb =
b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> index 25fa292..1a7fcb5 100644
> --- a/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> +++ b/meta-xfce/recipes-xfce/xfce4-settings/xfce4-settings_git.bb
> @@ -30,6 +30,6 @@ FILES_${PN} +=3D " \
>      ${datadir}/xfce4 \
>  "
>
> -RRECOMMENDS_${PN} +=3D "gnome-icon-theme"
> +RRECOMMENDS_${PN} +=3D "adwaita-icon-theme"
>  RRECOMMENDS_${PN} +=3D "${@base_contains('DISTRO_FEATURES','alsa','libca=
nberra-alsa','',d)}"
>  RRECOMMENDS_${PN} +=3D "${@base_contains('DISTRO_FEATURES','pulseaudio',=
'libcanberra-pulse','',d)}"
> --
> 2.1.4
>
Just a note on this one for early testers: It will cause missing icons
because xfce-settings expects gnome icons by default. So for early
testers be prepared.

I will send a follow up on this one because I am the one to blame: My
last commit on xfce4-settings hid the patch setting gnome icons as
default.

So:

Acked-By: Andreas M=C3=BCller <schnitzeltony@googlemail.com>

