Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 7A0F4783FA
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 17:17:17 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id l75so9756588ywc.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Adui11uUqu7/Q77DY7tyg+7v0/OM/ZPQCNrCACaPfIM=;
	b=Y1CvaHzZSAHkVgBJC2B9tsdz15lyvgtfJQHoMwGKEx5zfNhuQ7nb4W/JM2+CuaSxpI
	RLGkmj4JTkkG1vOvCxpjWYbqVJrUHaBuUvgreblzRPprokIIOs41RP7KwX24uIB6L7iH
	pqiXmHvATqqbwA8jo4Q7HWG4d58vLjrewVOh3PcogVgrHQKyKK2xkzDRvESdtMyfPoD+
	rZts4H5cF/2LlPgusAiFrMBxt7F6/Ufx91EHoU8ji5ftTRrJeUeiWn51baJV9qIjp4PP
	H4HZbc6Cli2NKWM1v/M4XYUH7DcxAPuYgOr2g1BbxunIXNdbC0U5Nj/fsXSaFI9p4m5v
	+bfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Adui11uUqu7/Q77DY7tyg+7v0/OM/ZPQCNrCACaPfIM=;
	b=Og20L3XaTIrly1amW/S7I0kq0F/pvVZGBur1IKOhUt3VzhcXwotR4+G9DYO6p7Ffpf
	dvhy3Go0Jnsdhdo+i78li2FobzhzwbLfGKgOmxnDV7i9wDAAIH5OvxL8GMUXhQaZBfjd
	6LsKJOs2HkM9un36+mNXcDWZEIaH4y9OTNHg6/ArB4iyUG8bOYfUwt7/YaJ09V3QZDcM
	lCTxr3buL0HTBnc7K0wTT1TIqdMBLfIfSYgs/eGpEMfObk1R5GBGkCK+poC+4jrcLc7/
	k5Y9i0AMtI2JmmO/mnAG7mYAhHaKSdTSHI3ijXaR0XBJYs+9oAU7qYh211wtB3kHUJrl
	3rBg==
X-Gm-Message-State: AKS2vOwFohtvHMCN1s2ttLn8Dm8wUQAGsFxVUuke2u9hemjd4r8nSdvl
	gYuRvRp5iHT+RjpH7JLd79EdBkOJxg==
X-Received: by 10.129.55.14 with SMTP id e14mr5128057ywa.33.1497547038797;
	Thu, 15 Jun 2017 10:17:18 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 15 Jun 2017 10:17:18 -0700 (PDT)
In-Reply-To: <7c692d80-c09b-798b-6fbe-1edc78572080@xevo.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
	<CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
	<7c692d80-c09b-798b-6fbe-1edc78572080@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2017 19:17:18 +0200
Message-ID: <CA+chaQeAHdzfBAaDcx_LQyFpCs_utwiE0a9Sxk3FoDQR+ridHA@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Koen Kooi <koen@dominion.thruhere.net>,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 00/14] new recipe: open-vm-tools recipe
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
X-List-Received-Date: Thu, 15 Jun 2017 17:17:19 -0000
Content-Type: text/plain; charset="UTF-8"

No problem, I had issues with that script as well, but it works for me if I
provide all necessary params manually (when it doesn't try to figure out
anything).

On Thu, Jun 15, 2017 at 7:07 PM, Martin Kelly <mkelly@xevo.com> wrote:

