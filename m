Return-Path: <richard.leitner@skidata.com>
X-Greylist: delayed 466 seconds by postgrey-1.34 at layers.openembedded.org;
	Tue, 21 Jan 2020 07:20:26 UTC
Received: from mail.bubus.at (bubus.at [81.19.156.191])
	by mail.openembedded.org (Postfix) with ESMTP id 8A7667FD6D
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Jan 2020 07:20:26 +0000 (UTC)
Received: from pcleri (unknown [91.230.2.244])
	by mail.bubus.at (Postfix) with ESMTPSA id 25CF86C20001;
	Tue, 21 Jan 2020 08:12:40 +0100 (CET)
Date: Tue, 21 Jan 2020 08:12:38 +0100
From: Richard Leitner <richard.leitner@skidata.com>
To: Jacob Kroon <jacob.kroon@gmail.com>
Message-ID: <20200121071238.GB1567918@pcleri>
References: <04a167ee-e63d-c4a3-7808-26ef5e9ed884@gmail.com>
	<965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
MIME-Version: 1.0
In-Reply-To: <965c6ca2-e7c7-5cfc-36bd-482bd7d49202@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 21 Jan 2020 07:20:27 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Jacob,

On Tue, Jan 21, 2020 at 08:00:48AM +0100, Jacob Kroon wrote:
> Hi Richard,
> 
> I still can't use openjre-8 in either warrior, zeus or master builds, due to
> the crash below. I wonder, is anyone successfully using openjre-8 in either
> of these releases ?

I'm doing tests for the machine/distro combinations stated in the README
before pushing to master. Therefore it should have worked back then.

Nonetheless I'm currently working on updating openjdk-8 to the latest ga
and implementing continous (e.g. nightly/weekly) builds/tests on qemu to
make sure nothing broke over time.

So maybe I could get something out of this.

> 
> I see the crash both in my custom machine and in qemux86-64. If it makes a
> difference, I'm using
> 
> PREFERRED_PROVIDER_virtual/java-initial-native = "cacao-initial-native"
> PREFERRED_PROVIDER_virtual/java-native = "cacao-native"
> 
> since building with jamvm has always been broken for me.
> 
> Any hints ?

Nothing that comes to my mind directly, but I'll take a look into this.

So your "custom machine" is also x86-64?

> 
> Cheers,
> Jacob
> 
> On 10/13/19 11:33 AM, Jacob Kroon wrote:
> > Hi,
> > 
> > For me, this has been the status for quite a while now. First of all,
> > openjre-8 from master/master-next doesn't build on my Fedora 30 box,
> > I've been using the patch attached to this mail to get it to build.
> >   Secondly, java always crashes on startup here:
> > 
> > > #0  Node::Node (this=0x805fa88, req=3)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/node.cpp:327
> > > #1  0xb7499b63 in RegionNode::RegionNode (required=3, this=0x805fa88)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/cfgnode.hpp:73
> > > #2  LoopNode::LoopNode (backedge=0x0, entry=0x0, this=0x805fa88)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/loopnode.hpp:88
> > > #3  RootNode::RootNode (this=0x805fa88)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/rootnode.hpp:37
> > > #4  Compile::Init (this=0x977feaf8, aliaslevel=0)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/compile.cpp:1079
> > > #5  0xb74a02c5 in Compile::Compile (this=0x977feaf8,
> > > ci_env=0x977ff188,     generator=0xb7895270
> > > <OptoRuntime::new_instance_Type()>, stub_function=0xb7897070
> > > <OptoRuntime::new_instance_C(Klass*, JavaThread*)>
> > > "U\211\345WVS\350\245+\237\377\201\303\205\217\062",
> > > stub_name=0xb7a0a62f "_new_instance_Java", is_fancy_jump=0,
> > > pass_tls=true,     save_arg_registers=false, return_pc=false)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/compile.cpp:1012
> > > #6  0xb789587b in OptoRuntime::generate_stub (env=0x977ff188,    
> > > gen=0xb7895270 <OptoRuntime::new_instance_Type()>,
> > > C_function=0xb7897070 <OptoRuntime::new_instance_C(Klass*,
> > > JavaThread*)> "U\211\345WVS\350\245+\237\377\201\303\205\217\062",
> > > name=0xb7a0a62f "_new_instance_Java",     is_fancy_jump=0,
> > > pass_tls=true, save_argument_registers=false, return_pc=false)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/runtime.cpp:181
> > > #7  0xb7895a5f in OptoRuntime::generate (env=0x977ff188)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/runtime.cpp:147
> > > #8  0xb7417de9 in C2Compiler::init_c2_runtime ()
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.hpp:1854
> > > #9  0xb7417e35 in C2Compiler::initialize (this=0xb706b180)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/opto/c2compiler.cpp:102
> > > #10 0xb74a508c in CompileBroker::init_compiler_runtime ()
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/compiler/compileBroker.cpp:1674
> > > #11 0xb74ab6ed in CompileBroker::compiler_thread_loop ()
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/compiler/compileBroker.cpp:1772
> > > #12 0xb79238d5 in compiler_thread_entry (thread=0xb7079400,
> > > __the_thread__=0xb7079400)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.cpp:3230
> > > #13 0xb792d782 in JavaThread::thread_main_inner (this=0xb7079400)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/share/vm/runtime/thread.hpp:1035
> > > #14 0xb7820ce4 in java_start (thread=0xb7079400)
> > >     at /usr/src/debug/openjre-8/172b11-r0/jdk8u-33d274a7dda0/hotspot/src/os/linux/vm/os_linux.cpp:790
> > > #15 0x4121244c in start_thread (arg=<optimized out>) at
> > > pthread_create.c:479
> > > #16 0x4113bd56 in clone () at
> > > ../sysdeps/unix/sysv/linux/i386/clone.S:108
> > 
> > The Node::Node() constructor uses an IDX_INIT() macro:
> > 
> > > #define IDX_INIT(req) this->Init((req), (Compile*) this->_out)
> > 
> > and Node::Init() does:
> > 
> > > 297     inline int Node::Init(int req, Compile* C) {
> > > 298      assert(Compile::current() == C, "must use operator
> > > new(Compile*)");
> > > 299      int idx = C->next_unique();
> > 
> > and here, this->_out = C = null, which I think leads to a segfault on
> > line 299.
> >   I've tried looking at upstream jdk8u but can't find anything. Does
> > anyone have an idea of whats going on here, or if I should raise the
> > issue to openjdk ml ?
> > 
> > Cheers,
> > Jacob

