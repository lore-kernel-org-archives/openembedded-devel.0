Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JZXrI-00028Z-Vm
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 21:47:36 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JZXpG-0005bd-2S
	for openembedded-devel@openembedded.org; Wed, 12 Mar 2008 20:45:26 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 20:45:26 +0000
Received: from koen by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 12 Mar 2008 20:45:26 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <koen@dominion.kabel.utwente.nl>
Date: Wed, 12 Mar 2008 21:45:18 +0100
Message-ID: <fr9fcv$28h$1@ger.gmane.org>
References: <200803110807.11368.zecke@selfish.org>	<20080311114938.GM30267@ibawizard.net>	<f96d234e0803110712t6d88dfc6t521fdf39081e2c76@mail.gmail.com>	<20080311145739.GN30267@ibawizard.net>	<1205250588.4521.111.camel@dax.rpnet.com>	<20080312014945.4783ae6a@widy.localdomain>	<1205280598.16531.26.camel@dax.rpnet.com>	<20080312024408.44d9192e@widy.localdomain>	<c384c5ea0803121138r4bf89729t18c530b67e80c107@mail.gmail.com>	<fr997r$aat$1@ger.gmane.org>
	<c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Thunderbird 2.0.0.12 (Macintosh/20080213)
In-Reply-To: <c384c5ea0803121326r631bf595v72126de8c7905835@mail.gmail.com>
X-Enigmail-Version: 0.95.6
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.2
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.3 (2007-08-08) on serenity
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=5.0 tests=AWL,RDNS_NONE autolearn=no
	version=3.2.3
X-SA-Exim-Version: 4.2.1 (built Tue, 21 Aug 2007 23:39:36 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Reconsidering the work flow and how the SCM system fits in
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
X-List-Received-Date: Wed, 12 Mar 2008 20:47:36 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Leon Woestenberg schreef:
| Hello Koen, all,
|
| On Wed, Mar 12, 2008 at 8:00 PM, Koen Kooi
| <koen@dominion.kabel.utwente.nl> wrote:
|> -----BEGIN PGP SIGNED MESSAGE-----
|>  | http://lists.freedesktop.org/archives/cairo/2006-February/006255.html
|>  |
|>  | His arguments on the (main two) differences strongly favors me to move
|>  | to GIT, not HG.
|>
|>  Actually it shows that hg fits better into the OE way of using a DSCM:
|>  central repo (and mirrors) with distributed developers.
|>
| Quoting Carl: "Namely, it [hg] appears to force a more centralized,
| (or at least, a more strictly hierarchical), model on the development
| process, while git allows a more fully distributed model making it
| easier for users to pull (even speculatively with "fetch") from
| multiple sources, track them in the local repository as separate
| branches and merge when appropriate."
|
| Carl carefully uses the words "force" and "allows". Git does not
| preclude a central model, whilst still allowing more centralized
| development.
|
| And the centralized way we work currently is also DUE to us using mtn,
| i.e. it forces us more or less to work this way.

That isn't true, after the bitkeeper switch we *decided* to to it this
way, instead of going fully distributed.


| Some thoughts:
| - Why wouldn't the kernel model work for us? There is one upstream
| tree and distributed developers.
| - Suppose we were using GIT today, would we consider going to HG or MTN?

Yes, since we would all remember git 1.4 throwing away all our local
changes, the lack of docs and the horrible, horrible ui.

| - Suppose we were using HG today, would we consider going to GIT or MTN?

I don't think we would since we would go for horrible UI or slowness.

| Proposal: Can we work with MTN and GIT, or MTN and HG in parallel?

We did that before and did go for hg because of a bug in 'hg serve',
which has been solved nowadays.
And if we go for hg there is no learning curve, since the hg ui was
based on the monotone one.


regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFH2EDeMkyGM64RGpERAm3MAKCBouBagUxRyN9NXK4Ww5PB1dFu0ACbB9ge
TpsBfnHFA8/D6YVp4Eu3WtI=
=XwPg
-----END PGP SIGNATURE-----



