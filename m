Return-Path: <mark.yang@lge.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC09C369A1
	for <webhook@archiver.kernel.org>; Tue,  8 Apr 2025 09:41:29 +0000 (UTC)
Received: from lgeamrelo11.lge.com (lgeamrelo11.lge.com [156.147.23.52])
 by mx.groups.io with SMTP id smtpd.web11.70969.1744105282570668713
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 08 Apr 2025 02:41:23 -0700
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: lge.com, ip: 156.147.23.52, mailfrom: mark.yang@lge.com)
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.52 with ESMTP; 8 Apr 2025 18:41:20 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: mark.yang@lge.com
Received: from unknown (HELO markyang..) (10.177.120.37)
	by 156.147.1.121 with ESMTP; 8 Apr 2025 18:41:20 +0900
X-Original-SENDERIP: 10.177.120.37
X-Original-MAILFROM: mark.yang@lge.com
From: mark.yang@lge.com
To: openembedded-devel@lists.openembedded.org
Cc: "mark.yang" <mark.yang@lge.com>
Subject: [meta-oe][PATCH] avro-c: fix error with gcc-15
Date: Tue,  8 Apr 2025 18:41:19 +0900
Message-Id: <20250408094119.1702066-1-mark.yang@lge.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Tue, 08 Apr 2025 09:41:29 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/116696

From: "mark.yang" <mark.yang@lge.com>

* backport fix from:
  https://github.com/apache/avro/pull/2795
  https://github.com/apache/avro/pull/2798
  to fix:
  http://errors.yoctoproject.org/Errors/Details/851184/
TOPDIR/tmp/work/core2-64-oe-linux/avro-c/1.11.3/git/lang/c/src/st.c:442:46: warning: passing argument 2 of 'st_foreach' from incompatible pointer type [-Wincompatible-pointer-types]
  442 |         st_foreach(table, HASH_FUNCTION_CAST delete_never, never);
      |                                              ^~~~~~~~~~~~
      |                                              |
      |                                              int (*)(st_data_t,  st_data_t,  st_data_t) {aka int (*)(long unsigned int,  long unsigned int,  long unsigned int)}
Signed-off-by: mark.yang <mark.yang@lge.com>
---
 ...-Fix-typos-in-docs-and-examples-2795.patch |  59 +++
 ...O-3960-C-Fix-st-ANYARGS-warning-2798.patch | 386 ++++++++++++++++++
 meta-oe/recipes-support/avro/avro-c_1.11.3.bb |  16 +-
 3 files changed, 451 insertions(+), 10 deletions(-)
 create mode 100644 meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch
 create mode 100644 meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch

