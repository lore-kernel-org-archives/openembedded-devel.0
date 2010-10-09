Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1P4amx-0008IJ-Lr
	for openembedded-devel@lists.openembedded.org;
	Sat, 09 Oct 2010 16:52:45 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C8254166074C; Sat,  9 Oct 2010 08:52:20 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 6FB7E16605CF;
	Sat,  9 Oct 2010 08:52:20 -0600 (MDT)
Message-ID: <4CB081A4.9010908@mlbassoc.com>
Date: Sat, 09 Oct 2010 08:52:20 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.9) Gecko/20100430 Fedora/3.0.4-2.fc11 Thunderbird/3.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4C78D1E1.9080101@mlbassoc.com>
In-Reply-To: <4C78D1E1.9080101@mlbassoc.com>
X-SA-Exim-Connect-IP: 64.234.241.98
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH v2] TI tools - make EULA unpack work when /opt is writeable
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
X-List-Received-Date: Sat, 09 Oct 2010 14:52:45 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2010 03:07 AM, Gary Thomas wrote:
> This patch addresses the problem where the TI tools that need
> the EULA unpack into the wrong place if the user has write
> permission in /opt. The current behaviour of expecting the
> unpacker to fall back to the $HOME environment variable should
> not be relied on. The patch changes the unpack step to use
> the --prefix= option which will always work.
>
> Version 2:
> * Update patch to be against org.openembedded.dev branch
> * Incorporate full description into patch

What about this patch?  It's been nearly 6 weeks and no discussion
or anything.

The problem persists in today's tree.

n.b. there was a discussion about automatic application of a patch
if it goes more than two weeks without objection.  What about that??

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


