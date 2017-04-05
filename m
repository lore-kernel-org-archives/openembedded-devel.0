Return-Path: <raj.khem@gmail.com>
Received: from mail-wr0-f193.google.com (mail-wr0-f193.google.com
	[209.85.128.193])
	by mail.openembedded.org (Postfix) with ESMTP id 62AEB71DAE
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  5 Apr 2017 17:05:41 +0000 (UTC)
Received: by mail-wr0-f193.google.com with SMTP id w43so4436839wrb.1
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 05 Apr 2017 10:05:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=nYew34BOXxjbfqHVm4Iw2bVW2F2OZ7JPJs2P26cSXXU=;
	b=pbSorjxOAIKBdbMOPgpxRAd/RQsxwdWnjx1tn4fyC4qQHkG8xKHL9QOZImqbUUDGs4
	LIQKAwA0ULguyrMvOASjivMtpS/Xd4cbst5eF1mjYzik+JHoftmjw6j9D3sT+glNknVL
	XBtqS1qg1saR6A1dbPFrGqJ7Sr6v9sC+Ku/N4LlEn9g7W6Vs0KqB0OkHfJyqFiMkLYq5
	gINXTlSxjnd+1TsIvue1H8yRFRZ5pL1TfmF3WMnYFfWOsMwSLVY8CwLFIuH33AW1MSPX
	wwzKdfHrfgWVrFs3HTm9KPacxvHBOcKsDjClAhPK7CBKEJGLWogW4L6sNI13JT/jArGr
	19+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=nYew34BOXxjbfqHVm4Iw2bVW2F2OZ7JPJs2P26cSXXU=;
	b=uIgjPyuPGdHgrIHyRl9nqltSTsL+hF8dcuOFeJzMhEWvP8vPAQA6XZPoT7cBV635Rl
	SDvCKpaDNAOGtTUT73/r84WAeScFCQeF9BsHTpMM7PA22ZwMAonRcH6wdplBM5Tr6chh
	ODlV/tWXL0fXlg2el17zxBwoCc14PCW/dZX5glKzSAPKM7BdZmuL9u4rJ0IwiVuMvJ16
	W1zP7mO3zDR/BjJWEnNwwY2BgzUXe5XfKhoCHBpWL7TqxAvNbYMO3L9CmSqVMmKAE/nu
	/KSFp/OvAENUU9A9G4brlhTzar01UvGf8NmnNEKWUPv3mQr8ZofaBjY0v+EJ/tjwk5EX
	hv/w==
X-Gm-Message-State: AFeK/H2edW1Z9sciHwbpujFU38ZCAooIxZkyhz5QNLvWoqfqswD2P9EVYZSQQB52NG6x3o/JAx28ygaLdSPLDA==
X-Received: by 10.223.138.225 with SMTP id z30mr26842010wrz.26.1491411942386; 
	Wed, 05 Apr 2017 10:05:42 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.180.162 with HTTP; Wed, 5 Apr 2017 10:05:11 -0700 (PDT)
In-Reply-To: <CA+chaQd0q-zkbt3887iqPszQqf-5TUcsw5c1gPPBrCh6AUBzkQ@mail.gmail.com>
References: <20170331164247.5052-1-raj.khem@gmail.com>
	<20170331164247.5052-24-raj.khem@gmail.com>
	<CA+chaQd0q-zkbt3887iqPszQqf-5TUcsw5c1gPPBrCh6AUBzkQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 5 Apr 2017 10:05:11 -0700
Message-ID: <CAMKF1squdKPFDd6G1j44G-s2VLEMBceoKMd4tJBj0hUw-5L2yw@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 24/43] minicoredumper: Update to 2.0.0
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
X-List-Received-Date: Wed, 05 Apr 2017 17:05:44 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 2, 2017 at 12:14 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> minicoredumper-2.0.0: minicoredumper: Files/directories were installed but
> not shipped in any package:
>   /run
> Please set FILES such that these items are packaged. Alternatively if they
> are unneeded, avoid installing them or delete them within do_install.
> minicoredumper: 1 installed and not shipped files. [installed-vs-shipped]
>

Pushed a fix for this here
https://github.com/kraj/meta-openembedded/commit/0016878d08216270f08bb190afaa7ad14326e4ef

>
> On Fri, Mar 31, 2017 at 6:42 PM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> Clarify licensing and switch to github for fetching
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  ...inicoredumper_1.0.2.bb => minicoredumper_2.0.0.bb} | 19
>> +++++++++++++------
>>  1 file changed, 13 insertions(+), 6 deletions(-)
>>  rename meta-oe/recipes-kernel/minicoredumper/{minicoredumper_1.0.2.bb =>
>> minicoredumper_2.0.0.bb} (64%)
>>
>> diff --git a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
>> b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
>> similarity index 64%
>> rename from meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
>> rename to meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
>> index babe54448..f3071e39a 100644
>> --- a/meta-oe/recipes-kernel/minicoredumper/minicoredumper_1.0.2.bb
>> +++ b/meta-oe/recipes-kernel/minicoredumper/minicoredumper_2.0.0.bb
>> @@ -1,17 +1,24 @@
>>  SUMMARY = "minicoredumper provides an alternate core dump facility for
>> Linux \
>>  to allow minimal and customized crash dumps"
>> -LICENSE = " LGPLv2.1 & BSD"
>> -LIC_FILES_CHKSUM = "file://COPYING;md5=45445387350de96a0e70410470ee5cab"
>> -DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux"
>> +LICENSE = " LGPLv2.1 & BSD-2-Clause"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=709087c2ed0acda54a4d91497a889e42 \
>> +
>> file://COPYING.BSD;md5=b915ac80d5236d6aa659cb986daf00e5 \
>> +
>> file://COPYING.LGPLv2.1;md5=321bf41f280cf805086dd5a720b37785 \
>> +                   "
>> +DEPENDS = "elfutils dbus dbus-glib-native glib-2.0 dbus-glib util-linux
>> json-c"
>>
>>  inherit autotools pkgconfig systemd update-rc.d
>>
>> -SRC_URI = "https://linutronix.de/${BPN}/files/${BPN}-${PV}.tar.gz \
>> +SRCREV = "248019446ccf6079926efb54f8b6dd7be769bbae"
>> +
>> +PR .= "+git${SRCPV}"
>> +
>> +SRC_URI =
>> "git://github.com/Linutronix/minicoredumper-debian;branch=unstable \
>>             file://minicoredumper.service \
>>             file://minicoredumper.init \
>>  "
>> -SRC_URI[md5sum] = "5ba9d116b52a8e2fb93456260644e753"
>> -SRC_URI[sha256sum] =
>> "1b0eeb3d70dbd2ad6f2f673e4e3446e5dd784e132730e21d8f9dc0977e47dd9a"
>> +
>> +S = "${WORKDIR}/git"
>>
>>  SYSTEMD_SERVICE_${PN} = "minicoredumper.service"
>>  SYSTEMD_AUTO_ENABLE = "enable"
>> --
>> 2.12.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

