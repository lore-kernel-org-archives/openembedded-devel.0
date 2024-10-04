Return-Path: <f_l_k@t-online.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 126E9CFA751
	for <webhook@archiver.kernel.org>; Fri,  4 Oct 2024 08:41:03 +0000 (UTC)
Received: from mailout05.t-online.de (mailout05.t-online.de [194.25.134.82])
 by mx.groups.io with SMTP id smtpd.web10.17497.1728031260501840374
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 04 Oct 2024 01:41:00 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: t-online.de, ip: 194.25.134.82, mailfrom: f_l_k@t-online.de)
Received: from fwd85.aul.t-online.de (fwd85.aul.t-online.de [10.223.144.111])
	by mailout05.t-online.de (Postfix) with SMTP id 7F7A71656A;
	Fri,  4 Oct 2024 10:40:57 +0200 (CEST)
Received: from [192.168.178.67] ([84.163.34.163]) by fwd85.t-online.de
	with (TLSv1.3:TLS_AES_256_GCM_SHA384 encrypted)
	esmtp id 1swdrs-0c4irw0; Fri, 4 Oct 2024 10:40:56 +0200
Date: Fri, 04 Oct 2024 10:42:50 +0200
From: Markus Volk <f_l_k@t-online.de>
Subject: Re: [oe] [meta-oe][PATCH] webkitgtk3: update 2.44.3 -> 2.46.0
To: Khem Raj <raj.khem@gmail.com>
Cc: Markus Volk <f_l_k@t-online.de>, openembedded-devel@lists.openembedded.org
Message-Id: <EJPTKS.HRUHSXPOGA0B2@t-online.de>
In-Reply-To: <CAMKF1sp6W6V9=6T8HjZA0BdcV-GcsA=qkGk_DCK84FhMmcGfyQ@mail.gmail.com>
References: <20240918184731.54155-1-f_l_k@t-online.de>
	<CAMKF1srYntLyTC+rixg+4UgYB8pyCUB7q26nsJWp5ntKM38OJg@mail.gmail.com>
	<FC14KS.G22B53FBJ0212@t-online.de> <HWLTKS.726242ZDS9WE3@t-online.de>
	<CAMKF1sp6W6V9=6T8HjZA0BdcV-GcsA=qkGk_DCK84FhMmcGfyQ@mail.gmail.com>
X-Mailer: geary/46.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-i2rsvPd8rOPd1nD13r/v"
X-TOI-EXPURGATEID: 150726::1728031256-537FC40D-DE06B8BE/0/0 CLEAN NORMAL
X-TOI-MSGID: e7024a60-7bbc-490b-a989-ea95ddea92dc
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 04 Oct 2024 08:41:03 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/112657

--=-i2rsvPd8rOPd1nD13r/v
Content-Type: text/plain; charset=us-ascii; format=flowed

On Fri, Oct 4 2024 at 12:45:16 AM -07:00:00, Khem Raj 
<raj.khem@gmail.com> wrote:
> Thanks for following this through. I wonder if we should take the
> patch from - <https://github.com/WebKit/WebKit/pull/8696>

I think I already added this patch once. It has been removed once the 
issue was fixed upstream. There have been lots of changes to the wasm 
tier since then, so it would probably not work exactly the same way it 
did, but I haven't even tried so far because that was not the only 
issue.

Fixed the typo:
diff --git a/Source/JavaScriptCore/jit/GPRInfo.h 
b/Source/JavaScriptCore/jit/GPRInfo.h
index a4801ba44528..1497058bd8c6 100644
--- a/Source/JavaScriptCore/jit/GPRInfo.h
+++ b/Source/JavaScriptCore/jit/GPRInfo.h
@@ -756,16 +756,16 @@ public:
     static constexpr GPRReg wasmBaseMemoryPointer = regCS3;
     static constexpr GPRReg wasmBoundsCheckingSizeRegister = regCS4;

