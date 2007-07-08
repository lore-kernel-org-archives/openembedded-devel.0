Received: from [66.249.92.170] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1I7LOz-0008Kq-PJ
	for openembedded-devel@lists.openembedded.org;
	Sun, 08 Jul 2007 03:17:29 +0200
Received: by ug-out-1314.google.com with SMTP id i24so961025ugd
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 07 Jul 2007 18:12:02 -0700 (PDT)
Received: by 10.66.243.4 with SMTP id q4mr3926964ugh.1183857122297;
	Sat, 07 Jul 2007 18:12:02 -0700 (PDT)
Received: from ?192.168.20.110? ( [82.193.98.21])
	by mx.google.com with ESMTP id y6sm59343682mug.2007.07.07.18.12.01
	(version=SSLv3 cipher=OTHER); Sat, 07 Jul 2007 18:12:01 -0700 (PDT)
Date: Sun, 8 Jul 2007 04:11:51 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <513012886.20070708041151@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Adding screen dimensions to machine configs
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
X-List-Received-Date: Sun, 08 Jul 2007 01:17:29 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  We already discussed issue of providing more exact device screen
properties info than currently available screen classes "smallscreen"
and "bigscreen". I for one was proponent of staying with those classes
instead of hasting with introducing too many screen parameters without
proper way of handling them in OE. However, it's just the matter of
fact that at least the most basic of them, like screen dimensions are
already in use by more than one package (I can point to opie and
fbreader out of top of mind), and so far in adhoc manner, so
standardizing them would be beneficial.

  When discussing this on IRC, Marcin Juszkiewicz pointed me to Poky's
formfactor package, designed to query various device properties at
runtime (including current screen resolution).
http://svn.o-hand.com/view/poky/trunk/meta/packages/formfactor/

  I think that it is great tool, and we should merge and leverage it
in OE by all means. But it handles only runtime configuration, and
that does not supersedes need for build-time data. It is useful for
the cases where we need to preinstall some resources based on the
standard device resolution. For example, if we build image for device
with QVGA resolution, we want to install only QVGA backgrounds by
default, as shipping them all (and for example decide which one to use
at runtime) can be a waste of space.

   Now with formfactor around, I guess it would be nice to use
consistent variable names for the same info. Marcin still suggested to
use MACHINE_ prefix for build-time (i.e. machine config) variables.
So, the exact topic of this RFC is adding

MACHINE_DISPLAY_WIDTH_PIXELS=
MACHINE_DISPLAY_HEIGHT_PIXELS=

to machine configs.

   It's a bit verbose, hence this RFC to discuss exact naming
conventions. Otherwise, I'd like to keep in on pragmatic side -
there's use for these properties right now, so here they are. More
properties for the other aspects of device configuration can wait till
they have similarly clear usecases (and we really should use runtime
configuration as much as possible, just not leave out built-time
optimizations where it is useful).


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



