Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RLEUF-0006Xj-0J for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 14:34:43 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RLEOC-0003e9-Jm for openembedded-devel@lists.openembedded.org;
	Tue, 01 Nov 2011 14:28:28 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 14:28:28 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 01 Nov 2011 14:28:28 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 01 Nov 2011 14:28:16 +0100
Message-ID: <j8os5g$837$1@dough.gmane.org>
References: <1320148597-10157-1-git-send-email-schnitzeltony@gmx.de>
	<j8omuq$1ht$1@dough.gmane.org>
	<201111011430.12670.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:7.0.1) Gecko/20110929 Thunderbird/7.0.1
In-Reply-To: <201111011430.12670.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.2
Subject: Re: [meta-gnome] gnome-control-center: fix unshipped packages
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
X-List-Received-Date: Tue, 01 Nov 2011 13:34:44 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 01-11-11 14:30, Andreas Müller schreef:
> On Tuesday, November 01, 2011 12:59:22 PM Koen Kooi wrote:
>> Op 01-11-11 12:56, Andreas Müller schreef:
>>> warnings fixed: WARNING: For recipe gnome-control-center, the 
>>> following files were installed but not shipped in any package: 
>>> WARNING: /usr/share/mime/XMLnamespaces WARNING: 
>>> /usr/share/mime/version WARNING: /usr/share/mime/subclasses WARNING: 
>>> /usr/share/mime/globs2 WARNING: /usr/share/mime/globs WARNING: 
>>> /usr/share/mime/types WARNING: /usr/share/mime/mime.cache WARNING: 
>>> /usr/share/mime/icons WARNING: /usr/share/mime/generic-icons
>>> WARNING: /usr/share/mime/treemagic WARNING:   /usr/share/mime/magic
>>> WARNING: /usr/share/mime/aliases
>> 
>> THose aren't meant to be shipped, mime.bbclass should already package 
>> the stuff it needs.
> How about adding a dummy package gnome-control-center-mime to clean up 
> log and keep further enthusiastic patchers away?

I'd suggest rm'ing them in do_install

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFOr/PwMkyGM64RGpERAjcOAJ9IIXTIym9euwpKobGw7aW6DSdr9QCeJwGy
Yv/IzPTNjBobD/eoFd7NnaA=
=KwIu
-----END PGP SIGNATURE-----



