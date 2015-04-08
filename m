Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id 1B07560089
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Apr 2015 21:30:43 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id D3753F811E2; Wed,  8 Apr 2015 15:30:44 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 791E3F811E0;
	Wed,  8 Apr 2015 15:30:44 -0600 (MDT)
Message-ID: <55259E14.40902@mlbassoc.com>
Date: Wed, 08 Apr 2015 15:31:00 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5523E21B.5070100@mlbassoc.com> <5523E2EE.7020904@balister.org>
	<55241991.3090801@mlbassoc.com>
In-Reply-To: <55241991.3090801@mlbassoc.com>
Subject: Re: Issues building vlc
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
X-List-Received-Date: Wed, 08 Apr 2015 21:30:46 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-04-07 11:53, Gary Thomas wrote:
> On 2015-04-07 08:00, Philip Balister wrote:
>> On 04/07/2015 09:56 AM, Gary Thomas wrote:
>>> I'm trying to build vlc and I get this error:
>>> ERROR: Multiple .bb files are due to be built which each provide jpeg
>>> (/local/poky-cutting-edge/meta-oe/recipes-core/jpeg/libjpeg-turbo_8d+1.4.0.bb
>>> /local/poky-cutting-edge/meta/recipes-core/jpeg/jpeg_8d.bb).
>>>   This usually means one provides something the other doesn't and should.
>>>
>>> This comes from the fact that vlc depends on libjpeg-turbo
>>> which conflicts with the main jpeg library in OE-core.
>>>
>>> What's the best way to fix this?
>>
>> This page starts to explain:
>>
>> http://openembedded.org/wiki/PREFERRED_PROVIDER_for_jpeg_and_jpeg-native
>>
>> It could use some work explaining the difference between the two
>> alternatives.
>
> Thanks, that helped.  Sadly, the build of vlc still failed.
>    | arm-amltd-linux-gnueabi-libtool:   error: cannot find the library '' or unhandled argument '-DLINUX=1'
>    | make[6]: *** [libqt4_plugin.la] Error 1
>    | make[6]: Leaving directory `/local/p0382-cutting-edge_2014-11-21/tmp/work/cortexa9hf-vfp-neon-amltd-linux-gnueabi/vlc/2.1.4-r0/build/modules/gui/qt4'
>
> It's not clear at all to me why this fails - any clues?
>
> See http://www.mlbassoc.com/poky/vlc-log.do_compile for the full log
>

This turned out to be a problem with the Qt libraries, but only
on i.MX5/i.MX6 (using meta-fsl-arm)

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

