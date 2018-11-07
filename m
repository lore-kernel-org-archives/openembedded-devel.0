Return-Path: <raj.khem@gmail.com>
Received: from mail-qk1-f195.google.com (mail-qk1-f195.google.com
	[209.85.222.195])
	by mail.openembedded.org (Postfix) with ESMTP id 47E7C79D01
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  7 Nov 2018 20:26:56 +0000 (UTC)
Received: by mail-qk1-f195.google.com with SMTP id o125so22780143qkf.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Nov 2018 12:26:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=Yzy+8rZbvpvE1QDr3YQjBEknr1OINTPwhLklvIQeNvc=;
	b=rBDFBjm9Xr/DgSHLJUjmuzwLBcNv/hhgfXFJ2nlivcyfe7VFw7duSQZDZ3pvBjj5SY
	o/trOuE8xI6f4Mlxad+CiG58F3nW283zKvNk4IeGg9z7Y8YbYovjr4pOUgbbh83Du+TI
	ai1aKhuw4GoEj4ix3GXNo84Y1rWgWu4jZhaN1QnsWiJ53axMpS63UtnFUE34Yxjqh9VS
	QVO86Z/tZnPLEu5AX2YrilNt5vA+TD8X63/v3Ehyf4b+U+BWsO70PaW4+Vmf37us/RLc
	9P0pXF/tRIhdVoDVY/dLZbsyPa8JGialmqDZDkoMga1JLlW/QAL6W+GXmwpKs5J1V7wg
	FSkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=Yzy+8rZbvpvE1QDr3YQjBEknr1OINTPwhLklvIQeNvc=;
	b=XfOX9pobf4rrCFXS3ScY0z2Zw4zO7ls4Nr8nUh20uA1RQ29BP2Oml1jqdfGcQTjLTj
	Makl9R8dfmxarNGpoch7N57WGz7Gm5JWUZh77k7oMTz4ItX6uH5dD/5p41c4Ow10ivHi
	4stfGqx9A+/UgSzOHgGfVkgpptxr0xSf98X0Bl18iXMB8/4Na4utSsyI+wJFvnlO54/b
	K/3xBPVBT00OIEmgxpmzM+aa04gBrp4xebQAr+WDWyj5fCkqEEEbV2jKEZ5hOGp5xCy+
	9uAQmK3QqKxz/ePhgRV7Fco+H7yWbqdYgplzW10m6RQ+/vFN9HOzlC9pSRVTdLYmMqJH
	MFAA==
X-Gm-Message-State: AGRZ1gKFspeBn2nGx4LX5Z7mOvUFv8mhjadtShjjdTIVqZ4ByI0Mq82f
	wD2BLpr4cAjIropuCIFZCHGjUfrXoFTTtlsvg2A=
X-Google-Smtp-Source: AJdET5dupkOPqooJnnxL8tVfXUqVYJss81F9dhyHxbpmcGSfahkCnxyeMumXlkDW4rkZe8fyVeoQm7uOpKxLGue3Yd8=
X-Received: by 2002:a37:4c41:: with SMTP id z62mr1655503qka.206.1541622417038; 
	Wed, 07 Nov 2018 12:26:57 -0800 (PST)
MIME-Version: 1.0
References: <1541617902-21755-1-git-send-email-akuster808@gmail.com>
	<CALbNGRR1gd6fr8iivhxqfBqPnvL+yiAtKFHRvKD-v-G4GyV8eQ@mail.gmail.com>
	<fb6b0063-4d24-c1b1-eff2-c0e5849bea16@gmail.com>
	<CALbNGRRcvvXc5zMABsmkXH25cJNyuu5+fgRoXGKNEuin+aE5hw@mail.gmail.com>
In-Reply-To: <CALbNGRRcvvXc5zMABsmkXH25cJNyuu5+fgRoXGKNEuin+aE5hw@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 7 Nov 2018 12:26:30 -0800
Message-ID: <CAMKF1srx1ng68acjaOTMqSJ8HsivGJh0s2mOthRpF6-82mjUUA@mail.gmail.com>
To: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH] blueman: fix rdepends issue
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
X-List-Received-Date: Wed, 07 Nov 2018 20:26:56 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 7, 2018 at 12:01 PM Andreas M=C3=BCller <schnitzeltony@gmail.co=
m> wrote:
>
> On Wed, Nov 7, 2018 at 8:40 PM akuster808 <akuster808@gmail.com> wrote:
> >
> >
> > On 11/7/18 11:22 AM, Andreas M=C3=BCller wrote:
> > > On Wed, Nov 7, 2018 at 8:12 PM Armin Kuster <akuster808@gmail.com> wr=
ote:
> > >> fixes
> > >> ERROR: Required build target 'blueman' has no buildable providers.
> > >> Missing or unbuildable dependency chain was: ['blueman', 'thunar']
> > >>
> > >> Signed-off-by: Armin Kuster <akuster808@gmail.com>
> > >> ---
> > >>  meta-networking/recipes-connectivity/blueman/blueman_git.bb | 5 +++=
--
> > >>  1 file changed, 3 insertions(+), 2 deletions(-)
> > >>
> > >> diff --git a/meta-networking/recipes-connectivity/blueman/blueman_gi=
t.bb b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> > >> index 8eb99ed..06a11b7 100644
> > >> --- a/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> > >> +++ b/meta-networking/recipes-connectivity/blueman/blueman_git.bb
> > >> @@ -27,9 +27,10 @@ RRECOMENDS_${PN} +=3D "adwaita-icon-theme"
> > >>  RDEPENDS_${PN} +=3D " \
> > >>      python3-dbus \
> > >>      packagegroup-tools-bluetooth \
> > >> +    ${@bb.utils.contains('DISTRO_FEATURES', 'x11', 'thunar', '', d)=
} \
> > >>  "
> > >> -
> > >> -PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-=
sendto,,thunar"
> > >> +PACKAGECONGIG ??=3D ""
> > >> +PACKAGECONFIG[thunar] =3D "--enable-thunar-sendto,--disable-thunar-=
sendto,,"
> > >>
> > >>  FILES_${PN} +=3D " \
> > >>      ${datadir}/dbus-1 \
> > >> --
> > >> 2.7.4
> > >>
> > > This is not right: How shall this happen if meta-xfce is not in your
> > > layers - I suggest you run a cleansstate after changing layer
> > > configuration
> >
> >
> > I am running the yocto-check-layer.
> > Should this recipe really be in
> > meta-xfce? .. I am out of options on how to get this to pass. Maybe no
> > one cares if it ever does???
> Put it to meta-xfce to make script happy - what a waste of time...
>

I think we can put a bbappend in meta-xfce which enables this
packageconfig and as such
this patch is fine.

> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

