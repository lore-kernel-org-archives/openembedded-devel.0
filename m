Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
 by mx.groups.io with SMTP id smtpd.web09.7795.1631714132221056665
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 15 Sep 2021 06:55:32 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=TI5lv7/J;
 spf=pass (domain: gmail.com, ip: 209.85.214.169, mailfrom: akuster808@gmail.com)
Received: by mail-pl1-f169.google.com with SMTP id bb10so1695345plb.2
        for <openembedded-devel@lists.openembedded.org>; Wed, 15 Sep 2021 06:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=quXLbiPZirPUc+DYUECIV6I+StKgniVlANWtC//Kz6M=;
        b=TI5lv7/JNDmhu3qcFu3I3KdDGtXNd6TBbTDcM5Y/isgamgdixL0V/lBqiKgWsfS2dn
         +7bsaz/5LgL4f83mdg/8a1dbOK06eo+bouccKF76g77P0omfuYTYZhcJZOv22XtbUTrR
         FKEwmYREGcppaJJtNh7xgx3Kz0+iSSMea25//vUniPjJNZsXKf6e6Hncm2ewErOKF7p4
         DulUzFT9aninlZzaAwuZi/dU+bkpi3oxvem23vn84cN/Hu6lyBZJ2E3aPaoogXgj+ywJ
         RnVVeYA1v4pXPmOACkjkXCAerwqv3kXFu/5b5e1JoeSzwOSe6EtI2XR8Z6ESCoeGjrHh
         rWtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=quXLbiPZirPUc+DYUECIV6I+StKgniVlANWtC//Kz6M=;
        b=7A74NhDQX/pf3SChnzu0vaVEwAP+P+wek4S7CZr/DJTyoMhZ36rTksvpCd07ZM+iLM
         V0R+2ZIo9dGiCQ64KkH2w/WuklPP0jOATVjLZYyVV0n3+9GsR9ttmvqAx5jGZ5uPHztQ
         ZOZMxwIPI72+VLfgzLmekc4DU4uK6F8H0ryJBDKnzCbRpK3BM4W1Qtv7jvbV0I4/xHr4
         lQ1nJAwGcGiTIc+z5No7SPuG2u/ErfE/Kh6fuBL98lGwPG0Xpl9ZUrgqLXdX6jidBAMa
         iaOme6DPtX8CwzxiEEBVvWKyjln6wkc4cRV2tOFrVsyWuCX0YVJbwPJwFBpNNiB+8F2x
         C17Q==
X-Gm-Message-State: AOAM5300yN5EP0bnQwaVKkwCR79hnlqgKLHiuEuow1A/or/1S/22UdXY
	IChh/WG0jd1VNvyiqW16S/x1T0RI8UA=
X-Google-Smtp-Source: ABdhPJwKQeCuLsd6DX9/qCUDJzV3B6k405CJpWF9F1fhrbY8ZaDxRzH7CcvdviQyqvQzUi2BXbjjmQ==
X-Received: by 2002:a17:90b:4b8a:: with SMTP id lr10mr8685939pjb.186.1631714131213;
        Wed, 15 Sep 2021 06:55:31 -0700 (PDT)
Return-Path: <akuster808@gmail.com>
Received: from keaua.hsd1.ca.comcast.net ([2601:202:4180:a5c0:35e:ec78:cef4:300f])
        by smtp.gmail.com with ESMTPSA id v7sm4824941pjk.37.2021.09.15.06.55.30
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Sep 2021 06:55:30 -0700 (PDT)
From: "Armin Kuster" <akuster808@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [hardknott 7/9] redis: fix CVE-2021-32761
Date: Wed, 15 Sep 2021 06:55:18 -0700
Message-Id: <cea26b8482b83eda18370406f8d59cf63436b5ba.1631713963.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1631713963.git.akuster808@gmail.com>
References: <cover.1631713963.git.akuster808@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Joe Slater <joe.slater@windriver.com>

Backport from version 6.2.5.

Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../redis/redis/CVE-2021-32761.patch          | 257 ++++++++++++++++++
 meta-oe/recipes-extended/redis/redis_6.2.2.bb |   1 +
 2 files changed, 258 insertions(+)
 create mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch

diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch b/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
new file mode 100644
index 0000000000..14992b789a
--- /dev/null
+++ b/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
@@ -0,0 +1,257 @@
+From 835d15b5360e277e6f95529c4d8685946a977ddd Mon Sep 17 00:00:00 2001
+From: Huang Zhw <huang_zhw@126.com>
+Date: Wed, 21 Jul 2021 21:25:19 +0800
+Subject: [PATCH 1/1] On 32 bit platform, the bit position of
+ GETBIT/SETBIT/BITFIELD/BITCOUNT,BITPOS may overflow (see CVE-2021-32761)
+ (#9191)
+
+GETBIT, SETBIT may access wrong address because of wrap.
+BITCOUNT and BITPOS may return wrapped results.
+BITFIELD may access the wrong address but also allocate insufficient memory and segfault (see CVE-2021-32761).
+
+This commit uses `uint64_t` or `long long` instead of `size_t`.
+related https://github.com/redis/redis/pull/8096
+
+At 32bit platform:
+> setbit bit 4294967295 1
+(integer) 0
+> config set proto-max-bulk-len 536870913
+OK
+> append bit "\xFF"
+(integer) 536870913
+> getbit bit 4294967296
+(integer) 0
+
+When the bit index is larger than 4294967295, size_t can't hold bit index. In the past,  `proto-max-bulk-len` is limit to 536870912, so there is no problem.
+
+After this commit, bit position is stored in `uint64_t` or `long long`. So when `proto-max-bulk-len > 536870912`, 32bit platforms can still be correct.
+
+For 64bit platform, this problem still exists. The major reason is bit pos 8 times of byte pos. When proto-max-bulk-len is very larger, bit pos may overflow.
+But at 64bit platform, we don't have so long string. So this bug may never happen.
+
+Additionally this commit add a test cost `512MB` memory which is tag as `large-memory`. Make freebsd ci and valgrind ci ignore this test.
+
+(cherry picked from commit 71d452876ebf8456afaadd6b3c27988abadd1148)d
+---
+
+CVE: CVE-2021-32761
+
+Upstream-Status: Backport [835d15b5360e277e6f95529c4d8685946a977ddd]
+                          https://github.com/redis/redis.git
+
+Signed-off-by: Joe Slater <joe.slater@windriver.com>
+
+---
+ .github/workflows/daily.yml |  6 +++---
+ src/bitops.c                | 32 ++++++++++++++++----------------
+ src/server.h                |  2 +-
+ tests/unit/bitops.tcl       | 28 ++++++++++++++++++++++++++++
+ 4 files changed, 48 insertions(+), 20 deletions(-)
+
+diff --git a/.github/workflows/daily.yml b/.github/workflows/daily.yml
+index 9e4630e29..432971a9d 100644
+--- a/.github/workflows/daily.yml
++++ b/.github/workflows/daily.yml
+@@ -151,7 +151,7 @@ jobs:
+       run: |
+         sudo apt-get update
+         sudo apt-get install tcl8.6 valgrind -y
+-        ./runtest --valgrind --verbose --clients 1 --dump-logs
++        ./runtest --valgrind --verbose --clients 1 --tags -large-memory --dump-logs
+     - name: module api test
+       run: ./runtest-moduleapi --valgrind --no-latency --verbose --clients 1
+     - name: unittest
+@@ -171,7 +171,7 @@ jobs:
+       run: |
+         sudo apt-get update
+         sudo apt-get install tcl8.6 valgrind -y
+-        ./runtest --valgrind --verbose --clients 1 --dump-logs
++        ./runtest --valgrind --verbose --clients 1 --tags -large-memory --dump-logs
+     - name: module api test
+       run: ./runtest-moduleapi --valgrind --no-latency --verbose --clients 1
+ 
+@@ -260,7 +260,7 @@ jobs:
+         prepare: pkg install -y bash gmake lang/tcl86
+         run: >
+           gmake &&
+-          ./runtest --accurate --verbose --no-latency --dump-logs &&
++          ./runtest --accurate --verbose --no-latency --tags -large-memory --dump-logs &&
+           MAKE=gmake ./runtest-moduleapi --verbose &&
+           ./runtest-sentinel &&
+           ./runtest-cluster
+diff --git a/src/bitops.c b/src/bitops.c
+index afd79ad88..f1c563a41 100644
+--- a/src/bitops.c
++++ b/src/bitops.c
+@@ -37,8 +37,8 @@
+ /* Count number of bits set in the binary array pointed by 's' and long
+  * 'count' bytes. The implementation of this function is required to
+  * work with an input string length up to 512 MB or more (server.proto_max_bulk_len) */
+-size_t redisPopcount(void *s, long count) {
+-    size_t bits = 0;
++long long redisPopcount(void *s, long count) {
++    long long bits = 0;
+     unsigned char *p = s;
+     uint32_t *p4;
+     static const unsigned char bitsinbyte[256] = {0,1,1,2,1,2,2,3,1,2,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,4,5,5,6,5,6,6,7,5,6,6,7,6,7,7,8};
+@@ -98,11 +98,11 @@ size_t redisPopcount(void *s, long count) {
+  * no zero bit is found, it returns count*8 assuming the string is zero
+  * padded on the right. However if 'bit' is 1 it is possible that there is
+  * not a single set bit in the bitmap. In this special case -1 is returned. */
+-long redisBitpos(void *s, unsigned long count, int bit) {
++long long redisBitpos(void *s, unsigned long count, int bit) {
+     unsigned long *l;
+     unsigned char *c;
+     unsigned long skipval, word = 0, one;
+-    long pos = 0; /* Position of bit, to return to the caller. */
++    long long pos = 0; /* Position of bit, to return to the caller. */
+     unsigned long j;
+     int found;
+ 
+@@ -410,7 +410,7 @@ void printBits(unsigned char *p, unsigned long count) {
+  * If the 'hash' argument is true, and 'bits is positive, then the command
+  * will also parse bit offsets prefixed by "#". In such a case the offset
+  * is multiplied by 'bits'. This is useful for the BITFIELD command. */
+-int getBitOffsetFromArgument(client *c, robj *o, size_t *offset, int hash, int bits) {
++int getBitOffsetFromArgument(client *c, robj *o, uint64_t *offset, int hash, int bits) {
+     long long loffset;
+     char *err = "bit offset is not an integer or out of range";
+     char *p = o->ptr;
+@@ -435,7 +435,7 @@ int getBitOffsetFromArgument(client *c, robj *o, size_t *offset, int hash, int b
+         return C_ERR;
+     }
+ 
+-    *offset = (size_t)loffset;
++    *offset = loffset;
+     return C_OK;
+ }
+ 
+@@ -477,7 +477,7 @@ int getBitfieldTypeFromArgument(client *c, robj *o, int *sign, int *bits) {
+  * so that the 'maxbit' bit can be addressed. The object is finally
+  * returned. Otherwise if the key holds a wrong type NULL is returned and
+  * an error is sent to the client. */
+-robj *lookupStringForBitCommand(client *c, size_t maxbit) {
++robj *lookupStringForBitCommand(client *c, uint64_t maxbit) {
+     size_t byte = maxbit >> 3;
+     robj *o = lookupKeyWrite(c->db,c->argv[1]);
+     if (checkType(c,o,OBJ_STRING)) return NULL;
+@@ -527,7 +527,7 @@ unsigned char *getObjectReadOnlyString(robj *o, long *len, char *llbuf) {
+ void setbitCommand(client *c) {
+     robj *o;
+     char *err = "bit is not an integer or out of range";
+-    size_t bitoffset;
++    uint64_t bitoffset;
+     ssize_t byte, bit;
+     int byteval, bitval;
+     long on;
+@@ -566,7 +566,7 @@ void setbitCommand(client *c) {
+ void getbitCommand(client *c) {
+     robj *o;
+     char llbuf[32];
+-    size_t bitoffset;
++    uint64_t bitoffset;
+     size_t byte, bit;
+     size_t bitval = 0;
+ 
+@@ -888,7 +888,7 @@ void bitposCommand(client *c) {
+         addReplyLongLong(c, -1);
+     } else {
+         long bytes = end-start+1;
+-        long pos = redisBitpos(p+start,bytes,bit);
++        long long pos = redisBitpos(p+start,bytes,bit);
+ 
+         /* If we are looking for clear bits, and the user specified an exact
+          * range with start-end, we can't consider the right of the range as
+@@ -897,11 +897,11 @@ void bitposCommand(client *c) {
+          * So if redisBitpos() returns the first bit outside the range,
+          * we return -1 to the caller, to mean, in the specified range there
+          * is not a single "0" bit. */
+-        if (end_given && bit == 0 && pos == bytes*8) {
++        if (end_given && bit == 0 && pos == (long long)bytes<<3) {
+             addReplyLongLong(c,-1);
+             return;
+         }
+-        if (pos != -1) pos += start*8; /* Adjust for the bytes we skipped. */
++        if (pos != -1) pos += (long long)start<<3; /* Adjust for the bytes we skipped. */
+         addReplyLongLong(c,pos);
+     }
+ }
+@@ -933,12 +933,12 @@ struct bitfieldOp {
+  * GET subcommand is allowed, other subcommands will return an error. */
+ void bitfieldGeneric(client *c, int flags) {
+     robj *o;
+-    size_t bitoffset;
++    uint64_t bitoffset;
+     int j, numops = 0, changes = 0;
+     struct bitfieldOp *ops = NULL; /* Array of ops to execute at end. */
+     int owtype = BFOVERFLOW_WRAP; /* Overflow type. */
+     int readonly = 1;
+-    size_t highest_write_offset = 0;
++    uint64_t highest_write_offset = 0;
+ 
+     for (j = 2; j < c->argc; j++) {
+         int remargs = c->argc-j-1; /* Remaining args other than current. */
+@@ -1128,9 +1128,9 @@ void bitfieldGeneric(client *c, int flags) {
+              * object boundaries. */
+             memset(buf,0,9);
+             int i;
+-            size_t byte = thisop->offset >> 3;
++            uint64_t byte = thisop->offset >> 3;
+             for (i = 0; i < 9; i++) {
+-                if (src == NULL || i+byte >= (size_t)strlen) break;
++                if (src == NULL || i+byte >= (uint64_t)strlen) break;
+                 buf[i] = src[i+byte];
+             }
+ 
+diff --git a/src/server.h b/src/server.h
+index 67541fe60..caf9df31c 100644
+--- a/src/server.h
++++ b/src/server.h
+@@ -1795,7 +1795,7 @@ void getRandomHexChars(char *p, size_t len);
+ void getRandomBytes(unsigned char *p, size_t len);
+ uint64_t crc64(uint64_t crc, const unsigned char *s, uint64_t l);
+ void exitFromChild(int retcode);
+-size_t redisPopcount(void *s, long count);
++long long redisPopcount(void *s, long count);
+ int redisSetProcTitle(char *title);
+ int validateProcTitleTemplate(const char *template);
+ int redisCommunicateSystemd(const char *sd_notify_msg);
+diff --git a/tests/unit/bitops.tcl b/tests/unit/bitops.tcl
+index 926f38295..534832974 100644
+--- a/tests/unit/bitops.tcl
++++ b/tests/unit/bitops.tcl
+@@ -349,3 +349,31 @@ start_server {tags {"bitops"}} {
+         }
+     }
+ }
++
++start_server {tags {"bitops large-memory"}} {
++    test "BIT pos larger than UINT_MAX" {
++        set bytes [expr (1 << 29) + 1]
++        set bitpos [expr (1 << 32)]
++        set oldval [lindex [r config get proto-max-bulk-len] 1]
++        r config set proto-max-bulk-len $bytes
++        r setbit mykey $bitpos 1
++        assert_equal $bytes [r strlen mykey]
++        assert_equal 1 [r getbit mykey $bitpos]
++        assert_equal [list 128 128 -1] [r bitfield mykey get u8 $bitpos set u8 $bitpos 255 get i8 $bitpos]
++        assert_equal $bitpos [r bitpos mykey 1]
++        assert_equal $bitpos [r bitpos mykey 1 [expr $bytes - 1]]
++        if {$::accurate} {
++            # set all bits to 1
++            set mega [expr (1 << 23)]
++            set part [string repeat "\xFF" $mega]
++            for {set i 0} {$i < 64} {incr i} {
++                r setrange mykey [expr $i * $mega] $part
++            }
++            r setrange mykey [expr $bytes - 1] "\xFF"
++            assert_equal [expr $bitpos + 8] [r bitcount mykey]
++            assert_equal -1 [r bitpos mykey 0 0 [expr $bytes - 1]]
++        }
++        r config set proto-max-bulk-len $oldval
++        r del mykey
++    } {1}
++}
+-- 
+2.24.1
+
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
index a9e6eaffaa..ad675e9e04 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.2.bb
@@ -19,6 +19,7 @@ SRC_URI = "http://download.redis.io/releases/${BP}.tar.gz \
            file://fix-CVE-2021-29477.patch \
            file://fix-CVE-2021-29478.patch \
            file://fix-CVE-2021-32625.patch \
+           file://CVE-2021-32761.patch \
            "
 SRC_URI[sha256sum] = "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3017bed6add0b9535"
 
-- 
2.25.1

