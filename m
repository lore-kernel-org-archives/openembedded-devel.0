Received: from [130.89.2.8] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1H5T0T-0000Zo-CZ
	for openembedded-devel@openembedded.org; Fri, 12 Jan 2007 21:28:09 +0100
Received: from [172.20.1.5] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	l0CKQ2Lr014202 for <openembedded-devel@openembedded.org>;
	Fri, 12 Jan 2007 21:26:02 +0100
Message-ID: <45A7EED3.9040701@dominion.kabel.utwente.nl>
Date: Fri, 12 Jan 2007 21:25:55 +0100
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.9 (Macintosh/20061207)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <1888834532.20070112204308@vanille-media.de>
In-Reply-To: <1888834532.20070112204308@vanille-media.de>
X-Enigmail-Version: 0.94.1.2
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
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
X-List-Received-Date: Fri, 12 Jan 2007 20:28:09 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Michael 'Mickey' Lauer schreef:
> Since .dev upgraded gnome-vfs and removed gnome-vfs-dbus, gnome-vfs is
> no longer buildable against an old (<= 2.9.4) glib. Gtk+ 2.6.10 (which is still
> in wide use today) again is not buildable against newer glib variants.
> 
> Any glib / Gtk+ experts to fix the problem? The first issue out is
> here:

> | ../../../gtk/gtkclist.h:155: error: expected specifier-qualifier-list before 'GMemChunk'

I think this is caused by the work done on g_slice. You could have a look at backporting
those changes[1].

regards,

Koen


[1] Or use the maemo patches that do that :)

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFFp+7SMkyGM64RGpERAiKrAJ9QEzFmgcYDZ3VHjKmRtLYjhTcAfgCfa9z2
IrzECKchJ+PAsQuiz9knmnI=
=fkQf
-----END PGP SIGNATURE-----


