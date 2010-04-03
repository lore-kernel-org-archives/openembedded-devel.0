Received: from hermes.mlbassoc.com ([76.76.67.137] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gary@mlbassoc.com>) id 1Ny76d-0003Ag-EZ
	for openembedded-devel@lists.openembedded.org;
	Sat, 03 Apr 2010 19:26:00 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id B6442166055D; Sat,  3 Apr 2010 11:22:41 -0600 (MDT)
Received: from hermes.chez-thomas.org (hermes_local [192.168.1.101])
	by mail.chez-thomas.org (Postfix) with ESMTP id E922A16604FF;
	Sat,  3 Apr 2010 11:22:39 -0600 (MDT)
Message-ID: <4BB7795D.6050600@mlbassoc.com>
Date: Sat, 03 Apr 2010 11:22:37 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.1.8) Gecko/20100301 Fedora/3.0.3-1.fc11 Thunderbird/3.0.3
MIME-Version: 1.0
To: Tom Rini <tom_rini@mentor.com>
References: <4BB35552.9070508@mlbassoc.com>	
	<v2q19c1b8a91003311006zc7a7eff8o9f2a88a1f42b6c1d@mail.gmail.com>	
	<4BB382AA.3040901@mlbassoc.com>
	<1270056997.6277.89.camel@trini-m4400>	
	<4BB75E89.6030708@mlbassoc.com>
	<1270312858.3653.44.camel@trini-m4400>
In-Reply-To: <1270312858.3653.44.camel@trini-m4400>
X-SA-Exim-Connect-IP: 76.76.67.137
X-SA-Exim-Mail-From: gary@mlbassoc.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: FireFox on PowerPC
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
X-List-Received-Date: Sat, 03 Apr 2010 17:26:00 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 04/03/2010 10:40 AM, Tom Rini wrote:
> On Sat, 2010-04-03 at 09:28 -0600, Gary Thomas wrote:
>
>> That said, this seems to be a [Make] parallelism problem, not clear why/how.
>> If I just rerun 'bitbake firefox' which restarts the compile step, it will
>> run to completion.  I do normally use -j4, but disabling this did not seem
>> to make any difference.
>>
>> Note: the previous version I built (3.5.2) did not exhibit this behaviour.
>
> Well that's depressing since we just added the best we can tell correct
> magic to build firefox with make -jN.  If you put PARALLEL_MAKE = "" in
> the .bb, does it complete this time?
>

No change, I'm afraid.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


