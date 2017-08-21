Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id E3FC6782A8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 21 Aug 2017 06:35:08 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v7L6Z8qf006043
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Sun, 20 Aug 2017 23:35:09 -0700
Received: from [128.224.162.183] (128.224.162.183) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.3.361.1;
	Sun, 20 Aug 2017 23:35:08 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <cover.1503295148.git.hongxu.jia@windriver.com>
	<CA+chaQcNNKcae4OhNGLeUDG-c_007J2PYW=xxAN-Z=s_wLPmRg@mail.gmail.com>
From: Hongxu Jia <hongxu.jia@windriver.com>
Message-ID: <4a9e32d4-6a0b-8f79-a66d-6fa1f2983b01@windriver.com>
Date: Mon, 21 Aug 2017 14:36:02 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <CA+chaQcNNKcae4OhNGLeUDG-c_007J2PYW=xxAN-Z=s_wLPmRg@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 0/3] multipath-tools/python3-pykickstart/xmlrpc-c: fix file-rdeps QA issues
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
X-List-Received-Date: Mon, 21 Aug 2017 06:35:09 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2017年08月21日 14:21, Martin Jansa wrote:
> Do you know why so many do_package_qa failures were detected now?
>
> I was reading oe-core commits added since last world build and I don't 
> see where this QA check was fixed or why it reports so many issues now.
>
> Is it thanks to this change?
> http://git.openembedded.org/openembedded-core/commit/?id=bf017930036f19b3d6df8e5b50d9979ee7045c5c
>

I think so, I sync oe-core to latest and found these QA issue.

Here is the original repo:

http://git.yoctoproject.org/cgit.cgi/poky-contrib/log/?h=pkj/rpm_regressions2

And some improvement in

https://www.mail-archive.com/openembedded-core@lists.openembedded.org/msg100243.html

//Hongxu

> On Mon, Aug 21, 2017 at 8:00 AM, Hongxu Jia <hongxu.jia@windriver.com 
> <mailto:hongxu.jia@windriver.com>> wrote:
>
>     The following changes since commit
>     ac2a6d2b5d69937577effcb8bb2149651bac0176:
>
>       json-spirit: Add -latomic to LDFLAGS (2017-08-13 13:21:04 +0200)
>
>     are available in the git repository at:
>
>       git://git.openembedded.org/openembedded-core-contrib
>     <http://git.openembedded.org/openembedded-core-contrib>
>     hongxu/fix-qa-issue
>     http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/fix-qa-issue
>     <http://cgit.openembedded.org/openembedded-core-contrib/log/?h=hongxu/fix-qa-issue>
>
>     Hongxu Jia (3):
>       multipath-tools: add bash to RDEPENDS
>       python3-pykickstart: tweak shebang to python3
>       xmlrpc-c: add perl to RDEPENDS
>
>      .../recipes-devtools/xmlrpc-c/xmlrpc-c_1.31.0.bb
>     <http://xmlrpc-c_1.31.0.bb>  |  2 +-
>      .../multipath-tools/multipath-tools_0.7.1.bb
>     <http://multipath-tools_0.7.1.bb>      |  2 +-
>      .../files/0005-tweak-shebang-to-python3.patch      | 25
>     ++++++++++++++++++++++
>      .../python-pykickstart/python3-pykickstart_2.35.bb
>     <http://python3-pykickstart_2.35.bb> |  1 +
>      4 files changed, 28 insertions(+), 2 deletions(-)
>      create mode 100644
>     meta-python/recipes-extended/python-pykickstart/files/0005-tweak-shebang-to-python3.patch
>
>     --
>     2.8.1
>
>


