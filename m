Received: from mail-fx0-f209.google.com ([209.85.220.209])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1NA08P-0000qc-9p
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 12:52:44 +0100
Received: by fxm1 with SMTP id 1so5239892fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 03:51:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=J7+GNjSeCYcSxw9jX6m3fjW5qKPDNGQJkbCc1WvTMkY=;
	b=hC7QnsTtH9rWbzC88wkyHLQb04Rgx9GZ8kI4WrwhOftEcbongdn5ratJLPWopZMuG9
	L2ZafdsQqWWk/GffkyNRGYYl9EexDLIU/w3I79EltLlS/dVP73BzDWaSahuymARxx4ur
	uvjUPOxprfCnNJSXOhQnRmdvY1kjPaUD7MLdo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=RbJ3W62kjy0+6kJgUiMHFuVYHEoR5E9ugvzE2s0vpwoYG5U00jZtnwfhYe6zllnko9
	x2+US7EOc7+68UCU3uqaR13vNLoETMsnrkKjSeLAI4mFzZY+D5AysnqvNagdgsj62QQU
	epjreX4ERvY7Zs7Vl/XE4+GZS7VxX5g+uGmAM=
Received: by 10.204.8.138 with SMTP id h10mr4173433bkh.187.1258372278873;
	Mon, 16 Nov 2009 03:51:18 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm756812fxm.6.2009.11.16.03.51.17
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 16 Nov 2009 03:51:17 -0800 (PST)
Date: Mon, 16 Nov 2009 12:51:15 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20091116115115.GA23383@jama>
References: <20091115163618.GA3317@jama> <hdr31n$8b0$1@ger.gmane.org>
	<1258364356.5799.94.camel@dax.rpnet.com>
	<hdra17$t4d$1@ger.gmane.org>
	<1258368570.5799.99.camel@dax.rpnet.com>
	<hdrb9v$1dp$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <hdrb9v$1dp$1@ger.gmane.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.209
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: SRCPV migration
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
X-List-Received-Date: Mon, 16 Nov 2009 11:52:44 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Nov 16, 2009 at 11:59:10AM +0100, Koen Kooi wrote:
> On 16-11-09 11:49, Richard Purdie wrote:
> >On Mon, 2009-11-16 at 11:37 +0100, Koen Kooi wrote:
> >>So basically every recipe that is using SRCPV in PV or PR is unsuitable
> >>to be put in online feeds. That should be enough to stop the SRCPV merge
> >>into .dev.
> >
> >How is this different to the current situation though?
> 
> In the current situation (actually, last weeks situation) SRCPV was
> never used.
> 
> >If SRCREV is locked down you will get 1 as the local build revision back
> >and it will not change and will be the same for everyone.
> 
> >If its not locked down, all bets are off but they always have been - no
> >change.
> 
> Ah, that was the bit of info I was missing. But if SRCREV is locked
> down (as it should!) what's the point of putting SRCPV in PV or PR?
> It seems to make things worse if you update a locked SRCREV, since
> SRCPV will remain '1'.
> 
> regards,
> 
> Koen

Hi,

I'm not sure if this is 100% right but it behaves like this here:

with AUTOREV used as SRCREV you get ${SRCREV} in format
gitrNNNN+hash
where NNNN is localcount incremented on buildhost every time you build
that recipe AND hash is changed

if you have fixed SRCREV then without SRCPV you get just gitrHash which 
can be < gitrNNNN+hash or > gitrNNNN+hash depending on actual hash value.
That's why you cannot switch between SRCREV and SRCPV without PE bump.

If there is SRCPV in PV and you're using fixed SRCREV than you don't
need to bump PR in cases like this 
./xorg-proto/calibrateproto_git.bb:PV = "0.0+${PR}+gitr${SRCPV}"
because +gitr${SRCPV} will create non-decreasing sequence as localcount
will be incremented every time you bump fixed SRCREV for that recipe AND
build it.

You're right that there can be inconsistency between builders if one ie
you're changing fixed srcrev every day and rebuild it on that buildhost
and othere buildhost is rebuilding that package once a month.

If all your builders are building all your targets every day and you're
not changing fixed SRCREV more then once a day, you need to sync
bb_persist_data.sqlite3 only for new builder or after some failures
(which I know is quite error-prone :().

This inconsistency can be fixed imho only by sharing 
tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite3 between hosts
(better using some online database access for getting localcounts)

sqlite3 ../tmpdir-dev-shr/cache/om-gta02/bb_persist_data.sqlite3 
"select * from BB_URI_LOCALCOUNT where key like '%kernel.git-linux-openmoko-shr-drm-devel_count';"
git:git.openmoko.org.git.kernel.git-linux-openmoko-shr-drm-devel_count|5

regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


