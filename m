Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1QyuZ3-0005xB-K9
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Sep 2011 01:51:27 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 7E61816601BA; Wed, 31 Aug 2011 17:46:31 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 33FCB16600B8;
	Wed, 31 Aug 2011 17:46:30 -0600 (MDT)
Message-ID: <4E5EC7D6.7060204@mlbassoc.com>
Date: Wed, 31 Aug 2011 17:46:30 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:6.0) Gecko/20110816 Thunderbird/6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1314811518.1457.10.camel@DaveBeal-Ubuntu-laptop>
	<1314819305.2284.2.camel@scimitar>
	<1314825521.1457.12.camel@DaveBeal-Ubuntu-laptop>
	<1314829829.2284.12.camel@scimitar>
	<1314830344.1457.22.camel@DaveBeal-Ubuntu-laptop>
In-Reply-To: <1314830344.1457.22.camel@DaveBeal-Ubuntu-laptop>
Subject: Re: How to prevent fetching?
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
X-List-Received-Date: Wed, 31 Aug 2011 23:51:27 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2011-08-31 16:39, Dave Beal wrote:
> Thanks again, Joshua.  I found my base.bbclass (in
> sources/openembedded/classes), and sadly, my base_do_fetch() uses
> bb.fetch, not bb.fetch2.

Depending on your system requirements, you may be able to transition to
oe-core or yocto, both of which support fetch2.

> -----Original Message-----
> From: Joshua Lock<josh@linux.intel.com>
> Reply-to: openembedded-devel@lists.openembedded.org
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] How to prevent fetching?
> Date: Wed, 31 Aug 2011 15:30:24 -0700
>
>
> On Wed, 2011-08-31 at 15:18 -0600, Dave Beal wrote:
>> Thank you, Joshua.  I don't know what you mean by "if your metadata uses
>> fetch2".  Is fetch2 some python function?  How would I know if I'm using
>> it?
>
> Fetch2 is a Python module that's part of BitBake. It's used from the
> base_do_fetch() method of base.bbclass.
>
> You can see that OE.dev isn't using  fetch2[1] but OE-Core is[2].
>
> Joshua
>
> 1.
> http://git.openembedded.org/cgit.cgi/openembedded/tree/classes/base.bbclass#n99
> 2.
> http://git.openembedded.org/cgit.cgi/openembedded-core/tree/meta/classes/base.bbclass#n80
>
>
> Dave Beal
> Cardinal Peak
> (303) 665-3962 x124 | Email | vCard
> | Web | Company Blog | LinkedIn
>
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


