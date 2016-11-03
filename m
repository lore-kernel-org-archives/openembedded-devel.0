Return-Path: <ross.burton@intel.com>
Received: from mail-qk0-f173.google.com (mail-qk0-f173.google.com
	[209.85.220.173])
	by mail.openembedded.org (Postfix) with ESMTP id 1C8C571A35
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Nov 2016 14:41:26 +0000 (UTC)
Received: by mail-qk0-f173.google.com with SMTP id x190so57760115qkb.0
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Nov 2016 07:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=intel-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to; 
	bh=Kh2KQ7/b6UIHLt3Ixqt5+o0sN46f5cfvVdyypmLN58Q=;
	b=GkLwvKIl7UTA935TT+ZEEX0R+KUM6Ca8xsPCJCUXdX4NdYs1IpB5txFGNJVWzEuwKL
	7s86HL1FgWX+m5q0+FBaOQ5SMWTpoT3tUWPbOuXUnsjwxYNs+foDXqPF7UJ1iNmB7sB4
	RKU0KiPxxmq0Dopwe8YddLw2WVuxhUklNhCuVbLx5aaYCBK/imz83MLsfsU0C5s2go2C
	MIuK9TTHBhNkFlAcgXbtq06ykYfYu21/SspvnIfu7hGxY24Fxy/hEyhN0940vJryiSuV
	/spXLWXYyBvYhmIQWm7TdSuqtZh32ZaxjR1WUrdsWX341CC5YqfzC/viNtY8gQPx0GNb
	SHmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to;
	bh=Kh2KQ7/b6UIHLt3Ixqt5+o0sN46f5cfvVdyypmLN58Q=;
	b=XhEt3xSEZg2hwEDry2wXbc0TH85teDxsB8uBbdHWep2hGZ/yQz/87Yc/wGfu46Vm6q
	4UzKFqV529wG0O/IIZ9PavAp5qn+5dGHmj0Bcx8ErEBu99+3oAPPwuFtS2RzX6PFA3VB
	bzxFGHfikSD2tjCmm1CKYpwSeCXSBs1eYN9dth0tyN7Gq3YJ3DYMyAaEmgshpMAVcoiM
	G+s2lDIVDRLYtKX3A2pEMizUpA6z49XT8QwO2qPxVBO5V4F07ZErvMNzFRDxMM5jdhk8
	bnEUSCfWRcCCKwnEdT13ZPaEtlWpoti2mgvmZjTc3/++bE5ETcrSAbVVfJIgZmCzZ/KH
	20jA==
X-Gm-Message-State: ABUngvd6JJio4ujEZp/zyjSKgYRhfgcBFDG54bGAyro8MIkQEQMK/GBLwF4z+flXv6fNSmMtzTzWr5uXiAVQnIh2
X-Received: by 10.55.215.6 with SMTP id m6mr7750840qki.244.1478184087751; Thu,
	03 Nov 2016 07:41:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.140.85.208 with HTTP; Thu, 3 Nov 2016 07:41:07 -0700 (PDT)
In-Reply-To: <1735731.JWP8iUgCxd@elrond>
References: <1735731.JWP8iUgCxd@elrond>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Thu, 3 Nov 2016 14:41:07 +0000
Message-ID: <CAJTo0LZQQD8NGVYuO10ceBfvTW4hTiBbtHLwVcZNGjqZ+QMi8A@mail.gmail.com>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: [meta-oe] p7zip recipe broken with rm_work
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
X-List-Received-Date: Thu, 03 Nov 2016 14:41:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 3 November 2016 at 11:03, Jan-Simon M=C3=B6ller <dl9pf@gmx.de> wrote:

>     # Create a shell script wrapper to execute next to 7z.so
>     mv ${D}${bindir}/7z ${D}${bindir}/7z.bin
>     echo "#! /bin/sh" > ${D}${bindir}/7z
>     echo "exec ${D}${bindir}/7z.bin \"\$@\"" >> ${D}${bindir}/7z
>     chmod 0755 ${D}${bindir}/7z
> }
>
> This wrapper breaks with "rm_work". Shouldn't it use the sysroot ?
>

Yeah the script should just use ${bindir}, but why is there even a wrapper
script?

Ross

