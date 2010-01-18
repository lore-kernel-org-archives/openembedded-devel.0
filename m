Received: from vms173013pub.verizon.net ([206.46.173.13])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1NWlmY-0006Cw-F9
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 08:12:17 +0100
Received: from gandalf.denix.org ([unknown] [71.255.235.232])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0KWF00MS4L87V0K5@vms173013.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Mon,
	18 Jan 2010 01:09:49 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id AF37A14AF60; Mon,
	18 Jan 2010 02:09:43 -0500 (EST)
Date: Mon, 18 Jan 2010 02:09:43 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Message-id: <20100118070943.GB25542@denix.org>
References: <alpine.LFD.2.00.1001170437060.4706@localhost>
MIME-version: 1.0
In-reply-to: <alpine.LFD.2.00.1001170437060.4706@localhost>
User-Agent: Mutt/1.5.16 (2007-06-09)
X-SA-Exim-Connect-IP: 206.46.173.13
X-SA-Exim-Mail-From: denis@denix.org
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Subject: Re: does supertux-smallsize-data.tar.bz2 tarball need to be in OE	repo?
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
X-List-Received-Date: Mon, 18 Jan 2010 07:12:17 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Sun, Jan 17, 2010 at 04:39:29AM -0500, Robert P. J. Day wrote:
> 
> $ git log recipes/supertux/files/supertux-smallsize-data.tar.bz2
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

And same comment about using --follow here:

$ git log --follow recipes/supertux/files/supertux-smallsize-data.tar.bz2

commit 709c4d66e0b107ca606941b988bad717c0b45d9b
Author: Denys Dmytriyenko <denis@denix.org>
Date:   Tue Mar 17 14:32:59 2009 -0400

    rename packages/ to recipes/ per earlier agreement

commit a96a64e4975b8e3100904f902bd3b24f521210fb
Author: Paul Sokolovsky <pmiscml@gmail.com>
Date:   Thu Jan 17 13:02:45 2008 +0000

    supertux-qvga 0.1.3: Add QVGA port of SperTux, based on GP2X port.
    * Original GP2X port by Ingo Arndt.
    * Data conversion preparation and script by myself.

-- 
Denys


