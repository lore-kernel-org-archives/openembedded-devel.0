Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SWRbN-0000N2-Dj for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 14:20:41 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SWRRZ-00025m-L0 for openembedded-devel@lists.openembedded.org;
	Mon, 21 May 2012 14:10:33 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 14:10:33 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 May 2012 14:10:33 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Mon, 21 May 2012 14:10:22 +0200
Message-ID: <jpdbbe$uj9$1@dough.gmane.org>
References: <1337187361-5043-1-git-send-email-obi@opendreambox.org>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <1337187361-5043-1-git-send-email-obi@opendreambox.org>
X-Enigmail-Version: 1.3.4
Subject: Re: [meta-oe][PATCH] systemd.bbclass: drop postrm, use prerm instead
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
X-List-Received-Date: Mon, 21 May 2012 12:20:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 16-05-12 18:56, Andreas Oberritter schreef:
> * Calling "systemctl disable" from postrm is too late and causes the
> following error:
> 
> | Failed to issue method call: No such file or directory
> 
> * Messing with $D is not needed in *rm scripts.

"Messing" with $D *is* needed in *rm scripts, so this one has been reverted.
Feel free to resend patches with only the postrm/prerm changes.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFPujCtMkyGM64RGpERAioSAJ9ibwFXxdJSPXh7iKMrxM/PiKOgXACfQ0Sc
TUWKlfzL12Y8BJ7gYw3gUBA=
=q4Bf
-----END PGP SIGNATURE-----



