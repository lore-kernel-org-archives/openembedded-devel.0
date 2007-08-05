Received: from [212.47.7.226] (helo=ns.penguin.cz)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <utx@penguin.cz>) id 1IHmYa-0001Pj-Um
	for openembedded-devel@lists.openembedded.org;
	Sun, 05 Aug 2007 22:18:33 +0200
Received: from localhost (localhost [127.0.0.1])
	by ns.penguin.cz (Postfix) with ESMTP id 7862D309B4ED
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2007 22:16:12 +0200 (CEST)
Received: from ns.penguin.cz ([127.0.0.1])
	by localhost (penguin [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 06732-03
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 5 Aug 2007 22:16:12 +0200 (CEST)
Received: from [192.168.1.2] (7-165-207-85.strcechy.adsl-llu.static.bluetone.cz
	[85.207.165.7]) by ns.penguin.cz (Postfix) with ESMTP id 1C6B4309B3EA
	for <openembedded-devel@lists.openembedded.org>;
	Sun,  5 Aug 2007 22:16:11 +0200 (CEST)
From: Stanislav Brabec <utx@penguin.cz>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1186313563.5962.36.camel@localhost.localdomain>
References: <46B1753D.1090507@dominion.kabel.utwente.nl>
	<46B1B6DB.6020603@klever.net>	<1186053831.5972.222.camel@hammer.suse.cz>
	<46B1C71F.2090608@klever.net>	<1186058282.5972.232.camel@hammer.suse.cz>
	<46B1D0DA.5030905@balister.org>	<1186061255.5972.243.camel@hammer.suse.cz>
	<46B1E063.7010407@dominion.kabel.utwente.nl>
	<1186064138.5972.259.camel@hammer.suse.cz>
	<46B1E812.8020706@dominion.kabel.utwente.nl>
	<1186066059.5972.269.camel@hammer.suse.cz>	<46B1F78F.4040700@klever.net>
	<46B1FC60.6030908@dominion.kabel.utwente.nl>
	<46B1FDD8.8000404@klever.net>
	<46B20D9F.70704@dominion.kabel.utwente.nl>
	<1186093013.6626.57.camel@localhost.localdomain>
	<1186132901.5972.314.camel@hammer.suse.cz>
	<1186313563.5962.36.camel@localhost.localdomain>
Date: Sun, 05 Aug 2007 22:16:09 +0200
Message-Id: <1186344969.10980.7.camel@utx.utx.cz>
Mime-Version: 1.0
X-Mailer: Evolution 2.8.2 
X-Virus-Scanned: by amavisd-new-20030616-p10 (Debian) at penguin.cz
Subject: Re: Gstreamer and rpath
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sun, 05 Aug 2007 20:18:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Richard Purdie wrote: 

> > A random idea:
> > 
> > Define TARGET_ROOT_MAP, which may use similar syntax like overlay
> > filesystems have. It will allow to construct sysroot by these
> > filesystems on fly as well, e. g. for use with emulators.
> 
> That would be a much nicer solution. Staging could them have its own
> mapping and it should solve most of the problems we see. Have you any
> idea how difficult that would be to implement?

I guess that a short time solution would be a wrapper script on top of
gcc - applications will call this wrapper, it will rewrite command line
arguments and then call gcc. It could also work with older versions of
gcc without any backporting.

Long time solution would be implementing this upstream in gcc and all
automake checks.

I guess that there is several use cases, where target-root-map would be
more flexible than sysroot: noarch<platform<model (used in OE) and
basesystem_root<addon_root.

I am not sure, whether libtool will require modifications or not.


________________________________________________________________________
Stanislav Brabec
http://www.penguin.cz/~utx/zaurus



