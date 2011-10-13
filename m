Received: from vms173007pub.verizon.net ([206.46.173.7])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1REPjv-0006Ni-4f
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 Oct 2011 20:10:43 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173007.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LT0002SOKRB40M4@vms173007.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Thu,
	13 Oct 2011 12:04:26 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 6781E14AF5D; Thu,
	13 Oct 2011 13:04:23 -0400 (EDT)
Date: Thu, 13 Oct 2011 13:04:23 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111013170423.GH26170@denix.org>
References: <CAFu+nvHi=pWi-bX5NrTQAk_JVv04YTa=d60Rg7YVSvLv7FNsPg@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAFu+nvHi=pWi-bX5NrTQAk_JVv04YTa=d60Rg7YVSvLv7FNsPg@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [2011.03-maintenance] using sdk as external toolchain
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
X-List-Received-Date: Thu, 13 Oct 2011 18:10:43 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 13, 2011 at 11:22:05AM -0400, George C. Huntington, III wrote:
> I've built an sdk with oe on the 2011.03-maintenance branch, and I am now
> trying to set up a local.conf to use the sdk as an external toolchain and I
> get problems building gtk+-native.  any ideas on where I should start
> debugging this?

gtk+-native should be built by the host toolchain, not the target one from
SDK - are you sure you are setting all the correct build variables properly?

Moreover, it's hard to help you debug your issue, if you don't provide 
details, such as your local.conf and the build logs...

-- 
Denys


