Received: from [194.106.48.114] (helo=tim.rpsys.net)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <rpurdie@rpsys.net>) id 1H5fbu-00008M-1A
	for openembedded-devel@openembedded.org; Sat, 13 Jan 2007 10:55:51 +0100
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0D9qj36029206;
	Sat, 13 Jan 2007 09:52:45 GMT
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 28547-09; Sat, 13 Jan 2007 09:52:43 +0000 (GMT)
Received: from max.rpnet.com (max.rpnet.com [192.168.1.15])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id l0D9qead029197
	(version=TLSv1/SSLv3 cipher=RC4-MD5 bits=128 verify=NO);
	Sat, 13 Jan 2007 09:52:40 GMT
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org,
	"Michael 'Mickey' Lauer" <mickey@vanille-media.de>
In-Reply-To: <1888834532.20070112204308@vanille-media.de>
References: <1888834532.20070112204308@vanille-media.de>
Date: Sat, 13 Jan 2007 09:52:39 +0000
Message-Id: <1168681959.5868.4.camel@localhost.localdomain>
Mime-Version: 1.0
X-Mailer: Evolution 2.6.1 
X-Virus-Scanned: amavisd-new at rpsys.net
Subject: Re: Gtk+ 2.6.10 w/ newer Glibs
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
X-List-Received-Date: Sat, 13 Jan 2007 09:55:52 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, 2007-01-12 at 20:43 +0100, Michael 'Mickey' Lauer wrote:
> Since .dev upgraded gnome-vfs and removed gnome-vfs-dbus, gnome-vfs is
> no longer buildable against an old (<= 2.9.4) glib. Gtk+ 2.6.10 (which is still
> in wide use today) again is not buildable against newer glib variants.
> 
> Any glib / Gtk+ experts to fix the problem? The first issue out is
> here:

I asked someone:

> |  arm-linux-gcc ... -DG_DISABLE_DEPRECATED

G_DISABLE_DEPRECATED tells GLib to hide all deprecated functions.  They
still exist in the library, but they are hidden in the headers.  It's
considered bad form to do this in release code, because sometimes people
want to run older apps against newer libraries.

> | ../../../gtk/gtkstatusbar.h:68: error: expected
specifier-qualifier-list before 'GMemChunk'

GMemChunk was deprecated in GLib 2.10.

To fix this there needs to be a patch that removes
-DG_DISABLE_DEPRECATED from every Makefile.am.

Cheers,

Richard



