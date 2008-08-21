Received: from [216.145.245.197] (helo=mx01.dls.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <mwester@dls.net>) id 1KW40u-0007cL-Fw
	for openembedded-devel@openembedded.org; Thu, 21 Aug 2008 08:51:20 +0200
Received: from [209.242.7.188] (helo=[192.168.231.111])
	by mx01.dls.net with esmtpa (Exim 4.63)
	(envelope-from <mwester@dls.net>) id 1KW3zm-0004y7-94
	for openembedded-devel@openembedded.org; Thu, 21 Aug 2008 01:50:10 -0500
Message-ID: <48AD0FD9.4010104@dls.net>
Date: Thu, 21 Aug 2008 01:48:57 -0500
From: "Mike (mwester)" <mwester@dls.net>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US;
	rv:1.8.1.16) Gecko/20080708 Thunderbird/2.0.0.16 Mnenhy/0.7.5.666
MIME-Version: 1.0
References: <1206638249.4514.57.camel@dax.rpnet.com>	<200803272104.30232.openembedded@haerwu.biz>	<47EC3893.80908@whitby.id.au>
	<1206696441.5029.18.camel@dax.rpnet.com>
In-Reply-To: <1206696441.5029.18.camel@dax.rpnet.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: ipkg/opkg offical response
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
X-List-Received-Date: Thu, 21 Aug 2008 06:51:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Richard Purdie wrote:
> On Fri, 2008-03-28 at 10:45 +1030, Rod Whitby wrote:
>> Marcin Juszkiewicz wrote:
>>> So creation of "opkg-nogpg":
>>>
>>> require opkg_svn.bb
>>> EXTRA_OECONF += "--disable-gpg"
>>>
>>> would be nice addon. Creation of "curl-nossl" and selecting it is 
>>> something which should be rather DISTRO choice as it generate same 
>>> packages as "curl" recipe.
>> +1
> 
> Creation of that has my backing too.

The first part of this has been done, and opkg builds.  I'm not sure the
no-gpg version works yet, but that's another issue.

The second part of the proposal above seems to not yet exist
(curl-nossl) -- unless I'm missing something.  There's no bb recipe, and
the existing curl bb file has no DISTRO-specific overrides to remove the
>1MB of stuff it hauls in to replace wget.  Hints anyone?  Is this
supposed to be a separate recipe, that perhaps never got committed?  Or
is there some other magic config stuff that needs to be created?

Mike (mwester)


