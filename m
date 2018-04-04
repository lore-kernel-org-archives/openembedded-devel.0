Return-Path: <fathi.boudra@linaro.org>
Received: from mail-vk0-f48.google.com (mail-vk0-f48.google.com
	[209.85.213.48])
	by mail.openembedded.org (Postfix) with ESMTP id A51DC71BA0
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  4 Apr 2018 09:18:22 +0000 (UTC)
Received: by mail-vk0-f48.google.com with SMTP id v134so11927615vkd.10
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 04 Apr 2018 02:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:from:date:message-id:subject:to:cc;
	bh=eCwPPyCWl+wij/ooayQiYRqnndLeWNNBgC3YlEiXLQU=;
	b=VQo50DCyH/7cpOs1FwLUwhJyn6cFP6gppVHvpWOb1AXMzQDtmiafFBNJgmr8SlixW2
	8hR7BAqfrK9Ix0PmdlnWIlW+OesW37iJ1bilbg3IsYxf9ZmTYhe8hj9WUBzja+iKzNKb
	128ai+AYMbnsAEdNDwvPlD3SkZxJH3O3f8bG4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
	bh=eCwPPyCWl+wij/ooayQiYRqnndLeWNNBgC3YlEiXLQU=;
	b=Vui6hycZjnHlenkIXTlq8wbouncA0gzAtwOXaXVXthNNIiaxOAct4R7KY2yC5wX4Qp
	AZHQJdG+H1HiVAh4bb11O/i1xNM+WzVqBnh8VCDYyiYH6tR3TUcn0jDb1IplUxyjLKOA
	gHyMqiSn2QRnY4NxCDojb1U7ce6Oc07OI3VHz0lQr8FZwEeRZI6+ucIOz7va8f0L7nAo
	WonBT/u/N50nJV5yYktUQSEQn97yDuLhbL+0NOkvqeBL17vcNeGoVhjdJSW8zSNwDYJR
	hj6/DdR1y6azi4DbfXWJe176mf/LPCe9TK5Gik+S53Re5o7EvTGViMk17qoUhZyRG6sU
	C3jw==
X-Gm-Message-State: ALQs6tCjkW7zYruB5WEioeoPdqg8KKz/LTTqcQ7PJvEtXGuWKUkv6SMj
	neQl5YH4u3O0t6cFfcpV62mIzFKvJqUEsyoUxhcjMQ==
X-Google-Smtp-Source: AIpwx48hAtBSKdWSSJaauH9nX2ehT+nEsoFjPTYcF1H+MH/iRJDsBHIUVHZ0PRtdnO6fvTjD7KSqB0OrmzWgBSSmRw0=
X-Received: by 10.31.235.130 with SMTP id j124mr842473vkh.85.1522833503142;
	Wed, 04 Apr 2018 02:18:23 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.159.33.98 with HTTP; Wed, 4 Apr 2018 02:18:22 -0700 (PDT)
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Wed, 4 Apr 2018 12:18:22 +0300
Message-ID: <CAGNsrLDgC_CMnjyQ-4cytQoOqks94qnDg_6Jx3uK=9rb6Lru1Q@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [meta-virtualization] runc update ftbfs on arm64
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
X-List-Received-Date: Wed, 04 Apr 2018 09:18:22 -0000
Content-Type: text/plain; charset="UTF-8"

Hi Bruce,

This commit https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=e3d960f4fcd91a84067fbbd6293ce271e74a7740

caused  a build failure on arm64:
https://ci.linaro.org/job/96boards-reference-platform-openembedded-master/579/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-stretch-amd64/consoleText

Log data follows:
| DEBUG: Executing shell function do_compile
| NOTE: make -j 8 BUILDTAGS= static
| CGO_ENABLED=1 go build  -tags " netgo cgo static_build"
-installsuffix netgo -ldflags "-w -extldflags -static -X
main.gitCommit="4fc53a81fb7c994640722ac585fa9ca548971871-dirty" -X
main.version=1.0.0-rc5 " -o runc .
| # runtime/cgo
| aarch64-linaro-linux-gcc: error: unrecognized command line option '-m64'
| Makefile:42: recipe for target 'static' failed
| make: *** [static] Error 2
| ERROR: oe_runmake failed
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_compile (log file is located at
/srv/oe/build/tmp-rpb-glibc/work/aarch64-linaro-linux/runc-docker/1.0.0-rc5+gitAUTOINC+4fc53a81fb-r0/temp/log.do_compile.1196)

Just a heads up. I still need to take a closer look.

Cheers,
-- 
Fathi Boudra

