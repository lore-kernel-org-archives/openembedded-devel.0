Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1REk1L-0000va-Vn
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 Oct 2011 17:50:04 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 1BFBF1660A5E; Fri, 14 Oct 2011 09:44:16 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 83D451660A5C;
	Fri, 14 Oct 2011 09:44:15 -0600 (MDT)
Message-ID: <4E9858CF.2070902@mlbassoc.com>
Date: Fri, 14 Oct 2011 09:44:15 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:7.0.1) Gecko/20110930 Thunderbird/7.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4E96E9FE.1060005@mlbassoc.com>
	<CAMKF1sp9HPM8DzxTSuhUKY7-q4QuDPNkDQ2TAQPwoGkZ+Gu4eg@mail.gmail.com>
	<4E974E38.5050807@mlbassoc.com>
	<201110132258.27380.schnitzeltony@gmx.de>
	<4E975444.3050507@mlbassoc.com>
	<CA+T6QPkOQgFSmSsNaaeCOM5zNtzaNcCzgVaXr=t_5jj902w11Q@mail.gmail.com>
	<CAMKF1srDzFzjkoWAs2k8wP45xskCuwhyLb_dCpiT2GMarC_s5w@mail.gmail.com>
	<4E980D6D.7090307@mlbassoc.com>
	<CAMKF1srhvhNhf5DAsGeuzWYvuhsExE_y92PjvSaQRoDixtMiDQ@mail.gmail.com>
	<j79kqm$6qg$1@dough.gmane.org>
In-Reply-To: <j79kqm$6qg$1@dough.gmane.org>
Cc: Koen Kooi <koen@dominion.thruhere.net>
Subject: Re: Can't build libcgroup
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
X-List-Received-Date: Fri, 14 Oct 2011 15:50:04 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-10-14 09:34, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Op 14-10-11 17:28, Khem Raj schreef:
>>> Indeed, I did a rebuild from scratch with BB_NUMBER_THREADS=1 and
>>> PARALLEL_MAKE="-j1" and it worked fine.  When I set both to 2 I had
>>> failures, but of a different sort (openssl failed to build).
>>>
>>> Seems to be some real gremlins in the parallel builds :-(
>>>
>>> Odd that I've never seen this when building Poky (I _always_ use
>>> BB_NUMBER_THREADS=4 and PARALLEL_MAKE="-j4")
>>>
>>
>> It could be that the runqueue of poky is constructed such that this does
>>   not happen
>
> RP suspects it's rm_work that is triggering all these bitbake bugs.

Could well be - I'm convinced that rm_work is *evil* - it caused me
no end of woes in Poky, so I gave up on it.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


