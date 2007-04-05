Received: from [66.249.82.233] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <pmiscml@gmail.com>) id 1HZT7L-0004Rx-Kf
	for openembedded-devel@lists.openembedded.org;
	Thu, 05 Apr 2007 16:39:15 +0200
Received: by wx-out-0506.google.com with SMTP id t14so545439wxc
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 05 Apr 2007 07:39:14 -0700 (PDT)
Received: by 10.90.113.18 with SMTP id l18mr1606572agc.1175783954659;
	Thu, 05 Apr 2007 07:39:14 -0700 (PDT)
Received: from cube ( [82.193.98.4])
	by mx.google.com with ESMTP id 38sm2995157nzf.2007.04.05.07.39.13;
	Thu, 05 Apr 2007 07:39:14 -0700 (PDT)
Date: Thu, 5 Apr 2007 17:39:20 +0300
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Priority: 3 (Normal)
Message-ID: <1168683040.20070405173920@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: [RFC] Cleaning up service handling in OE
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
X-List-Received-Date: Thu, 05 Apr 2007 14:39:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  By service, I mean /etc/init.d/* scripts, which all follow
start/stop command convention, etc. They also can autostart on boot or
not. This is actually the topic of this RFC - to call for discussion
of guidelines the packages should follow in their wish to install
their services for autostart on boot.

  A specific case which makes me raise this question is irda-utils
packages which includes irattach service, which it bothers to install
for autostart. The result of this is that IrDA is being activated
unconditionally on boot, eating power, and disallowing other processes
to control IrDA port on their own. The only reason it doesn't hit many
users is that service script itself broken and fails to detect IrDA
port on most of machines.

  I checked that 2 major GUI frameworks, GPE and OPIE, use own means
to control IrDA nd do not depend on irattach service. So, I'd like to
proceed with following:

1. Fix port detection for irattach service so it would apply to most
PXA devices to start with.
2. But leave it out of autostart, leaving this matter to user.


  I hope that for this case, proposed steps are unambiguous, but
again, I'd like to extend scope of this RFC to discuss generic
guidelines for all services. Another possible usecase: user install
mysql server. This is reasonably heavy package for embedded system.
So, should package make it autostart or no?

  I'd guess, this largely depends on the answer to question "How hard
for end user to control service's autostart setting?". OE uses update-rc.d
script for this, and arguably, it's not very userfriendly - while
removal from autostart takes just remove command and service name, for
adding to autostart, user needs to specify priorities explicitly, and
that's easy to get that wrong.

  I'm not sure how Debian solves this issue, but RedHat systems has
chkconfig utils, which, while having confusing name, has nice feature
of using defaults provided in service script itself, for example:

-- avahi-daemon --
#! /bin/sh
#
# avahi-daemon:       Starts the Avahi Daemon
#
# chkconfig: 345 98 02
[]
------------------

  Would it be reasonable to add such feature to update-rc.d script?


-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



