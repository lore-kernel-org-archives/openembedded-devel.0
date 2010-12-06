Received: from vms173017pub.verizon.net ([206.46.173.17])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1PPi0J-00069H-I6
	for openembedded-devel@lists.openembedded.org;
	Mon, 06 Dec 2010 21:49:48 +0100
Received: from gandalf.denix.org ([unknown] [71.255.236.20])
	by vms173017.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LD0009GZXRTVI15@vms173017.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	06 Dec 2010 14:47:59 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 0F3E914AF64; Mon,
	06 Dec 2010 15:47:53 -0500 (EST)
Date: Mon, 06 Dec 2010 15:47:53 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20101206204753.GC29253@denix.org>
References: <AANLkTim=weStfsykRNc7_bAZG6KExZt9sS_O15WH9F5=@mail.gmail.com>
	<AANLkTikSuqFKS=1j-KWm3XY75J=qhe+towHjdfanW1JG@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <AANLkTikSuqFKS=1j-KWm3XY75J=qhe+towHjdfanW1JG@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.17
X-SA-Exim-Mail-From: denis@denix.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release 2010-12: tar error
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
X-List-Received-Date: Mon, 06 Dec 2010 20:49:48 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Dec 03, 2010 at 11:44:14AM -0800, Khem Raj wrote:
> On Fri, Dec 3, 2010 at 7:36 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > Not sure if this is reproducible or a race but when building console-image
> > for minimal for calamari I got:
> >
> > ERROR: Function staging_packager failed
> > NOTE: Task failed: ('function staging_packager failed',
> > '/home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026')
> > ERROR: Task 601
> > (/home/hudson/jobs/FM_TEST/workspace/openembedded/recipes/linux/linux_2.6.30.bb,
> > do_package_stage) failed with 256
> > NOTE: oestats: task failed, see
> > http://tinderbox.openembedded.net/packages/1176040/
> > ERROR: Logfile of failure stored in:
> > /home/hudson/jobs/FM_TEST/workspace/tmp/work/calamari-oe-linux-gnuspe/linux-2.6.30-r6/temp/log.staging_packager.27026
> > Log data follows:
> > | tar: .: file changed as we read it
> >
> > NOTE: package linux-2.6.30-r6: task do_package_stage: Failed
> >
> > Didn't have time to dig into this. Sry.
> 
> yes this happens time to time. Its some sort of race condition. I get
> it sometimes in different packages but never went in deep to fix it.

I can confirm that this is a long standing race condition, presumably in 
packaged staging - there were several attempts at fixing it w/o much success.

-- 
Denys


