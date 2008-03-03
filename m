Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JW78j-0006qd-72
	for openembedded-devel@openembedded.org; Mon, 03 Mar 2008 10:39:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m239cDYR008619
	for <openembedded-devel@openembedded.org>; Mon, 3 Mar 2008 09:38:13 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 08183-10 for <openembedded-devel@openembedded.org>;
	Mon,  3 Mar 2008 09:38:04 +0000 (GMT)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m239c0f8008605
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>; Mon, 3 Mar 2008 09:38:01 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <200803030207.40083.zecke@selfish.org>
References: <1204303564.8126.38.camel@dax.rpnet.com>
	<200803030207.40083.zecke@selfish.org>
Date: Mon, 03 Mar 2008 09:37:59 +0000
Message-Id: <1204537079.8095.19.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 194.106.48.114
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: OE Staging ABI Change Warning
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
X-List-Received-Date: Mon, 03 Mar 2008 09:39:26 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Holger,

On Mon, 2008-03-03 at 02:07 +0100, Holger Freyther wrote:
> On Friday 29 February 2008 17:46:04 Richard Purdie wrote:
> > OE.dev is now just about ready to switch to using sysroot. The compilers
> > have been updated to activate sysroot and the fixes I/Poky have for
> > various pkgconfig issues have been committed. The final change is to
> > actually change the layout.
>
> one small question, how does this impact:
> 	-The sharp rom and their crappy and ancient 2.95.x toolchain?
> 	-Any other prebuilt toolchain.

It means they'll need to play a game with symlinks just as we currently
have in cross-linkage and the "hack" I added into gcc-cross temporarily
to add a usr symlink in staging.

With the addition of those two symlinks, OE should continue to work for
all old toolchains and prebuilt ones without sysroot support.

> and honestly I'm a bit scared of silently breaking thousands of packages/BB 
> files.

Having looked at some old parts of the metadata when fixing up staging
references, we already have a ton of broken .bb files :(. I was really
disappointed with the quality in some areas and I honestly don't know
what to do about this.


If it helps, I don't think this stage of the conversion is that risky.
The main problems will arise from the pkgconfig change and insane will
instantly pick those problems up since they are clearly identifiable
(and not silent). Its the pkgconfig change that is breaking staging ABI,
the actual layout change could have been made with symlinks (I kind of
already did that) and I doubt many would have noticed.

The really nasty/risky conversion would be if, as and when we change the
TARGET_CFLAGS and TARGET_LDFLAGS to not include staging paths and rely
solely on sysroot. This worked in Poky but did cause some headaches and
I'm not going to propose it for OE.dev at this time. The nice thing
about it is we can do it without breaking ABI and toolchains/distros
that need the extra flags can just add them back in so its a much less
problematic change in that sense.

Cheers,

Richard




