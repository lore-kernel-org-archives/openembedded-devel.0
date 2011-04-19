Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCAGA-0003jc-89 for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 14:42:27 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1QCADt-0002Ww-Ko for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 14:40:05 +0200
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 14:40:05 +0200
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 14:40:05 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 19 Apr 2011 14:37:38 +0200
Message-ID: <iojvmj$de8$1@dough.gmane.org>
References: <1302727726-9362-1-git-send-email-eyalr@ti.com>	<iojko1$bte$3@dough.gmane.org>
	<BANLkTimCahieiD70bjeSJz=G6oFfTu--Eg@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <BANLkTimCahieiD70bjeSJz=G6oFfTu--Eg@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] wpa-supplicant: Build from git sources
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
X-List-Received-Date: Tue, 19 Apr 2011 12:42:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 19-04-11 14:13, אייל רייזר wrote:
> This naming is used in other recipes building from git.
> Any suggestions of how it should be called instead?

You are entirely right that the filename usually is foo_git.bb, but
there would be something like PV = "x.y.z+git" inside.
This is to ensure upgrade paths from e.g. 0.7.3 to the 0.8rc and 0.8
final release. If I have '0.7.3' installed, upgrading to 'git' is no
problem, but going from 'git' to '0.8.0' would be, since 'git' will sort
higher.
I'm not into wpa-supplicant release versioning, so I don't have the
right solution, but something like

PV = "0.7.3+0.8rc"
PR_append = "gitr${SRCPV}"

should work.

regards,

Koen


> בתאריך 2011 4 19 12:35, מאת "Koen Kooi" <koen@dominion.thruhere.net> :
> On 13-04-11 22:48, Eyal Reizer wrote:
>>>> * Builds a new version 0.8.x which is not released yet as a zip file.
>>>> This version has new features like WIFI-direct used in new mac80211
>>>> versions
>>>>
> 
> Same thing as with hostap-daemon: 'git' is not a valid PV.
> 
>>
>>
_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNrYISMkyGM64RGpERAlbGAKCZCfCJloSSt8qNx3nclhPuG1KwKwCfYH6o
dloJiapREwDLoeMUrdgWGu4=
=9v/S
-----END PGP SIGNATURE-----



