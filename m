Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id B136D71D31
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Feb 2017 17:36:20 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <21359dca-07af-b556-a589-a6a81ce65260@embed.me.uk>
Date: Mon, 20 Feb 2017 17:38:13 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
Subject: [meta-clang] target triple issue
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
X-List-Received-Date: Mon, 20 Feb 2017 17:36:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I'm trying to install clang to my aarch64 target and receiving this 
error when attempting to compile

test.c:1:1: warning: type specifier missing, defaults to 'int' 
[-Wimplicit-int]
main() {
^
error: unable to create target: 'No available targets are compatible 
with this triple.'
1 warning and 1 error generated.

The version of clang built is as follows:

clang version 4.0.0 (git://github.com/llvm-mirror/clang.git 
ee02028a97bfbce4d63787dd05366fafdda445c5) 
(git://github.com/llvm-mirror/llvm.git 
6af4d1ac2acfc8c22db959f2b7b11d68688b2425)
Target: x86_64-unknown-linux-gnu
Thread model: posix
InstalledDir: /usr/bin

Is it wrong that the target is x86_64-unknown-linux-gnu? Should it not 
be something aarch64 related? The configure log seems to have passed the 
right values

201 -- Native target architecture is AArch64

...

495 -- Constructing LLVMBuild project information
496 -- Targeting AArch64

Any ideas, would any of the logs be useful?

Regards,
Jack.

