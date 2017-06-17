Return-Path: <bkylerussell@gmail.com>
Received: from mail-io0-f194.google.com (mail-io0-f194.google.com
	[209.85.223.194])
	by mail.openembedded.org (Postfix) with ESMTP id BC54E60806
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 17 Jun 2017 02:55:17 +0000 (UTC)
Received: by mail-io0-f194.google.com with SMTP id j200so6420479ioe.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Jun 2017 19:55:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id;
	bh=Y+VdszUw+3RWBed9kKOGhXuJynJgQbcHQ0jNwdgQDCs=;
	b=urkNGmwqdMomASyDTEbH0S+ozJ8BQQwDvUckfyJuLuruPO/0JJNNmMBNjh5UUn1nRP
	uJ1d+RLX/ujqe9qnp2S6CIJ0ZGzWWIeCTm0ramDV40v7RVZikDTvVLFDNAZAnKOjOekr
	nU6z96mXMlFPt4rgviUFEpTrB/VZz+gsJiedqieNKC2tn1TkNaodrzVsHizDVWRm5YRJ
	TNvObzA0kdpp0DWtMUvJqfKg8JYgzxnTGb1DeYCMFX3drruZCESleNfHd6vY6lY2DjXM
	9MO1WvjIe2YV88Cs+Acj3u0lYNcEWbkgVM5XPEQ6+ChIub9bTzgxHCEWUd30k+mC0HrT
	kfXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id;
	bh=Y+VdszUw+3RWBed9kKOGhXuJynJgQbcHQ0jNwdgQDCs=;
	b=SB+j/hEGhYdW0zpNR0Pfe6Eowm4r9KACfJfH0P898xvIVhLl8JBkscvke06Hd5VVGt
	aA7U3Y4gIWhoDEAzUlaQJXRUPlhzeO22v9A4uw2a3pF5FZGvMLbPLBMKxfR9bYDO0H6i
	28b6y79yv/kJe4ivnNhRnZ8Gxg3Cb5sw2V2gpPWVJ/HoKwOfjeC2RYgTTKpUrmHianbG
	xn6gQXFDe/dVb9dVj+harImU1KBzcXZVgG07K5OyX/xJTUhqItm7b4o6jYlpO5gxiicN
	c7sv8cCp8MOLB8N+18OHLQVSmCgTPP+1Ju5jW8n31Fs6OvDY9aiWiIoqFL4+tMX+EoNi
	/cpA==
X-Gm-Message-State: AKS2vOynb+TZpGgjl8DG3X3Rw31MaGeMDKCWgrMVhbaHLtHJbuoIqlHE
	oKEaBJc9nJJn75/f
X-Received: by 10.107.175.26 with SMTP id y26mr12549375ioe.183.1497668118468; 
	Fri, 16 Jun 2017 19:55:18 -0700 (PDT)
Received: from brrussell-Latitude-E6530.lexmark.com
	([2605:a000:1707:e9:2d82:ef56:21ef:2321])
	by smtp.gmail.com with ESMTPSA id
	g98sm2307105ioj.45.2017.06.16.19.55.16
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Fri, 16 Jun 2017 19:55:17 -0700 (PDT)
From: Kyle Russell <bkylerussell@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 16 Jun 2017 22:54:44 -0400
Message-Id: <1497668084-802-1-git-send-email-bkylerussell@gmail.com>
X-Mailer: git-send-email 2.7.4
Subject: [meta-oe][PATCH] libvncserver: upgrade to 0.9.11
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
X-List-Received-Date: Sat, 17 Jun 2017 02:55:18 -0000

- Updates the SRC_URI to pull from the github project instead of debian
- Removes the need for the configure.ac patch since the github archive
  still contains the webclient directory, no impact to built packages
- sha1.c patch now included on 0.9.11
- adds systemd dependency for distros building with systemd
- removes conf flag for libva since that support has been removed in
  0.9.11
---
 .../0001-remove-webclients-build.patch             |  28 --
 .../libvncserver/0002-common-add-sha1.patch        | 524 ---------------------
 ...bvncserver_0.9.10.bb => libvncserver_0.9.11.bb} |  18 +-
 3 files changed, 7 insertions(+), 563 deletions(-)
 delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/0001-remove-webclients-build.patch
 delete mode 100644 meta-oe/recipes-graphics/libvncserver/libvncserver/0002-common-add-sha1.patch
 rename meta-oe/recipes-graphics/libvncserver/{libvncserver_0.9.10.bb => libvncserver_0.9.11.bb} (53%)

diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/0001-remove-webclients-build.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/0001-remove-webclients-build.patch
deleted file mode 100644
index 8f4365c..0000000
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver/0001-remove-webclients-build.patch
+++ /dev/null
@@ -1,28 +0,0 @@
-diff --git a/Makefile.am b/Makefile.am
-index 5c2a94d..f98038a 100644
---- a/Makefile.am
-+++ b/Makefile.am
-@@ -1,7 +1,7 @@
- ACLOCAL_AMFLAGS = -I m4
- 
--SUBDIRS=libvncserver examples libvncclient webclients client_examples test
--DIST_SUBDIRS=libvncserver examples libvncclient webclients client_examples test
-+SUBDIRS=libvncserver examples libvncclient client_examples test
-+DIST_SUBDIRS=libvncserver examples libvncclient client_examples test
- EXTRA_DIST = CMakeLists.txt rfb/rfbint.h.cmake rfb/rfbconfig.h.cmake
- 
- bin_SCRIPTS = libvncserver-config
-diff --git a/configure.ac b/configure.ac
-index ca9f3b3..9b464cf 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -600,9 +600,6 @@ AC_CONFIG_FILES([Makefile
- 	libvncserver/Makefile
- 	examples/Makefile
- 	examples/android/Makefile
--	webclients/Makefile
--	webclients/java-applet/Makefile
--	webclients/java-applet/ssl/Makefile
- 	libvncclient/Makefile
- 	client_examples/Makefile
- 	test/Makefile
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-common-add-sha1.patch b/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-common-add-sha1.patch
deleted file mode 100644
index 8b70d2f..0000000
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver/0002-common-add-sha1.patch
+++ /dev/null
@@ -1,524 +0,0 @@
-diff --git a/common/sha1.c b/common/sha1.c
-new file mode 100644
-index 0000000..988b188
---- /dev/null
-+++ b/common/sha1.c
-@@ -0,0 +1,411 @@
-+/*
-+ * Copyright (C) The Internet Society (2001).  All Rights Reserved.
-+ *
-+ * This document and translations of it may be copied and furnished to
-+ * others, and derivative works that comment on or otherwise explain it
-+ * or assist in its implementation may be prepared, copied, published
-+ * and distributed, in whole or in part, without restriction of any
-+ * kind, provided that the above copyright notice and this paragraph are
-+ * included on all such copies and derivative works.  However, this
-+ * document itself may not be modified in any way, such as by removing
-+ * the copyright notice or references to the Internet Society or other
-+ * Internet organizations, except as needed for the purpose of
-+ * developing Internet standards in which case the procedures for
-+ * copyrights defined in the Internet Standards process must be
-+ * followed, or as required to translate it into languages other than
-+ * English.
-+ *
-+ * The limited permissions granted above are perpetual and will not be
-+ * revoked by the Internet Society or its successors or assigns.
-+ *
-+ * This document and the information contained herein is provided on an
-+ * "AS IS" basis and THE INTERNET SOCIETY AND THE INTERNET ENGINEERING
-+ * TASK FORCE DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
-+ * BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION
-+ * HEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED WARRANTIES OF
-+ * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
-+ */
-+
-+/*
-+ *  sha1.c
-+ *
-+ *  Description:
-+ *      This file implements the Secure Hashing Algorithm 1 as
-+ *      defined in FIPS PUB 180-1 published April 17, 1995.
-+ *
-+ *      The SHA-1, produces a 160-bit message digest for a given
-+ *      data stream.  It should take about 2**n steps to find a
-+ *      message with the same digest as a given message and
-+ *      2**(n/2) to find any two messages with the same digest,
-+ *      when n is the digest size in bits.  Therefore, this
-+ *      algorithm can serve as a means of providing a
-+ *      "fingerprint" for a message.
-+ *
-+ *  Portability Issues:
-+ *      SHA-1 is defined in terms of 32-bit "words".  This code
-+ *      uses <stdint.h> (included via "sha1.h" to define 32 and 8
-+ *      bit unsigned integer types.  If your C compiler does not
-+ *      support 32 bit unsigned integers, this code is not
-+ *      appropriate.
-+ *
-+ *  Caveats:
-+ *      SHA-1 is designed to work with messages less than 2^64 bits
-+ *      long.  Although SHA-1 allows a message digest to be generated
-+ *      for messages of any number of bits less than 2^64, this
-+ *      implementation only works with messages with a length that is
-+ *      a multiple of the size of an 8-bit character.
-+ *
-+ */
-+
-+#include "sha1.h"
-+
-+/*
-+ *  Define the SHA1 circular left shift macro
-+ */
-+#define SHA1CircularShift(bits,word) \
-+                (((word) << (bits)) | ((word) >> (32-(bits))))
-+
-+/* Local Function Prototyptes */
-+void SHA1PadMessage(SHA1Context *);
-+void SHA1ProcessMessageBlock(SHA1Context *);
-+
-+/*
-+ *  SHA1Reset
-+ *
-+ *  Description:
-+ *      This function will initialize the SHA1Context in preparation
-+ *      for computing a new SHA1 message digest.
-+ *
-+ *  Parameters:
-+ *      context: [in/out]
-+ *          The context to reset.
-+ *
-+ *  Returns:
-+ *      sha Error Code.
-+ *
-+ */
-+int SHA1Reset(SHA1Context *context)
-+{
-+    if (!context)
-+    {
-+        return shaNull;
-+    }
-+
-+    context->Length_Low             = 0;
-+    context->Length_High            = 0;
-+    context->Message_Block_Index    = 0;
-+
-+    context->Intermediate_Hash[0]   = 0x67452301;
-+    context->Intermediate_Hash[1]   = 0xEFCDAB89;
-+    context->Intermediate_Hash[2]   = 0x98BADCFE;
-+    context->Intermediate_Hash[3]   = 0x10325476;
-+    context->Intermediate_Hash[4]   = 0xC3D2E1F0;
-+
-+    context->Computed   = 0;
-+    context->Corrupted  = 0;
-+    return shaSuccess;
-+}
-+
-+/*
-+ *  SHA1Result
-+ *
-+ *  Description:
-+ *      This function will return the 160-bit message digest into the
-+ *      Message_Digest array  provided by the caller.
-+ *      NOTE: The first octet of hash is stored in the 0th element,
-+ *            the last octet of hash in the 19th element.
-+ *
-+ *  Parameters:
-+ *      context: [in/out]
-+ *          The context to use to calculate the SHA-1 hash.
-+ *      Message_Digest: [out]
-+ *          Where the digest is returned.
-+ *
-+ *  Returns:
-+ *      sha Error Code.
-+ *
-+ */
-+int SHA1Result( SHA1Context *context,
-+                uint8_t Message_Digest[SHA1HashSize])
-+{
-+    int i;
-+
-+    if (!context || !Message_Digest)
-+    {
-+        return shaNull;
-+    }
-+
-+    if (context->Corrupted)
-+    {
-+        return context->Corrupted;
-+    }
-+
-+    if (!context->Computed)
-+    {
-+        SHA1PadMessage(context);
-+        for(i=0; i<64; ++i)
-+        {
-+            /* message may be sensitive, clear it out */
-+            context->Message_Block[i] = 0;
-+        }
-+        context->Length_Low = 0;    /* and clear length */
-+        context->Length_High = 0;
-+        context->Computed = 1;
-+    }
-+
-+    for(i = 0; i < SHA1HashSize; ++i)
-+    {
-+        Message_Digest[i] = context->Intermediate_Hash[i>>2]
-+                            >> 8 * ( 3 - ( i & 0x03 ) );
-+    }
-+
-+    return shaSuccess;
-+}
-+
-+/*
-+ *  SHA1Input
-+ *
-+ *  Description:
-+ *      This function accepts an array of octets as the next portion
-+ *      of the message.
-+ *
-+ *  Parameters:
-+ *      context: [in/out]
-+ *          The SHA context to update
-+ *      message_array: [in]
-+ *          An array of characters representing the next portion of
-+ *          the message.
-+ *      length: [in]
-+ *          The length of the message in message_array
-+ *
-+ *  Returns:
-+ *      sha Error Code.
-+ *
-+ */
-+int SHA1Input(    SHA1Context    *context,
-+                  const uint8_t  *message_array,
-+                  unsigned       length)
-+{
-+    if (!length)
-+    {
-+        return shaSuccess;
-+    }
-+
-+    if (!context || !message_array)
-+    {
-+        return shaNull;
-+    }
-+
-+    if (context->Computed)
-+    {
-+        context->Corrupted = shaStateError;
-+        return shaStateError;
-+    }
-+
-+    if (context->Corrupted)
-+    {
-+         return context->Corrupted;
-+    }
-+    while(length-- && !context->Corrupted)
-+    {
-+    context->Message_Block[context->Message_Block_Index++] =
-+                    (*message_array & 0xFF);
-+
-+    context->Length_Low += 8;
-+    if (context->Length_Low == 0)
-+    {
-+        context->Length_High++;
-+        if (context->Length_High == 0)
-+        {
-+            /* Message is too long */
-+            context->Corrupted = 1;
-+        }
-+    }
-+
-+    if (context->Message_Block_Index == 64)
-+    {
-+        SHA1ProcessMessageBlock(context);
-+    }
-+
-+    message_array++;
-+    }
-+
-+    return shaSuccess;
-+}
-+
-+/*
-+ *  SHA1ProcessMessageBlock
-+ *
-+ *  Description:
-+ *      This function will process the next 512 bits of the message
-+ *      stored in the Message_Block array.
-+ *
-+ *  Parameters:
-+ *      None.
-+ *
-+ *  Returns:
-+ *      Nothing.
-+ *
-+ *  Comments:
-+ *      Many of the variable names in this code, especially the
-+ *      single character names, were used because those were the
-+ *      names used in the publication.
-+ *
-+ *
-+ */
-+void SHA1ProcessMessageBlock(SHA1Context *context)
-+{
-+    const uint32_t K[] =    {       /* Constants defined in SHA-1   */
-+                            0x5A827999,
-+                            0x6ED9EBA1,
-+                            0x8F1BBCDC,
-+                            0xCA62C1D6
-+                            };
-+    int           t;                 /* Loop counter                */
-+    uint32_t      temp;              /* Temporary word value        */
-+    uint32_t      W[80];             /* Word sequence               */
-+    uint32_t      A, B, C, D, E;     /* Word buffers                */
-+
-+    /*
-+     *  Initialize the first 16 words in the array W
-+     */
-+    for(t = 0; t < 16; t++)
-+    {
-+        W[t] = context->Message_Block[t * 4] << 24;
-+        W[t] |= context->Message_Block[t * 4 + 1] << 16;
-+        W[t] |= context->Message_Block[t * 4 + 2] << 8;
-+        W[t] |= context->Message_Block[t * 4 + 3];
-+    }
-+
-+    for(t = 16; t < 80; t++)
-+    {
-+       W[t] = SHA1CircularShift(1,W[t-3] ^ W[t-8] ^ W[t-14] ^ W[t-16]);
-+    }
-+
-+    A = context->Intermediate_Hash[0];
-+    B = context->Intermediate_Hash[1];
-+    C = context->Intermediate_Hash[2];
-+    D = context->Intermediate_Hash[3];
-+    E = context->Intermediate_Hash[4];
-+
-+    for(t = 0; t < 20; t++)
-+    {
-+        temp =  SHA1CircularShift(5,A) +
-+                ((B & C) | ((~B) & D)) + E + W[t] + K[0];
-+        E = D;
-+        D = C;
-+        C = SHA1CircularShift(30,B);
-+        B = A;
-+        A = temp;
-+    }
-+
-+    for(t = 20; t < 40; t++)
-+    {
-+        temp = SHA1CircularShift(5,A) + (B ^ C ^ D) + E + W[t] + K[1];
-+        E = D;
-+        D = C;
-+        C = SHA1CircularShift(30,B);
-+        B = A;
-+        A = temp;
-+    }
-+
-+    for(t = 40; t < 60; t++)
-+    {
-+        temp = SHA1CircularShift(5,A) +
-+               ((B & C) | (B & D) | (C & D)) + E + W[t] + K[2];
-+        E = D;
-+        D = C;
-+        C = SHA1CircularShift(30,B);
-+        B = A;
-+        A = temp;
-+    }
-+
-+    for(t = 60; t < 80; t++)
-+    {
-+        temp = SHA1CircularShift(5,A) + (B ^ C ^ D) + E + W[t] + K[3];
-+        E = D;
-+        D = C;
-+        C = SHA1CircularShift(30,B);
-+        B = A;
-+        A = temp;
-+    }
-+
-+    context->Intermediate_Hash[0] += A;
-+    context->Intermediate_Hash[1] += B;
-+    context->Intermediate_Hash[2] += C;
-+    context->Intermediate_Hash[3] += D;
-+    context->Intermediate_Hash[4] += E;
-+
-+    context->Message_Block_Index = 0;
-+}
-+
-+
-+/*
-+ *  SHA1PadMessage
-+ *
-+ *  Description:
-+ *      According to the standard, the message must be padded to an even
-+ *      512 bits.  The first padding bit must be a '1'.  The last 64
-+ *      bits represent the length of the original message.  All bits in
-+ *      between should be 0.  This function will pad the message
-+ *      according to those rules by filling the Message_Block array
-+ *      accordingly.  It will also call the ProcessMessageBlock function
-+ *      provided appropriately.  When it returns, it can be assumed that
-+ *      the message digest has been computed.
-+ *
-+ *  Parameters:
-+ *      context: [in/out]
-+ *          The context to pad
-+ *      ProcessMessageBlock: [in]
-+ *          The appropriate SHA*ProcessMessageBlock function
-+ *  Returns:
-+ *      Nothing.
-+ *
-+ */
-+
-+void SHA1PadMessage(SHA1Context *context)
-+{
-+    /*
-+     *  Check to see if the current message block is too small to hold
-+     *  the initial padding bits and length.  If so, we will pad the
-+     *  block, process it, and then continue padding into a second
-+     *  block.
-+     */
-+    if (context->Message_Block_Index > 55)
-+    {
-+        context->Message_Block[context->Message_Block_Index++] = 0x80;
-+        while(context->Message_Block_Index < 64)
-+        {
-+            context->Message_Block[context->Message_Block_Index++] = 0;
-+        }
-+
-+        SHA1ProcessMessageBlock(context);
-+
-+        while(context->Message_Block_Index < 56)
-+        {
-+            context->Message_Block[context->Message_Block_Index++] = 0;
-+        }
-+    }
-+    else
-+    {
-+        context->Message_Block[context->Message_Block_Index++] = 0x80;
-+        while(context->Message_Block_Index < 56)
-+        {
-+            context->Message_Block[context->Message_Block_Index++] = 0;
-+        }
-+    }
-+
-+    /*
-+     *  Store the message length as the last 8 octets
-+     */
-+    context->Message_Block[56] = context->Length_High >> 24;
-+    context->Message_Block[57] = context->Length_High >> 16;
-+    context->Message_Block[58] = context->Length_High >> 8;
-+    context->Message_Block[59] = context->Length_High;
-+    context->Message_Block[60] = context->Length_Low >> 24;
-+    context->Message_Block[61] = context->Length_Low >> 16;
-+    context->Message_Block[62] = context->Length_Low >> 8;
-+    context->Message_Block[63] = context->Length_Low;
-+
-+    SHA1ProcessMessageBlock(context);
-+}
-diff --git a/common/sha1.h b/common/sha1.h
-new file mode 100644
-index 0000000..1d49b1b
---- /dev/null
-+++ b/common/sha1.h
-@@ -0,0 +1,101 @@
-+/*
-+ * Copyright (C) The Internet Society (2001).  All Rights Reserved.
-+ *
-+ * This document and translations of it may be copied and furnished to
-+ * others, and derivative works that comment on or otherwise explain it
-+ * or assist in its implementation may be prepared, copied, published
-+ * and distributed, in whole or in part, without restriction of any
-+ * kind, provided that the above copyright notice and this paragraph are
-+ * included on all such copies and derivative works.  However, this
-+ * document itself may not be modified in any way, such as by removing
-+ * the copyright notice or references to the Internet Society or other
-+ * Internet organizations, except as needed for the purpose of
-+ * developing Internet standards in which case the procedures for
-+ * copyrights defined in the Internet Standards process must be
-+ * followed, or as required to translate it into languages other than
-+ * English.
-+ *
-+ * The limited permissions granted above are perpetual and will not be
-+ * revoked by the Internet Society or its successors or assigns.
-+ *
-+ * This document and the information contained herein is provided on an
-+ * "AS IS" basis and THE INTERNET SOCIETY AND THE INTERNET ENGINEERING
-+ * TASK FORCE DISCLAIMS ALL WARRANTIES, EXPRESS OR IMPLIED, INCLUDING
-+ * BUT NOT LIMITED TO ANY WARRANTY THAT THE USE OF THE INFORMATION
-+ * HEREIN WILL NOT INFRINGE ANY RIGHTS OR ANY IMPLIED WARRANTIES OF
-+ * MERCHANTABILITY OR FITNESS FOR A PARTICULAR PURPOSE.
-+ */
-+
-+/*
-+ *  sha1.h
-+ *
-+ *  Description:
-+ *      This is the header file for code which implements the Secure
-+ *      Hashing Algorithm 1 as defined in FIPS PUB 180-1 published
-+ *      April 17, 1995.
-+ *
-+ *      Many of the variable names in this code, especially the
-+ *      single character names, were used because those were the names
-+ *      used in the publication.
-+ *
-+ *      Please read the file sha1.c for more information.
-+ *
-+ */
-+
-+
-+#ifndef _SHA1_H_
-+#define _SHA1_H_
-+
-+#include <stdint.h>
-+/*
-+ * If you do not have the ISO standard stdint.h header file, then you
-+ * must typdef the following:
-+ *    name              meaning
-+ *  uint32_t         unsigned 32 bit integer
-+ *  uint8_t          unsigned 8 bit integer (i.e., unsigned char)
-+ *  int_least16_t    integer of >= 16 bits
-+ *
-+ */
-+
-+#ifndef _SHA_enum_
-+#define _SHA_enum_
-+enum
-+{
-+    shaSuccess = 0,
-+    shaNull,            /* Null pointer parameter */
-+    shaInputTooLong,    /* input data too long */
-+    shaStateError       /* called Input after Result */
-+};
-+#endif
-+#define SHA1HashSize 20
-+
-+/*
-+ *  This structure will hold context information for the SHA-1
-+ *  hashing operation
-+ */
-+typedef struct SHA1Context
-+{
-+    uint32_t Intermediate_Hash[SHA1HashSize/4]; /* Message Digest  */
-+
-+    uint32_t Length_Low;            /* Message length in bits      */
-+    uint32_t Length_High;           /* Message length in bits      */
-+
-+                               /* Index into message block array   */
-+    int_least16_t Message_Block_Index;
-+    uint8_t Message_Block[64];      /* 512-bit message blocks      */
-+
-+    int Computed;               /* Is the digest computed?         */
-+    int Corrupted;             /* Is the message digest corrupted? */
-+} SHA1Context;
-+
-+/*
-+ *  Function Prototypes
-+ */
-+int SHA1Reset(  SHA1Context *);
-+int SHA1Input(  SHA1Context *,
-+                const uint8_t *,
-+                unsigned int);
-+int SHA1Result( SHA1Context *,
-+                uint8_t Message_Digest[SHA1HashSize]);
-+
-+#endif
diff --git a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
similarity index 53%
rename from meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
rename to meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
index 0eba87c..457d721 100644
--- a/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.10.bb
+++ b/meta-oe/recipes-graphics/libvncserver/libvncserver_0.9.11.bb
@@ -6,22 +6,18 @@ LICENSE = "GPLv2"
 LIC_FILES_CHKSUM = "file://COPYING;md5=361b6b837cad26c6900a926b62aada5f"
 
 DEPENDS += "zlib libsdl jpeg libpng gtk+ libgcrypt nettle gnutls gmp"
+
+PACKAGECONFIG ??= "${@bb.utils.contains('DISTRO_FEATURES','systemd','systemd','',d)}"
+PACKAGECONFIG[systemd] = ",,systemd"
+
 RDEPENDS_${PN} += "libpng gtk+ libgcrypt"
 
 inherit autotools binconfig pkgconfig
 
-SRC_URI  = "\
-    ${DEBIAN_MIRROR}/main/libv/libvncserver/libvncserver_0.9.10+dfsg.orig.tar.xz \
-    file://0001-remove-webclients-build.patch \
-    file://0002-common-add-sha1.patch \
-    file://0002-format_string.patch \
-"
-
-SRC_URI[md5sum] = "e883b6c7bd339a5e1c48645051abe5c4"
-SRC_URI[sha256sum] = "583f28869b82aec57768d7d18cd7ff81bf092ecbbc1209b587c2c2cd68330250"
+SRC_URI = "https://github.com/LibVNC/libvncserver/archive/LibVNCServer-${PV}.tar.gz"
+SRC_URI[md5sum] = "7f06104d5c009813e95142932c4ddb06"
+SRC_URI[sha256sum] = "193d630372722a532136fd25c5326b2ca1a636cbb8bf9bb115ef869c804d2894"
 
 S = "${WORKDIR}/${BPN}-LibVNCServer-${PV}"
 
-EXTRA_OECONF += "--without-libva"
-
 TARGET_LDFLAGS += "-lgcrypt"
-- 
2.7.4


