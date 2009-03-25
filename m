Received: from [216.145.245.199] (helo=mx03.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LmXd3-0006u2-8Q
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 19:15:05 +0100
Received: from [209.242.7.134] (helo=[192.168.231.111])
	by mx03.dls.net with esmtpa (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1LmXbU-000262-IQ
	for openembedded-devel@openembedded.org; Wed, 25 Mar 2009 13:13:28 -0500
Message-ID: <49CA744A.1090203@dls.net>
Date: Wed, 25 Mar 2009 13:13:30 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.21) Gecko/20090302 Thunderbird/2.0.0.21 Mnenhy/0.7.6.0
MIME-Version: 1.0
To: openembedded-devel@openembedded.org
References: <b6ebd0a50903171218i7f5716afifd99177982b6df5b@mail.gmail.com>	<ac9c93b10903241136q779fe115sa595c31200b707c6@mail.gmail.com>	<49C92CC7.2080801@gmail.com>	<b6ebd0a50903241205h6813f898i87351aaad17b6775@mail.gmail.com>	<49C93237.7010205@gmail.com>	<49C9347C.7010309@balister.org>	<FA1C2D98-DEF3-4694-A757-7C137F667CE3@ngndg.com>	<b6ebd0a50903241301r5b8972b4s59df7be41052ab7a@mail.gmail.com>	<dc6682e90903241330m1191395j478ee4180a969cfb@mail.gmail.com>	<49C94647.2040401@gmail.com>	<ac9c93b10903250151v6ea0586bv461debbe36f42ac7@mail.gmail.com>	<gqd31s$5vk$1@ger.gmane.org>	<49CA5638.1050000@dls.net>
	<gqdlka$cbd$1@ger.gmane.org>
In-Reply-To: <gqdlka$cbd$1@ger.gmane.org>
Subject: Re: Package Maintenance
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
X-List-Received-Date: Wed, 25 Mar 2009 18:15:05 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Koen Kooi wrote:
> On 25-03-09 17:05, Mike (mwester) wrote:
>> Koen Kooi wrote:
>>> On 25-03-09 09:51, Frans Meulenbroeks wrote:
>>>
>>>> and a last last thing: about the vetting: not sure whether I fully
>>>> understand the idea, but is a lot of this info on what builds on what
>>>> not already present in tinderbox?
>>>
>>> The tinderbox data is purged periodically, so don't depend on it.
>>
>> In addition, you cannot determine which builds in tinderbox were done
>> with an empty TMPDIR -- and unless you have an empty TMPDIR, there's
>> really no complete test.
> 
> Empty TMPDIR is only once case we should test for, I've seen many times
> that a 'populated' TMPDIR creates bugs, e.g. midori picking up libhildon
> to mention a recent one. So 'always build from empty TMPDIR' will leave
> serious and harder to trackdown bugs unnoticed.
> Another example: building qt/e for ppc405 will OOM[1] if you have a
> populated TMPDIR, it will work fine from scratch.
> We should certainly do builds from scratch to track down dependency and
> process bugs, but let's not forget about non-empty TMPDIR bugs.
> 
> regards,
> 
> Koen
> 
> [1] It took me a while to track that one down, since the OOM would
> either take sshd down as well, or just lock up the box.

Fair point -- which brings up a related area, which is parallel-enabled
builds.  Recipes and dependencies may behave differently due to Makefile
bugs, or inadequately-stated dependencies.

I guess we can't test everything, but we should agree about some minimum
standards to determine the "goodness" of a recipe.  I just don't know if
we can all agree on that minimum! :-)

Mike (mwester)


