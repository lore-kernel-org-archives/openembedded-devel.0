Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1SHvVr-0007QT-RB
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2012 13:15:00 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 9A496F8121D; Wed, 11 Apr 2012 05:05:42 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from hermes.chez-thomas.org (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 668EAF81204;
	Wed, 11 Apr 2012 05:05:41 -0600 (MDT)
Message-ID: <4F856585.7040707@mlbassoc.com>
Date: Wed, 11 Apr 2012 05:05:41 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:11.0) Gecko/20120329 Thunderbird/11.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAOHjBZuGf-wG2jpSR1R9sM_KawN+5H9ZS_ivikYgfMvLJVVtXQ@mail.gmail.com>
	<4F855F1A.6090700@mlbassoc.com>
	<CAOHjBZssQBxkwe-qpTQz8mubiB1tAZ5ohKbhFapw3BqiYxqA7g@mail.gmail.com>
In-Reply-To: <CAOHjBZssQBxkwe-qpTQz8mubiB1tAZ5ohKbhFapw3BqiYxqA7g@mail.gmail.com>
Subject: Re: [oe-core] THISDIR usage
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
X-List-Received-Date: Wed, 11 Apr 2012 11:15:00 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable

On 2012-04-11 04:52, Giuseppe Condorelli wrote:
> Many thanks for the reply, I tried the suggestion but I obtained this:
>
> "Unable to fetch URL file://myfile.tar.gz from any source"
>
> What's happening?

Does your layer look like the pseudo tree quoted below?  Can you send the
results of 'tree meta-giuseppe'?

One way to get a glimpse of where bitbake is looking for your file is to
use strace (GIANT hammer) like this:
   % strace -o /tmp/xx.bb -f bitbake some-recipe
   % grep myfile.tar.gz /tmp/xx.bb
This way you can see the paths being searched.

> Il giorno mercoled=EC 11 aprile 2012, Gary Thomas ha scritto:
>
>> On 2012-04-11 04:23, Giuseppe Condorelli wrote:
>>
>>> Hi, I moved to OE-Core (working on stable version dowloaded as tar fi=
le
>>> from cgit.openembedded.org).
>>> I'm in trouble trying to include a source through .bbappend file, loc=
ated
>>> under my meta-<personal>   subtree.
>>>
>>> FILESPATHBASE_prepend :=3D "${THISDIR}/files:"
>>> SRC_URI +=3D "file://myfile.tar.gz"
>>>
>>> results in a no such file or directory. Please can you tell me if I'm
>>> missing anything?
>>>
>>
>> Assuming your tree looks something like this [partial]:
>>
>>   meta-giuseppe:
>>     recipes:
>>       some-recipe:
>>         some-recipe_1.2.3.bbappend
>>         files:
>>           myfile.tar.gz
>>
>> Try using this instead
>>   FILESEXTRAPATHS_prepend :=3D "${THISDIR}/files:"

--=20
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


