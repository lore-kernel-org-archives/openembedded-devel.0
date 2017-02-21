Return-Path: <ml@embed.me.uk>
Received: from owm.eumx.net (eumx.net [91.82.101.43])
	by mail.openembedded.org (Postfix) with ESMTP id 2ACAB6E64A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Feb 2017 12:34:12 +0000 (UTC)
To: openembedded-devel@lists.openembedded.org
References: <21359dca-07af-b556-a589-a6a81ce65260@embed.me.uk>
From: Jack Mitchell <ml@embed.me.uk>
Message-ID: <48e918a7-edf9-5e9b-048e-96b98fc5f579@embed.me.uk>
Date: Tue, 21 Feb 2017 12:36:06 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.7.1
MIME-Version: 1.0
In-Reply-To: <21359dca-07af-b556-a589-a6a81ce65260@embed.me.uk>
Subject: Re: [meta-clang] target triple issue
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
X-List-Received-Date: Tue, 21 Feb 2017 12:34:14 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 20/02/17 17:38, Jack Mitchell wrote:
> I'm trying to install clang to my aarch64 target and receiving this
> error when attempting to compile
>
> test.c:1:1: warning: type specifier missing, defaults to 'int'
> [-Wimplicit-int]
> main() {
> ^
> error: unable to create target: 'No available targets are compatible
> with this triple.'
> 1 warning and 1 error generated.
>
> The version of clang built is as follows:
>
> clang version 4.0.0 (git://github.com/llvm-mirror/clang.git
> ee02028a97bfbce4d63787dd05366fafdda445c5)
> (git://github.com/llvm-mirror/llvm.git
> 6af4d1ac2acfc8c22db959f2b7b11d68688b2425)
> Target: x86_64-unknown-linux-gnu
> Thread model: posix
> InstalledDir: /usr/bin
>
> Is it wrong that the target is x86_64-unknown-linux-gnu? Should it not
> be something aarch64 related? The configure log seems to have passed the
> right values
>
> 201 -- Native target architecture is AArch64
>
> ...
>
> 495 -- Constructing LLVMBuild project information
> 496 -- Targeting AArch64
>
> Any ideas, would any of the logs be useful?
>
> Regards,
> Jack.

Turns out I just needed to specify a target, seems odd though as 
shouldn't the default target be the one it was built for?

clang -target arm64 test.c