> On 06/15/2017 09:54 AM, Martin Jansa wrote:
>
>> It didn't make it to patchwork, because you've sent only the cover
>> letter. I've added it to master-next now.
>>
>> Next time please send also individual patches. So that it gets more
>> visibility for other people to comment and also that I can use patchwork
>> to pull it in.
>>
>> Regards,
>>
>>
> Thanks, sorry about that. I was trying to use the send-pull-request script
> and getting errors; somehow it couldn't figure out the branch I was using.
> I tried to fix the script but eventually gave up and did a manual pull
> request attempting to mimic what the script would have spit out.
>
> On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.com
>> <mailto:mkelly@xevo.com>> wrote:
>>
>>     On 06/09/2017 03:22 PM, Martin Kelly wrote:
>>
>>         Hi all,
>>
>>         This patch series adds a new recipe for Open VM Tools to
>>         meta-oe. This
>>         recipe is invaluable for using Openembedded with VMWare, as
>>         without the
>>         tools, performance is very slow.
>>
>>         More information about Open VM Tools can be found here:
>>
>>         https://github.com/vmware/open-vm-tools
>>         <https://github.com/vmware/open-vm-tools>
>>
>>         Please note that, as mentioned in the first commit, this recipe is
>>         modified from the recipe originally found in the Open-Switch
>>         repository.
>>         The first patch is directly from that repository, and the
>> following
>>         patches are modifications to it.
>>
>>         Original recipe:
>>         https://github.com/open-switch/ops-build
>>         <https://github.com/open-switch/ops-build>
>>         yocto/openswitch/meta-foss-openswitch/recipes-extended/open-
>> vm-tools/open-vm-tools_10.0.5.bb
>>         <http://open-vm-tools_10.0.5.bb>
>>
>>         Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>>
>>         Although the original recipe packaging was Apache-licensed, I
>>         received
>>         permission from the author (Diego Dompe) to relicense it under
>>         the MIT
>>         license for inclusion in meta-openembedded:
>>
>>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/01
>> 4715.html
>>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/0
>> 14715.html>
>>         https://lists.openswitch.net/pipermail/ops-dev/2017-April/01
>> 4716.html
>>
>>         <https://lists.openswitch.net/pipermail/ops-dev/2017-April/0
>> 14716.html>
>>
>>         --
>>         The following changes since commit
>>         41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>>
>>           Revert "rrdtool: add gettext-native dependency" (2017-06-05
>>         11:13:09
>>         +0200)
>>
>>         are available in the git repository at:
>>
>>           https://github.com/XevoInc/meta-openembedded
>>         <https://github.com/XevoInc/meta-openembedded>
>>
>>         for you to fetch changes up to
>>         402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>>
>>           open-vm-tools: style changes (2017-06-07 22:31:34 +0000)
>>
>>         ----------------------------------------------------------------
>>         Martin Kelly (14):
>>               add open-vm-tools recipe
>>               open-vm-tools: add missing pkgconfig dependency
>>               open-vm-tools: add missing glib-2.0-native dependency
>>               open-vm-tools: clarify and expand licensing
>>               open-vm-tools: base_contains --> bb.utils.contains
>>               open-vm-tools: update version to 10.1.5
>>               open-vm-tools: don't use mspack
>>               open-vm-tools: don't use dnet-config
>>               open-vm-tools: add #include to fix build break
>>               open-vm-tools: add missing X11 dependencies
>>               open-vm-tools: remove kernel module logic
>>               open-vm-tools: line up configure options
>>               open-vm-tools: support FUSE
>>               open-vm-tools: style changes
>>
>>          .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>>          .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>>          .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35
>> +++++++++
>>          .../0002-configure.ac-don-t-use-dnet-config.patch  | 41
>> ++++++++++
>>          .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++
>>          .../open-vm-tools/open-vm-tools_10.1.5.bb
>>         <http://open-vm-tools_10.1.5.bb>          | 90
>>         ++++++++++++++++++++++
>>          6 files changed, 212 insertions(+)
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/files/tools.conf
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix
>> -kernel-detection.patch
>>
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-con
>> figure.ac-don-t-use-dnet-config.patch
>>
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add
>> -include-sys-sysmacros.h.patch
>>
>>          create mode 100644
>>         meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>>         <http://open-vm-tools_10.1.5.bb>
>>         --
>>         2.1.4
>>
>>
>>     (ping)
>>
>>
>>

