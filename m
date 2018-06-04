Return-Path: <prvs=6867199e8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 38FA1753FC
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 21:03:38 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,477,1520895600"; d="scan'208";a="10668745"
To: Andre McCurdy <armccurdy@gmail.com>
References: <20180601114158.24298-1-richard.leitner@skidata.com>
	<ab305d19-628d-097f-9905-e1f724abe6ba@gmail.com>
	<CAJ86T=Ux5-SHTB49_-mUSWFdkEaugnfO=jMSib1o7L17bmV6KA@mail.gmail.com>
	<6bc9b18c-7104-25ee-e7b5-7b04b7fed07f@skidata.com>
	<CAJ86T=XHwDKdgZX2H-4s+e_m6d2WxRJbSr1AhN-MqJhuX6xNsw@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <de5271c3-23d3-560c-efde-ba52e86b3007@skidata.com>
Date: Mon, 4 Jun 2018 23:03:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=XHwDKdgZX2H-4s+e_m6d2WxRJbSr1AhN-MqJhuX6xNsw@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex5srv.skidata.net (192.168.111.83) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH] pam-plugin-ccreds: add recipe
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
X-List-Received-Date: Mon, 04 Jun 2018 21:03:39 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 06/04/2018 09:34 PM, Andre McCurdy wrote:
> On Sun, Jun 3, 2018 at 11:24 PM, Richard Leitner
> <richard.leitner@skidata.com> wrote:
>> On 06/01/2018 08:01 PM, Andre McCurdy wrote:
>>> On Fri, Jun 1, 2018 at 10:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>>> On 6/1/18 4:41 AM, Richard Leitner wrote:
>>>>> Add version 11 of the pam-plugin-ccreds with the debian patches applied.
>>>>
>>>> I see QA errors like below
>>>>
>>>> ERROR: pam-plugin-ccreds-11-r0 do_package_qa: QA Issue: non
>>>> -dev/-dbg/nativesdk- package contains symlink .so: pam-plugin-ccreds
>>>> path
>>>> '/work/core2-64-bec-linux-musl/pam-plugin-ccreds/11-r0/packages-split/pam-plugin-ccreds/lib/security/pam_ccreds.so'
>>>> [dev-so]
>>
>> Thanks for that information.
>> Do you know if other targets than "linux-musl" are affected?
>>
>>>
>>> According to OE's sanity checks, a .so plug-in should not be a symlink.
>>>
>>> See the do_install_append() in the libcgroup recipe in oe-core for an
>>> example of how to fix the issue.
>>
>> IMHO in this case the better solution is to add the missing targets
>> to the following patch... Or does anybody know how to pass wildcards to
>> string comparisons in AM_CONDITIONAL? Google wasn't very helpful here...
> 
> Untested, but I guess something like this would work:
> 
>   AM_CONDITIONAL(EXTENSION_SO, case "$target_os" in linux*) true;; *)
> false;; esac)

Thank you :-)

> 
> The approach in your patch also looks OK.
> 

Ok. Then I won't send a v3 for that and stay with v2.

