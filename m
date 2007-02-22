Received: from [64.233.182.184] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HKCpo-0002RZ-AX
	for openembedded-devel@lists.openembedded.org;
	Thu, 22 Feb 2007 13:14:04 +0100
Received: by nf-out-0910.google.com with SMTP id l24so498997nfc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Feb 2007 04:14:03 -0800 (PST)
Received: by 10.49.21.8 with SMTP id y8mr3477193nfi.1172146443740;
	Thu, 22 Feb 2007 04:14:03 -0800 (PST)
Received: from CUBE ( [77.122.177.58])
	by mx.google.com with ESMTP id q28sm5618512nfc.2007.02.22.04.14.02;
	Thu, 22 Feb 2007 04:14:02 -0800 (PST)
Date: Thu, 22 Feb 2007 14:14:07 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <109483350.20070222141407@gmail.com>
To: Rob Kramer <robk@starhub.net.sg>
In-Reply-To: <erjv1k$sm8$1@sea.gmane.org>
References: <erjv1k$sm8$1@sea.gmane.org>
MIME-Version: 1.0
Cc: openembedded-devel@openembedded.org,
	openembedded-devel@lists.openembedded.org
Subject: Re: How to specify RDEPENDS properly?
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
X-List-Received-Date: Thu, 22 Feb 2007 12:14:04 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Rob,

Thursday, February 22, 2007, 1:32:55 PM, you wrote:

> Hi all,

> I'm trying to build my custom image after updating OE (it worked several
> months back :). I've already converted several things to the new style, but
> I can't get my RDEPENDS right. There are about 4 problematic packages, but
> let's pick readline.

[]

> I don't really understand when to use the package name (readline), and when
> to use the ipk name (libreadline[4]). Several months back I had to RDEPEND
> on libreadline, so try that again:

  First thing to understand is that OE deals with 2 distinct
namespaces: one is for recipes, another is for packages. Each recipes
may build one or more packages. Names of recipes and packages are
connected, but not the same. Well, it's fair to say that recipe's name
is usually appears as substring in package name, though bitbake really
can build package named arbitrarily from any recipe.

  So, what you specify in DEPENDS in recipe name. What you specify in
RDEPENDS and other R* friends in package name.

> export PACKAGE_INSTALL = "... libreadline ..."
> RDEPENDS = "${PACKAGE_INSTALL}"

> That doesn't work either:

BB>>> build display-image
> SHELL: This command needs to parse bbfiles...
> NOTE: Using cache in
> '/bulk/home/rob/oe/dev/build-epia/tmp/cache/rob-epia'
> NOTE: Handling BitBake files: | (4243/4243) [100 %]
> NOTE: Parsing finished. 3315 cached, 1 parsed, 196 skipped, 731 masked.

> SHELL: Building display-image
> ERROR: Nothing provides runtime dependency libreadline
> NOTE: no buildable providers for display-image

> Neither does 'libreadline4'.

  There's no magic, let's see together: explode
libreadline4_4.3-r3_i586.ipk you have (it's essentiall .deb; if in
doubt, use ar followed by tar -z). Look for DEBIAN/control file:
----
Provides: libreadline4
----
that's in addition to implicit provision of package name (which
matches with explicit one here).

  So, libreadline4 must work.

  General hint: if you have any weird problems with packaging images,
first dumb thing you can try is to remove Packages* files and retry.

  That's because ipkg and ipkg-utils have bugs tracking actual state
of package. For example, each  time you do "bitbake -c rebuild", and
then create image with that package(s), you *must* kill Packages*.

> I looked at how all the other images/tasks do this, but it seems readline is
> not RDEPENDed anywhere...?

> How should I do this, or where to RTFM, if explained there?

> Cheers!

>     Rob


-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



