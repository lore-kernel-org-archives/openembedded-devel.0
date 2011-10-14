Received: from vms173019pub.verizon.net ([206.46.173.19])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <denis@denix.org>) id 1REaso-00046R-IX
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 08:04:38 +0200
Received: from gandalf.denix.org ([unknown] [71.191.138.237])
	by vms173019.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0LT100CFRKLUBPZ1@vms173019.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Fri,
	14 Oct 2011 00:58:43 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8AF9D14AF5D; Fri,
	14 Oct 2011 01:58:42 -0400 (EDT)
Date: Fri, 14 Oct 2011 01:58:42 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20111014055842.GM26170@denix.org>
References: <1318535732-16028-1-git-send-email-denis@denix.org>
	<CAMKF1sqaW3169pRDurhA+G+fD86Et0BFvf_j4zZBt2_1oOwUKQ@mail.gmail.com>
MIME-version: 1.0
In-reply-to: <CAMKF1sqaW3169pRDurhA+G+fD86Et0BFvf_j4zZBt2_1oOwUKQ@mail.gmail.com>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [meta-oe][PATCH] ltp-ddt: import initial version 0.0.4	plus fixes
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
X-List-Received-Date: Fri, 14 Oct 2011 06:04:38 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Oct 13, 2011 at 05:10:24PM -0700, Khem Raj wrote:
> On Thu, Oct 13, 2011 at 12:55 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> > +
> > +TARGET_CC_ARCH += "${LDFLAGS}"
> > +
> 
> why is this needed ?

In Classic OE it was used to pass global LDFLAGS with things like GNU_HASH and 
optimizations down to the app's build command, so all the QA checks are in 
balance :) Not sure if it's still needed with oe-core/meta-oe...

-- 
Denys


