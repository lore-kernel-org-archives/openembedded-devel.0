Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PgfE4-0000gn-1l for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 16:18:04 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PgfDO-0005KE-KW for openembedded-devel@lists.openembedded.org;
	Sat, 22 Jan 2011 16:17:22 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 16:17:22 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Jan 2011 16:17:22 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Sat, 22 Jan 2011 16:17:10 +0100
Message-ID: <ihesdm$v7u$1@dough.gmane.org>
References: <1295654503-26379-1-git-send-email-lm@larsmichelsen.com>	<ihedau$stf$1@dough.gmane.org>	<4D3AC11C.2040602@larsmichelsen.com>	<4D3AC6F0.4050802@xora.org.uk>	<ihel1v$tnt$1@dough.gmane.org>
	<4D3ADC2C.6070506@larsmichelsen.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D3ADC2C.6070506@larsmichelsen.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] mplayer_svn: Package can be built again; Bumped to rev. 31329.
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
X-List-Received-Date: Sat, 22 Jan 2011 15:18:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 22-01-11 14:31, Lars Michelsen wrote:
> Hello,
> 
>>> A recipe can have multiple svn sources, so you can fetch ffmpeg into a
>>> seperate directory then move it into the mplayer one overwriting
>>> whatever mplayer checked out.
>>
>> Ffmpeg isn't using svn anymore, so if mplayer is using svn remote, it
>> won't get updated since last week.
> 
> wow, things are changing fast. I checked out the current mplayer repo
> and it still fetches the svn repositories. But we are using old
> revisions - so this would be OK for the moment.
> 
> In a long term the mplayer_svn package could be replaced by mplayer_git
> package. mplayer_git could make use of ffmpeg git repo then, right?
> 
> So what does this mean for the mplayer_svn patch? Should I invest time
> to make it use several subversion repositories instead of the sub
> repositories?

Looking closer at your patch, it looks like you're working off an old tree:

http://cgit.openembedded.org/cgit.cgi/openembedded/commit/?id=9a3e44e3d3d69ab9e1e4e1e3338afaed2b97fb65

Your patch is also missing the hardfp fix that is needed to actually
make it work.

Could you try the current recipe and see if it works for you? It works
on my omap3 boards quite well, minus a dlopen() buglet in libdvdcss2.

regards,

Koen

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNOvT2MkyGM64RGpERAjJ+AJ4uFl1okywMkeiI5qkWnLAFL4cPJgCfR0TZ
ihgltc+c8QBUGwoyvE3uu5U=
=I/6U
-----END PGP SIGNATURE-----



