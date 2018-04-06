Return-Path: <fathi.boudra@linaro.org>
Received: from mail-vk0-f68.google.com (mail-vk0-f68.google.com
	[209.85.213.68])
	by mail.openembedded.org (Postfix) with ESMTP id 446E6750DE
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  6 Apr 2018 12:28:55 +0000 (UTC)
Received: by mail-vk0-f68.google.com with SMTP id n124so547555vkd.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Apr 2018 05:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=LMai+QxwamiMzVBFMysBt5AZ4+clNRMW8poUVEpFb1Q=;
	b=LcJ3lOEhC7H4GOJ/NbQQVr9PiNv56LnJ9yCOTdeTIE8EWfwVCVd0CrlsVBud3xr8Dk
	epDJhL7NebaOh6p5pLw5MwSh+gQjeyH1JGNbeMgPzuGA5M+OmxfgFfMTkztF+F4o/HzA
	wgDisZ7MPXwwCTx0aCwWmiQs7urXrMVTLhkPo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=LMai+QxwamiMzVBFMysBt5AZ4+clNRMW8poUVEpFb1Q=;
	b=I2av1a1RvELCEh0wF34vjdlPB3eGmVHI7p/08N36raSW8K2lGbtodyGGx0oS9syVZU
	PLt1UtWI5lSKZy7AIu3TZxk3wsENLRQFZF1fMSbej0RlxVH36hg4OmU+E5pR0f3A/o+6
	szaUPPwmrWWJyWSX/GFilREhnKjukkwcZmUSGQuDRc6xfrDnS3Vc6FrVuMfAvtj1EhM1
	4vpMY5mhSZNFV6B5p6Jds9N07Xv03StuS/aqS9X/vZz6F9aTLxUpJISbjx6qWdMUx2zr
	eMnXQY5ehSpZACfNp0mBaVC6KJPYOXAV6Z6KR58eu9hDPQqKm7aaIJ+flmdnkhM/NEZj
	KJ7w==
X-Gm-Message-State: ALQs6tDNc6IGdFItgG/gK8SPjO9n2yW9p4lmnAhTXUoDCHha7BSIfoyJ
	rdNLGXTRFXTkdlVQvrIZonNLL9Vxj1HHGiETq8qunQ==
X-Google-Smtp-Source: AIpwx4/6fDUST6NAA2Xg2dNLkLWAOfPvF5Ixb5Y89bvhH4/0x9fMyihRUJ0bC/LLM9zqUxCjxIe297fyfOdkHbA/y/k=
X-Received: by 10.31.158.8 with SMTP id h8mr16641663vke.24.1523017736875; Fri,
	06 Apr 2018 05:28:56 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.176.12.5 with HTTP; Fri, 6 Apr 2018 05:28:56 -0700 (PDT)
In-Reply-To: <b32da6e0-fcb2-d8fb-4180-2f8d6c541793@windriver.com>
References: <CAGNsrLDgC_CMnjyQ-4cytQoOqks94qnDg_6Jx3uK=9rb6Lru1Q@mail.gmail.com>
	<b32da6e0-fcb2-d8fb-4180-2f8d6c541793@windriver.com>
From: Fathi Boudra <fathi.boudra@linaro.org>
Date: Fri, 6 Apr 2018 15:28:56 +0300
Message-ID: <CAGNsrLAfTec2VX4gKd=Mgg-N95j5moREyafmqO6s5tGyybKDww@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@windriver.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-virtualization] runc update ftbfs on arm64
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
X-List-Received-Date: Fri, 06 Apr 2018 12:28:56 -0000
Content-Type: text/plain; charset="UTF-8"

On 5 April 2018 at 17:03, Bruce Ashfield <bruce.ashfield@windriver.com> wrote:
> On 04/04/2018 05:18 AM, Fathi Boudra wrote:
>>
>> Hi Bruce,
>>
>> This commit
>> https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=e3d960f4fcd91a84067fbbd6293ce271e74a7740
>>
>> caused  a build failure on arm64:
>>
>> https://ci.linaro.org/job/96boards-reference-platform-openembedded-master/579/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-stretch-amd64/consoleText
>
>
> I found the issue and will push a patch shortly.

Thanks!

> Bruce
>
>
>>
>> Log data follows:
>> | DEBUG: Executing shell function do_compile
>> | NOTE: make -j 8 BUILDTAGS= static
>> | CGO_ENABLED=1 go build  -tags " netgo cgo static_build"
>> -installsuffix netgo -ldflags "-w -extldflags -static -X
>> main.gitCommit="4fc53a81fb7c994640722ac585fa9ca548971871-dirty" -X
>> main.version=1.0.0-rc5 " -o runc .
>> | # runtime/cgo
>> | aarch64-linaro-linux-gcc: error: unrecognized command line option '-m64'
>> | Makefile:42: recipe for target 'static' failed
>> | make: *** [static] Error 2
>> | ERROR: oe_runmake failed
>> | WARNING: exit code 1 from a shell command.
>> | ERROR: Function failed: do_compile (log file is located at
>>
>> /srv/oe/build/tmp-rpb-glibc/work/aarch64-linaro-linux/runc-docker/1.0.0-rc5+gitAUTOINC+4fc53a81fb-r0/temp/log.do_compile.1196)
>>
>> Just a heads up. I still need to take a closer look.
>>
>> Cheers,

