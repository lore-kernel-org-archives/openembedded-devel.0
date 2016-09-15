Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 352C97327F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Sep 2016 09:36:29 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <1473884049-27152-1-git-send-email-schnitzeltony@googlemail.com>
	<1473884049-27152-2-git-send-email-schnitzeltony@googlemail.com>
	<CA+chaQdQZLYvVssqqR0-0JPBPHzWSYPTZb1ROro+QKqx3vKMRg@mail.gmail.com>
	<CALbNGRTg=j3JGSN4CZm9uSEGXy1-1OWX9i3sP9UHefdiiZQOwA@mail.gmail.com>
	<CA+chaQcd6S4wmUNWvqVfiRV_6f1KV4=+7VHoMtUJ5KkTdJJ8ag@mail.gmail.com>
	<CALbNGRQTdt7fGPHOtpDooRLSgmi1d3CzK4sYAwRZ2K52uAtVsA@mail.gmail.com>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <7e5d5d17-3b79-71dc-3fe7-d2a02e5526e5@embed.me.uk>
Date: Thu, 15 Sep 2016 10:36:57 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRQTdt7fGPHOtpDooRLSgmi1d3CzK4sYAwRZ2K52uAtVsA@mail.gmail.com>
Subject: Re: [PATCH] samba: unblacklist and link with bfd on arm only
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 15 Sep 2016 09:36:32 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 8bit

On 15/09/16 10:14, Andreas Müller wrote:
> On Thu, Sep 15, 2016 at 10:03 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> WARN: samba: samba rdepends on libpam, but it isn't a build dependency?
>>
>> is reported in every report (where samba was successfully built)
>> http://www.openembedded.org/wiki/Bitbake_World_Status for more than a year
>> - pam isn't in typical 'crowded' sysroot unless you have pam in
>> DISTRO_FEATURES and it might be always detected when you have pam in
>> DISTRO_FEATURES.
>>
>> There is also at least one report where it failed with ld.gold also for
>> qemux86, e.g.:
>> http://errors.yoctoproject.org/Errors/Details/75447/
>>
>> I'll of course include these changes in next jenkins build to report which
>> failures it will re-introduce.
>>
> I cannot check this now - tested at home - but as far as I can
> remember I have pam in DISTRO_FEATURES.
>
> Whatever:
>
> * I will check for pam and send a follow up if necessary
> * autobuilder will tell us if other archs need bfd too - if so I will take care
>
> Andreas
>

I built samba yesterday on master without any changes apart from 
removing the blacklist. Built on corei7 and arm64 without any 
warnings/issues. I don't have pam in my DISTRO_FEATURES. All standard 
toolchain setup.

