Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OkszD-00080L-NQ
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 08:15:57 +0200
Received: by pvg6 with SMTP id 6so1767174pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 15 Aug 2010 23:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=OFUADqSMp6sQX1DSkdGLRFj66wuE8QFcqclDy5nG7j4=;
	b=xVHJXgI7pcyPRn153irW9y00KKuT7aD1PuFbpibxgk1NIQ4lNEJvyabgxS4FjH+xZX
	HI5MOu0IIekA9wzfFMlObH2nScRfp+L6cN1OXXoufT6lxCvu/xowFSno0bGlAEAvKY9N
	ykaIU1rr7+TMk0NoxTmXHvGOMV0AAG7Kn4U8w=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Ttq2vjTJxnBzibyy0r6IhU+FHOKvkdyVLZoHArKR6QmqqOWXV175Lh0VfN/fazRrHQ
	PhFAce1Liy2+0/oGqUh66htCECY9hQHb2FHkOxV6wT4Cg0MNcCVOxO9VZuwX/q88F/Jk
	5JCp9yQYhm4sjp1JITrE5UbebmNoiBsNPr91Q=
Received: by 10.114.173.5 with SMTP id v5mr5736451wae.79.1281939338276;
	Sun, 15 Aug 2010 23:15:38 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id k23sm11512416waf.5.2010.08.15.23.15.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 15 Aug 2010 23:15:37 -0700 (PDT)
Date: Sun, 15 Aug 2010 23:15:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100816061540.GA13569@gmail.com>
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
	<4C68BDBF.1090008@mwester.net>
MIME-Version: 1.0
In-Reply-To: <4C68BDBF.1090008@mwester.net>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: cleaning recipes
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
X-List-Received-Date: Mon, 16 Aug 2010 06:15:57 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/08/10 23:25), Mike Westerhof wrote:
> Frans Meulenbroeks wrote:
> ...
> > Anyway, if there are issues because of this action, or if you feel
> > removal of a recipe was not in accordance with the TSC guidelines, let
> > me know and I'll repair.
> 
> Well, here's the first one, docbook-sgml-dtd-3.1-native, full log below:


heh I am running into same problem  when building from scratch :) This is my temporary fix that I am
building with now at least it goes thru parse stage. I havent looked the
effects of bumping up this dependency version yet. May be its ok may be it
is wrong.

diff --git a/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
b/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
index 595aa50..52c2ebb 100644
--- a/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
+++ b/recipes/docbook-utils/docbook-utils-native_0.6.14.bb
@@ -3,7 +3,7 @@ LICENSE = "GPL"
 
 PR = "r2"
 
-DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-3.1-native"
+DEPENDS = "openjade-native sgmlspl-native docbook-dsssl-stylesheets-native docbook-sgml-dtd-4.4-native"
 
 SRC_URI = "ftp://sources.redhat.com/pub/docbook-tools/new-trials/SOURCES/docbook-utils-${PV}.tar.gz"
 S = "${WORKDIR}/docbook-utils-${PV}"

> 
> . ./setup-env; exec bitbake -k "slugos-packages"
> NOTE: Handling BitBake files: / (7840/7840) [100 %]
> NOTE: Parsing finished. 7266 cached, 496 parsed, 78 skipped, 1 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: multiple providers are available for u-boot (u-boot, u-boot-omap3pandora);
> NOTE: consider defining PREFERRED_PROVIDER_u-boot
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'virtual/arm-linux-gnueabi-gcc-2.95' but it wasn't found in any PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'virtual/arm-linux-gnueabi-gcc-2.95' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueabi-gcc-2.95']
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'virtual/arm-linux-gnueabi-depmod-' but it wasn't found in any PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'virtual/arm-linux-gnueabi-depmod-' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueabi-depmod-']
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'virtual/arm-linux-gnueabi-depmod-1.0' but it wasn't found in any PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'virtual/arm-linux-gnueabi-depmod-1.0' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueabi-depmod-1.0']
> NOTE: Runtime target 'iputils-arping' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils-arping', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'task-proper-tools' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['task-proper-tools', 'iputils-arping', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'iputils-ping6' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils-ping6', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'iputils-ping' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils-ping', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
> NOTE: Runtime target 'iputils' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['iputils', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
> ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'docbook-sgml-dtd-3.1-native' but it wasn't found in any PACKAGE or RPROVIDES variables
> NOTE: Runtime target 'docbook-sgml-dtd-3.1-native' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['docbook-sgml-dtd-3.1-native']
> NOTE: Preparing runqueue
> ERROR: All buildable tasks have been run but the build is incomplete (--continue mode). Errors for the tasks that failed will have been printed above.
> 
> 
> -Mike (mwester)
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


