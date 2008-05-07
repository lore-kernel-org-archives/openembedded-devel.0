Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JtkhM-0001iH-0t
	for openembedded-devel@openembedded.org; Wed, 07 May 2008 16:32:48 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1Jtkgn-0007kF-Ve
	for openembedded-devel@openembedded.org; Wed, 07 May 2008 14:32:13 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Wed, 07 May 2008 14:32:13 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Wed, 07 May 2008 14:32:13 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Wed, 07 May 2008 16:32:07 +0200
Message-ID: <fvseh7$53i$1@ger.gmane.org>
References: <fvpr9t$4vh$1@ger.gmane.org>	<fvq5c7$alo$1@ger.gmane.org>	<fvrtn6$93p$1@ger.gmane.org>	<fvs0bo$h8r$1@ger.gmane.org>	<fvs8g9$de9$1@ger.gmane.org>
	<fvsb7t$nk1$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.12 (X11/20080227)
In-Reply-To: <fvsb7t$nk1$1@ger.gmane.org>
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
X-List-Received-Date: Wed, 07 May 2008 14:32:48 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> Sorry, that wasn't clear to me, it took me a while to realise that 'bp'
> means 'backport'. 

My apologies if that got lost somewhere in between.  Yes, it stands for
backport (request).  I keep the flag names as short as possible because
otherwise the bugzilla UI soon becomes unbelievably ugly and bloated.

> There hasn't been much traffic on the mailinglist lately since I was on
> holiday and PaulS still is on holiday and Leon is swamped at work.

I appreciate that.  Thanks for the good work.

> If you think you have patches that should get applied to the
> stablebranch, please post them for review on the stablebranch
> mailinglist.

Would it be OK if I directed you to http://tinyurl.com/63674m instead?
Maybe you can save this search in your bugzilla account?  These are
patches tagged with the bp keyword request.  The Stable branch devs can
then ACK or NACK the patch right in the bug tracker.  Second person to
ACK makes the commit to .stable.  Isn't this the kind of review process
we are looking for?  Maybe you can over time move the complete review
process away from the mailing list and into bugzilla.  That would be my
suggestion.

I also did a bit of work on the autobuilder bugs which are fixed in .dev
but were filed against .stable in http://tinyurl.com/5th9yj  There are
no patches in there yet, but these should be easy to get with "mtn -r
$devheadrevision -r $stableheadrevision packages/$package", I assume
(haven't tried if mtn supports cross-branch diffs).



