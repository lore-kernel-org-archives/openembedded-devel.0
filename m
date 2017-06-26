Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id ED32177E4A
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 14:21:09 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id f134so532874wme.1
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jun 2017 07:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=yrtVSbTj2kneHaEMIPW3mcbVIewNjNggrbvqiwp94/A=;
	b=awDRPonTZS/0bR577zhiA6VWLxPY9HCv7B5AoS+8Bpe/2JYtdZEm0FzA+ivnAWE/oJ
	ElyrOXpg9hyuF3/x3hqBYZZO5+HpGTDiYFitpp1D7kBj03TkBf8ue7NnjoMu0rXNTUQq
	vRaFzwMGgh3MO7rK400+ZsoZU0ABO+2Wb7Q8slfMs2atfwI9GfzL5I+OFHq0zl9g4/BQ
	sTmduqEbaJp5TbPAYDgBPWmYyrhfm05/MQbp8wsuMCTFkakOZN+9Cz/TNapz6y0VPLHX
	VaxFAhCdsbqCVwKoKsSKSnz95zQgyS7uVCL6M5uduu4dco+mt3jH++3amDxwAuOlUfPq
	VTDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=yrtVSbTj2kneHaEMIPW3mcbVIewNjNggrbvqiwp94/A=;
	b=LqAxKhRX7rpqu9Bbqljn+5EbZhbWguGZh+IL4msZb7OKHjD4fC56BjKy+EoAqGJqEN
	sv/OOAoDI1axhvqtNMm6z4cpCD5ExnZIinlNtPkVaVDJ5qvQLevatJZTreFSCE3AEsOg
	yxiNY1SYA3jVaVyoLFBwXmhvWjk+XM++YM4U/sVTEncjRLtXajygZJp+Hr5ADx9tToMy
	+LTxpjb9UZFGc8mD0S/2Y8ye0rl4uknCHlBIwlbyRWBe7/7u8JVf2kID/HwWGu/CGcWF
	yHAQXppwdUIdbnoMTPa8KAgWcwBEQ5FVY4tPXmoA+wn9JnDezGzMRice5IRk0HyUEoCV
	MRsg==
X-Gm-Message-State: AKS2vOxvkIitemIJ6O2eay0mmPpXcxrA1NcazveRs4hewhcoEJzWJdYQ
	VouZzGq28OIapf2dF/LibAOJMeZQYw==
X-Received: by 10.80.154.129 with SMTP id p1mr291039edb.131.1498486870387;
	Mon, 26 Jun 2017 07:21:10 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.165.198 with HTTP; Mon, 26 Jun 2017 07:20:39 -0700 (PDT)
In-Reply-To: <CA+chaQfTi=1m7dc9roW3LyHwNMy1RULDa7SOfyqBv+mFm+uWmQ@mail.gmail.com>
References: <20170622064655.16412-1-Qi.Chen@windriver.com>
	<CA+chaQfTi=1m7dc9roW3LyHwNMy1RULDa7SOfyqBv+mFm+uWmQ@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Mon, 26 Jun 2017 07:20:39 -0700
Message-ID: <CAMKF1sqT=cmGwAyLBg_rUx0pJyMJwZbdTueKo50gpqTkHNTj9w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] hwloc: add several PACKAGECONFIG items
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
X-List-Received-Date: Mon, 26 Jun 2017 14:21:10 -0000
Content-Type: text/plain; charset="UTF-8"

On Fri, Jun 23, 2017 at 3:14 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Should numactl be enabled by default?
>
> numactl.bb currently marks it ARM incompatible:
> # ARM does not currently support NUMA
> COMPATIBLE_HOST = "^((?!arm).*)$"
>
> and enabling the PACKAGECONFIG here by default would extend the same
> restriction to hwloc as well.
>

This patch exposes another issue where pkgconfig comes into picture but
is missing in rss

fix is here
http://lists.openembedded.org/pipermail/openembedded-devel/2017-June/113366.html

>
> On Thu, Jun 22, 2017 at 8:46 AM, Chen Qi <Qi.Chen@windriver.com> wrote:
>
>> Add PACKAGECONFIG items to allow for more flexiblity.
>>
>> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
>> ---
>>  meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb | 10 ++++++++--
>>  1 file changed, 8 insertions(+), 2 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> index e067f2799..16cd507e6 100644
>> --- a/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> +++ b/meta-oe/recipes-extended/hwloc/hwloc_1.11.5.bb
>> @@ -13,10 +13,16 @@ SRC_URI[sha256sum] = "95d80286dfe658a3f79e2ac9069878
>> 2bb36e5504f4bac1bba2394ba14d
>>
>>  inherit autotools
>>
>> -DEPENDS += "cairo ncurses udev libxml2 zlib libpciaccess"
>> -DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'x11',
>> 'virtual/libx11', '', d)}"
>> +DEPENDS += "ncurses udev zlib"
>>  DEPENDS += "${@bb.utils.contains('DISTRO_FEATURES', 'selinux',
>> 'libselinux', '', d)}"
>>
>> +PACKAGECONFIG ?= "numactl pci libxml2 ${@bb.utils.contains('DISTRO_FEATURES',
>> 'x11', 'x11', '', d)}"
>> +
>> +PACKAGECONFIG[numactl] = "--enable-libnuma,--disable-
>> libnuma,numactl,numactl"
>> +PACKAGECONFIG[libxml2] = "--enable-libxml2,--disable-
>> libxml2,libxml2,libxml2"
>> +PACKAGECONFIG[x11] = "--with-x,--without-x,virtual/libx11 cairo,cairo"
>> +PACKAGECONFIG[pci] = "--enable-pci,--disable-pci,
>> libpciaccess,libpciaccess"
>> +
>>  # Split hwloc library into separate subpackage
>>  PACKAGES_prepend = " lib${PN} "
>>  FILES_lib${PN} += "${libdir}/lib${PN}.so*"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

