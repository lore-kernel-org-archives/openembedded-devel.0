Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfUdC-0002oT-6A for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 09:42:41 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NfUaj-0008Tx-DO for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 09:40:05 +0100
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 09:40:05 +0100
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 09:40:05 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 11 Feb 2010 09:39:23 +0100
Message-ID: <hl0fnq$nio$2@ger.gmane.org>
References: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>	<001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
	<B5065796495AFE4CA0A151FCB7BAE0120423EDC2DA@s-zera-ex01.zera.local>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.7) Gecko/20100130 Shredder/3.0.2pre
In-Reply-To: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2DA@s-zera-ex01.zera.local>
X-Enigmail-Version: 1.0.1
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: xfwm4 themes from xfwm4-themes are not packed
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
X-List-Received-Date: Thu, 11 Feb 2010 08:42:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 11-02-10 09:29, Müller, Andreas wrote:
> Hi John,
> 
> Thanks for support.
> 
> While you are working on that (you offered support -> I ask for more :-):
> 
> How about adding recipes for slim also? I stole the recipe&patches from git://git.openpandora.org/openpandoraoe.git. The only modifications to get it work was
> 1. Add sessreg in my recipe (although it is part RDEPEND within slim_1.3.1.bb ?)
> 2. On the target I need to cp /etc/xdg/xfce4/xinitrc /home/<LoginUser>/.xinitrc. I wanted to modify the recipe in that way that login_cmd links directly to the file /etc/xdg/xfce4/xinitrc but...

For 2. you should be able to add said .xinitrc to /etc/skel/ so every
new user will get it.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFLc8I7MkyGM64RGpERAh78AKCDE0xaPt8VA3gZ3DnpZTS2pfMN4gCgk4ks
bBEGtoLUfNKfvYpylH7Yb90=
=ODO+
-----END PGP SIGNATURE-----



