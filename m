Return-Path: <stephen.arnold42@gmail.com>
Received: from mail-oi0-f67.google.com (mail-oi0-f67.google.com
	[209.85.218.67])
	by mail.openembedded.org (Postfix) with ESMTP id 28F5B60110
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 23 Jun 2016 02:02:38 +0000 (UTC)
Received: by mail-oi0-f67.google.com with SMTP id x6so8406131oif.3
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 22 Jun 2016 19:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=RskwldSG62hxg4DIUWbzskuI9pHcSweHCRHFeAIiC6c=;
	b=hiJ9VJeVbhDTc5aIOQIB6M+AMQFtK80mlq6fa3iiBP3ZAt6uKOqv8onHlwYWjFHBsg
	0QyLnooEGvggS7JpHFr3LnTYGPnQeb8Pd+C8zD8Uz4OniPsbe9BHktxwjuIDm0cfBAAx
	NfVGv/gSzrBMwUxQOH+mWvmWadLhqY/L2W78G8G/sFC/0cbNRESZFhT/9FQ2kzm1xCHl
	AXZbQZssu671dB93Y49n1krLbho+kWLmxe7x+ZPwih/KKeVpIya3WoyP4xMquLfsJ8He
	tOJ4Ltu8JFfVSt4+UWfzc233fsYxoDp6gTpRWAa7e/F//vWxz5O09DD7usHKZC5Nrcrx
	3aqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=RskwldSG62hxg4DIUWbzskuI9pHcSweHCRHFeAIiC6c=;
	b=dT2AKxbrFbHBQZVWghDzPvrws8sURcY4QszCZkV3446MfPPLVaA54uEogphndI3PZ2
	xWc6lWz2ei0fmFyUMeaFoW2Si47C/rK39PCqySCrZ/ZIBV/0TV0cyh0kOcQobdW6q3oF
	7DJXljjelWgjAvvSN9etr6J02773tl070hcvHmkbPq6seXdl/0cbx7Rt10y+B+czFY7a
	RVI+2B+u5hgqP4LBWGFYrpXwB0BrV//DkuQlA2EibtZmaA8dfeu0vPJ3MBYUUoTYEGt8
	GcDF/zKls1mM3G1l19d45mpwZwGtALLixj1z74k3sVSYtR2BOiTF9joL+EyTBVC1cwxB
	hIlg==
X-Gm-Message-State: ALyK8tLVnMb7Iog5L7TtH7gfjuAlkoGIEyn514sUXu89ozERF+/QY11/Xrg2iyevOUUXUcI9zbfK9Dn3TspB2g==
X-Received: by 10.202.87.147 with SMTP id l141mr3959181oib.190.1466647359104; 
	Wed, 22 Jun 2016 19:02:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.249.66 with HTTP; Wed, 22 Jun 2016 19:02:38 -0700 (PDT)
In-Reply-To: <2908AC66-AE79-4922-831D-415D7CA7BFE7@gmail.com>
References: <1465344898-22391-1-git-send-email-sarnold@vctlabs.com>
	<2908AC66-AE79-4922-831D-415D7CA7BFE7@gmail.com>
From: Stephen Arnold <stephen.arnold42@gmail.com>
Date: Wed, 22 Jun 2016 19:02:38 -0700
Message-ID: <CAOLEWZWumRUMirFYL_nKtThR49wsh17M2V-ywkWeq1e0R0dMcw@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] redis: fix hiredis build so it's less failure-prone and links properly
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
X-List-Received-Date: Thu, 23 Jun 2016 02:02:41 -0000
Content-Type: text/plain; charset=UTF-8

True,, but it still needs the ranlib hunk; do I really need to redo
it, or can we take it as-is?

Steve

On Wed, Jun 22, 2016 at 9:56 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> On Jun 7, 2016, at 5:14 PM, Stephen Arnold <sarnold@vctlabs.com> wrote:
>>
>> This patch resets the default OPT flags to -O2 and adds the missing
>> ranlib command to index the static library.
>>
>> Signed-off-by: Stephen Arnold <sarnold@vctlabs.com>
>> ---
>> ...-update-Makefile-to-add-symbols-to-staticlib.patch | 19 +++++++++++++++++++
>> meta-oe/recipes-extended/redis/redis_3.0.2.bb         |  2 ++
>> 2 files changed, 21 insertions(+)
>> create mode 100644 meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
>>
>> diff --git a/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
>> new file mode 100644
>> index 0000000..2b3b587
>> --- /dev/null
>> +++ b/meta-oe/recipes-extended/redis/redis/hiredis-update-Makefile-to-add-symbols-to-staticlib.patch
>> @@ -0,0 +1,19 @@
>> +--- redis-3.0.2/deps/hiredis/Makefile.orig   2016-05-06 19:36:26.179003036 -0700
>> ++++ redis-3.0.2/deps/hiredis/Makefile        2016-05-06 19:40:15.341340736 -0700
>> +@@ -25,7 +25,7 @@
>> +
>> + # Fallback to gcc when $CC is not in $PATH.
>> + CC?=$(shell sh -c 'type $(CC) >/dev/null 2>/dev/null && echo $(CC) || echo gcc')
>> +-OPTIMIZATION?=-O3
>> ++OPTIMIZATION?=-O2
>
> You can pass is via EXTRA_OEMAKE from recipe. No need to patch the Makefile.
>
>> + WARNINGS=-Wall -W -Wstrict-prototypes -Wwrite-strings
>> + DEBUG?= -g -ggdb
>> + REAL_CFLAGS=$(OPTIMIZATION) -fPIC $(CFLAGS) $(WARNINGS) $(DEBUG) $(ARCH)
>> +@@ -68,6 +68,7 @@
>> +
>> + $(STLIBNAME): $(OBJ)
>> +     $(STLIB_MAKE_CMD) $(OBJ)
>> ++    $(RANLIB) $@
>> +
>> + dynamic: $(DYLIBNAME)
>> + static: $(STLIBNAME)
>> diff --git a/meta-oe/recipes-extended/redis/redis_3.0.2.bb b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
>> index 55f2c96..2e4b760 100644
>> --- a/meta-oe/recipes-extended/redis/redis_3.0.2.bb
>> +++ b/meta-oe/recipes-extended/redis/redis_3.0.2.bb
>> @@ -12,7 +12,9 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
>>            file://oe-use-libc-malloc.patch \
>>            file://redis.conf \
>>            file://init-redis-server \
>> +           file://hiredis-update-Makefile-to-add-symbols-to-staticlib.patch \
>> "
>> +
>> SRC_URI[md5sum] = "87be8867447f62524b584813e5a7bd14"
>> SRC_URI[sha256sum] = "93e422c0d584623601f89b956045be158889ebe594478a2c24e1bf218495633f"
>>
>> --
>> 2.8.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