diff --git a/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch b/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch
new file mode 100644
index 0000000000..bfe2ea6367
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch
@@ -0,0 +1,59 @@
+From 52f051dbeefad0b7e73187becad6c33747b047d3 Mon Sep 17 00:00:00 2001
+From: Sahil Kang <sahil.kang@asilaycomputing.com>
+Date: Mon, 11 Mar 2024 03:01:21 -0700
+Subject: [PATCH] AVRO-3957: [C] Fix typos in docs and examples (#2795)
+
+* AVRO-3957: [C] Fix misformatted type in docs
+
+Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
+Signed-off-by: Sahil Kang <sahilkang@google.com>
+
+* AVRO-3957: [C] Fix type in quickstop example
+
+This removes the following warning:
+
+  avro/lang/c/examples/quickstop.c:123:40: warning: incompatible pointer types passing 'int32_t **' (aka 'int **') to parameter of type
+        'const char **' [-Wincompatible-pointer-types]
+                          avro_value_get_string(&first_value, &p, &size);
+
+Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
+Signed-off-by: Sahil Kang <sahilkang@google.com>
+
+---------
+
+Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
+Signed-off-by: Sahil Kang <sahilkang@google.com>
+
+Upstream-Status: Backport [52f051dbee AVRO-3957: [C] Fix typos in docs and examples (#2795)]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ lang/c/docs/index.txt       | 2 +-
+ lang/c/examples/quickstop.c | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/lang/c/docs/index.txt b/lang/c/docs/index.txt
+index a439a0526..df16f9d96 100644
+--- a/lang/c/docs/index.txt
++++ b/lang/c/docs/index.txt
+@@ -178,7 +178,7 @@ different versions of the Avro library.  That means that it's really
+ only safe to use these hash values internally within the context of a
+ single execution of a single application.
+ 
+-The +reset+ method “clears out” an +avro_value_t instance, making sure
++The +reset+ method “clears out” an +avro_value_t+ instance, making sure
+ that it's ready to accept the contents of a new value.  For scalars,
+ this is usually a no-op, since the new value will just overwrite the old
+ one.  For arrays and maps, this removes any existing elements from the
+diff --git a/lang/c/examples/quickstop.c b/lang/c/examples/quickstop.c
+index ff9e97005..b26dad10c 100644
+--- a/lang/c/examples/quickstop.c
++++ b/lang/c/examples/quickstop.c
+@@ -107,7 +107,7 @@ int print_person(avro_file_reader_t db, avro_schema_t reader_schema)
+ 	if (rval == 0) {
+ 		int64_t id;
+ 		int32_t age;
+-		int32_t *p;
++		const char *p;
+ 		size_t size;
+ 		avro_value_t id_value;
+ 		avro_value_t first_value;
diff --git a/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch b/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch
new file mode 100644
index 0000000000..8f7bbc868a
--- /dev/null
+++ b/meta-oe/recipes-support/avro/avro-c/0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch
@@ -0,0 +1,386 @@
+From 03ea96b48f7e668abd9f3b33799635e4e50a526c Mon Sep 17 00:00:00 2001
+From: Sahil Kang <sahilkang@google.com>
+Date: Mon, 25 Mar 2024 04:41:41 -0700
+Subject: [PATCH] AVRO-3960: [C] Fix st ANYARGS warning (#2798)
+
+This removes the following warning:
+
+  avro/lang/c/src/st.c:240:13: warning: passing arguments to a function without a prototype is deprecated in all versions of C and is not
+        supported in C2x [-Wdeprecated-non-prototype]
+          hash_val = do_hash(key, table);
+
+Signed-off-by: Sahil Kang <sahil.kang@asilaycomputing.com>
+Signed-off-by: Sahil Kang <sahilkang@google.com>
+
+Upstream-Status: Backport [03ea96b48f AVRO-3960: [C] Fix st ANYARGS warning (#2798)]
+Signed-off-by: mark.yang <mark.yang@lge.com>
+---
+ lang/c/src/datum.c          | 12 ++++++------
+ lang/c/src/datum_equal.c    |  4 ++--
+ lang/c/src/datum_size.c     |  2 +-
+ lang/c/src/datum_validate.c |  2 +-
+ lang/c/src/memoize.c        |  6 +++---
+ lang/c/src/schema.c         | 10 +++++-----
+ lang/c/src/st.c             | 34 ++++++++++++++++++----------------
+ lang/c/src/st.h             | 22 +++++++++-------------
+ 8 files changed, 45 insertions(+), 47 deletions(-)
+
+diff --git a/lang/c/src/datum.c b/lang/c/src/datum.c
+index 53dfa5ca0..5307c7a83 100644
+--- a/lang/c/src/datum.c
++++ b/lang/c/src/datum.c
+@@ -1095,7 +1095,7 @@ static void avro_datum_free(avro_datum_t datum)
+ 				record = avro_datum_to_record(datum);
+ 				avro_schema_decref(record->schema);
+ 				st_foreach(record->fields_byname,
+-					   HASH_FUNCTION_CAST char_datum_free_foreach, 0);
++					   (hash_function_foreach) char_datum_free_foreach, 0);
+ 				st_free_table(record->field_order);
+ 				st_free_table(record->fields_byname);
+ 				avro_freet(struct avro_record_datum_t, record);
+@@ -1123,7 +1123,7 @@ static void avro_datum_free(avro_datum_t datum)
+ 				struct avro_map_datum_t *map;
+ 				map = avro_datum_to_map(datum);
+ 				avro_schema_decref(map->schema);
+-				st_foreach(map->map, HASH_FUNCTION_CAST char_datum_free_foreach,
++				st_foreach(map->map, (hash_function_foreach) char_datum_free_foreach,
+ 					   0);
+ 				st_free_table(map->map);
+ 				st_free_table(map->indices_by_key);
+@@ -1135,7 +1135,7 @@ static void avro_datum_free(avro_datum_t datum)
+ 				struct avro_array_datum_t *array;
+ 				array = avro_datum_to_array(datum);
+ 				avro_schema_decref(array->schema);
+-				st_foreach(array->els, HASH_FUNCTION_CAST array_free_foreach, 0);
++				st_foreach(array->els, (hash_function_foreach) array_free_foreach, 0);
+ 				st_free_table(array->els);
+ 				avro_freet(struct avro_array_datum_t, array);
+ 			}
+@@ -1183,7 +1183,7 @@ avro_datum_reset(avro_datum_t datum)
+ 		{
+ 			struct avro_array_datum_t *array;
+ 			array = avro_datum_to_array(datum);
+-			st_foreach(array->els, HASH_FUNCTION_CAST array_free_foreach, 0);
++			st_foreach(array->els, (hash_function_foreach) array_free_foreach, 0);
+ 			st_free_table(array->els);
+ 
+ 			rval = avro_init_array(array);
+@@ -1198,7 +1198,7 @@ avro_datum_reset(avro_datum_t datum)
+ 		{
+ 			struct avro_map_datum_t *map;
+ 			map = avro_datum_to_map(datum);
+-			st_foreach(map->map, HASH_FUNCTION_CAST char_datum_free_foreach, 0);
++			st_foreach(map->map, (hash_function_foreach) char_datum_free_foreach, 0);
+ 			st_free_table(map->map);
+ 			st_free_table(map->indices_by_key);
+ 			st_free_table(map->keys_by_index);
+@@ -1217,7 +1217,7 @@ avro_datum_reset(avro_datum_t datum)
+ 			record = avro_datum_to_record(datum);
+ 			rval = 0;
+ 			st_foreach(record->fields_byname,
+-				   HASH_FUNCTION_CAST datum_reset_foreach, (st_data_t) &rval);
++				   (hash_function_foreach) datum_reset_foreach, (st_data_t) &rval);
+ 			return rval;
+ 		}
+ 
+diff --git a/lang/c/src/datum_equal.c b/lang/c/src/datum_equal.c
+index 3875bea04..7e7c9b940 100644
+--- a/lang/c/src/datum_equal.c
++++ b/lang/c/src/datum_equal.c
+@@ -78,7 +78,7 @@ static int map_equal(struct avro_map_datum_t *a, struct avro_map_datum_t *b)
+ 	if (a->map->num_entries != b->map->num_entries) {
+ 		return 0;
+ 	}
+-	st_foreach(a->map, HASH_FUNCTION_CAST st_equal_foreach, (st_data_t) & args);
++	st_foreach(a->map, (hash_function_foreach) st_equal_foreach, (st_data_t) & args);
+ 	return args.rval;
+ }
+ 
+@@ -93,7 +93,7 @@ static int record_equal(struct avro_record_datum_t *a,
+ 	if (a->fields_byname->num_entries != b->fields_byname->num_entries) {
+ 		return 0;
+ 	}
+-	st_foreach(a->fields_byname, HASH_FUNCTION_CAST st_equal_foreach, (st_data_t) & args);
++	st_foreach(a->fields_byname, (hash_function_foreach) st_equal_foreach, (st_data_t) & args);
+ 	return args.rval;
+ }
+ 
+diff --git a/lang/c/src/datum_size.c b/lang/c/src/datum_size.c
+index be9b98004..3877f3138 100644
+--- a/lang/c/src/datum_size.c
++++ b/lang/c/src/datum_size.c
+@@ -126,7 +126,7 @@ size_map(avro_writer_t writer, const avro_encoding_t * enc,
+ 	if (datum->map->num_entries) {
+ 		size_accum(rval, size,
+ 			   enc->size_long(writer, datum->map->num_entries));
+-		st_foreach(datum->map, HASH_FUNCTION_CAST size_map_foreach, (st_data_t) & args);
++		st_foreach(datum->map, (hash_function_foreach) size_map_foreach, (st_data_t) & args);
+ 		size += args.size;
+ 	}
+ 	if (!args.rval) {
+diff --git a/lang/c/src/datum_validate.c b/lang/c/src/datum_validate.c
+index 6167bd63f..e997d3067 100644
+--- a/lang/c/src/datum_validate.c
++++ b/lang/c/src/datum_validate.c
+@@ -123,7 +123,7 @@ avro_schema_datum_validate(avro_schema_t expected_schema, avro_datum_t datum)
+ 			    { avro_schema_to_map(expected_schema)->values, 1
+ 			};
+ 			st_foreach(avro_datum_to_map(datum)->map,
+-				   HASH_FUNCTION_CAST schema_map_validate_foreach,
++				   (hash_function_foreach) schema_map_validate_foreach,
+ 				   (st_data_t) & vst);
+ 			return vst.rval;
+ 		}
+diff --git a/lang/c/src/memoize.c b/lang/c/src/memoize.c
+index 933fecbd0..e3602884d 100644
+--- a/lang/c/src/memoize.c
++++ b/lang/c/src/memoize.c
+@@ -52,8 +52,8 @@ avro_memoize_key_hash(avro_memoize_key_t *a)
+ 
+ 
+ static struct st_hash_type  avro_memoize_hash_type = {
+-	HASH_FUNCTION_CAST avro_memoize_key_cmp,
+-	HASH_FUNCTION_CAST avro_memoize_key_hash
++	(hash_function_compare) avro_memoize_key_cmp,
++	(hash_function_hash) avro_memoize_key_hash
+ };
+ 
+ 
+@@ -78,7 +78,7 @@ avro_memoize_free_key(avro_memoize_key_t *key, void *result, void *dummy)
+ void
+ avro_memoize_done(avro_memoize_t *mem)
+ {
+-	st_foreach((st_table *) mem->cache, HASH_FUNCTION_CAST avro_memoize_free_key, 0);
++	st_foreach((st_table *) mem->cache, (hash_function_foreach) avro_memoize_free_key, 0);
+ 	st_free_table((st_table *) mem->cache);
+ 	memset(mem, 0, sizeof(avro_memoize_t));
+ }
+diff --git a/lang/c/src/schema.c b/lang/c/src/schema.c
+index 2acad51a1..a4d8e9f89 100644
+--- a/lang/c/src/schema.c
++++ b/lang/c/src/schema.c
+@@ -137,7 +137,7 @@ static void avro_schema_free(avro_schema_t schema)
+ 				if (record->space) {
+ 					avro_str_free(record->space);
+ 				}
+-				st_foreach(record->fields, HASH_FUNCTION_CAST record_free_foreach,
++				st_foreach(record->fields, (hash_function_foreach) record_free_foreach,
+ 					   0);
+ 				st_free_table(record->fields_byname);
+ 				st_free_table(record->fields);
+@@ -152,7 +152,7 @@ static void avro_schema_free(avro_schema_t schema)
+ 				if (enump->space) {
+ 					avro_str_free(enump->space);
+ 				}
+-				st_foreach(enump->symbols, HASH_FUNCTION_CAST enum_free_foreach,
++				st_foreach(enump->symbols, (hash_function_foreach) enum_free_foreach,
+ 					   0);
+ 				st_free_table(enump->symbols);
+ 				st_free_table(enump->symbols_byname);
+@@ -189,7 +189,7 @@ static void avro_schema_free(avro_schema_t schema)
+ 		case AVRO_UNION:{
+ 				struct avro_union_schema_t *unionp;
+ 				unionp = avro_schema_to_union(schema);
+-				st_foreach(unionp->branches, HASH_FUNCTION_CAST union_free_foreach,
++				st_foreach(unionp->branches, (hash_function_foreach) union_free_foreach,
+ 					   0);
+ 				st_free_table(unionp->branches);
+ 				st_free_table(unionp->branches_byname);
+@@ -1239,7 +1239,7 @@ avro_schema_from_json_root(json_t *root, avro_schema_t *schema)
+ 	/* json_dumpf(root, stderr, 0); */
+ 	rval = avro_schema_from_json_t(root, schema, named_schemas, NULL);
+ 	json_decref(root);
+-	st_foreach(named_schemas, HASH_FUNCTION_CAST named_schema_free_foreach, 0);
++	st_foreach(named_schemas, (hash_function_foreach) named_schema_free_foreach, 0);
+ 	st_free_table(named_schemas);
+ 	return rval;
+ }
+@@ -1455,7 +1455,7 @@ avro_schema_t avro_schema_copy(avro_schema_t schema)
+ 	}
+ 
+ 	new_schema = avro_schema_copy_root(schema, named_schemas);
+-	st_foreach(named_schemas, HASH_FUNCTION_CAST named_schema_free_foreach, 0);
++	st_foreach(named_schemas, (hash_function_foreach) named_schema_free_foreach, 0);
+ 	st_free_table(named_schemas);
+ 	return new_schema;
+ }
+diff --git a/lang/c/src/st.c b/lang/c/src/st.c
+index 27578289e..8437777cb 100644
+--- a/lang/c/src/st.c
++++ b/lang/c/src/st.c
+@@ -39,8 +39,8 @@ struct st_table_entry {
+ static int numcmp(long, long);
+ static int numhash(long);
+ static struct st_hash_type type_numhash = {
+-	HASH_FUNCTION_CAST numcmp,
+-	HASH_FUNCTION_CAST numhash
++	(hash_function_compare) numcmp,
++	(hash_function_hash) numhash
+ };
+ 
+ /*
+@@ -48,8 +48,8 @@ static struct st_hash_type type_numhash = {
+  */
+ static int strhash(const char *);
+ static struct st_hash_type type_strhash = {
+-	HASH_FUNCTION_CAST strcmp,
+-	HASH_FUNCTION_CAST strhash
++	(hash_function_compare) strcmp,
++	(hash_function_hash) strhash
+ };
+ 
+ static void rehash(st_table *);
+@@ -212,7 +212,7 @@ void st_free_table(st_table *table)
+ }
+ 
+ #define PTR_NOT_EQUAL(table, ptr, hash_val, key) \
+-((ptr) != 0 && (ptr->hash != (hash_val) || !EQUAL((table), (key), (ptr)->key)))
++((ptr) != 0 && (ptr->hash != (hash_val) || !EQUAL((table), (void*) (key), (void*) (ptr)->key)))
+ 
+ #ifdef HASH_LOG
+ #define COLLISION collision++
+@@ -237,7 +237,7 @@ int st_lookup(st_table *table, register st_data_t key, st_data_t *value)
+ 	unsigned int hash_val, bin_pos;
+ 	register st_table_entry *ptr;
+ 
+-	hash_val = do_hash(key, table);
++	hash_val = do_hash((void*) key, table);
+ 	FIND_ENTRY(table, ptr, hash_val, bin_pos);
+ 
+ 	if (ptr == 0) {
+@@ -272,7 +272,7 @@ int st_insert(register st_table *table, register st_data_t key, st_data_t value)
+ 	unsigned int hash_val, bin_pos;
+ 	register st_table_entry *ptr;
+ 
+-	hash_val = do_hash(key, table);
++	hash_val = do_hash((void*) key, table);
+ 	FIND_ENTRY(table, ptr, hash_val, bin_pos);
+ 
+ 	if (ptr == 0) {
+@@ -288,7 +288,7 @@ void st_add_direct(st_table *table,st_data_t key,st_data_t value)
+ {
+ 	unsigned int hash_val, bin_pos;
+ 
+-	hash_val = do_hash(key, table);
++	hash_val = do_hash((void*) key, table);
+ 	bin_pos = hash_val % table->num_bins;
+ 	ADD_DIRECT(table, key, value, hash_val, bin_pos);
+ }
+@@ -363,7 +363,7 @@ int st_delete(register st_table *table,register st_data_t *key,st_data_t *value)
+ 	st_table_entry *tmp;
+ 	register st_table_entry *ptr;
+ 
+-	hash_val = do_hash_bin(*key, table);
++	hash_val = do_hash_bin((void*) *key, table);
+ 	ptr = table->bins[hash_val];
+ 
+ 	if (ptr == 0) {
+@@ -372,7 +372,7 @@ int st_delete(register st_table *table,register st_data_t *key,st_data_t *value)
+ 		return 0;
+ 	}
+ 
+-	if (EQUAL(table, *key, ptr->key)) {
++	if (EQUAL(table, (void*) *key, (void*) ptr->key)) {
+ 		table->bins[hash_val] = ptr->next;
+ 		table->num_entries--;
+ 		if (value != 0)
+@@ -383,7 +383,7 @@ int st_delete(register st_table *table,register st_data_t *key,st_data_t *value)
+ 	}
+ 
+ 	for (; ptr->next != 0; ptr = ptr->next) {
+-		if (EQUAL(table, ptr->next->key, *key)) {
++		if (EQUAL(table, (void*) ptr->next->key, (void*) *key)) {
+ 			tmp = ptr->next;
+ 			ptr->next = ptr->next->next;
+ 			table->num_entries--;
+@@ -403,7 +403,7 @@ int st_delete_safe(register st_table *table,register st_data_t *key,st_data_t *v
+ 	unsigned int hash_val;
+ 	register st_table_entry *ptr;
+ 
+-	hash_val = do_hash_bin(*key, table);
++	hash_val = do_hash_bin((void*) *key, table);
+ 	ptr = table->bins[hash_val];
+ 
+ 	if (ptr == 0) {
+@@ -413,7 +413,7 @@ int st_delete_safe(register st_table *table,register st_data_t *key,st_data_t *v
+ 	}
+ 
+ 	for (; ptr != 0; ptr = ptr->next) {
+-		if ((ptr->key != never) && EQUAL(table, ptr->key, *key)) {
++		if ((ptr->key != never) && EQUAL(table, (void*) ptr->key, (void*) *key)) {
+ 			table->num_entries--;
+ 			*key = ptr->key;
+ 			if (value != 0)
+@@ -439,11 +439,11 @@ void st_cleanup_safe(st_table *table,st_data_t never)
+ {
+ 	int num_entries = table->num_entries;
+ 
+-	st_foreach(table, HASH_FUNCTION_CAST delete_never, never);
++	st_foreach(table, (hash_function_foreach) delete_never, never);
+ 	table->num_entries = num_entries;
+ }
+ 
+-int st_foreach(st_table *table,int (*func) (ANYARGS),st_data_t arg)
++int st_foreach(st_table *table,int (*func) (void*, void*, void*),st_data_t arg)
+ {
+ 	st_table_entry *ptr, *last, *tmp;
+ 	enum st_retval retval;
+@@ -452,7 +452,9 @@ int st_foreach(st_table *table,int (*func) (ANYARGS),st_data_t arg)
+ 	for (i = 0; i < table->num_bins; i++) {
+ 		last = 0;
+ 		for (ptr = table->bins[i]; ptr != 0;) {
+-			retval = (enum st_retval) (*func) (ptr->key, ptr->record, arg);
++			retval = (enum st_retval) (*func) ((void*) ptr->key,
++							   (void*) ptr->record,
++							   (void*) arg);
+ 			switch (retval) {
+ 			case ST_CHECK:	/* check if hash is modified during
+ 					 * iteration */
+diff --git a/lang/c/src/st.h b/lang/c/src/st.h
+index cf8a22491..93da018bd 100644
+--- a/lang/c/src/st.h
++++ b/lang/c/src/st.h
+@@ -20,26 +20,22 @@ extern "C" {
+ 
+ #pragma GCC visibility push(hidden)
+ 
+-#ifndef ANYARGS
+- #ifdef __cplusplus
+-   #define ANYARGS ...
+- #else
+-   #define ANYARGS
+- #endif
+-#endif
+-
+ #ifdef _WIN32
+-  #define HASH_FUNCTION_CAST (int (__cdecl *)(ANYARGS))
++  typedef int (__cdecl *hash_function_compare)(void*, void*);
++  typedef int (__cdecl *hash_function_hash)(void*);
++  typedef int (__cdecl *hash_function_foreach)(void*, void*, void*);
+ #else
+-  #define HASH_FUNCTION_CAST
++  typedef int (*hash_function_compare)(void*, void*);
++  typedef int (*hash_function_hash)(void*);
++  typedef int (*hash_function_foreach)(void*, void*, void*);
+ #endif
+ 
+ typedef uintptr_t st_data_t;
+ typedef struct st_table st_table;
+ 
+ struct st_hash_type {
+-  int (*compare) (ANYARGS);
+-  int (*hash) (ANYARGS);
++  hash_function_compare compare;
++  hash_function_hash hash;
+ };
+ 
+ struct st_table {
+@@ -67,7 +63,7 @@ int st_delete _((st_table *, st_data_t *, st_data_t *));
+ int st_delete_safe _((st_table *, st_data_t *, st_data_t *, st_data_t));
+ int st_insert _((st_table *, st_data_t, st_data_t));
+ int st_lookup _((st_table *, st_data_t, st_data_t *));
+-int st_foreach _((st_table *, int (*)(ANYARGS), st_data_t));
++int st_foreach _((st_table *, hash_function_foreach, st_data_t));
+ void st_add_direct _((st_table *, st_data_t, st_data_t));
+ void st_free_table _((st_table *));
+ void st_cleanup_safe _((st_table *, st_data_t));
diff --git a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
index bf84242e29..37a12006ba 100644
--- a/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
+++ b/meta-oe/recipes-support/avro/avro-c_1.11.3.bb
@@ -8,16 +8,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=6d502b41f76179fc84e536236f359cae"
 DEPENDS = "jansson zlib xz"
 
 BRANCH = "branch-1.11"
-SRCREV = "35ff8b997738e4d983871902d47bfb67b3250734"
-SRC_URI = "git://github.com/apache/avro;branch=${BRANCH};protocol=https \
-          "
-
+SRCREV = "579a36762293fa4c9f2831e27e7af7713a0838a0"
+SRC_URI = " \
+    git://github.com/apache/avro;branch=${BRANCH};protocol=https \
+    file://0001-AVRO-3960-C-Fix-st-ANYARGS-warning-2798.patch;patchdir=../.. \
+    file://0001-AVRO-3957-C-Fix-typos-in-docs-and-examples-2795.patch;patchdir=../.. \
+"
 S = "${WORKDIR}/git/lang/c"
 
 inherit cmake pkgconfig
-
-# http://errors.yoctoproject.org/Errors/Details/766902/
-# avro-c/1.11.3/git/lang/c/examples/quickstop.c:123:61: error: passing argument 3 of 'first_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
-# avro-c/1.11.3/git/lang/c/examples/quickstop.c:127:60: error: passing argument 3 of 'last_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
-# avro-c/1.11.3/git/lang/c/examples/quickstop.c:131:61: error: passing argument 3 of 'phone_value.iface->get_string' from incompatible pointer type [-Wincompatible-pointer-types]
-CFLAGS += "-Wno-error=incompatible-pointer-types"

