Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f51.google.com (mail-wm0-f51.google.com [74.125.82.51])
	by mail.openembedded.org (Postfix) with ESMTP id AAA84719F7
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 15:24:37 +0000 (UTC)
Received: by mail-wm0-f51.google.com with SMTP id 189so6859191wmh.1
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Sep 2017 08:24:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=Mq74bKvCiCmI3LpknOIZwe+uFOSZBaDQIwatbEwXqCY=;
	b=p+1HO+XQlDxiXXMvoorNkPhnDZAyvoNpbq3ksMNl7OvpFVW6Yy/C3KeXRPWHUw+/xW
	46KxtQyj/Uhw4oTNoWLnk15QRObOi+4/+QkfytBQdtMMefg86R413nBZ3An4xaHMxSjV
	RIOSdYGT0OFcX9xV/UbwujvUu03FhHGqr70IVar5Oqt9xzi4Fu9vU8TZbXn3D6/l3ZKq
	6AdeHkVPNu2wqJqfw7TjogYm2XvqIzFBXVP5k8XbAcQT1C7f3i+p5KeKiEU41SiOj2cv
	XpKr7bSCy77ThaiylVAajLXXAgjhXQxFl4/LQ4IHAV0Ij01wFdmtZkgoKKPJYJuBF3fG
	XDOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=Mq74bKvCiCmI3LpknOIZwe+uFOSZBaDQIwatbEwXqCY=;
	b=IHg6TSOark0aClF1xEGlM31O0KeEIuDIRf/QOdqElhoHKOVt0f2Z7+ildlgk6Bffka
	ttlAC0KqUrgeX6g7FLABS7nhp1nKtfpQ5t2OReOdGUOMGubTI3SDuxvE20Tzlazcrbj1
	HbVcik/SK9mt13qr2m6/3vLGd7tbykTGXDc91iAMXigSF4PdzohArcOneWTYWcRyj9sR
	kqu8y5hlZyWcDBEOuPVIl0jCd4jJ8yTHGgFIFJ6Ow1fwaWWtySNd+iTz4TOARqOJ4EEh
	YEh9Y20a4QekjyQxLbtMGdUBlbU6pZbDCGimwYB7MLGPWF+AuP+4aIlr1ei5PqSbSqV2
	9blQ==
X-Gm-Message-State: AHPjjUiKFYgXuy2uLp73BX/YlYWk4ZCvHP2JMMeKYCSOj+79L85BOIsg
	1JHNOlIUBf7FvSEBt2ip7qWPzgVqtaQ5n2sDoBM=
X-Google-Smtp-Source: AOwi7QC1iHIq15+TgU4iKdQr+rPfx8UbWk7P7KU2B4eDkQGvIskYstGHqBhyoyVdoLwkSnW13zN5cIDq3kr2/oN31mE=
X-Received: by 10.28.138.148 with SMTP id m142mr4942436wmd.59.1505575478301;
	Sat, 16 Sep 2017 08:24:38 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.147.202 with HTTP; Sat, 16 Sep 2017 08:24:37 -0700 (PDT)
In-Reply-To: <CAMKF1so+mQq7fBB9Y1XgwopCO5FJsiXG-oura0ROR5=FhBXZVQ@mail.gmail.com>
References: <20170915225827.12328-1-raj.khem@gmail.com>
	<20170915225827.12328-2-raj.khem@gmail.com>
	<CA+chaQdWxaCLaqr24=EGSueJgSEa7oPHzLHu4aWmOQh_320WZA@mail.gmail.com>
	<CAMKF1sq8eEWfgafvELHuh4VvrDxyo7CjNkUmN28+X1vuax_Rcg@mail.gmail.com>
	<CA+chaQczkk9De2yw=4nc=xEBEDsT6TgqmxD6mnspQk6SXEuO3w@mail.gmail.com>
	<CAMKF1so+mQq7fBB9Y1XgwopCO5FJsiXG-oura0ROR5=FhBXZVQ@mail.gmail.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Sat, 16 Sep 2017 17:24:37 +0200
Message-ID: <CA+chaQe2qmx+Fxh9YJ0DzkK0meZRakOq5T06wWiAW-h5AKxOBg@mail.gmail.com>
To: Khem Raj <raj.khem@gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH 2/2] android-tools: Fix build with musl
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
X-List-Received-Date: Sat, 16 Sep 2017 15:24:38 -0000
Content-Type: text/plain; charset="UTF-8"

That was 1st thing I've checked and it's already using arm as the
meta-android version did:

http://git.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb#n47

On Sat, Sep 16, 2017 at 5:07 PM, Khem Raj <raj.khem@gmail.com> wrote:

