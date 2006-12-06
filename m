Received: from [66.249.82.235] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <medwards.linux@gmail.com>) id 1Gs2Tj-0004bY-Bq
	for openembedded-devel@lists.openembedded.org;
	Wed, 06 Dec 2006 20:30:51 +0100
Received: by wx-out-0506.google.com with SMTP id t14so294407wxc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Dec 2006 11:29:50 -0800 (PST)
Received: by 10.90.93.6 with SMTP id q6mr1397790agb.1165433389710;
	Wed, 06 Dec 2006 11:29:49 -0800 (PST)
Received: by 10.90.94.7 with HTTP; Wed, 6 Dec 2006 11:29:49 -0800 (PST)
Message-ID: <f2b55d220612061129k102c45f1ye80c6197edfef72f@mail.gmail.com>
Date: Wed, 6 Dec 2006 11:29:49 -0800
From: "Michael K. Edwards" <medwards.linux@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: softfloat calling conventions in ARM gcc 4.x
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Dec 2006 19:30:52 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I've been using crosstool as a framework for building ARM linux
cross-compile toolchains with a fair amount of success, but there are
certainly some tricks and traps.  OpenEmbedded toolchains have
impressed some of the crosstool participants, and I'm starting to look
at them now.  I'm pleased to see that EABI support is stabilizing, and
expect to use it for most ARM builds in the future.  However, I
anticipate needing to run existing OABI binaries on the system, and
some of those have been built with soft FP.

It seems that there have long been some patches needed for soft-float
toolchains, which have not been applied to GCC upstream for good and
sufficient reason.  The patch at
http://www.handhelds.org/hypermail/oe-commits/54/5483.html contains
one variant of these changes for a gcc 4.2 snapshot.  In particular,
it alters the portion of t-linux containing the list of libgcc
functions taken from lib1funcs.asm to the following:

++LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx \
++ _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
++ _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
++ _fixsfsi _fixunssfsi _floatdidf _floatdisf

If one were to follow the example of t-linux-eabi, taking the list in
t-arm-elf and replacing _dvmd_tls with _dvmd_lnx (which raises SIGFPE
on divide-by-zero), one would get:

+LIB1ASMFUNCS = _udivsi3 _divsi3 _umodsi3 _modsi3 _dvmd_lnx _bb_init_func \
+       _call_via_rX _interwork_call_via_rX \
+       _lshrdi3 _ashrdi3 _ashldi3 \
+       _negdf2 _addsubdf3 _muldivdf3 _cmpdf2 _unorddf2 _fixdfsi _fixunsdfsi \
+       _truncdfsf2 _negsf2 _addsubsf3 _muldivsf3 _cmpsf2 _unordsf2 \
+       _fixsfsi _fixunssfsi _floatdidf _floatdisf

Presumably _lshrdi3 _ashrdi3 _ashldi3 are suitable for t-linux if the
others are.  Do you know whether the _bb_init_func, _call_via_rX, and
_interwork_call_via_rX functions are for some reason inappropriate for
OABI on armv[45]t?  Do you know whether the floating point functions
conditionally compile correctly for FPA or VFP calling conventions?

I plan to actually test these things and report back to the
OpenEmbedded, crossgcc, and linux-arm-toolchain lists.  But even
thorough testing is no substitute for a description of the theory of
operations; so any comments from people who know what they are doing
are welcome.

Cheers,
- Michael


