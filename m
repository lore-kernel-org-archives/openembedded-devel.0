Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <rpurdie@rpsys.net>) id 1IJqMi-0003FU-Uh
	for openembedded-devel@openembedded.org; Sat, 11 Aug 2007 14:46:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BChsue003221
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 13:43:54 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 02879-08 for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 13:43:44 +0100 (BST)
Received: from [192.168.1.15] (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l7BChgUC003204
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Sat, 11 Aug 2007 13:43:42 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <74d0deb30708110320n3cebe757seccd90801ee49e5a@mail.gmail.com>
References: <74d0deb30708100622mb2c048et188fca0c03e8117e@mail.gmail.com>
	<1186761021.6405.45.camel@localhost.localdomain>
	<74d0deb30708110320n3cebe757seccd90801ee49e5a@mail.gmail.com>
Date: Sat, 11 Aug 2007 13:43:41 +0100
Message-Id: <1186836221.5859.32.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.10.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: [RFC] a small bbclass for task recipes
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
X-List-Received-Date: Sat, 11 Aug 2007 12:46:50 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi,

On Sat, 2007-08-11 at 12:20 +0200, pHilipp Zabel wrote:
> Ah, great. I guessed something similar would have to exist, as the process would
> be pretty much the same as for usual -dbg packages, right?

Yes, its exactly the same.

> I was just wondering because most of the packages that explicitly set
> the PACKAGES variable in OE overwrite it completely, thus disabling
> -dev and -dbg.

They shouldn't do that.

> The code you speak of is not enabled for OE.dev as far as I can see,
> for example all angstrom -dbg task packages have the same dependencies
> as the main ones.
> How can I enable this?

It looks to be enabled already in OE.dev:

DEPCHAIN_POST = "-dbg -dev" in bitbake.conf

> Yes, and in a few places PACKAGE_ARCH is set to "${MACHINE_ARCH}" although
> it should be kept at "all" and only some subpackages should be marked
> as machine specific. I think "all" is a sane default.

I'm not 100% sure. Would debian renaming work differently on different
ARCHS for example?

> Now my question is, do you, too, like the idea of introducing another
> bbclass for those defaults? :)

I'm not agsinst it but I'm not sure I see the point for a file that will
be two lines long. How much code do we have for it?

> I guess it should to something like
> PACKAGES = "${PN} ${PN}-dbg ${PN}-dev" or not touch packages at all,
> if the code also works for -doc and -locale and enable that code,
> however it is done.

PACKAGES shouldn't need touching. Empty -doc and -locale packages won't
get created.

Cheers,

Richard



