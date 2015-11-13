Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id DDE55772E3
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 10:19:51 +0000 (UTC)
Received: by wmww144 with SMTP id w144so24001339wmw.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Nov 2015 02:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Z4bh2m/TeCFwGo+sHUrlVnw0huvsxC0a1cYYfguonF0=;
	b=c2rEwHvKh8zqgvdEq5XtHLV+eRoRBU+1W/DZeM1wIrSP70/qLB/VqOTHOAy4UCpZx+
	w/mKdUY081G8O6WQhugh1EqrS9WolmcuFxeRUAHdzj60OOgSt+JVaty10iX1Q2osq2xW
	czd6TADdGckqA0Br6cH19jZNZXRlRYwPkVbD2AJUyZM9X95gLiO3vUDmMUQiXQDvVt4P
	upxRqb5BdTWL6777QwtxODM1J08Gt6k+CJl20v+J5Es1r6EgFMX+2b7MaOiLh455ahvH
	G+LqCPfnGo+uNVrWuxNMmomeZeEdckX9flzybEfBorceMqni05OlD0sD22CVxOIJGPny
	tBZg==
MIME-Version: 1.0
X-Received: by 10.28.183.215 with SMTP id h206mr3064456wmf.0.1447409991378;
	Fri, 13 Nov 2015 02:19:51 -0800 (PST)
Received: by 10.194.154.232 with HTTP; Fri, 13 Nov 2015 02:19:51 -0800 (PST)
In-Reply-To: <CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>
References: <1447409052-30874-1-git-send-email-hongxu.jia@windriver.com>
	<CALbNGRQuQcD54T7raCZdhM3-fTpiiH2Xa2C=0svMq8w+HMrnkg@mail.gmail.com>
Date: Fri, 13 Nov 2015 11:19:51 +0100
Message-ID: <CA+chaQefhmSve7vJPMAFtzmay=+qgcrW-UJ-M3FY4Yoa8ZiAuQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-xfce][PATCH] meta-xfce/layer: explicitly set networkmanager to NETWORK_MANAGER
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
X-List-Received-Date: Fri, 13 Nov 2015 10:19:52 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Why not use VIRTUAL-RUNTIME variable like in other places? And if it's
needed by xfce4-power-manager, then why don't you add it to RDEPENDS there?

On Fri, Nov 13, 2015 at 11:13 AM, Andreas M=C3=BCller <
schnitzeltony@googlemail.com> wrote:

> On Fri, Nov 13, 2015 at 11:04 AM, Hongxu Jia <hongxu.jia@windriver.com>
> wrote:
> > The NETWORK_MANAGER is connman-gnome in oe-core by default,
> > which conflicts with networkmanager. And networkmanager is
> > required by xfce4-power-manager in meta-xfce. So we explicitly
> > set networkmanager to NETWORK_MANAGER for meta-xfce.
> >
> > Signed-off-by: Hongxu Jia <hongxu.jia@windriver.com>
> > ---
> >  meta-xfce/conf/layer.conf | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/meta-xfce/conf/layer.conf b/meta-xfce/conf/layer.conf
> > index 55bcef6..e38d85d 100644
> > --- a/meta-xfce/conf/layer.conf
> > +++ b/meta-xfce/conf/layer.conf
> > @@ -17,3 +17,6 @@ LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "gnome-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "openembedded-layer"
> >  LAYERDEPENDS_xfce-layer +=3D "meta-python"
> > +
> > +# It is required by xfce4-power-manager
> > +NETWORK_MANAGER =3D "networkmanager"
> > --
> I was wondering why I never needed such kind of patch and checked: In
> my layers It is only used in packagegroup-core-x11-sato.
>
> So I am fine with this patch but could you mention
> packagegroup-core-x11-sato in the commit message please.
>
> Andreas
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

