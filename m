Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <sledz@dresearch-fe.de>) id 1RTvht-00073c-Sl
	for openembedded-devel@lists.openembedded.org;
	Fri, 25 Nov 2011 14:20:45 +0100
Received: by wwo1 with SMTP id 1so4941586wwo.24
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2011 05:14:11 -0800 (PST)
Received: by 10.227.205.135 with SMTP id fq7mr21492392wbb.19.1322226851454;
	Fri, 25 Nov 2011 05:14:11 -0800 (PST)
Received: from fensuse.internal.dresearch-fe.de
	(pd95cb174.dip0.t-ipconnect.de. [217.92.177.116])
	by mx.google.com with ESMTPS id z35sm788712wbm.12.2011.11.25.05.14.10
	(version=SSLv3 cipher=OTHER); Fri, 25 Nov 2011 05:14:10 -0800 (PST)
Message-ID: <4ECF94A1.9050803@dresearch-fe.de>
Date: Fri, 25 Nov 2011 14:14:09 +0100
From: Steffen Sledz <sledz@dresearch-fe.de>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <201111092321.33622.schnitzeltony@gmx.de>
	<2977361.KIYvSC26hZ@helios> <j9g8hi$43b$1@dough.gmane.org>
	<1627207.pd1HnObREr@helios>
In-Reply-To: <1627207.pd1HnObREr@helios>
X-Enigmail-Version: 1.3.3
Subject: Re: systemd packages -> image
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
X-List-Received-Date: Fri, 25 Nov 2011 13:20:46 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 10.11.2011 11:35, Paul Eggleton wrote:
> On Thursday 10 November 2011 11:20:34 Koen Kooi wrote:
>> So I can start sending patches to add the systemd files to ${PN} in oe-core
>> recipes now?
> 
> I would think if these additions are conditional upon systemd being in 
> DISTRO_FEATURES, I can't see a problem. I think the ideal situation would be 
> to have a generic "init" bbclass (or some better name) which does all the work 
> for you regardless of whether sysvinit or systemd is used (i.e. it would 
> effectively replace update-rc.d.bbclass), and save having to have packaging 
> boilerplate in every recipe.

What about upstart in this context? An generic "init" bbclass should support this too.

> My main point was, yes there are both people who want to stay with sysvinit 
> and people who are keen to move to systemd, but I'm not convinced both of 
> those need to be catered for within the same distro policy.
> 
>> That's the big hold up: lack of vision from the OE-core folks.
> 
> This is a community project, if you have ideas or suggestions, just start the 
> discussion...

-- 
DResearch Fahrzeugelektronik GmbH
Otto-Schmirgal-Str. 3, 10319 Berlin, Germany
Tel: +49 30 515932-237 mailto:sledz@dresearch-fe.de
Fax: +49 30 515932-299
Geschäftsführer: Dr. Michael Weber, Werner Mögle;
Amtsgericht Berlin Charlottenburg; HRB 130120 B;
Ust.-IDNr. DE273952058


