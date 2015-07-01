Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by mail.openembedded.org (Postfix) with ESMTP id BE9C975BF3
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Jul 2015 15:53:18 +0000 (UTC)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 03C08F811DE; Wed,  1 Jul 2015 09:53:18 -0600 (MDT)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=0.8 required=10.0 tests=ALL_TRUSTED,BAYES_00,
	DNS_FROM_AHBL_RHSBL autolearn=no version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id 921F3F811DB;
	Wed,  1 Jul 2015 09:53:15 -0600 (MDT)
Message-ID: <55940D1B.2070105@mlbassoc.com>
Date: Wed, 01 Jul 2015 09:54:03 -0600
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.7.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1435697730-12800-1-git-send-email-gary@mlbassoc.com>	<5593A340.8030507@windriver.com>
	<5593F569.2080008@mlbassoc.com>
	<CAJTo0LZVwcE2JHe5CAaaXHHKKMPJdWqC2Tw_OTQfaza_2DTcCQ@mail.gmail.com>
In-Reply-To: <CAJTo0LZVwcE2JHe5CAaaXHHKKMPJdWqC2Tw_OTQfaza_2DTcCQ@mail.gmail.com>
Subject: Re: [meta-browser][PATCH v2] chromium: List all PACKAGECONFIG settings to avoid warning
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
X-List-Received-Date: Wed, 01 Jul 2015 15:53:22 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2015-07-01 09:47, Burton, Ross wrote:
> On 1 July 2015 at 15:12, Gary Thomas <gary@mlbassoc.com> wrote:
>
>> No, it's much better to use the standard mechanism (PACKAGECONFIG) rather
>> than making up something special for this recipe.  The patch is needed only
>> to suppress warnings about how it's being used.
>>
>
> I kinda of agree with Robert here - the standard method isn't being used,
> but the variable is being used.

Actually, it *is* using PACKAGECONFIG correctly for some of the settings.

>
> As the chromium recipe doesn't inherit autotools EXTRA_OECONF will only be
> set by the PACKAGECONFIG handler, so it would be an improvement if the
> enable/disable arguments were specified as usual in the flags and then
> EXTRA_OEGYP just included EXTRA_OECONF.  (untested but might work, cmake
> recipes certainly did this)

I didn't write this recipe and just wanted to reduce the warnings.
If someone else wants to rework it, that would be great.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------

