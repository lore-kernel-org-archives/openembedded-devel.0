Received: from hermes.mlbassoc.com ([64.234.241.98] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1Q806P-0003wE-BM
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Apr 2011 03:03:13 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 999)
	id 21E5A16606FE; Thu,  7 Apr 2011 19:00:50 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2-r929478 (2010-03-31) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2-r929478
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by mail.chez-thomas.org (Postfix) with ESMTP id 215E216605F5;
	Thu,  7 Apr 2011 19:00:49 -0600 (MDT)
Message-ID: <4D9E5E41.7040400@mlbassoc.com>
Date: Thu, 07 Apr 2011 19:00:49 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101209 Fedora/3.1.7-0.35.b3pre.fc13
	Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <BANLkTimXZfFJORrAqT9JO1hHVGWenjAfAA@mail.gmail.com>	<BANLkTimdVLseS5y=VvMmZoy5F62S4y4TwA@mail.gmail.com>
	<BANLkTi=+XNv7QM+9cbb2tZ7o6-DTaYkGxQ@mail.gmail.com>
In-Reply-To: <BANLkTi=+XNv7QM+9cbb2tZ7o6-DTaYkGxQ@mail.gmail.com>
Subject: Re: How do I install python modules for use within recipes?
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
X-List-Received-Date: Fri, 08 Apr 2011 01:03:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 04/07/2011 06:53 PM, Charles Manning wrote:
> Thanks
>
> What's the story with org.openembedded.dev/contrib/python/generate-manifest*
>
> Do I have to modify that?

No, that's for the internal Python modules.

n.b. don't top post :-)

> On Fri, Apr 8, 2011 at 12:07 PM, Robert Foerster<robert@erafx.com>  wrote:
>> On Thu, Apr 7, 2011 at 7:51 PM, Charles Manning<cdhmanning@gmail.com>wrote:
>>
>>> Hi
>>>
>>> I have a project which uses python as part of the building process to
>>> generate some C code from some XML which is then later compiled.
>>>
>>> The python script uses the python lxml module.
>>>
>>> My recipe has a do_compile as follows:
>>>
>>> do_compile() {
>>>         cd ${S}/
>>>         make -f Gencode.mk
>>>         make
>>> }
>>>
>>> During the make -f Gencode.mk, the python script which imports lxml
>>> fails to do so and fails.
>>>
>>> Question: How do I instruct OE to set up the lxml module and make it
>>> available here?
>>>
>>>
>> I don't see a recipe for python-lxml-native, so you'll likely have to make
>> one (and then make your recipe depend on it to ensure it's built and
>> available).
>>
>> There are several other python-*-native modules in OE, take a look at what
>> they're doing.
>> http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/python
>>
>>
>>
>>
>>> Thanks
>>>
>>> Charles
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
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


