Received: from mail2.zera.de ([62.225.102.139])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <a.mueller@zera.de>) id 1NfUTG-0006VZ-3Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 09:32:25 +0100
Received: from s-zera-ex01.zera.local ([192.168.7.1]) by
	s-zera-ex01.zera.local ([192.168.7.1]) with mapi;
	Thu, 11 Feb 2010 09:29:40 +0100
From: =?iso-8859-1?Q?M=FCller=2C_Andreas?= <a.mueller@zera.de>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Feb 2010 09:29:39 +0100
Thread-Topic: [oe] xfwm4 themes from xfwm4-themes are not packed
Thread-Index: AcqqllTIUGHa9KlmT8anmoJ45RIzGgAWNqGg
Message-ID: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2DA@s-zera-ex01.zera.local>
References: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>
	<001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
In-Reply-To: <001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
Accept-Language: de-DE
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
acceptlanguage: de-DE
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 62.225.102.139
X-SA-Exim-Mail-From: a.mueller@zera.de
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
X-List-Received-Date: Thu, 11 Feb 2010 08:32:25 -0000
Content-Language: de-DE
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Hi John,

Thanks for support.

While you are working on that (you offered support -> I ask for more :-):

How about adding recipes for slim also? I stole the recipe&patches from git=
://git.openpandora.org/openpandoraoe.git. The only modifications to get it =
work was
1. Add sessreg in my recipe (although it is part RDEPEND within slim_1.3.1.=
bb ?)
2. On the target I need to cp /etc/xdg/xfce4/xinitrc /home/<LoginUser>/.xin=
itrc. I wanted to modify the recipe in that way that login_cmd links direct=
ly to the file /etc/xdg/xfce4/xinitrc but...

Best Regards

Andreas

-----Urspr=FCngliche Nachricht-----
Von: John Willis [mailto:John.Willis@Distant-earth.com]
Gesendet: Mittwoch, 10. Februar 2010 22:06
An: openembedded-devel@lists.openembedded.org
Betreff: Re: [oe] xfwm4 themes from xfwm4-themes are not packed

Dear Andreas,

> I created a recipe for xfce/xfwm4/slim. After everything working fine
> so far, I tried to make it more colorful and check the xfwm4-themes.
> Doing so, I had to realize that all the themes coming from xfwm4-
> themes(-4.6.0) are not packed and are not found in rootfs
> /usr/share/themes. The themes included in xfwm4 can be found.

Most of the Xfce 4.6.* work was done by myself and while I have not
encountered any issues with the themes for the Xfce Window Manager I can se=
e
after reviewing the recipes that there is some room for improvement in the
xfwm4-themes recipe (your quite right, it's not working as it should and is
also not very clever).

Leave this with me for a few days and I'll get things cleaned up and
submitted for inclusion in OpenEmbedded.

Regards,

John Willis



_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

http://www.zera.de

ZERA  GmbH, Hauptstrasse 392, 53639 Koenigswinter
Geschaeftsfuehrer:  Dr. Prosper Suwelack, Rainer Otto
Sitz der Gesellschaft:  Koenigswinter; Handelsregister HRB  7073
Registergericht: Amtsgericht Siegburg.

-----------------------------------------------------------------


