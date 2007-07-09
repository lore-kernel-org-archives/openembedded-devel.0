Received: from [80.68.91.202] (helo=xora.org.uk)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <dp@xora.org.uk>) id 1I7uHs-0006LO-Fn
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Jul 2007 16:32:36 +0200
Received: from xora.org.uk ([::ffff:87.246.78.27])
	(AUTH: LOGIN dp, SSL: TLSv1/SSLv3,128bits,AES128-SHA)
	by xora.org.uk with esmtp; Mon, 09 Jul 2007 15:26:53 +0100
	id 0003090A.469245AD.000053E2
Date: Mon, 9 Jul 2007 15:25:44 +0100
From: Graeme Gregory <dp@xora.org.uk>
To: "Dr. Michael Lauer" <mickey@vanille-media.de>
Message-ID: <20070709142544.GF2336@p3n3tr4t0r.internal>
References: <513012886.20070708041151@gmail.com> <f6q30v$s2$1@sea.gmane.org>
	<128309124.20070709154303@gmail.com>
	<20070709131744.GC2336@p3n3tr4t0r.internal>
	<1005211919.20070709153513@vanille-media.de>
	<20070709134256.GD2336@p3n3tr4t0r.internal>
	<13810026301.20070709155245@vanille-media.de>
	<20070709140338.GE2336@p3n3tr4t0r.internal>
	<4310707680.20070709161925@vanille-media.de>
Mime-Version: 1.0
In-Reply-To: <4310707680.20070709161925@vanille-media.de>
User-Agent: Mutt/1.5.15 (2007-04-06)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Mon, 09 Jul 2007 14:32:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Jul 09, 2007 at 04:19:25PM +0200, Dr. Michael Lauer wrote:
> > Maybe a MACHINE_DEFAULT_ROTATION is also needed.
> 
> I don't think so. What applications care about is if portrait or
> landscape is the common default and this is already encoded in HEIGHT
> and WIDTH.
> 
Applications do care, a short snippet of /etc/X11/Xserver

        "SHARP Shepherd" | "SHARP Husky" | "SHARP Corgi")
                ARGS="$ARGS -dpi 200 -rgba rgb" ;;
        "SHARP Spitz" | "SHARP Akita" | "SHARP Borzoi")
                ARGS="$ARGS -dpi 200 -rgba rgb -screen 480x640@270" ;;

Why restrict yourself to the simple usecase of opie backgrounds when
the information could be used in far better ways.

If this information was taken from MACHINE_ variables then a large chunk
of this case statement could be removed. But the way you want to do it
the information is in machine.conf, xserver-common somwhere, and a variety
of other places. And all because you refuse to use real information but
some pre-parsed info that is narrowly defined for one application.

Graeme



