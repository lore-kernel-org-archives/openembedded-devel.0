Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1NUL7z-0005Ha-E4
	for openembedded-devel@lists.openembedded.org;
	Mon, 11 Jan 2010 15:20:22 +0100
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id C495616603C2; Mon, 11 Jan 2010 07:18:11 -0700 (MST)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id 91E8D1660364;
	Mon, 11 Jan 2010 07:18:11 -0700 (MST)
Message-ID: <4B4B3323.2090506@mlbassoc.com>
Date: Mon, 11 Jan 2010 07:18:11 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.3a1pre) Gecko/20091228 Shredder/3.1a1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BAY127-W8334C401E093FAC091CDDD86D0@phx.gbl>
In-Reply-To: <BAY127-W8334C401E093FAC091CDDD86D0@phx.gbl>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Cc: saleh usman <salehusman@hotmail.com>
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
X-List-Received-Date: Mon, 11 Jan 2010 14:20:22 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 01/11/2010 07:01 AM, saleh usman wrote:
>
> Hi
> I've run bitbake helloworld but I am unable to find /tmp/deploy folder where I can find output of helloworld.Where will be the output of this build? Terminal window is looking like as
>
> [saleh@localhost ~]$ bitbake helloworld
> NOTE: Handling BitBake files: - (7634/7634) [100 %]
> NOTE: Parsing finished. 7045 cached, 303 parsed, 286 skipped, 0 masked.
> NOTE: Resolving any missing task queue dependencies
> NOTE: Preparing runqueue
> NOTE: Executing runqueue
> NOTE: Tasks Summary: Attempted 461 tasks of which 461 didn't need to be rerun and 0 failed.

It's most likely not "/tmp" - look in your local.conf for TMPDIR.
Mine's set like this:
   TMPDIR = "${OEROOT}/build/tmp"
so my deploy directory is at
   ${OEROOT}/build/tmp/deploy

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


