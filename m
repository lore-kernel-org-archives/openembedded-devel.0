Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PsFij-0008LH-EA for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 15:29:38 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PsFhN-00018z-JU for openembedded-devel@lists.openembedded.org;
	Wed, 23 Feb 2011 15:28:13 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 15:28:13 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 23 Feb 2011 15:28:13 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 23 Feb 2011 15:28:01 +0100
Message-ID: <ik35hh$oll$1@dough.gmane.org>
References: <1297606132-19861-1-git-send-email-filip.zyzniewski@gmail.com>	<1297709209-6602-1-git-send-email-filip.zyzniewski@gmail.com>	<ik29om$8m7$1@dough.gmane.org>	<AANLkTimvzFij9bx0J8PbaWv1+_9TG4p4+vHPQH2DZnvV@mail.gmail.com>	<4D64CAC1.8050100@eukrea.com>
	<AANLkTi=2a4s-CfSktJ8P3MHSSg78ZU0CrFYqK+YuxiKq@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <AANLkTi=2a4s-CfSktJ8P3MHSSg78ZU0CrFYqK+YuxiKq@mail.gmail.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCHv2] linux-firmware: split into bus specific packages.
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
X-List-Received-Date: Wed, 23 Feb 2011 14:29:38 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 23-02-11 14:26, Filip Zyzniewski wrote:
> On 2/23/11, Eric Benard <eric@eukrea.com> wrote:
>> As already said before, there is an other version of this recipe in
>> recipes/firmwares/linux-firmware.inc
>> which is already splitted in small packages for some firmware such as :
>> firmware-atheros-ar9271.bb
>> firmware-marvell-sd8688_10.38.1-p25.bb
> 
> So you suggest removing recipes/linux-firmware altogether?
> If so, recipes/firmwares/linux-firmware.inc would need a lot of
> reshaping to provide what I need (bus specific packages).

I have no strong opinion on that, but I need a wl12xx package before the
end of the week due to deadlines, so I added that to the existing
linux-firmware recipe.

FWIW, if the split goes thru, proper licensing info needs to get added
to the subpackages as well.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNZRlxMkyGM64RGpERAnZiAJ9zUQNuUAMJ/BCnUNQ7j9SoIMFjRACaAtVR
/crz6+iArTErc59iLcP/yUA=
=idnZ
-----END PGP SIGNATURE-----



