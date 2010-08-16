Received: from p3plsmtpa01-03.prod.phx3.secureserver.net ([72.167.82.83])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <mike@mwester.net>) id 1OkrNJ-0004zd-UC
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Aug 2010 06:32:43 +0200
Received: (qmail 17856 invoked from network); 16 Aug 2010 04:25:44 -0000
Received: from unknown (209.242.7.179)
	by p3plsmtpa01-03.prod.phx3.secureserver.net (72.167.82.83) with ESMTP;
	16 Aug 2010 04:25:44 -0000
Message-ID: <4C68BDBF.1090008@mwester.net>
Date: Sun, 15 Aug 2010 23:25:35 -0500
From: Mike Westerhof <mike@mwester.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.24) Gecko/20100228 Thunderbird/2.0.0.24 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
In-Reply-To: <AANLkTikW6GsKga3=6dWUcviDJqb8WqVqhSmBw6vACM3e@mail.gmail.com>
X-SA-Exim-Connect-IP: 72.167.82.83
X-SA-Exim-Mail-From: mike@mwester.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
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
X-List-Received-Date: Mon, 16 Aug 2010 04:32:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Frans Meulenbroeks wrote:
...
> Anyway, if there are issues because of this action, or if you feel
> removal of a recipe was not in accordance with the TSC guidelines, let
> me know and I'll repair.

Well, here's the first one, docbook-sgml-dtd-3.1-native, full log below:

. ./setup-env; exec bitbake -k "slugos-packages"
NOTE: Handling BitBake files: / (7840/7840) [100 %]
NOTE: Parsing finished. 7266 cached, 496 parsed, 78 skipped, 1 masked.
NOTE: Resolving any missing task queue dependencies
NOTE: multiple providers are available for u-boot (u-boot, u-boot-omap3pandora);
NOTE: consider defining PREFERRED_PROVIDER_u-boot
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'virtual/arm-linux-gnueabi-gcc-2.95' but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'virtual/arm-linux-gnueabi-gcc-2.95' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueabi-gcc-2.95']
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'virtual/arm-linux-gnueabi-depmod-' but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'virtual/arm-linux-gnueabi-depmod-' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueabi-depmod-']
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'virtual/arm-linux-gnueabi-depmod-1.0' but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'virtual/arm-linux-gnueabi-depmod-1.0' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['virtual/arm-linux-gnueabi-depmod-1.0']
NOTE: Runtime target 'iputils-arping' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['iputils-arping', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
NOTE: Runtime target 'task-proper-tools' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['task-proper-tools', 'iputils-arping', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
NOTE: Runtime target 'iputils-ping6' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['iputils-ping6', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
NOTE: Runtime target 'iputils-ping' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['iputils-ping', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
NOTE: Runtime target 'iputils' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['iputils', 'docbook-utils-native', 'docbook-sgml-dtd-3.1-native']
ERROR: '[]' RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity 'docbook-sgml-dtd-3.1-native' but it wasn't found in any PACKAGE or RPROVIDES variables
NOTE: Runtime target 'docbook-sgml-dtd-3.1-native' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['docbook-sgml-dtd-3.1-native']
NOTE: Preparing runqueue
ERROR: All buildable tasks have been run but the build is incomplete (--continue mode). Errors for the tasks that failed will have been printed above.


-Mike (mwester)


