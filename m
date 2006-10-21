Received: from [130.89.2.9] (helo=smtp.utwente.nl)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <koen@dominion.kabel.utwente.nl>) id 1GbPac-0004Jm-5x
	for openembedded-devel@openembedded.org; Sun, 22 Oct 2006 00:45:14 +0200
Received: from [172.20.1.6] (dominion.kabel.utwente.nl [130.89.193.158])
	by smtp.utwente.nl (8.12.10/SuSE Linux 0.7) with ESMTP id
	k9LMbsFh003459 for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Oct 2006 00:37:54 +0200
Message-ID: <453AA142.4070002@dominion.kabel.utwente.nl>
Date: Sun, 22 Oct 2006 00:37:54 +0200
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
User-Agent: Thunderbird 1.5.0.7 (Macintosh/20060909)
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <453AA01B.5040300@dominion.kabel.utwente.nl>
In-Reply-To: <453AA01B.5040300@dominion.kabel.utwente.nl>
X-Enigmail-Version: 0.94.1.0
X-UTwente-MailScanner-Information: Scanned by MailScanner. Contact
	helpdesk@ITBE.utwente.nl for more information.
X-UTwente-MailScanner: Found to be clean
X-UTwente-MailScanner-From: koen@dominion.kabel.utwente.nl
X-Spam-Status: No
Subject: Re: [Fwd: [oe-commits] org.oe.dev package.bbclass: Fix split_locales to	remove spurious references to -dbg packages. The way it	selects the principle package name needs totally reworking as	the current code is flawed but apply a workaround for now	(this is unrelated to other changes to package.bbclass)]
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 21 Oct 2006 22:45:14 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Koen Kooi schreef:
> Hi,
> 
> Should we bump PR on affected packages if this fix works?

That would be these:

koen@bitbake:~/OE/monotone/org.openembedded.dev/packages$ grep do_split_pac . -rn | awk
'{print $1}' | awk -F_ '{print $1}' |  awk -F: '{print $1}' | uniq
./abiword/abiword-plugins
./dasher/dasher-gpe
./dri/drm-kernel
./gaim/gaim.inc
./gammu/gammu
./glibc/glibc-package.bbclass
./gnome/goffice
./gnome/gnome-vfs-dbus
./gnumeric/gnumeric
./gstreamer/gst-plugins.inc
./gtk+/gtk+
./gtk-engines/gtk-engines
./libxine/libxine-fb
./libxine/libxine-x11
./libxine/libxine
./nonworking/foo/pango
./nonworking/foo/gnome-vfs
./nonworking/foo/gst-plugins
./nonworking/maemo/osso-gnome-vfs2
./opie-help-en/opie-help-en.inc
./opie-reader/opie-reader.inc
./pango/pango
./perl/perl.inc
./qpe-gaim/qpe-libgaim
./timezones/timezones
./xfwm4/xfwm4
./xfwm4/xfwm4.inc
./xfwm4-themes/xfwm4-themes.inc
./xfwm4-themes/xfwm4-themes
./xscreensaver/xscreensaver
./pulseaudio/pulseaudio
./xmms/xmms

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.1 (Darwin)

iD8DBQFFOqFCMkyGM64RGpERAo7AAKC5KqnGgjGZElhb4rJfl8NMMEIBCgCfWOPq
wHTXUY+NQoEq61ksefXe9kI=
=GpWn
-----END PGP SIGNATURE-----


