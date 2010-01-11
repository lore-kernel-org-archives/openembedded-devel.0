Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1NULJX-0003FK-Ng for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 15:32:18 +0100
Received: from list by lo.gmane.org with local (Exim 4.50) id 1NULHS-0003we-Nr
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 15:30:07 +0100
Received: from mbl-82-49-5.dsl.net.pk ([203.82.49.5])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 15:30:06 +0100
Received: from salehusman by mbl-82-49-5.dsl.net.pk with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 11 Jan 2010 15:30:06 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Saleh Usman <salehusman@hotmail.com>
Date: Mon, 11 Jan 2010 14:25:06 +0000 (UTC)
Message-ID: <loom.20100111T152023-889@post.gmane.org>
References: <BAY127-W8334C401E093FAC091CDDD86D0@phx.gbl>
	<4B4B3323.2090506@mlbassoc.com>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 203.82.49.5 (Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.8.1.3) Gecko/20070417 Fedora/2.0.0.3-4.fc7 Firefox/2.0.0.3)
Sender: news <news@ger.gmane.org>
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: output of helloworld
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
X-List-Received-Date: Mon, 11 Jan 2010 14:32:18 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Gary Thomas <gary <at> mlbassoc.com> writes:

> 
> On 01/11/2010 07:01 AM, saleh usman wrote:
> >
> > Hi
> > I've run bitbake helloworld but I am unable to find /tmp/deploy folder where
I can find output of
> helloworld.Where will be the output of this build? Terminal window is looking
like as
> >
> > [saleh <at> localhost ~]$ bitbake helloworld
> > NOTE: Handling BitBake files: - (7634/7634) [100 %]
> > NOTE: Parsing finished. 7045 cached, 303 parsed, 286 skipped, 0 masked.
> > NOTE: Resolving any missing task queue dependencies
> > NOTE: Preparing runqueue
> > NOTE: Executing runqueue
> > NOTE: Tasks Summary: Attempted 461 tasks of which 461 didn't need to be
rerun and 0 failed.
> 
> It's most likely not "/tmp" - look in your local.conf for TMPDIR.
> Mine's set like this:
>    TMPDIR = "${OEROOT}/build/tmp"
> so my deploy directory is at
>    ${OEROOT}/build/tmp/deploy
> 

/tmp directory is there i.e. in ${OEROOT}/build but It doesn't contain deploy
directory in it.There are cache,staging,stamps,user and work directories in tmp
but it doesn't contain deploy directory.




