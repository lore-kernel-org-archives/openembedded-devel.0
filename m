Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1SyKpH-0006xF-Dj
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Aug 2012 12:46:19 +0200
Received: by yenm12 with SMTP id m12so528796yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2012 03:34:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=vv6KcwXc2ZQHvE+Q5LcQNUklOloyA11kFXhP3NSUpaM=;
	b=hUhsfW2KAM+9R5s80X7FOpof0anErA7N8I2NdGDLjV8wQkOXXkL3og2sozZAkJcPmI
	Hz73sROM5fCVqb9JGEsRfdJQYG/bvm4hjlqJ22EbcVfWZnkpYA7IYNXQNIyXYQjrKe/J
	j5VPTLSnjIa92HiX5Di8wt5RnKKWB6to8B2rYoJ7n8qhiZ+9+KNBAhV9jSK+MCynGCP/
	2KFZjSVOByICMcNQoiv3eEAttmwNKCIS6LtdXsp4z8ciHIucc0R6RoHaNRaNe/Q4J5jg
	7wH+64Mw+rdDkl6p2Z/E5It62NeaSp/LfxTwOwXwUPcAiY3xcBlekDRjTG7TR+IA6FS7
	3V4Q==
MIME-Version: 1.0
Received: by 10.50.191.227 with SMTP id hb3mr4936257igc.45.1344249274275; Mon,
	06 Aug 2012 03:34:34 -0700 (PDT)
Received: by 10.64.142.201 with HTTP; Mon, 6 Aug 2012 03:34:34 -0700 (PDT)
In-Reply-To: <1343997020-11559-1-git-send-email-schnitzeltony@googlemail.com>
References: <1343997020-11559-1-git-send-email-schnitzeltony@googlemail.com>
Date: Mon, 6 Aug 2012 12:34:34 +0200
Message-ID: <CALbNGRQZaD7JURQi9uTm9KNFv92K_Ap54pPr-iOw6a7b+6WpYA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-systemd] gdm: replace 'WantedBy=graphical.target' by 'Alias=display-manager.service'
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
X-List-Received-Date: Mon, 06 Aug 2012 10:46:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 3, 2012 at 2:30 PM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Found at lxdm. Error message was there
> | systemd[1]: Cannot add dependency job for unit display-manager.service =
...
>
> Inspired by [1]
>
> [1] https://bbs.archlinux.org/viewtopic.php?pid=3D1131267
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../meta-gnome/recipes-gnome/gdm/gdm/gdm.service   |    2 +-
>  .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/=
meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
> index 72a56f9..adfc565 100644
> --- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
> +++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
> @@ -8,4 +8,4 @@ ExecStart=3D/usr/sbin/gdm -nodaemon
>  StandardOutput=3Dsyslog
>
>  [Install]
> -WantedBy=3Dgraphical.target
> +Alias=3Ddisplay-manager.service
> diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappen=
d b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> index 7308346..963e3e8 100644
> --- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> +++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in the layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
> -PRINC :=3D "${@int(PRINC) + 1}"
> +PRINC :=3D "${@int(PRINC) + 2}"
>
>  inherit systemd
>
> --
> 1.7.6.5
>
Please ignore this patch. It needs some rework on systemctl-native.

Andreas


