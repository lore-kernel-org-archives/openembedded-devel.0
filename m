Received: from mta5.brinkster.com ([65.182.109.74])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <John.Willis@Distant-earth.com>) id 1NXAqZ-0002dN-T1
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Jan 2010 10:58:07 +0100
Received: from localhost (localhost.localdomain [127.0.0.1])
	by mta5.brinkster.com (Postfix) with ESMTP id 395442C0618
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 04:55:44 -0500 (EST)
X-Virus-Scanned: amavisd-new at 
Received: from mta5.brinkster.com ([127.0.0.1])
	by localhost (mta5.brinkster.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jhAQbGmL5yPj
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 04:55:40 -0500 (EST)
Received: from MareImbrium (82-46-19-72.cable.ubr02.bath.blueyonder.co.uk
	[82.46.19.72])
	by mta5.brinkster.com (Postfix) with ESMTP id 88EB82C0F69
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 04:55:39 -0500 (EST)
From: "John Willis" <John.Willis@Distant-earth.com>
To: <openembedded-devel@lists.openembedded.org>
References: <alpine.LFD.2.00.1001190305430.13206@localhost>
In-Reply-To: <alpine.LFD.2.00.1001190305430.13206@localhost>
Date: Tue, 19 Jan 2010 09:55:17 -0000
Message-ID: <01e501ca98ed$823fa280$86bee780$@Willis@Distant-earth.com>
MIME-Version: 1.0
X-Mailer: Microsoft Office Outlook 12.0
Thread-Index: AcqY4A6wdKBHrgPrSoCYjS+Rzqei3QACR/Fg
X-SA-Exim-Connect-IP: 65.182.109.74
X-SA-Exim-Mail-From: John.Willis@Distant-earth.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: tinderbox, bug reports and a freshly-broken mplayer
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
X-List-Received-Date: Tue, 19 Jan 2010 09:58:07 -0000
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
Content-Language: en-us

Robert,

>   in order to keep the peace, i'm more than willing to file actual OE
> bug reports for breakage i discover when building.  specifically, i'm
> almost always trying to build beagleboard-demo-image on my up-to-date
> fedora system, which seems to be a relatively unpopular working system
> for most people here (except for philip b.), so i'm getting used to
> running into breakage that no one else is seeing -- it's just a fact
> of life.
> 
>   ignoring gnome-games for now, after a recent "git pull" on the OE
> dev branch, the "mplayer" package now no longer builds.  from the git
> log, i can see:

<snip>

On the gnome-games front, I have been messing with gnome-games packages for
something else (unrelated to the BB-demo image). I can mail you a few BB's
to try if you want but none of it is working 100% yet (newer versions of
gnome-games introduce requirements for OpenGL/Clutter etc. and that opens a
whole world of pain).

>   if i "git reset" to the commit just before that, it builds fine;
> ergo, that seems to be the commit that broke it.  a wild guess is that
> the "maxrev" parameters are the cause, given that at least one now
> falls below the requested svn revision, causing an essential patch to
> no longer be applied, but that's just a guess until i look more
> closely.

<snip>

If you have a hunch on the patch then give it a go, or drop down the SRCREV
for a few days until someone else can get around to fixing the issue, I
suspect this bug will be seen widely (in fact I reproduced it on my setup
with a fresh pull of mplayer_svn.bb on a Ubuntu build host yesterday). Your
hunch seems good but I have no time to personally look at this now.

>   so ... i can file this over at http://bugs.openembedded.net/ if
> that's the way to go.  but others were talking about this tinderbox
> thing, which i've never used.  a quick glance suggests it's a more
> formal, automated way of doing regular builds.  would that be
> appropriate for me, if it's understood i'm always building on the same
> distro?  feel free to point me at a quick intro, or i'll just file a
> regular bug if that's the way to go.

Let's be honest, you're never going to go too far wrong raising a bug report
;).

As for TinderBox, I did include some links in an earlier mail 

"I think Phil (or someone else) suggest you consider contributing your build
logs to OESTATS/TinderBox
(http://wiki.openembedded.net/index.php/How_do_I_send_automatic_success_and_
failure_reports) at least with that setup you leave a reference the failing
logs in bug reports/mails so people can have a look into all the gory
details :)." 

It only takes a few minor changes to your local.conf and all your build logs
and build status are automatically uploaded to the server. This makes
diagnosing build issues/collective debugging etc. that little bit easier as
anyone can go to http://tinderbox.openembedded.org/builders/<your_nick> and
see what your builds and failures and dig into the logs. If you worried
about personal info. being uploaded then check into oestats-client.bbclass
to see what is happening under the hood.

To prove a point this is a link to the failed mplayer build I did yesterday
(http://tinderbox.openembedded.org/packages/431300/).

Regards,

John




