Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Jtlse-0008L8-VM
	for openembedded-devel@openembedded.org; Wed, 07 May 2008 17:48:33 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jtls5-0003KK-97
	for openembedded-devel@openembedded.org; Wed, 07 May 2008 15:47:57 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 07 May 2008 15:47:57 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 07 May 2008 15:47:57 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Wed, 07 May 2008 17:47:46 +0200
Message-ID: <fvsiv3$mc3$1@ger.gmane.org>
References: <fvpr9t$4vh$1@ger.gmane.org>	<fvq5c7$alo$1@ger.gmane.org>	<fvrtn6$93p$1@ger.gmane.org>	<fvs0bo$h8r$1@ger.gmane.org>	<fvs8g9$de9$1@ger.gmane.org>
	<4821B0B5.6060701@balister.org>
	<1210169760.5440.31.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 3.0a1pre (Macintosh/2008040803)
In-Reply-To: <1210169760.5440.31.camel@dax.rpnet.com>
Sender: news <news@ger.gmane.org>
Subject: Re: bp flag added to bug tracker (org.openembedded.stable)
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Wed, 07 May 2008 15:48:33 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Wed, 2008-05-07 at 09:37 -0400, Philip Balister wrote:
>> Another case you should think of is that it is likely that .stable will
>> start to have changes that do not make sense for .dev. Also with time
>> .stable will be "replaced" with a new branch from .dev. (I use the
>> quotes, because the original branch may have users for a long time).
>
> On this note, I would like to raise the question of whether a new
> 'stable' branch may make sense and make a better target to organise
> effort around?

Since .stable is actually the second stable branch I can say from 
experience: "not really".

The current branch was started with the aim of being stable (sic) and 
supported for a defined period. From the announcement:

"The stable branch is not intended to keep up with the pace of
development on the development branch. Planned is to create new stable
branches every year; the next stable branch is scheduled to branch of
the development tree during 2008.12. Old stable branches will go in
unmaintained mode 3 months after a new stable branch is created; the
current stable will retire 2009.2."

Since there is at least one company basing products on it 
(http://linuxdevices.com/news/NS6292990557.html) we would be stupid to 
start a new one right now. If we go back on our promises like that, we 
can just stop pretending we care about stability and tell everyone to 
use .dev.

> I ask since we've had a round of fairly invasive changes
> to .dev, hopefully for the better and syncing between this and the older
> stable branch is going to get painful.

"The stable branch is not intended to keep up with the pace of
development on the development branch."

We saw the merge problems coming and that's why we have the review 
process, since applying diffs 1:1 isn't possible or even wanted.


> I don't know what Angstrom is planning for any new release?

"somewhere in 2008" is the current consensus. The quality of the 2008 
distro has improved a lot lately, thanks to some donations and 
consultant work (the user experience) and of course your 
packaged-staging work (The developer experience).

> I guess a useful question to ask at this point is "Whats brewing
> for .dev in the next six months?"
>
>> From my perspective I see the following *possible* ideas which have the
> potential for disruption:
>
> * a new bitbake release and making this the minimum version for .dev
> * make multimachine.bbclass the default
> * make packaged-staging opt-out
> * resolve some issues I've just noticed with pkgconfig[1]
> * libtool experimentation[2]
>
> [1] pkgconfig.bbclass and autotools.bbclass are now overlapping
> functionality. We can probably drop pkgconfig.bbclass now or at least
> split the staging bit into a separate class since autotools shouldn't
> need it anymore. The functionality in autotools.bbclass should be
> opt-out, not opt-in as it is at present IMO though.
>
> [2] I've been meaning to mail about this for a while. Poky has upgraded
> from 1.5.10 to 2.2.2 and then 2.2.4. This has to be one of the most
> painful things I've ever done. On the plus side, we're down to two
> libtool patches now. I did find two bugs in the 2.2.2 release but these
> have been fixed upstream after I reported them. For .dev, I propose
> adding Poky's recipes as DEFAULT_PREFERENCE = "-1" and then brave souls
> can enable it and fix up their favourite targets or at least report the
> issues. The fixes in Poky should provide a good start.
>
> So all things considered, there isn't anything too disruptive in that
> list IMO. I don't know if anyone else has any infrastructure changes
> planned?

For the stable branch "disruptive" is not really a good metric, "how 
well tested are the changes across the complete OE metadata" is a better 
one.

regards,

Koen



