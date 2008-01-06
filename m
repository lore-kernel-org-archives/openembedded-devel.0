Received: from [209.85.128.185] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1JBY9C-00061i-L0
	for openembedded-devel@lists.openembedded.org;
	Sun, 06 Jan 2008 17:14:50 +0100
Received: by fk-out-0910.google.com with SMTP id 18so9738851fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 06 Jan 2008 08:08:02 -0800 (PST)
Received: by 10.82.150.20 with SMTP id x20mr33474853bud.5.1199632442120;
	Sun, 06 Jan 2008 07:14:02 -0800 (PST)
Received: from paul.bn.lan ( [194.79.8.34])
	by mx.google.com with ESMTPS id p38sm26741187fke.13.2008.01.06.07.14.00
	(version=SSLv3 cipher=OTHER); Sun, 06 Jan 2008 07:14:01 -0800 (PST)
Date: Sun, 6 Jan 2008 17:18:41 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <702840400.20080106171841@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Cc: angstrom-distro-devel@linuxtogo.org
Subject: Enabling gtk-touchscreen-mode for gtk+
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
X-List-Received-Date: Sun, 06 Jan 2008 16:14:53 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello openembedded-devel,

  It seems that few of usability issues we experience with gtk+ are
due to the fact that we don't have configured it well enough. For
example, in 2.10, Maemo people contributed gtk-touchscreen-mode
setting which makes pointing device handling behavior more adapted for
touchscreens. I'd like enable it now, apparently by starting to ship
/etc/gtk-2.0/gtkrc having that option, in gtk+ package.

  If someone has immediate better idea where it should be set/shipped
from the start, please speak. Otherwise, we'll need to elaborate
stylus vs mouse handling anyway later.

  If you want specific example of broken behavior, it's
menus/dropdowns with many choices, not fitting the box - when you
tap arrow to scroll it, it starts to scroll continuously and fast in
your face, disallowing to do needed selection realistically.
gtk-touchscreen-mode = 1 fixes that (tap causes one-line scroll).
One place this can be reproduced is openmoko-appmanager (sic), with
SECTION dropdown. (I wonder if OM has gtk-touchscreen-mode set
somewhere btw).

-- 
Best regards,
 Paul                          mailto:pmiscml@gmail.com



