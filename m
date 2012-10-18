Received: from mail.mlbassoc.com ([65.100.170.105] helo=mail.chez-thomas.org)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gary@mlbassoc.com>) id 1TOvAh-0006BP-Va
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Oct 2012 20:50:20 +0200
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 0F172F8121F; Thu, 18 Oct 2012 12:28:22 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 68958F81205;
	Thu, 18 Oct 2012 12:28:19 -0600 (MDT)
Message-ID: <50804A6C.5020607@mlbassoc.com>
Date: Thu, 18 Oct 2012 12:29:00 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1350579089-23342-1-git-send-email-gary@mlbassoc.com>
	<20121018174642.GC3087@jama.jama.net>
In-Reply-To: <20121018174642.GC3087@jama.jama.net>
Subject: Re: [PATCH] [meta-oe] libav: Fix git URI
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
X-List-Received-Date: Thu, 18 Oct 2012 18:50:20 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-10-18 11:46, Martin Jansa wrote:
> On Thu, Oct 18, 2012 at 10:51:29AM -0600, Gary Thomas wrote:
>> Specifying SRCREV and branch in the git SRC_URI confuses the bitbake
>> fetcher.  This ends up with a saved tarball which contains neither
>> the SRCREV nor the branch, which in turn means the git tree needs
>> to be fetched every time even though a saved tarball has been created.
>
> That's fetcher fault.
>
> Branch is part of persistent db key for LOCALCOUNT, so this breaks
> upgrade path.
>
> Also AUTOREV wont work without branch specified in SRC_URI.

AUTOREV is not being used, so how does your comment apply?

>
> Fix bitbake fetcher instead.
>
> Cheers,
>
>
>> Simply removing the branch (which is redundant anyway) from the SRC_URI
>> makes everything happy.
>>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>   meta-oe/recipes-multimedia/libav/libav_0.8.3.bb |    4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
>> index 66a32c9..f9a2e06 100644
>> --- a/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
>> +++ b/meta-oe/recipes-multimedia/libav/libav_0.8.3.bb
>> @@ -6,13 +6,13 @@ LIC_FILES_CHKSUM = "file://COPYING.GPLv2;md5=b234ee4d69f5fce4486a80fdaf4a4263 \
>>                       file://COPYING.LGPLv3;md5=e6a600fd5e1d9cbde2d983680233ad02"
>>
>>   PV = "0.8.3+git${SRCPV}"
>> -PR = "${INC_PR}.0"
>> +PR = "${INC_PR}.1"
>>
>>   # When bumping SRCREV make sure you bump PR here and in dependant
>>   # recipes (gst-ffmpeg, gnash, omxil, etc) to account for SOVERSION
>>   # changes
>>   SRCREV = "2fb4be9a99a2c2a9435339830e3d940171cc0d9b"
>> -SRC_URI = "git://git.libav.org/libav.git;protocol=git;branch=release/0.8"
>> +SRC_URI = "git://git.libav.org/libav.git;protocol=git"
>>
>>   S = "${WORKDIR}/git"
>>
>> --
>> 1.7.9.5
>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


