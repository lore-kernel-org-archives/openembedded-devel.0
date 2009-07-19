Received: from [78.46.147.237] (helo=gandharva.secretlabs.de)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <holger+oe@freyther.de>) id 1MSMRp-00046F-Pg
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Jul 2009 04:48:21 +0200
Received: from tamarin.localnet (123-192-186-20.dynamic.kbronet.com.tw
	[123.192.186.20])
	by gandharva.secretlabs.de (Postfix) with ESMTPSA id A3A8B1B10C12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 19 Jul 2009 02:35:48 +0000 (UTC)
From: Holger Hans Peter Freyther <holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 19 Jul 2009 04:33:52 +0200
User-Agent: KMail/1.12.0 (Linux/2.6.31-rc2; KDE/4.2.96; i686; ; )
References: <E1MRRlx-0004ks-DE@melo.openembedded.org>
	<736225.85365.qm@web52403.mail.re2.yahoo.com>
In-Reply-To: <736225.85365.qm@web52403.mail.re2.yahoo.com>
MIME-Version: 1.0
Message-Id: <200907190433.52129.holger+oe@freyther.de>
Subject: Re: After updating today it fails to build angstrom gpe-image.
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
X-List-Received-Date: Sun, 19 Jul 2009 02:48:21 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

On Friday 17 July 2009 09:12:48 Lucian Ion wrote:
> My build fails:
>
> bitbake gpe-image
> WARNING: No matches in filesystem for
> /home/luciani/stuff/openembedded/build/ in COLLECTIONS __builtin__:74:
> DeprecationWarning: the sets module is deprecated
> __builtin__:74: DeprecationWarning: the sets module is deprecated
> NOTE: Handling BitBake files: - (6985/6985) [100 %]
> NOTE: Parsing finished. 6693 cached, 0 parsed, 292 skipped, 0 masked.
> NOTE: Cache is clean, not saving.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Runtime target 'bluez-utils-dbus' is unbuildable, removing...
> Missing or unbuildable dependency chain was: ['bluez-utils-dbus',
> 'bluez-libs-3.36'] ERROR: Required build target 'gpe-image' has no
> buildable providers. Missing or unbuildable dependency chain was:
> ['gpe-image', 'task-gpe-base', 'bluez-utils-dbus', 'bluez-libs-3.36']
>

AFAIK a change was added to angstrom making you use bluez 4.x. Maybe the 
depends of task-gpe-base deserve an update?

z.