- static constexpr GPRReg regWS0 = RICSV64Registers::x6;
- static constexpr GPRReg regWS1 = RICSV64Registers::x7;
- static constexpr GPRReg regWA0 = RICSV64Registers::x10;
- static constexpr GPRReg regWA1 = RICSV64Registers::x11;
- static constexpr GPRReg regWA2 = RICSV64Registers::x12;
- static constexpr GPRReg regWA3 = RICSV64Registers::x13;
- static constexpr GPRReg regWA4 = RICSV64Registers::x14;
- static constexpr GPRReg regWA5 = RICSV64Registers::x15;
- static constexpr GPRReg regWA6 = RICSV64Registers::x16;
- static constexpr GPRReg regWA7 = RICSV64Registers::x17;
+ static constexpr GPRReg regWS0 = RISCV64Registers::x6;
+ static constexpr GPRReg regWS1 = RISCV64Registers::x7;
+ static constexpr GPRReg regWA0 = RISCV64Registers::x10;
+ static constexpr GPRReg regWA1 = RISCV64Registers::x11;
+ static constexpr GPRReg regWA2 = RISCV64Registers::x12;
+ static constexpr GPRReg regWA3 = RISCV64Registers::x13;
+ static constexpr GPRReg regWA4 = RISCV64Registers::x14;
+ static constexpr GPRReg regWA5 = RISCV64Registers::x15;
+ static constexpr GPRReg regWA6 = RISCV64Registers::x16;
+ static constexpr GPRReg regWA7 = RISCV64Registers::x17;

     static constexpr GPRReg patchpointScratchRegister = 
RISCV64Registers::x30; // Should match dataTempRegister

-- 

And to prevent failure in automated code generation I also, in lack of 
knowledge, added a fantasy value here:

diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp 
b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
index 76c46889c329..4888a753e1d4 100644
--- a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
+++ b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp
@@ -584,6 +584,9 @@ JSValue CLoop::execute(OpcodeID entryOpcodeID, 
void* executableAddress, VM* vm,
 #define OFFLINE_ASM_ALIGN_TRAP(align) OFFLINE_ASM_BEGIN_SPACER "\n 
.balign " #align ", 0xcc\n" // pad with int 3 instructions
 #elif CPU(ARM)
 #define OFFLINE_ASM_ALIGN_TRAP(align) OFFLINE_ASM_BEGIN_SPACER "\n 
.balignw " #align ", 0xde00\n" // pad with udf instructions
+#elif CPU(RISCV64)
+#define OFFLINE_ASM_ALIGN_TRAP(align) OFFLINE_ASM_BEGIN_SPACER "\n 
.balignw " #align ", 0x00\n" // pad with instructions
+
 #endif

 #define OFFLINE_ASM_EXPORT_SYMBOL(symbol)
-- 

That helped to compile the LowLevelInterpreter, but I didn't look any 
further because I felt I lacked too much knowledge at the moment to 
continue.



--=-i2rsvPd8rOPd1nD13r/v
Content-Type: text/html; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

<div id=3D"geary-body" dir=3D"auto">On Fri, Oct 4 2024 at 12:45:16 AM -07:0=
0:00, Khem Raj &lt;raj.khem@gmail.com&gt; wrote:<br><blockquote type=3D"cit=
e"><div class=3D"plaintext" style=3D"white-space: break-spaces;">Thanks for=
 following this through. I wonder if we should take the
patch from - <a href=3D"https://github.com/WebKit/WebKit/pull/8696">https:/=
/github.com/WebKit/WebKit/pull/8696</a></div></blockquote><div><br></div><d=
iv>I think I already added this patch once. It has been removed once the is=
sue was fixed upstream. There have been lots of changes to the wasm tier si=
nce then, so it would probably not work exactly the same way it did, but I =
haven't even tried so far because that was not the only issue.</div><div><b=
r></div><div>Fixed the typo:</div><div>diff --git a/Source/JavaScriptCore/j=
it/GPRInfo.h b/Source/JavaScriptCore/jit/GPRInfo.h</div><div>index a4801ba4=
4528..1497058bd8c6 100644</div><div>--- a/Source/JavaScriptCore/jit/GPRInfo=
.h</div><div>+++ b/Source/JavaScriptCore/jit/GPRInfo.h</div><div>@@ -756,16=
 +756,16 @@ public:</div><div>&nbsp; &nbsp; &nbsp;static constexpr GPRReg w=
asmBaseMemoryPointer =3D regCS3;</div><div>&nbsp; &nbsp; &nbsp;static const=
expr GPRReg wasmBoundsCheckingSizeRegister =3D regCS4;</div><div>&nbsp;</di=
v><div>-    static constexpr GPRReg regWS0 =3D RICSV64Registers::x6;</div><=
div>-    static constexpr GPRReg regWS1 =3D RICSV64Registers::x7;</div><div=
>-    static constexpr GPRReg regWA0 =3D RICSV64Registers::x10;</div><div>-=
    static constexpr GPRReg regWA1 =3D RICSV64Registers::x11;</div><div>-  =
  static constexpr GPRReg regWA2 =3D RICSV64Registers::x12;</div><div>-    =
static constexpr GPRReg regWA3 =3D RICSV64Registers::x13;</div><div>-    st=
atic constexpr GPRReg regWA4 =3D RICSV64Registers::x14;</div><div>-    stat=
ic constexpr GPRReg regWA5 =3D RICSV64Registers::x15;</div><div>-    static=
 constexpr GPRReg regWA6 =3D RICSV64Registers::x16;</div><div>-    static c=
onstexpr GPRReg regWA7 =3D RICSV64Registers::x17;</div><div>+    static con=
stexpr GPRReg regWS0 =3D RISCV64Registers::x6;</div><div>+    static conste=
xpr GPRReg regWS1 =3D RISCV64Registers::x7;</div><div>+    static constexpr=
 GPRReg regWA0 =3D RISCV64Registers::x10;</div><div>+    static constexpr G=
PRReg regWA1 =3D RISCV64Registers::x11;</div><div>+    static constexpr GPR=
Reg regWA2 =3D RISCV64Registers::x12;</div><div>+    static constexpr GPRRe=
g regWA3 =3D RISCV64Registers::x13;</div><div>+    static constexpr GPRReg =
regWA4 =3D RISCV64Registers::x14;</div><div>+    static constexpr GPRReg re=
gWA5 =3D RISCV64Registers::x15;</div><div>+    static constexpr GPRReg regW=
A6 =3D RISCV64Registers::x16;</div><div>+    static constexpr GPRReg regWA7=
 =3D RISCV64Registers::x17;</div><div>&nbsp;</div><div>&nbsp; &nbsp; &nbsp;=
static constexpr GPRReg patchpointScratchRegister =3D RISCV64Registers::x30=
; // Should match dataTempRegister</div><div>&nbsp;</div><div>--&nbsp;</div=
><div><br></div><div>And to prevent failure in automated code generation I =
also, in lack of knowledge, added a fantasy value here:</div><div><br></div=
><div><div>diff --git a/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp=
 b/Source/JavaScriptCore/llint/LowLevelInterpreter.cpp</div><div>index 76c4=
6889c329..4888a753e1d4 100644</div><div>--- a/Source/JavaScriptCore/llint/L=
owLevelInterpreter.cpp</div><div>+++ b/Source/JavaScriptCore/llint/LowLevel=
Interpreter.cpp</div><div>@@ -584,6 +584,9 @@ JSValue CLoop::execute(Opcode=
ID entryOpcodeID, void* executableAddress, VM* vm,</div><div>&nbsp;#define =
OFFLINE_ASM_ALIGN_TRAP(align) OFFLINE_ASM_BEGIN_SPACER "\n .balign " #align=
 ", 0xcc\n" // pad with int 3 instructions</div><div>&nbsp;#elif CPU(ARM)</=
div><div>&nbsp;#define OFFLINE_ASM_ALIGN_TRAP(align) OFFLINE_ASM_BEGIN_SPAC=
ER "\n .balignw " #align ", 0xde00\n" // pad with udf instructions</div><di=
v>+#elif CPU(RISCV64)</div><div>+#define OFFLINE_ASM_ALIGN_TRAP(align) OFFL=
INE_ASM_BEGIN_SPACER "\n .balignw " #align ", 0x00\n" // pad with instructi=
ons</div><div>+</div><div>&nbsp;#endif</div><div>&nbsp;</div><div>&nbsp;#de=
fine OFFLINE_ASM_EXPORT_SYMBOL(symbol)</div><div>--&nbsp;</div></div><div><=
br></div><div>That helped to compile the LowLevelInterpreter, but I didn't =
look any further because I felt I lacked too much knowledge at the moment t=
o continue.</div><div><br></div></div>
--=-i2rsvPd8rOPd1nD13r/v--


