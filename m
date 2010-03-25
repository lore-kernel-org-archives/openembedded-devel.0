Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nuho8-0002Ob-MQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Mar 2010 08:48:49 +0100
Received: by gwaa20 with SMTP id a20so1398376gwa.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Mar 2010 00:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=k+8LGnTUQ6RVV5xRqr265nLaoNFdmlRKxtsCCc1xXCQ=;
	b=QVQmPzgfBwdGNE5uU9i6SetNvXtC/4axK3p9jzKQems0Zx9b/7Kmfsm6ikHJqxwxb8
	H0FsMrVq+uF0fTzxyjuzZOPoZgRZtr+lg8P3dqgBx4n44ad7LfVyUE+GOMjHeK0Ty6TK
	0EIQ0LBdvQIG46XJuXshaA33b6S2AMQXxWy8E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EwI7ak5kD+qioGTpP8eR9sc7PzKbb1CWC57UhC2pEBWub9mzyKys5RNwOn+WvrIhJ5
	tEmMqg6+PUcDScZXz7FmqaTMPfdRGV+m+cfM2UpcfvGwViJ/LWsQMRfSdBsT1afn/PGY
	1ap6lPeplpw3JkGbX4oHsj9WSxVqnWkHnADXw=
MIME-Version: 1.0
Received: by 10.101.79.11 with SMTP id g11mr10032024anl.86.1269503138014; Thu, 
	25 Mar 2010 00:45:38 -0700 (PDT)
In-Reply-To: <1269467167.1681.169.camel@rex>
References: <1269437224.1681.134.camel@rex>
	<ac9c93b11003240815o796152a7y50601b03e91be40@mail.gmail.com>
	<b6ebd0a51003240851i3f91860ia1100c4677569cf6@mail.gmail.com>
	<ac9c93b11003241317y2f6a6bbbs78936ee603d8ce3b@mail.gmail.com>
	<1269467167.1681.169.camel@rex>
Date: Thu, 25 Mar 2010 08:45:37 +0100
Message-ID: <ac9c93b11003250045t34d59be1v5f64165f0066c7b7@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Checksums in Bitbake
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
X-List-Received-Date: Thu, 25 Mar 2010 07:48:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/3/24 Richard Purdie <rpurdie@rpsys.net>:
> On Wed, 2010-03-24 at 21:17 +0100, Frans Meulenbroeks wrote:
>> If a dep is rebuild there is a reason for it (bug fix, packaging
>> changed, changes in exported files etc etc).
>> This might impact the using recipe.
>> If baking a file does not result in a rebuild when a dependency is
>> changed, probably a warning should be given.
>>
>> Encoding the library ABI is only part of the job. You'd also have to
>> take the .h files a package exports into account as constants in it
>> could be changed.
>> And even the using package could change its behaviour (e.g. because
>> configure runs differently).
>> Note also that if we abandon PR we do not really have an easy
>> mechanism to force recompilation of a package (if a depenency changed
>> and we want to force a rebuild).
>
> Its worth noting you can enable this now with BB_STAMP_POLICY. I see
> something similar being the likely outcome with checksums. Some people
> will want the full dependency tree, some people won't. We can support
> both just as we do now.

Supporting both is great.

The reason I brought this up is that for application of OE in
products, reproducability is important.
I've seen too often (also outside OE) that two engineers take the same
source yet still get different results, and that bugs at a customer
site cannot be reproduced in the lab (and yes, I do know there are
other ways to tackle this problem)

The thing I would like to avoid is that different people create
packages/images that look like being the same (e.g. name/ID) yet have
different content.

Or in other words: the problem one could face and that I want to avoid
is that if A depends on B and A is build and works, but afterwards B
is changed and a newly compiled A would have the same name/version but
might behave differently than the old one (e.g. because B changed
something in a .h file).
That could also lead to situations where a local compiled file behaves
differently than the same one you'd get from a feed.
IMHO less desirable.

Frans


