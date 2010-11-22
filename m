Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PKK4H-0006KL-Aw
	for openembedded-devel@lists.openembedded.org;
	Mon, 22 Nov 2010 01:15:39 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id 2BAC6314AEA0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 01:14:27 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id 0XewOHEOpMae
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 01:14:21 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id 03E37314502D
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Nov 2010 01:14:21 +0100 (CET)
Message-ID: <4CE9B5DC.2080006@opendreambox.org>
Date: Mon, 22 Nov 2010 01:14:20 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1290185336.3681.13.camel@mattotaupa>
In-Reply-To: <1290185336.3681.13.camel@mattotaupa>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] gsl.inc: Remove `do_stage`.
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
X-List-Received-Date: Mon, 22 Nov 2010 00:15:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/19/2010 05:48 PM, Paul Menzel wrote:
> Date: Fri, 19 Nov 2010 17:33:00 +0100
> 
> Inkscape fails to build after commit c2c8fe [1] with the following error.
> 
>     | checking for CAIRO_USER_FONTS... yes
>     | checking for INKSCAPE... configure: error: Package requirements (gdkmm-2.4  glibmm-2.4 giomm-2.4 gtkmm-2.4 >= 2.10.0  gtk+-2.0  libxml-2.0 >= 2.6.11  libxslt >= 1.0.15  cairo  sigc++-2.0 >= 2.0.12    gthread-2.0 >= 2.0 libpng >= 1.2 gsl) were not met:
>     |
>     | No package 'gsl' found
>     |
>     | Consider adjusting the PKG_CONFIG_PATH environment variable if you
>     | installed software in a non-standard prefix.
>     |
>     | Alternatively, you may set the environment variables INKSCAPE_CFLAGS
>     | and INKSCAPE_LIBS to avoid the need to call pkg-config.
>     | See the pkg-config man page for more details.
>     |
>     | ERROR: Function do_configure failed
>     NOTE: package inkscape-0.48.0-r0: task do_configure: Failed
>     ERROR: TaskFailed event exception, aborting
>     ERROR: Build of /home/paul/oe/openembedded/recipes/inkscape/inkscape_0.48.0.bb do_configure failed
> 
> Removing `do_stage` fixes building `inkscape_0.48.0.bb` with `angstrom-2008.1`, `angstrom-2010.x` and `minimal` for `MACHINE = "beagleboard"`.
> 
> [1] http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=c2c8fe4c5629add94bd0b922f5b3446624a9f4d8
> 
> Signed-off-by: Paul Menzel <paulepanter@users.sourceforge.net>
> ---
> Please note, that I did not test the removal of this function any further, that means I did not compare the package contents before and after, and do not know about the implications. If someone more knowledgeable could check that, it would be very much appreciated.
> ---

Acked-by: Andreas Oberritter <obi@opendreambox.org>


