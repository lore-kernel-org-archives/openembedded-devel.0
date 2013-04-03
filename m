Received: from mail-ve0-f172.google.com ([209.85.128.172])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UNPVG-00023o-NY
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Apr 2013 17:22:00 +0200
Received: by mail-ve0-f172.google.com with SMTP id oz10so1759754veb.17
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Apr 2013 08:04:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=Ev75Z82PQSBwO0VDFwsVtOHWcQdTDoHG3Vs+1HL3KBk=;
	b=JPqyES3ok/SjKBwRQn++FaN75sFcwLdxgmFNGh1CJx+bhuf8PiAS+g9U8CUNElypWG
	+27AUE0nbj7QhFAX+9CGcsOO0N1sNA2f7fqKrDGEPmwH1AvcWQgAXdp6dvTkW/tWEgPG
	BGwtk4o/rLyNRLHwCkbJHw3NjCX2g3WUzB3KZ5idxWrefOR8bRmcK+wP0SRMgUbhPaUf
	q+/vy1SEdi2LD4orEhhJbGHDdEe7TNwOCkYbCQO0tNKR0k21jjHu/OiLultyT8Ne6rzE
	PEdjxEonsT3KKYLOxZke3AVuP0n0P8PdkcZyz2mhzhJ0h7WV1pCHF9KFu/nOEJ4wmykn
	mASw==
MIME-Version: 1.0
X-Received: by 10.220.151.203 with SMTP id d11mr1551947vcw.9.1365001462922;
	Wed, 03 Apr 2013 08:04:22 -0700 (PDT)
Received: by 10.52.185.168 with HTTP; Wed, 3 Apr 2013 08:04:22 -0700 (PDT)
In-Reply-To: <1364940019-23226-4-git-send-email-schnitzeltony@googlemail.com>
References: <1364940019-23226-1-git-send-email-schnitzeltony@googlemail.com>
	<1364940019-23226-4-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 3 Apr 2013 17:04:22 +0200
Message-ID: <CALbNGRRL1cs1dBHMnhFWnpTmwFccNw53CKrHUGPx=JHAXZZPJw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce, V3 3/5] exo: split out exo-csource to exo-dev - it is not required on target
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
X-List-Received-Date: Wed, 03 Apr 2013 15:22:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 3, 2013 at 12:00 AM, Andreas M=C3=BCller
<schnitzeltony@googlemail.com> wrote:
> Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
> ---
>  meta-xfce/recipes-xfce/exo/exo_0.10.2.bb |    5 ++++-
>  1 files changed, 4 insertions(+), 1 deletions(-)
>
> diff --git a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb b/meta-xfce/recipes=
-xfce/exo/exo_0.10.2.bb
> index f16d544..63fc7ea 100644
> --- a/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> +++ b/meta-xfce/recipes-xfce/exo/exo_0.10.2.bb
> @@ -4,7 +4,7 @@ LICENSE =3D "GPLv2"
>  LIC_FILES_CHKSUM =3D "file://COPYING;md5=3Db234ee4d69f5fce4486a80fdaf4a4=
263"
>  DEPENDS =3D "gtk+ libxfce4util libxfce4ui virtual/libx11 liburi-perl-nat=
ive cairo"
>  DEPENDS_class-native =3D "glib-2.0-native xfce4-dev-tools-native"
> -PR =3D "r2"
> +PR =3D "r3"
>
>  inherit xfce pythonnative perlnative
>
> @@ -37,4 +37,7 @@ FILES_${PN} +=3D "${datadir}/xfce4/ \
>  FILES_${PN}-dbg +=3D "${libdir}/gio/modules/.debug \
>                     "
>
> +FILES_${PN}-dev +=3D "${bindir}/gio/exo-csource \
> +                   "
> +
>  BBCLASSEXTEND =3D "native"
> --
> 1.7.4.4
>
This was not properly tested - exo-csource is still installed - will
send V4. That'll remove the unused gnome-mount-wrapper too.

Andreas


