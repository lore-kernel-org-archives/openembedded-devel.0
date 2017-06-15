Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f172.google.com (mail-yb0-f172.google.com
	[209.85.213.172])
	by mail.openembedded.org (Postfix) with ESMTP id EA0E4783D1
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 16:54:20 +0000 (UTC)
Received: by mail-yb0-f172.google.com with SMTP id f192so5735618yba.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 15 Jun 2017 09:54:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=TLdH1/01F820CA/RNZOUHb8Uld9nDxbpoPP1TljqVKY=;
	b=jIiMKyveV82HcQD384Fwy47eo75MbDCVtj+V4VWn5OYJQd+wi16qR1m4V4MsCe0AuM
	4vO3tSpTzfA5+aZ/2Npdt9YHccdN6I4p01VijE5dcq0HNWTmq5ZIrWS32o5NTOyyPJQj
	txzY/Ew8OmJw+x2zv5iHZHnaR3YtKVM5wHJ/NRhqNkbdm75kGMX8pxzwVioOrV1jYQMF
	vdl7Fli+WowjVWG6gJoSLAhKIzicDENGA0rnpXL2AXFTnm9tmtpKQGlxDDfo9Dk8ZHIG
	oWpdqeK0c/hrvRjGf2pGsXu4xG1TIYgp/hiWGOVaY091OYyqXVAGNQzk3rT7MYMr4MXV
	HYVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=TLdH1/01F820CA/RNZOUHb8Uld9nDxbpoPP1TljqVKY=;
	b=tkL5uSyaVDbwhb0sCkMo+eG6+jjiPFfzooThBOijpZPtcRg+RmRPqoiAzir51RA/AY
	qK0vj7Jm+s8Pf029JcBUaHsdSV7QQ2QZZOEwhuRHNFUlOCFxumm+I3vecLl1wHUBHHa6
	TBjl0+ezhytMePm2nQdidHZKJ78QicSkh/WV/Xi996pB1GPCcntgM9CmFEz/TF6GInMZ
	dFESEGLPsgxNKVpk82l+qK6IBT9vkDhyZi2zf2tbSsIDv+a5lhKt1L4GuynVy4szE5ct
	Bf5N7eVKkVCtSrJT7BwQq6PVDlxurex/mpO8tAozjAJXNUwg3HjsIrECjGYrHU0yiHDO
	DNQw==
X-Gm-Message-State: AKS2vOwAT1FzPyu77Ou4Tsdto1oewmfpoYlDUdSLwEQZX19qlfKG0Chi
	3rgZ9NC/zFQtwPnI+jDCZFeVzcdYZg==
X-Received: by 10.37.164.199 with SMTP id g65mr4988798ybi.147.1497545661436;
	Thu, 15 Jun 2017 09:54:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Thu, 15 Jun 2017 09:54:20 -0700 (PDT)
In-Reply-To: <2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
References: <e0efb641-fd8b-a8ff-e952-7b32805cc45a@xevo.com>
	<2ef4f2a3-48e9-f3fa-a55e-01522507d86d@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Thu, 15 Jun 2017 18:54:20 +0200
Message-ID: <CA+chaQeUWj=4zxG1gdk0pwg_U1GUdMmwr1F9DEL_7pT8S0UUQg@mail.gmail.com>
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
X-List-Received-Date: Thu, 15 Jun 2017 16:54:21 -0000
Content-Type: text/plain; charset="UTF-8"

It didn't make it to patchwork, because you've sent only the cover letter.
I've added it to master-next now.

Next time please send also individual patches. So that it gets more
visibility for other people to comment and also that I can use patchwork to
pull it in.

Regards,

On Thu, Jun 15, 2017 at 6:36 PM, Martin Kelly <mkelly@xevo.com> wrote:

> On 06/09/2017 03:22 PM, Martin Kelly wrote:
>
>> Hi all,
>>
>> This patch series adds a new recipe for Open VM Tools to meta-oe. This
>> recipe is invaluable for using Openembedded with VMWare, as without the
>> tools, performance is very slow.
>>
>> More information about Open VM Tools can be found here:
>>
>> https://github.com/vmware/open-vm-tools
>>
>> Please note that, as mentioned in the first commit, this recipe is
>> modified from the recipe originally found in the Open-Switch repository.
>> The first patch is directly from that repository, and the following
>> patches are modifications to it.
>>
>> Original recipe:
>> https://github.com/open-switch/ops-build
>> yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/
>> open-vm-tools_10.0.5.bb
>>
>> Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>>
>> Although the original recipe packaging was Apache-licensed, I received
>> permission from the author (Diego Dompe) to relicense it under the MIT
>> license for inclusion in meta-openembedded:
>>
>> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
>> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>>
>> --
>> The following changes since commit
>> 41cf832cc9abd6f2293a6d612463a34a53a9a52a:
>>
>>   Revert "rrdtool: add gettext-native dependency" (2017-06-05 11:13:09
>> +0200)
>>
>> are available in the git repository at:
>>
>>   https://github.com/XevoInc/meta-openembedded
>>
>> for you to fetch changes up to 402d1b3917195beb2ab7cac5dc94aaed8992b5a1:
>>
>>   open-vm-tools: style changes (2017-06-07 22:31:34 +0000)
>>
>> ----------------------------------------------------------------
>> Martin Kelly (14):
>>       add open-vm-tools recipe
>>       open-vm-tools: add missing pkgconfig dependency
>>       open-vm-tools: add missing glib-2.0-native dependency
>>       open-vm-tools: clarify and expand licensing
>>       open-vm-tools: base_contains --> bb.utils.contains
>>       open-vm-tools: update version to 10.1.5
>>       open-vm-tools: don't use mspack
>>       open-vm-tools: don't use dnet-config
>>       open-vm-tools: add #include to fix build break
>>       open-vm-tools: add missing X11 dependencies
>>       open-vm-tools: remove kernel module logic
>>       open-vm-tools: line up configure options
>>       open-vm-tools: support FUSE
>>       open-vm-tools: style changes
>>
>>  .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>>  .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>>  .../open-vm-tools/0001-Fix-kernel-detection.patch  | 35 +++++++++
>>  .../0002-configure.ac-don-t-use-dnet-config.patch  | 41 ++++++++++
>>  .../0003-add-include-sys-sysmacros.h.patch         | 33 ++++++++
>>  .../open-vm-tools/open-vm-tools_10.1.5.bb          | 90
>> ++++++++++++++++++++++
>>  6 files changed, 212 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/open-v
>> m-tools/files/tools.conf
>>  create mode 100644
>> meta-oe/recipes-support/open-vm-tools/files/vmtoolsd.service
>>  create mode 100644
>> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0001-Fix
>> -kernel-detection.patch
>>
>>  create mode 100644
>> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0002-con
>> figure.ac-don-t-use-dnet-config.patch
>>
>>  create mode 100644
>> meta-oe/recipes-support/open-vm-tools/open-vm-tools/0003-add
>> -include-sys-sysmacros.h.patch
>>
>>  create mode 100644
>> meta-oe/recipes-support/open-vm-tools/open-vm-tools_10.1.5.bb
>> --
>> 2.1.4
>>
>
> (ping)
>

