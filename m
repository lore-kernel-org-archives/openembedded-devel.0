Received: from [64.18.0.26] (helo=exprod5og113.obsmtp.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martyn.welch@gefanuc.com>) id 1MdgIJ-000804-QR
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 Aug 2009 10:13:20 +0200
Received: from source ([4.78.218.129]) (using TLSv1) by
	exprod5ob113.postini.com ([64.18.4.12]) with SMTP
	ID DSNKSouwGUyyyG212f3hwf6i/sQs6KtQQrDk@postini.com;
	Wed, 19 Aug 2009 00:56:11 PDT
Received: from unknown (HELO alpmlip01.e2k.ad.ge.com) ([3.159.17.48])
	by Cinmlip06.e2k.ad.ge.com with ESMTP; 19 Aug 2009 03:56:03 -0400
Received: from es-j7s4d2j.amer.consind.ge.com (HELO [3.138.54.92])
	([3.138.54.92])
	by alpmlip01.e2k.ad.ge.com with ESMTP; 19 Aug 2009 03:56:02 -0400
Message-ID: <4A8BB046.9030206@gefanuc.com>
Date: Wed, 19 Aug 2009 08:56:54 +0100
From: Martyn Welch <martyn.welch@gefanuc.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090608)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1250260162-9541-1-git-send-email-oe-devel@rolf.leggewie.biz>
	<b6ebd0a50908181024p6ad06490q108638a35c0dca82@mail.gmail.com>
In-Reply-To: <b6ebd0a50908181024p6ad06490q108638a35c0dca82@mail.gmail.com>
Subject: Re: [PATCH] base.bbclass: introduce OE source mirror network as last resort for do_fetch
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
X-List-Received-Date: Wed, 19 Aug 2009 08:13:20 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Chris Larson wrote:
> On Fri, Aug 14, 2009 at 7:29 AM, Rolf
> Leggewie<oe-devel@rolf.leggewie.biz> wrote:
>   
>> Updating recipes and checksums.ini for vanishing upstream hosts or simple
>> restructuring can quickly become a chore for OE devs if taken seriously.
>> The OE user experience suffers severely when at any given point in time 4
>> to 5 recipes on average fail do_fetch for a simple image.
>>
>> The solution is for OE to provide its own caching of upstream sources.
>> mirrors.openembedded.org is a swarm of possibly incomplete source mirrors
>> provided by the community and load-balanced via DNS round robin.  They
>> act as a first line of defense and lower bandwidth load on melo which
>> hosts sources.openembedded.org.  The melo mirror aims to have a complete
>> copy of free-to-publish sources used by the current org.oe.dev branch.
>>
>> Some distributions have provided source mirrors in the past for their
>> users. I think it's time for a general and all-encompassing solution.
>>
>> The infrastructure is being currently put in place.  This patch will
>> turn on the OE sources mirror network by default.
>>     
>
> Looks like a good idea to me.  404s cause a great deal of difficulty
> for the userbase
On that note we just ran a "quick" test on OE, basically:

find openembedded -name "*.bb" -exec bitbake -c fetch -b {} \;

The following files seem to be pulling "index.html" files instead of the 
intended packages, I assume because the file/project account has 
moved/vanished:

recipes/balsa/balsa_2.0.17.bb
recipes/zd1211/zd1211_r83.bb
recipes/zd1211/zd1211_r85.bb
recipes/zd1211/zd1211_r77.bb
recipes/mtools/mtools_3.9.11.bb
recipes/mtools/mtools-native_3.9.11.bb
recipes/qxmp/qxmp_1.0.bb
recipes/murasaki/murasaki_0.8.8.bb
recipes/uim/uim-native_1.3.1.bb
recipes/uim/uim_1.3.1.bb
recipes/tmsnc/tmsnc_0.3.2.bb
recipes/ttf-fonts/ttf-sazanami_20040629.bb
recipes/qpe-gaim/qpe-libgaim_1.5.0.bb

I haven't had a chance to get any further.

Martyn

-- 
Martyn Welch MEng MPhil MIET (Principal Software Engineer)   T:+44(0)1327322748
GE Fanuc Intelligent Platforms Ltd,        |Registered in England and Wales
Tove Valley Business Park, Towcester,      |(3828642) at 100 Barbirolli Square,
Northants, NN12 6PF, UK T:+44(0)1327359444 |Manchester,M2 3AB  VAT:GB 927559189


