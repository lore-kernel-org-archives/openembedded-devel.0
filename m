Return-Path: <armccurdy@gmail.com>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 725B575231
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 19:34:19 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id e67-v6so20748389vke.7
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 04 Jun 2018 12:34:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=QweDtaX2GFacfPV0kK60KN/ys/lQHeIwpY8w0/J+WjI=;
	b=LQ1ipzDVM6DsEQ5Rizpfk1Io52qNE3N9OUZzI2Echw4ox6BXcLyeW6hgJYKH+R54di
	3XoRrQHYRZEyEPZf1k9jrbJAeG+7x+YtQNXkNfUVsFLwvMRyNHjdJW/kZCtXhdJ71jG9
	egcdFRJm6VSSiPb4EuuF10WRMyK1ZDeHX+/CMZXJjorZ6csDgBDcEb1YqOFsyd6/WAVg
	5AdNCl3S8SDXNJEoWDuo3sjV4j8aRqVhkGHfNRsicAASyD6fHIMdTjzXYB9Nz1RF+DE1
	CHM5jRzwtP/EygT+bb5xWyGmEP3HykMFMIPTIgE2KmDAKAcTnycUU+AuHodzZZv9/w/E
	YEdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=QweDtaX2GFacfPV0kK60KN/ys/lQHeIwpY8w0/J+WjI=;
	b=EW0Cz0oGi/mC1lLQMPI987bLDWZI7KnAgAoDs0GM90wx4stLj0AFCrAGaWdjupW8ag
	WACjEg48WA842t8Q1x6srFgAkipxB0uKjdYE8RHytGAon6cvwv+G38RNa6JN5lsBsL/1
	FbnCCPfwxtdNN8sYo2CNiIDETFUxd2HH/kdt3B+GNg66gnOH2hfc2kt+R44LnVFPFCrg
	nSPmaC06jkxl3qPivZxSepp70C1DRTMZLfgLhD9aBw+qvPhStkJ3gAxpFao0/ybfT1EB
	wP0ibHU1qkGzs4yVKAYXEEreLLX+HLLpQ9FW+SPQZMOTcJyu9m15rRXZ5yxwRKrGBdTh
	6uqA==
X-Gm-Message-State: ALKqPwcMF7Iukihjn2OK36kuxKCAiXlqDHnHIk4hFM42PpFggljEZpCU
	EoSc6x6OkLia1kN/zGirA3uF1RYmQehfHHInA6nxBw==
X-Google-Smtp-Source: ADUXVKJiL7Z0PRfNXf/4PSEzyIsTbAYPeR+iZ72N6uE75s3G3Mwz6OcWpzsCjZFxipudyraE1qx6BAm2zDuylDEfeNo=
X-Received: by 2002:a1f:1551:: with SMTP id
	78-v6mr12652331vkv.174.1528140860284; 
	Mon, 04 Jun 2018 12:34:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:ab0:28a:0:0:0:0:0 with HTTP;
	Mon, 4 Jun 2018 12:34:19 -0700 (PDT)
In-Reply-To: <6bc9b18c-7104-25ee-e7b5-7b04b7fed07f@skidata.com>
References: <20180601114158.24298-1-richard.leitner@skidata.com>
	<ab305d19-628d-097f-9905-e1f724abe6ba@gmail.com>
	<CAJ86T=Ux5-SHTB49_-mUSWFdkEaugnfO=jMSib1o7L17bmV6KA@mail.gmail.com>
	<6bc9b18c-7104-25ee-e7b5-7b04b7fed07f@skidata.com>
From: Andre McCurdy <armccurdy@gmail.com>
Date: Mon, 4 Jun 2018 12:34:19 -0700
Message-ID: <CAJ86T=XHwDKdgZX2H-4s+e_m6d2WxRJbSr1AhN-MqJhuX6xNsw@mail.gmail.com>
To: Richard Leitner <richard.leitner@skidata.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>,
	dev@g0hl1n.net
Subject: Re: [meta-oe][PATCH] pam-plugin-ccreds: add recipe
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
X-List-Received-Date: Mon, 04 Jun 2018 19:34:19 -0000
Content-Type: text/plain; charset="UTF-8"

On Sun, Jun 3, 2018 at 11:24 PM, Richard Leitner
<richard.leitner@skidata.com> wrote:
> On 06/01/2018 08:01 PM, Andre McCurdy wrote:
>> On Fri, Jun 1, 2018 at 10:40 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>> On 6/1/18 4:41 AM, Richard Leitner wrote:
>>>> Add version 11 of the pam-plugin-ccreds with the debian patches applied.
>>>
>>> I see QA errors like below
>>>
>>> ERROR: pam-plugin-ccreds-11-r0 do_package_qa: QA Issue: non
>>> -dev/-dbg/nativesdk- package contains symlink .so: pam-plugin-ccreds
>>> path
>>> '/work/core2-64-bec-linux-musl/pam-plugin-ccreds/11-r0/packages-split/pam-plugin-ccreds/lib/security/pam_ccreds.so'
>>> [dev-so]
>
> Thanks for that information.
> Do you know if other targets than "linux-musl" are affected?
>
>>
>> According to OE's sanity checks, a .so plug-in should not be a symlink.
>>
>> See the do_install_append() in the libcgroup recipe in oe-core for an
>> example of how to fix the issue.
>
> IMHO in this case the better solution is to add the missing targets
> to the following patch... Or does anybody know how to pass wildcards to
> string comparisons in AM_CONDITIONAL? Google wasn't very helpful here...

Untested, but I guess something like this would work:

  AM_CONDITIONAL(EXTENSION_SO, case "$target_os" in linux*) true;; *)
false;; esac)

The approach in your patch also looks OK.

