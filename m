Return-Path: <schnitzeltony@gmail.com>
Received: from mail-oi0-f51.google.com (mail-oi0-f51.google.com
	[209.85.218.51])
	by mail.openembedded.org (Postfix) with ESMTP id 2FC8978BFD
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Aug 2018 10:00:30 +0000 (UTC)
Received: by mail-oi0-f51.google.com with SMTP id k12-v6so2704048oiw.8
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Aug 2018 03:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=qAdCdvtHtZuBs13xnJsZMWqmqyM141vXk5cKKiJb57Y=;
	b=YZDeT6iryPSKFEDai8WPjWO5qxswecW57tC5Hrfh9gx3yCZo0i6gXi2UaUxh4U9qG9
	6EyV4HqmbyGb3YirxvNQpqsiYfv8sMBZDk8OHU65cVvWS7YWtxNR3zAeCMqJAJv6RAQ6
	nkMKqmQWQw3YC5Qpoq3okWTeju7S0ctRcR90gjMAYuGvY1XH9aRPFL0jtZeZIsIRXRJw
	iZabuN26Ko5fR4YWXLoRKkc44T50cjb1V60wWk9p3Uw3eGnEse5phDYokroIL44+r1NR
	dBma20UP2AsJvG227B4Cu0iSfcyIkqQYZ7Ho1hEsXSZYlCKivOo3ey992EId78y5FTOH
	9AAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=qAdCdvtHtZuBs13xnJsZMWqmqyM141vXk5cKKiJb57Y=;
	b=XOz5PIeZ6XAEQ+CD4UAqjtCpE9ow1AbMt1m2IvHDJWUOX+OkH30UYFD1YZbmijNqlQ
	Ly6m3dV8QPEkYcuu1REfvQThS8u4oLxNdYoxtDIEeytmAUGXa1KSUxF+P8fbNzEM7Bxo
	Wl3NQikb+FQ0EhympajHIFk9rZl++tysYI0odQhBvWgrUXLXTWUqslJLWoPd39Gl5XoA
	kepSLP2nzYNj6DRbcuI15eN6LggwfcIOatwYLRrC208VkDxpd+T0UT+Rt8zsJ255Mbkf
	DO6fxVdQsmKG1yfFwGh2EkIub6rGbe6Hy2aM3sfcm7YJTyQrlE7S2eJdqNFG3XVCzJHw
	tB3Q==
X-Gm-Message-State: AOUpUlH4KbSTTiqMLITAXi7G7E0kP/NW5rEmBydyehgr3Qu0PDkamo3c
	4h5/sKLN+31znJMWa3pQMl7+UE7HvM/OAffLUR4=
X-Google-Smtp-Source: AA+uWPyrYP24/7q1HD/Z+ecX80/avBtBlkrLTqCm4vl9UqMI09grssJQ3xcLDWX+8RJ/zSK7xGskBPK0uLU7oN+rqJM=
X-Received: by 2002:aca:bf07:: with SMTP id
	p7-v6mr2343818oif.285.1533722431108; 
	Wed, 08 Aug 2018 03:00:31 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ac9:590c:0:0:0:0:0 with HTTP;
	Wed, 8 Aug 2018 03:00:30 -0700 (PDT)
