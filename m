Return-Path: <Bruce.Ashfield@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E28AD7478B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Apr 2018 14:03:20 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w35E3Kvc028824
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 5 Apr 2018 07:03:20 -0700 (PDT)
Received: from [128.224.56.93] (128.224.56.93) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 5 Apr 2018 07:03:19 -0700
To: Fathi Boudra <fathi.boudra@linaro.org>
References: <CAGNsrLDgC_CMnjyQ-4cytQoOqks94qnDg_6Jx3uK=9rb6Lru1Q@mail.gmail.com>
From: Bruce Ashfield <bruce.ashfield@windriver.com>
Message-ID: <b32da6e0-fcb2-d8fb-4180-2f8d6c541793@windriver.com>
Date: Thu, 5 Apr 2018 10:03:19 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <CAGNsrLDgC_CMnjyQ-4cytQoOqks94qnDg_6Jx3uK=9rb6Lru1Q@mail.gmail.com>
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
X-List-Received-Date: Thu, 05 Apr 2018 14:03:21 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 04/04/2018 05:18 AM, Fathi Boudra wrote:
> Hi Bruce,
> 
> This commit https://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/?id=e3d960f4fcd91a84067fbbd6293ce271e74a7740
> 
> caused  a build failure on arm64:
> https://ci.linaro.org/job/96boards-reference-platform-openembedded-master/579/DISTRO=rpb,MACHINE=dragonboard-410c,label=docker-stretch-amd64/consoleText

I found the issue and will push a patch shortly.

Bruce

> 
> Log data follows:
> | DEBUG: Executing shell function do_compile
> | NOTE: make -j 8 BUILDTAGS= static
> | CGO_ENABLED=1 go build  -tags " netgo cgo static_build"
> -installsuffix netgo -ldflags "-w -extldflags -static -X
> main.gitCommit="4fc53a81fb7c994640722ac585fa9ca548971871-dirty" -X
> main.version=1.0.0-rc5 " -o runc .
> | # runtime/cgo
> | aarch64-linaro-linux-gcc: error: unrecognized command line option '-m64'
> | Makefile:42: recipe for target 'static' failed
> | make: *** [static] Error 2
> | ERROR: oe_runmake failed
> | WARNING: exit code 1 from a shell command.
> | ERROR: Function failed: do_compile (log file is located at
> /srv/oe/build/tmp-rpb-glibc/work/aarch64-linaro-linux/runc-docker/1.0.0-rc5+gitAUTOINC+4fc53a81fb-r0/temp/log.do_compile.1196)
> 
> Just a heads up. I still need to take a closer look.
> 
> Cheers,
> 


