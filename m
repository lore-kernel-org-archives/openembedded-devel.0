Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f53.google.com (mail-wm0-f53.google.com [74.125.82.53])
	by mail.openembedded.org (Postfix) with ESMTP id 33E04782E2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 17:09:02 +0000 (UTC)
Received: by mail-wm0-f53.google.com with SMTP id w191so4989065wmw.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 Jul 2017 10:09:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=5KQM/07lY/hBWOxNUi4By5TxhEcXWPw2ly24LntbW1A=;
	b=JsxLWpQ59Yjv94OMXfAWoYrGmrOf87GPrjPlH6mobTuf+6wko2KyXpq1IjTgwERvaD
	8Je87/yaezwUWzbsLy0d8yZqY36WIFh+w5/zTQLNp7A9PbRQePlmvsqhpV/UklH+FwJU
	isnsJQ5K/Najs/ErR909IZBSu+G/xaRPqwkYoPzv2tvDseyc2jaZYZhXXGR0lCivJgS8
	0Zv0n15aHQ0nQi0DnqiTcew6kS1akCtH++93Jjnm9InYgZOPBuGLHiqi1Lq3ZJBjmMyy
	OAAdC/d8t1i456V9KZzPAYiVLG+e5tWGMEWkdg1ouTvD1EDO8dZh0f70UEiWRvtG4d8m
	bArQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=5KQM/07lY/hBWOxNUi4By5TxhEcXWPw2ly24LntbW1A=;
	b=raFI3JK+P1NBeWvUSEmfMF4dK6z8nKR8QKJBcR88/5pH2c8FzD3w+hPj9d2ceECQ1g
	mLUsdhKwp2i6laH0PSsD6ifpXEX2g2PlyJnmOdKxHUh6AEEsp8sc7ODiKhHN7ULS3ewX
	JXPJ9V+Vhi5++kv80kKuouh41yOIrB4Nc54rEnAMTTXZyv1z1g7dWCp/fTo5J1ZljHjH
	KVAMD9i1W6NFjiEHC3xNTRX5kMODuf/Uf660HFvNDo7j8KIbKof7qvlWDhsFDZUb+/F7
	sbB46Xic1e9vKsjiC86WMGaypA0nIvaRM+cdGyDM74ApTbozlP3FbAOZy6xeP2q6s8o0
	elqw==
X-Gm-Message-State: AIVw112DU815bSG8ooHd403/voHCx3eWdmdFPUIYCtV6xM07ypiIHxpL
	VktvSFE3IJ4MXlBeKHocxAxQQ6SEXQ==
X-Received: by 10.80.217.141 with SMTP id w13mr594846edj.228.1500484144090;
	Wed, 19 Jul 2017 10:09:04 -0700 (PDT)
MIME-Version: 1.0
References: <20170719154132.20556-1-raj.khem@gmail.com>
	<CA+chaQdm4oR+rtxOzh89Vod5_42kP7ZZ5mp-pKM7gXXMTx_-sQ@mail.gmail.com>
In-Reply-To: <CA+chaQdm4oR+rtxOzh89Vod5_42kP7ZZ5mp-pKM7gXXMTx_-sQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 19 Jul 2017 17:08:53 +0000
Message-ID: <CAMKF1spSDgSZhqC=j7X4yCWqLctvG6SBpNZMnKx69FFK5ofBFw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-networking][PATCH 1/4] ippool: Fix build errors found with hardening flags
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
X-List-Received-Date: Wed, 19 Jul 2017 17:09:03 -0000
Content-Type: text/plain; charset="UTF-8"

No changes I thought I never send it out

On Wed, Jul 19, 2017 at 12:04 PM Martin Jansa <martin.jansa@gmail.com>
wrote:

> I've dropped this from master-next to check if the build failures we were
> discussing were caused by this. Did you change anything in here (is it v2
> or just resend)?
>
> On Wed, Jul 19, 2017 at 5:41 PM, Khem Raj <raj.khem@gmail.com> wrote:
>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> ---
>>  ...timer-Check-for-return-value-of-write-API.patch | 28
>> ++++++++++++++++++++++
>>  .../recipes-daemons/ippool/ippool_1.3.bb           | 22
>> ++++++++---------
>>  2 files changed, 39 insertions(+), 11 deletions(-)
>>  create mode 100644
>> meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
>>
>> diff --git
>> a/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
>> b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
>> new file mode 100644
>> index 000000000..6fb7cc5c4
>> --- /dev/null
>> +++
>> b/meta-networking/recipes-daemons/ippool/ippool/0001-usl_timer-Check-for-return-value-of-write-API.patch
>> @@ -0,0 +1,28 @@
>> +From 5d7f20c045b3c74dad2c53d65e30bd4840250082 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Tue, 27 Jun 2017 15:17:19 -0700
>> +Subject: [PATCH] usl_timer: Check for return value of write() API
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + usl/usl_timer.c | 4 +++-
>> + 1 file changed, 3 insertions(+), 1 deletion(-)
>> +
>> +diff --git a/usl/usl_timer.c b/usl/usl_timer.c
>> +index fda752b..d8414a6 100644
>> +--- a/usl/usl_timer.c
>> ++++ b/usl/usl_timer.c
>> +@@ -94,7 +94,9 @@ void usl_timer_tick(void)
>> +
>> +       if (!usl_tick_pending) {
>> +               usl_tick_pending = 1;
>> +-              write(usl_tick_pipe[1], &msg, sizeof(msg));
>> ++              if (write(usl_tick_pipe[1], &msg, sizeof(msg)) !=
>> sizeof(msg)) {
>> ++                      fprintf(stderr, "write to fd %i failed: %s\n",
>> usl_tick_pipe[1], strerror(errno));
>> ++              }
>> +       }
>> + }
>> +
>> +--
>> +2.13.2
>> +
>> diff --git a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
>> b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
>> index 969f434cc..e1c9215ca 100644
>> --- a/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
>> +++ b/meta-networking/recipes-daemons/ippool/ippool_1.3.bb
>> @@ -11,16 +11,16 @@ HOMEPAGE = "http://www.openl2tp.org/"
>>  SECTION = "console/network"
>>  LICENSE = "GPLv2+"
>>
>> -SRC_URI = "\
>> -
>> https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz
>> \
>> -        file://ippool_usl_timer.patch \
>> -        file://ippool_parallel_make_and_pic.patch \
>> -        file://ippool_init.d.patch \
>> -        file://always_syslog.patch \
>> -        file://makefile-add-ldflags.patch \
>> -        file://runtest.sh \
>> -        file://ippool.service \
>> -        "
>> +SRC_URI = "
>> https://sourceforge.net/projects/openl2tp/files/${BPN}/${PV}/${BPN}-${PV}.tar.gz
>> \
>> +           file://runtest.sh \
>> +           file://ippool.service \
>> +           file://ippool_usl_timer.patch \
>> +           file://ippool_parallel_make_and_pic.patch \
>> +           file://ippool_init.d.patch \
>> +           file://always_syslog.patch \
>> +           file://makefile-add-ldflags.patch \
>> +
>>  file://0001-usl_timer-Check-for-return-value-of-write-API.patch \
>> +           "
>>
>>  LIC_FILES_CHKSUM = "file://LICENSE;md5=4c59283b82fc2b166455e0fc23c71c6f"
>>  SRC_URI[md5sum] = "e2401e65db26a3764585b97212888fae"
>> @@ -50,7 +50,7 @@ do_compile_prepend() {
>>
>>      # ignore the OPT_CFLAGS?= in Makefile,
>>      # it should be in CFLAGS from env
>> -    export OPT_CFLAGS=
>> +    export OPT_CFLAGS="${SELECTED_OPTIMIZATION}"
>>  }
>>
>>
>> --
>> 2.13.3
>>
>>
>

