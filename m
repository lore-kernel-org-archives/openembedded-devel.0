Return-Path: <prvs=6867199e8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id CD95274F7B
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 06:21:52 +0000 (UTC)
X-IronPort-AV: E=Sophos;i="5.49,475,1520895600"; d="scan'208";a="10649092"
To: Andre McCurdy <armccurdy@gmail.com>, openembeded-devel
	<openembedded-devel@lists.openembedded.org>
References: <20180601114158.24298-1-richard.leitner@skidata.com>
	<ab305d19-628d-097f-9905-e1f724abe6ba@gmail.com>
	<CAJ86T=Ux5-SHTB49_-mUSWFdkEaugnfO=jMSib1o7L17bmV6KA@mail.gmail.com>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <55c11335-a817-fc7f-9675-7f91b0f6613e@skidata.com>
Date: Mon, 4 Jun 2018 08:21:51 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJ86T=Ux5-SHTB49_-mUSWFdkEaugnfO=jMSib1o7L17bmV6KA@mail.gmail.com>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex3srv.skidata.net (192.168.111.81) To
	sdex5srv.skidata.net (192.168.111.83)
Cc: dev@g0hl1n.net
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
X-List-Received-Date: Mon, 04 Jun 2018 06:21:53 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit


On 06/01/2018 08:01 PM, Andre McCurdy wrote:
> On Fri, Jun 1, 2018 at 10:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>> On 6/1/18 4:41 AM, Richard Leitner wrote:
>>> Add version 11 of the pam-plugin-ccreds with the debian patches applied.
>>
>> I see QA errors like below
>>
>> ERROR: pam-plugin-ccreds-11-r0 do_package_qa: QA Issue: non
>> -dev/-dbg/nativesdk- package contains symlink .so: pam-plugin-ccreds
>> path
>> '/work/core2-64-bec-linux-musl/pam-plugin-ccreds/11-r0/packages-split/pam-plugin-ccreds/lib/security/pam_ccreds.so'
>> [dev-so]

Thanks for that information.
Are other targets than "linux-musl" affected?

> 
> According to OE's sanity checks, a .so plug-in should not be a symlink.
> 
> See the do_install_append() in the libcgroup recipe in oe-core for an
> example of how to fix the issue.

IMHO in this case the better solution is to add the missing targets to
the following patch... Or does anybody know how to pass a wildcard like
linux* to AM_CONDITIONAL? Google wasn't very helpful here :-(


>>> diff --git a/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch
>>> new file mode 100644
>>> index 000000000..4f203f1a3
>>> --- /dev/null
>>> +++ b/meta-oe/recipes-extended/pam/pam-plugin-ccreds/0003-Set-EXTENSION_SO-also-for-linux-gnueabi-targets.patch
>>> @@ -0,0 +1,29 @@
>>> +From 12d9bb59284bd01a9fcc3b9280698ffc23ef2ddc Mon Sep 17 00:00:00 2001
>>> +From: Richard Leitner <richard.leitner@skidata.com>
>>> +Date: Fri, 1 Jun 2018 13:24:15 +0200
>>> +Subject: [PATCH 3/3] Set EXTENSION_SO also for linux-gnueabi targets
>>> +
>>> +As EXTENSION_SO gets already set for linux and linux-gnu targets we
>>> +should set it also for linux-gnueabi targets.
>>> +
>>> +Signed-off-by: Richard Leitner <richard.leitner@skidata.com>
>>> +---
>>> + configure.in | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/configure.in b/configure.in
>>> +index 0dbdf79..a434208 100644
>>> +--- a/configure.in
>>> ++++ b/configure.in
>>> +@@ -43,7 +43,7 @@ AC_SUBST(pam_ccreds_so_LD)
>>> + AC_SUBST(pam_ccreds_so_LDFLAGS)
>>> +
>>> + AM_CONDITIONAL(USE_NATIVE_LINKER, test -n "$pam_ccreds_so_LD")
>>> +-AM_CONDITIONAL(EXTENSION_SO, test "$target_os" = "linux" -o "$target_os" = "linux-gnu")
>>> ++AM_CONDITIONAL(EXTENSION_SO, test "$target_os" = "linux" -o "$target_os" = "linux-gnu" -o "$target_os" = "linux-gnueabi")
>>> + AM_CONDITIONAL(EXTENSION_1, test "$TARGET_OS" = "HPUX")
>>> +
>>> + if test -z "$use_gcrypt"; then
>>> +--
>>> +2.11.0

regards;Richard.L

