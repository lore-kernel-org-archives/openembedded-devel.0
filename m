Return-Path: <jacob.kroon@gmail.com>
Received: from mail-lj1-f194.google.com (mail-lj1-f194.google.com
	[209.85.208.194])
	by mail.openembedded.org (Postfix) with ESMTP id 32B2E7FD36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:00:50 +0000 (UTC)
Received: by mail-lj1-f194.google.com with SMTP id o13so1569459ljg.4
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Jan 2020 23:00:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:from:to:references:message-id:date:user-agent:mime-version
	:in-reply-to:content-transfer-encoding:content-language;
	bh=oO5IX5P9NHOJm4ai4VB+X9nNF0LwaLHa8HPqdFuPq60=;
	b=RLvz/3WXbUSJ/lIvvzoBGDAZ3v4L7pZ/Dp2qgTv3aQ16MGY23DoLXFBHOMkbEh55M/
	wI/Og4HV/l/zM0JXoc9zs8+tB1QS1W5XTHWonpPKScWEL6XKcDT9dMSLpM0pGO78e3RT
	KF/PlikEvL7bwFriW9GVI03yn5MvBFrJAl5R0Ltgilg80eGPUsUQ99icT8dO92pUNyyv
	6ygDV7kQxPateGpNDtEob6742ytwuVjkO12chfNpwvya3sQyg5TXa5+t3mNOunrmDg85
	v/Kfpx7HhUx6tei7k11lRNLTgKkpDWuizve6aXH+l4EmsdPxM1+A3fJZ29tVOFSDu4iG
	G41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:from:to:references:message-id:date
	:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=oO5IX5P9NHOJm4ai4VB+X9nNF0LwaLHa8HPqdFuPq60=;
	b=pTQsh+tQmkTI9P1oikLoAQzAPKa4kiuq6KeWlXOs8OiTqOihUpRVunc2v/pPG3iviv
	SyVO38enG553E2C+eZx9IF/tfoAblsIrk6MsGB8alEtdtPPSkQCu22v7FbdOjGf5hG7Z
	lsGpaKuXJM+Ez0d/bgC2m9SSTRnjrr8u+Zowvh4NEGsuC50hHZvuPfW0P8U1guuCc7nB
	5Epy0Ei40aiZinvEvplPLajnr0abZ44l7VxfLjMP5Q1jWEUCx0jESN7KVrvr3Wz7Fe20
	T2AmVzLVTOGiOVwc2Yvb8Gi+quf+3+apf6lb0Fescjoqr2jfiJlI9h1HIXVy9aOFfmZA
	fY2w==
X-Gm-Message-State: APjAAAVzzrekGiK84blsI0QcdD5B764v0jrmzW1neMkgqdCqq+InBJ/t
	CKqFNiEJ7dBJGIdOp0GcUr8=
X-Google-Smtp-Source: APXvYqw+fzNiC2FdbWIfj6N/whdzXjidoTyrM69QBNsybsGWU/tytB2myiU1GhBqnEDruvj517WVgA==
X-Received: by 2002:a2e:3608:: with SMTP id d8mr15602705lja.152.1579590050448; 
	Mon, 20 Jan 2020 23:00:50 -0800 (PST)
Received: from localhost.localdomain ([213.185.29.22])
	by smtp.gmail.com with ESMTPSA id
	b19sm18050861ljk.25.2020.01.20.23.00.49
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Mon, 20 Jan 2020 23:00:49 -0800 (PST)
From: Jacob Kroon <jacob.kroon@gmail.com>
To: openembedded-devel@lists.openembedded.org, richard.leitner@skidata.com
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
Message-ID: <965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
Date: Tue, 21 Jan 2020 08:00:48 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
Subject: Re: [meta-java] openjre-8: java from master/master-next crashes on startup
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
X-List-Received-Date: Tue, 21 Jan 2020 07:00:50 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

I still can't use openjre-8 in either warrior, zeus or master builds, 
due to the crash below. I wonder, is anyone successfully using openjre-8 
in either of these releases ?

I see the crash both in my custom machine and in qemux86-64. If it makes 
a difference, I'm using

PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
PREFERRED_PROVIDER_virtual/java-native = "cacao-native"

since building with jamvm has always been broken for me.

Any hints ?

Cheers,
Jacob

On 10/13/19 11:33 AM, Jacob Kroon wrote:
> Hi,
>
> For me, this has been the status for quite a while now. First of all, 
> openjre-8 from master/master-next doesn't build on my Fedora 30 box, 
> I've been using the patch attached to this mail to get it to build.
>   Secondly, java always crashes on startup here:
>
>> #0  Node::Node (this=0x805fa88, req=3)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/node.cpp:327
>> #1  0xb7499b63 in RegionNode::RegionNode (required=3, this=0x805fa88)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/cfgnode.hpp:73
>> #2  LoopNode::LoopNode (backedge=0x0, entry=0x0, this=0x805fa88)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/loopnode.hpp:88
>> #3  RootNode::RootNode (this=0x805fa88)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/rootnode.hpp:37
>> #4  Compile::Init (this=0x977feaf8, aliaslevel=0)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/compile.cpp:1079
>> #5  0xb74a02c5 in Compile::Compile (this=0x977feaf8, 
>> ci_env=0x977ff188,     generator=0xb7895270 
>> <OptoRuntime::new_instance_Type()>, stub_function=0xb7897070 
>> <OptoRuntime::new_instance_C(Klass*, JavaThread*)> 
>> "U\211\345WVS\350\245+\237\377\201\303\205\217\062", 
>> stub_name=0xb7a0a62f "_new_instance_Java", is_fancy_jump=0, 
>> pass_tls=true,     save_arg_registers=false, return_pc=false)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/compile.cpp:1012
>> #6  0xb789587b in OptoRuntime::generate_stub (env=0x977ff188,     
>> gen=0xb7895270 <OptoRuntime::new_instance_Type()>, 
>> C_function=0xb7897070 <OptoRuntime::new_instance_C(Klass*, 
>> JavaThread*)> "U\211\345WVS\350\245+\237\377\201\303\205\217\062", 
>> name=0xb7a0a62f "_new_instance_Java",     is_fancy_jump=0, 
>> pass_tls=true, save_argument_registers=false, return_pc=false)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/runtime.cpp:181
>> #7  0xb7895a5f in OptoRuntime::generate (env=0x977ff188)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/runtime.cpp:147
>> #8  0xb7417de9 in C2Compiler::init_c2_runtime ()
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.hpp:1854
>> #9  0xb7417e35 in C2Compiler::initialize (this=0xb706b180)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/c2compiler.cpp:102
>> #10 0xb74a508c in CompileBroker::init_compiler_runtime ()
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/compiler/compileBroker.cpp:1674
>> #11 0xb74ab6ed in CompileBroker::compiler_thread_loop ()
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/compiler/compileBroker.cpp:1772
>> #12 0xb79238d5 in compiler_thread_entry (thread=0xb7079400, 
>> __the_thread__=0xb7079400)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.cpp:3230
>> #13 0xb792d782 in JavaThread::thread_main_inner (this=0xb7079400)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.hpp:1035
>> #14 0xb7820ce4 in java_start (thread=0xb7079400)
>>     at 
>> /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/os/linux/vm/os_linux.cpp:790
>> #15 0x4121244c in start_thread (arg=<optimized out>) at 
>> pthread_create.c:479
>> #16 0x4113bd56 in clone () at 
>> ../sysdeps/unix/sysv/linux/i386/clone.S:108
>
> The Node::Node() constructor uses an IDX_INIT() macro:
>
>> #define IDX_INIT(req) this->Init((req), (Compile*) this->_out)
>
> and Node::Init() does:
>
>> 297     inline int Node::Init(int req, Compile* C) {
>> 298      assert(Compile::current() == C, "must use operator 
>> new(Compile*)");
>> 299      int idx = C->next_unique();
>
> and here, this->_out = C = null, which I think leads to a segfault on 
> line 299.
>   I've tried looking at upstream jdk8u but can't find anything. Does 
> anyone have an idea of whats going on here, or if I should raise the 
> issue to openjdk ml ?
>
> Cheers,
> Jacob

