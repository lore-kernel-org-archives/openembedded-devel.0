Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1K8HZ5-0002A3-NY
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 18:28:19 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1K8HYO-0004i5-2D
	for openembedded-devel@openembedded.org; Mon, 16 Jun 2008 16:27:36 +0000
Received: from ip-62-143-23-251.hsi.ish.de ([62.143.23.251])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 16:27:36 +0000
Received: from no2spam by ip-62-143-23-251.hsi.ish.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Mon, 16 Jun 2008 16:27:36 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Mon, 16 Jun 2008 18:27:30 +0200
Message-ID: <g3649g$qnj$1@ger.gmane.org>
References: <1213345201.13942.3.camel@dax.rpnet.com>	<g2ubb9$a55$1@ger.gmane.org>	<87od65rxi8.fsf@neumann.lab.ossystems.com.br>	<200806132137.51103.zecke@selfish.org>	<87mylpqccr.fsf@neumann.lab.ossystems.com.br>	<g35hnj$k46$1@ger.gmane.org>	<87zlplldul.fsf@neumann.lab.ossystems.com.br>	<g35tdc$upb$1@ger.gmane.org>
	<87myllz8gp.fsf@neumann.lab.ossystems.com.br>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-23-251.hsi.ish.de
User-Agent: Thunderbird 2.0.0.14 (X11/20080505)
In-Reply-To: <87myllz8gp.fsf@neumann.lab.ossystems.com.br>
Sender: news <news@ger.gmane.org>
Subject: Re: Switching SCM to git and commit/review policy
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 16 Jun 2008 16:28:19 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Otavio,

thank you for clarifying.

Otavio Salvador wrote:
> The revisions will be a moving target. To tag a commit as "not-ok"
> you'd need to amend it and  them change it rev number.

I was talking about a possible workflow with absolute disregard as to
how it is supported by tools out there, git in particular.  I think, at
this point in time it is OK to build your castle in the sky and worry
about how to implement that with tools later (and possibly make
necessary adjustments, then)

>> Modules?  Are you talking kernel?  Or are you using modules as a synonym
>> for recipe?
> 
> recipe, sorry.

Well, that is certainly nice, but not sufficient.  bitbake will not
necessarily rebuild an app if a lib changes IIRC.

> human. I think that a sort of compile tests are enough to kill most of
> problems.

NACK.  I don't agree.  They are necessary and good to be done.  They are
still insufficient.  Otherwise, we could fully automate the review
process and have a compile firm to automatically reject changesets that
lead to compile failures.

Regards

Rolf



