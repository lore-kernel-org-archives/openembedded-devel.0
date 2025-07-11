Return-Path: <Moritz.Haase@bmw.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1123DC83F24
	for <webhook@archiver.kernel.org>; Fri, 11 Jul 2025 10:01:37 +0000 (UTC)
Received: from esa9.hc324-48.eu.iphmx.com (esa9.hc324-48.eu.iphmx.com [207.54.69.27])
 by mx.groups.io with SMTP id smtpd.web11.10146.1752228087130454326
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 11 Jul 2025 03:01:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@bmw.de header.s=mailing1 header.b=ptV2Jn+Q;
 spf=pass (domain: bmw.de, ip: 207.54.69.27, mailfrom: prvs=28004f72d=moritz.haase@bmw.de)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=bmw.de; i=@bmw.de; q=dns/txt; s=mailing1;
  t=1752228088; x=1783764088;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=5wywAwRfOFskbBNBOI7cg5k+1+20skDhERG19P1Me2E=;
  b=ptV2Jn+QCbv5Tkd9QPt9t4OZr4YW/mdHck2aDxmhAcsYt/G5nTteRd7U
   iiSm11/68OqJh5E6N55nYKDJ46xrmhWgYT09E4cPPAV4TItfTEgqfW6HQ
   sfKOR1CfiEVm9w7v4cyfzAFWHud4ZazKJu3H8DPEFY5N2ynbkJrcNE2cA
   s=;
X-CSE-ConnectionGUID: ey6g4AShR+GxwRzy77ZZKA==
X-CSE-MsgGUID: c9FRm79aQpu4eEQKYm0Rfw==
Received: from esagw6.bmwgroup.com (HELO esagw6.muc) ([160.46.252.49]) by
 esa9.hc324-48.eu.iphmx.com with ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from unknown (HELO esabb3.muc) ([10.31.187.134]) by esagw6.muc with
 ESMTP/TLS; 11 Jul 2025 12:01:25 +0200
Received: from smucmp12a.bmwgroup.net (HELO smucmp12a.europe.bmw.corp) ([10.30.13.95])
 by esabb3.muc with ESMTP/TLS; 11 Jul 2025 12:01:24 +0200
