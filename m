Received: from [64.233.162.233] (helo=nz-out-0102.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <andrew.paulsen@gmail.com>) id 1GrbJb-0008J4-Py
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Dec 2006 15:30:35 +0100
Received: by nz-out-0102.google.com with SMTP id m22so1973993nzf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Dec 2006 06:29:42 -0800 (PST)
Received: by 10.78.200.3 with SMTP id x3mr9004050huf.1165328981030;
	Tue, 05 Dec 2006 06:29:41 -0800 (PST)
Received: by 10.78.166.11 with HTTP; Tue, 5 Dec 2006 06:29:40 -0800 (PST)
Message-ID: <d46153c40612050629v8bdfcd2i32fa9858f916605f@mail.gmail.com>
Date: Tue, 5 Dec 2006 08:29:40 -0600
From: "Andrew Paulsen" <andrew.paulsen@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <432beae0612050150u64499772m14fefdeb8ccd6e2f@mail.gmail.com>
MIME-Version: 1.0
References: <d46153c40612041402o2e1ed6fdmdd1a8fa8261d15ce@mail.gmail.com>
	<432beae0612050150u64499772m14fefdeb8ccd6e2f@mail.gmail.com>
Subject: Re: madwifi
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 05 Dec 2006 14:30:36 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 12/5/06, Justin Patrin <papercrane@gmail.com> wrote:
> On 12/4/06, Andrew Paulsen <andrew.paulsen@gmail.com> wrote:
> > Does anyone have any tips for including madwifi into a gpe-image build?
> >
> > I can "bitbake madwifi-ng" by itself and that appears to work.
> >
> > If I add
> > BOOTSTRAP_EXTRA_RDEPENDS = "madwifi-ng"
> > to my machine.conf, or add
> >
> > GPE_EXTRA_INSTALL += "madwifi-ng"
> > to my gpe-image.bb, I get an:
> >
> > "ERROR: Nothing provides runtime dependency madwifi-ng"
> >
> > Is there a better way to add packages to an image?
> >
>
> The problem you're facing is that you're adding only a runtime
> (install-time) dependency and not a compile-time dependency. If you're
> compiling in the .dev branch then this is likely a bug (if you're
> using BOOTSTRAP_EXTRA_RDEPENDS). If you're using the .oz354x branch
> then you need to add madwifi-ng to the DEPENDS of the file you're
> editing too.
>
> --
> Justin Patrin

Ok, I tried a few more things this morning, but I'm still getting
errors.  Here's what I'm working with:

OE Build Configuration:
BB_VERSION     = "1.6.3"
OE_REVISION    = "dbe2d7e445c33fd9403d6edaf6ec36d1857ada98"
TARGET_ARCH    = "arm"
TARGET_OS      = "linux"
MACHINE        = "compulab-pxa270"
DISTRO         = "generic"
DISTRO_VERSION = ".dev-snapshot-20061205"
TARGET_FPU     = "soft"
I am using the .oz354x branch of OE.

I first tried adding the following to my machine.conf file:
BOOTSTRAP_EXTRA_RDEPENDS = "madwifi-ng"
DEPENDS += "madwifi-ng"

Which promptly broke my build with a circular dependency:
ERROR: /stuff/org.openembedded.dev/packages/quilt/quilt-native_0.45.bb
depends on itself (eventually)
ERROR: upwards chain is: gpe-image (gpe-image) -> ipkg-native
(ipkg-native) -> pkgconfig-native (pkgconfig-native) ->
autoconf-native (autoconf-native) -> quilt-native (quilt-native) ->
madwifi-ng (madwifi-ng) -> ipkg-utils-native (ipkg-utils-native)

I then tried adding the following to my gpe-image.bb file:
GPE_EXTRA_INSTALL += "madwifi-ng"
DEPENDS += "madwifi-ng"

I also tried a few combinations of adding madwifi-ng to
GPE_EXTRA_INSTALL, DEPENDS, and RDEPENDS to gpe-image.bb to see if
dumb luck would help ... it didn't.

Other than the circular dependency error, I always get:
ERROR: Nothing provides runtime dependency madwifi-ng


