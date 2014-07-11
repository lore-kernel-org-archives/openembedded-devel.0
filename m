Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B442C7037F
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 09:55:11 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6B9tDfY011410
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 11 Jul 2014 02:55:13 -0700 (PDT)
Received: from pek-hostel-vm11.wrs.com (128.224.153.181) by
	ALA-HCA.corp.ad.wrs.com (147.11.189.40) with Microsoft SMTP Server id
	14.3.169.1; Fri, 11 Jul 2014 02:55:12 -0700
From: <jackie.huang@windriver.com>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 11 Jul 2014 05:55:09 -0400
Message-ID: <1405072509-8901-2-git-send-email-jackie.huang@windriver.com>
X-Mailer: git-send-email 2.0.0
In-Reply-To: <1405072509-8901-1-git-send-email-jackie.huang@windriver.com>
References: <1405072509-8901-1-git-send-email-jackie.huang@windriver.com>
MIME-Version: 1.0
Subject: [meta-oe][PATCH 2/2 v2] syslog-ng: uprev to 3.5.4.1
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 11 Jul 2014 09:55:13 -0000
Content-Type: text/plain

From: Jackie Huang <jackie.huang@windriver.com>

- initscript: add status, PIDFILE and xconsole
- syslog-ng.conf: dump the version
- Fix some memory leak problems we found
- Some backport patches
- scl: fix wrong ownership issue
- libnet: add libnet enable option and add it in PACKAGECONFIG
- add HOMEPAGE
- remove INC_PR
- change some config into PACKAGECONFIG
- add PACKAGE syslog-ng-tools
- use volatiles
- inherit update-rc.d and update-alternative

Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
---
 .../Fix-the-memory-leak-problem-for-mutex.patch    |  58 +++
 ...ry-leak-problem-when-HAVE_ENVIRON-defined.patch |  27 ++
 .../files/afsql-afsql_dd_insert_db-refactor.patch  | 494 +++++++++++++++++++++
 ...init-the-new-config-when-reverting-to-the.patch |  36 ++
 .../fix-a-memory-leak-in-log_driver_free.patch     |  33 ++
 .../syslog-ng/files/fix-config-libnet.patch        |  66 +++
 .../syslog-ng/files/fix-invalid-ownership.patch    |  28 ++
 .../files/free-global-LogTemplateOptions.patch     |  30 ++
 meta-oe/recipes-support/syslog-ng/files/initscript |  29 +-
 .../logwriter-still-free-the-unconsumed-item.patch |  47 ++
 .../syslog-ng-verify-the-list-before-del.patch     |  38 ++
 .../recipes-support/syslog-ng/files/syslog-ng.conf |   8 +-
 .../syslog-ng/files/volatiles.03_syslog-ng         |   1 +
 meta-oe/recipes-support/syslog-ng/syslog-ng.inc    | 125 +++---
 .../recipes-support/syslog-ng/syslog-ng_3.2.5.bb   |  10 -
 .../recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb |  17 +
 16 files changed, 961 insertions(+), 86 deletions(-)
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch
 create mode 100644 meta-oe/recipes-support/syslog-ng/files/volatiles.03_syslog-ng
 delete mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
 create mode 100644 meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb

