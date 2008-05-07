Received: from [194.106.48.114] (helo=tim.rpsys.net ident=0)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1JtkS1-00053b-L0
	for openembedded-devel@openembedded.org; Wed, 07 May 2008 16:16:57 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m47EGO1U025050
	for <openembedded-devel@openembedded.org>;
	Wed, 7 May 2008 15:16:24 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 24885-02-2 for <openembedded-devel@openembedded.org>;
	Wed,  7 May 2008 15:16:14 +0100 (BST)
Received: from [192.168.1.3] (dax.rpnet.com [192.168.1.3])
	(authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id m47EFxL0025009
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO)
	for <openembedded-devel@openembedded.org>;
	Wed, 7 May 2008 15:15:59 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: openembedded-devel@openembedded.org
In-Reply-To: <4821B0B5.6060701@balister.org>
References: <fvpr9t$4vh$1@ger.gmane.org>	<fvq5c7$alo$1@ger.gmane.org>
	<fvrtn6$93p$1@ger.gmane.org>	<fvs0bo$h8r$1@ger.gmane.org>
	<fvs8g9$de9$1@ger.gmane.org>  <4821B0B5.6060701@balister.org>
Date: Wed, 07 May 2008 15:16:00 +0100
Message-Id: <1210169760.5440.31.camel@dax.rpnet.com>
Mime-Version: 1.0
X-Mailer: Evolution 2.12.1 
X-Virus-Scanned: amavisd-new at rpsys.net
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
X-List-Received-Date: Wed, 07 May 2008 14:16:58 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, 2008-05-07 at 09:37 -0400, Philip Balister wrote:
> Another case you should think of is that it is likely that .stable will 
> start to have changes that do not make sense for .dev. Also with time 
> .stable will be "replaced" with a new branch from .dev. (I use the 
> quotes, because the original branch may have users for a long time).

On this note, I would like to raise the question of whether a new
'stable' branch may make sense and make a better target to organise
effort around? I ask since we've had a round of fairly invasive changes
to .dev, hopefully for the better and syncing between this and the older
stable branch is going to get painful. I don't know what Angstrom is
planning for any new release?

I guess a useful question to ask at this point is "Whats brewing
for .dev in the next six months?"

From my perspective I see the following *possible* ideas which have the
potential for disruption:

* a new bitbake release and making this the minimum version for .dev
* make multimachine.bbclass the default
* make packaged-staging opt-out
* resolve some issues I've just noticed with pkgconfig[1]
* libtool experimentation[2]

[1] pkgconfig.bbclass and autotools.bbclass are now overlapping
functionality. We can probably drop pkgconfig.bbclass now or at least
split the staging bit into a separate class since autotools shouldn't
need it anymore. The functionality in autotools.bbclass should be
opt-out, not opt-in as it is at present IMO though.

[2] I've been meaning to mail about this for a while. Poky has upgraded
from 1.5.10 to 2.2.2 and then 2.2.4. This has to be one of the most
painful things I've ever done. On the plus side, we're down to two
libtool patches now. I did find two bugs in the 2.2.2 release but these
have been fixed upstream after I reported them. For .dev, I propose
adding Poky's recipes as DEFAULT_PREFERENCE = "-1" and then brave souls
can enable it and fix up their favourite targets or at least report the
issues. The fixes in Poky should provide a good start.

So all things considered, there isn't anything too disruptive in that
list IMO. I don't know if anyone else has any infrastructure changes
planned?

Cheers,

Richard




