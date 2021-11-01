Return-Path: <changqing.li@windriver.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B75A3C433F5
	for <webhook@archiver.kernel.org>; Mon,  1 Nov 2021 02:11:29 +0000 (UTC)
Received: from mail1.wrs.com (mail1.wrs.com [147.11.3.146])
 by mx.groups.io with SMTP id smtpd.web12.38696.1635732688322498528
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 19:11:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=fail (domain: windriver.com, ip: 147.11.3.146, mailfrom: changqing.li@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 1A12BReo001746
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 19:11:27 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com
 [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 1A12BQ2L003037
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
 Sun, 31 Oct 2021 19:11:26 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.12; Sun, 31 Oct 2021 19:11:26 -0700
Received: from pek-lpg-core2.corp.ad.wrs.com (128.224.153.41) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.12 via Frontend Transport; Sun, 31 Oct 2021 19:11:25 -0700
From: <changqing.li@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Subject: [hardknott][meta-oe][PATCH] redis: upgrade 6.2.2 -> 6.2.6
Date: Mon, 1 Nov 2021 10:10:01 +0800
Message-ID: <20211101021001.47343-1-changqing.li@windriver.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by mail1.wrs.com id
 1A12BReo001746
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 01 Nov 2021 02:11:29 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/93687

From: Changqing Li <changqing.li@windriver.com>

refer https://redis.io/, this upgrade container sereval CVE
fixes.

Signed-off-by: Changqing Li <changqing.li@windriver.com>
---
 .../0001-src-Do-not-reset-FINAL_LIBS.patch    |  10 +-
 .../redis/redis/CVE-2021-32626.patch          | 148 ---
 .../redis/CVE-2021-32627-CVE-2021-32628.patch | 873 ------------------
 .../redis/redis/CVE-2021-32675.patch          | 129 ---
 .../redis/redis/CVE-2021-32687.patch          |  67 --
 .../redis/redis/CVE-2021-32761.patch          | 257 ------
 .../redis/redis/CVE-2021-32762.patch          |  68 --
 .../redis/redis/CVE-2021-41099.patch          |  47 -
 .../redis/redis/fix-CVE-2021-29477.patch      |  35 -
 .../redis/redis/fix-CVE-2021-29478.patch      |  42 -
 .../redis/redis/fix-CVE-2021-32625.patch      |  61 --
 .../redis/{redis_6.2.2.bb =3D> redis_6.2.6.bb}  |  15 +-
 12 files changed, 6 insertions(+), 1746 deletions(-)
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32626.p=
atch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32627-C=
VE-2021-32628.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32675.p=
atch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32687.p=
atch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32761.p=
atch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-32762.p=
atch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/CVE-2021-41099.p=
atch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-294=
77.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-294=
78.patch
 delete mode 100644 meta-oe/recipes-extended/redis/redis/fix-CVE-2021-326=
25.patch
 rename meta-oe/recipes-extended/redis/{redis_6.2.2.bb =3D> redis_6.2.6.b=
b} (75%)

diff --git a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-F=
INAL_LIBS.patch b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-re=
set-FINAL_LIBS.patch
index b5c4133e3..43d86094d 100644
--- a/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LI=
BS.patch
+++ b/meta-oe/recipes-extended/redis/redis/0001-src-Do-not-reset-FINAL_LI=
BS.patch
@@ -1,4 +1,4 @@
-From 97584e1eb78dc18599534b47b6670c20c63f5ee2 Mon Sep 17 00:00:00 2001
+From aff8b278bd36085036d302027bc215483ad7f32b Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Tue, 10 Sep 2019 20:04:26 -0700
 Subject: [PATCH] src: Do not reset FINAL_LIBS
@@ -15,10 +15,10 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  1 file changed, 1 insertion(+), 1 deletion(-)
=20
 diff --git a/src/Makefile b/src/Makefile
-index 7f7c625..c71dd3b 100644
+index 7a7168c..d0680e8 100644
 --- a/src/Makefile
 +++ b/src/Makefile
-@@ -75,7 +75,7 @@ endif
+@@ -91,7 +91,7 @@ endif
 =20
  FINAL_CFLAGS=3D$(STD) $(WARN) $(OPT) $(DEBUG) $(CFLAGS) $(REDIS_CFLAGS)
  FINAL_LDFLAGS=3D$(LDFLAGS) $(REDIS_LDFLAGS) $(DEBUG)
@@ -26,7 +26,7 @@ index 7f7c625..c71dd3b 100644
 +FINAL_LIBS+=3D-lm
  DEBUG=3D-g -ggdb
 =20
- # Linux ARM needs -latomic at linking time
+ # Linux ARM32 needs -latomic at linking time
 --=20
-2.23.0
+2.17.1
=20
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32626.patch b/=
meta-oe/recipes-extended/redis/redis/CVE-2021-32626.patch
deleted file mode 100644
index 0cfc12b3d..000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2021-32626.patch
+++ /dev/null
@@ -1,148 +0,0 @@
-From 6ce827254484fd850240549c98c74bca77980cc0 Mon Sep 17 00:00:00 2001
-From: "meir@redislabs.com" <meir@redislabs.com>
-Date: Sun, 13 Jun 2021 14:27:18 +0300
-Subject: [PATCH] Fix invalid memory write on lua stack overflow
- {CVE-2021-32626}
-MIME-Version: 1.0
-Content-Type: text/plain; charset=3DUTF-8
-Content-Transfer-Encoding: 8bit
-
-When LUA call our C code, by default, the LUA stack has room for 20
-elements. In most cases, this is more than enough but sometimes it's not
-and the caller must verify the LUA stack size before he pushes elements.
-
-On 3 places in the code, there was no verification of the LUA stack size.
-On specific inputs this missing verification could have lead to invalid
-memory write:
-1. On 'luaReplyToRedisReply', one might return a nested reply that will
-   explode the LUA stack.
-2. On 'redisProtocolToLuaType', the Redis reply might be deep enough
-=C2=A0 =C2=A0to explode the LUA stack (notice that currently there is no=
 such
-=C2=A0 =C2=A0command in Redis that returns such a nested reply, but modu=
les might
-=C2=A0 =C2=A0do it)
-3. On 'ldbRedis', one might give a command with enough arguments to
-=C2=A0 =C2=A0explode the LUA stack (all the arguments will be pushed to =
the LUA
-=C2=A0 =C2=A0stack)
-
-This commit is solving all those 3 issues by calling 'lua_checkstack' an=
d
-verify that there is enough room in the LUA stack to push elements. In
-case 'lua_checkstack' returns an error (there is not enough room in the
-LUA stack and it's not possible to increase the stack), we will do the
-following:
-1. On 'luaReplyToRedisReply', we will return an error to the user.
-2. On 'redisProtocolToLuaType' we will exit with panic (we assume this
-   scenario is rare because it can only happen with a module).
-3. On 'ldbRedis', we return an error.
-
-CVE: CVE-2021-32626
-Upstream-Status: Backport[https://github.com/redis/redis/commit/666ed7fa=
cf4524bf6d19b11b20faa2cf93fdf591]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/scripting.c | 41 +++++++++++++++++++++++++++++++++++++++++
- 1 file changed, 41 insertions(+)
-
-diff --git a/src/scripting.c b/src/scripting.c
-index 299e608..81c88fb 100644
---- a/src/scripting.c
-+++ b/src/scripting.c
-@@ -128,6 +128,16 @@ void sha1hex(char *digest, char *script, size_t len=
) {
-  */
-=20
- char *redisProtocolToLuaType(lua_State *lua, char* reply) {
-+
-+    if (!lua_checkstack(lua, 5)) {
-+        /*
-+         * Increase the Lua stack if needed, to make sure there is enou=
gh room
-+         * to push 5 elements to the stack. On failure, exit with panic.
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Notice that we need, in the worst c=
ase, 5 elements because redisProtocolToLuaType_Aggregate
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* might push 5 elements to the Lua st=
ack.*/
-+        serverPanic("lua stack limit reach when parsing redis.call repl=
y");
-+    }
-+
-     char *p =3D reply;
-=20
-     switch(*p) {
-@@ -220,6 +230,11 @@ char *redisProtocolToLuaType_Aggregate(lua_State *l=
ua, char *reply, int atype) {
-             if (atype =3D=3D '%') {
-                 p =3D redisProtocolToLuaType(lua,p);
-             } else {
-+                if (!lua_checkstack(lua, 1)) {
-+                    /* Notice that here we need to check the stack agai=
n because the recursive
-+                     * call to redisProtocolToLuaType might have use th=
e room allocated in the stack */
-+                    serverPanic("lua stack limit reach when parsing red=
is.call reply");
-+                }
-                 lua_pushboolean(lua,1);
-             }
-             lua_settable(lua,-3);
-@@ -339,6 +354,17 @@ void luaSortArray(lua_State *lua) {
- /* Reply to client 'c' converting the top element in the Lua stack to a
-  * Redis reply. As a side effect the element is consumed from the stack=
.  */
- void luaReplyToRedisReply(client *c, lua_State *lua) {
-+
-+    if (!lua_checkstack(lua, 4)) {
-+        /* Increase the Lua stack if needed to make sure there is enoug=
h room
-+         * to push 4 elements to the stack. On failure, return error.
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Notice that we need, in the worst c=
ase, 4 elements because returning a map might
-+         * require push 4 elements to the Lua stack.*/
-+        addReplyErrorFormat(c, "reached lua stack limit");
-+        lua_pop(lua,1); // pop the element from the stack
-+        return;
-+    }
-+
-     int t =3D lua_type(lua,-1);
-=20
-     switch(t) {
-@@ -362,6 +388,7 @@ void luaReplyToRedisReply(client *c, lua_State *lua)=
 {
-          * field. */
-=20
-         /* Handle error reply. */
-+        // we took care of the stack size on function start
-         lua_pushstring(lua,"err");
-         lua_gettable(lua,-2);
-         t =3D lua_type(lua,-1);
-@@ -404,6 +431,7 @@ void luaReplyToRedisReply(client *c, lua_State *lua)=
 {
-         if (t =3D=3D LUA_TTABLE) {
-             int maplen =3D 0;
-             void *replylen =3D addReplyDeferredLen(c);
-+            /* we took care of the stack size on function start */
-             lua_pushnil(lua); /* Use nil to start iteration. */
-             while (lua_next(lua,-2)) {
-                 /* Stack now: table, key, value */
-@@ -426,6 +454,7 @@ void luaReplyToRedisReply(client *c, lua_State *lua)=
 {
-         if (t =3D=3D LUA_TTABLE) {
-             int setlen =3D 0;
-             void *replylen =3D addReplyDeferredLen(c);
-+            /* we took care of the stack size on function start */
-             lua_pushnil(lua); /* Use nil to start iteration. */
-             while (lua_next(lua,-2)) {
-                 /* Stack now: table, key, true */
-@@ -445,6 +474,7 @@ void luaReplyToRedisReply(client *c, lua_State *lua)=
 {
-         void *replylen =3D addReplyDeferredLen(c);
-         int j =3D 1, mbulklen =3D 0;
-         while(1) {
-+            /* we took care of the stack size on function start */
-             lua_pushnumber(lua,j++);
-             lua_gettable(lua,-2);
-             t =3D lua_type(lua,-1);
-@@ -2546,6 +2576,17 @@ void ldbEval(lua_State *lua, sds *argv, int argc)=
 {
- void ldbRedis(lua_State *lua, sds *argv, int argc) {
-     int j, saved_rc =3D server.lua_replicate_commands;
-=20
-+    if (!lua_checkstack(lua, argc + 1)) {
-+        /* Increase the Lua stack if needed to make sure there is enoug=
h room
-+         * to push 'argc + 1' elements to the stack. On failure, return=
 error.
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* Notice that we need, in worst case,=
 'argc + 1' elements because we push all the arguments
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* given by the user (without the firs=
t argument) and we also push the 'redis' global table and
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* 'redis.call' function so:
-+=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0* (1 (redis table)) + (1 (redis.call =
function)) + (argc - 1 (all arguments without the first)) =3D argc + 1*/
-+        ldbLogRedisReply("max lua stack reached");
-+        return;
-+    }
-+
-     lua_getglobal(lua,"redis");
-     lua_pushstring(lua,"call");
-     lua_gettable(lua,-2);       /* Stack: redis, redis.call */
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32627-CVE-2021=
-32628.patch b/meta-oe/recipes-extended/redis/redis/CVE-2021-32627-CVE-20=
21-32628.patch
deleted file mode 100644
index 3c60a3e67..000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2021-32627-CVE-2021-32628.=
patch
+++ /dev/null
@@ -1,873 +0,0 @@
-From 2775a3526e3e8bb040e72995231632c801977395 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Thu, 3 Jun 2021 12:10:02 +0300
-Subject: [PATCH] Fix ziplist and listpack overflows and truncations
- (CVE-2021-32627, CVE-2021-32628)
-
-- fix possible heap corruption in ziplist and listpack resulting by tryi=
ng to
-  allocate more than the maximum size of 4GB.
-- prevent ziplist (hash and zset) from reaching size of above 1GB, will =
be
-  converted to HT encoding, that's not a useful size.
-- prevent listpack (stream) from reaching size of above 1GB.
-- XADD will start a new listpack if the new record may cause the previou=
s
-  listpack to grow over 1GB.
-- XADD will respond with an error if a single stream record is over 1GB
-- List type (ziplist in quicklist) was truncating strings that were over=
 4GB,
-  now it'll respond with an error.
-
-CVE: CVE-2021-32627,CVE-2021-32628
-Upstream-Status: Backport[https://github.com/redis/redis/commit/f6a40570=
fa63d5afdd596c78083d754081d80ae3]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
-
----
- src/geo.c                 |   5 +-
- src/listpack.c            |   2 +-
- src/module.c              |   6 +-
- src/quicklist.c           |  16 +++-
- src/rdb.c                 |  45 +++++++----
- src/server.h              |   2 +-
- src/t_hash.c              |  13 +++-
- src/t_list.c              |  29 +++++++
- src/t_stream.c            |  48 +++++++++---
- src/t_zset.c              |  62 +++++++++------
- src/ziplist.c             |  17 ++++-
- src/ziplist.h             |   1 +
- tests/unit/violations.tcl | 156 ++++++++++++++++++++++++++++++++++++++
- 13 files changed, 341 insertions(+), 61 deletions(-)
- create mode 100644 tests/unit/violations.tcl
-
-diff --git a/src/geo.c b/src/geo.c
-index 7c75738a2..893f78a7e 100644
---- a/src/geo.c
-+++ b/src/geo.c
-@@ -770,7 +770,7 @@ void georadiusGeneric(client *c, int srcKeyIndex, in=
t flags) {
-         robj *zobj;
-         zset *zs;
-         int i;
--        size_t maxelelen =3D 0;
-+        size_t maxelelen =3D 0, totelelen =3D 0;
-=20
-         if (returned_items) {
-             zobj =3D createZsetObject();
-@@ -785,13 +785,14 @@ void georadiusGeneric(client *c, int srcKeyIndex, =
int flags) {
-             size_t elelen =3D sdslen(gp->member);
-=20
-             if (maxelelen < elelen) maxelelen =3D elelen;
-+            totelelen +=3D elelen;
-             znode =3D zslInsert(zs->zsl,score,gp->member);
-             serverAssert(dictAdd(zs->dict,gp->member,&znode->score) =3D=
=3D DICT_OK);
-             gp->member =3D NULL;
-         }
-=20
-         if (returned_items) {
--            zsetConvertToZiplistIfNeeded(zobj,maxelelen);
-+            zsetConvertToZiplistIfNeeded(zobj,maxelelen,totelelen);
-             setKey(c,c->db,storekey,zobj);
-             decrRefCount(zobj);
-             notifyKeyspaceEvent(NOTIFY_ZSET,flags & GEOSEARCH ? "geosea=
rchstore" : "georadiusstore",storekey,
-diff --git a/src/listpack.c b/src/listpack.c
-index ee256bad3..27622d4a5 100644
---- a/src/listpack.c
-+++ b/src/listpack.c
-@@ -313,7 +313,7 @@ int lpEncodeGetType(unsigned char *ele, uint32_t siz=
e, unsigned char *intenc, ui
-     } else {
-         if (size < 64) *enclen =3D 1+size;
-         else if (size < 4096) *enclen =3D 2+size;
--        else *enclen =3D 5+size;
-+        else *enclen =3D 5+(uint64_t)size;
-         return LP_ENCODING_STRING;
-     }
- }
-diff --git a/src/module.c b/src/module.c
-index bf6580a60..adca9dc9c 100644
---- a/src/module.c
-+++ b/src/module.c
-@@ -3319,6 +3319,7 @@ int RM_HashGet(RedisModuleKey *key, int flags, ...=
) {
-  * - EDOM if the given ID was 0-0 or not greater than all other IDs in =
the
-  *   stream (only if the AUTOID flag is unset)
-  * - EFBIG if the stream has reached the last possible ID
-+ * - ERANGE if the elements are too large to be stored.
-  */
- int RM_StreamAdd(RedisModuleKey *key, int flags, RedisModuleStreamID *i=
d, RedisModuleString **argv, long numfields) {
-     /* Validate args */
-@@ -3362,8 +3363,9 @@ int RM_StreamAdd(RedisModuleKey *key, int flags, R=
edisModuleStreamID *id, RedisM
-         use_id_ptr =3D &use_id;
-     }
-     if (streamAppendItem(s, argv, numfields, &added_id, use_id_ptr) =3D=
=3D C_ERR) {
--        /* ID not greater than all existing IDs in the stream */
--        errno =3D EDOM;
-+        /* Either the ID not greater than all existing IDs in the strea=
m, or
-+         * the elements are too large to be stored. either way, errno i=
s already
-+         * set by streamAppendItem. */
-         return REDISMODULE_ERR;
-     }
-     /* Postponed signalKeyAsReady(). Done implicitly by moduleCreateEmp=
tyKey()
-diff --git a/src/quicklist.c b/src/quicklist.c
-index 5a1e41dcc..a9f8b43b1 100644
---- a/src/quicklist.c
-+++ b/src/quicklist.c
-@@ -45,11 +45,16 @@
- #define REDIS_STATIC static
- #endif
-=20
--/* Optimization levels for size-based filling */
-+/* Optimization levels for size-based filling.
-+ * Note that the largest possible limit is 16k, so even if each record =
takes
-+ * just one byte, it still won't overflow the 16 bit count field. */
- static const size_t optimization_level[] =3D {4096, 8192, 16384, 32768,=
 65536};
-=20
- /* Maximum size in bytes of any multi-element ziplist.
-- * Larger values will live in their own isolated ziplists. */
-+ * Larger values will live in their own isolated ziplists.
-+ * This is used only if we're limited by record count. when we're limit=
ed by
-+ * size, the maximum limit is bigger, but still safe.
-+ * 8k is a recommended / default size limit */
- #define SIZE_SAFETY_LIMIT 8192
-=20
- /* Minimum ziplist size in bytes for attempting compression. */
-@@ -444,6 +449,8 @@ REDIS_STATIC int _quicklistNodeAllowInsert(const qui=
cklistNode *node,
-     unsigned int new_sz =3D node->sz + sz + ziplist_overhead;
-     if (likely(_quicklistNodeSizeMeetsOptimizationRequirement(new_sz, f=
ill)))
-         return 1;
-+    /* when we return 1 above we know that the limit is a size limit (w=
hich is
-+     * safe, see comments next to optimization_level and SIZE_SAFETY_LI=
MIT) */
-     else if (!sizeMeetsSafetyLimit(new_sz))
-         return 0;
-     else if ((int)node->count < fill)
-@@ -463,6 +470,8 @@ REDIS_STATIC int _quicklistNodeAllowMerge(const quic=
klistNode *a,
-     unsigned int merge_sz =3D a->sz + b->sz - 11;
-     if (likely(_quicklistNodeSizeMeetsOptimizationRequirement(merge_sz,=
 fill)))
-         return 1;
-+    /* when we return 1 above we know that the limit is a size limit (w=
hich is
-+     * safe, see comments next to optimization_level and SIZE_SAFETY_LI=
MIT) */
-     else if (!sizeMeetsSafetyLimit(merge_sz))
-         return 0;
-     else if ((int)(a->count + b->count) <=3D fill)
-@@ -482,6 +491,7 @@ REDIS_STATIC int _quicklistNodeAllowMerge(const quic=
klistNode *a,
-  * Returns 1 if new head created. */
- int quicklistPushHead(quicklist *quicklist, void *value, size_t sz) {
-     quicklistNode *orig_head =3D quicklist->head;
-+    assert(sz < UINT32_MAX); /* TODO: add support for quicklist nodes t=
hat are sds encoded (not zipped) */
-     if (likely(
-             _quicklistNodeAllowInsert(quicklist->head, quicklist->fill,=
 sz))) {
-         quicklist->head->zl =3D
-@@ -505,6 +515,7 @@ int quicklistPushHead(quicklist *quicklist, void *va=
lue, size_t sz) {
-  * Returns 1 if new tail created. */
- int quicklistPushTail(quicklist *quicklist, void *value, size_t sz) {
-     quicklistNode *orig_tail =3D quicklist->tail;
-+    assert(sz < UINT32_MAX); /* TODO: add support for quicklist nodes t=
hat are sds encoded (not zipped) */
-     if (likely(
-             _quicklistNodeAllowInsert(quicklist->tail, quicklist->fill,=
 sz))) {
-         quicklist->tail->zl =3D
-@@ -847,6 +858,7 @@ REDIS_STATIC void _quicklistInsert(quicklist *quickl=
ist, quicklistEntry *entry,
-     int fill =3D quicklist->fill;
-     quicklistNode *node =3D entry->node;
-     quicklistNode *new_node =3D NULL;
-+    assert(sz < UINT32_MAX); /* TODO: add support for quicklist nodes t=
hat are sds encoded (not zipped) */
-=20
-     if (!node) {
-         /* we have no reference node, so let's create only node in the =
list */
-diff --git a/src/rdb.c b/src/rdb.c
-index 53f67a72e..5456c1d80 100644
---- a/src/rdb.c
-+++ b/src/rdb.c
-@@ -1625,7 +1625,7 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds key=
) {
-     } else if (rdbtype =3D=3D RDB_TYPE_ZSET_2 || rdbtype =3D=3D RDB_TYP=
E_ZSET) {
-         /* Read list/set value. */
-         uint64_t zsetlen;
--        size_t maxelelen =3D 0;
-+        size_t maxelelen =3D 0, totelelen =3D 0;
-         zset *zs;
-=20
-         if ((zsetlen =3D rdbLoadLen(rdb,NULL)) =3D=3D RDB_LENERR) retur=
n NULL;
-@@ -1665,6 +1665,7 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds key=
) {
-=20
-             /* Don't care about integer-encoded strings. */
-             if (sdslen(sdsele) > maxelelen) maxelelen =3D sdslen(sdsele=
);
-+            totelelen +=3D sdslen(sdsele);
-=20
-             znode =3D zslInsert(zs->zsl,score,sdsele);
-             if (dictAdd(zs->dict,sdsele,&znode->score) !=3D DICT_OK) {
-@@ -1677,8 +1678,11 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds ke=
y) {
-=20
-         /* Convert *after* loading, since sorted sets are not stored or=
dered. */
-         if (zsetLength(o) <=3D server.zset_max_ziplist_entries &&
--            maxelelen <=3D server.zset_max_ziplist_value)
--                zsetConvert(o,OBJ_ENCODING_ZIPLIST);
-+            maxelelen <=3D server.zset_max_ziplist_value &&
-+            ziplistSafeToAdd(NULL, totelelen))
-+        {
-+            zsetConvert(o,OBJ_ENCODING_ZIPLIST);
-+        }
-     } else if (rdbtype =3D=3D RDB_TYPE_HASH) {
-         uint64_t len;
-         int ret;
-@@ -1731,21 +1735,30 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds k=
ey) {
-                 }
-             }
-=20
--            /* Add pair to ziplist */
--            o->ptr =3D ziplistPush(o->ptr, (unsigned char*)field,
--                    sdslen(field), ZIPLIST_TAIL);
--            o->ptr =3D ziplistPush(o->ptr, (unsigned char*)value,
--                    sdslen(value), ZIPLIST_TAIL);
--
-             /* Convert to hash table if size threshold is exceeded */
-             if (sdslen(field) > server.hash_max_ziplist_value ||
--                sdslen(value) > server.hash_max_ziplist_value)
-+                sdslen(value) > server.hash_max_ziplist_value ||
-+                !ziplistSafeToAdd(o->ptr, sdslen(field)+sdslen(value)))
-             {
--                sdsfree(field);
--                sdsfree(value);
-                 hashTypeConvert(o, OBJ_ENCODING_HT);
-+                ret =3D dictAdd((dict*)o->ptr, field, value);
-+                if (ret =3D=3D DICT_ERR) {
-+                    rdbReportCorruptRDB("Duplicate hash fields detected=
");
-+                    if (dupSearchDict) dictRelease(dupSearchDict);
-+                    sdsfree(value);
-+                    sdsfree(field);
-+                    decrRefCount(o);
-+                    return NULL;
-+                }
-                 break;
-             }
-+
-+            /* Add pair to ziplist */
-+            o->ptr =3D ziplistPush(o->ptr, (unsigned char*)field,
-+                    sdslen(field), ZIPLIST_TAIL);
-+            o->ptr =3D ziplistPush(o->ptr, (unsigned char*)value,
-+                    sdslen(value), ZIPLIST_TAIL);
-+
-             sdsfree(field);
-             sdsfree(value);
-         }
-@@ -1858,12 +1871,11 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds k=
ey) {
-                     while ((zi =3D zipmapNext(zi, &fstr, &flen, &vstr, =
&vlen)) !=3D NULL) {
-                         if (flen > maxlen) maxlen =3D flen;
-                         if (vlen > maxlen) maxlen =3D vlen;
--                        zl =3D ziplistPush(zl, fstr, flen, ZIPLIST_TAIL=
);
--                        zl =3D ziplistPush(zl, vstr, vlen, ZIPLIST_TAIL=
);
-=20
-                         /* search for duplicate records */
-                         sds field =3D sdstrynewlen(fstr, flen);
--                        if (!field || dictAdd(dupSearchDict, field, NUL=
L) !=3D DICT_OK) {
-+                        if (!field || dictAdd(dupSearchDict, field, NUL=
L) !=3D DICT_OK ||
-+                            !ziplistSafeToAdd(zl, (size_t)flen + vlen))=
 {
-                             rdbReportCorruptRDB("Hash zipmap with dup e=
lements, or big length (%u)", flen);
-                             dictRelease(dupSearchDict);
-                             sdsfree(field);
-@@ -1872,6 +1884,9 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds key=
) {
-                             decrRefCount(o);
-                             return NULL;
-                         }
-+
-+                        zl =3D ziplistPush(zl, fstr, flen, ZIPLIST_TAIL=
);
-+                        zl =3D ziplistPush(zl, vstr, vlen, ZIPLIST_TAIL=
);
-                     }
-=20
-                     dictRelease(dupSearchDict);
-diff --git a/src/server.h b/src/server.h
-index d9fef9552..07b34c743 100644
---- a/src/server.h
-+++ b/src/server.h
-@@ -2173,7 +2173,7 @@ unsigned char *zzlFirstInRange(unsigned char *zl, =
zrangespec *range);
- unsigned char *zzlLastInRange(unsigned char *zl, zrangespec *range);
- unsigned long zsetLength(const robj *zobj);
- void zsetConvert(robj *zobj, int encoding);
--void zsetConvertToZiplistIfNeeded(robj *zobj, size_t maxelelen);
-+void zsetConvertToZiplistIfNeeded(robj *zobj, size_t maxelelen, size_t =
totelelen);
- int zsetScore(robj *zobj, sds member, double *score);
- unsigned long zslGetRank(zskiplist *zsl, double score, sds o);
- int zsetAdd(robj *zobj, double score, sds ele, int in_flags, int *out_f=
lags, double *newscore);
-diff --git a/src/t_hash.c b/src/t_hash.c
-index ea0606fb0..2720fdbc7 100644
---- a/src/t_hash.c
-+++ b/src/t_hash.c
-@@ -39,17 +39,22 @@
-  * as their string length can be queried in constant time. */
- void hashTypeTryConversion(robj *o, robj **argv, int start, int end) {
-     int i;
-+    size_t sum =3D 0;
-=20
-     if (o->encoding !=3D OBJ_ENCODING_ZIPLIST) return;
-=20
-     for (i =3D start; i <=3D end; i++) {
--        if (sdsEncodedObject(argv[i]) &&
--            sdslen(argv[i]->ptr) > server.hash_max_ziplist_value)
--        {
-+        if (!sdsEncodedObject(argv[i]))
-+            continue;
-+        size_t len =3D sdslen(argv[i]->ptr);
-+        if (len > server.hash_max_ziplist_value) {
-             hashTypeConvert(o, OBJ_ENCODING_HT);
--            break;
-+            return;
-         }
-+        sum +=3D len;
-     }
-+    if (!ziplistSafeToAdd(o->ptr, sum))
-+        hashTypeConvert(o, OBJ_ENCODING_HT);
- }
-=20
- /* Get the value from a ziplist encoded hash, identified by field.
-diff --git a/src/t_list.c b/src/t_list.c
-index f8ca27458..66c9e3c9d 100644
---- a/src/t_list.c
-+++ b/src/t_list.c
-@@ -29,6 +29,8 @@
-=20
- #include "server.h"
-=20
-+#define LIST_MAX_ITEM_SIZE ((1ull<<32)-1024)
-+
- /*---------------------------------------------------------------------=
--------
-  * List API
-  *---------------------------------------------------------------------=
-------*/
-@@ -224,6 +226,13 @@ robj *listTypeDup(robj *o) {
- void pushGenericCommand(client *c, int where, int xx) {
-     int j;
-=20
-+    for (j =3D 2; j < c->argc; j++) {
-+        if (sdslen(c->argv[j]->ptr) > LIST_MAX_ITEM_SIZE) {
-+            addReplyError(c, "Element too large");
-+            return;
-+        }
-+    }
-+
-     robj *lobj =3D lookupKeyWrite(c->db, c->argv[1]);
-     if (checkType(c,lobj,OBJ_LIST)) return;
-     if (!lobj) {
-@@ -287,6 +296,11 @@ void linsertCommand(client *c) {
-         return;
-     }
-=20
-+    if (sdslen(c->argv[4]->ptr) > LIST_MAX_ITEM_SIZE) {
-+        addReplyError(c, "Element too large");
-+        return;
-+    }
-+
-     if ((subject =3D lookupKeyWriteOrReply(c,c->argv[1],shared.czero)) =
=3D=3D NULL ||
-         checkType(c,subject,OBJ_LIST)) return;
-=20
-@@ -354,6 +368,11 @@ void lsetCommand(client *c) {
-     long index;
-     robj *value =3D c->argv[3];
-=20
-+    if (sdslen(value->ptr) > LIST_MAX_ITEM_SIZE) {
-+        addReplyError(c, "Element too large");
-+        return;
-+    }
-+
-     if ((getLongFromObjectOrReply(c, c->argv[2], &index, NULL) !=3D C_O=
K))
-         return;
-=20
-@@ -576,6 +595,11 @@ void lposCommand(client *c) {
-     int direction =3D LIST_TAIL;
-     long rank =3D 1, count =3D -1, maxlen =3D 0; /* Count -1: option no=
t given. */
-=20
-+    if (sdslen(ele->ptr) > LIST_MAX_ITEM_SIZE) {
-+        addReplyError(c, "Element too large");
-+        return;
-+    }
-+
-     /* Parse the optional arguments. */
-     for (int j =3D 3; j < c->argc; j++) {
-         char *opt =3D c->argv[j]->ptr;
-@@ -671,6 +695,11 @@ void lremCommand(client *c) {
-     long toremove;
-     long removed =3D 0;
-=20
-+    if (sdslen(obj->ptr) > LIST_MAX_ITEM_SIZE) {
-+        addReplyError(c, "Element too large");
-+        return;
-+    }
-+
-     if ((getLongFromObjectOrReply(c, c->argv[2], &toremove, NULL) !=3D =
C_OK))
-         return;
-=20
-diff --git a/src/t_stream.c b/src/t_stream.c
-index 2c30faa06..574195ee3 100644
---- a/src/t_stream.c
-+++ b/src/t_stream.c
-@@ -47,6 +47,12 @@
-  * setting stream_node_max_bytes to a huge number. */
- #define STREAM_LISTPACK_MAX_PRE_ALLOCATE 4096
-=20
-+/* Don't let listpacks grow too big, even if the user config allows it.
-+ * doing so can lead to an overflow (trying to store more than 32bit le=
ngth
-+ * into the listpack header), or actually an assertion since lpInsert
-+ * will return NULL. */
-+#define STREAM_LISTPACK_MAX_SIZE (1<<30)
-+
- void streamFreeCG(streamCG *cg);
- void streamFreeNACK(streamNACK *na);
- size_t streamReplyWithRangeFromConsumerPEL(client *c, stream *s, stream=
ID *start, streamID *end, size_t count, streamConsumer *consumer);
-@@ -433,8 +439,11 @@ void streamGetEdgeID(stream *s, int first, streamID=
 *edge_id)
-  *
-  * The function returns C_OK if the item was added, this is always true
-  * if the ID was generated by the function. However the function may re=
turn
-- * C_ERR if an ID was given via 'use_id', but adding it failed since th=
e
-- * current top ID is greater or equal. */
-+ * C_ERR in several cases:
-+ * 1. If an ID was given via 'use_id', but adding it failed since the
-+ *    current top ID is greater or equal. errno will be set to EDOM.
-+ * 2. If a size of a single element or the sum of the elements is too b=
ig to
-+ *    be stored into the stream. errno will be set to ERANGE. */
- int streamAppendItem(stream *s, robj **argv, int64_t numfields, streamI=
D *added_id, streamID *use_id) {
-=20
-     /* Generate the new entry ID. */
-@@ -448,7 +457,23 @@ int streamAppendItem(stream *s, robj **argv, int64_=
t numfields, streamID *added_
-      * or return an error. Automatically generated IDs might
-      * overflow (and wrap-around) when incrementing the sequence
-        part. */
--    if (streamCompareID(&id,&s->last_id) <=3D 0) return C_ERR;
-+    if (streamCompareID(&id,&s->last_id) <=3D 0) {
-+        errno =3D EDOM;
-+        return C_ERR;
-+    }
-+
-+    /* Avoid overflow when trying to add an element to the stream (list=
pack
-+     * can only host up to 32bit length sttrings, and also a total list=
pack size
-+     * can't be bigger than 32bit length. */
-+    size_t totelelen =3D 0;
-+    for (int64_t i =3D 0; i < numfields*2; i++) {
-+        sds ele =3D argv[i]->ptr;
-+        totelelen +=3D sdslen(ele);
-+    }
-+    if (totelelen > STREAM_LISTPACK_MAX_SIZE) {
-+        errno =3D ERANGE;
-+        return C_ERR;
-+    }
-=20
-     /* Add the new entry. */
-     raxIterator ri;
-@@ -507,9 +532,10 @@ int streamAppendItem(stream *s, robj **argv, int64_=
t numfields, streamID *added_
-      * if we need to switch to the next one. 'lp' will be set to NULL i=
f
-      * the current node is full. */
-     if (lp !=3D NULL) {
--        if (server.stream_node_max_bytes &&
--            lp_bytes >=3D server.stream_node_max_bytes)
--        {
-+        size_t node_max_bytes =3D server.stream_node_max_bytes;
-+        if (node_max_bytes =3D=3D 0 || node_max_bytes > STREAM_LISTPACK=
_MAX_SIZE)
-+            node_max_bytes =3D STREAM_LISTPACK_MAX_SIZE;
-+        if (lp_bytes + totelelen >=3D node_max_bytes) {
-             lp =3D NULL;
-         } else if (server.stream_node_max_entries) {
-             unsigned char *lp_ele =3D lpFirst(lp);
-@@ -1796,11 +1822,13 @@ void xaddCommand(client *c) {
-     /* Append using the low level function and return the ID. */
-     streamID id;
-     if (streamAppendItem(s,c->argv+field_pos,(c->argc-field_pos)/2,
--        &id, parsed_args.id_given ? &parsed_args.id : NULL)
--        =3D=3D C_ERR)
-+        &id, parsed_args.id_given ? &parsed_args.id : NULL) =3D=3D C_ER=
R)
-     {
--        addReplyError(c,"The ID specified in XADD is equal or smaller t=
han the "
--                        "target stream top item");
-+        if (errno =3D=3D EDOM)
-+            addReplyError(c,"The ID specified in XADD is equal or small=
er than "
-+                            "the target stream top item");
-+        else
-+            addReplyError(c,"Elements are too large to be stored");
-         return;
-     }
-     addReplyStreamID(c,&id);
-diff --git a/src/t_zset.c b/src/t_zset.c
-index 3b9ebd2bd..2abc1b49b 100644
---- a/src/t_zset.c
-+++ b/src/t_zset.c
-@@ -1242,15 +1242,18 @@ void zsetConvert(robj *zobj, int encoding) {
- }
-=20
- /* Convert the sorted set object into a ziplist if it is not already a =
ziplist
-- * and if the number of elements and the maximum element size is within=
 the
-- * expected ranges. */
--void zsetConvertToZiplistIfNeeded(robj *zobj, size_t maxelelen) {
-+ * and if the number of elements and the maximum element size and total=
 elements size
-+ * are within the expected ranges. */
-+void zsetConvertToZiplistIfNeeded(robj *zobj, size_t maxelelen, size_t =
totelelen) {
-     if (zobj->encoding =3D=3D OBJ_ENCODING_ZIPLIST) return;
-     zset *zset =3D zobj->ptr;
-=20
-     if (zset->zsl->length <=3D server.zset_max_ziplist_entries &&
--        maxelelen <=3D server.zset_max_ziplist_value)
--            zsetConvert(zobj,OBJ_ENCODING_ZIPLIST);
-+        maxelelen <=3D server.zset_max_ziplist_value &&
-+        ziplistSafeToAdd(NULL, totelelen))
-+    {
-+        zsetConvert(zobj,OBJ_ENCODING_ZIPLIST);
-+    }
- }
-=20
- /* Return (by reference) the score of the specified member of the sorte=
d set
-@@ -1370,20 +1373,28 @@ int zsetAdd(robj *zobj, double score, sds ele, i=
nt in_flags, int *out_flags, dou
-             }
-             return 1;
-         } else if (!xx) {
--            /* Optimize: check if the element is too large or the list
-+            /* check if the element is too large or the list
-              * becomes too long *before* executing zzlInsert. */
--            zobj->ptr =3D zzlInsert(zobj->ptr,ele,score);
--            if (zzlLength(zobj->ptr) > server.zset_max_ziplist_entries =
||
--                sdslen(ele) > server.zset_max_ziplist_value)
-+            if (zzlLength(zobj->ptr)+1 > server.zset_max_ziplist_entrie=
s ||
-+                sdslen(ele) > server.zset_max_ziplist_value ||
-+                !ziplistSafeToAdd(zobj->ptr, sdslen(ele)))
-+            {
-                 zsetConvert(zobj,OBJ_ENCODING_SKIPLIST);
--            if (newscore) *newscore =3D score;
--            *out_flags |=3D ZADD_OUT_ADDED;
--            return 1;
-+            } else {
-+                zobj->ptr =3D zzlInsert(zobj->ptr,ele,score);
-+                if (newscore) *newscore =3D score;
-+                *out_flags |=3D ZADD_OUT_ADDED;
-+                return 1;
-+            }
-         } else {
-             *out_flags |=3D ZADD_OUT_NOP;
-             return 1;
-         }
--    } else if (zobj->encoding =3D=3D OBJ_ENCODING_SKIPLIST) {
-+    }
-+
-+    /* Note that the above block handling ziplist would have either ret=
urned or
-+     * converted the key to skiplist. */
-+    if (zobj->encoding =3D=3D OBJ_ENCODING_SKIPLIST) {
-         zset *zs =3D zobj->ptr;
-         zskiplistNode *znode;
-         dictEntry *de;
-@@ -2361,7 +2372,7 @@ inline static void zunionInterAggregate(double *ta=
rget, double val, int aggregat
-     }
- }
-=20
--static int zsetDictGetMaxElementLength(dict *d) {
-+static size_t zsetDictGetMaxElementLength(dict *d, size_t *totallen) {
-     dictIterator *di;
-     dictEntry *de;
-     size_t maxelelen =3D 0;
-@@ -2371,6 +2382,8 @@ static int zsetDictGetMaxElementLength(dict *d) {
-     while((de =3D dictNext(di)) !=3D NULL) {
-         sds ele =3D dictGetKey(de);
-         if (sdslen(ele) > maxelelen) maxelelen =3D sdslen(ele);
-+        if (totallen)
-+            (*totallen) +=3D sdslen(ele);
-     }
-=20
-     dictReleaseIterator(di);
-@@ -2378,7 +2391,7 @@ static int zsetDictGetMaxElementLength(dict *d) {
-     return maxelelen;
- }
-=20
--static void zdiffAlgorithm1(zsetopsrc *src, long setnum, zset *dstzset,=
 size_t *maxelelen) {
-+static void zdiffAlgorithm1(zsetopsrc *src, long setnum, zset *dstzset,=
 size_t *maxelelen, size_t *totelelen) {
-     /* DIFF Algorithm 1:
-      *
-      * We perform the diff by iterating all the elements of the first s=
et,
-@@ -2426,13 +2439,14 @@ static void zdiffAlgorithm1(zsetopsrc *src, long=
 setnum, zset *dstzset, size_t *
-             znode =3D zslInsert(dstzset->zsl,zval.score,tmp);
-             dictAdd(dstzset->dict,tmp,&znode->score);
-             if (sdslen(tmp) > *maxelelen) *maxelelen =3D sdslen(tmp);
-+            (*totelelen) +=3D sdslen(tmp);
-         }
-     }
-     zuiClearIterator(&src[0]);
- }
-=20
-=20
--static void zdiffAlgorithm2(zsetopsrc *src, long setnum, zset *dstzset,=
 size_t *maxelelen) {
-+static void zdiffAlgorithm2(zsetopsrc *src, long setnum, zset *dstzset,=
 size_t *maxelelen, size_t *totelelen) {
-     /* DIFF Algorithm 2:
-      *
-      * Add all the elements of the first set to the auxiliary set.
-@@ -2486,7 +2500,7 @@ static void zdiffAlgorithm2(zsetopsrc *src, long s=
etnum, zset *dstzset, size_t *
-=20
-     /* Using this algorithm, we can't calculate the max element as we g=
o,
-      * we have to iterate through all elements to find the max one afte=
r. */
--    *maxelelen =3D zsetDictGetMaxElementLength(dstzset->dict);
-+    *maxelelen =3D zsetDictGetMaxElementLength(dstzset->dict, totelelen=
);
- }
-=20
- static int zsetChooseDiffAlgorithm(zsetopsrc *src, long setnum) {
-@@ -2523,14 +2537,14 @@ static int zsetChooseDiffAlgorithm(zsetopsrc *sr=
c, long setnum) {
-     return (algo_one_work <=3D algo_two_work) ? 1 : 2;
- }
-=20
--static void zdiff(zsetopsrc *src, long setnum, zset *dstzset, size_t *m=
axelelen) {
-+static void zdiff(zsetopsrc *src, long setnum, zset *dstzset, size_t *m=
axelelen, size_t *totelelen) {
-     /* Skip everything if the smallest input is empty. */
-     if (zuiLength(&src[0]) > 0) {
-         int diff_algo =3D zsetChooseDiffAlgorithm(src, setnum);
-         if (diff_algo =3D=3D 1) {
--            zdiffAlgorithm1(src, setnum, dstzset, maxelelen);
-+            zdiffAlgorithm1(src, setnum, dstzset, maxelelen, totelelen)=
;
-         } else if (diff_algo =3D=3D 2) {
--            zdiffAlgorithm2(src, setnum, dstzset, maxelelen);
-+            zdiffAlgorithm2(src, setnum, dstzset, maxelelen, totelelen)=
;
-         } else if (diff_algo !=3D 0) {
-             serverPanic("Unknown algorithm");
-         }
-@@ -2565,7 +2579,7 @@ void zunionInterDiffGenericCommand(client *c, robj=
 *dstkey, int numkeysIndex, in
-     zsetopsrc *src;
-     zsetopval zval;
-     sds tmp;
--    size_t maxelelen =3D 0;
-+    size_t maxelelen =3D 0, totelelen =3D 0;
-     robj *dstobj;
-     zset *dstzset;
-     zskiplistNode *znode;
-@@ -2701,6 +2715,7 @@ void zunionInterDiffGenericCommand(client *c, robj=
 *dstkey, int numkeysIndex, in
-                     tmp =3D zuiNewSdsFromValue(&zval);
-                     znode =3D zslInsert(dstzset->zsl,score,tmp);
-                     dictAdd(dstzset->dict,tmp,&znode->score);
-+                    totelelen +=3D sdslen(tmp);
-                     if (sdslen(tmp) > maxelelen) maxelelen =3D sdslen(t=
mp);
-                 }
-             }
-@@ -2737,6 +2752,7 @@ void zunionInterDiffGenericCommand(client *c, robj=
 *dstkey, int numkeysIndex, in
-                     /* Remember the longest single element encountered,
-                      * to understand if it's possible to convert to zip=
list
-                      * at the end. */
-+                     totelelen +=3D sdslen(tmp);
-                      if (sdslen(tmp) > maxelelen) maxelelen =3D sdslen(=
tmp);
-                     /* Update the element with its initial score. */
-                     dictSetKey(accumulator, de, tmp);
-@@ -2771,14 +2787,14 @@ void zunionInterDiffGenericCommand(client *c, ro=
bj *dstkey, int numkeysIndex, in
-         dictReleaseIterator(di);
-         dictRelease(accumulator);
-     } else if (op =3D=3D SET_OP_DIFF) {
--        zdiff(src, setnum, dstzset, &maxelelen);
-+        zdiff(src, setnum, dstzset, &maxelelen, &totelelen);
-     } else {
-         serverPanic("Unknown operator");
-     }
-=20
-     if (dstkey) {
-         if (dstzset->zsl->length) {
--            zsetConvertToZiplistIfNeeded(dstobj, maxelelen);
-+            zsetConvertToZiplistIfNeeded(dstobj, maxelelen, totelelen);
-             setKey(c, c->db, dstkey, dstobj);
-             addReplyLongLong(c, zsetLength(dstobj));
-             notifyKeyspaceEvent(NOTIFY_ZSET,
-diff --git a/src/ziplist.c b/src/ziplist.c
-index aae86c1f2..fdc1bb9e1 100644
---- a/src/ziplist.c
-+++ b/src/ziplist.c
-@@ -267,6 +267,17 @@
-         ZIPLIST_LENGTH(zl) =3D intrev16ifbe(intrev16ifbe(ZIPLIST_LENGTH=
(zl))+incr); \
- }
-=20
-+/* Don't let ziplists grow over 1GB in any case, don't wanna risk overf=
low in
-+ * zlbytes*/
-+#define ZIPLIST_MAX_SAFETY_SIZE (1<<30)
-+int ziplistSafeToAdd(unsigned char* zl, size_t add) {
-+    size_t len =3D zl? ziplistBlobLen(zl): 0;
-+    if (len + add > ZIPLIST_MAX_SAFETY_SIZE)
-+        return 0;
-+    return 1;
-+}
-+
-+
- /* We use this function to receive information about a ziplist entry.
-  * Note that this is not how the data is actually encoded, is just what=
 we
-  * get filled by a function in order to operate more easily. */
-@@ -709,7 +720,8 @@ unsigned char *ziplistNew(void) {
- }
-=20
- /* Resize the ziplist. */
--unsigned char *ziplistResize(unsigned char *zl, unsigned int len) {
-+unsigned char *ziplistResize(unsigned char *zl, size_t len) {
-+    assert(len < UINT32_MAX);
-     zl =3D zrealloc(zl,len);
-     ZIPLIST_BYTES(zl) =3D intrev32ifbe(len);
-     zl[len-1] =3D ZIP_END;
-@@ -1070,6 +1082,9 @@ unsigned char *ziplistMerge(unsigned char **first,=
 unsigned char **second) {
-     /* Combined zl length should be limited within UINT16_MAX */
-     zllength =3D zllength < UINT16_MAX ? zllength : UINT16_MAX;
-=20
-+    /* larger values can't be stored into ZIPLIST_BYTES */
-+    assert(zlbytes < UINT32_MAX);
-+
-     /* Save offset positions before we start ripping memory apart. */
-     size_t first_offset =3D intrev32ifbe(ZIPLIST_TAIL_OFFSET(*first));
-     size_t second_offset =3D intrev32ifbe(ZIPLIST_TAIL_OFFSET(*second))=
;
-diff --git a/src/ziplist.h b/src/ziplist.h
-index 9e7997ad8..569e1259d 100644
---- a/src/ziplist.h
-+++ b/src/ziplist.h
-@@ -65,6 +65,7 @@ int ziplistValidateIntegrity(unsigned char *zl, size_t=
 size, int deep,
- void ziplistRandomPair(unsigned char *zl, unsigned long total_count, zi=
plistEntry *key, ziplistEntry *val);
- void ziplistRandomPairs(unsigned char *zl, unsigned int count, ziplistE=
ntry *keys, ziplistEntry *vals);
- unsigned int ziplistRandomPairsUnique(unsigned char *zl, unsigned int c=
ount, ziplistEntry *keys, ziplistEntry *vals);
-+int ziplistSafeToAdd(unsigned char* zl, size_t add);
-=20
- #ifdef REDIS_TEST
- int ziplistTest(int argc, char *argv[], int accurate);
-diff --git a/tests/unit/violations.tcl b/tests/unit/violations.tcl
-new file mode 100644
-index 000000000..1d3140c52
---- /dev/null
-+++ b/tests/unit/violations.tcl
-@@ -0,0 +1,156 @@
-+# These tests consume massive amounts of memory, and are not
-+# suitable to be executed as part of the normal test suite
-+set ::str500 [string repeat x 500000000] ;# 500mb
-+
-+# Utility function to write big argument into redis client connection
-+proc write_big_bulk {size} {
-+    r write "\$$size\r\n"
-+    while {$size >=3D 500000000} {
-+        r write $::str500
-+        incr size -500000000
-+    }
-+    if {$size > 0} {
-+        r write [string repeat x $size]
-+    }
-+    r write "\r\n"
-+}
-+
-+# One XADD with one huge 5GB field
-+# Expected to fail resulting in an empty stream
-+start_server [list overrides [list save ""] ] {
-+    test {XADD one huge field} {
-+        r config set proto-max-bulk-len 10000000000 ;#10gb
-+        r config set client-query-buffer-limit 10000000000 ;#10gb
-+        r write "*5\r\n\$4\r\nXADD\r\n\$2\r\nS1\r\n\$1\r\n*\r\n"
-+        r write "\$1\r\nA\r\n"
-+        write_big_bulk 5000000000 ;#5gb
-+        r flush
-+        catch {r read} err
-+        assert_match {*too large*} $err
-+        r xlen S1
-+    } {0}
-+}
-+
-+# One XADD with one huge (exactly nearly) 4GB field
-+# This uncovers the overflow in lpEncodeGetType
-+# Expected to fail resulting in an empty stream
-+start_server [list overrides [list save ""] ] {
-+    test {XADD one huge field - 1} {
-+        r config set proto-max-bulk-len 10000000000 ;#10gb
-+        r config set client-query-buffer-limit 10000000000 ;#10gb
-+        r write "*5\r\n\$4\r\nXADD\r\n\$2\r\nS1\r\n\$1\r\n*\r\n"
-+        r write "\$1\r\nA\r\n"
-+        write_big_bulk 4294967295 ;#4gb-1
-+        r flush
-+        catch {r read} err
-+        assert_match {*too large*} $err
-+        r xlen S1
-+    } {0}
-+}
-+
-+# Gradually add big stream fields using repeated XADD calls
-+start_server [list overrides [list save ""] ] {
-+    test {several XADD big fields} {
-+        r config set stream-node-max-bytes 0
-+        for {set j 0} {$j<10} {incr j} {
-+            r xadd stream * 1 $::str500 2 $::str500
-+        }
-+        r ping
-+        r xlen stream
-+    } {10}
-+}
-+
-+# Add over 4GB to a single stream listpack (one XADD command)
-+# Expected to fail resulting in an empty stream
-+start_server [list overrides [list save ""] ] {
-+    test {single XADD big fields} {
-+        r write "*23\r\n\$4\r\nXADD\r\n\$1\r\nS\r\n\$1\r\n*\r\n"
-+        for {set j 0} {$j<10} {incr j} {
-+            r write "\$1\r\n$j\r\n"
-+            write_big_bulk 500000000 ;#500mb
-+        }
-+        r flush
-+        catch {r read} err
-+        assert_match {*too large*} $err
-+        r xlen S
-+    } {0}
-+}
-+
-+# Gradually add big hash fields using repeated HSET calls
-+# This reproduces the overflow in the call to ziplistResize
-+# Object will be converted to hashtable encoding
-+start_server [list overrides [list save ""] ] {
-+    r config set hash-max-ziplist-value 1000000000 ;#1gb
-+    test {hash with many big fields} {
-+        for {set j 0} {$j<10} {incr j} {
-+            r hset h $j $::str500
-+        }
-+        r object encoding h
-+    } {hashtable}
-+}
-+
-+# Add over 4GB to a single hash field (one HSET command)
-+# Object will be converted to hashtable encoding
-+start_server [list overrides [list save ""] ] {
-+    test {hash with one huge field} {
-+        catch {r config set hash-max-ziplist-value 10000000000} ;#10gb
-+        r config set proto-max-bulk-len 10000000000 ;#10gb
-+        r config set client-query-buffer-limit 10000000000 ;#10gb
-+        r write "*4\r\n\$4\r\nHSET\r\n\$2\r\nH1\r\n"
-+        r write "\$1\r\nA\r\n"
-+        write_big_bulk 5000000000 ;#5gb
-+        r flush
-+        r read
-+        r object encoding H1
-+    } {hashtable}
-+}
-+
-+# Add over 4GB to a single list member (one LPUSH command)
-+# Currently unsupported, and expected to fail rather than being truncat=
ed
-+# Expected to fail resulting in a non-existing list
-+start_server [list overrides [list save ""] ] {
-+    test {list with one huge field} {
-+        r config set proto-max-bulk-len 10000000000 ;#10gb
-+        r config set client-query-buffer-limit 10000000000 ;#10gb
-+        r write "*3\r\n\$5\r\nLPUSH\r\n\$2\r\nL1\r\n"
-+        write_big_bulk 5000000000 ;#5gb
-+        r flush
-+        catch {r read} err
-+        assert_match {*too large*} $err
-+        r exists L1
-+    } {0}
-+}
-+
-+# SORT which attempts to store an element larger than 4GB into a list.
-+# Currently unsupported and results in an assertion instead of truncati=
on
-+start_server [list overrides [list save ""] ] {
-+    test {SORT adds huge field to list} {
-+        r config set proto-max-bulk-len 10000000000 ;#10gb
-+        r config set client-query-buffer-limit 10000000000 ;#10gb
-+        r write "*3\r\n\$3\r\nSET\r\n\$2\r\nS1\r\n"
-+        write_big_bulk 5000000000 ;#5gb
-+        r flush
-+        r read
-+        assert_equal [r strlen S1] 5000000000
-+        r set S2 asdf
-+        r sadd myset 1 2
-+        r mset D1 1 D2 2
-+        catch {r sort myset by D* get S* store mylist}
-+        assert_equal [count_log_message 0 "crashed by signal"] 0
-+        assert_equal [count_log_message 0 "ASSERTION FAILED"] 1
-+    }
-+}
-+
-+# SORT which stores an integer encoded element into a list.
-+# Just for coverage, no news here.
-+start_server [list overrides [list save ""] ] {
-+    test {SORT adds integer field to list} {
-+        r set S1 asdf
-+        r set S2 123 ;# integer encoded
-+        assert_encoding "int" S2
-+        r sadd myset 1 2
-+        r mset D1 1 D2 2
-+        r sort myset by D* get S* store mylist
-+        r llen mylist
-+    } {2}
-+}
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32675.patch b/=
meta-oe/recipes-extended/redis/redis/CVE-2021-32675.patch
deleted file mode 100644
index ab691612a..000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2021-32675.patch
+++ /dev/null
@@ -1,129 +0,0 @@
-From a71a65e9ed75b347c33bc882b38f4f1006fcba39 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Wed, 9 Jun 2021 17:31:39 +0300
-Subject: [PATCH] Prevent unauthenticated client from easily consuming lo=
ts of
- memory (CVE-2021-32675)
-
-This change sets a low limit for multibulk and bulk length in the
-protocol for unauthenticated connections, so that they can't easily
-cause redis to allocate massive amounts of memory by sending just a few
-characters on the network.
-The new limits are 10 arguments of 16kb each (instead of 1m of 512mb)
-
-CVE: CVE-2021-32675
-Upstream-Status: Backport[https://github.com/redis/redis/commit/5674b005=
7ff2903d43eaff802017eddf37c360f8]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/networking.c    | 17 +++++++++++++++++
- src/server.c        | 11 +++--------
- src/server.h        |  1 +
- tests/unit/auth.tcl | 16 ++++++++++++++++
- 4 files changed, 37 insertions(+), 8 deletions(-)
-
-diff --git a/src/networking.c b/src/networking.c
-index 2355a37..8e891c6 100644
---- a/src/networking.c
-+++ b/src/networking.c
-@@ -107,6 +107,15 @@ static void clientSetDefaultAuth(client *c) {
-                        !(c->user->flags & USER_FLAG_DISABLED);
- }
-=20
-+int authRequired(client *c) {
-+    /* Check if the user is authenticated. This check is skipped in cas=
e
-+     * the default user is flagged as "nopass" and is active. */
-+    int auth_required =3D (!(DefaultUser->flags & USER_FLAG_NOPASS) ||
-+                          (DefaultUser->flags & USER_FLAG_DISABLED)) &&
-+                        !c->authenticated;
-+    return auth_required;
-+}
-+
- client *createClient(connection *conn) {
-     client *c =3D zmalloc(sizeof(client));
-=20
-@@ -1855,6 +1864,10 @@ int processMultibulkBuffer(client *c) {
-             addReplyError(c,"Protocol error: invalid multibulk length")=
;
-             setProtocolError("invalid mbulk count",c);
-             return C_ERR;
-+        } else if (ll > 10 && authRequired(c)) {
-+            addReplyError(c, "Protocol error: unauthenticated multibulk=
 length");
-+            setProtocolError("unauth mbulk count", c);
-+            return C_ERR;
-         }
-=20
-         c->qb_pos =3D (newline-c->querybuf)+2;
-@@ -1902,6 +1915,10 @@ int processMultibulkBuffer(client *c) {
-                 addReplyError(c,"Protocol error: invalid bulk length");
-                 setProtocolError("invalid bulk length",c);
-                 return C_ERR;
-+            } else if (ll > 16384 && authRequired(c)) {
-+                addReplyError(c, "Protocol error: unauthenticated bulk =
length");
-+                setProtocolError("unauth bulk length", c);
-+                return C_ERR;
-             }
-=20
-             c->qb_pos =3D newline-c->querybuf+2;
-diff --git a/src/server.c b/src/server.c
-index 9932606..f65ad22 100644
---- a/src/server.c
-+++ b/src/server.c
-@@ -3996,14 +3996,9 @@ int processCommand(client *c) {
-     int is_may_replicate_command =3D (c->cmd->flags & (CMD_WRITE | CMD_=
MAY_REPLICATE)) ||
-                                    (c->cmd->proc =3D=3D execCommand && =
(c->mstate.cmd_flags & (CMD_WRITE | CMD_MAY_REPLICATE)));
-=20
--    /* Check if the user is authenticated. This check is skipped in cas=
e
--     * the default user is flagged as "nopass" and is active. */
--    int auth_required =3D (!(DefaultUser->flags & USER_FLAG_NOPASS) ||
--                          (DefaultUser->flags & USER_FLAG_DISABLED)) &&
--                        !c->authenticated;
--    if (auth_required) {
--        /* AUTH and HELLO and no auth modules are valid even in
--         * non-authenticated state. */
-+    if (authRequired(c)) {
-+        /* AUTH and HELLO and no auth commands are valid even in
-+         * non-authenticated state. */=20
-         if (!(c->cmd->flags & CMD_NO_AUTH)) {
-             rejectCommand(c,shared.noautherr);
-             return C_OK;
-diff --git a/src/server.h b/src/server.h
-index e256ce0..a3dfe60 100644
---- a/src/server.h
-+++ b/src/server.h
-@@ -1894,6 +1894,7 @@ void protectClient(client *c);
- void unprotectClient(client *c);
- void initThreadedIO(void);
- client *lookupClientByID(uint64_t id);
-+int authRequired(client *c);
-=20
- #ifdef __GNUC__
- void addReplyErrorFormat(client *c, const char *fmt, ...)
-diff --git a/tests/unit/auth.tcl b/tests/unit/auth.tcl
-index b63cf01..5997707 100644
---- a/tests/unit/auth.tcl
-+++ b/tests/unit/auth.tcl
-@@ -24,6 +24,22 @@ start_server {tags {"auth"} overrides {requirepass fo=
obar}} {
-         r set foo 100
-         r incr foo
-     } {101}
-+
-+    test {For unauthenticated clients multibulk and bulk length are lim=
ited} {
-+        set rr [redis [srv "host"] [srv "port"] 0 $::tls]
-+        $rr write "*100\r\n"
-+        $rr flush
-+        catch {[$rr read]} e
-+        assert_match {*unauthenticated multibulk length*} $e
-+        $rr close
-+
-+        set rr [redis [srv "host"] [srv "port"] 0 $::tls]
-+        $rr write "*1\r\n\$100000000\r\n"
-+        $rr flush
-+        catch {[$rr read]} e
-+        assert_match {*unauthenticated bulk length*} $e
-+        $rr close
-+    }
- }
-=20
- start_server {tags {"auth_binary_password"}} {
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32687.patch b/=
meta-oe/recipes-extended/redis/redis/CVE-2021-32687.patch
deleted file mode 100644
index fe04e67f3..000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2021-32687.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-From a40ee258accdaf56c23950a6371307ca1aa69f06 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Sun, 26 Sep 2021 15:42:17 +0300
-Subject: [PATCH] Fix Integer overflow issue with intsets (CVE-2021-32687=
)
-
-The vulnerability involves changing the default set-max-intset-entries
-configuration parameter to a very large value and constructing specially
-crafted commands to manipulate sets
-
-CVE: CVE-2021-32687
-Upstream-Status: Backport[https://github.com/redis/redis/commit/a30d367a=
71b7017581cf1ca104242a3c644dec0f]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/intset.c | 3 ++-
- src/rdb.c    | 4 +++-
- src/t_set.c  | 5 ++++-
- 3 files changed, 9 insertions(+), 3 deletions(-)
-
-diff --git a/src/intset.c b/src/intset.c
-index 9ba1389..e366851 100644
---- a/src/intset.c
-+++ b/src/intset.c
-@@ -104,7 +104,8 @@ intset *intsetNew(void) {
-=20
- /* Resize the intset */
- static intset *intsetResize(intset *is, uint32_t len) {
--    uint32_t size =3D len*intrev32ifbe(is->encoding);
-+    uint64_t size =3D (uint64_t)len*intrev32ifbe(is->encoding);
-+    assert(size <=3D SIZE_MAX - sizeof(intset));
-     is =3D zrealloc(is,sizeof(intset)+size);
-     return is;
- }
-diff --git a/src/rdb.c b/src/rdb.c
-index 6f2f516..37b1e0b 100644
---- a/src/rdb.c
-+++ b/src/rdb.c
-@@ -1562,7 +1562,9 @@ robj *rdbLoadObject(int rdbtype, rio *rdb, sds key=
) {
-         if ((len =3D rdbLoadLen(rdb,NULL)) =3D=3D RDB_LENERR) return NU=
LL;
-=20
-         /* Use a regular set when there are too many entries. */
--        if (len > server.set_max_intset_entries) {
-+        size_t max_entries =3D server.set_max_intset_entries;
-+        if (max_entries >=3D 1<<30) max_entries =3D 1<<30;
-+        if (len > max_entries) {
-             o =3D createSetObject();
-             /* It's faster to expand the dict to the right size asap in=
 order
-              * to avoid rehashing */
-diff --git a/src/t_set.c b/src/t_set.c
-index b655b71..d50a05a 100644
---- a/src/t_set.c
-+++ b/src/t_set.c
-@@ -66,7 +66,10 @@ int setTypeAdd(robj *subject, sds value) {
-             if (success) {
-                 /* Convert to regular set when the intset contains
-                  * too many entries. */
--                if (intsetLen(subject->ptr) > server.set_max_intset_ent=
ries)
-+                size_t max_entries =3D server.set_max_intset_entries;
-+                /* limit to 1G entries due to intset internals. */
-+                if (max_entries >=3D 1<<30) max_entries =3D 1<<30;
-+                if (intsetLen(subject->ptr) > max_entries)
-                     setTypeConvert(subject,OBJ_ENCODING_HT);
-                 return 1;
-             }
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch b/=
meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
deleted file mode 100644
index 14992b789..000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2021-32761.patch
+++ /dev/null
@@ -1,257 +0,0 @@
-From 835d15b5360e277e6f95529c4d8685946a977ddd Mon Sep 17 00:00:00 2001
-From: Huang Zhw <huang_zhw@126.com>
-Date: Wed, 21 Jul 2021 21:25:19 +0800
-Subject: [PATCH 1/1] On 32 bit platform, the bit position of
- GETBIT/SETBIT/BITFIELD/BITCOUNT,BITPOS may overflow (see CVE-2021-32761=
)
- (#9191)
-
-GETBIT, SETBIT may access wrong address because of wrap.
-BITCOUNT and BITPOS may return wrapped results.
-BITFIELD may access the wrong address but also allocate insufficient mem=
ory and segfault (see CVE-2021-32761).
-
-This commit uses `uint64_t` or `long long` instead of `size_t`.
-related https://github.com/redis/redis/pull/8096
-
-At 32bit platform:
-> setbit bit 4294967295 1
-(integer) 0
-> config set proto-max-bulk-len 536870913
-OK
-> append bit "\xFF"
-(integer) 536870913
-> getbit bit 4294967296
-(integer) 0
-
-When the bit index is larger than 4294967295, size_t can't hold bit inde=
x. In the past,  `proto-max-bulk-len` is limit to 536870912, so there is =
no problem.
-
-After this commit, bit position is stored in `uint64_t` or `long long`. =
So when `proto-max-bulk-len > 536870912`, 32bit platforms can still be co=
rrect.
-
-For 64bit platform, this problem still exists. The major reason is bit p=
os 8 times of byte pos. When proto-max-bulk-len is very larger, bit pos m=
ay overflow.
-But at 64bit platform, we don't have so long string. So this bug may nev=
er happen.
-
-Additionally this commit add a test cost `512MB` memory which is tag as =
`large-memory`. Make freebsd ci and valgrind ci ignore this test.
-
-(cherry picked from commit 71d452876ebf8456afaadd6b3c27988abadd1148)d
----
-
-CVE: CVE-2021-32761
-
-Upstream-Status: Backport [835d15b5360e277e6f95529c4d8685946a977ddd]
-                          https://github.com/redis/redis.git
-
-Signed-off-by: Joe Slater <joe.slater@windriver.com>
-
----
- .github/workflows/daily.yml |  6 +++---
- src/bitops.c                | 32 ++++++++++++++++----------------
- src/server.h                |  2 +-
- tests/unit/bitops.tcl       | 28 ++++++++++++++++++++++++++++
- 4 files changed, 48 insertions(+), 20 deletions(-)
-
-diff --git a/.github/workflows/daily.yml b/.github/workflows/daily.yml
-index 9e4630e29..432971a9d 100644
---- a/.github/workflows/daily.yml
-+++ b/.github/workflows/daily.yml
-@@ -151,7 +151,7 @@ jobs:
-       run: |
-         sudo apt-get update
-         sudo apt-get install tcl8.6 valgrind -y
--        ./runtest --valgrind --verbose --clients 1 --dump-logs
-+        ./runtest --valgrind --verbose --clients 1 --tags -large-memory=
 --dump-logs
-     - name: module api test
-       run: ./runtest-moduleapi --valgrind --no-latency --verbose --clie=
nts 1
-     - name: unittest
-@@ -171,7 +171,7 @@ jobs:
-       run: |
-         sudo apt-get update
-         sudo apt-get install tcl8.6 valgrind -y
--        ./runtest --valgrind --verbose --clients 1 --dump-logs
-+        ./runtest --valgrind --verbose --clients 1 --tags -large-memory=
 --dump-logs
-     - name: module api test
-       run: ./runtest-moduleapi --valgrind --no-latency --verbose --clie=
nts 1
-=20
-@@ -260,7 +260,7 @@ jobs:
-         prepare: pkg install -y bash gmake lang/tcl86
-         run: >
-           gmake &&
--          ./runtest --accurate --verbose --no-latency --dump-logs &&
-+          ./runtest --accurate --verbose --no-latency --tags -large-mem=
ory --dump-logs &&
-           MAKE=3Dgmake ./runtest-moduleapi --verbose &&
-           ./runtest-sentinel &&
-           ./runtest-cluster
-diff --git a/src/bitops.c b/src/bitops.c
-index afd79ad88..f1c563a41 100644
---- a/src/bitops.c
-+++ b/src/bitops.c
-@@ -37,8 +37,8 @@
- /* Count number of bits set in the binary array pointed by 's' and long
-  * 'count' bytes. The implementation of this function is required to
-  * work with an input string length up to 512 MB or more (server.proto_=
max_bulk_len) */
--size_t redisPopcount(void *s, long count) {
--    size_t bits =3D 0;
-+long long redisPopcount(void *s, long count) {
-+    long long bits =3D 0;
-     unsigned char *p =3D s;
-     uint32_t *p4;
-     static const unsigned char bitsinbyte[256] =3D {0,1,1,2,1,2,2,3,1,2=
,2,3,2,3,3,4,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,1,2,2,3,2,3,3,4,2,3,3,4,3,4,=
4,5,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3=
,4,3,4,4,5,3,4,4,5,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,=
6,4,5,5,6,5,6,6,7,1,2,2,3,2,3,3,4,2,3,3,4,3,4,4,5,2,3,3,4,3,4,4,5,3,4,4,5=
,4,5,5,6,2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,=
2,3,3,4,3,4,4,5,3,4,4,5,4,5,5,6,3,4,4,5,4,5,5,6,4,5,5,6,5,6,6,7,3,4,4,5,4=
,5,5,6,4,5,5,6,5,6,6,7,4,5,5,6,5,6,6,7,5,6,6,7,6,7,7,8};
-@@ -98,11 +98,11 @@ size_t redisPopcount(void *s, long count) {
-  * no zero bit is found, it returns count*8 assuming the string is zero
-  * padded on the right. However if 'bit' is 1 it is possible that there=
 is
-  * not a single set bit in the bitmap. In this special case -1 is retur=
ned. */
--long redisBitpos(void *s, unsigned long count, int bit) {
-+long long redisBitpos(void *s, unsigned long count, int bit) {
-     unsigned long *l;
-     unsigned char *c;
-     unsigned long skipval, word =3D 0, one;
--    long pos =3D 0; /* Position of bit, to return to the caller. */
-+    long long pos =3D 0; /* Position of bit, to return to the caller. *=
/
-     unsigned long j;
-     int found;
-=20
-@@ -410,7 +410,7 @@ void printBits(unsigned char *p, unsigned long count=
) {
-  * If the 'hash' argument is true, and 'bits is positive, then the comm=
and
-  * will also parse bit offsets prefixed by "#". In such a case the offs=
et
-  * is multiplied by 'bits'. This is useful for the BITFIELD command. */
--int getBitOffsetFromArgument(client *c, robj *o, size_t *offset, int ha=
sh, int bits) {
-+int getBitOffsetFromArgument(client *c, robj *o, uint64_t *offset, int =
hash, int bits) {
-     long long loffset;
-     char *err =3D "bit offset is not an integer or out of range";
-     char *p =3D o->ptr;
-@@ -435,7 +435,7 @@ int getBitOffsetFromArgument(client *c, robj *o, siz=
e_t *offset, int hash, int b
-         return C_ERR;
-     }
-=20
--    *offset =3D (size_t)loffset;
-+    *offset =3D loffset;
-     return C_OK;
- }
-=20
-@@ -477,7 +477,7 @@ int getBitfieldTypeFromArgument(client *c, robj *o, =
int *sign, int *bits) {
-  * so that the 'maxbit' bit can be addressed. The object is finally
-  * returned. Otherwise if the key holds a wrong type NULL is returned a=
nd
-  * an error is sent to the client. */
--robj *lookupStringForBitCommand(client *c, size_t maxbit) {
-+robj *lookupStringForBitCommand(client *c, uint64_t maxbit) {
-     size_t byte =3D maxbit >> 3;
-     robj *o =3D lookupKeyWrite(c->db,c->argv[1]);
-     if (checkType(c,o,OBJ_STRING)) return NULL;
-@@ -527,7 +527,7 @@ unsigned char *getObjectReadOnlyString(robj *o, long=
 *len, char *llbuf) {
- void setbitCommand(client *c) {
-     robj *o;
-     char *err =3D "bit is not an integer or out of range";
--    size_t bitoffset;
-+    uint64_t bitoffset;
-     ssize_t byte, bit;
-     int byteval, bitval;
-     long on;
-@@ -566,7 +566,7 @@ void setbitCommand(client *c) {
- void getbitCommand(client *c) {
-     robj *o;
-     char llbuf[32];
--    size_t bitoffset;
-+    uint64_t bitoffset;
-     size_t byte, bit;
-     size_t bitval =3D 0;
-=20
-@@ -888,7 +888,7 @@ void bitposCommand(client *c) {
-         addReplyLongLong(c, -1);
-     } else {
-         long bytes =3D end-start+1;
--        long pos =3D redisBitpos(p+start,bytes,bit);
-+        long long pos =3D redisBitpos(p+start,bytes,bit);
-=20
-         /* If we are looking for clear bits, and the user specified an =
exact
-          * range with start-end, we can't consider the right of the ran=
ge as
-@@ -897,11 +897,11 @@ void bitposCommand(client *c) {
-          * So if redisBitpos() returns the first bit outside the range,
-          * we return -1 to the caller, to mean, in the specified range =
there
-          * is not a single "0" bit. */
--        if (end_given && bit =3D=3D 0 && pos =3D=3D bytes*8) {
-+        if (end_given && bit =3D=3D 0 && pos =3D=3D (long long)bytes<<3=
) {
-             addReplyLongLong(c,-1);
-             return;
-         }
--        if (pos !=3D -1) pos +=3D start*8; /* Adjust for the bytes we s=
kipped. */
-+        if (pos !=3D -1) pos +=3D (long long)start<<3; /* Adjust for th=
e bytes we skipped. */
-         addReplyLongLong(c,pos);
-     }
- }
-@@ -933,12 +933,12 @@ struct bitfieldOp {
-  * GET subcommand is allowed, other subcommands will return an error. *=
/
- void bitfieldGeneric(client *c, int flags) {
-     robj *o;
--    size_t bitoffset;
-+    uint64_t bitoffset;
-     int j, numops =3D 0, changes =3D 0;
-     struct bitfieldOp *ops =3D NULL; /* Array of ops to execute at end.=
 */
-     int owtype =3D BFOVERFLOW_WRAP; /* Overflow type. */
-     int readonly =3D 1;
--    size_t highest_write_offset =3D 0;
-+    uint64_t highest_write_offset =3D 0;
-=20
-     for (j =3D 2; j < c->argc; j++) {
-         int remargs =3D c->argc-j-1; /* Remaining args other than curre=
nt. */
-@@ -1128,9 +1128,9 @@ void bitfieldGeneric(client *c, int flags) {
-              * object boundaries. */
-             memset(buf,0,9);
-             int i;
--            size_t byte =3D thisop->offset >> 3;
-+            uint64_t byte =3D thisop->offset >> 3;
-             for (i =3D 0; i < 9; i++) {
--                if (src =3D=3D NULL || i+byte >=3D (size_t)strlen) brea=
k;
-+                if (src =3D=3D NULL || i+byte >=3D (uint64_t)strlen) br=
eak;
-                 buf[i] =3D src[i+byte];
-             }
-=20
-diff --git a/src/server.h b/src/server.h
-index 67541fe60..caf9df31c 100644
---- a/src/server.h
-+++ b/src/server.h
-@@ -1795,7 +1795,7 @@ void getRandomHexChars(char *p, size_t len);
- void getRandomBytes(unsigned char *p, size_t len);
- uint64_t crc64(uint64_t crc, const unsigned char *s, uint64_t l);
- void exitFromChild(int retcode);
--size_t redisPopcount(void *s, long count);
-+long long redisPopcount(void *s, long count);
- int redisSetProcTitle(char *title);
- int validateProcTitleTemplate(const char *template);
- int redisCommunicateSystemd(const char *sd_notify_msg);
-diff --git a/tests/unit/bitops.tcl b/tests/unit/bitops.tcl
-index 926f38295..534832974 100644
---- a/tests/unit/bitops.tcl
-+++ b/tests/unit/bitops.tcl
-@@ -349,3 +349,31 @@ start_server {tags {"bitops"}} {
-         }
-     }
- }
-+
-+start_server {tags {"bitops large-memory"}} {
-+    test "BIT pos larger than UINT_MAX" {
-+        set bytes [expr (1 << 29) + 1]
-+        set bitpos [expr (1 << 32)]
-+        set oldval [lindex [r config get proto-max-bulk-len] 1]
-+        r config set proto-max-bulk-len $bytes
-+        r setbit mykey $bitpos 1
-+        assert_equal $bytes [r strlen mykey]
-+        assert_equal 1 [r getbit mykey $bitpos]
-+        assert_equal [list 128 128 -1] [r bitfield mykey get u8 $bitpos=
 set u8 $bitpos 255 get i8 $bitpos]
-+        assert_equal $bitpos [r bitpos mykey 1]
-+        assert_equal $bitpos [r bitpos mykey 1 [expr $bytes - 1]]
-+        if {$::accurate} {
-+            # set all bits to 1
-+            set mega [expr (1 << 23)]
-+            set part [string repeat "\xFF" $mega]
-+            for {set i 0} {$i < 64} {incr i} {
-+                r setrange mykey [expr $i * $mega] $part
-+            }
-+            r setrange mykey [expr $bytes - 1] "\xFF"
-+            assert_equal [expr $bitpos + 8] [r bitcount mykey]
-+            assert_equal -1 [r bitpos mykey 0 0 [expr $bytes - 1]]
-+        }
-+        r config set proto-max-bulk-len $oldval
-+        r del mykey
-+    } {1}
-+}
---=20
-2.24.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-32762.patch b/=
meta-oe/recipes-extended/redis/redis/CVE-2021-32762.patch
deleted file mode 100644
index ec6e2fbd5..000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2021-32762.patch
+++ /dev/null
@@ -1,68 +0,0 @@
-From 4b1de5438ad9ef2236c379f2f78feb9f1fd9796e Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Mon, 4 Oct 2021 12:10:17 +0300
-Subject: [PATCH] Fix redis-cli / redis-sential overflow on some platform=
s
- (CVE-2021-32762) (#9587)
-
-The redis-cli command line tool and redis-sentinel service may be vulner=
able
-to integer overflow when parsing specially crafted large multi-bulk netw=
ork
-replies. This is a result of a vulnerability in the underlying hiredis
-library which does not perform an overflow check before calling the call=
oc()
-heap allocation function.
-
-This issue only impacts systems with heap allocators that do not perform=
 their
-own overflow checks. Most modern systems do and are therefore not likely=
 to
-be affected. Furthermore, by default redis-sentinel uses the jemalloc al=
locator
-which is also not vulnerable.
-
-Co-authored-by: Yossi Gottlieb <yossigo@gmail.com>
-
-CVE: CVE-2021-32762
-Upstream-Status: Backport[https://github.com/redis/redis/commit/0215324a=
66af949be39b34be2d55143232c1cb71]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- deps/hiredis/hiredis.c |  1 +
- deps/hiredis/test.c    | 14 ++++++++++++++
- 2 files changed, 15 insertions(+)
-
-diff --git a/deps/hiredis/hiredis.c b/deps/hiredis/hiredis.c
-index 51f22a6..990f619 100644
---- a/deps/hiredis/hiredis.c
-+++ b/deps/hiredis/hiredis.c
-@@ -174,6 +174,7 @@ static void *createArrayObject(const redisReadTask *=
task, size_t elements) {
-         return NULL;
-=20
-     if (elements > 0) {
-+        if (SIZE_MAX / sizeof(redisReply*) < elements) return NULL;  /*=
 Don't overflow */
-         r->element =3D hi_calloc(elements,sizeof(redisReply*));
-         if (r->element =3D=3D NULL) {
-             freeReplyObject(r);
-diff --git a/deps/hiredis/test.c b/deps/hiredis/test.c
-index 8295367..bdff74e 100644
---- a/deps/hiredis/test.c
-+++ b/deps/hiredis/test.c
-@@ -498,6 +498,20 @@ static void test_reply_reader(void) {
-     freeReplyObject(reply);
-     redisReaderFree(reader);
-=20
-+    test("Multi-bulk never overflows regardless of maxelements: ");
-+    size_t bad_mbulk_len =3D (SIZE_MAX / sizeof(void *)) + 3;
-+    char bad_mbulk_reply[100];
-+    snprintf(bad_mbulk_reply, sizeof(bad_mbulk_reply), "*%llu\r\n+asdf\=
r\n",
-+        (unsigned long long) bad_mbulk_len);
-+
-+    reader =3D redisReaderCreate();
-+    reader->maxelements =3D 0;    /* Don't rely on default limit */
-+    redisReaderFeed(reader, bad_mbulk_reply, strlen(bad_mbulk_reply));
-+    ret =3D redisReaderGetReply(reader,&reply);
-+    test_cond(ret =3D=3D REDIS_ERR && strcasecmp(reader->errstr, "Out o=
f memory") =3D=3D 0);
-+    freeReplyObject(reply);
-+    redisReaderFree(reader);
-+
- #if LLONG_MAX > SIZE_MAX
-     test("Set error when array > SIZE_MAX: ");
-     reader =3D redisReaderCreate();
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/CVE-2021-41099.patch b/=
meta-oe/recipes-extended/redis/redis/CVE-2021-41099.patch
deleted file mode 100644
index ce0e112ae..000000000
--- a/meta-oe/recipes-extended/redis/redis/CVE-2021-41099.patch
+++ /dev/null
@@ -1,47 +0,0 @@
-From fd25ce2108994b7781269143bdfb3403faa2f1d1 Mon Sep 17 00:00:00 2001
-From: YiyuanGUO <yguoaz@gmail.com>
-Date: Wed, 29 Sep 2021 10:20:35 +0300
-Subject: [PATCH] Fix integer overflow in _sdsMakeRoomFor (CVE-2021-41099=
)
-
-CVE: CVE-2021-41099
-Upstream-Status: Backport[https://github.com/redis/redis/commit/c6ad8767=
74f3cc11e32681ea02a2eead00f2c521]
-
-Signed-off-by: Changqing Li <changqing.li@windriver.com>
----
- src/sds.c | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/src/sds.c b/src/sds.c
-index 2ec3aa7..5eadae5 100644
---- a/src/sds.c
-+++ b/src/sds.c
-@@ -233,7 +233,7 @@ void sdsclear(sds s) {
- sds sdsMakeRoomFor(sds s, size_t addlen) {
-     void *sh, *newsh;
-     size_t avail =3D sdsavail(s);
--    size_t len, newlen;
-+    size_t len, newlen, reqlen;
-     char type, oldtype =3D s[-1] & SDS_TYPE_MASK;
-     int hdrlen;
-     size_t usable;
-@@ -243,7 +243,7 @@ sds sdsMakeRoomFor(sds s, size_t addlen) {
-=20
-     len =3D sdslen(s);
-     sh =3D (char*)s-sdsHdrSize(oldtype);
--    newlen =3D (len+addlen);
-+    reqlen =3D newlen =3D (len+addlen);
-     assert(newlen > len);   /* Catch size_t overflow */
-     if (newlen < SDS_MAX_PREALLOC)
-         newlen *=3D 2;
-@@ -258,7 +258,7 @@ sds sdsMakeRoomFor(sds s, size_t addlen) {
-     if (type =3D=3D SDS_TYPE_5) type =3D SDS_TYPE_8;
-=20
-     hdrlen =3D sdsHdrSize(type);
--    assert(hdrlen + newlen + 1 > len);  /* Catch size_t overflow */
-+    assert(hdrlen + newlen + 1 > reqlen);  /* Catch size_t overflow */
-     if (oldtype=3D=3Dtype) {
-         newsh =3D s_realloc_usable(sh, hdrlen+newlen+1, &usable);
-         if (newsh =3D=3D NULL) return NULL;
---=20
-2.17.1
-
diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patc=
h b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
deleted file mode 100644
index a5e5a1ba5..000000000
--- a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29477.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From f0c5f920d0f88bd8aa376a2c05af4902789d1ef9 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Mon, 3 May 2021 08:32:31 +0300
-Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-29477)
-
-An integer overflow bug in Redis version 6.0 or newer could be exploited=
 using
-the STRALGO LCS command to corrupt the heap and potentially result with =
remote
-code execution.
-
-CVE: CVE-2021-29477
-Upstream-Status: Backport
-[https://github.com/redis/redis/commit/f0c5f920d0f88bd8aa376a2c05af49027=
89d1ef9]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-
----
- src/t_string.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/t_string.c b/src/t_string.c
-index 9228c5ed0..db6f7042e 100644
---- a/src/t_string.c
-+++ b/src/t_string.c
-@@ -805,7 +805,7 @@ void stralgoLCS(client *c) {
-     /* Setup an uint32_t array to store at LCS[i,j] the length of the
-      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, so
-      * we index it as LCS[j+(blen+1)*j] */
--    uint32_t *lcs =3D zmalloc((alen+1)*(blen+1)*sizeof(uint32_t));
-+    uint32_t *lcs =3D zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t=
));
-     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
-=20
-     /* Start building the LCS table. */
---=20
-2.32.0
-
diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patc=
h b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
deleted file mode 100644
index ebbf6e1b9..000000000
--- a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-29478.patch
+++ /dev/null
@@ -1,42 +0,0 @@
-From 29900d4e6bccdf3691bedf0ea9a5d84863fa3592 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Mon, 3 May 2021 08:27:22 +0300
-Subject: [PATCH] Fix integer overflow in intset (CVE-2021-29478)
-
-An integer overflow bug in Redis 6.2 could be exploited to corrupt the h=
eap and
-potentially result with remote code execution.
-
-The vulnerability involves changing the default set-max-intset-entries
-configuration value, creating a large set key that consists of integer v=
alues
-and using the COPY command to duplicate it.
-
-The integer overflow bug exists in all versions of Redis starting with 2=
.6,
-where it could result with a corrupted RDB or DUMP payload, but not expl=
oited
-through COPY (which did not exist before 6.2).
-
-CVE: CVE-2021-29478
-Upstream-Status: Backport
-[https://github.com/redis/redis/commit/29900d4e6bccdf3691bedf0ea9a5d8486=
3fa3592]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
-
----
- src/intset.c | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/src/intset.c b/src/intset.c
-index 1a64ecae8..9ba13898d 100644
---- a/src/intset.c
-+++ b/src/intset.c
-@@ -281,7 +281,7 @@ uint32_t intsetLen(const intset *is) {
-=20
- /* Return intset blob size in bytes. */
- size_t intsetBlobLen(intset *is) {
--    return sizeof(intset)+intrev32ifbe(is->length)*intrev32ifbe(is->enc=
oding);
-+    return sizeof(intset)+(size_t)intrev32ifbe(is->length)*intrev32ifbe=
(is->encoding);
- }
-=20
- /* Validate the integrity of the data structure.
---=20
-2.32.0
-
diff --git a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patc=
h b/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
deleted file mode 100644
index 6311a5db1..000000000
--- a/meta-oe/recipes-extended/redis/redis/fix-CVE-2021-32625.patch
+++ /dev/null
@@ -1,61 +0,0 @@
-From e9a1438ac4c52aa68dfa2a8324b6419356842116 Mon Sep 17 00:00:00 2001
-From: Oran Agra <oran@redislabs.com>
-Date: Tue, 1 Jun 2021 09:12:45 +0300
-Subject: [PATCH] Fix integer overflow in STRALGO LCS (CVE-2021-32625) (#=
9011)
-
-An integer overflow bug in Redis version 6.0 or newer can be exploited u=
sing the
-STRALGO LCS command to corrupt the heap and potentially result with remo=
te code
-execution. This is a result of an incomplete fix by CVE-2021-29477.
-
-(cherry picked from commit 1ddecf1958924b178b76a31d989ef1e05af81964)
-
-
-CVE: CVE-2021-32625
-Upstream-Status: Backport [e9a1438ac4c52aa68dfa2a8324b6419356842116]
-
-Signed-off-by: Tony Tascioglu <tony.tascioglu@windriver.com>
----
- src/t_string.c | 18 +++++++++++++++++-
- 1 file changed, 17 insertions(+), 1 deletion(-)
-
-diff --git a/src/t_string.c b/src/t_string.c
-index 490d5983a..587d3aeb8 100644
---- a/src/t_string.c
-+++ b/src/t_string.c
-@@ -797,6 +797,12 @@ void stralgoLCS(client *c) {
-         goto cleanup;
-     }
-=20
-+    /* Detect string truncation or later overflows. */
-+    if (sdslen(a) >=3D UINT32_MAX-1 || sdslen(b) >=3D UINT32_MAX-1) {
-+        addReplyError(c, "String too long for LCS");
-+        goto cleanup;
-+    }
-+
-     /* Compute the LCS using the vanilla dynamic programming technique =
of
-      * building a table of LCS(x,y) substrings. */
-     uint32_t alen =3D sdslen(a);
-@@ -805,9 +811,19 @@ void stralgoLCS(client *c) {
-     /* Setup an uint32_t array to store at LCS[i,j] the length of the
-      * LCS A0..i-1, B0..j-1. Note that we have a linear array here, so
-      * we index it as LCS[j+(blen+1)*j] */
--    uint32_t *lcs =3D zmalloc((size_t)(alen+1)*(blen+1)*sizeof(uint32_t=
));
-     #define LCS(A,B) lcs[(B)+((A)*(blen+1))]
-=20
-+    /* Try to allocate the LCS table, and abort on overflow or insuffic=
ient memory. */
-+    unsigned long long lcssize =3D (unsigned long long)(alen+1)*(blen+1=
); /* Can't overflow due to the size limits above. */
-+    unsigned long long lcsalloc =3D lcssize * sizeof(uint32_t);
-+    uint32_t *lcs =3D NULL;
-+    if (lcsalloc < SIZE_MAX && lcsalloc / lcssize =3D=3D sizeof(uint32_=
t))
-+        lcs =3D ztrymalloc(lcsalloc);
-+    if (!lcs) {
-+        addReplyError(c, "Insufficient memory");
-+        goto cleanup;
-+    }
-+
-     /* Start building the LCS table. */
-     for (uint32_t i =3D 0; i <=3D alen; i++) {
-         for (uint32_t j =3D 0; j <=3D blen; j++) {
---=20
-2.32.0
-
diff --git a/meta-oe/recipes-extended/redis/redis_6.2.2.bb b/meta-oe/reci=
pes-extended/redis/redis_6.2.6.bb
similarity index 75%
rename from meta-oe/recipes-extended/redis/redis_6.2.2.bb
rename to meta-oe/recipes-extended/redis/redis_6.2.6.bb
index 4317c1060..c129e6198 100644
--- a/meta-oe/recipes-extended/redis/redis_6.2.2.bb
+++ b/meta-oe/recipes-extended/redis/redis_6.2.6.bb
@@ -13,21 +13,8 @@ SRC_URI =3D "http://download.redis.io/releases/${BP}.t=
ar.gz \
            file://hiredis-use-default-CC-if-it-is-set.patch \
            file://lua-update-Makefile-to-use-environment-build-setting.p=
atch \
            file://oe-use-libc-malloc.patch \
-           file://0001-src-Do-not-reset-FINAL_LIBS.patch \
-           file://GNU_SOURCE.patch \
-           file://0006-Define-correct-gregs-for-RISCV32.patch \
-           file://fix-CVE-2021-29477.patch \
-           file://fix-CVE-2021-29478.patch \
-           file://fix-CVE-2021-32625.patch \
-           file://CVE-2021-32761.patch \
-           file://CVE-2021-41099.patch \
-           file://CVE-2021-32762.patch \
-           file://CVE-2021-32687.patch \
-           file://CVE-2021-32675.patch \
-           file://CVE-2021-32627-CVE-2021-32628.patch \
-           file://CVE-2021-32626.patch \
            "
-SRC_URI[sha256sum] =3D "7a260bb74860f1b88c3d5942bf8ba60ca59f121c6dce42d3=
017bed6add0b9535"
+SRC_URI[sha256sum] =3D "5b2b8b7a50111ef395bf1c1d5be11e6e167ac018125055da=
a8b5c2317ae131ab"
=20
 inherit autotools-brokensep update-rc.d systemd useradd
=20
--=20
2.17.1


