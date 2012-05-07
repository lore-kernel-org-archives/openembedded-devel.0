Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SRMnm-0001TU-Be
	for openembedded-devel@lists.openembedded.org;
	Mon, 07 May 2012 14:12:30 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D1E10F81200; Mon,  7 May 2012 06:02:40 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id E82FDF811FD;
	Mon,  7 May 2012 06:02:39 -0600 (MDT)
Message-ID: <4FA7B9DF.60304@mlbassoc.com>
Date: Mon, 07 May 2012 06:02:39 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:12.0) Gecko/20120430 Thunderbird/12.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1336391680.3417.7.camel@dasty-laptop>
In-Reply-To: <1336391680.3417.7.camel@dasty-laptop>
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
X-List-Received-Date: Mon, 07 May 2012 12:12:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-05-07 05:54, Radek Dostal wrote:
> Dear All,
>
> I have three intree recipes A, B and C which are part of the same layer.
> =>  B depends on A
> =>  C depends on A.
>
> There is no dependency between B and C. Only important thing is that B
> and C are not build simultaneously. This is not a problem unless I use
> configure BB_NUMBER_THREADS>  1. Than builds B and C starts to collide
> and produce mess because they are both intree builds.

What are you doing that makes these clash?

>
> Is there something like a mutex/lock mechanism in openembedded-core,
> which would forbid two recipes to be build simultaneously?

Just make C depend on B

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