In-Reply-To: <20180806085408.44739-1-kai.kang@windriver.com>
References: <20180806085408.44739-1-kai.kang@windriver.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Date: Wed, 8 Aug 2018 12:00:30 +0200
Message-ID: <CALbNGRTVzUQLu0ZkB0-006SHAhpYQt-vWZsxssJEkJc_8VJRzA@mail.gmail.com>
To: Kai Kang <kai.kang@windriver.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-xfce][PATCH 00/10] Upgrade packages in layer meta-xfce
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
X-List-Received-Date: Wed, 08 Aug 2018 10:00:30 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 6, 2018 at 10:53 AM, Kai Kang <kai.kang@windriver.com> wrote:
>
>
> Kai Kang (10):
>   libwnck3: 3.20.1 -> 3.24.1
>   xfce4-mount-plugin: 1.1.2 -> 1.1.3
>   xfce4-hotcorner-plugin: fix library install path
>   xfce4-embed-plugin: 1.0.0 -> 1.6.0
>   xfce4-eyes-plugin: 4.4.5 -> 4.5.0
>   xfce4-genmon-plugin: 4.0.0 -> 4.0.1
>   exo: 0.12.1 -> 0.12.2
>   xfce4-session: 4.12.1 -> 4.13.0
>   xfconf: 4.13.4 -> 4.13.5
>   xfwm4: 4.12.4 -> 4.12.5
>
>  .../{libwnck3_3.20.1.bb =3D> libwnck3_3.24.1.bb}     |  7 ++--
>  ...plugin_1.0.0.bb =3D> xfce4-embed-plugin_1.6.0.bb} |  6 ++--
>  ...-plugin_4.4.5.bb =3D> xfce4-eyes-plugin_4.5.0.bb} |  4 +--
>  ...lugin_4.0.0.bb =3D> xfce4-genmon-plugin_4.0.1.bb} |  4 +--
>  ...1-CMakeLists.txt-fix-library-install-path.patch | 39 ++++++++++++++++=
++++++
>  .../hotcorner/xfce4-hotcorner-plugin_0.0.2.bb      |  5 ++-
>  ...plugin_1.1.2.bb =3D> xfce4-mount-plugin_1.1.3.bb} |  4 +--
>  .../exo/{exo_0.12.1.bb =3D> exo_0.12.2.bb}           |  4 +--
>  ...4-session_4.12.1.bb =3D> xfce4-session_4.13.0.bb} |  6 ++--
>  .../xfconf/{xfconf_4.13.4.bb =3D> xfconf_4.13.5.bb}  |  4 +--
>  .../xfwm4/{xfwm4_4.12.4.bb =3D> xfwm4_4.12.5.bb}     |  6 ++--
>  11 files changed, 66 insertions(+), 23 deletions(-)
>  rename meta-gnome/recipes-gnome/libwnck/{libwnck3_3.20.1.bb =3D> libwnck=
3_3.24.1.bb} (70%)
>  rename meta-xfce/recipes-panel-plugins/embed/{xfce4-embed-plugin_1.0.0.b=
b =3D> xfce4-embed-plugin_1.6.0.bb} (57%)
>  rename meta-xfce/recipes-panel-plugins/eyes/{xfce4-eyes-plugin_4.4.5.bb =
=3D> xfce4-eyes-plugin_4.5.0.bb} (68%)
>  rename meta-xfce/recipes-panel-plugins/genmon/{xfce4-genmon-plugin_4.0.0=
.bb =3D> xfce4-genmon-plugin_4.0.1.bb} (71%)
>  create mode 100644 meta-xfce/recipes-panel-plugins/hotcorner/xfce4-hotco=
rner-plugin/0001-CMakeLists.txt-fix-library-install-path.patch
>  rename meta-xfce/recipes-panel-plugins/mount/{xfce4-mount-plugin_1.1.2.b=
b =3D> xfce4-mount-plugin_1.1.3.bb} (70%)
>  rename meta-xfce/recipes-xfce/exo/{exo_0.12.1.bb =3D> exo_0.12.2.bb} (87=
%)
>  rename meta-xfce/recipes-xfce/xfce4-session/{xfce4-session_4.12.1.bb =3D=
> xfce4-session_4.13.0.bb} (83%)
>  rename meta-xfce/recipes-xfce/xfconf/{xfconf_4.13.4.bb =3D> xfconf_4.13.=
5.bb} (75%)
>  rename meta-xfce/recipes-xfce/xfwm4/{xfwm4_4.12.4.bb =3D> xfwm4_4.12.5.b=
b} (73%)
>
> --
> 2.11.0
>
Acked-By: Andreas M=C3=BCller <schnitzeltony@gmaill.com>

