Received: from mta7.brinkster.com ([65.182.109.86])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NfVoe-0000Om-Bv
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 10:58:35 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta7.brinkster.com (Postfix) with ESMTP id ADF1E6DCA97
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 04:50:35 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta7.brinkster.com ([127.0.0.1])
	by localhost (mta7.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ght6B1h3dhgp
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 04:50:30 -0500 (EST)
Received: from MareImbrium (cpc1-bath2-0-0-cust327.aztw.cable.virginmedia.com
	[82.46.19.72])
	by mta7.brinkster.com (Postfix) with ESMTP id 142F46DC836
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 11 Feb 2010 04:50:29 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>	<001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
	<B5065796495AFE4CA0A151FCB7BAE0120423EDC2DA@s-zera-ex01.zera.local>
In-Reply-To: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2DA@s-zera-ex01.zera.local>
Date: Thu, 11 Feb 2010 09:50:18 -0000
Message-ID: <005a01caaaff$9fbff3e0$df3fdba0$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcqqllTIUGHa9KlmT8anmoJ45RIzGgAWNqGgAAPW2ZA=
X-SA-Exim-Connect-IP: 65.182.109.86
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
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
X-List-Received-Date: Thu, 11 Feb 2010 09:58:36 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Dear Andreas,

> While you are working on that (you offered support -> I ask for more :-
> ):

The SLiM recipes you grabbed are also mine ;) (I am the main OE/Angstrom dev
for OpenPandora).
 
> How about adding recipes for slim also? I stole the recipe&patches from
> git://git.openpandora.org/openpandoraoe.git. The only modifications to
> get it work was
> 1. Add sessreg in my recipe (although it is part RDEPEND within
> slim_1.3.1.bb ?)
 
Those recipes need more work (there are a few nasty bugs in SLiM not passing
in the session variable correctly that makes a mess of xinitrc session
selection). I need to take some time to look at them.

That's the sole reason they are not proposed for OE yet and are sitting in
my 'OpenPandora hacky stuff' overlay tree ;-).

> 2. On the target I need to cp /etc/xdg/xfce4/xinitrc
> /home/<LoginUser>/.xinitrc. I wanted to modify the recipe in that way
> that login_cmd links directly to the file /etc/xdg/xfce4/xinitrc but...

For 2 take a look at recipes/pandora-system/pandora-skel.bb in the same
repository. That's how we install a .xinitrc for all users on the
OpenPandora (making use of /etc/skel).

Regards,

John




