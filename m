Received: from [209.85.132.245] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Jiw6D-00012o-Pg
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 Apr 2008 20:29:45 +0200
Received: by an-out-0708.google.com with SMTP id b33so393531ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 07 Apr 2008 11:29:34 -0700 (PDT)
Received: by 10.100.96.9 with SMTP id t9mr722606anb.137.1207592972846;
	Mon, 07 Apr 2008 11:29:32 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Mon, 7 Apr 2008 11:29:32 -0700 (PDT)
Message-ID: <c384c5ea0804071129o7c6415b6s4b4b3c19e5af0059@mail.gmail.com>
Date: Mon, 7 Apr 2008 20:29:32 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <74d0deb30804070745s3f55564fo7f8f2112cfa5f1f2@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0803311500r15a7b84fp2515f3b54ad747a4@mail.gmail.com>
	<fssll5$uhe$1@ger.gmane.org>
	<c384c5ea0804010333i4c63c490n2f5f48db5dcf9bec@mail.gmail.com>
	<74d0deb30804070745s3f55564fo7f8f2112cfa5f1f2@mail.gmail.com>
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
X-List-Received-Date: Mon, 07 Apr 2008 18:29:46 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Philipp,

On Mon, Apr 7, 2008 at 4:45 PM, pHilipp Zabel <philipp.zabel@gmail.com> wrote:
> On Tue, Apr 1, 2008 at 12:33 PM, Leon Woestenberg
>  <leon.woestenberg@gmail.com> wrote:
>  > Hello Koen,
>  >  On Tue, Apr 1, 2008 at 8:44 AM, Koen Kooi
>  >  <koen@dominion.kabel.utwente.nl> wrote:
>  >  >  How about dropping the xorg-lib one and renaming libpixman to pixman?
>  >  >
>  >  +1 on both. I'll commit tomorrow if nobody beat me to it.
>
>  Sorry I'm late, but I kind of maybe disagree a bit. I might be
>  confused about the cairo/xorg source locations, but as I understand
>  it, xorg.freedesktop.org/releases/individual/lib is the canonical
>  upstream version. So why not put it in xorg-lib and make use of
>  xorg-lib-common.inc?
>
Putting it in xorg-lib is not the big issue. However including
xorg-lib-common.inc is a big issue.

For a system that only uses pixman, and not anything else, it starts
building a complete X server etc. etc. because the xorg include adds
those dependencies.

These dependencies are NOT in pixman. Maybe in upper libraries, but
even then it depends on their configuration etc. etc.

I'ld like to keep the "embedded" in OpenEmbedded, also for small
embedded Linux systems.

>  +1 on the libpixman -> pixman part though.
>
OK, that sounds easy enough.

What would be the good reason to keep pixman in the xorg-lib
directory? Why do we have this directory, we don't have a gnome/
directory where gtk+ lives, I do not really see the benefit?

Regards,
-- 
Leon


