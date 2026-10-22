Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.1224.1792682006598540686
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 22 Oct 2026 08:13:26 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mailbox.org header.s=mail20150812 header.b=kEbYosrR;
 spf=pass (domain: mailbox.org, ip: 80.241.56.172, mailfrom: marek.vasut@mailbox.org)
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4j9V5v1hhczMlMf;
	Thu, 22 Oct 2026 17:13:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1792682003;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mQvKSIwCzPpXbW4MwvUdtXXS9RJkBMWP1CbgGZn8eYk=;
	b=kEbYosrRr3Dn3bYaj1pweqtSIr8uDbwLGeM8sRdBNosKzyJsfhAbXomORomL0KGjFjyRXB
	HtplmzZJTSKoR++YEYsD8s8kaQOZ1iZ14f6SNX4iPAjMdBTPCEMgjYmG6VUMJPTSh6/JF7
	ySnW6iVi0Zh1wDzsE5W0LhGnz76yVjeZDUI3ZNpnG+L3wpSDS4jqm60Tj2XPwQ0BVj5Tgg
	yLhdtzDiQokXMXotqau01Jw+V0ejd30Y1I4DVIk9cgSewrI7UGg/BqrjGwZmNIA3QctD52
	t9iDgL8Z8k2gUvE8F9sIoPA00/CTNTggPjy/FmOF80ccD+my8RJHaxyJA3Wapw==
Message-ID: <0eba48ad-5c1f-4041-8f8b-c261f18d29d6@mailbox.org>
Date: Thu, 22 Oct 2026 17:13:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-filesystems][PATCH] overlayfs-tools: Inhibit tests on
 configure
To: Vyacheslav Yurkov <uvv.mail@gmail.com>,
 openembedded-devel@lists.openembedded.org
Cc: Alexander Kanavin <alex@linutronix.de>,
 Ankur Tyagi <ankur.tyagi85@gmail.com>, Khem Raj <khem.raj@oss.qualcomm.com>
References: <20261021135357.14928-1-marek.vasut@mailbox.org>
 <6f762fe7-ddf1-49bf-96bb-8e1d75f575c8@gmail.com>
 <d1168121-cced-4238-8dee-9c1b1169e484@mailbox.org>
 <5a50bdd9-6d29-4066-82f0-c13811810760@gmail.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <5a50bdd9-6d29-4066-82f0-c13811810760@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MBO-RS-META: qtr8n7785yo1cktwbg4uwcu14ruuwbc3
X-MBO-RS-ID: b298bdfb171a0d7c8f3
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Thu, 22 Oct 2026 15:13:33 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/131316

On 10/22/26 2:24 PM, Vyacheslav Yurkov wrote:
> On 21.10.2026 18:27, Marek Vasut wrote:
>> On 10/21/26 5:09 PM, Vyacheslav Yurkov wrote:
>>> Thanks for the patch Marek.
>>>
>>> Could you please explain how you hit the issue? I can't reproduce it.
>>> The sudo is required only for tests, which is a custom meson target. 
>>> It's not supposed to be called during configure.
>> $ bitbake -c configure overlayfs-tools
>>
>> on aarch64 (STM32MP25) target (not using the ST layers).
>>
>> I would also expect the tests to NOT run during configure.
>>
>> It also happens in OE wrynose builds, but not in OE scarthgap builds.
> 
> I was not able to reproduce it either on wrynose or on master. Although 
> I usually build x86_64 / arm32, but I don't think that makes a difference.
> 
> Any chance your BSP adds a "meson test" call at any point?

Can you try this:

"
# conf/local.conf
MACHINE ??= "qemux86-64"
USER_CLASSES ?= "buildstats"
PATCHRESOLVE = "noop"
BB_DISKMON_DIRS ??= "\
     STOPTASKS,${TMPDIR},1G,100K \
     STOPTASKS,${DL_DIR},1G,100K \
     STOPTASKS,${SSTATE_DIR},1G,100K \
     STOPTASKS,/tmp,100M,100K \
     HALT,${TMPDIR},100M,1K \
     HALT,${DL_DIR},100M,1K \
     HALT,${SSTATE_DIR},100M,1K \
     HALT,/tmp,10M,1K"

CONF_VERSION = "2"
"

"
# conf/bblayers.conf
LCONF_VERSION = "7"
BBPATH = "${TOPDIR}"
BBFILES ?= ""
BBLAYERS ?= " \
   /oe-core___wrynose-6.0/meta \
   /meta-openembedded___wrynose-6.0/meta-oe/ \
   /meta-openembedded___wrynose-6.0/meta-python/ \
   /meta-openembedded___wrynose-6.0/meta-networking/ \
   /meta-openembedded___wrynose-6.0/meta-filesystems/ \
   "
"

$ . oe-init-build-env /path/to/builddir
$ MACHINE="qemux86-64" DISTRO="nodistro" bitbake -c configure 
overlayfs-tools

?

Also, please run 'which sudo' and check whether sudo isn't actually 
installed on your build machine (it is NOT installed on mine, because it 
is a minimal container)
