Return-Path: <asselsm@gmail.com>
Received: from mail-ie0-f181.google.com (mail-ie0-f181.google.com
	[209.85.223.181])
	by mail.openembedded.org (Postfix) with ESMTP id 37D776AE37
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 16:53:23 +0000 (UTC)
Received: by mail-ie0-f181.google.com with SMTP id ar20so2707855iec.40
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 30 Oct 2013 09:53:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=yjEDs4rDOGkiO8mMzQNWb7Uju4UkXSagTAi7/sF505Y=;
	b=P9hP9WMKKRRS7AjyGpGSa8ByVzs7iJXXyq/ewg2OOznrbenHWfrbr+wGzLHfORB2AX
	ermH9gnpluludIpfRNOIkStbijLoWpuqi+bKj1yu+KNtlhzboqEA5stJid0I2aVxsso+
	AJXc0FVcNvm0i2lz7bNfmGl8Mj4aQ46HIoL/4jAUHshswhl/4il09XAi0OiEsQLO4AMa
	6p6HTFhw1VwUbf+9ENfkag2Enl0kFJEUr8eOtvDqIXIOtDiY9BV8j3B10hkUOco+GMTF
	lqpAJ5doagbNFDAQSn1ZBNt4x/64eL1jwJrabLiUiNGM8n0NOIOpD4Exh51dJ3rtcbfX
	S+2Q==
MIME-Version: 1.0
X-Received: by 10.42.70.5 with SMTP id d5mr3789457icj.39.1383152003662; Wed,
	30 Oct 2013 09:53:23 -0700 (PDT)
Received: by 10.42.119.78 with HTTP; Wed, 30 Oct 2013 09:53:23 -0700 (PDT)
In-Reply-To: <20131030131634.GB3716@deserted.net>
References: <1383105036-21256-1-git-send-email-asselsm@gmail.com>
	<20131030131634.GB3716@deserted.net>
Date: Wed, 30 Oct 2013 12:53:23 -0400
Message-ID: <CAPuovE+nMdgqbJXZPEXHEJ=xOiDDDdyQkWmJG-HFijvW6SMmwg@mail.gmail.com>
From: Mark Asselstine <asselsm@gmail.com>
To: Joe MacDonald <joe@deserted.net>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH] cyrus-sasl: ensure size_t is defined for use by sasl.h
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 30 Oct 2013 16:53:23 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Oct 30, 2013 at 9:16 AM, Joe MacDonald <joe@deserted.net> wrote:
> [[meta-networking][PATCH] cyrus-sasl: ensure size_t is defined for use by sasl.h] On 13.10.29 (Tue 23:50) Mark Asselstine wrote:
>
>> While making use of the cyrus-sasl library an external application
>> will most likely include sasl.h which will cause compilation failures
>> if steps haven't been taken to define size_t. This should not be the
>> responsibility of the application building against the sasl library
>> but rather handled already in sasl.h. Here we ensure sasl.h has the
>> proper includes to have size_t defined before it is used.
>>
>> Signed-off-by: Mark Asselstine <asselsm@gmail.com>
>> ---
>>  ...clude-sasl.h-needs-to-include-sys-types.h.patch | 37 ++++++++++++++++++++++
>>  .../cyrus-sasl/cyrus-sasl_2.1.26.bb                |  3 ++
>>  2 files changed, 40 insertions(+)
>>  create mode 100644 meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch
>>
>> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch
>> new file mode 100644
>> index 0000000..ac47b4f
>> --- /dev/null
>> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl/include-sasl.h-needs-to-include-sys-types.h.patch
>> @@ -0,0 +1,37 @@
>> +From 471b4436a69917fba7c44e366b0393cebc3dace6 Mon Sep 17 00:00:00 2001
>> +From: Mark Asselstine <asselsm@gmail.com>
>> +Date: Tue, 29 Oct 2013 23:07:26 -0400
>> +Subject: [PATCH] include: sasl.h needs to include sys/types.h
>> +
>> +size_t is used in sasl.h yet sys/types.h is neither included directly
>> +or indirectly. This causes build errors if you try to build something
>> +against the sasl library where .c files including sasl.h haven't
>> +included sys/types.h or defined size_t on their own. Similar to this
>> +one:
>> +
>> +In file included from rpc/virnetsaslcontext.h:24:0,
>> +                 from rpc/virnetsaslcontext.c:25:
>> +../poky/x86-64/tmp/sysroots/qemux86-64/usr/include/sasl/sasl.h:230:38: error: unknown type name 'size_t'
>> + typedef void *sasl_realloc_t(void *, size_t);
>> +
>> +Signed-off-by: Mark Asselstine <asselsm@gmail.com>
>
> Can I get the upstream-status of this?  I can update the patch myself in
> my tree or you can send out another version, whatever you prefer.

I couldn't find their source repo last night and didn't find any
similar fixes. Of course I look now and find it easily and do find
that they have fixed this. I will send a v2 using the upstream patch,
add an upstream status line and remove the PR.

Mark

>
>> +---
>> + include/sasl.h | 2 ++
>> + 1 file changed, 2 insertions(+)
>> +
>> +diff --git a/include/sasl.h b/include/sasl.h
>> +index fef4d51..36b2553 100755
>> +--- a/include/sasl.h
>> ++++ b/include/sasl.h
>> +@@ -130,6 +130,8 @@
>> + #define SASL_VERSION_FULL ((SASL_VERSION_MAJOR << 16) |\
>> +       (SASL_VERSION_MINOR << 8) | SASL_VERSION_STEP)
>> +
>> ++#include <sys/types.h>
>> ++
>> + #include "prop.h"
>> +
>> + /*************
>> +--
>> +1.8.1.2
>> +
>> diff --git a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> index f05ab85..5899291 100644
>> --- a/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> +++ b/meta-networking/recipes-daemons/cyrus-sasl/cyrus-sasl_2.1.26.bb
>> @@ -4,11 +4,14 @@ DEPENDS = "openssl virtual/db"
>>  LICENSE = "BSD"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=3f55e0974e3d6db00ca6f57f2d206396"
>>
>> +PR = "r1"
>> +
>
> I'm pretty sure we don't need a PR bump here anymore.
>
> -J.
>
>>  SRC_URI = "ftp://ftp.cyrusimap.org/cyrus-sasl/cyrus-sasl-${PV}.tar.gz \
>>          file://avoid-to-call-AC_TRY_RUN.patch \
>>          file://Fix-hardcoded-libdir.patch \
>>          file://debian_patches_0009_sasldb_al.diff \
>>          file://debian_patches_0014_avoid_pic_overwrite.diff \
>> +        file://include-sasl.h-needs-to-include-sys-types.h.patch \
>>          "
>>
>>  inherit autotools pkgconfig useradd
> --
> -Joe MacDonald.
> :wq

