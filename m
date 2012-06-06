Received: from sanddollar.geekisp.com ([216.168.135.167])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philip@balister.org>) id 1ScQ2z-00029w-KQ
	for openembedded-devel@lists.openembedded.org;
	Thu, 07 Jun 2012 01:53:53 +0200
Received: (qmail 19273 invoked by uid 1003); 6 Jun 2012 23:43:25 -0000
Received: from unknown (HELO ?192.168.1.108?) (philip@opensdr.com@71.171.27.98)
	by mail.geekisp.com with (DHE-RSA-AES256-SHA encrypted) SMTP;
	6 Jun 2012 23:43:24 -0000
Message-ID: <4FCFEB16.1010309@balister.org>
Date: Wed, 06 Jun 2012 19:43:18 -0400
From: Philip Balister <philip@balister.org>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.24) Gecko/20111108 Fedora/3.1.16-1.fc14 Thunderbird/3.1.16
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1338996004-32583-1-git-send-email-daniel.mcdougall@liftoffsoftware.com>	<1338996004-32583-2-git-send-email-daniel.mcdougall@liftoffsoftware.com>	<4FCF76D6.4040909@mlbassoc.com>	<20120606153232.GE3140@jama.jama.net>
	<CAG3aBq5_5y2QTHu94HYZ-hY+J0i23tsfiRcc58NWQYLUaJ8VkQ@mail.gmail.com>
In-Reply-To: <CAG3aBq5_5y2QTHu94HYZ-hY+J0i23tsfiRcc58NWQYLUaJ8VkQ@mail.gmail.com>
X-Enigmail-Version: 1.1.2
Subject: Re: [meta-oe][PATCH v2 2/2] python-numpy : Correct difflib	dependency.
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
X-List-Received-Date: Wed, 06 Jun 2012 23:53:53 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 06/06/2012 12:33 PM, Daniel McDougall wrote:
> On Wed, Jun 6, 2012 at 11:32 AM, Martin Jansa <martin.jansa@gmail.com>wrote:
> 
>> On Wed, Jun 06, 2012 at 09:27:18AM -0600, Gary Thomas wrote:
>>> On 2012-06-06 09:20, Dan McDougall wrote:
>>>> The previous patch had python-diffutils when it should have been
>>>> python-difflib.
>>>>
>>>> Signed-off-by: Dan McDougall<daniel.mcdougall@liftoffsoftware.com>
>>>> ---
>>>>   .../recipes-devtools/python/python-numpy_1.4.1.bb  |    2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bbb/meta-oe/recipes-devtools/python/
>> python-numpy_1.4.1.bb
>>>> index bae624e..702f224 100644
>>>> --- a/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
>>>> +++ b/meta-oe/recipes-devtools/python/python-numpy_1.4.1.bb
>>>> @@ -26,6 +26,6 @@ SRC_URI[md5sum] = "5c7b5349dc3161763f7f366ceb96516b"
>>>>   SRC_URI[sha256sum] =
>> "2e7bb84573e5123e07f3c919fd433bc09b78d606252b6b719e385c2a981d8e06"
>>>>
>>>>   RDEPENDS_${PN} = "python-unittest \
>>>> -                  python-diffutils \
>>>> +                  python-difflib \
>>>>                     python-pprint \
>>>>                    "
>>>
>>> Since these patches have not yet been accepted/merged, shouldn't
>>> you squash them into one?
>>
>> And interestingly someone found completely different set of deps a while
>> ago..
>>
>> http://patchwork.openembedded.org/patch/3011/
>>
>> Cheers,
>>
>> --
>> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>>
> Well, Koen already committed my previous patch so I submitted the difflib
> fix for that.  I included it as a 2/2 for context (not sure if that's the
> right thing to do).
> 
> As for that other patch's dependencies, they're not correct:  I have numpy
> installed on my Beaglebone right now and it works great without
> python-mmap, python-compiler, python-pydoc, or python-pkgutil.
>  python-unittest is definitely required though but that's in my patch
> already.
> 

I wonder if you take a different path through numpy, will it import some
additional python modules?

Philip


