Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 548A273450
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Feb 2015 21:34:59 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id C855CF811DC; Thu, 12 Feb 2015 14:34:54 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 07718F811D8;
	Thu, 12 Feb 2015 14:34:50 -0700 (MST)
Message-ID: <54DD1C8B.90205@mlbassoc.com>
Date: Thu, 12 Feb 2015 14:35:07 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Martin Jansa <martin.jansa@gmail.com>, 
	openembedded-devel@lists.openembedded.org
References: <1422971047-17965-1-git-send-email-gary@mlbassoc.com>
	<20150212183043.GF2272@jama>
In-Reply-To: <20150212183043.GF2272@jama>
Subject: Re: [meta-oe][PATCH] mplayer2: Remove blacklist
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
X-List-Received-Date: Thu, 12 Feb 2015 21:35:00 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-02-12 11:30, Martin Jansa wrote:
> On Tue, Feb 03, 2015 at 06:44:07AM -0700, Gary Thomas wrote:
>> mplayer2 no longer needs to be blacklisted as OE-core has moved
>> to libav_9.16
>
> Please fix following issues before blacklisting it:
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc,
> but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but
> it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver,
> but it isn't a build dependency? [build-deps]
> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it
> isn't a build dependency? [build-deps]

This must be an inferred dependency as mpg123 is not in meta-oe, but
rather meta-multimedia and it is possible to build mplayer using only
meta-oe and not meta-multimedia.  How should that be handled?

> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on portaudio-v19,
> but it isn't a build dependency? [build-deps]
>
>> Signed-off-by: Gary Thomas <gary@mlbassoc.com>
>> ---
>>   meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb | 2 --
>>   1 file changed, 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
>> index 7c04ff1..089aa15 100644
>> --- a/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
>> +++ b/meta-oe/recipes-multimedia/mplayer/mplayer2_git.bb
>> @@ -13,8 +13,6 @@ RCONFLICTS_${PN} = "mplayer"
>>   LICENSE = "GPLv3"
>>   LIC_FILES_CHKSUM = "file://LICENSE;md5=d32239bcb673463ab874e80d47fae504"
>>
>> -PNBLACKLIST[mplayer2] ?= "Requires newer libav which has negative D_P"
>> -
>>   SRC_URI = "git://repo.or.cz/mplayer.git \
>>       file://0001-configure-don-t-disable-ASS-support-when-explicitly-.patch \
>>   "
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