diff --git a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
new file mode 100644
index 0000000..89022aa
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-for-mutex.patch
@@ -0,0 +1,58 @@
+Fix the memory leak problem for mutex
+
+Upstream-Status: Pending
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+ lib/logqueue.c               |    1 +
+ modules/affile/affile-dest.c |    2 ++
+ modules/dbparser/dbparser.c  |    1 +
+ 3 files changed, 4 insertions(+), 0 deletions(-)
+
+diff --git a/lib/logqueue.c b/lib/logqueue.c
+index 337a3c1..10edcf0 100644
+--- a/lib/logqueue.c
++++ b/lib/logqueue.c
+@@ -188,6 +188,7 @@ log_queue_init_instance(LogQueue *self, const gchar *persist_name)
+ void
+ log_queue_free_method(LogQueue *self)
+ {
++  g_static_mutex_free(&self->lock);
+   g_free(self->persist_name);
+   g_free(self);
+ }
+diff --git a/modules/affile/affile-dest.c b/modules/affile/affile-dest.c
+index a2bcdad..ce79f6f 100644
+--- a/modules/affile/affile-dest.c
++++ b/modules/affile/affile-dest.c
+@@ -305,6 +305,7 @@ affile_dw_free(LogPipe *s)
+ {
+   AFFileDestWriter *self = (AFFileDestWriter *) s;
+   
++  g_static_mutex_free(&self->lock);
+   log_pipe_unref((LogPipe *) self->writer);
+   self->writer = NULL;
+   g_free(self->filename);
+@@ -687,6 +688,7 @@ affile_dd_free(LogPipe *s)
+   /* NOTE: this must be NULL as deinit has freed it, otherwise we'd have circular references */
+   g_assert(self->single_writer == NULL && self->writer_hash == NULL);
+ 
++  g_static_mutex_free(&self->lock);
+   log_template_unref(self->filename_template);
+   log_writer_options_destroy(&self->writer_options);
+   log_dest_driver_free(s);
+diff --git a/modules/dbparser/dbparser.c b/modules/dbparser/dbparser.c
+index f1248b5..9775701 100644
+--- a/modules/dbparser/dbparser.c
++++ b/modules/dbparser/dbparser.c
+@@ -284,6 +284,7 @@ log_db_parser_free(LogPipe *s)
+ {
+   LogDBParser *self = (LogDBParser *) s;
+ 
++  g_static_mutex_free(&self->lock);
+   if (self->db)
+     pattern_db_free(self->db);
+ 
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
new file mode 100644
index 0000000..2ac9c0b
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch
@@ -0,0 +1,27 @@
+Fix the memory leak problem when HAVE_ENVIRON is defined
+
+Upstream-Status: Pending
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+--- a/lib/gprocess.c
++++ b/lib/gprocess.c
+@@ -1421,6 +1421,18 @@
+ void
+ g_process_finish(void)
+ {
++#ifdef HAVE_ENVIRON
++  int i = 0;
++
++  while (environ[i]) {
++    g_free(environ[i]);
++    ++i;
++  }
++  if (environ)
++    g_free(environ);
++  if (process_opts.argv_orig)
++    free(process_opts.argv_orig);
++#endif
+   g_process_remove_pidfile();
+ }
+ 
diff --git a/meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch b/meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
new file mode 100644
index 0000000..42e181b
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/afsql-afsql_dd_insert_db-refactor.patch
@@ -0,0 +1,494 @@
+From 23e80b75508187baaa823a68ea019b72e0b2305c Mon Sep 17 00:00:00 2001
+From: Budai Laszlo <lbudai@balabit.hu>
+Date: Tue, 12 Nov 2013 13:19:04 +0100
+Subject: [PATCH] afsql: afsql_dd_insert_db() refactor
+
+Upstream-Status: Backport
+
+A lot of the code that was previously in afsql_dd_insert_db() have been
+extracted to smaller functions, and afsql_dd_insert_db() was rebuilt on
+top of these. At the same time, memory leaks were plugged, and in case
+of a transaction error, backlog rewinding has been fixed too, to not
+loose messages since the last BEGIN command.
+
+Signed-off-by: Juhasz Viktor <jviktor@balabit.hu>
+Signed-off-by: Laszlo Budai <lbudai@balabit.hu>
+---
+ modules/afsql/afsql.c | 301 ++++++++++++++++++++++++++++++++------------------
+ 1 file changed, 192 insertions(+), 109 deletions(-)
+
+diff --git a/modules/afsql/afsql.c b/modules/afsql/afsql.c
+index 12f6aab..a6a8190 100644
+--- a/modules/afsql/afsql.c
++++ b/modules/afsql/afsql.c
+@@ -456,24 +456,21 @@ afsql_dd_create_index(AFSqlDestDriver *s
+  *
+  * NOTE: This function can only be called from the database thread.
+  **/
+-static GString *
+-afsql_dd_validate_table(AFSqlDestDriver *self, LogMessage *msg)
++static gboolean
++afsql_dd_validate_table(AFSqlDestDriver *self, GString *table)
+ {
+-  GString *query_string, *table;
++  GString *query_string;
+   dbi_result db_res;
+   gboolean success = FALSE;
+   gint i;
+ 
+-  table = g_string_sized_new(32);
+-  log_template_format(self->table, msg, &self->template_options, LTZ_LOCAL, 0, NULL, table);
+-
+   if (self->flags & AFSQL_DDF_DONT_CREATE_TABLES)
+-    return table;
++    return TRUE;
+ 
+   afsql_dd_check_sql_identifier(table->str, TRUE);
+ 
+   if (g_hash_table_lookup(self->validated_tables, table->str))
+-    return table;
++    return TRUE;
+ 
+   query_string = g_string_sized_new(32);
+   g_string_printf(query_string, "SELECT * FROM %s WHERE 0=1", table->str);
+@@ -544,14 +541,9 @@ afsql_dd_validate_table(AFSqlDestDriver 
+       /* we have successfully created/altered the destination table, record this information */
+       g_hash_table_insert(self->validated_tables, g_strdup(table->str), GUINT_TO_POINTER(TRUE));
+     }
+-  else
+-    {
+-      g_string_free(table, TRUE);
+-      table = NULL;
+-    }
+   g_string_free(query_string, TRUE);
+ 
+-  return table;
++  return success;
+ }
+ 
+ /**
+@@ -581,6 +573,20 @@ afsql_dd_begin_txn(AFSqlDestDriver *self
+ }
+ 
+ /**
++ * afsql_dd_handle_transaction_error:
++ *
++ * Handle errors inside during a SQL transaction (e.g. INSERT or COMMIT failures).
++ *
++ * NOTE: This function can only be called from the database thread.
++ **/
++static void
++afsql_dd_handle_transaction_error(AFSqlDestDriver *self)
++{
++  log_queue_rewind_backlog(self->queue);
++  self->flush_lines_queued = 0;
++}
++
++/**
+  * afsql_dd_begin_txn:
+  *
+  * Commit SQL transaction.
+@@ -596,14 +602,14 @@ afsql_dd_commit_txn(AFSqlDestDriver *sel
+   if (success)
+     {
+       log_queue_ack_backlog(self->queue, self->flush_lines_queued);
++      self->flush_lines_queued = 0;
+     }
+   else
+     {
+-      msg_notice("SQL transaction commit failed, rewinding backlog and starting again",
+-                 NULL);
+-      log_queue_rewind_backlog(self->queue);
++      msg_error("SQL transaction commit failed, rewinding backlog and starting again",
++                NULL);
++      afsql_dd_handle_transaction_error(self);
+     }
+-  self->flush_lines_queued = 0;
+   return success;
+ }
+ 
+@@ -644,12 +650,13 @@ afsql_dd_set_dbd_opt_numeric(gpointer ke
+ }
+ 
+ static gboolean
+-afsql_dd_connect(AFSqlDestDriver *self)
++afsql_dd_ensure_initialized_connection(AFSqlDestDriver *self)
+ {
+   if (self->dbi_ctx)
+     return TRUE;
+ 
+   self->dbi_ctx = dbi_conn_new(self->type);
++
+   if (!self->dbi_ctx)
+     {
+       msg_error("No such DBI driver",
+@@ -659,10 +666,12 @@ afsql_dd_connect(AFSqlDestDriver *self)
+     }
+ 
+   dbi_conn_set_option(self->dbi_ctx, "host", self->host);
++
+   if (strcmp(self->type, "mysql"))
+     dbi_conn_set_option(self->dbi_ctx, "port", self->port);
+   else
+     dbi_conn_set_option_numeric(self->dbi_ctx, "port", atoi(self->port));
++
+   dbi_conn_set_option(self->dbi_ctx, "username", self->user);
+   dbi_conn_set_option(self->dbi_ctx, "password", self->password);
+   dbi_conn_set_option(self->dbi_ctx, "dbname", self->database);
+@@ -691,6 +700,7 @@ afsql_dd_connect(AFSqlDestDriver *self)
+                 evt_tag_str("database", self->database),
+                 evt_tag_str("error", dbi_error),
+                 NULL);
++
+       return FALSE;
+     }
+ 
+@@ -713,104 +723,145 @@ afsql_dd_connect(AFSqlDestDriver *self)
+   return TRUE;
+ }
+ 
+-static gboolean
+-afsql_dd_insert_fail_handler(AFSqlDestDriver *self, LogMessage *msg,
+-                             LogPathOptions *path_options)
++static GString *
++afsql_dd_ensure_accessible_database_table(AFSqlDestDriver *self, LogMessage *msg)
+ {
+-  if (self->failed_message_counter < self->num_retries - 1)
+-    {
+-      log_queue_push_head(self->queue, msg, path_options);
+-
+-      /* database connection status sanity check after failed query */
+-      if (dbi_conn_ping(self->dbi_ctx) != 1)
+-        {
+-          const gchar *dbi_error;
+-
+-          dbi_conn_error(self->dbi_ctx, &dbi_error);
+-          msg_error("Error, no SQL connection after failed query attempt",
+-                    evt_tag_str("type", self->type),
+-                    evt_tag_str("host", self->host),
+-                    evt_tag_str("port", self->port),
+-                    evt_tag_str("username", self->user),
+-                    evt_tag_str("database", self->database),
+-                    evt_tag_str("error", dbi_error),
+-                    NULL);
+-          return FALSE;
+-        }
++  GString *table = g_string_sized_new(32);
++  log_template_format(self->table, msg, &self->template_options, LTZ_LOCAL, 0, NULL, table);
+ 
+-      self->failed_message_counter++;
+-      return FALSE;
++  if (!afsql_dd_validate_table(self, table))
++    {
++      /* If validate table is FALSE then close the connection and wait time_reopen time (next call) */
++      msg_error("Error checking table, disconnecting from database, trying again shortly",
++                evt_tag_int("time_reopen", self->time_reopen),
++                NULL);
++      g_string_free(table, TRUE);
++      return NULL;
+     }
+ 
+-  msg_error("Multiple failures while inserting this record into the database, message dropped",
+-            evt_tag_int("attempts", self->num_retries),
+-            NULL);
+-  stats_counter_inc(self->dropped_messages);
+-  log_msg_drop(msg, path_options);
+-  self->failed_message_counter = 0;
+-  return TRUE;
++  return table;
+ }
+ 
+ static GString *
+-afsql_dd_construct_query(AFSqlDestDriver *self, GString *table,
+-                         LogMessage *msg)
++afsql_dd_build_insert_command(AFSqlDestDriver *self, LogMessage *msg, GString *table)
+ {
+-  GString *value;
+-  GString *query_string;
+-  gint i;
++  GString *insert_command = g_string_sized_new(256);
++  GString *value = g_string_sized_new(512);
++  gint i, j;
+ 
+-  value = g_string_sized_new(256);
+-  query_string = g_string_sized_new(512);
++  g_string_printf(insert_command, "INSERT INTO %s (", table->str);
+ 
+-  g_string_printf(query_string, "INSERT INTO %s (", table->str);
+   for (i = 0; i < self->fields_len; i++)
+     {
+-      g_string_append(query_string, self->fields[i].name);
+-      if (i != self->fields_len - 1)
+-        g_string_append(query_string, ", ");
++      if ((self->fields[i].flags & AFSQL_FF_DEFAULT) == 0 && self->fields[i].value != NULL)
++        {
++           g_string_append(insert_command, self->fields[i].name);
++
++           j = i + 1;
++           while (j < self->fields_len && (self->fields[j].flags & AFSQL_FF_DEFAULT) == AFSQL_FF_DEFAULT)
++             j++;
++
++           if (j < self->fields_len)
++             g_string_append(insert_command, ", ");
++        }
+     }
+-  g_string_append(query_string, ") VALUES (");
++
++  g_string_append(insert_command, ") VALUES (");
+ 
+   for (i = 0; i < self->fields_len; i++)
+     {
+       gchar *quoted;
+ 
+-      if (self->fields[i].value == NULL)
+-        {
+-          /* the config used the 'default' value for this column -> the fields[i].value is NULL, use SQL default */
+-          g_string_append(query_string, "DEFAULT");
+-        }
+-      else
++      if ((self->fields[i].flags & AFSQL_FF_DEFAULT) == 0 && self->fields[i].value != NULL)
+         {
+           log_template_format(self->fields[i].value, msg, &self->template_options, LTZ_SEND, self->seq_num, NULL, value);
+-
+           if (self->null_value && strcmp(self->null_value, value->str) == 0)
+             {
+-              g_string_append(query_string, "NULL");
++              g_string_append(insert_command, "NULL");
+             }
+           else
+             {
+               dbi_conn_quote_string_copy(self->dbi_ctx, value->str, &quoted);
+               if (quoted)
+                 {
+-                  g_string_append(query_string, quoted);
++                  g_string_append(insert_command, quoted);
+                   free(quoted);
+                 }
+               else
+                 {
+-                  g_string_append(query_string, "''");
++                 g_string_append(insert_command, "''");
+                 }
+             }
+-        }
+ 
+-      if (i != self->fields_len - 1)
+-        g_string_append(query_string, ", ");
++          j = i + 1;
++          while (j < self->fields_len && (self->fields[j].flags & AFSQL_FF_DEFAULT) == AFSQL_FF_DEFAULT)
++            j++;
++          if (j < self->fields_len)
++            g_string_append(insert_command, ", ");
++        }
+     }
+-  g_string_append(query_string, ")");
++
++  g_string_append(insert_command, ")");
+ 
+   g_string_free(value, TRUE);
+ 
+-  return query_string;
++  return insert_command;
++}
++
++static inline gboolean
++afsql_dd_is_transaction_handling_enabled(const AFSqlDestDriver *self)
++{
++  return self->flush_lines_queued != -1;
++}
++
++static inline gboolean
++afsql_dd_should_start_new_transaction(const AFSqlDestDriver *self)
++{
++  return self->flush_lines_queued == 0;
++}
++
++static inline gboolean
++afsql_dd_should_commit_transaction(const AFSqlDestDriver *self)
++{
++  return afsql_dd_is_transaction_handling_enabled(self) && self->flush_lines_queued == self->flush_lines;
++}
++
++static inline gboolean
++afsql_dd_handle_insert_row_error_depending_on_connection_availability(AFSqlDestDriver *self,
++                                                                      LogMessage *msg,
++                                                                      LogPathOptions *path_options)
++{
++  const gchar *dbi_error, *error_message;
++
++  if (dbi_conn_ping(self->dbi_ctx) == 1)
++    {
++      log_queue_push_head(self->queue, msg, path_options);
++      return TRUE;
++    }
++
++  if (afsql_dd_is_transaction_handling_enabled(self))
++    {
++      error_message = "SQL connection lost in the middle of a transaction,"
++                      " rewinding backlog and starting again";
++      afsql_dd_handle_transaction_error(self);
++    }
++  else
++    {
++      error_message = "Error, no SQL connection after failed query attempt";
++      log_queue_push_head(self->queue, msg, path_options);
++    }
++
++  dbi_conn_error(self->dbi_ctx, &dbi_error);
++  msg_error(error_message,
++            evt_tag_str("type", self->type),
++            evt_tag_str("host", self->host),
++            evt_tag_str("port", self->port),
++            evt_tag_str("username", self->user),
++            evt_tag_str("database", self->database),
++            evt_tag_str("error", dbi_error),
++            NULL);
++
++  return FALSE;
+ }
+ 
+ /**
+@@ -824,61 +875,93 @@ afsql_dd_construct_query(AFSqlDestDriver
+ static gboolean
+ afsql_dd_insert_db(AFSqlDestDriver *self)
+ {
+-  GString *table, *query_string;
++  GString *table = NULL;
++  GString *insert_command = NULL;
+   LogMessage *msg;
+   gboolean success;
+   LogPathOptions path_options = LOG_PATH_OPTIONS_INIT;
+ 
+-  afsql_dd_connect(self);
++  if (!afsql_dd_ensure_initialized_connection(self))
++    return FALSE;
+ 
+-  success = log_queue_pop_head(self->queue, &msg, &path_options, (self->flags & AFSQL_DDF_EXPLICIT_COMMITS), FALSE);
++  /* connection established, try to insert a message */
++  success = log_queue_pop_head(self->queue, &msg, &path_options, FALSE, self->flags & AFSQL_DDF_EXPLICIT_COMMITS);
+   if (!success)
+     return TRUE;
+ 
+   msg_set_context(msg);
+ 
+-  table = afsql_dd_validate_table(self, msg);
++  table = afsql_dd_ensure_accessible_database_table(self, msg);
++
+   if (!table)
+     {
+-      /* If validate table is FALSE then close the connection and wait time_reopen time (next call) */
+-      msg_error("Error checking table, disconnecting from database, trying again shortly",
+-                evt_tag_int("time_reopen", self->time_reopen),
+-                NULL);
+-      msg_set_context(NULL);
+-      g_string_free(table, TRUE);
+-      return afsql_dd_insert_fail_handler(self, msg, &path_options);
++      success = FALSE;
++      goto out;
+     }
+ 
+-  query_string = afsql_dd_construct_query(self, table, msg);
++  if (afsql_dd_should_start_new_transaction(self) && !afsql_dd_begin_txn(self))
++    {
++      success = FALSE;
++      goto out;
++    }
+ 
+-  if (self->flush_lines_queued == 0 && !afsql_dd_begin_txn(self))
+-    return FALSE;
++  insert_command = afsql_dd_build_insert_command(self, msg, table);
++  success = afsql_dd_run_query(self, insert_command->str, FALSE, NULL);
+ 
+-  success = afsql_dd_run_query(self, query_string->str, FALSE, NULL);
+   if (success && self->flush_lines_queued != -1)
+     {
+       self->flush_lines_queued++;
+ 
+-      if (self->flush_lines && self->flush_lines_queued == self->flush_lines && !afsql_dd_commit_txn(self))
+-        return FALSE;
++      if (afsql_dd_should_commit_transaction(self) && !afsql_dd_commit_txn(self))
++        {
++          /* Assuming that in case of error, the queue is rewound by afsql_dd_commit_txn() */
++
++          g_string_free(insert_command, TRUE);
++          msg_set_context(NULL);
++
++          return FALSE;
++        }
+     }
+ 
+-  g_string_free(table, TRUE);
+-  g_string_free(query_string, TRUE);
++ out:
++
++  if (table != NULL)
++    g_string_free(table, TRUE);
++
++  if (insert_command != NULL)
++    g_string_free(insert_command, TRUE);
+ 
+   msg_set_context(NULL);
+ 
+-  if (!success)
+-    return afsql_dd_insert_fail_handler(self, msg, &path_options);
++  if (success)
++    {
++      log_msg_ack(msg, &path_options);
++      log_msg_unref(msg);
++      step_sequence_number(&self->seq_num);
++      self->failed_message_counter = 0;
++    }
++  else
++    {
++      if (self->failed_message_counter < self->num_retries - 1)
++        {
++          if (!afsql_dd_handle_insert_row_error_depending_on_connection_availability(self, msg, &path_options))
++            return FALSE;
+ 
+-  /* we only ACK if each INSERT is a separate transaction */
+-  if ((self->flags & AFSQL_DDF_EXPLICIT_COMMITS) == 0)
+-    log_msg_ack(msg, &path_options);
+-  log_msg_unref(msg);
+-  step_sequence_number(&self->seq_num);
+-  self->failed_message_counter = 0;
++          self->failed_message_counter++;
++        }
++      else
++        {
++          msg_error("Multiple failures while inserting this record into the database, message dropped",
++                    evt_tag_int("attempts", self->num_retries),
++                    NULL);
++          stats_counter_inc(self->dropped_messages);
++          log_msg_drop(msg, &path_options);
++          self->failed_message_counter = 0;
++          success = TRUE;
++        }
++    }
+ 
+-  return TRUE;
++  return success;
+ }
+ 
+ static void
+@@ -895,7 +978,7 @@ afsql_dd_message_became_available_in_the
+ static void
+ afsql_dd_wait_for_suspension_wakeup(AFSqlDestDriver *self)
+ {
+-  /* we got suspended, probably because of a connection error,  
++  /* we got suspended, probably because of a connection error,
+    * during this time we only get wakeups if we need to be
+    * terminated. */
+   if (!self->db_thread_terminate)
+@@ -974,8 +1057,7 @@ afsql_dd_database_thread(gpointer arg)
+ 
+       afsql_dd_commit_txn(self);
+     }
+-
+- exit:
++exit:
+   afsql_dd_disconnect(self);
+ 
+   msg_verbose("Database thread finished",
+-- 
+1.8.4.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch b/meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
new file mode 100644
index 0000000..484af7e
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/deinit-the-new-config-when-reverting-to-the.patch
@@ -0,0 +1,36 @@
+From 86842df8bff5c97e44fc55d2fb7fc6c10f56ab84 Mon Sep 17 00:00:00 2001
+From: Gergely Nagy <algernon@balabit.hu>
+Date: Fri, 13 Dec 2013 13:46:15 +0100
+Subject: [PATCH] mainloop: Deinit the new config when reverting to the old one
+
+Upstream-Status: Backport
+
+When reloading, and the new config fails, deinit it before initializing
+the old config. This is so that conflicting things do not remain held by
+the half-initialized new config, while the old tries to take it
+over. (It also removed a couple of memory leaks, most likely.)
+
+The reason we can do this, is because cfg_tree_stop() (called by
+cfg_deinit()) goes over all the known nodes, and log_pipe_deinit() is
+also smart enough to not deinit a node that has not been inited before.
+
+Signed-off-by: Gergely Nagy <algernon@balabit.hu>
+---
+ lib/mainloop.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/mainloop.c b/lib/mainloop.c
+index 34655fa..e6fbb59 100644
+--- a/lib/mainloop.c
++++ b/lib/mainloop.c
+@@ -510,6 +510,7 @@ main_loop_reload_config_apply(void)
+     {
+       msg_error("Error initializing new configuration, reverting to old config", NULL);
+       cfg_persist_config_move(main_loop_new_config, main_loop_old_config);
++      cfg_deinit(main_loop_new_config);
+       if (!cfg_init(main_loop_old_config))
+         {
+           /* hmm. hmmm, error reinitializing old configuration, we're hosed.
+-- 
+1.8.4.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch b/meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
new file mode 100644
index 0000000..2603474
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/fix-a-memory-leak-in-log_driver_free.patch
@@ -0,0 +1,33 @@
+From a269669ba3cb6d1c06a3322b4a6a035cb787d085 Mon Sep 17 00:00:00 2001
+From: Gergely Nagy <algernon@balabit.hu>
+Date: Tue, 14 Jan 2014 13:58:05 +0100
+Subject: [PATCH] driver: Fix a memory leak in log_driver_free()
+
+Upstream-Status: Backport
+
+After freeing up the members of self->plugins, free self->plugins itself
+too.
+
+Signed-off-by: Gergely Nagy <algernon@balabit.hu>
+---
+ lib/driver.c | 4 ++++
+ 1 file changed, 4 insertions(+)
+
+diff --git a/lib/driver.c b/lib/driver.c
+index d77fe57..a6867b9 100644
+--- a/lib/driver.c
++++ b/lib/driver.c
+@@ -91,6 +91,10 @@ log_driver_free(LogPipe *s)
+     {
+       log_driver_plugin_free((LogDriverPlugin *) l->data);
+     }
++  if (self->plugins)
++    {
++      g_list_free(self->plugins);
++    }
+   if (self->group)
+     g_free(self->group);
+   if (self->id)
+-- 
+1.8.4.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch b/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
new file mode 100644
index 0000000..755803c
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/fix-config-libnet.patch
@@ -0,0 +1,66 @@
+Subject: [PATCH] add libnet enable option
+
+Upstream-Status: Pending
+
+This would avoid a implicit auto-detecting result.
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
+---
+ configure.ac |   27 +++++++++++++++++----------
+ 1 files changed, 17 insertions(+), 10 deletions(-)
+
+diff --git a/configure.ac b/configure.ac
+index b1e18b4..8e13025 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -73,6 +73,9 @@ AC_CONFIG_HEADERS(config.h)
+ dnl ***************************************************************************
+ dnl Arguments
+ 
++AC_ARG_ENABLE(libnet, 
++              [  --enable-libnet      Enable libnet support.],, enable_libnet="no")
++
+ AC_ARG_WITH(libnet,
+    [  --with-libnet=path      use path to libnet-config script],
+    ,
+@@ -768,22 +771,26 @@ dnl ***************************************************************************
+ dnl libnet headers/libraries
+ dnl ***************************************************************************
+ AC_MSG_CHECKING(for LIBNET)
+-if test "x$with_libnet" = "x"; then
+-        LIBNET_CONFIG="`which libnet-config`"
+-else
+-        LIBNET_CONFIG="$with_libnet/libnet-config"
+-fi
++if test "x$enable_libnet" = xyes; then
++        if test "x$with_libnet" = "x"; then
++                LIBNET_CONFIG="`which libnet-config`"
++        else
++                LIBNET_CONFIG="$with_libnet/libnet-config"
++        fi
++ 
++        if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
++                LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
++                LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
++                AC_MSG_RESULT(yes)
++        else
++                AC_MSG_ERROR([Could not find libnet, and libnet support was explicitly enabled.])
++        fi
+ 
+-if test -n "$LIBNET_CONFIG" -a -x "$LIBNET_CONFIG"; then
+-        LIBNET_CFLAGS="`$LIBNET_CONFIG --defines`"
+-        LIBNET_LIBS="`$LIBNET_CONFIG --libs`"
+-        AC_MSG_RESULT(yes)
+ else
+         LIBNET_LIBS=
+         AC_MSG_RESULT(no)
+ fi
+ 
+-
+ if test "x$enable_spoof_source" = "xauto"; then
+ 	AC_MSG_CHECKING(whether to enable spoof source support)
+         if test "x$LIBNET_LIBS" != "x"; then
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch b/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
new file mode 100644
index 0000000..faf9672
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/fix-invalid-ownership.patch
@@ -0,0 +1,28 @@
+syslog-ng: fix wrong ownership issue
+
+Upstream-Status: Pending
+
+The ownership of build user is preserved for some target files, fixed it by
+adding --no-same-owner option to tar when extracting files. 
+
+Signed-off-by: Ming Liu <ming.liu@windriver.com>
+---
+ scl/Makefile.am |    2 +-
+ 1 files changed, 1 insertions(+), 1 deletions(-)
+
+diff --git a/scl/Makefile.am b/scl/Makefile.am
+index 57fad5d..2a29ca5 100644
+--- a/scl/Makefile.am
++++ b/scl/Makefile.am
+@@ -14,7 +14,7 @@ scl-install-data-local:
+ 		fi; \
+ 	done
+ 	$(mkinstalldirs) $(DESTDIR)/$(scldir)
+-	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) && tar xf -)
++	(cd $(srcdir)/scl; tar cf - $(SCL_SUBDIRS)) | (cd $(DESTDIR)/$(scldir) && tar xf - --no-same-owner)
+ 	chmod -R u+rwX $(DESTDIR)/$(scldir)
+ 
+ scl-uninstall-local:
+-- 
+1.7.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch b/meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch
new file mode 100644
index 0000000..d439a26
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/free-global-LogTemplateOptions.patch
@@ -0,0 +1,30 @@
+From 3ef6ca8044260c77118edca6dead807a2edcb5ef Mon Sep 17 00:00:00 2001
+From: Balazs Scheidler <bazsi@balabit.hu>
+Date: Thu, 31 Oct 2013 13:20:12 +0100
+Subject: [PATCH] cfg: free global LogTemplateOptions
+
+Upstream-Status: Backport
+
+This fixes a potential memory leak when global template specific
+options were specified, such as local-time-zone(), send-time-zone() etc.
+
+Signed-off-by: Balazs Scheidler <bazsi@balabit.hu>
+---
+ lib/cfg.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/lib/cfg.c b/lib/cfg.c
+index 7f040b8..adeaaf8 100644
+--- a/lib/cfg.c
++++ b/lib/cfg.c
+@@ -411,6 +411,7 @@ cfg_free(GlobalConfig *self)
+   g_free(self->proto_template_name);  
+   log_template_unref(self->file_template);
+   log_template_unref(self->proto_template);
++  log_template_options_destroy(&self->template_options);
+ 
+   if (self->bad_hostname_compiled)
+     regfree(&self->bad_hostname);
+-- 
+1.8.4.1
+
diff --git a/meta-oe/recipes-support/syslog-ng/files/initscript b/meta-oe/recipes-support/syslog-ng/files/initscript
index b95e8ad..0772cc2 100644
--- a/meta-oe/recipes-support/syslog-ng/files/initscript
+++ b/meta-oe/recipes-support/syslog-ng/files/initscript
@@ -5,19 +5,31 @@
 # > update-rc.d syslog-ng defaults 5
 #
 
+# Source function library
+. /etc/init.d/functions
 
 syslog_ng=/usr/sbin/syslog-ng
 test -x "$syslog_ng" || exit 0
 
+PIDFILE=/var/run/syslog-ng/syslog-ng.pid
+
+create_xconsole() {
+  test -e /dev/xconsole || mknod -m 640 /dev/xconsole p
+  test -x /sbin/restorecon && /sbin/restorecon /dev/xconsole
+}
+
+RETVAL=0
+
 case "$1" in
   start)
     echo -n "Starting syslog-ng:"
-    start-stop-daemon --start --quiet --exec $syslog_ng
+    create_xconsole
+    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $syslog_ng
     echo "."
     ;;
   stop)
     echo -n "Stopping syslog-ng:"
-    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    start-stop-daemon --stop --quiet --pidfile $PIDFILE
     echo "."
     ;;
   reload|force-reload)
@@ -25,7 +37,7 @@ case "$1" in
     ;;
   restart)
     echo "Stopping syslog-ng:"
-    start-stop-daemon --stop --quiet --pidfile /var/run/syslog-ng.pid
+    start-stop-daemon --stop --quiet --pidfile $PIDFILE
     echo -n "Waiting for syslog-ng to die off"
     for i in 1 2 3 ;
     do
@@ -34,12 +46,17 @@ case "$1" in
     done
     echo ""
     echo -n "Starting syslog-ng:"
-    start-stop-daemon --start --quiet --exec $syslog_ng
+    create_xconsole
+    start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $syslog_ng
     echo "."
     ;;
+  status)
+    status $syslog_ng
+    RETVAL=$?
+    ;;
   *)
-    echo "Usage: /etc/init.d/syslog-ng {start|stop|reload|restart|force-reload}"
+    echo "Usage: $0 {start|stop|reload|restart|force-reload|status}"
     exit 1
 esac
 
-exit 0
+exit $RETVAL
diff --git a/meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch b/meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
new file mode 100644
index 0000000..3111093
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/logwriter-still-free-the-unconsumed-item.patch
@@ -0,0 +1,47 @@
+logwritter: still free the unconsumed item during reloading configuration
+
+Otherwise we have no chance to free this stuff.
+
+Upstream-Status: Pending
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+--- a/lib/logwriter.c
++++ b/lib/logwriter.c
+@@ -39,6 +39,7 @@
+ #include <iv.h>
+ #include <iv_event.h>
+ #include <iv_work.h>
++#include "logproto/logproto-text-client.h"
+ 
+ typedef enum
+ {
+@@ -978,6 +979,7 @@
+   gint count = 0;
+   gboolean ignore_throttle = (flush_mode >= LW_FLUSH_QUEUE);
+   LogProtoStatus status = LPS_SUCCESS;
++  LogProtoTextClient *self_text;
+   
+   if (!proto)
+     return FALSE;
+@@ -1035,7 +1037,18 @@
+         }
+       else
+         {
+-          /* push back to the queue */
+-          log_queue_push_head(self->queue, lm, &path_options);
++          self_text = (LogProtoTextClient *) proto;
++          /* free the unconsumed message during reloading configuration */ 
++          if ((LW_FLUSH_QUEUE == flush_mode) && self_text->partial_free && self_text->partial)
++            {
++              self_text->partial_free(self_text->partial);
++              self_text->partial = NULL;
++              log_msg_unref(lm);
++            }
++          else
++            {
++              /* push back to the queue */
++              log_queue_push_head(self->queue, lm, &path_options);
++            }
+           msg_set_context(NULL);
+           log_msg_refcache_stop();
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch b/meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch
new file mode 100644
index 0000000..e8119b8
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng-verify-the-list-before-del.patch
@@ -0,0 +1,38 @@
+Verify the validity of the pointer before delete it
+
+Otherwise, we got a crash at logqueue-fifo.c:344
+  344 iv_list_del(&node->list);
+
+Upstream-Status: Pending
+
+Signed-off-by: Xufeng Zhang <xufeng.zhang@windriver.com>
+---
+--- a/lib/logqueue-fifo.c
++++ b/lib/logqueue-fifo.c
+@@ -339,15 +339,18 @@
+       *msg = node->msg;
+       path_options->ack_needed = node->ack_needed;
+       self->qoverflow_output_len--;
+-      if (!push_to_backlog)
++      if ((&node->list) && (&node->list)->next && (&node->list)->prev)
+         {
+-          iv_list_del(&node->list);
+-          log_msg_free_queue_node(node);
+-        }
+-      else
+-        {
+-          iv_list_del_init(&node->list);
+-        }
++          if (!push_to_backlog)
++            {
++              iv_list_del(&node->list);
++              log_msg_free_queue_node(node);
++            }
++          else
++            {
++              iv_list_del_init(&node->list);
++            }
++        }
+     }
+   else
+     {
diff --git a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
index e760dfb..f0da2b7 100644
--- a/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
+++ b/meta-oe/recipes-support/syslog-ng/files/syslog-ng.conf
@@ -1,11 +1,11 @@
-@version: 3.2
+@version: 3.5
 #
 # Syslog-ng configuration file, compatible with default Debian syslogd
 # installation. Originally written by anonymous (I can't find his name)
 # Revised, and rewrited by me (SZALAY Attila <sasa@debian.org>)
 
 # First, set some global options.
-options { long_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
+options { chain_hostnames(off); flush_lines(0); use_dns(no); use_fqdn(no);
 	  owner("root"); group("adm"); perm(0640); stats_freq(0);
 	  bad_hostname("^gconfd$");
 };
@@ -83,7 +83,7 @@ destination d_ppp { file("/var/log/ppp.log"); };
 ########################
 # Filters
 ########################
-# Here's come the filter options. With this rules, we can set which 
+# Here's come the filter options. With this rules, we can set which
 # message go where.
 
 filter f_dbg { level(debug); };
@@ -95,7 +95,7 @@ filter f_crit { level(crit .. emerg); };
 
 filter f_debug { level(debug) and not facility(auth, authpriv, news, mail); };
 filter f_error { level(err .. emerg) ; };
-filter f_messages { level(info,notice,warn) and 
+filter f_messages { level(info,notice,warn) and
                     not facility(auth,authpriv,cron,daemon,mail,news); };
 
 filter f_auth { facility(auth, authpriv) and not filter(f_debug); };
diff --git a/meta-oe/recipes-support/syslog-ng/files/volatiles.03_syslog-ng b/meta-oe/recipes-support/syslog-ng/files/volatiles.03_syslog-ng
new file mode 100644
index 0000000..3c4a50d
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/files/volatiles.03_syslog-ng
@@ -0,0 +1 @@
+d root root 0755 /var/run/syslog-ng none
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
index 8484658..493bbdc 100644
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng.inc
@@ -1,98 +1,91 @@
-DESCRIPTION = "Alternative system logger daemon"
-DEPENDS = "libol flex eventlog glib-2.0"
-LICENSE = "GPL LGPL"
-LIC_FILES_CHKSUM = "file://COPYING;md5=7ec1bcc46f28b11f4722e20d9b7dd4d5"
-
-# syslog initscript is handled explicitly because order of
-# update-rc.d and update-alternatives is important
-RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
+SUMMARY = "Alternative system logger daemon"
+DESCRIPTION = "syslog-ng, as the name shows, is a syslogd replacement, \
+but with new functionality for the new generation. The original syslogd \
+allows messages only to be sorted based on priority/facility pairs; \
+syslog-ng adds the possibility to filter based on message contents using \
+regular expressions. The new configuration scheme is intuitive and powerful. \
+Forwarding logs over TCP and remembering all forwarding hops makes it \
+ideal for firewalled environments. \
+"
+HOMEPAGE = "http://www.balabit.com/network-security/syslog-ng/opensource-logging-system"
 
-INC_PR = "r12"
+LICENSE = "GPLv2 & LGPLv2.1"
+LIC_FILES_CHKSUM = "file://COPYING;md5=e0e8658d9be248f01b7933df24dc1408"
 
-inherit autotools systemd
+DEPENDS = "flex eventlog glib-2.0"
 
-SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${PN}_${PV}.tar.gz"
+SRC_URI = "http://www.balabit.com/downloads/files/syslog-ng/sources/${PV}/source/${BPN}_${PV}.tar.gz \
+           file://syslog-ng.conf \
+           file://initscript \
+           file://volatiles.03_syslog-ng \
+"
 
-noipv6 = "${@base_contains('DISTRO_FEATURES', 'ipv6', '', '--disable-ipv6', d)}"
+inherit autotools systemd pkgconfig update-rc.d update-alternatives
 
 EXTRA_OECONF = " \
-    --with-libnet=${STAGING_BINDIR_CROSS} \
     --enable-dynamic-linking \
-    ${noipv6} \
-    --enable-ssl \
     --disable-sub-streams \
     --disable-pacct \
-    --disable-linux-caps \
-    --disable-pcre \
-    --disable-sql \
+    --localstatedir=${localstatedir}/run/${BPN} \
+    --sysconfdir=${sysconfdir}/${BPN} \
+    --with-module-dir=${libdir}/${BPN} \
 "
 
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--with-systemdsystemunitdir=${systemd_unitdir}/system/', '--without-systemdsystemunitdir', d)}"
-EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'systemd', '--enable-systemd', '--disable-systemd', d)}"
+PACKAGECONFIG ??= "openssl \
+    ${@base_contains('DISTRO_FEATURES', 'ipv6', 'ipv6', '', d)} \
+    ${@base_contains('DISTRO_FEATURES', 'systemd', 'systemd', '', d)} \
+"
+PACKAGECONFIG[openssl] = "--enable-ssl,--disable-ssl,openssl,"
+PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,,"
+PACKAGECONFIG[systemd] = "--enable-systemd --with-systemdsystemunitdir=${systemd_unitdir}/system/,--disable-systemd --without-systemdsystemunitdir,systemd,"
+PACKAGECONFIG[linux-caps] = "--enable-linux-caps,--disable-linux-caps,libcap,"
+PACKAGECONFIG[pcre] = "--enable-pcre,--disable-pcre,libpcre,"
+PACKAGECONFIG[dbi] = "--enable-sql,--disable-sql,libdbi,"
+PACKAGECONFIG[libnet] = "--enable-libnet --with-libnet=${STAGING_BINDIR_CROSS},--disable-libnet,libnet,"
+PACKAGECONFIG[smtp] = "--enable-smtp --with-libesmtp=${STAGING_LIBDIR},--disable-smtp,libesmtp,"
 
 do_configure_prepend() {
     eval "${@base_contains('DISTRO_FEATURES', 'largefile', '', 'sed -i -e "s/-D_LARGEFILE_SOURCE//" -e "s/-D_FILE_OFFSET_BITS=64//" ${S}/configure.in', d)}"
 }
 
-# rename modules.conf because it breaks update-modules 
-# see http://lists.linuxtogo.org/pipermail/openembedded-devel/2011-October/035537.html
 do_install_append() {
-    mv ${D}/${sysconfdir}/modules.conf ${D}/${sysconfdir}/scl-modules.conf
-    sed -i "s#@include 'modules.conf'#@include 'scl-modules.conf'#g" ${D}/${sysconfdir}/scl.conf
-    install -d ${D}/${sysconfdir}/${PN}
-    install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${PN}.conf
+    install -d ${D}/${sysconfdir}/${BPN}
+    install ${WORKDIR}/syslog-ng.conf ${D}${sysconfdir}/${BPN}/${BPN}.conf
     install -d ${D}/${sysconfdir}/init.d
-    install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${PN}
+    install -m 755 ${WORKDIR}/initscript ${D}/${sysconfdir}/init.d/syslog.${BPN}
+    install -d ${D}/${sysconfdir}/default/volatiles/
+    install -m 755 ${WORKDIR}/volatiles.03_syslog-ng ${D}/${sysconfdir}/default/volatiles/03_syslog-ng
+
+    # Remove /var/run as it is created on startup
+    rm -rf ${D}${localstatedir}/run
 }
 
-FILES_${PN} = "${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
+PACKAGES += "${PN}-tools"
+
+FILES_${PN} = "\
+    ${bindir}/* ${sbindir}/* ${libexecdir}/* ${libdir}/lib*${SOLIBS} \
     ${sysconfdir} ${sharedstatedir} ${localstatedir} \
     ${base_bindir}/* ${base_sbindir}/* \
     ${base_libdir}/*${SOLIBS} \
     ${datadir}/${BPN} ${libdir}/${BPN}/*${SOLIBS} \
-    ${datadir}/include/scl/ ${datadir}/xsd"
+    ${datadir}/include/scl/ ${datadir}/xsd \
+"
 FILES_${PN}-dev += "${libdir}/${BPN}/lib*.la ${libdir}/${BPN}/*${SOLIBSDEV}"
-CONFFILES_${PN} = "${sysconfdir}/${PN}.conf ${sysconfdir}/scl.conf ${sysconfdir}/scl-modules.conf"
+FILES_${PN}-tools = "${datadir}/tools"
+CONFFILES_${PN} = "${sysconfdir}/${BPN}.conf ${sysconfdir}/scl.conf"
+
+# syslog initscript is handled explicitly because order of
+# update-rc.d and update-alternatives is important
+RDEPENDS_${PN} += " ${@base_conditional("ONLINE_PACKAGE_MANAGEMENT", "none", "", "update-rc.d", d)}"
 
 RPROVIDES_${PN} += "${PN}-systemd"
 RREPLACES_${PN} += "${PN}-systemd"
 RCONFLICTS_${PN} += "${PN}-systemd"
 SYSTEMD_SERVICE_${PN} = "${PN}.service"
 
-pkg_postinst_${PN} () {
-    /etc/init.d/syslog stop
-    update-alternatives --install ${sysconfdir}/init.d/syslog syslog-init syslog.${PN} 200
-
-    if test "x$D" != "x"; then
-        OPT="-r $D"
-    else
-        OPT="-s"
-    fi
-    # remove all rc.d-links potentially created from alternative
-    # syslog packages before creating new ones
-    update-rc.d $OPT -f syslog remove
-    update-rc.d $OPT syslog start 20 2 3 4 5 . stop 90 0 1 6 .
-}
-
-pkg_prerm_${PN} () {
-    if test "x$D" = "x"; then
-        if test "$1" = "upgrade" -o "$1" = "remove"; then
-            /etc/init.d/syslog stop
-        fi
-    fi
+ALTERNATIVE_${PN} = "syslog-init"
+ALTERNATIVE_PRIORITY[syslog-init] = "200"
+ALTERNATIVE_LINK_NAME[syslog-init] = "${sysconfdir}/init.d/syslog"
 
-    update-alternatives --remove syslog-init syslog.${PN}
-}
-
-pkg_postrm_${PN} () {
-    if test "x$D" != "x"; then
-        OPT="-r $D"
-    else
-        OPT=""
-    fi
-    if test "$1" = "remove" -o "$1" = "purge"; then
-        if ! test -e "/etc/init.d/syslog"; then
-            update-rc.d $OPT syslog remove
-        fi
-    fi
-}
+INITSCRIPT_NAME = "syslog"
+INITSCRIPT_PARAMS = "start 20 2 3 4 5 . stop 90 0 1 6 ."
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
deleted file mode 100644
index 6d1fee7..0000000
--- a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.2.5.bb
+++ /dev/null
@@ -1,10 +0,0 @@
-require syslog-ng.inc
-PR = "${INC_PR}.1"
-
-SRC_URI += " \
-    file://syslog-ng.conf \
-    file://initscript \
-"
-
-SRC_URI[md5sum] = "60737452ce898f9dc7170dfdc9bfd732"
-SRC_URI[sha256sum] = "ffc9f3a0ebea836c1c737b1ff49efe731d885af1d8aacf9eca79d9144eeefa89"
diff --git a/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
new file mode 100644
index 0000000..12b0dc3
--- /dev/null
+++ b/meta-oe/recipes-support/syslog-ng/syslog-ng_3.5.4.1.bb
@@ -0,0 +1,17 @@
+require syslog-ng.inc
+
+SRC_URI += " \
+    file://afsql-afsql_dd_insert_db-refactor.patch \
+    file://deinit-the-new-config-when-reverting-to-the.patch \
+    file://fix-a-memory-leak-in-log_driver_free.patch \
+    file://fix-config-libnet.patch \
+    file://fix-invalid-ownership.patch \
+    file://Fix-the-memory-leak-problem-for-mutex.patch \
+    file://Fix-the-memory-leak-problem-when-HAVE_ENVIRON-defined.patch \
+    file://free-global-LogTemplateOptions.patch \
+    file://logwriter-still-free-the-unconsumed-item.patch \
+    file://syslog-ng-verify-the-list-before-del.patch \
+"
+
+SRC_URI[md5sum] = "ff3bf223ebafbaa92b69a2d5b729f368"
+SRC_URI[sha256sum] = "92c6969e4172b4fd32390f80043b4de7b116f29989d8c2e5a8a687ee6dcd6f66"
-- 
2.0.0


