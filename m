Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-06.prod.phx3.secureserver.net
	(p3plsmtpa07-06.prod.phx3.secureserver.net [173.201.192.235])
	by mail.openembedded.org (Postfix) with ESMTP id 4A65470F83
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 15:51:41 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-06.prod.phx3.secureserver.net with 
	id kFrh1o00P1mTNtu01FriHJ; Thu, 28 Aug 2014 08:51:42 -0700
Message-ID: <53FF500D.8000106@pabigot.com>
Date: Thu, 28 Aug 2014 10:51:41 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>	<1409227581-20888-5-git-send-email-pab@pabigot.com>	<CAJTo0LZtEMeRoxAd9h9K7dQX6peSJRdB+vFGtWQXDSNUC_UPTg@mail.gmail.com>	<53FF2932.7080505@pabigot.com>
	<20140828143228.GF16066@jama>	<53FF498A.8080406@pabigot.com>
	<20140828154701.GH16066@jama>
In-Reply-To: <20140828154701.GH16066@jama>
Subject: Re: [meta-oe][PATCH 4/5] gpsd: add optional support for KPPS interface
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
X-List-Received-Date: Thu, 28 Aug 2014 15:51:47 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2014 10:47 AM, Martin Jansa wrote:
> On Thu, Aug 28, 2014 at 10:23:54AM -0500, Peter A. Bigot wrote:
>> On 08/28/2014 09:32 AM, Martin Jansa wrote:
>>> On Thu, Aug 28, 2014 at 08:05:54AM -0500, Peter A. Bigot wrote:
>>>> On 08/28/2014 07:53 AM, Burton, Ross wrote:
>>>>> On 28 August 2014 13:06, Peter A. Bigot <pab@pabigot.com> wrote:
>>>>>> +PACKAGECONFIG ??= ""
>>>>>> +PACKAGECONFIG[kpps] = ",,pps-tools"
>>>>> That's not actually deterministic - if pps-tools is installed but the
>>>>> packageconfig option is disabled then gpsd will still enable the
>>>>> support.
>>>> Yeah, I'm aware of that.  It's also not something that can be
>>>> controlled, since gpsd's author doesn't believe in configuration options
>>>> to enable features: every capability is enabled or disabled by
>>>> inspecting the environment at compile-time.
>>>>
>>>> Although ntp does support some explicit enable/disable flags, it too
>>>> fails to provide a way to say "Pay no attention to that PPS header, it
>>>> isn't really there."
>>> Then we need to patch their configure.
>>>
>>>> For this situation I don't think there's a big issue.  The PACKAGECONFIG
>>>> setting ensures that the header will be available if the feature is
>>>> desired.  If it happens to be present but PPS support isn't explicitly
>>>> requested, there's no failure in either build or runtime: it's still
>>>> gated by runtime checks for PPS sources and the option being enabled in
>>>> the Linux kernel.  (There are no runtime libraries that need to be
>>>> installed to use KPPS.)
>>>>
>>>> Is this going to be a problem with the patch being accepted?
>>> Yes
>>>
>>> people can be used to have KPPS support enabled by "accident" e.g.
>>> because they are building ntp with KPPS support and pps-tools is almost
>>> always built before gpsd..and then once it's built in different order and end-user will be
>>> surprised by lost KPPS support from gpsd.
>> The number of people who will use KPPS is incredibly small, and nobody's
>> going to use it unintentionally as it requires on-target configuration.
>> Those who need it, though, have no recourse other than to build ntpd or
>> gpsd outside of OE if patches like these aren't present.
>>
>> I understand the reasoning and agree in theory that absolute determinism
>> would be ideal, but believe hacking the ntp and gpsd configuration
>> infrastructure to explicitly disable use of a detected PPS header would
>> present a bigger risk and long-term cost to stability and
>> maintainability in OE than the possibility you've identified.  So that
>> solution isn't something I'm going to take on.
>>
>> An alternative is to add kpps to the default PACKAGECONFIG, so the
>> required header is normally available.  The cost of the feature's
>> presence in the packages is nearly zero (a slight increase in daemon
>> code size, and an extra check when the process starts.)  Would that be
>> acceptable?
> More acceptable than the undeterministic behavior - you should even add
> it to DEPENDS.

So not make it configurable at all?

OK, I think that would be safe, and would eliminate the existing 
non-determinism.  I'll rework the patches to do that.

Peter

>> If we can't come to an agreement, then the only patch that's really
>> important is the first one which restores the ability to diagnose
>> misconfigured NTP systems.  Please let me know whether I should mark the
>> others as withdrawn in patchwork.
>