> On Sat, Sep 16, 2017 at 7:42 AM, Martin Jansa <martin.jansa@gmail.com>
> wrote:
> > I don't know if this version (moved from meta-android to meta-oe) ever
> built
> > OK for qemuarm, I was always building the version from meta-android which
> > built OK.
>
> it was building 4.2.2 version and I am guessing it probably did not
> using atomics back then. Can we try to use ARM_INSTRUCTION_SET = "arm"
> on armv5 and see if it work ? It works ok for thumb2
>
> >
> > On Sat, Sep 16, 2017 at 4:30 PM, Khem Raj <raj.khem@gmail.com> wrote:
> >>
> >> On Sat, Sep 16, 2017 at 5:37 AM, Martin Jansa <martin.jansa@gmail.com>
> >> wrote:
> >> > Even without this patch android-tools fail to build for qemuarm:
> >> > http://errors.yoctoproject.org/Errors/Details/156104/
> >> >
> >> > It's probably broken for long time, the recipe was shadowed by
> >> > meta-android
> >> > copy until recently when I've removed it from meta-android (and then
> the
> >> > layer as well from world builds).
> >> >
> >> > Can you please check what's going on so that I can at least build test
> >> > this
> >> > properly?
> >> >
> >>
> >>
> >> it build ok for armv7(rpi3)  its using armv6+ instructions for atomics
> >> which wont work for qemuarm, did it build on qemuarm ever before ?
> >>
> >> /tmp/cc7WvkQH.s: Assembler messages:
> >> /tmp/cc7WvkQH.s:159: Error: selected processor does not support `ldrex
> >> ip,[r3]' in ARM mode
> >> /tmp/cc7WvkQH.s:162: Error: selected processor does not support
> >> `strexeq r4,r1,[r3]' in ARM mode
> >> /tmp/cc7WvkQH.s:262: Error: selected processor does not support `ldrex
> >> ip,[r3]' in ARM mode
> >> /tmp/cc7WvkQH.s:264: Error: selected processor does not support `strex
> >> r4,r0,[r3]' in ARM mode
> >> /tmp/cc7WvkQH.s:351: Error: selected processor does not support `ldrex
> >> ip,[r3]' in ARM mode
> >> /tmp/cc7WvkQH.s:353: Error: selected processor does not support `strex
> >> r4,r0,[r3]' in ARM mode
> >> /tmp/cc7WvkQH.s:396: Error: selected processor does not support `ldrex
> >> ip,[r3]' in ARM mode
> >> /tmp/cc7WvkQH.s:398: Error: selected processor does not support `strex
> >> r4,r0,[r3]' in ARM mode
> >> <builtin>: recipe for target 'atomic.o' failed
> >>
> >>
> >>
> >> > On Sat, Sep 16, 2017 at 12:58 AM, Khem Raj <raj.khem@gmail.com>
> wrote:
> >> >>
> >> >> Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> ---
> >> >>  .../0001-add-base64-implementation.patch           | 351
> >> >> +++++++++++++++++++++
> >> >>  .../android-tools/0002-adb-Musl-fixes.patch        | 134 ++++++++
> >> >>  .../android-tools/android-tools/adbd.mk            |   1 +
> >> >>  .../android-tools/android-tools_5.1.1.r37.bb       |   2 +
> >> >>  4 files changed, 488 insertions(+)
> >> >>  create mode 100644
> >> >>
> >> >> meta-oe/recipes-devtools/android-tools/android-tools/
> 0001-add-base64-implementation.patch
> >> >>  create mode 100644
> >> >>
> >> >> meta-oe/recipes-devtools/android-tools/android-tools/
> 0002-adb-Musl-fixes.patch
> >> >>
> >> >> diff --git
> >> >>
> >> >> a/meta-oe/recipes-devtools/android-tools/android-tools/
> 0001-add-base64-implementation.patch
> >> >>
> >> >> b/meta-oe/recipes-devtools/android-tools/android-tools/
> 0001-add-base64-implementation.patch
> >> >> new file mode 100644
> >> >> index 000000000..680d21f3a
> >> >> --- /dev/null
> >> >> +++
> >> >>
> >> >> b/meta-oe/recipes-devtools/android-tools/android-tools/
> 0001-add-base64-implementation.patch
> >> >> @@ -0,0 +1,351 @@
> >> >> +From bbeb72f11c64f190b23abbed5f44311bd021bdc9 Mon Sep 17 00:00:00
> 2001
> >> >> +From: Khem Raj <raj.khem@gmail.com>
> >> >> +Date: Fri, 15 Sep 2017 15:46:38 -0700
> >> >> +Subject: [PATCH 1/2] add base64 implementation
> >> >> +
> >> >> +musl needs it
> >> >> +
> >> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> +---
> >> >> + system/core/adb/adb_auth_client.c |   2 +-
> >> >> + system/core/adb/base64.c          | 315
> >> >> ++++++++++++++++++++++++++++++++++++++
> >> >> + 2 files changed, 316 insertions(+), 1 deletion(-)
> >> >> + create mode 100644 system/core/adb/base64.c
> >> >> +
> >> >> +diff --git a/system/core/adb/adb_auth_client.c
> >> >> b/system/core/adb/adb_auth_client.c
> >> >> +index 55e9dca..104b413 100644
> >> >> +--- a/system/core/adb/adb_auth_client.c
> >> >> ++++ b/system/core/adb/adb_auth_client.c
> >> >> +@@ -75,7 +75,7 @@ static void read_keys(const char *file, struct
> >> >> listnode
> >> >> *list)
> >> >> +         if (sep)
> >> >> +             *sep = '\0';
> >> >> +
> >> >> +-        ret = __b64_pton(buf, (u_char *)&key->key,
> sizeof(key->key) +
> >> >> 4);
> >> >> ++        ret = b64_pton(buf, (u_char *)&key->key, sizeof(key->key) +
> >> >> 4);
> >> >> +         if (ret != sizeof(key->key)) {
> >> >> +             D("%s: Invalid base64 data ret=%d\n", file, ret);
> >> >> +             free(key);
> >> >> +diff --git a/system/core/adb/base64.c b/system/core/adb/base64.c
> >> >> +new file mode 100644
> >> >> +index 0000000..95da284
> >> >> +--- /dev/null
> >> >> ++++ b/system/core/adb/base64.c
> >> >> +@@ -0,0 +1,315 @@
> >> >> ++/*
> >> >> ++ * Copyright (c) 1996-1999 by Internet Software Consortium.
> >> >> ++ *
> >> >> ++ * Permission to use, copy, modify, and distribute this software
> for
> >> >> any
> >> >> ++ * purpose with or without fee is hereby granted, provided that the
> >> >> above
> >> >> ++ * copyright notice and this permission notice appear in all
> copies.
> >> >> ++ *
> >> >> ++ * THE SOFTWARE IS PROVIDED "AS IS" AND INTERNET SOFTWARE
> CONSORTIUM
> >> >> DISCLAIMS
> >> >> ++ * ALL WARRANTIES WITH REGARD TO THIS SOFTWARE INCLUDING ALL
> IMPLIED
> >> >> WARRANTIES
> >> >> ++ * OF MERCHANTABILITY AND FITNESS. IN NO EVENT SHALL INTERNET
> >> >> SOFTWARE
> >> >> ++ * CONSORTIUM BE LIABLE FOR ANY SPECIAL, DIRECT, INDIRECT, OR
> >> >> CONSEQUENTIAL
> >> >> ++ * DAMAGES OR ANY DAMAGES WHATSOEVER RESULTING FROM LOSS OF USE,
> DATA
> >> >> OR
> >> >> ++ * PROFITS, WHETHER IN AN ACTION OF CONTRACT, NEGLIGENCE OR OTHER
> >> >> TORTIOUS
> >> >> ++ * ACTION, ARISING OUT OF OR IN CONNECTION WITH THE USE OR
> >> >> PERFORMANCE
> >> >> OF THIS
> >> >> ++ * SOFTWARE.
> >> >> ++ */
> >> >> ++
> >> >> ++/*
> >> >> ++ * Portions Copyright (c) 1995 by International Business Machines,
> >> >> Inc.
> >> >> ++ *
> >> >> ++ * International Business Machines, Inc. (hereinafter called IBM)
> >> >> grants
> >> >> ++ * permission under its copyrights to use, copy, modify, and
> >> >> distribute
> >> >> this
> >> >> ++ * Software with or without fee, provided that the above copyright
> >> >> notice and
> >> >> ++ * all paragraphs of this notice appear in all copies, and that the
> >> >> name
> >> >> of IBM
> >> >> ++ * not be used in connection with the marketing of any product
> >> >> incorporating
> >> >> ++ * the Software or modifications thereof, without specific, written
> >> >> prior
> >> >> ++ * permission.
> >> >> ++ *
> >> >> ++ * To the extent it has a right to do so, IBM grants an immunity
> from
> >> >> suit
> >> >> ++ * under its patents, if any, for the use, sale or manufacture of
> >> >> products to
> >> >> ++ * the extent that such products are used for performing Domain
> Name
> >> >> System
> >> >> ++ * dynamic updates in TCP/IP networks by means of the Software.  No
> >> >> immunity is
> >> >> ++ * granted for any product per se or for any other function of any
> >> >> product.
> >> >> ++ *
> >> >> ++ * THE SOFTWARE IS PROVIDED "AS IS", AND IBM DISCLAIMS ALL
> >> >> WARRANTIES,
> >> >> ++ * INCLUDING ALL IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
> >> >> FOR A
> >> >> ++ * PARTICULAR PURPOSE.  IN NO EVENT SHALL IBM BE LIABLE FOR ANY
> >> >> SPECIAL,
> >> >> ++ * DIRECT, INDIRECT, OR CONSEQUENTIAL DAMAGES OR ANY DAMAGES
> >> >> WHATSOEVER
> >> >> ARISING
> >> >> ++ * OUT OF OR IN CONNECTION WITH THE USE OR PERFORMANCE OF THIS
> >> >> SOFTWARE,
> >> >> EVEN
> >> >> ++ * IF IBM IS APPRISED OF THE POSSIBILITY OF SUCH DAMAGES.
> >> >> ++ */
> >> >> ++
> >> >> ++#if !defined(LINT) && !defined(CODECENTER)
> >> >> ++static const char rcsid[] = "$BINDId: base64.c,v 8.7 1999/10/13
> >> >> 16:39:33
> >> >> vixie Exp $";
> >> >> ++#endif /* not lint */
> >> >> ++
> >> >> ++#include <sys/types.h>
> >> >> ++#include <sys/param.h>
> >> >> ++#include <sys/socket.h>
> >> >> ++
> >> >> ++#include <netinet/in.h>
> >> >> ++#include <arpa/inet.h>
> >> >> ++#include <arpa/nameser.h>
> >> >> ++
> >> >> ++#include <ctype.h>
> >> >> ++#include <resolv.h>
> >> >> ++#include <stdio.h>
> >> >> ++#include <stdlib.h>
> >> >> ++#include <stdint.h>
> >> >> ++#include <string.h>
> >> >> ++
> >> >> ++#define Assert(Cond) if (!(Cond)) abort()
> >> >> ++
> >> >> ++static const char Base64[] =
> >> >> ++
> >> >> "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/";
> >> >> ++static const char Pad64 = '=';
> >> >> ++
> >> >> ++/* (From RFC1521 and draft-ietf-dnssec-secext-03.txt)
> >> >> ++   The following encoding technique is taken from RFC 1521 by
> >> >> Borenstein
> >> >> ++   and Freed.  It is reproduced here in a slightly edited form for
> >> >> ++   convenience.
> >> >> ++
> >> >> ++   A 65-character subset of US-ASCII is used, enabling 6 bits to be
> >> >> ++   represented per printable character. (The extra 65th character,
> >> >> "=",
> >> >> ++   is used to signify a special processing function.)
> >> >> ++
> >> >> ++   The encoding process represents 24-bit groups of input bits as
> >> >> output
> >> >> ++   strings of 4 encoded characters. Proceeding from left to right,
> a
> >> >> ++   24-bit input group is formed by concatenating 3 8-bit input
> >> >> groups.
> >> >> ++   These 24 bits are then treated as 4 concatenated 6-bit groups,
> >> >> each
> >> >> ++   of which is translated into a single digit in the base64
> alphabet.
> >> >> ++
> >> >> ++   Each 6-bit group is used as an index into an array of 64
> printable
> >> >> ++   characters. The character referenced by the index is placed in
> the
> >> >> ++   output string.
> >> >> ++
> >> >> ++                         Table 1: The Base64 Alphabet
> >> >> ++
> >> >> ++      Value Encoding  Value Encoding  Value Encoding  Value
> Encoding
> >> >> ++          0 A            17 R            34 i            51 z
> >> >> ++          1 B            18 S            35 j            52 0
> >> >> ++          2 C            19 T            36 k            53 1
> >> >> ++          3 D            20 U            37 l            54 2
> >> >> ++          4 E            21 V            38 m            55 3
> >> >> ++          5 F            22 W            39 n            56 4
> >> >> ++          6 G            23 X            40 o            57 5
> >> >> ++          7 H            24 Y            41 p            58 6
> >> >> ++          8 I            25 Z            42 q            59 7
> >> >> ++          9 J            26 a            43 r            60 8
> >> >> ++         10 K            27 b            44 s            61 9
> >> >> ++         11 L            28 c            45 t            62 +
> >> >> ++         12 M            29 d            46 u            63 /
> >> >> ++         13 N            30 e            47 v
> >> >> ++         14 O            31 f            48 w         (pad) =
> >> >> ++         15 P            32 g            49 x
> >> >> ++         16 Q            33 h            50 y
> >> >> ++
> >> >> ++   Special processing is performed if fewer than 24 bits are
> >> >> available
> >> >> ++   at the end of the data being encoded.  A full encoding quantum
> is
> >> >> ++   always completed at the end of a quantity.  When fewer than 24
> >> >> input
> >> >> ++   bits are available in an input group, zero bits are added (on
> the
> >> >> ++   right) to form an integral number of 6-bit groups.  Padding at
> the
> >> >> ++   end of the data is performed using the '=' character.
> >> >> ++
> >> >> ++   Since all base64 input is an integral number of octets, only the
> >> >> ++         -------------------------------------------------
> >> >> ++   following cases can arise:
> >> >> ++
> >> >> ++       (1) the final quantum of encoding input is an integral
> >> >> ++           multiple of 24 bits; here, the final unit of encoded
> >> >> ++         output will be an integral multiple of 4 characters
> >> >> ++         with no "=" padding,
> >> >> ++       (2) the final quantum of encoding input is exactly 8 bits;
> >> >> ++           here, the final unit of encoded output will be two
> >> >> ++         characters followed by two "=" padding characters, or
> >> >> ++       (3) the final quantum of encoding input is exactly 16 bits;
> >> >> ++           here, the final unit of encoded output will be three
> >> >> ++         characters followed by one "=" padding character.
> >> >> ++   */
> >> >> ++
> >> >> ++int
> >> >> ++b64_ntop(const uint8_t* src, size_t srclength, char* target, size_t
> >> >> targsize)
> >> >> ++{
> >> >> ++      size_t datalength = 0;
> >> >> ++      uint8_t input[3];
> >> >> ++      uint8_t output[4];
> >> >> ++      size_t i;
> >> >> ++
> >> >> ++      while (2 < srclength) {
> >> >> ++              input[0] = *src++;
> >> >> ++              input[1] = *src++;
> >> >> ++              input[2] = *src++;
> >> >> ++              srclength -= 3;
> >> >> ++
> >> >> ++              output[0] = input[0] >> 2;
> >> >> ++              output[1] = ((input[0] & 0x03) << 4) + (input[1] >>
> 4);
> >> >> ++              output[2] = ((input[1] & 0x0f) << 2) + (input[2] >>
> 6);
> >> >> ++              output[3] = input[2] & 0x3f;
> >> >> ++              Assert(output[0] < 64);
> >> >> ++              Assert(output[1] < 64);
> >> >> ++              Assert(output[2] < 64);
> >> >> ++              Assert(output[3] < 64);
> >> >> ++
> >> >> ++              if (datalength + 4 > targsize)
> >> >> ++                      return (-1);
> >> >> ++              target[datalength++] = Base64[output[0]];
> >> >> ++              target[datalength++] = Base64[output[1]];
> >> >> ++              target[datalength++] = Base64[output[2]];
> >> >> ++              target[datalength++] = Base64[output[3]];
> >> >> ++      }
> >> >> ++
> >> >> ++      /* Now we worry about padding. */
> >> >> ++      if (0 != srclength) {
> >> >> ++              /* Get what's left. */
> >> >> ++              input[0] = input[1] = input[2] = '\0';
> >> >> ++              for (i = 0; i < srclength; i++)
> >> >> ++                      input[i] = *src++;
> >> >> ++
> >> >> ++              output[0] = input[0] >> 2;
> >> >> ++              output[1] = ((input[0] & 0x03) << 4) + (input[1] >>
> 4);
> >> >> ++              output[2] = ((input[1] & 0x0f) << 2) + (input[2] >>
> 6);
> >> >> ++              Assert(output[0] < 64);
> >> >> ++              Assert(output[1] < 64);
> >> >> ++              Assert(output[2] < 64);
> >> >> ++
> >> >> ++              if (datalength + 4 > targsize)
> >> >> ++                      return (-1);
> >> >> ++              target[datalength++] = Base64[output[0]];
> >> >> ++              target[datalength++] = Base64[output[1]];
> >> >> ++              if (srclength == 1)
> >> >> ++                      target[datalength++] = Pad64;
> >> >> ++              else
> >> >> ++                      target[datalength++] = Base64[output[2]];
> >> >> ++              target[datalength++] = Pad64;
> >> >> ++      }
> >> >> ++      if (datalength >= targsize)
> >> >> ++              return (-1);
> >> >> ++      target[datalength] = '\0';      /* Returned value doesn't
> count
> >> >> \0. */
> >> >> ++      return (datalength);
> >> >> ++}
> >> >> ++
> >> >> ++/* skips all whitespace anywhere.
> >> >> ++   converts characters, four at a time, starting at (or after)
> >> >> ++   src from base - 64 numbers into three 8 bit bytes in the target
> >> >> area.
> >> >> ++   it returns the number of data bytes stored at the target, or -1
> on
> >> >> error.
> >> >> ++ */
> >> >> ++
> >> >> ++int b64_pton(const char* src, uint8_t* target, size_t targsize)
> >> >> ++{
> >> >> ++      int tarindex, state, ch;
> >> >> ++      char *pos;
> >> >> ++
> >> >> ++      state = 0;
> >> >> ++      tarindex = 0;
> >> >> ++
> >> >> ++      while ((ch = *src++) != '\0') {
> >> >> ++              if (isspace(ch))        /* Skip whitespace anywhere.
> */
> >> >> ++                      continue;
> >> >> ++
> >> >> ++              if (ch == Pad64)
> >> >> ++                      break;
> >> >> ++
> >> >> ++              pos = strchr(Base64, ch);
> >> >> ++              if (pos == 0)           /* A non-base64 character. */
> >> >> ++                      return (-1);
> >> >> ++
> >> >> ++              switch (state) {
> >> >> ++              case 0:
> >> >> ++                      if (target) {
> >> >> ++                              if ((size_t)tarindex >= targsize)
> >> >> ++                                      return (-1);
> >> >> ++                              target[tarindex] = (pos - Base64) <<
> 2;
> >> >> ++                      }
> >> >> ++                      state = 1;
> >> >> ++                      break;
> >> >> ++              case 1:
> >> >> ++                      if (target) {
> >> >> ++                              if ((size_t)tarindex + 1 >= targsize)
> >> >> ++                                      return (-1);
> >> >> ++                              target[tarindex]   |=  (pos - Base64)
> >> >> >>
> >> >> 4;
> >> >> ++                              target[tarindex+1]  = ((pos -
> Base64) &
> >> >> 0x0f)
> >> >> ++                                                      << 4 ;
> >> >> ++                      }
> >> >> ++                      tarindex++;
> >> >> ++                      state = 2;
> >> >> ++                      break;
> >> >> ++              case 2:
> >> >> ++                      if (target) {
> >> >> ++                              if ((size_t)tarindex + 1 >= targsize)
> >> >> ++                                      return (-1);
> >> >> ++                              target[tarindex]   |=  (pos - Base64)
> >> >> >>
> >> >> 2;
> >> >> ++                              target[tarindex+1]  = ((pos -
> Base64) &
> >> >> 0x03)
> >> >> ++                                                      << 6;
> >> >> ++                      }
> >> >> ++                      tarindex++;
> >> >> ++                      state = 3;
> >> >> ++                      break;
> >> >> ++              case 3:
> >> >> ++                      if (target) {
> >> >> ++                              if ((size_t)tarindex >= targsize)
> >> >> ++                                      return (-1);
> >> >> ++                              target[tarindex] |= (pos - Base64);
> >> >> ++                      }
> >> >> ++                      tarindex++;
> >> >> ++                      state = 0;
> >> >> ++                      break;
> >> >> ++              default:
> >> >> ++                      abort();
> >> >> ++              }
> >> >> ++      }
> >> >> ++
> >> >> ++      /*
> >> >> ++       * We are done decoding Base-64 chars.  Let's see if we ended
> >> >> ++       * on a byte boundary, and/or with erroneous trailing
> >> >> characters.
> >> >> ++       */
> >> >> ++
> >> >> ++      if (ch == Pad64) {              /* We got a pad char. */
> >> >> ++              ch = *src++;            /* Skip it, get next. */
> >> >> ++              switch (state) {
> >> >> ++              case 0:         /* Invalid = in first position */
> >> >> ++              case 1:         /* Invalid = in second position */
> >> >> ++                      return (-1);
> >> >> ++
> >> >> ++              case 2:         /* Valid, means one byte of info */
> >> >> ++                      /* Skip any number of spaces. */
> >> >> ++                      for ((void)NULL; ch != '\0'; ch = *src++)
> >> >> ++                              if (!isspace(ch))
> >> >> ++                                      break;
> >> >> ++                      /* Make sure there is another trailing =
> sign.
> >> >> */
> >> >> ++                      if (ch != Pad64)
> >> >> ++                              return (-1);
> >> >> ++                      ch = *src++;            /* Skip the = */
> >> >> ++                      /* Fall through to "single trailing =" case.
> */
> >> >> ++                      /* FALLTHROUGH */
> >> >> ++
> >> >> ++              case 3:         /* Valid, means two bytes of info */
> >> >> ++                      /*
> >> >> ++                       * We know this char is an =.  Is there
> >> >> anything
> >> >> but
> >> >> ++                       * whitespace after it?
> >> >> ++                       */
> >> >> ++                      for ((void)NULL; ch != '\0'; ch = *src++)
> >> >> ++                              if (!isspace(ch))
> >> >> ++                                      return (-1);
> >> >> ++
> >> >> ++                      /*
> >> >> ++                       * Now make sure for cases 2 and 3 that the
> >> >> "extra"
> >> >> ++                       * bits that slopped past the last full byte
> >> >> were
> >> >> ++                       * zeros.  If we don't check them, they
> become
> >> >> a
> >> >> ++                       * subliminal channel.
> >> >> ++                       */
> >> >> ++                      if (target && target[tarindex] != 0)
> >> >> ++                              return (-1);
> >> >> ++              }
> >> >> ++      } else {
> >> >> ++              /*
> >> >> ++               * We ended by seeing the end of the string.  Make
> sure
> >> >> we
> >> >> ++               * have no partial bytes lying around.
> >> >> ++               */
> >> >> ++              if (state != 0)
> >> >> ++                      return (-1);
> >> >> ++      }
> >> >> ++
> >> >> ++      return (tarindex);
> >> >> ++}
> >> >> ++
> >> >> +--
> >> >> +2.14.1
> >> >> +
> >> >> diff --git
> >> >>
> >> >> a/meta-oe/recipes-devtools/android-tools/android-tools/
> 0002-adb-Musl-fixes.patch
> >> >>
> >> >> b/meta-oe/recipes-devtools/android-tools/android-tools/
> 0002-adb-Musl-fixes.patch
> >> >> new file mode 100644
> >> >> index 000000000..c7aebb641
> >> >> --- /dev/null
> >> >> +++
> >> >>
> >> >> b/meta-oe/recipes-devtools/android-tools/android-tools/
> 0002-adb-Musl-fixes.patch
> >> >> @@ -0,0 +1,134 @@
> >> >> +From f8653ed0ede4aa781ab758fcd44fdc05ffbe0b0a Mon Sep 17 00:00:00
> 2001
> >> >> +From: Khem Raj <raj.khem@gmail.com>
> >> >> +Date: Fri, 15 Sep 2017 15:50:57 -0700
> >> >> +Subject: [PATCH 2/2] adb: Musl fixes
> >> >> +
> >> >> +__nonnull is gcc specific
> >> >> +include sys/types.h for size_t
> >> >> +Do not redefine close() and lseek()
> >> >> +
> >> >> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
> >> >> +---
> >> >> + system/core/adb/adb.h                    |  2 ++
> >> >> + system/core/adb/disable_verity_service.c | 13 ++++++++-----
> >> >> + system/core/adb/framebuffer_service.c    |  7 ++++---
> >> >> + system/core/adb/sysdeps.h                | 12 ++++++------
> >> >> + 4 files changed, 20 insertions(+), 14 deletions(-)
> >> >> +
> >> >> +diff --git a/system/core/adb/adb.h b/system/core/adb/adb.h
> >> >> +index 44e5981..bcdc49f 100644
> >> >> +--- a/system/core/adb/adb.h
> >> >> ++++ b/system/core/adb/adb.h
> >> >> +@@ -18,7 +18,9 @@
> >> >> + #define __ADB_H
> >> >> +
> >> >> + #include <limits.h>
> >> >> ++#include <sys/types.h>
> >> >> +
> >> >> ++#include "fdevent.h"
> >> >> + #include "adb_trace.h"
> >> >> + #include "transport.h"  /* readx(), writex() */
> >> >> +
> >> >> +diff --git a/system/core/adb/disable_verity_service.c
> >> >> b/system/core/adb/disable_verity_service.c
> >> >> +index ed3da52..29fa3d6 100644
> >> >> +--- a/system/core/adb/disable_verity_service.c
> >> >> ++++ b/system/core/adb/disable_verity_service.c
> >> >> +@@ -14,25 +14,28 @@
> >> >> +  * limitations under the License.
> >> >> +  */
> >> >> +
> >> >> +-#include "sysdeps.h"
> >> >> +
> >> >> + #define  TRACE_TAG  TRACE_ADB
> >> >> + #include "adb.h"
> >> >> ++#include "sysdeps.h"
> >> >> ++#include "cutils/properties.h"
> >> >> ++#include "ext4_sb.h"
> >> >> ++#include <fs_mgr.h>
> >> >> +
> >> >> + #include <stdio.h>
> >> >> + #include <stdarg.h>
> >> >> + #include <sys/stat.h>
> >> >> + #include <fcntl.h>
> >> >> + #include <inttypes.h>
> >> >> ++#include <unistd.h>
> >> >> ++#include <errno.h>
> >> >> ++#include <stdbool.h>
> >> >> +
> >> >> +-#include "cutils/properties.h"
> >> >> +-#include "ext4_sb.h"
> >> >> +-#include <fs_mgr.h>
> >> >> +
> >> >> + #define FSTAB_PREFIX "/fstab."
> >> >> + struct fstab *fstab;
> >> >> +
> >> >> +-__attribute__((__format__(printf, 2, 3))) __nonnull((2))
> >> >> ++__attribute__((__format__(printf, 2, 3)))
> >> >> __attribute__((nonnull((2))))
> >> >> + static void write_console(int fd, const char* format, ...)
> >> >> + {
> >> >> +     char buffer[256];
> >> >> +diff --git a/system/core/adb/framebuffer_service.c
> >> >> b/system/core/adb/framebuffer_service.c
> >> >> +index 8cbe840..8f0ccfb 100644
> >> >> +--- a/system/core/adb/framebuffer_service.c
> >> >> ++++ b/system/core/adb/framebuffer_service.c
> >> >> +@@ -14,6 +14,10 @@
> >> >> +  * limitations under the License.
> >> >> +  */
> >> >> +
> >> >> ++#include "fdevent.h"
> >> >> ++#include "adb.h"
> >> >> ++#include "sysdeps.h"
> >> >> ++
> >> >> + #include <stdlib.h>
> >> >> + #include <stdio.h>
> >> >> + #include <unistd.h>
> >> >> +@@ -23,9 +27,6 @@
> >> >> + #include <sys/types.h>
> >> >> + #include <sys/wait.h>
> >> >> +
> >> >> +-#include "fdevent.h"
> >> >> +-#include "adb.h"
> >> >> +-
> >> >> + #include <linux/fb.h>
> >> >> + #include <sys/ioctl.h>
> >> >> + #include <sys/mman.h>
> >> >> +diff --git a/system/core/adb/sysdeps.h b/system/core/adb/sysdeps.h
> >> >> +index cc1f839..ea39ac3 100644
> >> >> +--- a/system/core/adb/sysdeps.h
> >> >> ++++ b/system/core/adb/sysdeps.h
> >> >> +@@ -123,8 +123,8 @@ static __inline__ int  unix_close(int fd)
> >> >> + {
> >> >> +     return close(fd);
> >> >> + }
> >> >> +-#undef   close
> >> >> +-#define  close   ____xxx_close
> >> >> ++//#undef   close
> >> >> ++//#define  close   ____xxx_close
> >> >> +
> >> >> + static __inline__  int  unix_read(int  fd, void*  buf, size_t  len)
> >> >> + {
> >> >> +@@ -369,8 +369,8 @@ static __inline__ int  adb_close(int fd)
> >> >> + {
> >> >> +     return close(fd);
> >> >> + }
> >> >> +-#undef   close
> >> >> +-#define  close   ____xxx_close
> >> >> ++//#undef   close
> >> >> ++//#define  close   ____xxx_close
> >> >> +
> >> >> +
> >> >> + static __inline__  int  adb_read(int  fd, void*  buf, size_t  len)
> >> >> +@@ -392,8 +392,8 @@ static __inline__ int   adb_lseek(int  fd, int
> >> >> pos,
> >> >> int  where)
> >> >> + {
> >> >> +     return lseek(fd, pos, where);
> >> >> + }
> >> >> +-#undef   lseek
> >> >> +-#define  lseek   ___xxx_lseek
> >> >> ++//#undef   lseek
> >> >> ++//#define  lseek   ___xxx_lseek
> >> >> +
> >> >> + static __inline__  int    adb_unlink(const char*  path)
> >> >> + {
> >> >> +--
> >> >> +2.14.1
> >> >> +
> >> >> diff --git
> >> >> a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> >> >> b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> >> >> index 84cd06b10..31452ae10 100644
> >> >> --- a/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> >> >> +++ b/meta-oe/recipes-devtools/android-tools/android-tools/adbd.mk
> >> >> @@ -16,6 +16,7 @@ adbd_SRC_FILES += jdwp_service.c
> >> >>  adbd_SRC_FILES += framebuffer_service.c
> >> >>  adbd_SRC_FILES += remount_service.c
> >> >>  adbd_SRC_FILES += disable_verity_service.c
> >> >> +adbd_SRC_FILES += base64.c
> >> >>  adbd_SRC_FILES += usb_linux_client.c
> >> >>  adbd_OBJS := $(adbd_SRC_FILES:.c=.o)
> >> >>
> >> >> diff --git
> >> >> a/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> >> >> b/meta-oe/recipes-devtools/android-tools/android-tools_5.1.1.r37.bb
> >> >> index 34fddcbda..75f5b9e26 100644
> >> >> --- a/meta-oe/recipes-devtools/android-tools/android-tools_5.
> 1.1.r37.bb
> >> >> +++ b/meta-oe/recipes-devtools/android-tools/android-tools_5.
> 1.1.r37.bb
> >> >> @@ -32,6 +32,8 @@ SRC_URI = " \
> >> >>      file://define-shell-command.patch \
> >> >>      file://implicit-declaration-function-strlcat-strlcopy.patch \
> >> >>      file://fix-big-endian-build.patch \
> >> >> +    file://0001-add-base64-implementation.patch \
> >> >> +    file://0002-adb-Musl-fixes.patch \
> >> >>      file://android-tools-adbd.service \
> >> >>      file://.gitignore;subdir=git \
> >> >>      file://adb.mk;subdir=${BPN} \
> >> >> --
> >> >> 2.14.1
> >> >>
> >> >> --
> >> >> _______________________________________________
> >> >> Openembedded-devel mailing list
> >> >> Openembedded-devel@lists.openembedded.org
> >> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> >> >
> >> >
> >
> >
>

