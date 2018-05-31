Return-Path: <raj.khem@gmail.com>
Received: from mail-qk0-f194.google.com (mail-qk0-f194.google.com
	[209.85.220.194])
	by mail.openembedded.org (Postfix) with ESMTP id 7865B74F01
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 16:49:05 +0000 (UTC)
Received: by mail-qk0-f194.google.com with SMTP id d130-v6so12304543qkc.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 31 May 2018 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=CqdohSjM9HX5Y9r/aOTpiauKVkv5Yt7bJ0QFCbBh0OY=;
	b=UfEgGfZWnSdwugYtrzQFBqQns+cfufMWiUk1Puw4XDfFc0nB9I0qAODwDkAq2gkKd0
	5kCbJ+4T6juv1cfK5kfAAZWPKpoPO/u+xU1TORTxAMuWc0AKB3CLRjEOF0Z6FSvPzO4j
	H4uHnM2FwgF+p6pwJkf5Pa1/eoLmYzge9Ui5icAr7awlGIVKCmTQZTWqhK+qkwDSueHt
	fjemvDrz3YxSp9aPNzF5PoS3z4wooTGWr9epldbdHb7V76p6bphDpkcmM8yXmpQEfXmk
	hIhxL3ZI3QWWWDh9Zx7Z98F67FPhhoZFZSiv/eI1WaoczDKUjKhHBWV2+GdPq5ieBK8a
	Z6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=CqdohSjM9HX5Y9r/aOTpiauKVkv5Yt7bJ0QFCbBh0OY=;
	b=mN1QMoh1SyGvd5n0Vo3C+dNnT/mNK3wsaVV5BOtYftZMKZ38Eq4KYwebZg6Bk34yHA
	2VBtw89MfhI/EK+MA0cYgsd01HThVKGq5+fee4Y0WAtZFUEAE1jGOkSA1aadC9V+dV76
	+WkN7KoUjyp6TbWEhNWorsy3jxo4Y4b9kte5PojXOPT3TYBCg6QKU4Vyjq9ZisvntRvi
	AnOa2kJv1af5GfkoROM9nQxEZ0G7tk80GShk5R/6Uhm5+ODLF7CgmFva8Ag0rK6kDyRr
	ChOA5cQrdfrVLs7NmxbEdat3vopEWWWPqs4q46g9CAYz4DNb21M9B1ou/FsFTA8YIslN
	y+1g==
X-Gm-Message-State: APt69E3ENKQ8N/TrP1bvwx8kPljr9T/HR/bbq53ouZxdGbYK4R72/o2P
	7XBudcpJcXlgW1MEVM6bs9sxsmh/gVHb094btCfYJg==
X-Google-Smtp-Source: ADUXVKIxJfGWgik6GT2D6O/wosLR7+11wRmZB+A29PgnliHJ7nfkW+I3mNoLJEWmMPPoA/1NV09cQykWjajt+gciBdo=
X-Received: by 2002:a37:b8c4:: with SMTP id
	i187-v6mr7024022qkf.412.1527785346080; 
	Thu, 31 May 2018 09:49:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a0c:e486:0:0:0:0:0 with HTTP; Thu, 31 May 2018 09:48:35
	-0700 (PDT)
In-Reply-To: <1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
References: <20180510063718.16913-1-andrew@aj.id.au>
	<1527594494.687641.1388974752.4113AC8F@webmail.messagingengine.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 31 May 2018 09:48:35 -0700
Message-ID: <CAMKF1spm=GQQq90gu58BdrNtqPQx_fxnA01ar9Jmr4PbQnmttQ@mail.gmail.com>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: openbmc@lists.ozlabs.org,
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-python][PATCH v2 1/3] meta-python: Add python-pyflame recipe
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
X-List-Received-Date: Thu, 31 May 2018 16:49:05 -0000
Content-Type: text/plain; charset="UTF-8"

fails to build on qemumips

| ../../git/src/ptrace.cc: In function 'user_regs_struct
pyflame::PtraceGetRegs(pid_t)':
| ../../git/src/ptrace.cc:125:41: error: return type 'user_regs_struct
{aka struct user_regs_struct}' is incomplete
|  user_regs_struct PtraceGetRegs(pid_t pid) {
|                                          ^
| ../../git/src/ptrace.cc:125:18: error: ambiguating new declaration
of 'void pyflame::PtraceGetRegs(pid_t)'
|  user_regs_struct PtraceGetRegs(pid_t pid) {
|                   ^~~~~~~~~~~~~
| In file included from ../../git/src/ptrace.cc:15:0:
| ../../git/src/./ptrace.h:48:18: note: old declaration
'user_regs_struct pyflame::PtraceGetRegs(pid_t)'
|  user_regs_struct PtraceGetRegs(pid_t pid);
|                   ^~~~~~~~~~~~~
| ../../git/src/ptrace.cc:126:20: error: aggregate 'user_regs_struct
regs' has incomplete type and cannot be defined
|    user_regs_struct regs;
|                     ^~~~
| ../../git/src/ptrace.cc: In function 'void
pyflame::PtraceSetRegs(pid_t, user_regs_struct)':
| ../../git/src/ptrace.cc:135:48: error: 'regs' has incomplete type
|  void PtraceSetRegs(pid_t pid, user_regs_struct regs) {
|                                                 ^~~~
| In file included from ../../git/src/ptrace.cc:15:0:
| ../../git/src/./ptrace.h:29:16: note: forward declaration of
'user_regs_struct {aka struct user_regs_struct}'
|  typedef struct user_regs_struct user_regs_struct;
|                 ^~~~~~~~~~~~~~~~
| make[2]: *** [ptrace.o] Error 1
| make[2]: *** Waiting for unfinished jobs....
| make[2]: Leaving directory
`/mnt/jenkins/workspace/OpenEmbedded/build/tmp/work/mips32r2-bec-linux/python-pyflame/1.6.6-r0/build/src'

On Tue, May 29, 2018 at 4:48 AM, Andrew Jeffery <andrew@aj.id.au> wrote:
> On Thu, 10 May 2018, at 16:07, Andrew Jeffery wrote:
>> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
>
> Ping - is there anything I need to revise for this patch or the following two?
>
> Cheers,
>
> Andrew
>
>> ---
>>  meta-python/recipes-devtools/python/python-pyflame.inc      | 12 ++++++++++++
>>  meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb |  1 +
>>  2 files changed, 13 insertions(+)
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame.inc
>>  create mode 100644 meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>>
>> diff --git a/meta-python/recipes-devtools/python/python-pyflame.inc b/
>> meta-python/recipes-devtools/python/python-pyflame.inc
>> new file mode 100644
>> index 000000000000..3b84a7e8f8e3
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyflame.inc
>> @@ -0,0 +1,12 @@
>> +SUMMARY = "Pyflame: A Ptracing Profiler For Python"
>> +HOMEPAGE = "https://github.com/uber/pyflame"
>> +SECTION = "devel/python"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://${S}/
>> LICENSE;md5=2ee41112a44fe7014dce33e26468ba93"
>> +DEPENDS = "python"
>> +
>> +SRC_URI = "git://github.com/uber/pyflame.git;protocol=https;tag=v${PV}"
>> +S = "${WORKDIR}/git"
>> +
>> +inherit pkgconfig autotools
>> +
>> diff --git a/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> new file mode 100644
>> index 000000000000..96f03305f883
>> --- /dev/null
>> +++ b/meta-python/recipes-devtools/python/python-pyflame_1.6.6.bb
>> @@ -0,0 +1 @@
>> +require python-pyflame.inc
>> --
>> 2.14.1
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

