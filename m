Return-Path: <ross.burton@intel.com>
Received: from mail-qt0-f179.google.com (mail-qt0-f179.google.com
	[209.85.216.179])
	by mail.openembedded.org (Postfix) with ESMTP id AB72E7807B
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 09:21:53 +0000 (UTC)
Received: by mail-qt0-f179.google.com with SMTP id f92so44400258qtb.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Jun 2017 02:21:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=7TwmaVKHDZbMJ+1ls5qLU1b+JKuIRgSyi4NnJcJenfQ=;
	b=sgpCzoncvFzFwBNqkPWhYIR7izEqvbiQDJ6IQMzEtpWiMysdgMgtWYq0MZGZP7ls1F
	zfWEZSeBdlGENPLOeZBAMlmtEhWMPLhZR10wXuurvt9dCSWn01vgx90Awjrr5mPTnWcA
	9kItOGnnDxnjmaeLjXYJJyHMgqUT1IqOpAhhk/QhR17SrGFXteg/BZxHzpA0jA8n8s8b
	l5+3q9T3e5RdjRX6HJxYtnx/axSzGXItZJiEWOgncaEBYIF05bdzBhaUj5BMeE8EJM6h
	21FlOvc6kJW6B8lvJZVpYy6uFhGWp+Pi/uM1eP/ULyLlYv5062YoKFkBeGS8SoukQzg+
	FWBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=7TwmaVKHDZbMJ+1ls5qLU1b+JKuIRgSyi4NnJcJenfQ=;
	b=VecgHuHoBPktQnNLOUQwClUjJIAvJ6FISyh+tVJIaXju3vlZ3mn2RmCbmhWCnhky7W
	uAc2t8lI0T+zcWIoEaSpT+c76S5jYhdkrQYxl7w6OHHZySg9S0NYECcdJLKze8iS6Et4
	PCAgTJXp8aznd/gvzCEfk0EhwklWLNMS+N2sPl2gwJKVz5ygxmN954MMuooLzIP9tkwa
	N10W2KIsmhIWSw0UzzOqitGdSvX9YA1mn6QXo3JO2+OsOsuDOcRl9AFw37T/c17XTzSv
	K68bfJMeG/7Zr4o48c3RMKXAw9NQi9dC21xO1QxR4AGtr+HLthlh/+KM1vgvfKxw+4dO
	9iAA==
X-Gm-Message-State: AKS2vOxQ59zqsO29kRX017CO+z4bJCPHFGC3H8IxjL9rRapDToOURYK8
	oKOAXL7munoEF/abpE/zjOnMt+TmSGP0
X-Received: by 10.237.49.41 with SMTP id 38mr11351066qtg.161.1498641714997;
	Wed, 28 Jun 2017 02:21:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.31.118 with HTTP; Wed, 28 Jun 2017 02:21:34 -0700 (PDT)
In-Reply-To: <CA+chaQfwLN87QvhhwCBaw-NtgvtcOFub-rSCcoxjAD=QKkQRMg@mail.gmail.com>
References: <20170626151117.6221-1-ross.burton@intel.com>
	<20170626151117.6221-7-ross.burton@intel.com>
	<CA+chaQfwLN87QvhhwCBaw-NtgvtcOFub-rSCcoxjAD=QKkQRMg@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Wed, 28 Jun 2017 10:21:34 +0100
Message-ID: <CAJTo0LbOa-CQYyUwvA9H_QxgMkOZmb07LJ0Lijiz8j=VruWK7w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 7/8] meson: use tarball instead of git checkout
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
X-List-Received-Date: Wed, 28 Jun 2017 09:21:55 -0000
Content-Type: text/plain; charset="UTF-8"

That's not a generated archive but an uploaded tarball.

Ross

On 26 June 2017 at 16:26, Martin Jansa <martin.jansa@gmail.com> wrote:

> I still don't trust github archives/releases, can we skip this one?
>
> On Mon, Jun 26, 2017 at 5:11 PM, Ross Burton <ross.burton@intel.com>
> wrote:
>
>> Signed-off-by: Ross Burton <ross.burton@intel.com>
>> ---
>>  meta-oe/recipes-devtools/meson/meson_0.40.1.bb | 10 +++-------
>>  1 file changed, 3 insertions(+), 7 deletions(-)
>>
>> diff --git a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>> b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>> index ab54b8c79..f33256a10 100644
>> --- a/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>> +++ b/meta-oe/recipes-devtools/meson/meson_0.40.1.bb
>> @@ -4,13 +4,9 @@ SUMMARY = "A high performance build system"
>>  LICENSE = "Apache-2.0"
>>  LIC_FILES_CHKSUM = "file://COPYING;md5=3b83ef96387f14655fc854ddc3c6bd57"
>>
>> -SRC_URI = " \
>> -    git://github.com/mesonbuild/meson.git \
>> -"
>> -
>> -SRCREV = "b25d3e4d3f2b4d37029a507cc089bdde643c6240"
>> -
>> -S = "${WORKDIR}/git"
>> +SRC_URI = "https://github.com/mesonbuild/meson/releases/download/${PV}
>> /${BP}.tar.gz"
>> +SRC_URI[md5sum] = "8475b19d5f5f3bd5c40f4bb1f31b93f3"
>> +SRC_URI[sha256sum] = "890ce46e713ea0d061f8203c99fa7
>> d38645354a62e4c207c38ade18db852cbf5"
>>
>>  inherit setuptools3
>>
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
>
>

