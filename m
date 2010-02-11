Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Schnitzeltony@gmx.de>) id 1NfW1V-0000qI-W4
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 11:11:53 +0100
Received: (qmail 25778 invoked by uid 0); 11 Feb 2010 10:02:32 -0000
Received: from 62.225.102.139 by www022.gmx.net with HTTP;
	Thu, 11 Feb 2010 11:02:29 +0100 (CET)
Date: Thu, 11 Feb 2010 11:02:29 +0100
From: =?iso-8859-1?Q?=22Andreas_M=FCller=22?= <Schnitzeltony@gmx.de>
In-Reply-To: <005a01caaaff$9fbff3e0$df3fdba0$@Willis@Distant-earth.com>
Message-ID: <20100211100229.106710@gmx.net>
MIME-Version: 1.0
References: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>
	<001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
	<B5065796495AFE4CA0A151FCB7BAE0120423EDC2DA@s-zera-ex01.zera.local>
	<005a01caaaff$9fbff3e0$df3fdba0$@Willis@Distant-earth.com>
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #62780362
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1883t0m2Cw86jwmaccyJABVpnN6Zh5QJ629+BjYKU
	BJ115ksdghrMSc5yqSzoUpJAjrQn8Cf+TGrg== 
X-GMX-UID: h+xLfpNabmwoIriB1TRLS8pPUzc4chGe
X-FuHaFi: 0.56999999999999995
X-SA-Exim-Connect-IP: 213.165.64.20
X-SA-Exim-Mail-From: Schnitzeltony@gmx.de
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
X-List-Received-Date: Thu, 11 Feb 2010 10:11:53 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

LOL & thanks a lot I will check the pandora-skel.bb

-------- Original-Nachricht --------
> Datum: Thu, 11 Feb 2010 09:50:18 -0000
> Von: "John Willis" <John.Willis@Distant-earth.com>
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] xfwm4 themes from xfwm4-themes are not packed

> Dear Andreas,
> 
> > While you are working on that (you offered support -> I ask for more :-
> > ):
> 
> The SLiM recipes you grabbed are also mine ;) (I am the main OE/Angstrom
> dev
> for OpenPandora).
>  
> > How about adding recipes for slim also? I stole the recipe&patches from
> > git://git.openpandora.org/openpandoraoe.git. The only modifications to
> > get it work was
> > 1. Add sessreg in my recipe (although it is part RDEPEND within
> > slim_1.3.1.bb ?)
>  
> Those recipes need more work (there are a few nasty bugs in SLiM not
> passing
> in the session variable correctly that makes a mess of xinitrc session
> selection). I need to take some time to look at them.
> 
> That's the sole reason they are not proposed for OE yet and are sitting in
> my 'OpenPandora hacky stuff' overlay tree ;-).
> 
> > 2. On the target I need to cp /etc/xdg/xfce4/xinitrc
> > /home/<LoginUser>/.xinitrc. I wanted to modify the recipe in that way
> > that login_cmd links directly to the file /etc/xdg/xfce4/xinitrc but...
> 
> For 2 take a look at recipes/pandora-system/pandora-skel.bb in the same
> repository. That's how we install a .xinitrc for all users on the
> OpenPandora (making use of /etc/skel).
> 
> Regards,
> 
> John
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
NEU: Mit GMX DSL über 1000,- ¿ sparen!
http://portal.gmx.net/de/go/dsl02


