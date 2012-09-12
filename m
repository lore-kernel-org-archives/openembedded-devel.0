Received: from mail-ie0-f175.google.com ([209.85.223.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1TBmHB-0003En-6F
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Sep 2012 14:42:41 +0200
Received: by iebc11 with SMTP id c11so2941615ieb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Sep 2012 05:30:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	bh=3iglEv/6YV9O8gk3M3m1FV/taGpD+Agt8Kf5MUXvdbM=;
	b=ribKcXY3V2Jjvmt5E8J3AN9xdWg2eX64WEUO3Hwq+igLgKy5tPovktDuvTQXr6Z0XH
	fJZr85itblze+pUKjLd/qli1sYRKTVkpTMH8rF6lKD7ZVQEbb79Fz8O+8HQCkdG10Mn1
	1bO+32B8ppGfbGh5EQ3gCv+QRaSHhg61YHB2i0637B1xmICbAI8I01yM/6OM3cKGuwUT
	OWDv9/ISiyQmeSOIUmWa2/6NsBJlE/qyjqy2xJbcd6/WJdZOq9wI6bqQpGQZDp98zjIr
	NJfQ0wBLR9vTd4VmhijdtfW9Tdz2ms/qiVUyipzM6v+44AXOXrTcdMjicRqaaQSu3KBs
	XiMQ==
MIME-Version: 1.0
Received: by 10.42.18.193 with SMTP id y1mr25072291ica.0.1347453008596; Wed,
	12 Sep 2012 05:30:08 -0700 (PDT)
Received: by 10.64.18.13 with HTTP; Wed, 12 Sep 2012 05:30:08 -0700 (PDT)
In-Reply-To: <1346655278-3462-1-git-send-email-schnitzeltony@googlemail.com>
References: <1346655278-3462-1-git-send-email-schnitzeltony@googlemail.com>
Date: Wed, 12 Sep 2012 14:30:08 +0200
Message-ID: <CALbNGRRA+QTvum3np-_zWMjqspt0znnppLQ8ENgnJASKvOQkMA@mail.gmail.com>
From: =?ISO-8859-1?Q?Andreas_M=FCller?= <schnitzeltony@googlemail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH 1/3] gdm: do not rely on dev-tty7.device
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
X-List-Received-Date: Wed, 12 Sep 2012 12:42:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 3, 2012 at 8:54 AM, Andreas M=FCller
<schnitzeltony@googlemail.com> wrote:
> Error message was:
>
> [ TIME ] Timed out waiting for device dev-tty7.device.
> [DEPEND] Dependency failed for Gnome Display Manager.
>
> run tested on overo/xfce
>
> Signed-off-by: Andreas M=FCller <schnitzeltony@googlemail.com>
> ---
>  .../meta-gnome/recipes-gnome/gdm/gdm/gdm.service   |    3 +--
>  .../recipes-gnome/gdm/gdm_2.32.2.bbappend          |    2 +-
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service b/=
meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
> index adfc565..0f94e0c 100644
> --- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
> +++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm/gdm.service
> @@ -1,7 +1,6 @@
>  [Unit]
>  Description=3DGnome Display Manager
> -Requires=3Ddev-tty7.device
> -After=3Ddev-tty7.device systemd-user-sessions.service
> +After=3Dsystemd-user-sessions.service
>
>  [Service]
>  ExecStart=3D/usr/sbin/gdm -nodaemon
> diff --git a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappen=
d b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> index 963e3e8..496a276 100644
> --- a/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> +++ b/meta-systemd/meta-gnome/recipes-gnome/gdm/gdm_2.32.2.bbappend
> @@ -1,7 +1,7 @@
>  # look for files in the layer first
>  FILESEXTRAPATHS_prepend :=3D "${THISDIR}/${PN}:"
>
> -PRINC :=3D "${@int(PRINC) + 2}"
> +PRINC :=3D "${@int(PRINC) + 3}"
>
>  inherit systemd
>
> --
> 1.7.4.4
Ping


