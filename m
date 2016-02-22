Return-Path: <pascal.bach@siemens.com>
Received: from thoth.sbs.de (thoth.sbs.de [192.35.17.2])
	by mail.openembedded.org (Postfix) with ESMTP id B462B770F9
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 12:32:21 +0000 (UTC)
Received: from mail1.sbs.de (mail1.sbs.de [192.129.41.35])
	by thoth.sbs.de (8.15.2/8.15.2) with ESMTPS id u1MCWIgS009625
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:32:18 +0100
Received: from [139.16.79.204] (MD1FZU9C.ww002.siemens.net [139.16.79.204])
	by mail1.sbs.de (8.15.2/8.15.2) with ESMTP id u1MCWIgC024846
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 22 Feb 2016 13:32:18 +0100
To: openembedded-devel@lists.openembedded.org
References: <56CAE338.7040002@mlbassoc.com>
	<CA+chaQfxh9R_EN8XSsrPGCv4OsQ31jSTV+EYsFHqJ=thipjAKQ@mail.gmail.com>
	<56CAE68F.4000102@mlbassoc.com>
From: Pascal Bach <pascal.bach@siemens.com>
Message-ID: <56CAFFD2.6090304@siemens.com>
Date: Mon, 22 Feb 2016 13:32:18 +0100
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.6.0
MIME-Version: 1.0
In-Reply-To: <56CAE68F.4000102@mlbassoc.com>
Subject: Re: [meta-browser] ARM support in Chromium
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
X-List-Received-Date: Mon, 22 Feb 2016 12:32:22 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit



Am 22.02.2016 um 11:44 schrieb Gary Thomas:
> On 2016-02-22 11:32, Martin Jansa wrote:
>> Yes it can, because cortex-a7 is armv7a.
>
> My build failed listing the board as not compatible
>   ERROR: Nothing PROVIDES 'chromium'
>   ERROR: chromium was skipped: incompatible with machine teton-p0381 (not in COMPATIBLE_MACHINE)

I think it might be worth to have a look at your MACHINEOVERRIDES variable.
bitbake -e should be of assistance here.

>
>> On Mon, Feb 22, 2016 at 11:30 AM, Gary Thomas <gary@mlbassoc.com> wrote:
>>
>>> A recent change to the chromium recipe restricts it to only
>>> armv6 and armv7a.  I've built (and successfully run) previous
>>> versions of chromium on my LS102x board which is cortexa7hf.
>>> It's not clear to me what arm revision that works out to be
>>> (where does one look for this info?) but I'd like to see if
>>> chromium can still be used on my board?
>>>
>>> Thanks for any pointers
>


