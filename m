Received: from vms173005pub.verizon.net ([206.46.173.5])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NWlkb-00068L-2i
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 08:10:16 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173005.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWF00ILJL59SQE2@vms173005.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	18 Jan 2010 01:07:58 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 3376E14AF60; Mon,
	18 Jan 2010 02:07:57 -0500 (EST)
Date: Mon, 18 Jan 2010 02:07:57 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20100118070757.GA25542@denix.org>
References: <alpine.LFD.2.00.1001170426100.4163@localhost>
MIME-version: 1.0
In-reply-to: <alpine.LFD.2.00.1001170426100.4163@localhost>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.5
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: why qpealarmclockapplet-1.0.9/missing-files.tar.gz in OE repo?
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
X-List-Received-Date: Mon, 18 Jan 2010 07:10:16 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Jan 17, 2010 at 04:29:22AM -0500, Robert P. J. Day wrote:
> 
> $ git log recipes/qpealarmclock/qpealarmclockapplet-1.0.9/missing-files.tar.gz
> commit 709c4d66e0b107ca606941b988bad717c0b45d9b
> Author: Denys Dmytriyenko <denis@denix.org>
> Date:   Tue Mar 17 14:32:59 2009 -0400
> 
>     rename packages/ to recipes/ per earlier agreement
> 
>     See links below for more details:
>     http://thread.gmane.org/gmane.comp.handhelds.openembedded/21326
>     http://thread.gmane.org/gmane.comp.handhelds.openembedded/21816
> 
>     Signed-off-by: Denys Dmytriyenko <denis@denix.org>
>     ... snip ...
> 
> it would seem that you can download "missing-files.tar.gz" from here:
> 
> http://downloads.openmoko.org/developer/build/openembedded/packages/qpealarmclock/qpealarmclockapplet-1.0.9/
> 
> rather than keeping it in the repo.

Please use --follow flag to track renames:

$ git log --follow recipes/qpealarmclock/qpealarmclockapplet-1.0.9/missing-files.tar.gz

commit 709c4d66e0b107ca606941b988bad717c0b45d9b
Author: Denys Dmytriyenko <denis@denix.org>
Date:   Tue Mar 17 14:32:59 2009 -0400

    rename packages/ to recipes/ per earlier agreement

commit d5d23d6428b7ea36bc88ab0216f46fa5fc8675d4
Author: Marcin Juszkiewicz <hrw@openembedded.org>
Date:   Wed Jan 18 10:52:07 2006 +0000

    qpealarmclock: updated to 1.0.9 and added it's clock applet - close #536

-- 
Denys


