Received: from li38-254.members.linode.com ([207.192.74.254]
	helo=masterfoo.zenlinux.com) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <sgarman@zenlinux.com>) id 1Nrct8-00015M-G9
	for openembedded-devel@lists.openembedded.org;
	Tue, 16 Mar 2010 20:57:15 +0100
Received: from [192.168.1.129] (c-67-170-181-205.hsd1.or.comcast.net
	[67.170.181.205])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by masterfoo.zenlinux.com (Postfix) with ESMTP id E35E530216
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Mar 2010 15:54:05 -0400 (EDT)
Message-ID: <4B9FE1D9.30304@zenlinux.com>
Date: Tue, 16 Mar 2010 12:54:01 -0700
From: Scott Garman <sgarman@zenlinux.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100227 Lightning/1.0b1 Thunderbird/3.0.3
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1268646413.3759.3.camel@mattotaupa>
In-Reply-To: <1268646413.3759.3.camel@mattotaupa>
X-Enigmail-Version: 1.0.1
X-MasterFoo-MailScanner-Information: Please contact the ISP for more
	information
X-MailScanner-ID: E35E530216.3369C
X-MasterFoo-MailScanner: Found to be clean
X-MasterFoo-MailScanner-From: sgarman@zenlinux.com
X-SA-Exim-Connect-IP: 207.192.74.254
X-SA-Exim-Mail-From: sgarman@zenlinux.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] enna: Remove `recipes/e17/enna/.mtn2git_empty`.
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
X-List-Received-Date: Tue, 16 Mar 2010 19:57:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 03/15/2010 02:46 AM, Paul Menzel wrote:
> `.mtn2git_empty` is the only file in `recipes/e17/enna/` and seems have originated from the Monotone to Git transition.
> 
> Since no useful files are in this directory remove it completely.

There seem to be several of these files left in the tree:

find . -name ".mtn*"

./recipes/mono/mono-1.9.1/.mtn2git_empty
./recipes/mamona/bash-noemu-3.2/.mtn2git_empty
./recipes/mamona/gcc-noemu-4.1.1/.mtn2git_empty
./recipes/mamona/gcc-noemu-4.1.2/.mtn2git_empty
./recipes/mamona/binutils-noemu-2.17.50.0.5/.mtn2git_empty
./recipes/twisted/.mtn2git_empty
./recipes/netbase/netbase/if-post-down.d/.mtn2git_empty
./recipes/netbase/netbase/if-down.d/.mtn2git_empty
./recipes/netbase/netbase/if-up.d/.mtn2git_empty
./recipes/netbase/netbase/if-pre-up.d/.mtn2git_empty
./recipes/opensync/libopensync/.mtn2git_empty
./recipes/opensync/libsyncml/.mtn2git_empty
./recipes/efl1/evas/.mtn2git_empty
./recipes/e17/enna/.mtn2git_empty
./recipes/postfix/postfix-2.0.20/.mtn2git_empty
./contrib/site-conf/.mtn-ignore
./docs/usermanual/reference/.mtn2git_empty
./docs/usermanual/chapters/.mtn2git_empty
./conf/machine/nonworking/.mtn2git_empty

Should they all be removed?

Scott

-- 
Scott Garman
sgarman at zenlinux dot com


