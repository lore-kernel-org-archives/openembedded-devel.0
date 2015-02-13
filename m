Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 27E9B73405
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Feb 2015 11:10:07 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 53C6DF811D7; Fri, 13 Feb 2015 04:10:07 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id C6A4FF811D7;
	Fri, 13 Feb 2015 04:10:06 -0700 (MST)
Message-ID: <54DDDBA1.7050100@mlbassoc.com>
Date: Fri, 13 Feb 2015 04:10:25 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: Paul Eggleton <paul.eggleton@linux.intel.com>, 
	Martin Jansa <martin.jansa@gmail.com>
References: <1422971047-17965-1-git-send-email-gary@mlbassoc.com>
	<20150212183043.GF2272@jama> <54DD1C8B.90205@mlbassoc.com>
	<101705652.1SzHARi5R4@peggleto-mobl5.ger.corp.intel.com>
In-Reply-To: <101705652.1SzHARi5R4@peggleto-mobl5.ger.corp.intel.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Fri, 13 Feb 2015 11:10:09 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-02-13 03:58, Paul Eggleton wrote:
> On Thursday 12 February 2015 14:35:07 Gary Thomas wrote:
>> On 2015-02-12 11:30, Martin Jansa wrote:
>>> On Tue, Feb 03, 2015 at 06:44:07AM -0700, Gary Thomas wrote:
>>>> mplayer2 no longer needs to be blacklisted as OE-core has moved
>>>> to libav_9.16
>>>
>>> Please fix following issues before blacklisting it:
>>> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libpostproc,
>>> but it isn't a build dependency? [build-deps]
>>> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libvorbis, but
>>> it isn't a build dependency? [build-deps]
>>> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on libxscrnsaver,
>>> but it isn't a build dependency? [build-deps]
>>> mplayer2-2.0+gitrAUTOINC+2c378c71a4: mplayer2 rdepends on mpg123, but it
>>> isn't a build dependency? [build-deps]
>>
>> This must be an inferred dependency as mpg123 is not in meta-oe, but
>> rather meta-multimedia and it is possible to build mplayer using only
>> meta-oe and not meta-multimedia.  How should that be handled?
>
> Should mplayer2 in fact be moved to meta-multimedia? I can't see any
> dependencies on it in meta-oe itself, only gnome-player in meta-gnome seems to
> need it.

Sounds reasonable, but not my call.  I just wanted to get it
officially un-blacklisted so I can stop doing it in my own layers :-)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

