Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <robert@erafx.com>) id 1PN20u-0003GG-Cl
	for openembedded-devel@lists.openembedded.org;
	Mon, 29 Nov 2010 12:35:21 +0100
Received: by qwg5 with SMTP id 5so3006064qwg.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Nov 2010 03:34:00 -0800 (PST)
MIME-Version: 1.0
Received: by 10.229.211.6 with SMTP id gm6mr4545552qcb.93.1291030439910; Mon,
	29 Nov 2010 03:33:59 -0800 (PST)
Received: by 10.220.194.65 with HTTP; Mon, 29 Nov 2010 03:33:59 -0800 (PST)
X-Originating-IP: [24.165.208.114]
In-Reply-To: <AANLkTinNZPKsoML=dAyuXOQ=o_hH=memq8t2eq1P8WD=@mail.gmail.com>
References: <AANLkTinNZPKsoML=dAyuXOQ=o_hH=memq8t2eq1P8WD=@mail.gmail.com>
Date: Mon, 29 Nov 2010 06:33:59 -0500
Message-ID: <AANLkTin1JXvNc0t-HmrQs5z6KbD=2qm+QUTnkWb1BbiG@mail.gmail.com>
From: Robert Foerster <robert@erafx.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.47
X-SA-Exim-Mail-From: robert@erafx.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: psplash customization
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
X-List-Received-Date: Mon, 29 Nov 2010 11:35:21 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Sun, Nov 28, 2010 at 8:51 PM, Alessandro Sappia <a.sappia@gmail.com>wrote:

> hi all,
> I'm fighting against psplash image customization. docs confuses me, as
> I don't want to change anything in the original oe repository.
> I configured enviroment to have a local overlay where I put my own
> psplash-winecooler_svn.bb and created with
> make-image-header.sh (both HAND and BAR) the .h needed in files/foo
> subdirectory of the same recipe. the image recipe I use is:
> winecooler-image.bb
> ------------------
> IMAGE_PREPROCESS_COMMAND = "create_etc_timestamp"
>
> DEPENDS =  "task-base-extended \
>             psplash-winecooler \
>         esekeyd u-boot-utils tslib \
>         i2c-tools i2c screen rsync nfs-utils \
>         directfb gdbserver directfb mtd-utils \
>        "
> PREFERRED_PROVIDER_virtual/psplash = "psplash-winecooler"
>
> IMAGE_INSTALL = "task-base-extended \
>         psplash-winecooler \
>         qt4-embedded qwinecooler
> qt4-embedded-plugin-gfxdriver-gfxtransformed \
>         qt4-embedded-plugin-sqldriver-sqlite \
>         qt4-embedded-plugin-imageformat-jpeg \
>         qt4-embedded-plugin-imageformat-gif \
>         qt4-embedded-plugin-imageformat-mng \
>         qt4-embedded-fonts-ttf-vera \
>         qt4-embedded-fonts \
>         qt4-embedded-plugin-mousedriver-tslib \
>         qt4-embedded-fonts-ttf-dejavu \
>         esekeyd u-boot-utils tslib-calibrate tslib-tests \
>         i2c-tools i2c screen \
>         directfb mtd-utils \
>        "
>
> export IMAGE_BASENAME = "winecooler-image"
> IMAGE_LINGUAS = ""
>
> inherit image
> ------------------
>
> psplash-vinecooler.bb
> ------------------
> require psplash.inc
> require psplash-ua.inc
>
> ALTERNATIVE_PRIORITY = "20"
>
> # You can create your own pslash-poky-img.h by doing
> # ./make-image-header.sh <file>.png POKY
> # and rename the resulting .h to pslash-poky-img.h (for the logo)
> # respectively psplash-bar-img.h (BAR) for the bar.
> # You might also want to patch the colors (see patch)
>
> SRC_URI = "svn://svn.o-hand.com/repos/misc/trunk;module=psplash;proto=http\
>          file://psplash-18bpp.patch \
>          file://logo-math.patch \
>          file://psplash-poky-img.h \
>          file://psplash-bar-img.h \
>          file://psplash-default \
>          file://splashfuncs \
>          file://psplash-init"
> S = "${WORKDIR}/psplash"
> ------------------
> bitbake winecooler-image builds psplash-angstrom and I obtain the base
> angstrom boot image. :(
> the psplash-winecooler.bb compiles fine.
>
> another issue is that bitbake winecooler-image complain me about
> psplash-angstrom and psplash-winecooler providing both virtual/psplash
>
> I'm quite new to OE, I know I'm doing it wrong, but may someone show
> me the way ?
>
> Regards,
>
> Alessandro
>
> --
> Alessandro Sappia
> a.sappia@gmail.com
>
>
Alternative packages are chosen based on the ALTERNATIVE_PRIORITY.  You have
given yours the same as psplash-angstrom. Increase your priority so it will
be the preferred alternative.

Additionally, you should look into amend.inc for cases such as this.  It
allows you to tweak recipes in your overlay without duplicating the entire
recipe.

