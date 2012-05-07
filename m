Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SRVK0-0006u6-Ba
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 23:18:20 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 05538F81234; Mon,  7 May 2012 15:08:29 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 3A63DF81232;
	Mon,  7 May 2012 15:08:29 -0600 (MDT)
Message-ID: <4FA839CD.4020203@mlbassoc.com>
Date: Mon, 07 May 2012 15:08:29 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1336391680.3417.7.camel@dasty-laptop>
	<4FA7B9DF.60304@mlbassoc.com>
	<1336394035.3417.12.camel@dasty-laptop>
	<CAMKF1sonQpWBRYNSapa16EDGyyQCiRr5AmKoSx02xnqzzn+5yA@mail.gmail.com>
	<1336424471.2074.4.camel@dasty-laptop>
In-Reply-To: <1336424471.2074.4.camel@dasty-laptop>
Subject: Re: Simultaneous build of two intree packages
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
X-List-Received-Date: Mon, 07 May 2012 21:18:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-07 15:01, Radek Dostal wrote:
> On Mon, 2012-05-07 at 08:46 -0700, Khem Raj wrote:
>>> usually it crashes during "ln -sf target dest" which is executed
>>> simultaneously with same parameters for both builds. There are other
>>> issues as well in addition to this ln issue.
>>
>> This is confusing why does this happen at all
>
> Because ln -sf first do symlink(1) unlink(2) and symlink(3) again. In
> case link is created by another process between 2 and 3 than ln fails.
>
> It is quite well described here:
> http://rcrowley.org/2010/01/06/things-unix-can-do-atomically.html
>
> I was also able to verify my finding by running two ln -sf in two for
> loops in two different terminals and they were failing constantly.
>
> So any idea on implementing locks/mutexes inside OE. If somebody can
> point me in the right direction I should be able to implement and feed
> back.

I think that your recipes are not well behaved - two recipes probably
should not be creating the same file in such a way.

Can you post the recipes, or at least the code snippets that break?

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


