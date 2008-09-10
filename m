Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KdPjJ-00088c-Bo
	for openembedded-devel@openembedded.org; Wed, 10 Sep 2008 15:27:33 +0200
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1KdPgl-0000Se-Is
	for openembedded-devel@openembedded.org; Wed, 10 Sep 2008 08:24:55 -0500
Message-ID: <48C7CA95.2040708@dls.net>
Date: Wed, 10 Sep 2008 08:24:37 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.16) Gecko/20080708 Thunderbird/2.0.0.16 Mnenhy/0.7.5.666
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <48C72166.7030000@dls.net> <ga81it$e8i$1@ger.gmane.org>
In-Reply-To: <ga81it$e8i$1@ger.gmane.org>
Subject: Re: libusb and libusb-compat: conflict
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
X-List-Received-Date: Wed, 10 Sep 2008 13:27:33 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
...
> Some background: libusb1 is the rewrite of libusb which brings up
> goodness as better performance and more powersaving, but its ABI is
> incompatible with libusb. That is why the libusb people create
> libusb-compat, it's a drop-in replacement for libusb.
> 
> When I added it to OE I made sure the runtime situation worked and
> changed all packages to libusb-compat. It seems I missed a few.

Grep comes up with a bunch, but probably a lot of those are just older
recipes -- dfu-util and openocd are definitely broken, though.

> It should be safe to change everything over to libusb-compat, unless
> your favourite apps abuses private libusb API (as gnuradio does).

I encountered simple linker failures (symbols not found).  I'll get rid
of libusb out of staging entirely and see if dfu-util and openocd will
link correctly against libusb-compat.  I can test dfu-util, but I hope
someone else can test openocd.

> And there's no such thing as CONFLICTS in OE, only RCONFLICTS.

Bummer.  That would mean that we would need to switch to
"virtual/libusb" I guess.  That seems a lot of effort for something
that's obsolete -- it might be better to warn people if libusb is being
built instead of libusb-compat.  I wonder if this might be a use case
for a "WARNING" metadata item in a bitbake recipe.

I will do nothing with any metadata then except attempt to build
dfu-util and openocd with libusb-compat.

> regards,
> 
> Koen

Mike (mwester)