Received: from q1054628.de-cci.bmwgroup.net (10.30.85.215) by
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9) with Microsoft SMTP
 Server (version=TLS; Fri, 11 Jul 2025 12:01:23 +0200
X-CSE-ConnectionGUID: ijGaBYvsSSq33X8xo0RNyA==
X-CSE-MsgGUID: 41XOzwPnQPSpvSLEya1qYg==
X-CSE-ConnectionGUID: E1yMPyrQRiG9qWzQs7xPFg==
X-CSE-MsgGUID: LM5WYV+pTau6VzK0jIiHSA==
From: Moritz Haase <Moritz.Haase@bmw.de>
To: <openembedded-devel@lists.openembedded.org>
CC: Moritz Haase <Moritz.Haase@bmw.de>
Subject: [meta-oe][PATCH 02/10] avro-c: upgrade 1.11.3 -> 1.12.0
Date: Fri, 11 Jul 2025 12:00:19 +0200
Message-ID: <20250711100052.255467-3-Moritz.Haase@bmw.de>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <20250711100052.255467-1-Moritz.Haase@bmw.de>
References: <20250711100052.255467-1-Moritz.Haase@bmw.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SMUCMP12E.europe.bmw.corp (2a03:1e80:a15:58f::1:320) To
 smucmp12a.europe.bmw.corp (2a03:1e80:a15:58f::1:9)
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 11 Jul 2025 10:01:37 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/118437

New version includes support to build against CMake 4+, see [0].

Release notes are available at [1].

[0]: https://github.com/apache/avro/pull/2796
[1]: https://github.com/apache/avro/releases/tag/release-1.12.0

Signed-off-by: Moritz Haase <Moritz.Haase@bmw.de>
---
 ...-Fix-typos-in-docs-and-examples-2795.patch |  59 ---
 ...O-3960-C-Fix-st-ANYARGS-warning-2798.patch | 386 ------------------
 .../{avro-c_1.11.3.bb => avro-c_1.12.0.bb}    |   8 +-
 3 files changed, 3 insertions(+), 450 deletions(-)
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch
 delete mode 100644 meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch
 rename meta-oe/recipes-support/avro/{avro-c_1.11.3.bb => avro-c_1.12.0.bb} (60%)

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch b/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch
deleted file mode 100644
index bfe2ea6367..0000000000
--- a/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch
+++ /dev/null
@@ -1,59 +0,0 @@
-From 52f051dbeefad0b7e73187becad6c33747b047d3 Mon Sep 17 00:00:00 2001
-From: Sahil Kang <sahil.kang@asilaycomputing.com>
-Date: Mon, 11 Mar 2024 03:01:21 -0700
-Subject: [PATCH] AVRO-3957: [C] Fix typos in docs and examples (#2795)
-
-* AVRO-3957: [C] Fix misformatted type in docs
-
-Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
-Signed-off-by: Sahil Kang <sahilkang@google.com>
-
-* AVRO-3957: [C] Fix type in quickstop example
-
-This removes the following warning:
-
-  avro/lang/c/examples/quickstop.c:123:40: warning: incompatible pointer types passing 'int32_t **' (aka 'int **') to parameter of type
-        'const char **' [-Wincompatible-pointer-types]
-                          avro_value_get_string(&first_value, &p, &size);
-
-Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
-Signed-off-by: Sahil Kang <sahilkang@google.com>
-
----------
-
-Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
-Signed-off-by: Sahil Kang <sahilkang@google.com>
-
-Upstream-Status: Backport [52f051dbee AVRO-3957: [C] Fix typos in docs and examples (#2795)]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- lang/c/docs/index.txt       | 2 +-
- lang/c/examples/quickstop.c | 2 +-
- 2 files changed, 2 insertions(+), 2 deletions(-)
-
-diff --git a/lang/c/docs/index.txt b/lang/c/docs/index.txt
-index a439a0526..df16f9d96 100644
---- a/lang/c/docs/index.txt
-+++ b/lang/c/docs/index.txt
-@@ -178,7 +178,7 @@ different versions of the Avro library.  That means that it's really
- only safe to use these hash values internally within the context of a
- single execution of a single application.
- 
--The +reset+ method “clears out” an +avro_value_t instance, making sure
-+The +reset+ method “clears out” an +avro_value_t+ instance, making sure
- that it's ready to accept the contents of a new value.  For scalars,
- this is usually a no-op, since the new value will just overwrite the old
- one.  For arrays and maps, this removes any existing elements from the
-diff --git a/lang/c/examples/quickstop.c b/lang/c/examples/quickstop.c
-index ff9e97005..b26dad10c 100644
---- a/lang/c/examples/quickstop.c
-+++ b/lang/c/examples/quickstop.c
-@@ -107,7 +107,7 @@ int print_person(avro_file_reader_t db, avro_schema_t reader_schema)
- 	if (rval == 0) {
- 		int64_t id;
- 		int32_t age;
--		int32_t *p;
-+		const char *p;
- 		size_t size;
- 		avro_value_t id_value;
- 		avro_value_t first_value;
diff --git a/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch b/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch
deleted file mode 100644
index 8f7bbc868a..0000000000
--- a/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch
+++ /dev/null
@@ -1,386 +0,0 @@
-From 03ea96b48f7e668abd9f3b33799635e4e50a526c Mon Sep 17 00:00:00 2001
-From: Sahil Kang <sahilkang@google.com>
-Date: Mon, 25 Mar 2024 04:41:41 -0700
-Subject: [PATCH] AVRO-3960: [C] Fix st ANYARGS warning (#2798)
-
-This removes the following warning:
-
-  avro/lang/c/src/st.c:240:13: warning: passing arguments to a function without a prototype is deprecated in all versions of C and is not
-        supported in C2x [-Wdeprecated-non-prototype]
-          hash_val = do_hash(key, table);
-
-Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
-Signed-off-by: Sahil Kang <sahilkang@google.com>
-
-Upstream-Status: Backport [03ea96b48f AVRO-3960: [C] Fix st ANYARGS warning (#2798)]
-Signed-off-by: mark.yang <mark.yang@lge.com>
----
- lang/c/src/datum.c          | 12 ++++++------
- lang/c/src/datum_equal.c    |  4 ++--
- lang/c/src/datum_size.c     |  2 +-
- lang/c/src/datum_validate.c |  2 +-
- lang/c/src/memoize.c        |  6 +++---
- lang/c/src/schema.c         | 10 +++++-----
- lang/c/src/st.c             | 34 ++++++++++++++++++----------------
- lang/c/src/st.h             | 22 +++++++++-------------
- 8 files changed, 45 insertions(+), 47 deletions(-)
-
-diff --git a/lang/c/src/datum.c b/lang/c/src/datum.c
-index 53dfa5ca0..5307c7a83 100644
---- a/lang/c/src/datum.c
-+++ b/lang/c/src/datum.c
-@@ -1095,7 +1095,7 @@ static void avro_datum_free(avro_datum_t datum)
- 				record = avro_datum_to_record(datum);
- 				avro_schema_decref(record->schema);
- 				st_foreach(record->fields_byname,
--					   HASH_FUNCTION_CAST char_datum_free_foreach, 0);
-+					   (hash_function_foreach) char_datum_free_foreach, 0);
- 				st_free_table(record->field_order);
- 				st_free_table(record->fields_byname);
- 				avro_freet(struct avro_record_datum_t, record);
-@@ -1123,7 +1123,7 @@ static void avro_datum_free(avro_datum_t datum)
- 				struct avro_map_datum_t *map;
- 				map = avro_datum_to_map(datum);
- 				avro_schema_decref(map->schema);
--				st_foreach(map->map, HASH_FUNCTION_CAST char_datum_free_foreach,
-+				st_foreach(map->map, (hash_function_foreach) char_datum_free_foreach,
- 					   0);
- 				st_free_table(map->map);
- 				st_free_table(map->indices_by_key);
-@@ -1135,7 +1135,7 @@ static void avro_datum_free(avro_datum_t datum)
- 				struct avro_array_datum_t *array;
- 				array = avro_datum_to_array(datum);
- 				avro_schema_decref(array->schema);
--				st_foreach(array->els, HASH_FUNCTION_CAST array_free_foreach, 0);
-+				st_foreach(array->els, (hash_function_foreach) array_free_foreach, 0);
- 				st_free_table(array->els);
- 				avro_freet(struct avro_array_datum_t, array);
- 			}
-@@ -1183,7 +1183,7 @@ avro_datum_reset(avro_datum_t datum)
- 		{
- 			struct avro_array_datum_t *array;
- 			array = avro_datum_to_array(datum);
--			st_foreach(array->els, HASH_FUNCTION_CAST array_free_foreach, 0);
-+			st_foreach(array->els, (hash_function_foreach) array_free_foreach, 0);
- 			st_free_table(array->els);
- 
- 			rval = avro_init_array(array);
-@@ -1198,7 +1198,7 @@ avro_datum_reset(avro_datum_t datum)
- 		{
- 			struct avro_map_datum_t *map;
- 			map = avro_datum_to_map(datum);
--			st_foreach(map->map, HASH_FUNCTION_CAST char_datum_free_foreach, 0);
-+			st_foreach(map->map, (hash_function_foreach) char_datum_free_foreach, 0);
- 			st_free_table(map->map);
- 			st_free_table(map->indices_by_key);
- 			st_free_table(map->keys_by_index);
-@@ -1217,7 +1217,7 @@ avro_datum_reset(avro_datum_t datum)
- 			record = avro_datum_to_record(datum);
- 			rval = 0;
- 			st_foreach(record->fields_byname,
--				   HASH_FUNCTION_CAST datum_reset_foreach, (st_data_t) &rval);
-+				   (hash_function_foreach) datum_reset_foreach, (st_data_t) &rval);
- 			return rval;
- 		}
- 
-diff --git a/lang/c/src/datum_equal.c b/lang/c/src/datum_equal.c
-index 3875bea04..7e7c9b940 100644
---- a/lang/c/src/datum_equal.c
-+++ b/lang/c/src/datum_equal.c
-@@ -78,7 +78,7 @@ static int map_equal(struct avro_map_datum_t *a, struct avro_map_datum_t *b)
- 	if (a->map->num_entries != b->map->num_entries) {
- 		return 0;
- 	}
--	st_foreach(a->map, HASH_FUNCTION_CAST st_equal_foreach, (st_data_t) & args);
-+	st_foreach(a->map, (hash_function_foreach) st_equal_foreach, (st_data_t) & args);
- 	return args.rval;
- }
- 
-@@ -93,7 +93,7 @@ static int record_equal(struct avro_record_datum_t *a,
- 	if (a->fields_byname->num_entries != b->fields_byname->num_entries) {
- 		return 0;
- 	}
--	st_foreach(a->fields_byname, HASH_FUNCTION_CAST st_equal_foreach, (st_data_t) & args);
-+	st_foreach(a->fields_byname, (hash_function_foreach) st_equal_foreach, (st_data_t) & args);
- 	return args.rval;
- }
- 
-diff --git a/lang/c/src/datum_size.c b/lang/c/src/datum_size.c
-index be9b98004..3877f3138 100644
---- a/lang/c/src/datum_size.c
-+++ b/lang/c/src/datum_size.c
-@@ -126,7 +126,7 @@ size_map(avro_writer_t writer, const avro_encoding_t * enc,
- 	if (datum->map->num_entries) {
- 		size_accum(rval, size,
- 			   enc->size_long(writer, datum->map->num_entries));
--		st_foreach(datum->map, HASH_FUNCTION_CAST size_map_foreach, (st_data_t) & args);
-+		st_foreach(datum->map, (hash_function_foreach) size_map_foreach, (st_data_t) & args);
- 		size += args.size;
- 	}
- 	if (!args.rval) {
-diff --git a/lang/c/src/datum_validate.c b/lang/c/src/datum_validate.c
-index 6167bd63f..e997d3067 100644
---- a/lang/c/src/datum_validate.c
-+++ b/lang/c/src/datum_validate.c
-@@ -123,7 +123,7 @@ avro_schema_datum_validate(avro_schema_t expected_schema, avro_datum_t datum)
- 			    { avro_schema_to_map(expected_schema)->values, 1
- 			};
- 			st_foreach(avro_datum_to_map(datum)->map,
--				   HASH_FUNCTION_CAST schema_map_validate_foreach,
-+				   (hash_function_foreach) schema_map_validate_foreach,
- 				   (st_data_t) & vst);
- 			return vst.rval;
- 		}
-diff --git a/lang/c/src/memoize.c b/lang/c/src/memoize.c
-index 933fecbd0..e3602884d 100644
---- a/lang/c/src/memoize.c
-+++ b/lang/c/src/memoize.c
-@@ -52,8 +52,8 @@ avro_memoize_key_hash(avro_memoize_key_t *a)
- 
- 
- static struct st_hash_type  avro_memoize_hash_type = {
--	HASH_FUNCTION_CAST avro_memoize_key_cmp,
--	HASH_FUNCTION_CAST avro_memoize_key_hash
-+	(hash_function_compare) avro_memoize_key_cmp,
-+	(hash_function_hash) avro_memoize_key_hash
- };
- 
- 
-@@ -78,7 +78,7 @@ avro_memoize_free_key(avro_memoize_key_t *key, void *result, void *dummy)
- void
- avro_memoize_done(avro_memoize_t *mem)
- {
--	st_foreach((st_table *) mem->cache, HASH_FUNCTION_CAST avro_memoize_free_key, 0);
-+	st_foreach((st_table *) mem->cache, (hash_function_foreach) avro_memoize_free_key, 0);
- 	st_free_table((st_table *) mem->cache);
- 	memset(mem, 0, sizeof(avro_memoize_t));
- }
-diff --git a/lang/c/src/schema.c b/lang/c/src/schema.c
-index 2acad51a1..a4d8e9f89 100644
---- a/lang/c/src/schema.c
-+++ b/lang/c/src/schema.c
-@@ -137,7 +137,7 @@ static void avro_schema_free(avro_schema_t schema)
- 				if (record->space) {
- 					avro_str_free(record->space);
- 				}
--				st_foreach(record->fields, HASH_FUNCTION_CAST record_free_foreach,
-+				st_foreach(record->fields, (hash_function_foreach) record_free_foreach,
- 					   0);
- 				st_free_table(record->fields_byname);
- 				st_free_table(record->fields);
-@@ -152,7 +152,7 @@ static void avro_schema_free(avro_schema_t schema)
- 				if (enump->space) {
- 					avro_str_free(enump->space);
- 				}
--				st_foreach(enump->symbols, HASH_FUNCTION_CAST enum_free_foreach,
-+				st_foreach(enump->symbols, (hash_function_foreach) enum_free_foreach,
- 					   0);
- 				st_free_table(enump->symbols);
- 				st_free_table(enump->symbols_byname);
-@@ -189,7 +189,7 @@ static void avro_schema_free(avro_schema_t schema)
- 		case AVRO_UNION:{
- 				struct avro_union_schema_t *unionp;
- 				unionp = avro_schema_to_union(schema);
--				st_foreach(unionp->branches, HASH_FUNCTION_CAST union_free_foreach,
-+				st_foreach(unionp->branches, (hash_function_foreach) union_free_foreach,
- 					   0);
- 				st_free_table(unionp->branches);
- 				st_free_table(unionp->branches_byname);
-@@ -1239,7 +1239,7 @@ avro_schema_from_json_root(json_t *root, avro_schema_t *schema)
- 	/* json_dumpf(root, stderr, 0); */
- 	rval = avro_schema_from_json_t(root, schema, named_schemas, NULL);
- 	json_decref(root);
--	st_foreach(named_schemas, HASH_FUNCTION_CAST named_schema_free_foreach, 0);
-+	st_foreach(named_schemas, (hash_function_foreach) named_schema_free_foreach, 0);
- 	st_free_table(named_schemas);
- 	return rval;
- }
-@@ -1455,7 +1455,7 @@ avro_schema_t avro_schema_copy(avro_schema_t schema)
- 	}
- 
- 	new_schema = avro_schema_copy_root(schema, named_schemas);
--	st_foreach(named_schemas, HASH_FUNCTION_CAST named_schema_free_foreach, 0);
-+	st_foreach(named_schemas, (hash_function_foreach) named_schema_free_foreach, 0);
- 	st_free_table(named_schemas);
- 	return new_schema;
- }
-diff --git a/lang/c/src/st.c b/lang/c/src/st.c
-index 27578289e..8437777cb 100644
---- a/lang/c/src/st.c
-+++ b/lang/c/src/st.c
-@@ -39,8 +39,8 @@ struct st_table_entry {
- static int numcmp(long, long);
- static int numhash(long);
- static struct st_hash_type type_numhash = {
--	HASH_FUNCTION_CAST numcmp,
--	HASH_FUNCTION_CAST numhash
-+	(hash_function_compare) numcmp,
-+	(hash_function_hash) numhash
- };
- 
- /*
-@@ -48,8 +48,8 @@ static struct st_hash_type type_numhash = {
-  */
- static int strhash(const char *);
- static struct st_hash_type type_strhash = {
--	HASH_FUNCTION_CAST strcmp,
--	HASH_FUNCTION_CAST strhash
-+	(hash_function_compare) strcmp,
-+	(hash_function_hash) strhash
- };
- 
- static void rehash(st_table *);
-@@ -212,7 +212,7 @@ void st_free_table(st_table *table)
- }
- 
- #define PTR_NOT_EQUAL(table, ptr, hash_val, key) \
--((ptr) != 0 && (ptr->hash != (hash_val) || !EQUAL((table), (key), (ptr)->key)))
-+((ptr) != 0 && (ptr->hash != (hash_val) || !EQUAL((table), (void*) (key), (void*) (ptr)->key)))
- 
- #ifdef HASH_LOG
- #define COLLISION collision++
-@@ -237,7 +237,7 @@ int st_lookup(st_table *table, register st_data_t key, st_data_t *value)
- 	unsigned int hash_val, bin_pos;
- 	register st_table_entry *ptr;
- 
--	hash_val = do_hash(key, table);
-+	hash_val = do_hash((void*) key, table);
- 	FIND_ENTRY(table, ptr, hash_val, bin_pos);
- 
- 	if (ptr == 0) {
-@@ -272,7 +272,7 @@ int st_insert(register st_table *table, register st_data_t key, st_data_t value)
- 	unsigned int hash_val, bin_pos;
- 	register st_table_entry *ptr;
- 
--	hash_val = do_hash(key, table);
-+	hash_val = do_hash((void*) key, table);
- 	FIND_ENTRY(table, ptr, hash_val, bin_pos);
- 
- 	if (ptr == 0) {
-@@ -288,7 +288,7 @@ void st_add_direct(st_table *table,st_data_t key,st_data_t value)
- {
- 	unsigned int hash_val, bin_pos;
- 
--	hash_val = do_hash(key, table);
-+	hash_val = do_hash((void*) key, table);
- 	bin_pos = hash_val % table->num_bins;
- 	ADD_DIRECT(table, key, value, hash_val, bin_pos);
- }
-@@ -363,7 +363,7 @@ int st_delete(register st_table *table,register st_data_t *key,st_data_t *value)
- 	st_table_entry *tmp;
- 	register st_table_entry *ptr;
- 
--	hash_val = do_hash_bin(*key, table);
-+	hash_val = do_hash_bin((void*) *key, table);
- 	ptr = table->bins[hash_val];
- 
- 	if (ptr == 0) {
-@@ -372,7 +372,7 @@ int st_delete(register st_table *table,register st_data_t *key,st_data_t *value)
- 		return 0;
- 	}
- 
--	if (EQUAL(table, *key, ptr->key)) {
-+	if (EQUAL(table, (void*) *key, (void*) ptr->key)) {
- 		table->bins[hash_val] = ptr->next;
- 		table->num_entries--;
- 		if (value != 0)
-@@ -383,7 +383,7 @@ int st_delete(register st_table *table,register st_data_t *key,st_data_t *value)
- 	}
- 
- 	for (; ptr->next != 0; ptr = ptr->next) {
--		if (EQUAL(table, ptr->next->key, *key)) {
-+		if (EQUAL(table, (void*) ptr->next->key, (void*) *key)) {
- 			tmp = ptr->next;
- 			ptr->next = ptr->next->next;
- 			table->num_entries--;
-@@ -403,7 +403,7 @@ int st_delete_safe(register st_table *table,register st_data_t *key,st_data_t *v
- 	unsigned int hash_val;
- 	register st_table_entry *ptr;
- 
--	hash_val = do_hash_bin(*key, table);
-+	hash_val = do_hash_bin((void*) *key, table);
- 	ptr = table->bins[hash_val];
- 
- 	if (ptr == 0) {
-@@ -413,7 +413,7 @@ int st_delete_safe(register st_table *table,register st_data_t *key,st_data_t *v
- 	}
- 
- 	for (; ptr != 0; ptr = ptr->next) {
--		if ((ptr->key != never) && EQUAL(table, ptr->key, *key)) {
-+		if ((ptr->key != never) && EQUAL(table, (void*) ptr->key, (void*) *key)) {
- 			table->num_entries--;
- 			*key = ptr->key;
- 			if (value != 0)
-@@ -439,11 +439,11 @@ void st_cleanup_safe(st_table *table,st_data_t never)
- {
- 	int num_entries = table->num_entries;
- 
--	st_foreach(table, HASH_FUNCTION_CAST delete_never, never);
-+	st_foreach(table, (hash_function_foreach) delete_never, never);
- 	table->num_entries = num_entries;
- }
- 
--int st_foreach(st_table *table,int (*func) (ANYARGS),st_data_t arg)
-+int st_foreach(st_table *table,int (*func) (void*, void*, void*),st_data_t arg)
- {
- 	st_table_entry *ptr, *last, *tmp;
- 	enum st_retval retval;
-@@ -452,7 +452,9 @@ int st_foreach(st_table *table,int (*func) (ANYARGS),st_data_t arg)
- 	for (i = 0; i < table->num_bins; i++) {
- 		last = 0;
- 		for (ptr = table->bins[i]; ptr != 0;) {
--			retval = (enum st_retval) (*func) (ptr->key, ptr->record, arg);
-+			retval = (enum st_retval) (*func) ((void*) ptr->key,
-+							   (void*) ptr->record,
-+							   (void*) arg);
- 			switch (retval) {
- 			case ST_CHECK:	/* check if hash is modified during
- 					 * iteration */
-diff --git a/lang/c/src/st.h b/lang/c/src/st.h
-index cf8a22491..93da018bd 100644
---- a/lang/c/src/st.h
-+++ b/lang/c/src/st.h
-@@ -20,26 +20,22 @@ extern "C" {
- 
- #pragma GCC visibility push(hidden)
- 
--#ifndef ANYARGS
-- #ifdef __cplusplus
--   #define ANYARGS ...
-- #else
--   #define ANYARGS
-- #endif
--#endif
--
- #ifdef _WIN32
--  #define HASH_FUNCTION_CAST (int (__cdecl *)(ANYARGS))
-+  typedef int (__cdecl *hash_function_compare)(void*, void*);
-+  typedef int (__cdecl *hash_function_hash)(void*);
-+  typedef int (__cdecl *hash_function_foreach)(void*, void*, void*);
- #else
--  #define HASH_FUNCTION_CAST
-+  typedef int (*hash_function_compare)(void*, void*);
-+  typedef int (*hash_function_hash)(void*);
-+  typedef int (*hash_function_foreach)(void*, void*, void*);
- #endif
- 
- typedef uintptr_t st_data_t;
- typedef struct st_table st_table;
- 
- struct st_hash_type {
--  int (*compare) (ANYARGS);
--  int (*hash) (ANYARGS);
-+  hash_function_compare compare;
-+  hash_function_hash hash;
- };
- 
- struct st_table {
-@@ -67,7 +63,7 @@ int st_delete _((st_table *, st_data_t *, st_data_t *));
- int st_delete_safe _((st_table *, st_data_t *, st_data_t *, st_data_t));
- int st_insert _((st_table *, st_data_t, st_data_t));
- int st_lookup _((st_table *, st_data_t, st_data_t *));
--int st_foreach _((st_table *, int (*)(ANYARGS), st_data_t));
-+int st_foreach _((st_table *, hash_function_foreach, st_data_t));
- void st_add_direct _((st_table *, st_data_t, st_data_t));
- void st_free_table _((st_table *));
- void st_cleanup_safe _((st_table *, st_data_t));
diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb b/meta-oe/recipes-support/avro/avro-c_1.12.0.bb
similarity index 60%
rename from meta-oe/recipes-support/avro/avro-c_1.11.3.bb
rename to meta-oe/recipes-support/avro/avro-c_1.12.0.bb
index f7da323710..3876f5e308 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.12.0.bb
@@ -7,12 +7,10 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 
 DEPENDS = "jansson zlib xz"
 
-BRANCH = "branch-1.11"
-SRCREV = "579a36762293fa4c9f2831e27e7af7713a0838a0"
+BRANCH = "branch-1.12"
+SRCREV = "8c27801dc8d42ccc00997f25c0b8f45f8d4a233e"
 SRC_URI = " \
-    git://github.com/apache/avro;branch=${BRANCH};protocol=https \
-    file://0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch;patchdir=../.. \
-    file://0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch;patchdir=../.. \
+    git://github.com/apache/avro;branch=${BRANCH};protocol=https;tag=release-${PV} \
 "
 S = "${UNPACKDIR}/${BP}/lang/c"
 

