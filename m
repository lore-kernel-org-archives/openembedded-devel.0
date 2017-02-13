Return-Path: <patrick.ohly@intel.com>
Received: from mail-it0-f41.google.com (mail-it0-f41.google.com
	[209.85.214.41])
	by mail.openembedded.org (Postfix) with ESMTP id 7814C71976
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 13 Feb 2017 07:23:45 +0000 (UTC)
Received: by mail-it0-f41.google.com with SMTP id c7so68561031itd.1
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Feb 2017 23:23:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=message-id:subject:from:to:date:in-reply-to:references:organization
	:mime-version:content-transfer-encoding;
	bh=PcavYcK0sqHePBauQaSb7908hFgqDFjvnXccrVLZf0I=;
	b=aN4Nq7P33P89GMOq3nNFuuQvVBPrgEEZyRkAxumekqkGs7gwQAcARvy9Nzyi7FWc6b
	Xsk2zglwZJAmb/slKLqNeV4lP29h3pXcY8KH+OXBaNq753ghaIxTFskjGT3YTGrwNC+5
	89RYQ6fUTWSif7gMGM+GiJKcdabc11Oe0PHn/QndvrWUtHDg24EYzL8ENeJK98CiRKVg
	vK2zvWYCd3QbCvjWyWS3f5MEasv5yktTAD+w5JHA4WLX0Sb+z9tp8FKWu2AVmpxbxHZc
	o9XZg92fGicjuMUyPDGVGmuwq5rPqIFQ47/AMLZuUx9kAo2IFgpfyzNtg1/po89l2f2f
	Z16Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
	:references:organization:mime-version:content-transfer-encoding;
	bh=PcavYcK0sqHePBauQaSb7908hFgqDFjvnXccrVLZf0I=;
	b=FSGtgUbhHVaJIDhwY1SKhsN7lNiD8/jVZBIT7G43tBov6gS84IEPdPFb4rr+w1ZrCI
	w6AmIriVNUEJSBnDrlZnAjSTvPmQFMI2AfEEOOY7uD7arzcL/ytCQ8knE55iuH+jvZkE
	CODxlby249mTaucPApcu2XLca2PM5DYFXUsPnACxVJN/qatgVpz/D8Vwe/O0DYXft47t
	gISR+02NulwXzKIH7jU42ruhywvkm7nG292yUmjpSGu7BNDIMVtAIVpP3x0cVWMuRx4L
	qUvhYKg5Lea+vhLMzdn0l3W8PSCiD+/3XyOLgUyba6Dut8eAeYnHYrwx0UAx5PMxm2VG
	2WWg==
X-Gm-Message-State: AMke39kT5NuHAJ6/ubIn8niAek3b4A+iYP4bQD43J8NJqJE/13FP9u9yK59mxB3xUjSRwNM7
X-Received: by 10.107.48.199 with SMTP id w190mr21981957iow.117.1486970625594; 
	Sun, 12 Feb 2017 23:23:45 -0800 (PST)
Received: from pohly-mobl1 (p5DE8DB6A.dip0.t-ipconnect.de. [93.232.219.106])
	by smtp.gmail.com with ESMTPSA id 62sm1870654itl.1.2017.02.12.23.23.43
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 12 Feb 2017 23:23:43 -0800 (PST)
Message-ID: <1486970621.13854.191.camel@intel.com>
From: Patrick Ohly <patrick.ohly@intel.com>
To: openembedded-devel@lists.openembedded.org
Date: Mon, 13 Feb 2017 08:23:41 +0100
In-Reply-To: <CA+chaQdusR+PaaJNB8gp0nqrmV+rRUos+SCiXN1Z3aCUiKHGFw@mail.gmail.com>
References: <cover.05852f1b820c067f96dd93729e6fdb949d51579d.1486546542.git-series.patrick.ohly@intel.com>
	<c480e4bea612959118bcdbc09e129084fd1d5866.1486546542.git-series.patrick.ohly@intel.com>
	<CAMKF1spq2eiKHXrz19ZzRWmwzWUKsSSHbunLfqRND98SjkHgVg@mail.gmail.com>
	<1486660318.13854.105.camel@intel.com>
	<CAMKF1sqH1XGcG47CGp-CcgE5EYJ2_JE6wBw9V3=XDJ9-=LUHsw@mail.gmail.com>
	<CA+chaQdusR+PaaJNB8gp0nqrmV+rRUos+SCiXN1Z3aCUiKHGFw@mail.gmail.com>
Organization: Intel GmbH, Dornacher Strasse 1, D-85622 Feldkirchen/Munich
X-Mailer: Evolution 3.12.9-1+b1 
Mime-Version: 1.0
Subject: Re: [meta-oe][PATCH 1/4] lvm2: remove unbuildable 2.02.138
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
X-List-Received-Date: Mon, 13 Feb 2017 07:23:47 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2017-02-11 at 00:15 +0100, Martin Jansa wrote:
> It seems to be buildable when you add:
> 
> EXTRA_OECONF += "--disable-selinux \
>                  --with-cluster=none \
>                 "
> at least that's what one of my .bbappends does.

That's odd, for me it is do_patch which fails already, i.e. configure
arguments aren't even used:

ERROR: lvm2-2.02.138-r0 do_patch: Command Error: 'quilt
--quiltrc /fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/lvm2/2.02.138-r0/recipe-sysroot-native/etc/quiltrc push' exited with 0  Output:
Applying patch 0001-implement-libc-specific-reopen_stream.patch
patching file lib/log/log.c
Hunk #1 FAILED at 161.
Hunk #2 succeeded at 209 with fuzz 2 (offset 2 lines).
1 out of 2 hunks FAILED -- rejects in file lib/log/log.c
patching file tools/lvmcmdline.c
Hunk #1 succeeded at 1744 (offset -74 lines).
Hunk #2 succeeded at 1754 (offset -74 lines).
Hunk #3 succeeded at 1762 (offset -74 lines).
Patch 0001-implement-libc-specific-reopen_stream.patch does not apply
(enforce with -f)
ERROR: lvm2-2.02.138-r0 do_patch: Function failed: patch_do_patch
ERROR: Logfile of failure stored
in: /fast/build/refkit/intel-corei7-64/tmp-glibc/work/corei7-64-refkit-linux/lvm2/2.02.138-r0/temp/log.do_patch.2472
ERROR: Task
(/work/iot-ref-kit//meta-openembedded/meta-oe/recipes-support/lvm2/lvm2_2.02.138.bb:do_patch) failed with exit code '1'

Perhaps that is one of those cases where it depends on the native patch
tool whether patching still works?

Anyway, the changes that I'd like to see merged are the others. So if
there's no consensus that 2.02.138 can and/or should be removed, let's
keep it.

-- 
Best Regards, Patrick Ohly

The content of this message is my personal opinion only and although
I am an employee of Intel, the statements I make here in no way
represent Intel's position on the issue, nor am I authorized to speak
on behalf of Intel on this matter.




