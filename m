Received: from [206.46.173.7] (helo=vms173007pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1Kt9Qb-0002ZL-L7
	for openembedded-devel@openembedded.org; Fri, 24 Oct 2008 01:17:17 +0200
Received: from gandalf.denix.org ([71.255.247.239]) by vms173007.mailsrvcs.net
	(Sun Java System Messaging Server 6.2-6.01 (built Apr  3 2006))
	with ESMTPA id <0K9700272SNA7EY0@vms173007.mailsrvcs.net> for
	openembedded-devel@openembedded.org;
	Thu, 23 Oct 2008 18:16:23 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 04D946B83A8; Thu,
	23 Oct 2008 19:16:32 -0400 (EDT)
Date: Thu, 23 Oct 2008 19:16:31 -0400
From: Denys Dmytriyenko <denis@denix.org>
In-reply-to: <bdb0025f0810222159ka9b7ab7q4088bd6a241e477a@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-id: <20081023231631.GB21151@denix.org>
MIME-version: 1.0
References: <bdb0025f0810222159ka9b7ab7q4088bd6a241e477a@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Cc: openembedded-devel@openembedded.org
Subject: Re: pushing mamona things upstream
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
X-List-Received-Date: Thu, 23 Oct 2008 23:17:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 23, 2008 at 01:59:11AM -0300, Rodrigo Vivi wrote:
> My plan is to send directly all patches that change mamona packages,
> tasks and configuration.

Thanks for doing it.

> This shouldn't break anyone's build. (Get prepared for an avalanche of 
> commits :) )

At least in theory. But in reality it got broken:

ERROR: Could not include required file ../gcc/gcc3-build.inc while parsing /OE/openembedded/packages/mamona/gcc-noemu_4.1.2.bb

You forgot the gcc/gcc3-build.inc and BitBake chokes on it while parsing the 
tree.

-- 
Denys


