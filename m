Received: from [72.14.220.155] (helo=fg-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1JiwhP-0001zp-1W
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 21:08:11 +0200
Received: by fg-out-1718.google.com with SMTP id 13so1256215fge.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2008 12:08:06 -0700 (PDT)
Received: by 10.82.165.5 with SMTP id n5mr19975bue.39.1207595285661;
	Mon, 07 Apr 2008 12:08:05 -0700 (PDT)
Received: by 10.82.119.15 with HTTP; Mon, 7 Apr 2008 12:08:05 -0700 (PDT)
Message-ID: <74d0deb30804071208x39ba3705x816bdc15820830ce@mail.gmail.com>
Date: Mon, 7 Apr 2008 21:08:05 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0804071129o7c6415b6s4b4b3c19e5af0059@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0803311500r15a7b84fp2515f3b54ad747a4@mail.gmail.com>
	<fssll5$uhe$1@ger.gmane.org>
	<c384c5ea0804010333i4c63c490n2f5f48db5dcf9bec@mail.gmail.com>
	<74d0deb30804070745s3f55564fo7f8f2112cfa5f1f2@mail.gmail.com>
	<c384c5ea0804071129o7c6415b6s4b4b3c19e5af0059@mail.gmail.com>
Subject: Re: [Review] Remove /xorg-lib/pixman_* in favor of /libpixman/libpixman_*
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
X-List-Received-Date: Mon, 07 Apr 2008 19:08:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 7, 2008 at 8:29 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello Philipp,
>
>
>
>  On Mon, Apr 7, 2008 at 4:45 PM, pHilipp Zabel <philipp.zabel@gmail.com> wrote:
>  > On Tue, Apr 1, 2008 at 12:33 PM, Leon Woestenberg
>  >  <leon.woestenberg@gmail.com> wrote:
>  >  > Hello Koen,
>  >  >  On Tue, Apr 1, 2008 at 8:44 AM, Koen Kooi
>  >  >  <koen@dominion.kabel.utwente.nl> wrote:
>  >  >  >  How about dropping the xorg-lib one and renaming libpixman to pixman?
>  >  >  >
>  >  >  +1 on both. I'll commit tomorrow if nobody beat me to it.
>  >
>  >  Sorry I'm late, but I kind of maybe disagree a bit. I might be
>  >  confused about the cairo/xorg source locations, but as I understand
>  >  it, xorg.freedesktop.org/releases/individual/lib is the canonical
>  >  upstream version. So why not put it in xorg-lib and make use of
>  >  xorg-lib-common.inc?
>  >
>  Putting it in xorg-lib is not the big issue. However including
>  xorg-lib-common.inc is a big issue.
>
>  For a system that only uses pixman, and not anything else, it starts
>  building a complete X server etc. etc. because the xorg include adds
>  those dependencies.

Argh, I didn't see that.
I guess we could start including xorg-lib-common.inc and overwriting
DEPENDS = "" in pixman.bb, but that's a bit hackish...
As pixman doesn't gain too much from xorg-lib-common.inc, I'm just as
fine with putting it outside xorg-lib.

>  These dependencies are NOT in pixman. Maybe in upper libraries, but
>  even then it depends on their configuration etc. etc.
>
>  I'ld like to keep the "embedded" in OpenEmbedded, also for small
>  embedded Linux systems.

Sure thing. Especially as this is not even an optional dependency, but
just plain wrong :)

>  What would be the good reason to keep pixman in the xorg-lib
>  directory? Why do we have this directory, we don't have a gnome/
>  directory where gtk+ lives, I do not really see the benefit?

The main reason was to group the common fields of many very similar
recipes into -common.inc files so they wouldn't have to be duplicated
all the time. This also decreased the number of entries in the
packages dir quite a bit. And I figured it's just easier to check for
updates / new xorg packages by running some scripts against the xorg-*
dirs and $XORG_MIRROR/.../index.html than to maintain a list of xorg
packages or even watch them manually.
The only reason left I see for putting pixman in xorg-lib is a)
consistency and b) I have to add an exception for pixman to my shell
script so it doesn't show up as missing :)

regards
Philipp


