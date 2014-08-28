Return-Path: <pab@pabigot.com>
Received: from p3plsmtpa07-02.prod.phx3.secureserver.net
	(p3plsmtpa07-02.prod.phx3.secureserver.net [173.201.192.231])
	by mail.openembedded.org (Postfix) with ESMTP id 6EDAC60E49
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Aug 2014 13:05:54 +0000 (UTC)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa07-02.prod.phx3.secureserver.net with 
	id kD5u1o00L1mTNtu01D5vaU; Thu, 28 Aug 2014 06:05:56 -0700
Message-ID: <53FF2932.7080505@pabigot.com>
Date: Thu, 28 Aug 2014 08:05:54 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1409227581-20888-1-git-send-email-pab@pabigot.com>	<1409227581-20888-5-git-send-email-pab@pabigot.com>
	<CAJTo0LZtEMeRoxAd9h9K7dQX6peSJRdB+vFGtWQXDSNUC_UPTg@mail.gmail.com>
In-Reply-To: <CAJTo0LZtEMeRoxAd9h9K7dQX6peSJRdB+vFGtWQXDSNUC_UPTg@mail.gmail.com>
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
X-List-Received-Date: Thu, 28 Aug 2014 13:05:57 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 08/28/2014 07:53 AM, Burton, Ross wrote:
> On 28 August 2014 13:06, Peter A. Bigot <pab@pabigot.com> wrote:
>> +PACKAGECONFIG ??= ""
>> +PACKAGECONFIG[kpps] = ",,pps-tools"
> That's not actually deterministic - if pps-tools is installed but the
> packageconfig option is disabled then gpsd will still enable the
> support.

Yeah, I'm aware of that.  It's also not something that can be 
controlled, since gpsd's author doesn't believe in configuration options 
to enable features: every capability is enabled or disabled by 
inspecting the environment at compile-time.

Although ntp does support some explicit enable/disable flags, it too 
fails to provide a way to say "Pay no attention to that PPS header, it 
isn't really there."

For this situation I don't think there's a big issue.  The PACKAGECONFIG 
setting ensures that the header will be available if the feature is 
desired.  If it happens to be present but PPS support isn't explicitly 
requested, there's no failure in either build or runtime: it's still 
gated by runtime checks for PPS sources and the option being enabled in 
the Linux kernel.  (There are no runtime libraries that need to be 
installed to use KPPS.)

Is this going to be a problem with the patch being accepted?

Peter

