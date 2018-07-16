Return-Path: <Hongzhi.Song@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 5C5EF60750
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jul 2018 09:51:23 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w6G9pHHP028391
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 16 Jul 2018 02:51:18 -0700 (PDT)
Received: from [128.224.162.198] (128.224.162.198) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 16 Jul 2018 02:51:17 -0700
To: "Burton, Ross" <ross.burton@intel.com>
References: <20180713140616.15664-1-hongzhi.song@windriver.com>
	<20180713140616.15664-2-hongzhi.song@windriver.com>
	<CAJTo0LbXD42g6wJ4z3Kgg+TXSRaAueLgWzYjkkdq13YO3aVb+Q@mail.gmail.com>
From: "Hongzhi, Song" <hongzhi.song@windriver.com>
Message-ID: <37cf1c1d-c607-6ba3-20f0-8fe9e46706f1@windriver.com>
Date: Mon, 16 Jul 2018 17:53:26 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAJTo0LbXD42g6wJ4z3Kgg+TXSRaAueLgWzYjkkdq13YO3aVb+Q@mail.gmail.com>
X-Originating-IP: [128.224.162.198]
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 1/1] kernel-selftest: Add a recipe on kernel selftest
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
X-List-Received-Date: Mon, 16 Jul 2018 09:51:23 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 2018年07月14日 00:23, Burton, Ross wrote:
> On 13 July 2018 at 15:06, Hongzhi.Song <hongzhi.song@windriver.com> wrote:
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=d7810fab7487fb0aad327b76f1be7cd7 \
> Why are you shipping your own copy of the kernel's COPYING file even
> though you copy another in that prefunc?
>
> Isn't it possible to just depend on kernel-source and build directly
> from the kernel source tree?
>
>> +# for bpf and vm
>> +DEPENDS = " \
>> +    elfutils \
>> +    libcap \
>> +    libcap-ng \
>> +    fuse \
>> +    util-linux \
>> +    rsync-native \
>> +"
> Really not convinced these dependencies are accurate.
>
>> +TEST_LIST = "bpf \
>> +             vm \
>> +"
> You're not listing memfd in here, but that is the only place which
> uses fuse as far as I can tell.
>
> My suggestion is to trim the DEPENDS back to the core minimum and use
> PACKAGECONIG to select what directories get built. This means you can
> have optional test suites where the dependencies are not in oe-core
> (fuse for memfd, for example), and get the right RDEPENDS too.
>
>> +        oe_runmake -C ${S}/tools/testing/selftests/${i} INSTALL_PATH=${D}/opt/kselftest/${i} install
> FHS says /opt is for sysadmin-installed tools that are not package
> managed.  You're building a package.  You're also building a package
> which is essentially ptest.  I'd say inherit ptest, write a runner,
> and put all the binaries in $PTESTDIR.

Hi Burton,

kernel-selftest is designed to be shared by ptest and oe-self, and thus is
not supposed to inherit ptest.

The suggestions you mentioned above will be modified soon.

--Hongzhi

>
> Ross
>


