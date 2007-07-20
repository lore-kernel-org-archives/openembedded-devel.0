Received: from [66.249.92.173] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <pmiscml@gmail.com>) id 1IBnHA-0006Px-7x
	for openembedded-devel@lists.openembedded.org;
	Fri, 20 Jul 2007 09:51:48 +0200
Received: by ug-out-1314.google.com with SMTP id i24so592157ugd
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Jul 2007 00:51:04 -0700 (PDT)
Received: by 10.82.136.4 with SMTP id j4mr103887bud.1184917864037;
	Fri, 20 Jul 2007 00:51:04 -0700 (PDT)
Received: from ?192.168.20.110? ( [77.122.179.115])
	by mx.google.com with ESMTPS id c9sm2847570nfi.2007.07.20.00.51.02
	(version=SSLv3 cipher=OTHER); Fri, 20 Jul 2007 00:51:03 -0700 (PDT)
Date: Fri, 20 Jul 2007 10:51:01 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) UNREG / CD5BF9353B3B7091
X-Priority: 3 (Normal)
Message-ID: <77326513.20070720105101@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Revamp module handling in OE
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
X-List-Received-Date: Fri, 20 Jul 2007 07:51:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  We have few issues with kernel module handling in OE which I'd like
to bring to attention and discuss ways to resolve.

1. Module config option handling was not upgraded since 2.4.

This is known issue, it surfaced several times already, and we
discussed ways to solve it with Graeme Gregory on IRC recently. The
issue is that OE currently writes module config options where 2.4
modutils expect them (/etc/modutils/*.conf), not where 2.6
module-init-tools do (/etc/modprobe.d/*.conf). The patch is at
http://bugs.openembedded.org/show_bug.cgi?id=2669

2. Location of module autoload config.

Module autoload is rather different feature. It actually never was
part of modutils/module-init-tools, but is done via adhoc scripts per
some distro's convention. Relatively randomly OE uses the same
/etc/modutils dir to store that info (just in files w/o extension).
Per-module data is then collated into /etc/modules file, and *that*
file is Debian convention. But AFAICT, that file is supposed to
contain local user's selection of autoload modules, whereas OE
automatically overwrites it. Of course, this information rather be
checked by people with more Debian background. Either way, at least
following issues can be identified:

1. Location of per-module autoload data: /etc/modutils/ is rather
confusing place for this, especially if we switch to 2.6 way.
2. /etc/modules is supposedly a user file.

One of the possible solutions: if a file is named /etc/modules, then
it's natural to name dir /etc/modules.d/ . If data from it would need
to be collated, that would go to some /etc/modules.foo, leaving
/etc/modules intact. FInally, both contents of files and dri would be
taken into account.


Thoughts?

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



