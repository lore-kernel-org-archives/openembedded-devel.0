Return-Path: <daniel@zonque.org>
Received: from mail.bugwerft.de (mail.bugwerft.de [46.23.86.59])
	by mail.openembedded.org (Postfix) with ESMTP id EDE5C7850D
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 07:22:14 +0000 (UTC)
Received: from [192.168.178.170] (pD95EF917.dip0.t-ipconnect.de
	[217.94.249.23])
	by mail.bugwerft.de (Postfix) with ESMTPSA id 64D872800E2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  9 Nov 2017 07:22:10 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <eb34c8f1-1c8a-f6cf-46ef-8b91159b44d3@pseudoterminal.org>
From: Daniel Mack <daniel@zonque.org>
Message-ID: <171541e3-15ee-6043-c63d-6631bed98809@zonque.org>
Date: Thu, 9 Nov 2017 08:22:14 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <eb34c8f1-1c8a-f6cf-46ef-8b91159b44d3@pseudoterminal.org>
Subject: Re: [meta-qt5] Exec format error while building webengine 5.9 (rocko branch)
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
X-List-Received-Date: Thu, 09 Nov 2017 07:22:15 -0000
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On Tuesday, October 31, 2017 11:11 AM, Carlos Rafael Giani wrote:
> I am having problems building the current WebEngine. Initially, it 
> builds some tools. It seems that it does so by using the cross compiler, 
> and not the host one, which could explain the problem I experience:
> 
> 
> Once GN is built:
> 
> [321/330] CC base/third_party/superfasthash/superfasthash.o
> [322/330] CC base/third_party/dynamic_annotations/dynamic_annotations.o
> [323/330] AR dynamic_annotations.a
> [324/330] CXX tools/gn/command_clean.o
> [325/330] CXX tools/gn/loader.o
> [326/330] CXX tools/gn/gn_main.o
> [327/330] CXX tools/gn/bundle_data_target_generator.o
> [328/330] CXX tools/gn/desc_builder.o
> [329/330] AR gn_lib.a
> [330/330] LINK gn
> Building gn manually in a temporary directory for bootstrapping...
> Building gn using itself to out/Release...
> 
> 
> I get this error:
> 
> OSError: [Errno 8] Exec format error
> Project ERROR: GN build error!

FWIW, I just ran a build on x86_64 for aarch64 with poky, meta-oe and
meta-qt5 in their 'rocky' branches, and it worked just fine.

> Running "file" on build/src/3rdparty/chromium/tools/gn/out/Release/gn 
> indeed shows that this was built with the wrong compiler:
> 
> build/src/3rdparty/chromium/tools/gn/out/Release/gn: ELF 32-bit LSB 
> executable, ARM, EABI5 version 1 (GNU/Linux), dynamically linked

On my machine:

  build/src/3rdparty/chromium/tools/gn/out/Release/gn: ELF 64-bit LSB
executable, x86-64, version 1 (GNU/Linux), dynamically linked,
interpreter /lib64/ld-linux-x86-64.so.2, for GNU/Linux 2.6.32,
BuildID[sha1]=aae0a9a51c01e07511994ab36a0a6d4d2a645364, stripped

> So, anybody experienced the same problem?

I can't tell you what's wrong on your end, but at least it doesn't seem
to be a general problem.


HTH,
Daniel


