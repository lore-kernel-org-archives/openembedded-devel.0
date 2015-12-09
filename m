Return-Path: <ian@boundarydevices.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id 5DD8B6012C
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  9 Dec 2015 04:44:39 +0000 (UTC)
Received: by wmec201 with SMTP id c201so241602044wme.0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Dec 2015 20:44:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=boundarydevices-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=gewgarcfo9oHTwhCj8TaiYdCZQDYZr/srDaaWjKCdUE=;
	b=QHgNgXMO9E2eQY6vsmhPh1+giewIqTqOlx1WKxFeKf0k3SolkAdMmcgoxXyRFKAwg0
	BVowVerePzGC5hoeiClxudzqOTdkgplzVyQoIAaXfreh0BRm1DS73CgtVqBCIj5h6Ry7
	0zSmS0llVVFcchbWXWiELCDUzH7psQlIZS5g45iWXyo4vXYrNyRM454WchvcV4E0LWw7
	dJMDQ0Wuvdp7mcRUHcgVA8pSS1JGycioXRBW7Rj27kbkL18HBo3qN9urbG/WoJwq6UCL
	Y6vwexzuZaF2epV23wTGYdDinPGsgBNP5uvQQbzzKpu8RcPxU4YXpOLeaN/MTBkDXtlw
	UacQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=gewgarcfo9oHTwhCj8TaiYdCZQDYZr/srDaaWjKCdUE=;
	b=QCUd6elwd1YCvoQmzr+xeLOtqtcXumLOB5jEyFU3LO5Mlt65Zhr8yqCAf10TO2JOis
	nL48qK5gpOUv0Z+g3WC2TKLybdmAujZwsvZ6MqIjTkWRcw4qH90HxOdfGJDViX7cptG+
	PXo5k6fvasF8VumHVRu/rkTCFtFLv93yl8FfOqrtyXFVMZ3MEMj+cjfmhBTVcv7+chEE
	0jjoPy3HcinTzSR9J4FN+2NhIduf75aktDMR+ksCbkDQrzjj9iRBL1/WUB/LQhclJDOB
	DQboqgFvhnPPVucCwzHUIAbSdG42srqWvtLFXvLjl8s8+4BJ7iULTq7k9E392DiSbETp
	3i2w==
X-Gm-Message-State: ALoCoQkmRWN91aah24ZwyR7nHKFnW2E3Tbfpp1u4h6MRjUZrTT94hB3vAyDeenRsl1YSQfviDhxHQIDEy5lLkalHROGJEWKZFg==
MIME-Version: 1.0
X-Received: by 10.28.133.4 with SMTP id h4mr8072944wmd.59.1449636279890; Tue,
	08 Dec 2015 20:44:39 -0800 (PST)
Received: by 10.27.110.18 with HTTP; Tue, 8 Dec 2015 20:44:39 -0800 (PST)
Date: Tue, 8 Dec 2015 20:44:39 -0800
Message-ID: <CADseiPn5N3ji8WhvoEE=F1_u9R_n33MQAdWgHsE7TYHR=3T3bA@mail.gmail.com>
From: Ian Coolidge <ian@boundarydevices.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: [meta-browser] chromium segfault and "Debug" CHROMIUM_BUILD_TYPE fails to build
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
X-List-Received-Date: Wed, 09 Dec 2015 04:44:42 -0000
Content-Type: text/plain; charset=UTF-8

All,

I'm attempting to build chromium in the latest Yocto Jethro environment
(GCC 5.2). There have been recent patches to fix compiler errors from
GCC5.2 but I chromium isn't being built properly. I'm building for the
Nitrogen6x.

root@nitrogen6x:~# export
> CHROME_DEVEL_SANDBOX=/usr/sbin/chrome-devel-sandbox
> root@nitrogen6x:~# export LD_LIBRARY_PATH=/usr/lib/chromium
> root@nitrogen6x:~# DISPLAY=:0 /usr/bin/chromium/chrome --use-gl=egl
> --gpu-no-context-lost --user-data-dir=/home/root/.chromium/
> [907:907:1209/043606:ERROR:sandbox_linux.cc(301)] InitializeSandbox()
> called with multiple threads in process gpu-process
> Segmentation fault
> root@nitrogen6x:~#


So, reading through the chromium recipe I stumbled upon:

# The build type defaults to Release. If you want a Debug build, you can set
> # the variable CHROMIUM_BUILD_TYPE to "Debug" in your conf/local.conf file.
> CHROMIUM_BUILD_TYPE ??= "Release"


I figured building for Debug would put the debugging symbols in so I could
run GDB and have a more educated e-mail to send about what might be broken,
but building that fails for GCC5.2 reasons.

Is this a known issue? Has anyone else built and tested on jethro with
chromium working?

Thanks,
-Ian

