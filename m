Return-Path: <cshored@thecshore.com>
Received: from mail.thecshore.com (mail.thecshore.com [144.217.14.6])
	by mail.openembedded.org (Postfix) with ESMTP id 53A0778258
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 30 Jan 2018 10:11:17 +0000 (UTC)
Received: from [10.50.1.148] (135-23-247-100.cpe.pppoe.ca [135.23.247.100])
	by mail.thecshore.com (Postfix) with ESMTPSA id 3A6E32657;
	Tue, 30 Jan 2018 05:11:18 -0500 (EST)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.thecshore.com 3A6E32657
Authentication-Results: mail.thecshore.com;
	dmarc=none (p=none dis=none) header.from=thecshore.com
Authentication-Results: mail.thecshore.com;
	spf=fail smtp.mailfrom=cshored@thecshore.com
DKIM-Filter: OpenDKIM Filter v2.11.0 mail.thecshore.com 3A6E32657
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thecshore.com;
	s=default; t=1517307078;
	bh=IfrEwVGbFycrX5JghRpHTIahQgfCEGZxLszT70PMUbw=;
	h=Subject:To:References:From:Date:In-Reply-To:From;
	b=IUhra3UFOoJ39LyB/ZwuqUBK4zqOv2dKoO7dUQrqVUKvGnb7kYuKjehUJsKVXTbLM
	buI9kVyL0RW7voZlL0wbcN2HL6ayIboWplPBQHhP4lM8BRxIreRbjiXmJjCJZUevky
	kvv8wZF2Gp8UYliU8CtjkxuNLNI/1Y4XPZR2sWuk=
X-Virus-Status: Clean
X-Virus-Scanned: clamav-milter 0.99.2 at mail.thecshore.com
To: Khem Raj <raj.khem@gmail.com>, openembedded-devel@lists.openembedded.org
References: <4e5a0f53-a5eb-a4d4-2030-d7580d16bac3@thecshore.com>
	<d688a031-3567-7501-f870-a97216345b6a@gmail.com>
From: "Daniel F. Dickinson" <cshored@thecshore.com>
Message-ID: <af3f5f69-5316-31ef-2748-db880020850e@thecshore.com>
Date: Tue, 30 Jan 2018 05:11:17 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.5.2
MIME-Version: 1.0
In-Reply-To: <d688a031-3567-7501-f870-a97216345b6a@gmail.com>
Subject: Re: Per-binary-package LICENSE? and/or dependent on PACKAGECONFIG?
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
X-List-Received-Date: Tue, 30 Jan 2018 10:11:18 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-CA
Content-Transfer-Encoding: 8bit

On 30/01/18 01:50 AM, Khem Raj wrote:
> 
> 
> On 1/29/18 5:38 PM, Daniel F. Dickinson wrote:
>> Hi all,
>>
>> I have a question about packages which by default don't ship e.g. LGPL 
>> code in their binaries, but if a configure option is turned on then 
>> the package generates examples / test programs that are LGPL (in this 
>> case due to a shell script from shunit2).
>>
>> How can you define the LICENSE so that it's correct in each case?
>>
>> Is it possible to do e.g. LICENSE_ LICENSE_${PN}-examples, etc?
> 
> yes, you should be able to define per package license. May be its better 
> to separate such output artifacts into separate packages and then use 
> the above LICENSE_packagename constructs.

Yes, that is what I was thinking.

> 
> Now, if the license gets changed for binary due to some configure option
> then its not well tracked. Probably its better to have a separate recipe 
> for such cases.

Well, the configure option would end up creating (by default off) the 
${PN}-examples package so the above should still work, without needing 
an entirely separate recipe.  Now if it were the case there were a 
binary that had one license in one case and a pair of licenses in 
another, it'd be as you say.

> 
>>
>> What about making LICENSE contents conditional on PACKAGECONFIG
>> (for if the offending examples are built)?
> 
> If packages are well defined then you might not need this.
> 
>>
[snip]
>> that there are likely many users of this library yet; it really is 
>> primarily useful for the work I'm doing on munging Openwrt packages 
>> like procd and netifd which depend on ubus and libubox so they are 
>> useful outside Openwrt.
> 
> I think these packages should be left to meta-openwrt. They are not so 
> common and meta-oe is not right place for them. So send a patch to 
> delete them.

Ok, that makes sense.  I have some ideas on how to have both the openwrt 
case and the standalone case in meta-openwrt.  For that meta-openwrt vs. 
standalone procd though, I'm more interested in getting things in shape 
so that hopefully one can build a system as trimmed down as openwrt, and 
therefore that maybe openwrt can become part of the openembedded 
ecosystem instead of being an isolated thing.

[snip]

>> The real question is whether there is any *modern* *Linux* embedded 
>> hardware where that's a big deal.  Obviously old routers with 8MB 
>> flash and 128 MB RAM it matters, but I'm have no insight into how 
>> common that size of hardware is in any new development.
> 
> there still are designs which are relevant to this size, especially 
> smaller wifi APs for e.g mesh networking, so it does have an appeal but 
> its not a common case anymore,

Hmmm....well I do have some hardware that's small enough that systemd 
could be problematic (128 to 256 MB RAM, and 16 - 32 MB flash), so I 
think I'll continue on with the meta-openwrt work for those cases.

>> If not much, then a better road for me would be to deal with UX for 
>> headless (e.g. network/web) systemd builds.
> 
> probably, is a good place for slightly bigger h/w with say 512M+ ram

This is more the space I'm interested in for forward-looking 
development, and I have a few projects in mind, but working meta-openwrt 
is a good way to get a handle on how things integrate in openembedded 
(since I have to under the core to make the openwrt stuff fit).

Regards,

Daniel

