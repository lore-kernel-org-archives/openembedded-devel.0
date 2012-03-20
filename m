Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SA2sP-00007a-0U for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 18:29:41 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SA2jo-00009e-Mp for openembedded-devel@lists.openembedded.org;
	Tue, 20 Mar 2012 18:20:48 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 18:20:48 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Mar 2012 18:20:48 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 20 Mar 2012 18:20:32 +0100
Message-ID: <jkae91$358$1@dough.gmane.org>
References: <1332103254-3729-1-git-send-email-schnitzeltony@googlemail.com>
	<jk7aa6$bjh$1@dough.gmane.org>
	<CALbNGRRx041cARMx4bWrZbOzoCJg5qL5v+i4s+mudXPMKAOgYw@mail.gmail.com>
	<jk7vr4$482$1@dough.gmane.org>
	<CALbNGRR0Z2pFGOxBGNuyPUDd7h1dUCqOLeqHpBM8qOC_3eY-_Q@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:10.0.2) Gecko/20120216 Thunderbird/10.0.2
In-Reply-To: <CALbNGRR0Z2pFGOxBGNuyPUDd7h1dUCqOLeqHpBM8qOC_3eY-_Q@mail.gmail.com>
X-Enigmail-Version: 1.3.5
Subject: Re: [meta-oe 1/6] mpd: initial add 0.16.7
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
X-List-Received-Date: Tue, 20 Mar 2012 17:29:41 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 20-03-12 09:37, Andreas Müller schreef:
> On Mon, Mar 19, 2012 at 8:01 PM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 19-03-12 16:24, Andreas Müller schreef:
>>> On Mon, Mar 19, 2012 at 1:54 PM, Koen Kooi
>>> <koen@dominion.thruhere.net> wrote:
>>>>> +DESC="The Music Player Daemon" +DAEMON=/usr/bin/mpd 
>>>>> +MPDCONF=/etc/mpd.conf
>>>> 
>>>> The above hardcodes $bindir and $sysconfdir, which it shouldn't
>>>> do.
>>> mpd.in + sed in V2. OK?
>> 
>> sound good to me.
>> 
>>>> Furthermore I'd like to stop maintaining our own initsystem in
>>>> meta-oe and switch to upstream initscripts as much as possible
>>> The package itself does not contain an initscript so I implemented
>>> it close to that found in debian-lenny package. What upstream source
>>> do you suggest (matching also above requirement not hardcoding
>>> paths)?
>>> 
>>>> and include systemd units by default as well.
>>> This requirement I did not know and did not find any source for that
>>> - some suggestion?
>> 
>> Fedora or arch should have one.
>> 
>>> 
>>>> The above script is missing LSB headers as well.
>>> This initscript as is does not need.
>> 
>> AIUI OE-core requires lsb headers for all sysvinitscripts and systemd
>> works a lot better when those headers are present as well.
>> 
> Another question: How about adding the mpd stuff into meta-multimedia (
> as a starter - e.g. in subdir recipes-audio )?

That'd be great! We'll need to sort out some of the dependencies, I'm not
sure if meta-mm depends on meta-oe or vice versa.

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk9ovFgACgkQMkyGM64RGpGVjQCfeUmeLu1Wh4XuJm4UQKW/D7Az
BUoAoJUe6rXPN2YdU7S4/VdbQ3Knt7mJ
=KzxL
-----END PGP SIGNATURE-----



