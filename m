Received: from mail.gmx.net ([213.165.64.20])
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <Schnitzeltony@gmx.de>) id 1NfaYp-0008CB-QK
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Feb 2010 16:02:34 +0100
Received: (qmail 26078 invoked by uid 0); 11 Feb 2010 14:59:57 -0000
Received: from 62.225.102.139 by www078.gmx.net with HTTP;
	Thu, 11 Feb 2010 15:59:54 +0100 (CET)
Date: Thu, 11 Feb 2010 15:59:55 +0100
From: =?iso-8859-1?Q?=22Andreas_M=FCller=22?= <Schnitzeltony@gmx.de>
In-Reply-To: <008001caab15$c1fe4590$45fad0b0$@Willis@Distant-earth.com>
Message-ID: <20100211145955.234260@gmx.net>
MIME-Version: 1.0
References: <B5065796495AFE4CA0A151FCB7BAE0120423EDC2B7@s-zera-ex01.zera.local>
	<001001caaa94$d93632d0$8ba29870$@Willis@Distant-earth.com>
	<008001caab15$c1fe4590$45fad0b0$@Willis@Distant-earth.com>
To: openembedded-devel@lists.openembedded.org
X-Authenticated: #62780362
X-Flags: 0001
X-Mailer: WWW-Mail 6100 (Global Message Exchange)
X-Priority: 3
X-Provags-ID: V01U2FsdGVkX1//NmBs0WH/pnf6rB19/x+UR5M3ITCMlCGwMcA+bM
	hl3HK1PbqwX5OWCka8mISjRLxb0IGJqIcuUw== 
X-GMX-UID: XylGeLNsPTR+Fv3AjDEwGhQ5c2tpZEvM
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
X-List-Received-Date: Thu, 11 Feb 2010 15:02:35 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: 8bit

Dear John,

I got your new recipe and did bake

- with xfwm4-themes -> OK all themes could be found on target
- with specific xfwm4-theme-* -> OK only the selected themes appear in rootfs
- (minor issue & related to xfwm4 I think) with xfwm4-theme-foo: No complain..

Thanks a lot for quick mending!

Andreas

-------- Original-Nachricht --------
> Datum: Thu, 11 Feb 2010 12:28:44 -0000
> Von: "John Willis" <John.Willis@Distant-earth.com>
> An: openembedded-devel@lists.openembedded.org
> Betreff: Re: [oe] xfwm4 themes from xfwm4-themes are not packed

> Dear Andreas,
> 
> > > I created a recipe for xfce/xfwm4/slim. After everything working fine
> > > so far, I tried to make it more colorful and check the xfwm4-themes.
> > > Doing so, I had to realize that all the themes coming from xfwm4-
> > > themes(-4.6.0) are not packed and are not found in rootfs
> > > /usr/share/themes. The themes included in xfwm4 can be found.
> > 
> > Most of the Xfce 4.6.* work was done by myself and while I have not
> > encountered any issues with the themes for the Xfce Window Manager I
> > can see
> > after reviewing the recipes that there is some room for improvement in
> > the
> > xfwm4-themes recipe (your quite right, it's not working as it should
> > and is
> > also not very clever).
> 
> To follow up on this I have done some quick refactoring of
> recipes/xfce-base/xfwm4-themes_4.6.0.bb and published the results to my
> tree
> at
> http://git.openpandora.org/cgi-bin/gitweb.cgi?p=openembedded.git;a=shortlog;
> h=op.openembedded.dev (Your already familiar with the OP trees so I assume
> you will have no issues cherry picking off the commit).
> 
> The package now packs up all 80+ :-o XFWM4 extra themes correctly and also
> creates a xfwm4-themes meta package that depends on all the themes. 
> 
> This means that you can now add any one of the 80 odd themes to your image
> explicitly or (better) just add xfwm4-themes to your image to have it drag
> in every extra theme that is not part of the xfwm4 core package.
> 
> If you could test this and report back I would appreciate it, assuming all
> looks ok I'll request this patch is pushed into OE mainline.
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
GRATIS für alle GMX-Mitglieder: Die maxdome Movie-FLAT!
Jetzt freischalten unter http://portal.gmx.net/de/go/maxdome01


