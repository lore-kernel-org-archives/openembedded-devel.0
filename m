Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 6D54B60809
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 13:51:36 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8FF39F811EE; Wed,  6 Aug 2014 07:51:37 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=ham version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id A1B8BF811ED;
	Wed,  6 Aug 2014 07:51:35 -0600 (MDT)
Message-ID: <53E23302.8070408@mlbassoc.com>
Date: Wed, 06 Aug 2014 07:52:02 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1407331293-4055-1-git-send-email-drew_moseley@mentor.com>	<53E22FBE.4060004@mlbassoc.com>
	<DDDF1E21-0028-492F-B858-9174A09DB1BA@mentor.com>
In-Reply-To: <DDDF1E21-0028-492F-B858-9174A09DB1BA@mentor.com>
Subject: Re: [meta-oe][PATCH] evtest: Provide updated checksums
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 13:51:42 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2014-08-06 07:41, Moseley, Drew wrote:
>
> On Aug 6, 2014, at 9:38 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>
>> On 2014-08-06 07:21, Drew Moseley wrote:
>>> Signed-off-by: Drew Moseley <drew_moseley@mentor.com>
>>> ---
>>>   meta-oe/recipes-support/evtest/evtest_1.25.bb | 4 ++--
>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-oe/recipes-support/evtest/evtest_1.25.bb b/meta-oe/recipes-support/evtest/evtest_1.25.bb
>>> index 640cec0..ccaa0c6 100644
>>> --- a/meta-oe/recipes-support/evtest/evtest_1.25.bb
>>> +++ b/meta-oe/recipes-support/evtest/evtest_1.25.bb
>>> @@ -8,7 +8,7 @@ LIC_FILES_CHKSUM = "file://COPYING;md5=751419260aa954499f7abaabaa882bbe"
>>>   DEPENDS = "libxml2"
>>>
>>>   SRC_URI = "http://cgit.freedesktop.org/~whot/evtest/snapshot/evtest-${PV}.tar.bz2;name=archive"
>>> -SRC_URI[archive.md5sum] = "770d6af03affe976bdbe3ad1a922c973"
>>> -SRC_URI[archive.sha256sum] = "3d34123c68014dae6f7c19144ef79ea2915fa7a2f89ea35ca375a9cf9e191473"
>>> +SRC_URI[archive.md5sum] = "0ef3fe5e20fa2dee8994827d48482902"
>>> +SRC_URI[archive.sha256sum] = "6e93ef54f0aa7d263f5486ce4a14cac53cf50036bfd20cf045fef2b27ee6664b"
>>>
>>>   inherit autotools pkgconfig
>>
>> Why did these change?  It's really BAD practice to have a new/different
>> version of a program with an old name (hence different checksums).
>
> No clue.  I downloaded them today and those were the sums that were there.

Interesting - I have the older tar ball here (from 2012-01-23) and
the contents are identical when extracted, even down to the file
dates, etc.  It must have been repacked recently as the old file
was still in place in June.

All in all, not nice... (not your fault I know)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

