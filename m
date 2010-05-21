Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OFSV2-0003Ou-9p
	for openembedded-devel@lists.openembedded.org;
	Fri, 21 May 2010 15:42:53 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 99A20F7A0F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 09:38:49 -0400 (EDT)
Received: from heartbeat1.messagingengine.com ([10.202.2.160])
	by compute2.internal (MEProxy); Fri, 21 May 2010 09:38:49 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:in-reply-to:message-id:references:mime-version:content-type;
	s=smtpout; bh=jcrNHThZM6xbgL6xxoxLCi85Kq4=;
	b=pcYq/aVABZxgplgKrvtZH0LKNrABCkGHnhWwAjlIU7M2Q/cZnLXZYHv8NMwAfqXVnYGeKZBIL8D9d1vAVybKGkYmflUMTGd6cVh1ZM+ivandU0e1CQQGWRbKc2v3sSgMMSh09Yj/28F2J28myTxT6z7PJuVyXvaWV6ozNU9vlTM=
X-Sasl-enc: 47KiCzBENjDwqWmH2APFTjtQxLtYq6uS93dIp9mYs+9l 1274449128
Received: from [192.168.1.34] (hnvr-4d078ae5.pool.mediaWays.net [77.7.138.229])
	by mail.messagingengine.com (Postfix) with ESMTPSA id D18EF4E0F08
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 May 2010 09:38:48 -0400 (EDT)
Date: Fri, 21 May 2010 15:40:14 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <alpine.LNX.2.00.1005211518470.5274@asterix.crazy-teaparty.dyndns.org>
Message-ID: <alpine.LNX.2.00.1005211537200.5274@asterix.crazy-teaparty.dyndns.org>
References: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
	<4BF3C9B8.8080501@mlbassoc.com>
	<alpine.LNX.2.00.1005191335020.21508@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005191726560.21508@asterix.crazy-teaparty.dyndns.org>
	<ht14oq$ok6$1@dough.gmane.org>
	<alpine.LNX.2.00.1005211250480.5274@asterix.crazy-teaparty.dyndns.org>
	<alpine.LNX.2.00.1005211518470.5274@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Fri, 21 May 2010 13:42:53 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII; format=flowed

On Fri, 21 May 2010, Vitus Jensen wrote:

> On Fri, 21 May 2010, Vitus Jensen wrote:
>
>>  On Wed, 19 May 2010, Koen Kooi wrote:
>> >   On 19-05-10 17:46, Vitus Jensen wrote:
>> > >   On Wed, 19 May 2010, Vitus Jensen wrote:
>> > > >   On Wed, 19 May 2010, Gary Thomas wrote:
>> > > > >    On 05/19/2010 03:38 AM, Vitus Jensen wrote:
>
> ...
>> > >   So currently .dev should be unbuildable for ppc users?  Without
>> > >   selecting a non-default compiler that is.
>> > 
>> >   I thought I pinned powerpc at 4.1.1, but it turns out that it was only
>> >   for ppc405:
>> > 
>> >   ANGSTROM_GCC_VERSION_ppc405         ?= "4.1.1"
>> > 
>> >   Feel free to send patches to add that for other ppc platforms.
>>
>>  I'd loved to but it should be a usable version for ppc603e.  We have used
>>  ELDK gcc 3.3.3 in the past so that version would be a known good one.
>>
>>  [stable/2009]
>>  4.2.4  wrong result
>>  4.1.1  wrong result (see first posting)
>>  3.3.3  doesn't compile, obstack macro problem
>>  3.3.4  doesn't compile, signal.h stack_t problem
>>
>>  [org.openembedded.dev]
>>  4.3.3  doesn't compile
>>  4.1.1  doesn't compile
>>  4.2.4  doesn't compile, libstdc++ problem
>>
>>  All compilations in the .dev branch used MACHINE=n1200, in stable I used
>>  our bluepro.  Always a clean build of meta-toolchain.  I know that there
>>  are currently problems in .dev so I will wait/monitor the list and try to
>>  get 3.3.3 and something newer than 4.3.3. to compile.
>
> Faster than thought: 4.4.4 compiles for n1200 (ppc603e) on .dev and produces 
> correct output.  (double)(long long)10 equals 10.0.

Only at -O2 and -O3, at those levels the internal function __floatdidf 
isn't called (previously it was only -O3).  At -O1 and below it is called 
and still produces incorrect results :-( Oh well, I give up for now.

Vitus

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


