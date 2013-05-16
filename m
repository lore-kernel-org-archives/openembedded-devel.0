Received: from mail-vc0-f177.google.com ([209.85.220.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <schnitzeltony@googlemail.com>) id 1UctE1-00017z-9c
	for openembedded-devel@lists.openembedded.org;
	Thu, 16 May 2013 10:07:46 +0200
Received: by mail-vc0-f177.google.com with SMTP id ha12so2520879vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 16 May 2013 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:x-received:in-reply-to:references:date:message-id
	:subject:from:to:cc:content-type:content-transfer-encoding;
	bh=Ed4kf0A4kPC3WgM/xjLt+QtMm6k8hIS/JFzYMj5NjAo=;
	b=zfACt5yP26tf+wuCjanktzEA+CBZWkPb30MSdXxorIGAGEDNRPHFC9P7oH+ddtf/IO
	Gx4EjXhijgBEMOzsb8MaovrYDzV+jdDufS7cJZnAlF12b7N92Ds6uNLhzh1zGtWS/BQV
	kLck3IGgKpzIOsMFtN5KukmcMGu+cuzwjpdl/glG5zKBw2eDIz+WOdotHtaOFYnRVv4E
	9jKCwsqQ2nJQNm0dFr124J7bhiNquUw8NY0MwQyUiWv2R9JSjCRr4J/1HHMapj7QhEea
	6kSwo+8oRcph55NE2YFVNiz6ViKIUIjy073nIgDOhgm4vGSrfmEKgLjlhm8M497OdWzd
	Royw==
MIME-Version: 1.0
X-Received: by 10.220.191.129 with SMTP id dm1mr13176166vcb.54.1368690571114; 
	Thu, 16 May 2013 00:49:31 -0700 (PDT)
Received: by 10.52.18.177 with HTTP; Thu, 16 May 2013 00:49:30 -0700 (PDT)
In-Reply-To: <20130503121639.5ef55ace@e6520eb>
References: <1367575432-5173-1-git-send-email-schnitzeltony@googlemail.com>
	<CALbNGRT7OG1OxNhyvkjrcKxXPysOpX3QO1tqr-oy9SvAPGNy2Q@mail.gmail.com>
	<20130503121639.5ef55ace@e6520eb>
Date: Thu, 16 May 2013 09:49:30 +0200
Message-ID: <CALbNGRTvF9CN=CrcZKp+uP64ZnPWhVzYCxOBa1cgfsqGTXLo3Q@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>
Cc: openembedded-devel@lists.openembedded.org, otavio@ossystems.com.br
Subject: Re: [PATCH] chromium: fix build with glib >= 2.35
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
X-List-Received-Date: Thu, 16 May 2013 08:07:47 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2013 at 12:16 PM, Eric B=C3=A9nard <eric@eukrea.com> wrote:
> Le Fri, 3 May 2013 12:08:10 +0200,
> Andreas M=C3=BCller <schnitzeltony@googlemail.com> a =C3=A9crit :
>
>> On Fri, May 3, 2013 at 12:03 PM, Andreas M=C3=BCller
>> <schnitzeltony@googlemail.com> wrote:
>> > Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> > ---
>> >  ...ser_main_loop.cc-fix-build-with-glib-2.35.patch |   42 +++++++++++=
+++++++++
>> >  recipes-browser/chromium/chromium_24.0.1312.52.bb  |    3 +-
>> >  2 files changed, 44 insertions(+), 1 deletions(-)
>> >  create mode 100644 recipes-browser/chromium/chromium-24.0.1312.52/000=
1-browser_main_loop.cc-fix-build-with-glib-2.35.patch
>> >
>> > diff --git a/recipes-browser/chromium/chromium-24.0.1312.52/0001-brows=
er_main_loop.cc-fix-build-with-glib-2.35.patch b/recipes-browser/chromium/c=
hromium-24.0.1312.52/0001-browser_main_loop.cc-fix-build-with-glib-2.35.pat=
ch
>> > new file mode 100644
>> > index 0000000..cdf8051
>> > --- /dev/null
>> > +++ b/recipes-browser/chromium/chromium-24.0.1312.52/0001-browser_main=
_loop.cc-fix-build-with-glib-2.35.patch
>> > @@ -0,0 +1,42 @@
>> > +From eb0c0c982322c0e366c1c854475ceda6342dd55a Mon Sep 17 00:00:00 200=
1
>> > +From: =3D?UTF-8?q?Andreas=3D20M=3DC3=3DBCller?=3D <schnitzeltony@goog=
lemail.com>
>> > +Date: Thu, 2 May 2013 15:12:24 +0200
>> > +Subject: [PATCH] browser_main_loop.cc: fix build with glib > 2.35
>> > +MIME-Version: 1.0
>> > +Content-Type: text/plain; charset=3DUTF-8
>> > +Content-Transfer-Encoding: 8bit
>> > +
>> > +Upstream-Status: Applied [1]
>> > +
>> > +[1] http://code.ohloh.net/file?fid=3DpYuYekcDZUhiAoN5uY-KdIaKFTI&cid=
=3D0W4KUpSYxGo&s=3D&browser=3DDefault#L0
>> > +
>> > +Signed-off-by: Andreas M=C3=BCller <schnitzeltony@googlemail.com>
>> > +---
>> > + content/browser/browser_main_loop.cc |    5 +++++
>> > + 1 files changed, 5 insertions(+), 0 deletions(-)
>> > +
>> > +diff --git a/content/browser/browser_main_loop.cc b/content/browser/b=
rowser_main_loop.cc
>> > +index ad4b0c6..86deea3 100644
>> > +--- a/content/browser/browser_main_loop.cc
>> > ++++ b/content/browser/browser_main_loop.cc
>> > +@@ -687,12 +687,17 @@ void BrowserMainLoop::InitializeToolkit() {
>> > +   // TODO(stevenjb): Move platform specific code into platform speci=
fic Parts
>> > +   // (Need to add InitializeToolkit stage to BrowserParts).
>> > + #if defined(OS_LINUX) || defined(OS_OPENBSD)
>> > ++  // g_type_init will be deprecated in 2.36. 2.35 is the development
>> > ++  // version for 2.36, hence do not call g_type_init starting 2.35.
>> > ++  // http://developer.gnome.org/gobject/unstable/gobject-Type-Inform=
ation.html#g-type-init
>> > ++#if !GLIB_CHECK_VERSION(2, 35, 0)
>> > +   // Glib type system initialization. Needed at least for gconf,
>> > +   // used in net/proxy/proxy_config_service_linux.cc. Most likely
>> > +   // this is superfluous as gtk_init() ought to do this. It's
>> > +   // definitely harmless, so retained as a reminder of this
>> > +   // requirement for gconf.
>> > +   g_type_init();
>> > ++#endif
>> > +
>> > + #if !defined(USE_AURA)
>> > +   gfx::GtkInitFromCommandLine(parsed_command_line_);
>> > +--
>> > +1.7.6.5
>> > +
>> > diff --git a/recipes-browser/chromium/chromium_24.0.1312.52.bb b/recip=
es-browser/chromium/chromium_24.0.1312.52.bb
>> > index 2827cc1..a9a2d28 100644
>> > --- a/recipes-browser/chromium/chromium_24.0.1312.52.bb
>> > +++ b/recipes-browser/chromium/chromium_24.0.1312.52.bb
>> > @@ -11,9 +11,10 @@ SRC_URI =3D "http://commondatastorage.googleapis.co=
m/chromium-browser-official/${P
>> >          file://ui-gl-no-narrowing.patch \
>> >          file://google-chrome \
>> >          file://google-chrome.desktop \
>> > +        file://0001-browser_main_loop.cc-fix-build-with-glib-2.35.pat=
ch \
>> >  "
>> >
>> > -PR =3D "r1"
>> > +PR =3D "r2"
>> >
>> >  # include.gypi exists only for armv6 and armv7a and there isn't somet=
hing like COMPATIBLE_ARCH afaik
>> >  COMPATIBLE_MACHINE =3D "(-)"
>> > --
>> > 1.7.6.5
>> >
>> Aargh Sorry - I forgot meta-browser as subject prefix. Resend?
>>
> no don't worry I got it
>
> Eric
Ping?


