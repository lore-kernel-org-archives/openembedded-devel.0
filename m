Return-Path: <martin.jansa@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by mail.openembedded.org (Postfix) with ESMTP id E465277FDE
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 22:29:03 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id e201so13918892ybb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Jun 2017 15:29:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=zYQ3bD4Z6SUj1AZVFvj0sZ745Jytm/nqNLj9ngQHu84=;
	b=nWDytqstASxgK27UGTtopsH2fjA8oIraFUjOJluzVRQwpuyzyextk2+J4trTmCcj2Y
	Hb2Jjp4uO//xy/ZrgAZx5D78ruwRqXd2w4GRZ7LeZaLXBe3FqxpSI2a9VJigWQ/EVH7t
	rNQYiUIFnbKjZh0IbRT5fLAo2oTXvossZeZzN53pIYdGuevBgPJ0+gnc4VIMc1Hdcl3y
	THZVqdDQO5ZslIqkFCzT2Ge/C3qxowGPRNMJYku3BODaqmcwTDuuwOtSh2eqBBcEyoHD
	X7Ju/g2oJYyHSIy4kF+IBA4PgfQwy4+L7Lv8RkPg/mNO9uPCotukfJo/DlkcVphG0bng
	HJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=zYQ3bD4Z6SUj1AZVFvj0sZ745Jytm/nqNLj9ngQHu84=;
	b=LXLhRpKrDPytSPFBCCuGlX4V9XHEmjfAFUtZXTI96QX0n7K3/J+ehyIumBhi4b8EgO
	nLCkNcNiuVo5pr0aIG7Zny3ezY4Ick+yr6UokqaLIQTecarqjZHZBbBiEOUeTSiYwvVC
	aJw8aLkEQ0xRfBo6/c36rYbawsVQz331LHjHOKtuMQscWZDrLBD2FamGuvg52QkltXv9
	qp4EMjXEip1IzXwKlDRuB8FswPjFLEmBKtxF8xyqCNFNeJ+/ejCVpZBjYFv4H7T4CxCB
	kKc1t8Q6QnpmwkQEnQXbYJc4t4p3YXggEHqlnxGQyxcwhvdjxAV7EliSpEuoLmt7habX
	Eg1Q==
X-Gm-Message-State: AKS2vOylSEJiCQTwrry0sQOqV7OY5ufUeOocKHkKCffcqX6LtwK8Wr9p
	vukBzdlhboIqXF9wRX+eakRv8/1vXQ==
X-Received: by 10.37.74.67 with SMTP id x64mr5569938yba.69.1498602544517; Tue,
	27 Jun 2017 15:29:04 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.181.204 with HTTP; Tue, 27 Jun 2017 15:29:04 -0700 (PDT)
In-Reply-To: <98263123-d66c-be92-a5f2-13c7c448f4b2@xevo.com>
References: <cover.1498257745.git.mkelly@xevo.com>
	<98263123-d66c-be92-a5f2-13c7c448f4b2@xevo.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Wed, 28 Jun 2017 00:29:04 +0200
Message-ID: <CA+chaQdTnGWinuu1cBgtphtpAmOL7keiLJH49WYOfDgOryk=8A@mail.gmail.com>
To: Martin Kelly <mkelly@xevo.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: Darren Hart <dvhart@vmware.com>,
	openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH v2] 00/17] new recipe v2: open-vm-tools recipe
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
X-List-Received-Date: Tue, 27 Jun 2017 22:29:04 -0000
Content-Type: text/plain; charset="UTF-8"

It's already in master-next waiting for jenkins builds to finish.

On Wed, Jun 28, 2017 at 12:24 AM, Martin Kelly <mkelly@xevo.com> wrote:

> (ping)
>
> I mistyped a character, so the patches did not correctly show up on
> Patchwork (sorry!).
>
>
> On 06/23/2017 03:47 PM, Martin Kelly wrote:
>
>> Hi all,
>>
>> This is version 2 of a patch series to add a new recipe for Open VM Tools
>> to
>> meta-oe. This recipe is invaluable for using Openembedded with VMWare, as
>> without the tools, performance is very slow.
>>
>> More information about Open VM Tools can be found here:
>>
>> https://github.com/vmware/open-vm-tools
>>
>> Please note that, as mentioned in the first commit, this recipe is
>> modified
>> from the recipe originally found in the Open-Switch repository. The first
>> patch is directly from that repository, and the following patches are
>> modifications to it.
>>
>> Original recipe: https://github.com/open-switch/ops-build
>> yocto/openswitch/meta-foss-openswitch/recipes-extended/open-vm-tools/
>> open-vm-tools_10.0.5.bb
>> Commit 9008de2d8e100f3f868c66765742bca9fa98f3f9
>>
>> Although the original recipe packaging was Apache-licensed, I received
>> permission from the author (Diego Dompe) to relicense it under the MIT
>> license
>> for inclusion in meta-openembedded:
>>
>> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014715.html
>> https://lists.openswitch.net/pipermail/ops-dev/2017-April/014716.html
>>
>> The following changes since commit d2da8b82cfb2f8e55236751c1c56c9
>> e7f3b5f68d:
>>
>>   scsirastools: Upgrade to 1.6.6 (2017-06-22 16:04:14 +0200)
>>
>> are available in the git repository at:
>>
>>   git://github.com/XevoInc/meta-openembedded open-vm-tools-v2
>>   https://github.com/XevoInc/meta-openembedded/tree/open-vm-tools-v2
>>
>> Martin Kelly (17):
>>   add open-vm-tools recipe
>>   open-vm-tools: add missing pkgconfig dependency
>>   open-vm-tools: add missing glib-2.0-native dependency
>>   open-vm-tools: clarify and expand licensing
>>   open-vm-tools: base_contains --> bb.utils.contains
>>   open-vm-tools: update version to 10.1.5
>>   open-vm-tools: don't use mspack
>>   open-vm-tools: don't use dnet-config
>>   open-vm-tools: add #include to fix build break
>>   open-vm-tools: add missing X11 dependencies
>>   open-vm-tools: remove kernel module logic
>>   open-vm-tools: line up configure options
>>   open-vm-tools: support FUSE
>>   open-vm-tools: scope build to only x86
>>   open-vm-tools: style changes
>>   open-vm-tools: fix all hardcoded paths
>>   open-vm-tools: remove -Wno-error
>>
>>  .../recipes-support/open-vm-tools/files/tools.conf |  2 +
>>  .../open-vm-tools/files/vmtoolsd.service           | 11 +++
>>  .../0001-configure.ac-don-t-use-dnet-config.patch  | 41 +++++++++++
>>  .../0002-add-include-sys-sysmacros.h.patch         | 33 +++++++++
>>  .../open-vm-tools/open-vm-tools_10.1.5.bb          | 84
>> ++++++++++++++++++++++
>>  5 files changed, 171 insertions(+)
>>  create mode 100644 meta-oe/recipes-support/open-v
>> m-tools/files/tools.conf
>>  create mode 100644 meta-oe/recipes-support/open-v
>> m-tools/files/vmtoolsd.service
>>  create mode 100644 meta-oe/recipes-support/open-v
>> m-tools/open-vm-tools/0001-configure.ac-don-t-use-dnet-config.patch
>>  create mode 100644 meta-oe/recipes-support/open-v
>> m-tools/open-vm-tools/0002-add-include-sys-sysmacros.h.patch
>>  create mode 100644 meta-oe/recipes-support/open-vm-tools/
>> open-vm-tools_10.1.5.bb
>>
>>

