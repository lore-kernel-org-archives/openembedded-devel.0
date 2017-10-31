Return-Path: <dv@pseudoterminal.org>
X-Greylist: delayed 316 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 31 Oct 2017 10:16:25 UTC
Received: from ptmx.org (ptmx.org [178.63.28.110])
	by mail.openembedded.org (Postfix) with ESMTP id A4ECD782A0
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 10:16:25 +0000 (UTC)
Received: from [172.16.1.14] (62-178-118-86.cable.dynamic.surfer.at
	[62.178.118.86]) by ptmx.org (Postfix) with ESMTPSA id EDDEC55790
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 31 Oct 2017 11:11:07 +0100 (CET)
To: openembedded-devel@lists.openembedded.org
From: Carlos Rafael Giani <dv@pseudoterminal.org>
Message-ID: <eb34c8f1-1c8a-f6cf-46ef-8b91159b44d3@pseudoterminal.org>
Date: Tue, 31 Oct 2017 11:11:06 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
Subject: [meta-qt5] Exec format error while building webengine 5.9 (rocko branch)
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
X-List-Received-Date: Tue, 31 Oct 2017 10:16:25 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

I am having problems building the current WebEngine. Initially, it 
builds some tools. It seems that it does so by using the cross compiler, 
and not the host one, which could explain the problem I experience:


Once GN is built:

[321/330] CC base/third_party/superfasthash/superfasthash.o
[322/330] CC base/third_party/dynamic_annotations/dynamic_annotations.o
[323/330] AR dynamic_annotations.a
[324/330] CXX tools/gn/command_clean.o
[325/330] CXX tools/gn/loader.o
[326/330] CXX tools/gn/gn_main.o
[327/330] CXX tools/gn/bundle_data_target_generator.o
[328/330] CXX tools/gn/desc_builder.o
[329/330] AR gn_lib.a
[330/330] LINK gn
Building gn manually in a temporary directory for bootstrapping...
Building gn using itself to out/Release...


I get this error:

OSError: [Errno 8] Exec format error
Project ERROR: GN build error!


Running "file" on build/src/3rdparty/chromium/tools/gn/out/Release/gn 
indeed shows that this was built with the wrong compiler:

build/src/3rdparty/chromium/tools/gn/out/Release/gn: ELF 32-bit LSB 
executable, ARM, EABI5 version 1 (GNU/Linux), dynamically linked


So, anybody experienced the same problem?


