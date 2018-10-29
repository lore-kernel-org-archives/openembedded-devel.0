Return-Path: <brendank310@gmail.com>
Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com
	[209.85.128.66])
	by mail.openembedded.org (Postfix) with ESMTP id D495079C5E
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 18:27:14 +0000 (UTC)
Received: by mail-wm1-f66.google.com with SMTP id 143-v6so9230153wmf.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Oct 2018 11:27:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=vxGCSajevO/AIkXvRd/2Us7dqR9VNNFJiWhfwom7N7E=;
	b=EGbmIslwDzS85ymEhuyaELKNNYAN9TdL+LnmZOWu8wxrXqv9mV81nL3RlwgpPSO46i
	ScDm+URx5GKr9RUKkki8ho2hwXZFtzTGqEldsWsJ6xra9kqF+gyinfR8RpPlg4neix5a
	dJf98qOeqO9ASITInD0JcQ8WjjqxIUnj34TEugC6YroEfHwMnryOGyA8Kn15djYYQBNX
	Jf7bCxK/0TPbX9dw6SVIkRdOLcmYuANIhSmxynd+TPD9swva+y4y1Q6VubWj0D50d0k6
	NRmEQVhrkCGGiSsWABdKm/41M8dzJ8GOI7uWjFsR2i3alS2q4rCDj0f50msrKnsYc8cl
	TWzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=vxGCSajevO/AIkXvRd/2Us7dqR9VNNFJiWhfwom7N7E=;
	b=fywrIgw9oVG3PpXuG3GE3dc5bdvXi+OCScayexalIk/8thxk4XfR21DRLs5zzXpTIq
	IDI6Y6eymXWGF8iWkViLmutUBGOFYIs8QZPEiu4xgebhhVX0EoQpEdY6b2yylF5DxznL
	Hod+iuJ23P/YYji7/d7lKqP9gSON+p+VlBNGeTqHbNOfXsBBpdaza7bnomn+rGkbenlS
	QhK9KUzYcfLMkF/Tw3ZVnt7bNseVnzfAz+FXuTJ1B3NY8uAhoa+vjUj4XH3lyx4tkYQI
	M90RfPCzjxz3UbaJpE/jwkKwTT6voOLcn3H8/h0dsXHq9Ob3H6XpgIaf+BG+0CgwvR3b
	cOBQ==
X-Gm-Message-State: AGRZ1gIG3MAISh0nBXPAzUuPOQfFsFEf3MF3nub1//BjDE9MWv5NBHA1
	AxfWryX9PEj7/bgJHfmGpAR/VgZCJh8ryG4k25c=
X-Google-Smtp-Source: AJdET5fW0uSW94QGh87Xy8t+ibm2TYHTRuMBLVPChy3tCO7o+lm50LRIIS8rJCHs4L4Z0B8KM8JyMkpXQBPpTFYj1wE=
X-Received: by 2002:a1c:8fcc:: with SMTP id
	r195-v6mr15311709wmd.44.1540837635397; 
	Mon, 29 Oct 2018 11:27:15 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1540830650.git.brendank310@gmail.com>
	<4a7b04c4d262dafef02e120102f054f64bb95c69.1540830650.git.brendank310@gmail.com>
	<CAJTo0LaqiCwZXZjKwGfX8qwHLrX20_hOaOzwBs7q5XsO+fj+xA@mail.gmail.com>
In-Reply-To: <CAJTo0LaqiCwZXZjKwGfX8qwHLrX20_hOaOzwBs7q5XsO+fj+xA@mail.gmail.com>
From: Brendan Kerrigan <brendank310@gmail.com>
Date: Mon, 29 Oct 2018 14:27:03 -0400
Message-ID: <CAKPa3c0GduyOjSnd1UQMFjNmm6B3VXHB_C-6-BUAhUuNfXG6sA@mail.gmail.com>
To: ross.burton@intel.com
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>,
	openembedded-devel@lists.openembedded.org
Subject: Re: [RFC meta-gnome][PATCH 10/16] dconf-native: add dconf-native recipe
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
X-List-Received-Date: Mon, 29 Oct 2018 18:27:15 -0000
Content-Type: text/plain; charset="UTF-8"

I had initially tried to get the native recipe integrated into it, by
inheriting the native class but was unable to get that to work. Using the
above, I get the following:

ERROR: Required build target 'gdm' has no buildable providers.
Missing or unbuildable dependency chain was: ['gdm', 'dconf-native',
'glib-2.0-utils-native']

Any thoughts on how to resolve this? Should I also be providing a
glib-2.0-utils-native package?

Thanks,
Brendan

On Mon, Oct 29, 2018 at 2:06 PM Burton, Ross <ross.burton@intel.com> wrote:

> There's already a dconf in meta-gnome, so just add
> BBCLASSEXTEND="native nativesdk".
>
> Ross
> On Mon, 29 Oct 2018 at 16:43, brendank310 <brendank310@gmail.com> wrote:
> >
> > From: Brendan Kerrigan <kerriganb@ainfosec.com>
> >
> > gdm recipe requires a native dconf tool.
> >
> > Signed-off-by: Brendan Kerrigan <kerriganb@ainfosec.com>
> > ---
> >  .../dconf/dconf-native_0.28.0.bb              | 19 +++++++++++++++++++
> >  1 file changed, 19 insertions(+)
> >  create mode 100644 meta-gnome/recipes-gnome/dconf/
> dconf-native_0.28.0.bb
> >
> > diff --git a/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> > new file mode 100644
> > index 000000000..ee78fbb66
> > --- /dev/null
> > +++ b/meta-gnome/recipes-gnome/dconf/dconf-native_0.28.0.bb
> > @@ -0,0 +1,19 @@
> > +SUMMARY = "configuation database system"
> > +LICENSE = "LGPLv2.1"
> > +LIC_FILES_CHKSUM = "file://COPYING;md5=2d5025d4aa3495befef8f17206a5b0a1"
> > +SECTION = "x11/gnome"
> > +
> > +SRC_URI[archive.md5sum] = "81faa8e68e5ea71ff0ee75050fc0759c"
> > +SRC_URI[archive.sha256sum] =
> "61d3b3865ef58b729c3b39aa0979f886c014aa8362f93dcfc74bf5648ed9c742"
> > +
> > +DEPENDS = "dbus glib-2.0 intltool-native"
> > +
> > +GNOMEBASEBUILDCLASS = "meson"
> > +
> > +inherit gnomebase gsettings bash-completion vala native
> > +
> > +FILES_${PN} += " \
> > +    ${datadir}/dbus-1 \
> > +    ${libdir}/gio/modules/*.so \
> > +    ${bindir}/dconf \
> > +"
> > --
> > 2.17.1
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

