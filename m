Return-Path: <martin.jansa@gmail.com>
Received: from mail-wm0-f44.google.com (mail-wm0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 34E6F606BF
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 10:51:18 +0000 (UTC)
Received: by mail-wm0-f44.google.com with SMTP id q128so168035590wma.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Jul 2016 03:51:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=from:date:to:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=lxMO4Z3Mwo9Jy6afUB0SsVTqit8k+VV43mfuJm3NbFU=;
	b=hLXH6d4KpTYQc/dFQPQ7r6rVtYDp/NJFhvjBwrHiYN33VO5KytrQaxkSUfMlumsGVN
	CbdDFg6JmCcIKOixVQJcscVZgJTCqD3wKuVDuV2bl1nkA43TDCz6MtfDknqtUl1kLddE
	j0ELIKEBmNPQDfej46BMfFRgHSmAwKZ7768l0GxP8bnXKmz0qYetHRU5pjxRc+OE36+e
	cX9zl8Fz+DEZ6vppzQuw2e9ni8cdAruqo/gnagyA3Z9Bs0EmNBVj62KpDIHpWdtiCFrN
	O247boCeq+q9CPfPf1Px+U14Ytn5Qq0u/7mlLTqB5kHMMy8bcdtCeoNT/RMRPIGlG0I4
	0JNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:date:to:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=lxMO4Z3Mwo9Jy6afUB0SsVTqit8k+VV43mfuJm3NbFU=;
	b=RdzcdMf0ffzoclM9YJeb6M+60QCamB6UTZtEuThAhQlXY6beDMc0szXuwDQGVFYN+f
	GiWGYrTMPrykklN44IdMMLurSKnZkV/+6Uj6hIR+/f97zfBelCwIyv3vW6BrriGtdYzU
	i7pDGXp6HdNf3oNfoRRoGEkhueDywY3Ma4W4G7hzOpCrASvo528G2FEORng7ZGiK+/QC
	G4DCXba6th+vPyrwahUov3158mKJlCXxy+2Seri+mvWGVSnDGfPlL7a2yf87N7c2MAgq
	f6FVKajzhB50PGHlazDaz/EfWfYlN9BQF8GCpfgQ7sy+pNgFV2Oj7xIGHpyUFGYXQ2D3
	73+A==
X-Gm-Message-State: AEkooutA9vD/wmnwwLo80ubSqqd4QsE98wBH3k5vtVq+DYgV9cFsgOKYcNmKT+jfCHiydg==
X-Received: by 10.28.154.21 with SMTP id c21mr25870479wme.63.1469530276521;
	Tue, 26 Jul 2016 03:51:16 -0700 (PDT)
Received: from localhost (ip-89-176-104-169.net.upcbroadband.cz.
	[89.176.104.169]) by smtp.gmail.com with ESMTPSA id
	u125sm32196879wmg.22.2016.07.26.03.51.15
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Tue, 26 Jul 2016 03:51:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Tue, 26 Jul 2016 12:51:16 +0200
To: openembedded-devel@lists.openembedded.org
Message-ID: <20160726105116.nanzyyq6dsl3qisu@jama>
References: <1461034656-39314-1-git-send-email-daicy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1461034656-39314-1-git-send-email-daicy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.6.2 (2016-06-11)
Subject: Re: [meta-oe][PATCH] libnih: add new recipe to meta-oe
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
X-List-Received-Date: Tue, 26 Jul 2016 10:51:22 -0000
X-Groupsio-MsgNum: 62338
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nnsmrxvwvwwfeoju"
Content-Disposition: inline

--nnsmrxvwvwwfeoju
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 19, 2016 at 05:57:36AM +0300, Dai Caiyun wrote:
> meta-webos hasn't been maitained for about 2years.
> So, how about add libnih into meta-oe.
>=20
> Fix the error as foloowing:
> invalid tag value("^[A-Za-z0-9+._]+$") Release: Release: r2-4ubuntu16.

This didn't make it into ML until today and it's also missing in
patchwork, can you please resend if you still need this?

> Signed-off-by: Dai Caiyun <daicy.fnst@cn.fujitsu.com>
> ---
>  .../libnih-1.0.3/libnih_1.0.3-4ubuntu16.patch      | 3593 ++++++++++++++=
++++++
>  meta-oe/recipes-support/libnih/libnih_1.0.3.bb     |   40 +
>  2 files changed, 3633 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libnih/libnih-1.0.3/libnih_1.=
0.3-4ubuntu16.patch
>  create mode 100644 meta-oe/recipes-support/libnih/libnih_1.0.3.bb
>=20
> diff --git a/meta-oe/recipes-support/libnih/libnih-1.0.3/libnih_1.0.3-4ub=
untu16.patch b/meta-oe/recipes-support/libnih/libnih-1.0.3/libnih_1.0.3-4ub=
untu16.patch
> new file mode 100644
> index 0000000..5d125c8
> --- /dev/null
> +++ b/meta-oe/recipes-support/libnih/libnih-1.0.3/libnih_1.0.3-4ubuntu16.=
patch
> @@ -0,0 +1,3593 @@
> +--- libnih-1.0.3.orig/ChangeLog
> ++++ libnih-1.0.3/ChangeLog
> +@@ -1,3 +1,84 @@
> ++2013-03-13  Steve Langasek  <steve.langasek@ubuntu.com>
> ++
> ++	* nih/watch.c (nih_watch_walk_filter): New NihFileFilter function
> ++	passed to nih_dir_walk_scan() to ensure the nih_watch_new() filter
> ++	function is passed the NihWatch data rather than the data passed to
> ++	the nih_dir_walk() NihFileVisitor function (LP: #776532).
> ++
> ++	* nih/tests/test_watch.c (test_new): New test "with filter and data"
> ++	to ensure filter is passed correct value.
> ++
> ++2013-02-28  James Hunt  <james.hunt@ubuntu.com>
> ++
> ++	* Removal of gcc 'malloc' function attribute resulting from
> ++	  a clarification in its description which makes its use invalid.
> ++	  (LP: #1123588).
> ++
> ++2013-02-05  James Hunt  <james.hunt@ubuntu.com>
> ++
> ++	* nih/logging.c: nih_log_abort_message(): Remove erroneous check
> ++	  left over from use of __abort_msg weak symbol.
> ++	* nih/tests/test_logging.c: Remove unecessary check on whether
> ++	  __nih_abort_msg has an address.
> ++
> ++2012-12-13  St=C3=A9phane Graber  <stgraber@ubuntu.com>
> ++
> ++	* nih-dbus-tool/type.c, nih-dbus-tool/marshal.c: Update dbus code
> ++	generator to allow for empty lists for type 'as'.  This drops the
> ++	!=3D NULL check for NULL terminated arrays and moves the iteration
> ++	loop inside an 'if' statement.
> ++
> ++2012-12-11  Dmitrijs Ledkovs  <dmitrijs.ledkovs@canonical.com>
> ++
> ++	* nih/file.c (nih_dir_walk_scan): Fallback to lstat, if the
> ++	non-portable dirent.d_type is not available (LP: #672643) (Closes:
> ++	#695604).
> ++
> ++2012-12-10  Petr Lautrbach  <plautrba@redhat.com>
> ++
> ++	* nih/tests/test_file.c: don't use dirent.d_type (not portable)
> ++
> ++2012-10-25  James Hunt  <james.hunt@ubuntu.com>
> ++
> ++	* nih/logging.c: Use our own __nih_abort_msg rather than the
> ++	(e)glibc private symbol __abort_msg to avoid upgrade issues (LP: #9973=
59).
> ++	* nih/tests/test_logging.c: Update tests for __nih_abort_msg.
> ++
> ++2011-08-31  James Hunt  <james.hunt@ubuntu.com>
> ++
> ++	* nih-dbus-tool/tests/test_com.netsplit.Nih.Test_object.c
> ++	(test_unix_fd_to_str): Sanity check value before invoking strchr in
> ++	case it returns address of null (which would give a misleading test
> ++	pass).
> ++	* nih-dbus-tool/tests/test_com.netsplit.Nih.Test_proxy.c
> ++	(test_unix_fd_to_str, test_unix_fd_to_str_sync): Sanity check value
> ++	before invoking strchr in case it returns address of null (which would
> ++	give a misleading test pass).
> ++	* nih/config.c (): nih_config_block_end: Add check to ensure strchr()
> ++	doesn't return address of null since this would result in a misleading
> ++	return value of TRUE.
> ++
> ++	* nih/string.c (nih_str_split): Fixes to avoid over-running
> ++	input string and also returning an empty string array entry
> ++	when repeat is true (LP: #834813).
> ++	* nih/tests/test_string.c (test_str_split): Added a lot of new
> ++	tests for nih_str_split().
> ++
> ++2011-08-26  James Hunt  <james.hunt@ubuntu.com>
> ++
> ++	* nih/io.c (nih_io_select_fds): Ensure number of fds being managed
> ++	is within limits.
> ++
> ++	* nih/config.c, nih/error.h, nih/io.c, nih/test_files.h: Correct
> ++	typos in comments.
> ++
> ++2011-06-20  James Hunt  <james.hunt@ubuntu.com>
> ++
> ++	* nih/watch.c (nih_watch_handle): Handle non-directory watches;
> ++	previously a file watch resulted in an invalid file path ending in
> ++	a single slash (LP:#777097).
> ++	* nih/tests/test_watch.c: Added explicit test for watch on a file.
> ++
> + 2010-12-23  Scott James Remnant  <scott@netsplit.com>
> +=20
> + 	* NEWS: Release 1.0.3
> +--- libnih-1.0.3.orig/nih/watch.c
> ++++ libnih-1.0.3/nih/watch.c
> +@@ -2,8 +2,8 @@
> +  *
> +  * watch.c - watching of files and directories with inotify
> +  *
> +- * Copyright =C2=A9 2009 Scott James Remnant <scott@netsplit.com>.
> +- * Copyright =C2=A9 2009 Canonical Ltd.
> ++ * Copyright =C2=A9 2011 Scott James Remnant <scott@netsplit.com>.
> ++ * Copyright =C2=A9 2011 Canonical Ltd.
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License version 2, as
> +@@ -71,6 +71,9 @@
> + 					      uint32_t events, uint32_t cookie,
> + 					      const char *name,
> + 					      int *caught_free);
> ++static int             nih_watch_walk_filter (void *data, const char *p=
ath,
> ++					      int is_dir)
> ++	__attribute__ ((warn_unused_result));
> +=20
> +=20
> + /**
> +@@ -91,7 +94,7 @@
> +  * sub-directories will be automatically watched.
> +  *
> +  * Additionally, the set of files and directories within @path can be
> +- * limited by passing a @filter function which will recieve the paths a=
nd
> ++ * limited by passing a @filter function which will receive the paths a=
nd
> +  * may return TRUE to indicate that the path received should not be wat=
ched.
> +  *
> +  * When a file is created within @path, or moved from outside this loca=
tion
> +@@ -104,7 +107,7 @@
> +  * files that exist under @path when the watch is first added.  This on=
ly
> +  * occurs if the watch can be added.
> +  *
> +- * This is a very high level wrapped around the inotify API; lower leve=
ls
> ++ * This is a very high level wrapper around the inotify API; lower leve=
ls
> +  * can be obtained using the inotify API itself and some of the helper
> +  * functions used by this one.
> +  *
> +@@ -185,6 +188,35 @@
> + }
> +=20
> +=20
> ++ /**
> ++ * nih_watch_walk_filter:
> ++ * @data: NihWatch,
> ++ * @path: path to file,
> ++ * @is_dir: TRUE if @path is a directory.
> ++ *
> ++ * Callback function for nih_dir_walk(), used by nih_watch_add() to wrap
> ++ * the user-specified NihFileFilter (watch->filter) with a filter that =
can
> ++ * take watch itself as an argument.
> ++ *
> ++ * Returns: TRUE if the path should be ignored, FALSE otherwise.
> ++ **/
> ++static int
> ++nih_watch_walk_filter (void *data, const char *path, int is_dir)
> ++{
> ++    NihWatch *watch;
> ++
> ++    watch =3D (NihWatch *)data;
> ++
> ++    nih_assert (watch);
> ++
> ++    /* No filter, so accept all files */
> ++    if (! watch->filter)
> ++           return FALSE;
> ++
> ++    return watch->filter (watch->data, path, is_dir);
> ++}
> ++
> ++
> + /**
> +  * nih_watch_handle_by_wd:
> +  * @watch: watch to search,
> +@@ -295,7 +327,7 @@
> + 	 * one; errors within the walk are warned automatically, so if this
> + 	 * fails, it means we literally couldn't watch the top-level.
> + 	 */
> +-	if (subdirs && (nih_dir_walk (path, watch->filter,
> ++	if (subdirs && (nih_dir_walk (path, nih_watch_walk_filter,
> + 				      (NihFileVisitor)nih_watch_add_visitor,
> + 				      NULL, watch) < 0)) {
> + 		NihError *err;
> +@@ -494,12 +526,21 @@
> + 		return;
> + 	}
> +=20
> ++	/* Every other event must come with a name */
> ++	if (name && *name) {
> +=20
> +-	/* Every other event must come with a name. */
> +-	if ((! name) || strchr (name, '/'))
> +-		return;
> ++		/* If name refers to a directory, there should be no associated
> ++		 * path - just the name of the path element.
> ++		 */
> ++		if (strchr (name, '/'))
> ++			return;
> +=20
> +-	path =3D NIH_MUST (nih_sprintf (NULL, "%s/%s", handle->path, name));
> ++		/* Event occured for file within a watched directory */
> ++		path =3D NIH_MUST (nih_sprintf (NULL, "%s/%s", handle->path, name));
> ++	} else {
> ++		/* File event occured */
> ++		path =3D NIH_MUST (nih_strdup (NULL, handle->path));
> ++	}
> +=20
> + 	/* Check the filter */
> + 	if (watch->filter && watch->filter (watch->data, path,
> +--- libnih-1.0.3.orig/nih/hash.h
> ++++ libnih-1.0.3/nih/hash.h
> +@@ -141,7 +141,7 @@
> +  * @hash: hash table to iterate,
> +  * @iter: name of iterator variable.
> +  *
> +- * Expans to nested for statements that iterate over each entry in each
> ++ * Expands to nested for statements that iterate over each entry in each
> +  * bin of @hash, except for the bin head pointer, setting @iter to each
> +  * entry for the block within the loop.  A variable named _@iter_i is u=
sed
> +  * to iterate the hash bins.
> +@@ -203,7 +203,7 @@
> + 				   NihKeyFunction key_function,
> + 				   NihHashFunction hash_function,
> + 				   NihCmpFunction cmp_function)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NihList *   nih_hash_add          (NihHash *hash, NihList *entry);
> + NihList *   nih_hash_add_unique   (NihHash *hash, NihList *entry);
> +--- libnih-1.0.3.orig/nih/main.h
> ++++ libnih-1.0.3/nih/main.h
> +@@ -138,7 +138,7 @@
> +=20
> + NihMainLoopFunc *nih_main_loop_add_func  (const void *parent,
> + 					  NihMainLoopCb callback, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + void             nih_main_term_signal    (void *data, NihSignal *signal=
);
> +=20
> +--- libnih-1.0.3.orig/nih/command.h
> ++++ libnih-1.0.3/nih/command.h
> +@@ -123,7 +123,7 @@
> +=20
> + NihCommand *nih_command_join   (const void *parent,
> + 				const NihCommand *a, const NihCommand *b)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih/config.h
> ++++ libnih-1.0.3/nih/config.h
> +@@ -140,10 +140,10 @@
> + char *    nih_config_next_token      (const void *parent, const char *f=
ile,
> + 				      size_t len, size_t *pos, size_t *lineno,
> + 				      const char *delim, int dequote)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *    nih_config_next_arg        (const void *parent, const char *f=
ile,
> + 				      size_t len, size_t *pos, size_t *lineno)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + void      nih_config_next_line       (const char *file, size_t len,
> + 				      size_t *pos, size_t *lineno);
> +=20
> +@@ -155,15 +155,15 @@
> +=20
> + char **   nih_config_parse_args      (const void *parent, const char *f=
ile,
> + 				      size_t len, size_t *pos, size_t *lineno)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *    nih_config_parse_command   (const void *parent, const char *f=
ile,
> + 				      size_t len, size_t *pos, size_t *lineno)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    nih_config_parse_block     (const void *parent, const char *f=
ile,
> + 				      size_t len, size_t *pos, size_t *lineno,
> + 				      const char *type)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + int       nih_config_skip_block      (const char *file, size_t len,
> + 				      size_t *lineno, size_t *pos,
> + 				      const char *type, size_t *endpos)
> +--- libnih-1.0.3.orig/nih/io.c
> ++++ libnih-1.0.3/nih/io.c
> +@@ -2,8 +2,8 @@
> +  *
> +  * io.c - file and socket input/output handling
> +  *
> +- * Copyright =C2=A9 2009 Scott James Remnant <scott@netsplit.com>.
> +- * Copyright =C2=A9 2009 Canonical Ltd.
> ++ * Copyright =C2=A9 2011 Scott James Remnant <scott@netsplit.com>.
> ++ * Copyright =C2=A9 2011 Canonical Ltd.
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License version 2, as
> +@@ -165,6 +165,7 @@
> + 	nih_assert (readfds !=3D NULL);
> + 	nih_assert (writefds !=3D NULL);
> + 	nih_assert (exceptfds !=3D NULL);
> ++	nih_assert (*nfds <=3D FD_SETSIZE);
> +=20
> + 	nih_io_init ();
> +=20
> +@@ -186,6 +187,9 @@
> + 			*nfds =3D nih_max (*nfds, watch->fd + 1);
> + 		}
> + 	}
> ++
> ++	/* Re-check in case we exceeded the limit in the loop */
> ++	nih_assert (*nfds <=3D FD_SETSIZE);
> + }
> +=20
> + /**
> +@@ -901,7 +905,7 @@
> +  * read and placed into the receive buffer or queue, and the reader fun=
ction
> +  * is called if set.
> +  *
> +- * Any data or messaages in the send buffer or queue are written out if=
 the
> ++ * Any data or messages in the send buffer or queue are written out if =
the
> +  * @events includes NIH_IO_WRITE.
> +  *
> +  * Errors are handled when data is read, and result in the error handled
> +@@ -1211,7 +1215,7 @@
> +  * This function is called when the local end of a file descriptor being
> +  * managed by NihIo should be closed.  Usually this is because the remo=
te
> +  * end has been closed (without error) but it can also be because no
> +- * error handler was given
> ++ * error handler was given.
> +  *
> +  * Normally this just calls the close handler, or if not available, it
> +  * closes the file descriptor and frees the structure (which may be
> +@@ -1291,7 +1295,7 @@
> +  * @io: structure to be destroyed.
> +  *
> +  * Closes the file descriptor associated with an NihIo structure so that
> +- * the structure can be freed.  IF an error is caught by closing the
> ++ * the structure can be freed.  If an error is caught by closing the
> +  * descriptor, the error handler is called instead of the error being r=
aised;
> +  * this allows you to group your error handling in one place rather than
> +  * special-case close.
> +--- libnih-1.0.3.orig/nih/watch.h
> ++++ libnih-1.0.3/nih/watch.h
> +@@ -156,7 +156,7 @@
> + 			     NihCreateHandler create_handler,
> + 			     NihModifyHandler modify_handler,
> + 			     NihDeleteHandler delete_handler, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int       nih_watch_add     (NihWatch *watch, const char *path, int sub=
dirs)
> + 	__attribute__ ((warn_unused_result));
> +--- libnih-1.0.3.orig/nih/tree.h
> ++++ libnih-1.0.3/nih/tree.h
> +@@ -344,9 +344,9 @@
> +=20
> + void          nih_tree_init           (NihTree *tree);
> + NihTree *     nih_tree_new            (const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + NihTreeEntry *nih_tree_entry_new      (const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NihTree *     nih_tree_add            (NihTree *tree, NihTree *node,
> + 				       NihTreeWhere where);
> +--- libnih-1.0.3.orig/nih/file.c
> ++++ libnih-1.0.3/nih/file.c
> +@@ -65,7 +65,7 @@
> + /* Prototypes for static functions */
> + static char **nih_dir_walk_scan  (const char *path, NihFileFilter filte=
r,
> + 				  void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + static int    nih_dir_walk_visit (const char *dirname, NihList *dirs,
> + 				  const char *path, NihFileFilter filter,
> + 				  NihFileVisitor visitor,
> +@@ -619,6 +619,8 @@
> + 	struct dirent  *ent;
> + 	char          **paths;
> + 	size_t          npaths;
> ++	int             isdir;
> ++	struct stat     statbuf;
> +=20
> + 	nih_assert (path !=3D NULL);
> +=20
> +@@ -640,7 +642,15 @@
> + 		subpath =3D NIH_MUST (nih_sprintf (NULL, "%s/%s",
> + 						 path, ent->d_name));
> +=20
> +-		if (filter && filter (data, subpath, ent->d_type =3D=3D DT_DIR))
> ++		if (ent->d_type =3D=3D DT_UNKNOWN) {
> ++			if ( lstat (subpath, &statbuf))
> ++				isdir =3D 0;
> ++			else
> ++				isdir =3D S_ISDIR(statbuf.st_mode);
> ++		} else
> ++			isdir =3D ent->d_type =3D=3D DT_DIR;
> ++
> ++		if (filter && filter (data, subpath, isdir))
> + 			continue;
> +=20
> + 		NIH_MUST (nih_str_array_addp (&paths, NULL, &npaths, subpath));
> +--- libnih-1.0.3.orig/nih/alloc.c
> ++++ libnih-1.0.3/nih/alloc.c
> +@@ -119,8 +119,7 @@
> + static inline int          nih_alloc_context_free   (NihAllocCtx *ctx);
> +=20
> + static inline NihAllocRef *nih_alloc_ref_new        (NihAllocCtx *paren=
t,
> +-						     NihAllocCtx *child)
> +-	__attribute__ ((malloc));
> ++						     NihAllocCtx *child);
> + static inline void         nih_alloc_ref_free       (NihAllocRef *ref);
> + static inline NihAllocRef *nih_alloc_ref_lookup     (NihAllocCtx *paren=
t,
> + 						     NihAllocCtx *child);
> +--- libnih-1.0.3.orig/nih/timer.h
> ++++ libnih-1.0.3/nih/timer.h
> +@@ -59,7 +59,7 @@
> +  * @months: months (1-12),
> +  * @wdays: days of week (0-7).
> +  *
> +- * Indidcates when scheduled timers should be run, each member is a bit
> ++ * Indicates when scheduled timers should be run, each member is a bit
> +  * field where the bit is 1 if the timer should be run for that value a=
nd
> +  * 0 if not.
> +  **/
> +@@ -117,14 +117,14 @@
> +=20
> + NihTimer *nih_timer_add_timeout   (const void *parent, time_t timeout,
> + 				   NihTimerCb callback, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + NihTimer *nih_timer_add_periodic  (const void *parent, time_t period,
> + 				   NihTimerCb callback, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + NihTimer *nih_timer_add_scheduled (const void *parent,
> + 				   NihTimerSchedule *schedule,
> + 				   NihTimerCb callback, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NihTimer *nih_timer_next_due       (void);
> + void      nih_timer_poll           (void);
> +--- libnih-1.0.3.orig/nih/config.c
> ++++ libnih-1.0.3/nih/config.c
> +@@ -2,8 +2,8 @@
> +  *
> +  * config.c - configuration file parsing
> +  *
> +- * Copyright =C2=A9 2009 Scott James Remnant <scott@netsplit.com>.
> +- * Copyright =C2=A9 2009 Canonical Ltd.
> ++ * Copyright =C2=A9 2011 Scott James Remnant <scott@netsplit.com>.
> ++ * Copyright =C2=A9 2011 Canonical Ltd.
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License version 2, as
> +@@ -657,7 +657,7 @@
> +  * of the returned string are freed, the returned string will also be
> +  * freed.
> +  *
> +- * Returns: the command found or NULL on raised error.
> ++ * Returns: the newly allocated command found or NULL on raised error.
> +  **/
> + char *
> + nih_config_parse_command (const void *parent,
> +@@ -714,7 +714,7 @@
> +  * @lineno: line number,
> +  * @type: block identifier.
> +  *
> +- * Extracts a block of text from @line, stopping when the pharse "end @=
type"
> ++ * Extracts a block of text from @line, stopping when the phrase "end @=
type"
> +  * is encountered without any quotes or blackslash escaping within it.
> +  *
> +  * @file may be a memory mapped file, in which case @pos should be given
> +@@ -950,7 +950,7 @@
> + 		return FALSE;
> +=20
> + 	/* Must be whitespace after */
> +-	if (! strchr (NIH_CONFIG_WS, file[p + 3]))
> ++	if (file[p + 3] && ! strchr (NIH_CONFIG_WS, file[p + 3]))
> + 		return FALSE;
> +=20
> + 	/* Find the second word */
> +--- libnih-1.0.3.orig/nih/option.h
> ++++ libnih-1.0.3/nih/option.h
> +@@ -124,11 +124,11 @@
> + char **    nih_option_parser         (const void *parent,
> + 				      int argc, char *argv[],
> + 				      NihOption *options, int break_nonopt)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NihOption *nih_option_join           (const void *parent,
> + 				      const NihOption *a, const NihOption *b)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int        nih_option_count          (NihOption *option, const char *ar=
g);
> + int        nih_option_int            (NihOption *option, const char *ar=
g);
> +--- libnih-1.0.3.orig/nih/signal.h
> ++++ libnih-1.0.3/nih/signal.h
> +@@ -76,7 +76,7 @@
> +=20
> + NihSignal * nih_signal_add_handler (const void *parent, int signum,
> + 				   NihSignalHandler handler, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + void        nih_signal_handler     (int signum);
> + void        nih_signal_poll        (void);
> +--- libnih-1.0.3.orig/nih/list.h
> ++++ libnih-1.0.3/nih/list.h
> +@@ -37,7 +37,7 @@
> +  * after a known entry, and remove an entry from the list.
> +  *
> +  * List entries may be created in one of two ways.  The most common is =
to
> +- * embed the NihList structure as the frist member of your own structur=
e,
> ++ * embed the NihList structure as the first member of your own structur=
e,
> +  * and initialise it with nih_list_init() after allocating the structur=
e.
> +  * Alternatively you may create NihListEntry structures with
> +  * nih_list_entry_new() and point at your own data from them.
> +@@ -196,10 +196,10 @@
> +=20
> + void          nih_list_init      (NihList *entry);
> + NihList *     nih_list_new       (const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NihListEntry *nih_list_entry_new (const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> +=20
> + NihList *     nih_list_add       (NihList *list, NihList *entry);
> +--- libnih-1.0.3.orig/nih/logging.c
> ++++ libnih-1.0.3/nih/logging.c
> +@@ -39,11 +39,11 @@
> +=20
> +=20
> + /**
> +- * __abort_msg:
> ++ * __nih_abort_msg:
> +  *
> +- * A glibc variable that keeps the assertion message in the core dump.
> ++ * A variable that keeps the assertion message in the core dump.
> +  **/
> +-extern char *__abort_msg __attribute__ ((weak));
> ++char *__nih_abort_msg =3D NULL;
> +=20
> + /**
> +  * logger:
> +@@ -114,19 +114,16 @@
> +  * nih_log_abort_message:
> +  * @message: message to be logged.
> +  *
> +- * Save @message in the glibc __abort_msg variable so it can be retriev=
ed
> ++ * Save @message in the __nih_abort_msg variable so it can be retrieved
> +  * by debuggers if we should crash at this point.
> +  **/
> + static void
> + nih_log_abort_message (const char *message)
> + {
> +-	if (! &__abort_msg)
> +-		return;
> ++	if (__nih_abort_msg)
> ++		nih_discard (__nih_abort_msg);
> +=20
> +-	if (__abort_msg)
> +-		nih_discard (__abort_msg);
> +-
> +-	__abort_msg =3D NIH_MUST (nih_strdup (NULL, message));
> ++	__nih_abort_msg =3D NIH_MUST (nih_strdup (NULL, message));
> + }
> +=20
> + /**
> +--- libnih-1.0.3.orig/nih/test_files.h
> ++++ libnih-1.0.3/nih/test_files.h
> +@@ -1,7 +1,7 @@
> + /* libnih
> +  *
> +- * Copyright =C2=A9 2009 Scott James Remnant <scott@netsplit.com>.
> +- * Copyright =C2=A9 2009 Canonical Ltd.
> ++ * Copyright =C2=A9 2011 Scott James Remnant <scott@netsplit.com>.
> ++ * Copyright =C2=A9 2011 Canonical Ltd.
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License version 2, as
> +@@ -39,7 +39,7 @@
> +  * TEST_FILENAME:
> +  * @_var: variable to store filename in.
> +  *
> +- * Generate a filename that may be used for testing, it's unlinked it if
> ++ * Generate a filename that may be used for testing, it's unlinked if it
> +  * exists and it's up to you to unlink it when done.  @_var should be at
> +  * least PATH_MAX long.
> +  **/
> +--- libnih-1.0.3.orig/nih/test_process.h
> ++++ libnih-1.0.3/nih/test_process.h
> +@@ -36,7 +36,7 @@
> +  * Spawn a child in which a test can be performed without affecting the
> +  * main flow of the process.  The pid of the child is stored in @_pid.
> +  *
> +- * This macro ensures that the child has begun exectution before the
> ++ * This macro ensures that the child has begun execution before the
> +  * parent is allowed to continue through the usual use of a pipe.
> +  *
> +  * A block of code should follow this macro, which is the code that will
> +--- libnih-1.0.3.orig/nih/child.h
> ++++ libnih-1.0.3/nih/child.h
> +@@ -98,7 +98,7 @@
> + NihChildWatch *nih_child_add_watch (const void *parent, pid_t pid,
> + 				    NihChildEvents events,
> + 				    NihChildHandler handler, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + void           nih_child_poll      (void);
> +=20
> +--- libnih-1.0.3.orig/nih/alloc.h
> ++++ libnih-1.0.3/nih/alloc.h
> +@@ -299,7 +299,7 @@
> +  * It is permissible to take references to foo within its scope, or by
> +  * functions called, in which case it will not be freed.  Also it is
> +  * generally nonsensical to allocate with a parent, since this too will
> +- * prevent it from beign freed.
> ++ * prevent it from being freed.
> +  **/
> + #define nih_local __attribute__ ((cleanup(_nih_discard_local)))
> +=20
> +@@ -307,11 +307,11 @@
> + NIH_BEGIN_EXTERN
> +=20
> + void * nih_alloc                     (const void *parent, size_t size)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + void * nih_realloc                   (void *ptr, const void *parent,
> + 				      size_t size)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int    nih_free                      (void *ptr);
> + int    nih_discard                   (void *ptr);
> +--- libnih-1.0.3.orig/nih/io.h
> ++++ libnih-1.0.3/nih/io.h
> +@@ -269,7 +269,7 @@
> + NihIoWatch *  nih_io_add_watch           (const void *parent, int fd,
> + 					  NihIoEvents events,
> + 					  NihIoWatcher watcher, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + void          nih_io_select_fds          (int *nfds, fd_set *readfds,
> + 					  fd_set *writefds, fd_set *exceptfds);
> +@@ -278,12 +278,12 @@
> +=20
> +=20
> + NihIoBuffer * nih_io_buffer_new          (const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int           nih_io_buffer_resize       (NihIoBuffer *buffer, size_t g=
row);
> + char *        nih_io_buffer_pop          (const void *parent,
> + 					  NihIoBuffer *buffer, size_t *len)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + void          nih_io_buffer_shrink       (NihIoBuffer *buffer, size_t l=
en);
> + int           nih_io_buffer_push         (NihIoBuffer *buffer,
> + 					  const char *str, size_t len)
> +@@ -291,7 +291,7 @@
> +=20
> +=20
> + NihIoMessage *nih_io_message_new         (const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int           nih_io_message_add_control (NihIoMessage *message, int le=
vel,
> + 					  int type, socklen_t len,
> +@@ -300,7 +300,7 @@
> +=20
> + NihIoMessage *nih_io_message_recv        (const void *parent, int fd,
> + 					  size_t *len)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + ssize_t       nih_io_message_send        (NihIoMessage *message, int fd)
> + 	__attribute__ ((warn_unused_result));
> +=20
> +@@ -310,7 +310,7 @@
> + 					  NihIoCloseHandler close_handler,
> + 					  NihIoErrorHandler error_handler,
> + 					  void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + void          nih_io_shutdown            (NihIo *io);
> + int           nih_io_destroy             (NihIo *io);
> +=20
> +@@ -319,14 +319,14 @@
> +=20
> + char *        nih_io_read                (const void *parent, NihIo *io,
> + 					  size_t *len)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + int           nih_io_write               (NihIo *io, const char *str,
> + 					  size_t len)
> + 	__attribute__ ((warn_unused_result));
> +=20
> + char *        nih_io_get                 (const void *parent, NihIo *io,
> + 					  const char *delim)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int           nih_io_printf              (NihIo *io, const char *format=
, ...)
> + 	__attribute__ ((warn_unused_result, format (printf, 2, 3)));
> +--- libnih-1.0.3.orig/nih/test_output.h
> ++++ libnih-1.0.3/nih/test_output.h
> +@@ -61,10 +61,10 @@
> +=20
> + /**
> +  * TEST_FEATURE:
> +- * @_feat: name of function feature being tested.
> ++ * @_feat: name of function or group feature being tested.
> +  *
> +- * Output a message indicating that a sub-test of a function is being
> +- * performed, specifically the feature named _feat.
> ++ * Output a message indicating that a sub-test of a function or
> ++ * group is being performed, specifically the feature named _feat.
> +  **/
> + #define TEST_FEATURE(_feat) \
> + 	printf ("...%s\n", _feat);
> +--- libnih-1.0.3.orig/nih/error.h
> ++++ libnih-1.0.3/nih/error.h
> +@@ -1,7 +1,7 @@
> + /* libnih
> +  *
> +- * Copyright =C2=A9 2009 Scott James Remnant <scott@netsplit.com>.
> +- * Copyright =C2=A9 2009 Canonical Ltd.
> ++ * Copyright =C2=A9 2011 Scott James Remnant <scott@netsplit.com>.
> ++ * Copyright =C2=A9 2011 Canonical Ltd.
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License version 2, as
> +@@ -111,7 +111,7 @@
> +  * @message: human-readable message.
> +  *
> +  * Raises an error with the given details in the current error context,
> +- * if an unhandled error already exists then an error message is emmitt=
ed
> ++ * if an unhandled error already exists then an error message is emitted
> +  * through the logging system; you should try to avoid this.
> +  *
> +  * @message should be a static string, as it will not be freed when the
> +@@ -126,7 +126,7 @@
> +  * @format: format string for human-readable message.
> +  *
> +  * Raises an error with the given details in the current error context,
> +- * if an unhandled error already exists then an error message is emmitt=
ed
> ++ * if an unhandled error already exists then an error message is emitted
> +  * through the logging system; you should try to avoid this.
> +  *
> +  * The human-readable message for the error is parsed according to @for=
mat,
> +@@ -140,7 +140,7 @@
> +  * nih_error_raise_system:
> +  *
> +  * Raises an error with details taken from the current value of errno,
> +- * if an unhandled error already exists then an error message is emmitt=
ed
> ++ * if an unhandled error already exists then an error message is emitted
> +  * through the logging system; you should try to avoid this.
> +  **/
> + #define nih_error_raise_system() \
> +@@ -162,7 +162,7 @@
> +  * @error: existing object to raise.
> +  *
> +  * Raises the existing error object in the current error context,
> +- * if an unhandled error already exists then an error message is emmitt=
ed
> ++ * if an unhandled error already exists then an error message is emitted
> +  * through the logging system; you should try to avoid this.
> +  *
> +  * This is normally used to raise a taken error that has not been handl=
ed,
> +@@ -182,7 +182,7 @@
> +  * @message: human-readable message.
> +  *
> +  * Raises an error with the given details in the current error context,
> +- * if an unhandled error already exists then an error message is emmitt=
ed
> ++ * if an unhandled error already exists then an error message is emitted
> +  * through the logging system; you should try to avoid this.
> +  *
> +  * Will return from the current function with @retval, which may be left
> +@@ -199,7 +199,7 @@
> +  * @retval: return value for function.
> +  *
> +  * Raises an error with details taken from the current value of errno,
> +- * if an unhandled error already exists then an error message is emmitt=
ed
> ++ * if an unhandled error already exists then an error message is emitted
> +  * through the logging system; you should try to avoid this.
> +  *
> +  * Will return from the current function with @retval, which may be left
> +--- libnih-1.0.3.orig/nih/string.h
> ++++ libnih-1.0.3/nih/string.h
> +@@ -35,60 +35,60 @@
> + NIH_BEGIN_EXTERN
> +=20
> + char * nih_sprintf          (const void *parent, const char *format, ..=
=2E)
> +-	__attribute__ ((format (printf, 2, 3), warn_unused_result, malloc));
> ++	__attribute__ ((format (printf, 2, 3), warn_unused_result));
> +=20
> + char * nih_vsprintf         (const void *parent, const char *format,
> + 			     va_list args)
> +-	__attribute__ ((format (printf, 2, 0), warn_unused_result, malloc));
> ++	__attribute__ ((format (printf, 2, 0), warn_unused_result));
> +=20
> + char * nih_strdup           (const void *parent, const char *str)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char * nih_strndup          (const void *parent, const char *str, size_=
t len)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char * nih_strcat           (char **str, const void *parent, const char=
 *src)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char * nih_strncat          (char **str, const void *parent, const char=
 *src,
> + 			     size_t len)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char * nih_strcat_sprintf   (char **str, const void *parent,
> + 			     const char *format, ...)
> +-	__attribute__ ((format (printf, 3, 4), warn_unused_result, malloc));
> ++	__attribute__ ((format (printf, 3, 4), warn_unused_result));
> + char * nih_strcat_vsprintf  (char **str, const void *parent,
> + 			     const char *format, va_list args)
> +-	__attribute__ ((format (printf, 3, 0), warn_unused_result, malloc));
> ++	__attribute__ ((format (printf, 3, 0), warn_unused_result));
> +=20
> + char **nih_str_split        (const void *parent, const char *str,
> + 			     const char *delim, int repeat)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char **nih_str_array_new    (const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char **nih_str_array_add    (char ***array, const void *parent, size_t =
*len,
> + 			     const char *str)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char **nih_str_array_addn   (char ***array, const void *parent, size_t =
*len,
> + 			     const char *str, size_t strlen)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char **nih_str_array_addp   (char ***array, const void *parent, size_t =
*len,
> + 			     void *ptr)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char **nih_str_array_copy   (const void *parent, size_t *len,
> + 			     char * const *array)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char **nih_str_array_append (char ***array, const void *parent, size_t =
*len,
> + 			     char * const *args)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char * nih_str_wrap         (const void *parent, const char *str, size_=
t len,
> + 		             size_t first_indent, size_t indent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + size_t nih_str_screen_width (void);
> + char * nih_str_screen_wrap  (const void *parent, const char *str,
> + 			     size_t first_indent, size_t indent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih/string.c
> ++++ libnih-1.0.3/nih/string.c
> +@@ -405,7 +405,7 @@
> + 		const char  *ptr;
> +=20
> + 		/* Skip initial delimiters */
> +-		while (repeat && strchr (delim, *str))
> ++		while (repeat && *str && strchr (delim, *str))
> + 			str++;
> +=20
> + 		/* Find the end of the token */
> +@@ -413,6 +413,13 @@
> + 		while (*str && (! strchr (delim, *str)))
> + 			str++;
> +=20
> ++		/* Don't create an empty string array element in repeat
> ++		 * mode if there is no token (as a result of a
> ++		 * duplicated delimiter character).
> ++		 */
> ++		if (repeat && (str =3D=3D ptr))
> ++			continue;
> ++
> + 		if (! nih_str_array_addn (&array, parent, &len,
> + 					  ptr, str - ptr)) {
> + 			nih_free (array);
> +--- libnih-1.0.3.orig/nih/file.h
> ++++ libnih-1.0.3/nih/file.h
> +@@ -82,7 +82,7 @@
> +=20
> + char *nih_file_read         (const void *parent, const char *path,
> + 			     size_t *length)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + void *nih_file_map          (const char *path, int flags, size_t *lengt=
h)
> + 	__attribute__ ((warn_unused_result));
> +--- libnih-1.0.3.orig/nih/tests/test_option.c
> ++++ libnih-1.0.3/nih/tests/test_option.c
> +@@ -1574,7 +1574,7 @@
> + 		output =3D tmpfile ();
> + 		TEST_CHILD (pid) {
> + 			TEST_DIVERT_STDOUT (output) {
> +-				char **args;
> ++				char **args __attribute__((unused));
> +=20
> + 				args =3D nih_option_parser (NULL, argc, argv,
> + 							  options, FALSE);
> +@@ -1652,7 +1652,7 @@
> + 			unsetenv ("COLUMNS");
> +=20
> + 			TEST_DIVERT_STDOUT (output) {
> +-				char **args;
> ++				char **args __attribute__((unused));
> +=20
> + 				args =3D nih_option_parser (NULL, argc, argv,
> + 							  options, FALSE);
> +--- libnih-1.0.3.orig/nih/tests/test_logging.c
> ++++ libnih-1.0.3/nih/tests/test_logging.c
> +@@ -31,7 +31,7 @@
> + #include <nih/main.h>
> +=20
> +=20
> +-extern char *__abort_msg __attribute__ ((weak));
> ++extern char *__nih_abort_msg;
> +=20
> + static NihLogLevel last_priority =3D NIH_LOG_UNKNOWN;
> + static char *      last_message =3D NULL;
> +@@ -156,68 +156,63 @@
> + 	}
> +=20
> +=20
> +-	/* Check that a fatal message is also stored in the glibc __abort_msg
> ++	/* Check that a fatal message is also stored in the __nih_abort_msg
> + 	 * variable.
> + 	 */
> +-	if (&__abort_msg) {
> +-		TEST_FEATURE ("with fatal message");
> +-		TEST_ALLOC_FAIL {
> +-			__abort_msg =3D NULL;
> +-			last_priority =3D NIH_LOG_UNKNOWN;
> +-			last_message =3D NULL;
> +-
> +-			ret =3D nih_log_message (NIH_LOG_FATAL,
> +-					       "message with %s %d formatting",
> +-					       "some", 20);
> +-
> +-			TEST_EQ (ret, 0);
> +-			TEST_EQ (last_priority, NIH_LOG_FATAL);
> +-			TEST_EQ_STR (last_message, "message with some 20 formatting");
> +-
> +-			TEST_NE_P (__abort_msg, NULL);
> +-			TEST_ALLOC_PARENT (__abort_msg, NULL);
> +-			TEST_EQ_STR (__abort_msg, "message with some 20 formatting");
> ++	TEST_FEATURE ("with fatal message");
> ++	TEST_ALLOC_FAIL {
> ++		__nih_abort_msg =3D NULL;
> ++		last_priority =3D NIH_LOG_UNKNOWN;
> ++		last_message =3D NULL;
> +=20
> +-			free (last_message);
> +-		}
> ++		ret =3D nih_log_message (NIH_LOG_FATAL,
> ++				"message with %s %d formatting",
> ++				"some", 20);
> +=20
> ++		TEST_EQ (ret, 0);
> ++		TEST_EQ (last_priority, NIH_LOG_FATAL);
> ++		TEST_EQ_STR (last_message, "message with some 20 formatting");
> +=20
> +-		/* Check that a fatal message can safely overwrite one already stored
> +-		 * in the glibc __abort_msg variable.
> +-		 */
> +-		TEST_FEATURE ("with second fatal message");
> +-		TEST_ALLOC_FAIL {
> +-			TEST_ALLOC_SAFE {
> +-				msg =3D nih_strdup (NULL, "test");
> +-			}
> +-
> +-			__abort_msg =3D msg;
> +-			TEST_FREE_TAG (msg);
> +-
> +-			last_priority =3D NIH_LOG_UNKNOWN;
> +-			last_message =3D NULL;
> +-
> +-			ret =3D nih_log_message (NIH_LOG_FATAL,
> +-					       "message with %s %d formatting",
> +-					       "some", 20);
> +-
> +-			TEST_EQ (ret, 0);
> +-			TEST_EQ (last_priority, NIH_LOG_FATAL);
> +-			TEST_EQ_STR (last_message, "message with some 20 formatting");
> +-
> +-			TEST_FREE (msg);
> +-
> +-			TEST_NE_P (__abort_msg, NULL);
> +-			TEST_ALLOC_PARENT (__abort_msg, NULL);
> +-			TEST_EQ_STR (__abort_msg, "message with some 20 formatting");
> ++		TEST_NE_P (__nih_abort_msg, NULL);
> ++		TEST_ALLOC_PARENT (__nih_abort_msg, NULL);
> ++		TEST_EQ_STR (__nih_abort_msg, "message with some 20 formatting");
> +=20
> +-			free (last_message);
> +-		}
> +-	} else {
> +-		printf ("SKIP: __abort_msg not available\n");
> ++		free (last_message);
> + 	}
> +=20
> +=20
> ++	/* Check that a fatal message can safely overwrite one already stored
> ++	 * in the __nih_abort_msg variable.
> ++	 */
> ++	TEST_FEATURE ("with second fatal message");
> ++	TEST_ALLOC_FAIL {
> ++		TEST_ALLOC_SAFE {
> ++			msg =3D nih_strdup (NULL, "test");
> ++		}
> ++
> ++		__nih_abort_msg =3D msg;
> ++		TEST_FREE_TAG (msg);
> ++
> ++		last_priority =3D NIH_LOG_UNKNOWN;
> ++		last_message =3D NULL;
> ++
> ++		ret =3D nih_log_message (NIH_LOG_FATAL,
> ++				"message with %s %d formatting",
> ++				"some", 20);
> ++
> ++		TEST_EQ (ret, 0);
> ++		TEST_EQ (last_priority, NIH_LOG_FATAL);
> ++		TEST_EQ_STR (last_message, "message with some 20 formatting");
> ++
> ++		TEST_FREE (msg);
> ++
> ++		TEST_NE_P (__nih_abort_msg, NULL);
> ++		TEST_ALLOC_PARENT (__nih_abort_msg, NULL);
> ++		TEST_EQ_STR (__nih_abort_msg, "message with some 20 formatting");
> ++
> ++		free (last_message);
> ++	}
> ++
> + 	/* Check that the nih_debug macro wraps the call properly and
> + 	 * includes the function in which the message occurred.
> + 	 */
> +--- libnih-1.0.3.orig/nih/tests/test_hash.c
> ++++ libnih-1.0.3/nih/tests/test_hash.c
> +@@ -470,7 +470,8 @@
> + test_lookup (void)
> + {
> + 	NihHash *hash;
> +-	NihList *entry1, *entry2, *entry3, *ptr;
> ++	NihList *entry1, *entry2, *ptr;
> ++	NihList *entry3 __attribute__((unused));
> +=20
> + 	TEST_FUNCTION ("nih_hash_lookup");
> + 	hash =3D nih_hash_string_new (NULL, 0);
> +--- libnih-1.0.3.orig/nih/tests/test_main.c
> ++++ libnih-1.0.3/nih/tests/test_main.c
> +@@ -457,7 +457,7 @@
> + test_main_loop (void)
> + {
> + 	NihMainLoopFunc *func;
> +-	NihTimer        *timer;
> ++	NihTimer        *timer __attribute__((unused));
> + 	int              ret;
> +=20
> + 	/* Check that we can run through the main loop, and that the
> +--- libnih-1.0.3.orig/nih/tests/test_watch.c
> ++++ libnih-1.0.3/nih/tests/test_watch.c
> +@@ -2,8 +2,8 @@
> +  *
> +  * test_watch.c - test suite for nih/watch.c
> +  *
> +- * Copyright =C2=A9 2009 Scott James Remnant <scott@netsplit.com>.
> +- * Copyright =C2=A9 2009 Canonical Ltd.
> ++ * Copyright =C2=A9 2011 Scott James Remnant <scott@netsplit.com>.
> ++ * Copyright =C2=A9 2011 Canonical Ltd.
> +  *
> +  * This program is free software; you can redistribute it and/or modify
> +  * it under the terms of the GNU General Public License version 2, as
> +@@ -39,6 +39,8 @@
> + #include <nih/error.h>
> + #include <nih/logging.h>
> +=20
> ++/* Read "The Hitchhikers Guide to the Galaxy" */
> ++#define FILTER_VALUE 42
> +=20
> + static int
> + my_filter (void       *data,
> +@@ -54,6 +56,26 @@
> + 	return FALSE;
> + }
> +=20
> ++/* Set by my_filter2 () so it knows if it has already been called */
> ++static int my_filter2_called =3D 0;
> ++
> ++static int
> ++my_filter2 (int       *value,
> ++	   const char *path,
> ++	   int         is_dir)
> ++{
> ++	/* we only want to toggle the value once */
> ++	if (my_filter2_called)
> ++		return TRUE;
> ++
> ++	my_filter2_called =3D 1;
> ++
> ++	nih_assert (value && *value =3D=3D FILTER_VALUE);
> ++	*value =3D 0;
> ++
> ++	return FALSE;
> ++}
> ++
> + static int create_called =3D 0;
> + static int modify_called =3D 0;
> + static int delete_called =3D 0;
> +@@ -553,6 +575,44 @@
> + 		nih_free (watch);
> + 	}
> +=20
> ++	/* Ensure the file filter gets passed the correct data pointer.
> ++	 */
> ++	TEST_FEATURE ("with filter and data");
> ++
> ++	/* Ensure we have a new directory */
> ++	TEST_FILENAME (dirname);
> ++	mkdir (dirname, 0755);
> ++
> ++	/* Create a single file */
> ++	strcpy (filename, dirname);
> ++	strcat (filename, "/foo");
> ++
> ++	fd =3D fopen (filename, "w");
> ++	fprintf (fd, "test\n");
> ++	fclose (fd);
> ++
> ++	TEST_ALLOC_FAIL {
> ++		int watch_data =3D FILTER_VALUE;
> ++
> ++		/* Reset required to appease TEST_ALLOC_FAIL */
> ++		my_filter2_called =3D 0;
> ++
> ++		watch =3D nih_watch_new (NULL, dirname,
> ++				TRUE, TRUE,
> ++				(NihFileFilter)my_filter2,
> ++				NULL, NULL, NULL,
> ++				&watch_data);
> ++
> ++		TEST_NE_P (watch, NULL);
> ++
> ++		/* Ensure the filter was called and changed the value */
> ++
> ++		TEST_NE (my_filter2_called, 0);
> ++		TEST_EQ (watch_data, 0);
> ++
> ++		nih_free (watch);
> ++	}
> ++
> + 	strcpy (filename, dirname);
> + 	strcat (filename, "/bar");
> + 	chmod (filename, 0755);
> +@@ -946,13 +1006,82 @@
> + 	nih_error_init ();
> +=20
> + 	TEST_FILENAME (dirname);
> +-	mkdir (dirname, 0755);
> ++	TEST_EQ (mkdir (dirname, 0755), 0);
> +=20
> +-	watch =3D nih_watch_new (NULL, dirname, TRUE, TRUE, my_filter,
> +-			       my_create_handler, my_modify_handler,
> ++	TEST_FEATURE ("with watched file");
> ++	strcpy (filename, dirname);
> ++	strcat (filename, "/foo");
> ++
> ++	/* Create file first since we don't set a create handler on the
> ++	 * watch.
> ++	 */
> ++	fd =3D fopen (filename, "w");
> ++	fprintf (fd, "bar\n");
> ++	fclose (fd);
> ++
> ++	create_called =3D 0;
> ++	modify_called =3D 0;
> ++	delete_called =3D 0;
> ++	logger_called =3D 0;
> ++	last_path  =3D NULL;
> ++	last_watch =3D NULL;
> ++	last_data  =3D NULL;
> ++
> ++	watch =3D nih_watch_new (NULL, filename, FALSE, FALSE, NULL,
> ++			       NULL, my_modify_handler,
> + 			       my_delete_handler, &watch);
> ++	TEST_NE_P (watch, NULL);
> ++
> ++	/* Now, modify the existing file to trigger the modify handler. */
> ++	fd =3D fopen (filename, "a+");
> ++	fprintf (fd, "baz\n");
> ++	fclose (fd);
> ++
> ++	nfds =3D 0;
> ++	FD_ZERO (&readfds);
> ++	FD_ZERO (&writefds);
> ++	FD_ZERO (&exceptfds);
> ++
> ++	nih_io_select_fds (&nfds, &readfds, &writefds, &exceptfds);
> ++	select (nfds, &readfds, &writefds, &exceptfds, NULL);
> ++	nih_io_handle_fds (&readfds, &writefds, &exceptfds);
> ++
> ++	TEST_EQ_STR (watch->path, filename);
> ++
> ++	/* Ensure no regression to old behaviour (LP:#777097) */
> ++	TEST_NE (last_path[ strlen(last_path) - 1 ], '/');
> ++
> ++	TEST_EQ_STR (last_path, filename);
> ++	TEST_EQ (modify_called, 1);
> ++
> ++	unlink (filename);
> ++
> ++	nfds =3D 0;
> ++	FD_ZERO (&readfds);
> ++	FD_ZERO (&writefds);
> ++	FD_ZERO (&exceptfds);
> ++
> ++	nih_io_select_fds (&nfds, &readfds, &writefds, &exceptfds);
> ++	select (nfds, &readfds, &writefds, &exceptfds, NULL);
> ++	nih_io_handle_fds (&readfds, &writefds, &exceptfds);
> +=20
> ++	TEST_EQ (delete_called, 1);
> +=20
> ++	rmdir (filename);
> ++	nih_free (last_path);
> ++
> ++	create_called =3D 0;
> ++	modify_called =3D 0;
> ++	delete_called =3D 0;
> ++	logger_called =3D 0;
> ++	last_path  =3D NULL;
> ++	last_watch =3D NULL;
> ++	last_data  =3D NULL;
> ++
> ++
> ++	watch =3D nih_watch_new (NULL, dirname, TRUE, TRUE, my_filter,
> ++			       my_create_handler, my_modify_handler,
> ++			       my_delete_handler, &watch);
> + 	/* Check that creating a file within the directory being watched
> + 	 * results in the create handler being called, and passed the full
> + 	 * path of the created file to it.
> +--- libnih-1.0.3.orig/nih/tests/test_string.c
> ++++ libnih-1.0.3/nih/tests/test_string.c
> +@@ -619,6 +619,215 @@
> + 		nih_free (array);
> + 	}
> +=20
> ++	TEST_FEATURE ("with no repeat and multiple identical delimiter "
> ++			"characters at string start");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "\t\tthis is a test", " \t", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 7);
> ++		for (i =3D 0; i < 6; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "");
> ++		TEST_EQ_STR (array[1], "");
> ++		TEST_EQ_STR (array[2], "this");
> ++		TEST_EQ_STR (array[3], "is");
> ++		TEST_EQ_STR (array[4], "a");
> ++		TEST_EQ_STR (array[5], "test");
> ++		TEST_EQ_P (array[6], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with no repeat and multiple different delimiter "
> ++			"characters at string start");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, " \tthis is a test", " \t", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 7);
> ++		for (i =3D 0; i < 6; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "");
> ++		TEST_EQ_STR (array[1], "");
> ++		TEST_EQ_STR (array[2], "this");
> ++		TEST_EQ_STR (array[3], "is");
> ++		TEST_EQ_STR (array[4], "a");
> ++		TEST_EQ_STR (array[5], "test");
> ++		TEST_EQ_P (array[6], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with no repeat and multiple identical delimiter "
> ++			"characters within string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "this is   a\t\ttest", " \t", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 8);
> ++		for (i =3D 0; i < 7; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "this");
> ++		TEST_EQ_STR (array[1], "is");
> ++		TEST_EQ_STR (array[2], "");
> ++		TEST_EQ_STR (array[3], "");
> ++		TEST_EQ_STR (array[4], "a");
> ++		TEST_EQ_STR (array[5], "");
> ++		TEST_EQ_STR (array[6], "test");
> ++		TEST_EQ_P (array[7], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with no repeat and multiple different delimiter "
> ++			"characters within string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "this is \n\ta\ttest", " \t\n", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 7);
> ++		for (i =3D 0; i < 6; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "this");
> ++		TEST_EQ_STR (array[1], "is");
> ++		TEST_EQ_STR (array[2], "");
> ++		TEST_EQ_STR (array[3], "");
> ++		TEST_EQ_STR (array[4], "a");
> ++		TEST_EQ_STR (array[5], "test");
> ++		TEST_EQ_P (array[6], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with no repeat and multiple identical delimiter "
> ++			"characters at string end");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "this is a test  ", " \t", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 6);
> ++		for (i =3D 0; i < 5; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "this");
> ++		TEST_EQ_STR (array[1], "is");
> ++		TEST_EQ_STR (array[2], "a");
> ++		TEST_EQ_STR (array[3], "test");
> ++		TEST_EQ_STR (array[4], "");
> ++		TEST_EQ_P (array[5], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with no repeat and multiple different delimiter "
> ++			"characters at string end");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "this is a test \t", " \t", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 6);
> ++		for (i =3D 0; i < 5; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "this");
> ++		TEST_EQ_STR (array[1], "is");
> ++		TEST_EQ_STR (array[2], "a");
> ++		TEST_EQ_STR (array[3], "test");
> ++		TEST_EQ_STR (array[4], "");
> ++		TEST_EQ_P (array[5], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with no repeat and multiple identical delimiter "
> ++			"characters at beginning, middle and end of string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "   this is\n\n\na test\t\t\t", " \t\n=
", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 12);
> ++		for (i =3D 0; i < 11; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "");
> ++		TEST_EQ_STR (array[1], "");
> ++		TEST_EQ_STR (array[2], "");
> ++		TEST_EQ_STR (array[3], "this");
> ++		TEST_EQ_STR (array[4], "is");
> ++		TEST_EQ_STR (array[5], "");
> ++		TEST_EQ_STR (array[6], "");
> ++		TEST_EQ_STR (array[7], "a");
> ++		TEST_EQ_STR (array[8], "test");
> ++		TEST_EQ_STR (array[9], "");
> ++		TEST_EQ_STR (array[10], "");
> ++		TEST_EQ_P (array[11], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with no repeat and multiple different delimiter "
> ++			"characters at beginning, middle and end of string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, ": \nthis is\t \n:a test:\n ", "\n :\t=
", FALSE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 13);
> ++		for (i =3D 0; i < 12; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "");
> ++		TEST_EQ_STR (array[1], "");
> ++		TEST_EQ_STR (array[2], "");
> ++		TEST_EQ_STR (array[3], "this");
> ++		TEST_EQ_STR (array[4], "is");
> ++		TEST_EQ_STR (array[5], "");
> ++		TEST_EQ_STR (array[6], "");
> ++		TEST_EQ_STR (array[7], "");
> ++		TEST_EQ_STR (array[8], "a");
> ++		TEST_EQ_STR (array[9], "test");
> ++		TEST_EQ_STR (array[10], "");
> ++		TEST_EQ_STR (array[11], "");
> ++		TEST_EQ_P (array[12], NULL);
> ++
> ++		nih_free (array);
> ++	}
> +=20
> + 	/* Check that we can split a string treating multiple consecutive
> + 	 * matching characters as a single separator to be skipped.
> +@@ -645,6 +854,177 @@
> + 		nih_free (array);
> + 	}
> +=20
> ++	/* Check that we can split a string containing multiple
> ++	 * occurences of one of the delimiter characters at the
> ++	 * beginning of the string.
> ++	 */
> ++	TEST_FEATURE ("with repeat and multiple identical adjacent delimiter c=
haracters at string start");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "\n\nhello", " \t\r\n", TRUE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 2);
> ++		for (i =3D 0; i < 1; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_P (array[1], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with repeat and multiple different adjacent delimiter c=
haracters at string start");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "\n\r hello", " \t\r\n", TRUE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 2);
> ++		for (i =3D 0; i < 1; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_P (array[1], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with repeat and multiple identical adjacent delimiter "
> ++			"characters within string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "hello\n\rworld", " \t\n\r", TRUE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 3);
> ++		for (i =3D 0; i < 2; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_STR (array[1], "world");
> ++		TEST_EQ_P (array[2], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with repeat and multiple different adjacent delimiter "
> ++			"characters within string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "hello\n\r\tworld", " \t\n\r", TRUE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 3);
> ++		for (i =3D 0; i < 2; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_STR (array[1], "world");
> ++		TEST_EQ_P (array[2], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with repeat and multiple identical adjacent delimiter "
> ++			"characters at string end");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "hello\n\n\n\n\n\n\n", " \t\r\n", TRUE=
);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 2);
> ++		for (i =3D 0; i < 1; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_P (array[1], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with repeat and multiple different adjacent delimiter "
> ++			"characters at string end");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL, "hello \r\t\r\t\n ", " \t\r\n", TRUE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 2);
> ++		for (i =3D 0; i < 1; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_P (array[1], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with repeat and multiple identical adjacent delimiter "
> ++			"characters at beginning, middle and end of string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL,
> ++				"        hello\n\n\n,  world\n\n\n",
> ++				"\r\t\n ", TRUE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 4);
> ++		for (i =3D 0; i < 3; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_STR (array[1], ",");
> ++		TEST_EQ_STR (array[2], "world");
> ++		TEST_EQ_P (array[3], NULL);
> ++
> ++		nih_free (array);
> ++	}
> ++
> ++	TEST_FEATURE ("with repeat and multiple different adjacent delimiter "
> ++			"characters at beginning, middle and end of string");
> ++	TEST_ALLOC_FAIL {
> ++		array =3D nih_str_split (NULL,
> ++				"\n    \r\thello\n\n\r , \n\t\rworld\t \r\n \n",
> ++				" \t\n\r", TRUE);
> ++
> ++		if (test_alloc_failed) {
> ++			TEST_EQ_P (array, NULL);
> ++			continue;
> ++		}
> ++
> ++		TEST_ALLOC_SIZE (array, sizeof (char *) * 4);
> ++		for (i =3D 0; i < 3; i++)
> ++			TEST_ALLOC_PARENT (array[i], array);
> ++
> ++		TEST_EQ_STR (array[0], "hello");
> ++		TEST_EQ_STR (array[1], ",");
> ++		TEST_EQ_STR (array[2], "world");
> ++		TEST_EQ_P (array[3], NULL);
> ++
> ++		nih_free (array);
> ++	}
> +=20
> + 	/* Check that we can give an empty string, and end up with a
> + 	 * one-element array that only contains a NULL pointer.
> +--- libnih-1.0.3.orig/nih/tests/test_file.c
> ++++ libnih-1.0.3/nih/tests/test_file.c
> +@@ -724,6 +724,25 @@
> + 	return FALSE;
> + }
> +=20
> ++/* find only frodo files */
> ++static int
> ++my_filter_frodo_file (void       *data,
> ++	   const char *path,
> ++	   int         is_dir)
> ++{
> ++	char *slash;
> ++
> ++	if (is_dir)
> ++		return FALSE;
> ++
> ++	slash =3D strrchr (path, '/');
> ++	if (strcmp (slash, "/frodo"))
> ++		return TRUE;
> ++
> ++	return FALSE;
> ++}
> ++
> ++
> + static int logger_called =3D 0;
> +=20
> + static int
> +@@ -905,6 +924,48 @@
> + 		TEST_EQ_STR (v->path, filename);
> +=20
> + 		nih_free (visited);
> ++
> ++				/* Try also inverse filter */
> ++		TEST_ALLOC_SAFE {
> ++			visitor_called =3D 0;
> ++			visited =3D nih_list_new (NULL);
> ++		}
> ++
> ++		ret =3D nih_dir_walk (dirname, my_filter_frodo_file,
> ++				    my_visitor, NULL, &ret);
> ++
> ++		TEST_EQ (ret, 0);
> ++		TEST_EQ (visitor_called, 4);
> ++
> ++		v =3D (Visited *)visited->next;
> ++		TEST_EQ (v->data, &ret);
> ++		TEST_EQ_STR (v->dirname, dirname);
> ++		strcpy (filename, dirname);
> ++		strcat (filename, "/bar");
> ++		TEST_EQ_STR (v->path, filename);
> ++
> ++		v =3D (Visited *)v->entry.next;
> ++		TEST_EQ (v->data, &ret);
> ++		TEST_EQ_STR (v->dirname, dirname);
> ++		strcpy (filename, dirname);
> ++		strcat (filename, "/bar/frodo");
> ++		TEST_EQ_STR (v->path, filename);
> ++
> ++		v =3D (Visited *)v->entry.next;
> ++		TEST_EQ (v->data, &ret);
> ++		TEST_EQ_STR (v->dirname, dirname);
> ++		strcpy (filename, dirname);
> ++		strcat (filename, "/baz");
> ++		TEST_EQ_STR (v->path, filename);
> ++
> ++		v =3D (Visited *)v->entry.next;
> ++		TEST_EQ (v->data, &ret);
> ++		TEST_EQ_STR (v->dirname, dirname);
> ++		strcpy (filename, dirname);
> ++		strcat (filename, "/frodo");
> ++		TEST_EQ_STR (v->path, filename);
> ++
> ++		nih_free (visited);
> + 	}
> +=20
> +=20
> +--- libnih-1.0.3.orig/debian/control
> ++++ libnih-1.0.3/debian/control
> +@@ -0,0 +1,81 @@
> ++Source: libnih
> ++Section: libs
> ++Priority: required
> ++Maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
> ++XSBC-Original-Maintainer: Scott James Remnant <scott@netsplit.com>
> ++Standards-Version: 3.9.4
> ++Build-Depends: debhelper (>=3D 9), pkg-config (>=3D 0.22), libdbus-1-de=
v (>=3D 1.4), libexpat1-dev (>=3D 2.0.0), dbus (>=3D 1.4), libc6-dev (>=3D =
2.15~) | libc6.1-dev (>=3D 2.15~),
> ++               dh-autoreconf, autopoint, dpkg-dev (>=3D 1.16.1~)
> ++# To cross build this package also needs: libdbus-1-dev:native (>=3D 1.=
4), libexpat1-dev:native (>=3D 2.0.0)
> ++# But :native build-deps are not supported yet, so instead one can do
> ++# $ apt-get build-dep libnih
> ++# $ apt-get build-dep libnih -aarmhf
> ++# instead to get all required build-deps
> ++Vcs-Bzr: lp:ubuntu/libnih
> ++XSC-Debian-Vcs-Git: git://git.debian.org/git/collab-maint/libnih.git
> ++XSC-Debian-Vcs-Browser: http://git.debian.org/?p=3Dcollab-maint/libnih.=
git;a=3Dsummary
> ++Homepage: https://launchpad.net/libnih
> ++
> ++Package: libnih1
> ++Architecture: any
> ++Pre-Depends: ${misc:Pre-Depends}, ${shlibs:Depends}, ${misc:Depends}
> ++Multi-Arch: same
> ++Description: NIH Utility Library
> ++ libnih is a light-weight "standard library" of C functions to ease the
> ++ development of other libraries and applications, especially those
> ++ normally found in /lib.
> ++ .
> ++ This package contains the shared library.
> ++
> ++Package: libnih-dev
> ++Priority: optional
> ++Section: libdevel
> ++Architecture: any
> ++Multi-Arch: same
> ++Depends: libnih1 (=3D ${binary:Version}), ${shlibs:Depends}, ${misc:Dep=
ends}
> ++Description: NIH Utility Library (development files)
> ++ libnih is a light-weight "standard library" of C functions to ease the
> ++ development of other libraries and applications, especially those
> ++ normally found in /lib.
> ++ .
> ++ This package contains the static library and C header files which are
> ++ needed for developing software using libnih.
> ++
> ++Package: libnih-dbus1
> ++Architecture: any
> ++Pre-Depends: ${misc:Pre-Depends}
> ++Depends: libnih1 (=3D ${binary:Version}), ${shlibs:Depends}, ${misc:Dep=
ends}
> ++Multi-Arch: same
> ++Description: NIH D-Bus Bindings Library
> ++ libnih-dbus is a D-Bus bindings library that integrates with the main
> ++ loop provided by libnih.
> ++ .
> ++ This package contains the shared library.
> ++
> ++Package: libnih-dbus-dev
> ++Priority: optional
> ++Section: libdevel
> ++Architecture: any
> ++Multi-Arch: same
> ++Depends: libnih-dbus1 (=3D ${binary:Version}), libnih-dev (=3D ${binary=
:Version}), ${shlibs:Depends}, ${misc:Depends}
> ++Recommends: nih-dbus-tool (=3D ${binary:Version})
> ++Description: NIH D-Bus Bindings Library (development files)
> ++ libnih-dbus is a D-Bus bindings library that integrates with the main
> ++ loop provided by libnih.
> ++ .
> ++ This package contains the static library and C header files which are
> ++ needed for developing software using libnih-dbus.
> ++
> ++Package: nih-dbus-tool
> ++Section: devel
> ++Architecture: any
> ++Multi-Arch: foreign
> ++Depends: ${shlibs:Depends}, ${misc:Depends}
> ++Recommends: libnih-dbus-dev (=3D ${binary:Version})
> ++Description: NIH D-Bus Binding Tool
> ++ nih-dbus-tool generates C source code from the D-Bus Introspection XML
> ++ data provided by most services; either to make implementing the
> ++ described objects in C programs or to make proxying to the described
> ++ remote objects easier.
> ++ .
> ++ The generated code requires libnih-dbus-dev to be compiled.
> +--- libnih-1.0.3.orig/debian/libnih-dev.install
> ++++ libnih-1.0.3/debian/libnih-dev.install
> +@@ -0,0 +1,6 @@
> ++lib/*/libnih.a
> ++lib/*/libnih.so
> ++usr/include/libnih.h
> ++usr/include/nih
> ++usr/lib/*/pkgconfig/libnih.pc
> ++usr/share/aclocal/libnih.m4
> +--- libnih-1.0.3.orig/debian/libnih1.docs
> ++++ libnih-1.0.3/debian/libnih1.docs
> +@@ -0,0 +1,3 @@
> ++AUTHORS
> ++NEWS
> ++README
> +--- libnih-1.0.3.orig/debian/libnih-dbus1.install
> ++++ libnih-1.0.3/debian/libnih-dbus1.install
> +@@ -0,0 +1 @@
> ++lib/*/libnih-dbus.so.*
> +--- libnih-1.0.3.orig/debian/libnih1.install
> ++++ libnih-1.0.3/debian/libnih1.install
> +@@ -0,0 +1 @@
> ++lib/*/libnih.so.*
> +--- libnih-1.0.3.orig/debian/rules
> ++++ libnih-1.0.3/debian/rules
> +@@ -0,0 +1,54 @@
> ++#!/usr/bin/make -f
> ++
> ++include /usr/share/dpkg/architecture.mk
> ++
> ++%:
> ++	dh $@ --with autoreconf
> ++
> ++
> ++CFLAGS :=3D -Wall -fstack-protector -fPIE $(shell dpkg-buildflags --get=
 CFLAGS)
> ++LDFLAGS :=3D -Wl,--as-needed -Wl,-z,relro -Wl,-z,now -pie $(shell dpkg-=
buildflags --get LDFLAGS)
> ++
> ++override_dh_auto_configure:
> ++ifeq ($(DEB_BUILD_GNU_TYPE), $(DEB_HOST_GNU_TYPE))
> ++	dh_auto_configure -- CFLAGS=3D"$(CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" \
> ++		--libdir=3D/lib/$(DEB_HOST_MULTIARCH)
> ++else
> ++	dh_auto_configure -B build-dbus-tool/ -- CFLAGS=3D"$(CFLAGS)" LDFLAGS=
=3D"$(LDFLAGS)" \
> ++		--libdir=3D/lib/$(DEB_BUILD_MULTIARCH) \
> ++		--host=3D$(DEB_BUILD_GNU_TYPE)
> ++	dh_auto_build -B build-dbus-tool/ --parallel
> ++	dh_auto_configure -- CFLAGS=3D"$(CFLAGS)" LDFLAGS=3D"$(LDFLAGS)" \
> ++		NIH_DBUS_TOOL=3D$(CURDIR)/build-dbus-tool/nih-dbus-tool/nih-dbus-tool=
 \
> ++		--libdir=3D/lib/$(DEB_HOST_MULTIARCH)
> ++endif
> ++
> ++override_dh_auto_build:
> ++	dh_auto_build --parallel
> ++
> ++override_dh_auto_test:
> ++ifeq ($(DEB_BUILD_GNU_TYPE), $(DEB_HOST_GNU_TYPE))
> ++	dh_auto_test --parallel
> ++endif
> ++
> ++override_dh_auto_install:
> ++	dh_auto_install -- pkgconfigdir=3D\$${prefix}/lib/$(DEB_HOST_MULTIARCH=
)/pkgconfig
> ++
> ++override_dh_makeshlibs:
> ++	dh_makeshlibs -plibnih1 -V 'libnih1 (>=3D 1.0.0)'
> ++	dh_makeshlibs -plibnih-dbus1 -V 'libnih-dbus1 (>=3D 1.0.0)'
> ++	dh_makeshlibs -Nlibnih1 -Nlibnih-dbus1
> ++
> ++override_dh_shlibdeps:
> ++	dh_shlibdeps
> ++	sed -i 's/2\.14/2.15/' debian/*.substvars
> ++	sed -i 's/>=3D 2.15)/>=3D 2.15~)/g' debian/*.substvars
> ++
> ++
> ++# Symlink /usr/share/doc directories together
> ++override_dh_installdocs:
> ++	dh_installdocs --link-doc=3Dlibnih1
> ++
> ++override_dh_clean:
> ++	rm -rf build-dbus-tool/
> ++	dh_clean
> +--- libnih-1.0.3.orig/debian/compat
> ++++ libnih-1.0.3/debian/compat
> +@@ -0,0 +1 @@
> ++9
> +--- libnih-1.0.3.orig/debian/nih-dbus-tool.install
> ++++ libnih-1.0.3/debian/nih-dbus-tool.install
> +@@ -0,0 +1,2 @@
> ++usr/bin/nih-dbus-tool
> ++usr/share/man/man1/nih-dbus-tool.1
> +--- libnih-1.0.3.orig/debian/copyright
> ++++ libnih-1.0.3/debian/copyright
> +@@ -0,0 +1,18 @@
> ++This is the Ubuntu package of libnih, the NIH Utility Library.
> ++
> ++Copyright =C2=A9 2009 Canonical Ltd.
> ++Copyright =C2=A9 2009 Scott James Remnant <scott@netsplit.com>
> ++
> ++Licence:
> ++
> ++This program is free software; you can redistribute it and/or modify
> ++it under the terms of the GNU General Public License version 2, as
> ++published by the Free Software Foundation.
> ++
> ++This program is distributed in the hope that it will be useful, but
> ++WITHOUT ANY WARRANTY; without even the implied warranty of
> ++MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
> ++General Public License for more details.
> ++
> ++On Ubuntu systems, the complete text of the GNU General Public License
> ++can be found in =E2=80=98/usr/share/common-licenses/GPL-2=E2=80=99.
> +--- libnih-1.0.3.orig/debian/libnih-dbus1.postinst
> ++++ libnih-1.0.3/debian/libnih-dbus1.postinst
> +@@ -0,0 +1,53 @@
> ++#!/bin/sh
> ++
> ++set -e
> ++
> ++if [ "$1" =3D configure ]; then
> ++    # A dependent library of Upstart has changed, so restart Upstart
> ++    # such that it can safely unmount the root filesystem (LP: #740390)
> ++
> ++    # Query running version of Upstart, but only when we know
> ++    # that initctl will work.
> ++    #
> ++    # The calculated version string may be the null string if
> ++    # Upstart is not running (where for example an alternative
> ++    # init is running outside a chroot environment) or if the
> ++    # query failed for some reason. However, the version check
> ++    # below handles a null version string correctly.
> ++    UPSTART_VERSION_RUNNING=3D$(initctl version 2>/dev/null |\
> ++        awk '{print $3}'|tr -d ')' || :)
> ++
> ++    if ischroot; then
> ++        # Do not honour re-exec when requested from within a
> ++        # chroot since:
> ++        #
> ++        # (a) The version of Upstart outside might not support it.
> ++        # (b) An isolated environment such as a chroot should
> ++        #     not be able to modify its containing environment.
> ++        #
> ++        # A sufficiently new Upstart will actually handle a re-exec
> ++        # request coming from telinit within a chroot correctly (by
> ++        # doing nothing) but it's simple enough to perform the check
> ++        # here and save Upstart the effort.
> ++        :
> ++    elif dpkg --compare-versions "$UPSTART_VERSION_RUNNING" ge 1.6.1; t=
hen
> ++        # We are not running inside a chroot and the running version
> ++        # of Upstart supports stateful re-exec, so we can
> ++        # restart immediately.
> ++        #
> ++        # XXX: Note that the check on the running version must
> ++        # remain *indefinitely* since it's the only safe way to
> ++        # know if stateful re-exec is supported: simply checking
> ++        # packaged version numbers is not sufficient since
> ++        # the package could be upgraded multiple times without a
> ++        # reboot.
> ++        telinit u || :
> ++    else
> ++        # Before we shutdown or reboot, we need to re-exec so that we
> ++        # can safely remount the root filesystem; we can't just do that
> ++        # here because we lose state.
> ++        touch /var/run/init.upgraded || :
> ++    fi
> ++fi
> ++
> ++#DEBHELPER#
> +--- libnih-1.0.3.orig/debian/changelog.DEBIAN
> ++++ libnih-1.0.3/debian/changelog.DEBIAN
> +@@ -0,0 +1,118 @@
> ++libnih (1.0.3-4) unstable; urgency=3Dlow
> ++
> ++  * Rebuild for new libc to update versioned dependency; this comes from
> ++    the __abort_msg dependency, dpkg-shlibs needs overriding since this=
 is
> ++    actually a weak link, but this rebuild fixes things for now.
> ++    Closes: #625257.
> ++
> ++ -- Scott James Remnant <scott@netsplit.com>  Mon, 02 May 2011 15:08:33=
 -0700
> ++
> ++libnih (1.0.3-3) unstable; urgency=3Dlow
> ++
> ++  * New maintainer.  Closes: #624442.
> ++
> ++ -- Scott James Remnant <scott@netsplit.com>  Thu, 28 Apr 2011 14:26:05=
 -0700
> ++
> ++libnih (1.0.3-2) unstable; urgency=3Dlow
> ++
> ++  * Bump build dependency on libdbus-1-dev and dbus to (>=3D 1.4) for U=
nix file
> ++    descriptor passing support.
> ++
> ++ -- Michael Biebl <biebl@debian.org>  Thu, 10 Feb 2011 20:25:18 +0100
> ++
> ++libnih (1.0.3-1ubuntu1) natty; urgency=3Dlow
> ++
> ++  * Rebuild with libc6-dev (>=3D 2.13~).
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Fri, 18 Feb 2011 12:09:29 +0100
> ++
> ++libnih (1.0.3-1) unstable; urgency=3Dlow
> ++
> ++  * New upstream release.
> ++  * Bump debhelper compatibility level to 8 and update build dependency
> ++    accordingly.
> ++
> ++ -- Michael Biebl <biebl@debian.org>  Mon, 07 Feb 2011 22:19:13 +0100
> ++
> ++libnih (1.0.2-2) unstable; urgency=3Dlow
> ++
> ++  * Install library development files to /usr/lib and not /lib.
> ++  * Remove libtool *.la files as there are no reverse dependencies refe=
rencing
> ++    them.
> ++  * Bump Standards-Version to 3.9.1. No further changes.
> ++
> ++ -- Michael Biebl <biebl@debian.org>  Sun, 02 Jan 2011 21:09:40 +0100
> ++
> ++libnih (1.0.2-1ubuntu3) natty; urgency=3Dlow
> ++
> ++  * Disable some tests on ppc64 to build an initial package.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Thu, 18 Nov 2010 10:59:38 +0100
> ++
> ++libnih (1.0.2-1ubuntu2) maverick; urgency=3Dlow
> ++
> ++  * Re-add -fPIE to the testsuite on armel, removing all armel-specific=
 tests;
> ++    current gcc-4.4 don't seem affected by the ICE anymore (see LP #398=
403).
> ++
> ++ -- Lo=C3=AFc Minier <loic.minier@linaro.org>  Mon, 23 Aug 2010 10:25:3=
1 +0200
> ++
> ++libnih (1.0.2-1ubuntu1) maverick; urgency=3Dlow
> ++
> ++  * Rebuild with libc6-dev (>=3D 2.12~), after checking that
> ++    __abort_msg is available with the same signature in eglibc 2.12.
> ++  * Don't build the testsuite with -fPIE on armel; LP: #398403.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Sun, 30 May 2010 02:54:56 +0200
> ++
> ++libnih (1.0.2-1) unstable; urgency=3Dlow
> ++
> ++  * Initial upload to Debian. Closes: #585071
> ++  * Based on the Ubuntu package for Lucid done by Scott James Remnant w=
ith the
> ++    following changes:
> ++    - Switch packages to priority optional.
> ++    - Use binary:Version instead of Source-Version.
> ++    - Bump Standards-Version to 3.8.4.
> ++    - Add Homepage and Vcs-* fields.
> ++    - Don't symlink /usr/share/doc directories.
> ++    - Refer to versioned /usr/share/common-licenses/GPL-2 file in
> ++      debian/copyright.
> ++    - List all symbols explicitly instead of using a wildcard and add s=
ymbols
> ++      introduced in 1.0.1.
> ++    - Use the symbols files to create the correct version info instead =
of
> ++      specifying it manually via shlibs.
> ++    - Switch to source format 3.0 (quilt).
> ++    - Add watch file to track new upstream releases.
> ++
> ++ -- Michael Biebl <biebl@debian.org>  Sun, 13 Jun 2010 23:36:52 +0200
> ++
> ++libnih (1.0.1-1) lucid; urgency=3Dlow
> ++
> ++  * New upstream release:
> ++    - Add missing __nih_* symbols to linker version script so that we
> ++      can link Upstart's test suite.
> ++    - Glibc __abort_msg symbol now only linked as a weak symbol.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Thu, 04 Feb 2010 14:53:26 -=
0800
> ++
> ++libnih (1.0.0-2build1) lucid; urgency=3Dlow
> ++
> ++  * Rebuild to pick up relaxed dependency on libc6, after checking that
> ++    __abort_msg is available with the same signature in eglibc 2.11.
> ++    LP: #508702.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Mon, 18 Jan 2010 16:09:13 +0100
> ++
> ++libnih (1.0.0-2) lucid; urgency=3Dlow
> ++
> ++  * debian/control: Add build-dependency on dbus so the test suite can
> ++    pass on the buildds.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Sat, 28 Nov 2009 23:28:27 +=
0000
> ++
> ++libnih (1.0.0-1) lucid; urgency=3Dlow
> ++
> ++  * First upstream release.  Previously this code was included in the
> ++    upstart, mountall and ureadahead source packages.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Sat, 28 Nov 2009 21:14:00 +=
0000
> ++
> +--- libnih-1.0.3.orig/debian/libnih1.symbols
> ++++ libnih-1.0.3/debian/libnih1.symbols
> +@@ -0,0 +1,2 @@
> ++libnih.so.1 libnih1 #MINVER#
> ++ *@LIBNIH_1_0 1.0.0
> +--- libnih-1.0.3.orig/debian/libnih-dbus-dev.install
> ++++ libnih-1.0.3/debian/libnih-dbus-dev.install
> +@@ -0,0 +1,5 @@
> ++lib/*/libnih-dbus.a
> ++lib/*/libnih-dbus.so
> ++usr/include/libnih-dbus.h
> ++usr/include/nih-dbus
> ++usr/lib/*/pkgconfig/libnih-dbus.pc
> +--- libnih-1.0.3.orig/debian/libnih1.postinst
> ++++ libnih-1.0.3/debian/libnih1.postinst
> +@@ -0,0 +1,53 @@
> ++#!/bin/sh
> ++
> ++set -e
> ++
> ++if [ "$1" =3D configure ]; then
> ++    # A dependent library of Upstart has changed, so restart Upstart
> ++    # such that it can safely unmount the root filesystem (LP: #740390)
> ++
> ++    # Query running version of Upstart, but only when we know
> ++    # that initctl will work.
> ++    #
> ++    # The calculated version string may be the null string if
> ++    # Upstart is not running (where for example an alternative
> ++    # init is running outside a chroot environment) or if the
> ++    # query failed for some reason. However, the version check
> ++    # below handles a null version string correctly.
> ++    UPSTART_VERSION_RUNNING=3D$(initctl version 2>/dev/null |\
> ++        awk '{print $3}'|tr -d ')' || :)
> ++
> ++    if ischroot; then
> ++        # Do not honour re-exec when requested from within a
> ++        # chroot since:
> ++        #
> ++        # (a) The version of Upstart outside might not support it.
> ++        # (b) An isolated environment such as a chroot should
> ++        #     not be able to modify its containing environment.
> ++        #
> ++        # A sufficiently new Upstart will actually handle a re-exec
> ++        # request coming from telinit within a chroot correctly (by
> ++        # doing nothing) but it's simple enough to perform the check
> ++        # here and save Upstart the effort.
> ++        :
> ++    elif dpkg --compare-versions "$UPSTART_VERSION_RUNNING" ge 1.6.1; t=
hen
> ++        # We are not running inside a chroot and the running version
> ++        # of Upstart supports stateful re-exec, so we can
> ++        # restart immediately.
> ++        #
> ++        # XXX: Note that the check on the running version must
> ++        # remain *indefinitely* since it's the only safe way to
> ++        # know if stateful re-exec is supported: simply checking
> ++        # packaged version numbers is not sufficient since
> ++        # the package could be upgraded multiple times without a
> ++        # reboot.
> ++        telinit u || :
> ++    else
> ++        # Before we shutdown or reboot, we need to re-exec so that we
> ++        # can safely remount the root filesystem; we can't just do that
> ++        # here because we lose state.
> ++        touch /var/run/init.upgraded || :
> ++    fi
> ++fi
> ++
> ++#DEBHELPER#
> +--- libnih-1.0.3.orig/debian/libnih-dbus1.symbols
> ++++ libnih-1.0.3/debian/libnih-dbus1.symbols
> +@@ -0,0 +1,2 @@
> ++libnih-dbus.so.1 libnih-dbus1 #MINVER#
> ++ *@LIBNIH_DBUS_1_0 1.0.0
> +--- libnih-1.0.3.orig/debian/changelog
> ++++ libnih-1.0.3/debian/changelog
> +@@ -0,0 +1,213 @@
> ++libnih (1.0.3-4ubuntu16) raring; urgency=3Dlow
> ++
> ++  * debian/{libnih1.postinst,libnih-dbus1.postinst}: Force an upgrade to
> ++    restart Upstart (to pick up new package version) if the running
> ++    instance supports it.
> ++  * Merge of important fixes from lp:~upstart-devel/libnih/nih
> ++    (LP: #776532, LP: #777097, LP: #834813, LP: #1123588).
> ++
> ++ -- James Hunt <james.hunt@ubuntu.com>  Thu, 14 Mar 2013 09:14:22 +0000
> ++
> ++libnih (1.0.3-4ubuntu15) raring; urgency=3Dlow
> ++
> ++  * Enable cross-building, sans adding :native build-dependencies.
> ++    See comments in debian/control.
> ++  * Lintian fixes.
> ++
> ++ -- Dmitrijs Ledkovs <dmitrij.ledkov@ubuntu.com>  Tue, 08 Jan 2013 15:3=
8:58 +0000
> ++
> ++libnih (1.0.3-4ubuntu14) raring; urgency=3Dlow
> ++
> ++  * Update dbus code generator to allow for empty lists for type 'as'.
> ++    This drops the !=3D NULL check for NULL terminated arrays and moves=
 the
> ++    iteration loop inside an 'if' statement.
> ++
> ++ -- St=C3=A9phane Graber <stgraber@ubuntu.com>  Thu, 13 Dec 2012 10:00:=
27 -0500
> ++
> ++libnih (1.0.3-4ubuntu13) raring; urgency=3Dlow
> ++
> ++  [ Petr Lautrbach <plautrba@redhat.com>, Dmitrijs Ledkovs ]
> ++  * Fallback to lstat, if dirent.d_type is not available (not portable)
> ++    (LP: #672643) (Closes: #695604)
> ++
> ++ -- Dmitrijs Ledkovs <dmitrij.ledkov@ubuntu.com>  Tue, 11 Dec 2012 17:2=
6:52 +0000
> ++
> ++libnih (1.0.3-4ubuntu12) raring; urgency=3Dlow
> ++
> ++  * nih/logging.c: Use our own __nih_abort_msg rather than the (e)glibc
> ++    private symbol __abort_msg to avoid upgrade issues (LP: #997359).
> ++  * nih/tests/test_logging.c: Update tests for __nih_abort_msg.
> ++
> ++ -- James Hunt <james.hunt@ubuntu.com>  Thu, 25 Oct 2012 10:57:30 +0100
> ++
> ++libnih (1.0.3-4ubuntu11) quantal; urgency=3Dlow
> ++
> ++  * Addition of debian/libnih-dbus1.postinst and
> ++    debian/libnih1.postinst to force Upstart re-exec on shutdown
> ++    to avoid unmounting disks uncleanly (LP: #740390).
> ++
> ++ -- James Hunt <james.hunt@ubuntu.com>  Wed, 03 Oct 2012 16:49:40 +0100
> ++
> ++libnih (1.0.3-4ubuntu10) quantal; urgency=3Dlow
> ++
> ++  * Update config.guess,sub for aarch64
> ++
> ++ -- Wookey <wookey@wookware.org>  Mon, 01 Oct 2012 12:57:05 +0100
> ++
> ++libnih (1.0.3-4ubuntu9) precise; urgency=3Dlow
> ++
> ++  * Mark the nih-dbus-tool package Multi-Arch: foreign so it can be use=
d as
> ++    a build-dependency of upstart when cross-building.
> ++
> ++ -- Steve Langasek <steve.langasek@ubuntu.com>  Wed, 15 Feb 2012 22:57:=
50 -0800
> ++
> ++libnih (1.0.3-4ubuntu8) precise; urgency=3Dlow
> ++
> ++  * libnih1 needs a versioned Pre-Depend on libc6 instead of just a Dep=
end,
> ++    because libc6 itself uses runlevel from the upstart package in its
> ++    preinst, which in turn uses libnih1, which needs to be loadable (i.=
e.,
> ++    its symbol references resolve).  We therefore need to ensure that
> ++    libnih1's dependencies are always unpacked before libnih1 itself is
> ++    unpacked.  While having something further up the stack (such as ups=
tart,
> ++    or something on top of upstart) being marked Essential: yes and wit=
h the
> ++    necessary pre-depends would let apt handle this for us with its
> ++    "immediate configuration" support, but for various reasons we don't=
 want
> ++    to make upstart essential.  LP: #508083.
> ++
> ++ -- Steve Langasek <steve.langasek@ubuntu.com>  Fri, 10 Feb 2012 12:13:=
25 -0800
> ++
> ++libnih (1.0.3-4ubuntu7) precise; urgency=3Dlow
> ++
> ++  * Relax dependency on libc6.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Wed, 08 Feb 2012 23:43:21 +0100
> ++
> ++libnih (1.0.3-4ubuntu6) precise; urgency=3Dlow
> ++
> ++  * Rebuild with libc6-dev (>=3D 2.15~).
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Wed, 08 Feb 2012 21:48:57 +0100
> ++
> ++libnih (1.0.3-4ubuntu5) precise; urgency=3Dlow
> ++
> ++  * Mark libnih-dev and libnih-dbus-dev Multi-Arch: same as well.
> ++
> ++ -- Steve Langasek <steve.langasek@ubuntu.com>  Sun, 06 Nov 2011 14:45:=
07 -0800
> ++
> ++libnih (1.0.3-4ubuntu4) precise; urgency=3Dlow
> ++
> ++  * Make libnih1 and libnih-dbus1 installable using multi-arch.
> ++
> ++ -- James Hunt <james.hunt@ubuntu.com>  Tue, 01 Nov 2011 14:25:09 -0400
> ++
> ++libnih (1.0.3-4ubuntu3) precise; urgency=3Dlow
> ++
> ++  * Build to install with eglibc-2.15.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Fri, 14 Oct 2011 14:05:03 +0200
> ++
> ++libnih (1.0.3-4ubuntu2) oneiric; urgency=3Dlow
> ++
> ++  * Use dpkg-buildflags to get the build flags.
> ++  * Build with the default build flags, don't hard-code -Os. LP: #79131=
5.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Wed, 15 Jun 2011 16:45:42 +0200
> ++
> ++libnih (1.0.3-4ubuntu1) oneiric; urgency=3Dlow
> ++
> ++  * Merge from debian unstable. Retained Ubuntu Build-Depends and Prior=
ity.
> ++
> ++ -- James Hunt <james.hunt@ubuntu.com>  Mon, 23 May 2011 19:28:19 +0100
> ++
> ++libnih (1.0.3-1ubuntu1) natty; urgency=3Dlow
> ++
> ++  * Rebuild with libc6-dev (>=3D 2.13~).
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Fri, 18 Feb 2011 12:09:29 +0100
> ++
> ++libnih (1.0.3-1) natty; urgency=3Dlow
> ++
> ++  * New upstream release:
> ++    - Added support for passing file descriptors over D-Bus to nih-dbus=
-tool
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Thu, 23 Dec 2010 22:28:24 +=
0000
> ++
> ++libnih (1.0.2-2) natty; urgency=3Dlow
> ++
> ++  * Revert the previous upload.  It is never acceptable to simply disab=
le
> ++    tests, especially when it turns out that the test that was disabled
> ++    was failing because there was a serious bug that could cause kernel
> ++    panics for people on boot.
> ++
> ++    Test suites are here for a reason.
> ++
> ++  * Bumped libdbus Build-Dependency to the version with the bug fix that
> ++    caused the test suite to fail.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Wed, 08 Dec 2010 19:40:15 +=
0000
> ++
> ++libnih (1.0.2-1ubuntu3) natty; urgency=3Dlow
> ++
> ++  * Disable some tests on ppc64 to build an initial package.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Thu, 18 Nov 2010 10:59:38 +0100
> ++
> ++libnih (1.0.2-1ubuntu2) maverick; urgency=3Dlow
> ++
> ++  * Re-add -fPIE to the testsuite on armel, removing all armel-specific=
 tests;
> ++    current gcc-4.4 don't seem affected by the ICE anymore (see LP #398=
403).
> ++
> ++ -- Lo=C3=AFc Minier <loic.minier@linaro.org>  Mon, 23 Aug 2010 10:25:3=
1 +0200
> ++
> ++libnih (1.0.2-1ubuntu1) maverick; urgency=3Dlow
> ++
> ++  * Rebuild with libc6-dev (>=3D 2.12~), after checking that
> ++    __abort_msg is available with the same signature in eglibc 2.12.
> ++  * Don't build the testsuite with -fPIE on armel; LP: #398403.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Sun, 30 May 2010 02:54:56 +0200
> ++
> ++libnih (1.0.2-1) maverick; urgency=3Dlow
> ++
> ++  * New upstream release:
> ++    - Rename AC_COPYRIGHT to NIH_COPYRIGHT to avoid conflict with other
> ++      packages.
> ++    - Add serial to libnih.m4
> ++    - Add NIH_WITH_LOCAL_LIBNIH macro.
> ++
> ++  * Fix use of ${Source-Version} to be ${binary:Version}
> ++  * Add debian/source/format with "1.0" to be future compatible.
> ++  * Bump standards version.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Tue, 27 Apr 2010 10:49:55 -=
0700
> ++
> ++libnih (1.0.1-1) lucid; urgency=3Dlow
> ++
> ++  * New upstream release:
> ++    - Add missing __nih_* symbols to linker version script so that we
> ++      can link Upstart's test suite.
> ++    - Glibc __abort_msg symbol now only linked as a weak symbol.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Thu, 04 Feb 2010 14:53:26 -=
0800
> ++
> ++libnih (1.0.0-2build1) lucid; urgency=3Dlow
> ++
> ++  * Rebuild to pick up relaxed dependency on libc6, after checking that
> ++    __abort_msg is available with the same signature in eglibc 2.11.
> ++    LP: #508702.
> ++
> ++ -- Matthias Klose <doko@ubuntu.com>  Mon, 18 Jan 2010 16:09:13 +0100
> ++
> ++libnih (1.0.0-2) lucid; urgency=3Dlow
> ++
> ++  * debian/control: Add build-dependency on dbus so the test suite can
> ++    pass on the buildds.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Sat, 28 Nov 2009 23:28:27 +=
0000
> ++
> ++libnih (1.0.0-1) lucid; urgency=3Dlow
> ++
> ++  * First upstream release.  Previously this code was included in the
> ++    upstart, mountall and ureadahead source packages.
> ++
> ++ -- Scott James Remnant <scott@ubuntu.com>  Sat, 28 Nov 2009 21:14:00 +=
0000
> +--- libnih-1.0.3.orig/debian/source/format
> ++++ libnih-1.0.3/debian/source/format
> +@@ -0,0 +1 @@
> ++1.0
> +--- libnih-1.0.3.orig/nih-dbus/dbus_proxy.h
> ++++ libnih-1.0.3/nih-dbus/dbus_proxy.h
> +@@ -146,14 +146,14 @@
> + 					    const char *name, const char *path,
> + 					    NihDBusLostHandler lost_handler,
> + 					    void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NihDBusProxySignal *nih_dbus_proxy_connect (NihDBusProxy *proxy,
> + 					    const NihDBusInterface *interface,
> + 					    const char *name,
> + 					    NihDBusSignalHandler handler,
> + 					    void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus/dbus_object.h
> ++++ libnih-1.0.3/nih-dbus/dbus_object.h
> +@@ -61,8 +61,7 @@
> + 				    DBusConnection *connection,
> + 				    const char *path,
> + 				    const NihDBusInterface **interfaces,
> +-				    void *data)
> +-	__attribute__ ((malloc));
> ++				    void *data);
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus/dbus_util.h
> ++++ libnih-1.0.3/nih-dbus/dbus_util.h
> +@@ -26,7 +26,7 @@
> + NIH_BEGIN_EXTERN
> +=20
> + char *nih_dbus_path (const void *parent, const char *root, ...)
> +-	__attribute__ ((sentinel, warn_unused_result, malloc));
> ++	__attribute__ ((sentinel, warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus/dbus_pending_data.h
> ++++ libnih-1.0.3/nih-dbus/dbus_pending_data.h
> +@@ -104,7 +104,7 @@
> + 					       NihDBusReplyHandler handler,
> + 					       NihDBusErrorHandler error_handler,
> + 					       void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus/dbus_proxy.c
> ++++ libnih-1.0.3/nih-dbus/dbus_proxy.c
> +@@ -46,11 +46,11 @@
> + 	__attribute__ ((warn_unused_result));
> + static char *nih_dbus_proxy_name_rule         (const void *parent,
> + 					       NihDBusProxy *proxy)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + static int   nih_dbus_proxy_signal_destroy    (NihDBusProxySignal *prox=
ied);
> + static char *nih_dbus_proxy_signal_rule       (const void *parent,
> + 					       NihDBusProxySignal *proxied)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + /* Prototypes for handler functions */
> + static DBusHandlerResult nih_dbus_proxy_name_owner_changed (DBusConnect=
ion *connection,
> +--- libnih-1.0.3.orig/nih-dbus-tool/symbol.c
> ++++ libnih-1.0.3/nih-dbus-tool/symbol.c
> +@@ -40,10 +40,10 @@
> + /* Prototypes for static functions */
> + static char *symbol_strcat_interface (char **str, const void *parent,
> + 				      const char *format, ...)
> +-	__attribute__ ((format (printf, 3, 4), warn_unused_result, malloc));
> ++	__attribute__ ((format (printf, 3, 4), warn_unused_result));
> + static char *symbol_strcat_title     (char **str, const void *parent,
> + 				      const char *format, ...)
> +-	__attribute__ ((format (printf, 3, 4), warn_unused_result, malloc));
> ++	__attribute__ ((format (printf, 3, 4), warn_unused_result));
> +=20
> +=20
> + /**
> +--- libnih-1.0.3.orig/nih-dbus-tool/demarshal.h
> ++++ libnih-1.0.3/nih-dbus-tool/demarshal.h
> +@@ -37,7 +37,7 @@
> + 		 const char *prefix, const char *interface_symbol,
> + 		 const char *member_symbol, const char *symbol,
> + 		 NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/symbol.h
> ++++ libnih-1.0.3/nih-dbus-tool/symbol.h
> +@@ -28,22 +28,22 @@
> + int   symbol_valid     (const char *symbol);
> +=20
> + char *symbol_from_name (const void *parent, const char *name)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *symbol_impl      (const void *parent, const char *prefix,
> + 			const char *interface_name, const char *name,
> + 			const char *postfix)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *symbol_extern    (const void *parent, const char *prefix,
> + 			const char *interface_symbol, const char *midfix,
> + 			const char *symbol, const char *postfix)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *symbol_typedef   (const void *parent, const char *prefix,
> + 			const char *interface_symbol, const char *midfix,
> + 			const char *symbol, const char *postfix)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/output.h
> ++++ libnih-1.0.3/nih-dbus-tool/output.h
> +@@ -35,9 +35,9 @@
> + 	__attribute__ ((warn_unused_result));
> +=20
> + char *output_preamble (const void *parent, const char *path)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *output_sentinel (const void *parent, const char *path)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/parse.h
> ++++ libnih-1.0.3/nih-dbus-tool/parse.h
> +@@ -95,7 +95,7 @@
> +=20
> + ParseStack *parse_stack_push (const void *parent, NihList *stack,
> + 			      ParseStackType type, void *data)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + ParseStack *parse_stack_top  (NihList *stack);
> +=20
> + void        parse_start_tag  (XML_Parser xmlp, const char *tag,
> +@@ -103,7 +103,7 @@
> + void        parse_end_tag    (XML_Parser xmlp, const char *tag);
> +=20
> + Node *      parse_xml        (const void *parent, int fd, const char *f=
ilename)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/type.h
> ++++ libnih-1.0.3/nih-dbus-tool/type.h
> +@@ -94,43 +94,43 @@
> +=20
> + char *      type_of               (const void * parent,
> + 				   DBusSignatureIter *iter)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + TypeVar *   type_var_new          (const void *parent, const char *type,
> + 				   const char *name)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_var_to_string    (const void *parent, TypeVar *var)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_var_layout       (const void *parent, NihList *vars)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + TypeFunc *  type_func_new         (const void *parent, const char *type,
> + 				   const char *name)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_func_to_string   (const void *parent, TypeFunc *func)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_func_to_typedef  (const void *parent, TypeFunc *func)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_func_layout      (const void *parent, NihList *funcs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + TypeStruct *type_struct_new       (const void *parent, const char *name)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_struct_to_string (const void *parent, TypeStruct *stru=
cture)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *      type_to_const         (char **type, const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_to_pointer       (char **type, const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_to_static        (char **type, const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *      type_to_extern        (char **type, const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *      type_strcat_assert    (char **block, const void *parent,
> + 				   TypeVar *var, TypeVar *prev, TypeVar *next)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/argument.h
> ++++ libnih-1.0.3/nih-dbus-tool/argument.h
> +@@ -61,7 +61,7 @@
> +=20
> + Argument *argument_new        (const void *parent, const char *name,
> + 			       const char *type, NihDBusArgDir direction)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int       argument_start_tag  (XML_Parser xmlp, const char *tag,
> + 			       char * const *attr)
> +--- libnih-1.0.3.orig/nih-dbus-tool/indent.h
> ++++ libnih-1.0.3/nih-dbus-tool/indent.h
> +@@ -26,9 +26,9 @@
> + NIH_BEGIN_EXTERN
> +=20
> + char *indent  (char **str, const void *parent, int level)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *comment (char **str, const void *parent)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/main.c
> ++++ libnih-1.0.3/nih-dbus-tool/main.c
> +@@ -52,10 +52,10 @@
> + /* Prototypes for local functions */
> + char *source_file_path (const void *parent, const char *output_path,
> + 			const char *filename)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *header_file_path (const void *parent, const char *output_path,
> + 			const char *filename)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> +=20
> + /**
> +--- libnih-1.0.3.orig/nih-dbus-tool/signal.h
> ++++ libnih-1.0.3/nih-dbus-tool/signal.h
> +@@ -58,7 +58,7 @@
> + int       signal_name_valid      (const char *name);
> +=20
> + Signal *  signal_new             (const void *parent, const char *name)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int       signal_start_tag       (XML_Parser xmlp, const char *tag,
> + 				  char * const *attr)
> +@@ -76,18 +76,18 @@
> + char *    signal_object_function (const void *parent, const char *prefi=
x,
> + 				  Interface *interface, Signal *signal,
> + 				  NihList *prototypes, NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    signal_proxy_function  (const void *parent, const char *prefi=
x,
> + 				  Interface *interface, Signal *signal,
> + 				  NihList *prototypes, NihList *typedefs,
> + 				  NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    signal_args_array      (const void *parent, const char *prefi=
x,
> + 				  Interface *interface, Signal *signal,
> + 				  NihList *prototypes)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/marshal.c
> ++++ libnih-1.0.3/nih-dbus-tool/marshal.c
> +@@ -49,7 +49,7 @@
> + 			     const char *prefix, const char *interface_symbol,
> + 			     const char *member_symbol, const char *symbol,
> + 			     NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + static char *marshal_array  (const void *parent,
> + 			     DBusSignatureIter *iter,
> + 			     const char *iter_name, const char *name,
> +@@ -58,7 +58,7 @@
> + 			     const char *prefix, const char *interface_symbol,
> + 			     const char *member_symbol, const char *symbol,
> + 			     NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + static char *marshal_struct (const void *parent,
> + 			     DBusSignatureIter *iter,
> + 			     const char *iter_name, const char *name,
> +@@ -67,7 +67,7 @@
> + 			     const char *prefix, const char *interface_symbol,
> + 			     const char *member_symbol, const char *symbol,
> + 			     NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> +=20
> + /**
> +@@ -364,6 +364,7 @@
> + 	nih_local TypeVar *element_len_var =3D NULL;
> + 	nih_local char *   block =3D NULL;
> + 	nih_local char *   vars_block =3D NULL;
> ++	nih_local char *   loop_block =3D NULL;
> +=20
> + 	nih_assert (iter !=3D NULL);
> + 	nih_assert (iter_name !=3D NULL);
> +@@ -448,7 +449,7 @@
> + 	nih_list_add (locals, &array_iter_var->entry);
> +=20
> + 	if (dbus_type_is_fixed (element_type)) {
> +-		if (! nih_strcat_sprintf (&code, parent,
> ++		if (! nih_strcat_sprintf (&loop_block, parent,
> + 					  "for (size_t %s =3D 0; %s < %s; %s++) {\n",
> + 					  loop_name, loop_name, len_name, loop_name)) {
> + 			nih_free (code);
> +@@ -456,6 +457,12 @@
> + 		}
> + 	} else {
> + 		if (! nih_strcat_sprintf (&code, parent,
> ++					  "if (%s) {\n",
> ++					  name)) {
> ++			nih_free (code);
> ++			return NULL;
> ++		}
> ++		if (! nih_strcat_sprintf (&loop_block, parent,
> + 					  "for (size_t %s =3D 0; %s[%s]; %s++) {\n",
> + 					  loop_name, name, loop_name, loop_name)) {
> + 			nih_free (code);
> +@@ -576,7 +583,7 @@
> + 	}
> +=20
> +=20
> +-	if (! nih_strcat_sprintf (&code, parent,
> ++	if (! nih_strcat_sprintf (&loop_block, parent,
> + 			   "%s"
> + 			   "\n"
> + 			   "%s"
> +@@ -590,9 +597,34 @@
> + 	}
> +=20
> + 	/* Close the container again */
> ++	if (! nih_strcat_sprintf (&loop_block, parent,
> ++				  "}\n")) {
> ++		nih_free (code);
> ++		return NULL;
> ++	}
> ++
> ++	if (dbus_type_is_fixed (element_type)) {
> ++		if (! nih_strcat_sprintf (&code, parent,
> ++				 "%s\n", loop_block)) {
> ++			nih_free (code);
> ++			return NULL;
> ++		}
> ++	}
> ++	else {
> ++		if (! indent (&loop_block, NULL, 1)) {
> ++			nih_free (code);
> ++			return NULL;
> ++		}
> ++
> ++		if (! nih_strcat_sprintf (&code, parent,
> ++				 "%s"
> ++				 "}\n\n", loop_block)) {
> ++			nih_free (code);
> ++			return NULL;
> ++		}
> ++	}
> ++
> + 	if (! nih_strcat_sprintf (&code, parent,
> +-				  "}\n"
> +-				  "\n"
> + 				  "if (! dbus_message_iter_close_container (&%s, &%s)) {\n"
> + 				  "%s"
> + 				  "}\n",
> +--- libnih-1.0.3.orig/nih-dbus-tool/demarshal.c
> ++++ libnih-1.0.3/nih-dbus-tool/demarshal.c
> +@@ -51,7 +51,7 @@
> + 			       const char *prefix, const char *interface_symbol,
> + 			       const char *member_symbol, const char *symbol,
> + 			       NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + static char *demarshal_array  (const void *parent,
> + 			       DBusSignatureIter *iter,
> + 			       const char *parent_name,
> +@@ -62,7 +62,7 @@
> + 			       const char *prefix, const char *interface_symbol,
> + 			       const char *member_symbol, const char *symbol,
> + 			       NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + static char *demarshal_struct (const void *parent,
> + 			       DBusSignatureIter *iter,
> + 			       const char *parent_name,
> +@@ -73,7 +73,7 @@
> + 			       const char *prefix, const char *interface_symbol,
> + 			       const char *member_symbol, const char *symbol,
> + 			       NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> +=20
> + /**
> +--- libnih-1.0.3.orig/nih-dbus-tool/interface.h
> ++++ libnih-1.0.3/nih-dbus-tool/interface.h
> +@@ -61,7 +61,7 @@
> +=20
> + Interface *interface_new                           (const void *parent,
> + 						    const char *name)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int        interface_start_tag                     (XML_Parser xmlp,
> + 						    const char *tag,
> +@@ -81,26 +81,26 @@
> + 						    Interface *interface,
> + 						    int with_handlers,
> + 						    NihList *prototypes)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *     interface_signals_array                 (const void *parent,
> + 						    const char *prefix,
> + 						    Interface *interface,
> + 						    int with_filters,
> + 						    NihList *prototypes)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *     interface_properties_array              (const void *parent,
> + 						    const char *prefix,
> + 						    Interface *interface,
> + 						    int with_handlers,
> + 						    NihList *prototypes)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *     interface_struct                        (const void *parent,
> + 						    const char *prefix,
> + 						    Interface *interface,
> + 						    int object,
> + 						    NihList *prototypes)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> +=20
> + char *     interface_proxy_get_all_function        (const void *parent,
> +@@ -108,7 +108,7 @@
> + 						    Interface *interface,
> + 						    NihList *prototypes,
> + 						    NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *     interface_proxy_get_all_notify_function (const void *parent,
> + 						    const char *prefix,
> +@@ -116,14 +116,14 @@
> + 						    NihList *prototypes,
> + 						    NihList *typedefs,
> + 						    NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *     interface_proxy_get_all_sync_function   (const void *parent,
> + 						    const char *prefix,
> + 						    Interface *interface,
> + 						    NihList *prototypes,
> + 						    NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/method.h
> ++++ libnih-1.0.3/nih-dbus-tool/method.h
> +@@ -62,7 +62,7 @@
> + int       method_name_valid            (const char *name);
> +=20
> + Method *  method_new                   (const void *parent, const char =
*name)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int       method_start_tag             (XML_Parser xmlp, const char *ta=
g,
> + 					char * const *attr)
> +@@ -82,33 +82,33 @@
> + 					Interface *interface, Method *method,
> + 					NihList *prototypes, NihList *handlers,
> + 					NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    method_reply_function        (const void *parent, const char =
*prefix,
> + 					Interface *interface, Method *method,
> + 					NihList *prototypes, NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    method_proxy_function        (const void *parent, const char =
*prefix,
> + 					Interface *interface, Method *method,
> + 					NihList *prototypes, NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    method_proxy_notify_function (const void *parent, const char =
*prefix,
> + 					Interface *interface, Method *method,
> + 					NihList *prototypes, NihList *typedefs,
> + 					NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    method_proxy_sync_function   (const void *parent, const char =
*prefix,
> + 					Interface *interface, Method *method,
> + 					NihList *prototypes, NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    method_args_array            (const void *parent, const char =
*prefix,
> + 					Interface *interface, Method *method,
> + 					NihList *prototypes)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/node.h
> ++++ libnih-1.0.3/nih-dbus-tool/node.h
> +@@ -47,7 +47,7 @@
> + int        node_path_valid       (const char *name);
> +=20
> + Node *     node_new              (const void *parent, const char *path)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int        node_start_tag        (XML_Parser xmlp, const char *tag,
> + 				  char * const *attr)
> +@@ -59,18 +59,18 @@
> +=20
> + char *     node_interfaces_array (const void *parent, const char *prefi=
x,
> + 				  Node *node, int object, NihList *prototypes)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *     node_object_functions (const void *parent, const char *prefi=
x,
> + 				  Node *node,
> + 				  NihList *prototypes, NihList *handlers,
> + 				  NihList *structs, NihList *externs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *     node_proxy_functions  (const void *parent, const char *prefi=
x,
> + 				  Node *node,
> + 				  NihList *prototypes, NihList *structs,
> + 				  NihList *typedefs, NihList *externs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/marshal.h
> ++++ libnih-1.0.3/nih-dbus-tool/marshal.h
> +@@ -35,7 +35,7 @@
> + 	       const char *prefix, const char *interface_symbol,
> + 	       const char *member_symbol, const char *symbol,
> + 	       NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/type.c
> ++++ libnih-1.0.3/nih-dbus-tool/type.c
> +@@ -1101,7 +1101,7 @@
> + 	nih_assert (block !=3D NULL);
> + 	nih_assert (var !=3D NULL);
> +=20
> +-	if (! strchr (var->type, '*'))
> ++	if (! strchr (var->type, '*') || ! strcmp (var->type, "char * const *"=
))
> + 		return *block;
> +=20
> + 	if (next && (! strcmp (next->type, "size_t"))) {
> +--- libnih-1.0.3.orig/nih-dbus-tool/property.h
> ++++ libnih-1.0.3/nih-dbus-tool/property.h
> +@@ -65,7 +65,7 @@
> + 					      const char *name,
> + 					      const char *type,
> + 					      NihDBusAccess access)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + int       property_start_tag                 (XML_Parser xmlp, const ch=
ar *tag,
> + 					      char * const *attr)
> +@@ -88,7 +88,7 @@
> + 					      NihList *prototypes,
> + 					      NihList *handlers,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *    property_object_set_function       (const void *parent,
> + 					      const char *prefix,
> + 					      Interface *interface,
> +@@ -96,7 +96,7 @@
> + 					      NihList *prototypes,
> + 					      NihList *handlers,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    property_proxy_get_function        (const void *parent,
> + 					      const char *prefix,
> +@@ -104,7 +104,7 @@
> + 					      Property *property,
> + 					      NihList *prototypes,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *    property_proxy_get_notify_function (const void *parent,
> + 					      const char *prefix,
> + 					      Interface *interface,
> +@@ -112,7 +112,7 @@
> + 					      NihList *prototypes,
> + 					      NihList *typedefs,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    property_proxy_set_function        (const void *parent,
> + 					      const char *prefix,
> +@@ -120,7 +120,7 @@
> + 					      Property *property,
> + 					      NihList *prototypes,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *    property_proxy_set_notify_function (const void *parent,
> + 					      const char *prefix,
> + 					      Interface *interface,
> +@@ -128,7 +128,7 @@
> + 					      NihList *prototypes,
> + 					      NihList *typedefs,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + char *    property_proxy_get_sync_function   (const void *parent,
> + 					      const char *prefix,
> +@@ -136,14 +136,14 @@
> + 					      Property *property,
> + 					      NihList *prototypes,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + char *    property_proxy_set_sync_function   (const void *parent,
> + 					      const char *prefix,
> + 					      Interface *interface,
> + 					      Property *property,
> + 					      NihList *prototypes,
> + 					      NihList *structs)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + NIH_END_EXTERN
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/test_main.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/test_main.c
> +@@ -100,10 +100,10 @@
> +=20
> + extern char *source_file_path (const void *parent, const char *output_p=
ath,
> + 			       const char *filename)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> + extern char *header_file_path (const void *parent, const char *output_p=
ath,
> + 			       const char *filename)
> +-	__attribute__ ((warn_unused_result, malloc));
> ++	__attribute__ ((warn_unused_result));
> +=20
> + void
> + test_source_file_path (void)
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/test_com.netsplit.Nih.Test_obj=
ect.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/test_com.netsplit.Nih.Test_object.c
> +@@ -12524,6 +12524,7 @@
> + 		dbus_message_iter_init (reply, &iter);
> +=20
> + 		dbus_message_iter_get_basic (&iter, &str_value);
> ++		TEST_NE (str_value[0], '\0');
> + 		TEST_TRUE (strchr ("0123456789", str_value[0]));
> +=20
> + 		dbus_message_unref (reply);
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/test_marshal.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/test_marshal.c
> +@@ -1479,39 +1479,41 @@
> + 				   "\treturn -1;\n"
> + 				   "}\n"
> + 				   "\n"
> +-				   "for (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> +-				   "\tDBusMessageIter value_element_iter;\n"
> +-				   "\tconst int16_t * value_element;\n"
> +-				   "\tsize_t          value_element_len;\n"
> ++				   "if (value) {\n"
> ++				   "\tfor (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> ++				   "\t\tDBusMessageIter value_element_iter;\n"
> ++				   "\t\tconst int16_t * value_element;\n"
> ++				   "\t\tsize_t          value_element_len;\n"
> + 				   "\n"
> +-				   "\tvalue_element =3D value[value_i];\n"
> +-				   "\tvalue_element_len =3D value_len[value_i];\n"
> ++				   "\t\tvalue_element =3D value[value_i];\n"
> ++				   "\t\tvalue_element_len =3D value_len[value_i];\n"
> + 				   "\n"
> +=20
> +-				   "\t/* Marshal an array onto the message */\n"
> +-				   "\tif (! dbus_message_iter_open_container (&value_iter, DBUS_TYP=
E_ARRAY, \"n\", &value_element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> ++				   "\t\t/* Marshal an array onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_open_container (&value_iter, DBUS_T=
YPE_ARRAY, \"n\", &value_element_iter)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\tfor (size_t value_element_i =3D 0; value_element_i < value_el=
ement_len; value_element_i++) {\n"
> +-				   "\t\tint16_t value_element_element;\n"
> ++				   "\t\tfor (size_t value_element_i =3D 0; value_element_i < value_=
element_len; value_element_i++) {\n"
> ++				   "\t\t\tint16_t value_element_element;\n"
> + 				   "\n"
> +-				   "\t\tvalue_element_element =3D value_element[value_element_i];\n"
> ++				   "\t\t\tvalue_element_element =3D value_element[value_element_i];=
\n"
> + 				   "\n"
> +-				   "\t\t/* Marshal a int16_t onto the message */\n"
> +-				   "\t\tif (! dbus_message_iter_append_basic (&value_element_iter, =
DBUS_TYPE_INT16, &value_element_element)) {\n"
> +-				   "\t\t\tdbus_message_iter_abandon_container (&value_iter, &value_=
element_iter);\n"
> ++				   "\t\t\t/* Marshal a int16_t onto the message */\n"
> ++				   "\t\t\tif (! dbus_message_iter_append_basic (&value_element_iter=
, DBUS_TYPE_INT16, &value_element_element)) {\n"
> ++				   "\t\t\t\tdbus_message_iter_abandon_container (&value_iter, &valu=
e_element_iter);\n"
> ++				   "\t\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter=
);\n"
> ++				   "\t\t\t\treturn -1;\n"
> ++				   "\t\t\t}\n"
> ++				   "\t\t}\n"
> ++				   "\n"
> ++				   "\t\tif (! dbus_message_iter_close_container (&value_iter, &valu=
e_element_iter)) {\n"
> + 				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> + 				   "\t\t\treturn -1;\n"
> + 				   "\t\t}\n"
> +-				   "\t}\n"
> +-				   "\n"
> +-				   "\tif (! dbus_message_iter_close_container (&value_iter, &value_=
element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> +=20
> ++				   "\t}\n"
> + 				   "}\n"
> + 				   "\n"
> + 				   "if (! dbus_message_iter_close_container (&iter, &value_iter)) {=
\n"
> +@@ -1766,15 +1768,17 @@
> + 				   "\treturn -1;\n"
> + 				   "}\n"
> + 				   "\n"
> +-				   "for (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> +-				   "\tconst char *value_element;\n"
> ++				   "if (value) {\n"
> ++				   "\tfor (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> ++				   "\t\tconst char *value_element;\n"
> + 				   "\n"
> +-				   "\tvalue_element =3D value[value_i];\n"
> ++				   "\t\tvalue_element =3D value[value_i];\n"
> + 				   "\n"
> +-				   "\t/* Marshal a char * onto the message */\n"
> +-				   "\tif (! dbus_message_iter_append_basic (&value_iter, DBUS_TYPE_=
STRING, &value_element)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> ++				   "\t\t/* Marshal a char * onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_append_basic (&value_iter, DBUS_TYP=
E_STRING, &value_element)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\t}\n"
> + 				   "}\n"
> + 				   "\n"
> +@@ -1933,35 +1937,39 @@
> + 				   "\treturn -1;\n"
> + 				   "}\n"
> + 				   "\n"
> +-				   "for (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> +-				   "\tDBusMessageIter value_element_iter;\n"
> +-				   "\tchar * const *  value_element;\n"
> ++				   "if (value) {\n"
> ++				   "\tfor (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> ++				   "\t\tDBusMessageIter value_element_iter;\n"
> ++				   "\t\tchar * const *  value_element;\n"
> + 				   "\n"
> +-				   "\tvalue_element =3D value[value_i];\n"
> ++				   "\t\tvalue_element =3D value[value_i];\n"
> + 				   "\n"
> +-				   "\t/* Marshal an array onto the message */\n"
> +-				   "\tif (! dbus_message_iter_open_container (&value_iter, DBUS_TYP=
E_ARRAY, \"s\", &value_element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> +-				   "\n"
> +-				   "\tfor (size_t value_element_i =3D 0; value_element[value_elemen=
t_i]; value_element_i++) {\n"
> +-				   "\t\tconst char *value_element_element;\n"
> ++				   "\t\t/* Marshal an array onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_open_container (&value_iter, DBUS_T=
YPE_ARRAY, \"s\", &value_element_iter)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\t\tvalue_element_element =3D value_element[value_element_i];\n"
> ++				   "\t\tif (value_element) {\n"
> ++				   "\t\t\tfor (size_t value_element_i =3D 0; value_element[value_el=
ement_i]; value_element_i++) {\n"
> ++				   "\t\t\t\tconst char *value_element_element;\n"
> ++				   "\n"
> ++				   "\t\t\t\tvalue_element_element =3D value_element[value_element_i=
];\n"
> ++				   "\n"
> ++				   "\t\t\t\t/* Marshal a char * onto the message */\n"
> ++				   "\t\t\t\tif (! dbus_message_iter_append_basic (&value_element_it=
er, DBUS_TYPE_STRING, &value_element_element)) {\n"
> ++				   "\t\t\t\t\tdbus_message_iter_abandon_container (&value_iter, &va=
lue_element_iter);\n"
> ++				   "\t\t\t\t\tdbus_message_iter_abandon_container (&iter, &value_it=
er);\n"
> ++				   "\t\t\t\t\treturn -1;\n"
> ++				   "\t\t\t\t}\n"
> ++				   "\t\t\t}\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\t\t/* Marshal a char * onto the message */\n"
> +-				   "\t\tif (! dbus_message_iter_append_basic (&value_element_iter, =
DBUS_TYPE_STRING, &value_element_element)) {\n"
> +-				   "\t\t\tdbus_message_iter_abandon_container (&value_iter, &value_=
element_iter);\n"
> ++				   "\t\tif (! dbus_message_iter_close_container (&value_iter, &valu=
e_element_iter)) {\n"
> + 				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> + 				   "\t\t\treturn -1;\n"
> + 				   "\t\t}\n"
> + 				   "\t}\n"
> +-				   "\n"
> +-				   "\tif (! dbus_message_iter_close_container (&value_iter, &value_=
element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> + 				   "}\n"
> + 				   "\n"
> + 				   "if (! dbus_message_iter_close_container (&iter, &value_iter)) {=
\n"
> +@@ -2194,16 +2202,18 @@
> + 				   "\treturn -1;\n"
> + 				   "}\n"
> + 				   "\n"
> +-				   "for (size_t value_item2_i =3D 0; value_item2[value_item2_i]; va=
lue_item2_i++) {\n"
> +-				   "\tconst char *value_item2_element;\n"
> ++				   "if (value_item2) {\n"
> ++				   "\tfor (size_t value_item2_i =3D 0; value_item2[value_item2_i]; =
value_item2_i++) {\n"
> ++				   "\t\tconst char *value_item2_element;\n"
> + 				   "\n"
> +-				   "\tvalue_item2_element =3D value_item2[value_item2_i];\n"
> ++				   "\t\tvalue_item2_element =3D value_item2[value_item2_i];\n"
> + 				   "\n"
> +-				   "\t/* Marshal a char * onto the message */\n"
> +-				   "\tif (! dbus_message_iter_append_basic (&value_item2_iter, DBUS=
_TYPE_STRING, &value_item2_element)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&value_iter, &value_it=
em2_iter);\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> ++				   "\t\t/* Marshal a char * onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_append_basic (&value_item2_iter, DB=
US_TYPE_STRING, &value_item2_element)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&value_iter, &value_=
item2_iter);\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\t}\n"
> + 				   "}\n"
> + 				   "\n"
> +@@ -2642,41 +2652,43 @@
> + 				   "\treturn -1;\n"
> + 				   "}\n"
> + 				   "\n"
> +-				   "for (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> +-				   "\tDBusMessageIter                  value_element_iter;\n"
> +-				   "\tconst char *                     value_element_item0;\n"
> +-				   "\tuint32_t                         value_element_item1;\n"
> +-				   "\tconst MyStructArrayValueElement *value_element;\n"
> ++				   "if (value) {\n"
> ++				   "\tfor (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> ++				   "\t\tDBusMessageIter                  value_element_iter;\n"
> ++				   "\t\tconst char *                     value_element_item0;\n"
> ++				   "\t\tuint32_t                         value_element_item1;\n"
> ++				   "\t\tconst MyStructArrayValueElement *value_element;\n"
> + 				   "\n"
> +-				   "\tvalue_element =3D value[value_i];\n"
> ++				   "\t\tvalue_element =3D value[value_i];\n"
> + 				   "\n"
> +-				   "\t/* Marshal a structure onto the message */\n"
> +-				   "\tif (! dbus_message_iter_open_container (&value_iter, DBUS_TYP=
E_STRUCT, NULL, &value_element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> ++				   "\t\t/* Marshal a structure onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_open_container (&value_iter, DBUS_T=
YPE_STRUCT, NULL, &value_element_iter)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\tvalue_element_item0 =3D value_element->item0;\n"
> ++				   "\t\tvalue_element_item0 =3D value_element->item0;\n"
> + 				   "\n"
> +-				   "\t/* Marshal a char * onto the message */\n"
> +-				   "\tif (! dbus_message_iter_append_basic (&value_element_iter, DB=
US_TYPE_STRING, &value_element_item0)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&value_iter, &value_el=
ement_iter);\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> ++				   "\t\t/* Marshal a char * onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_append_basic (&value_element_iter, =
DBUS_TYPE_STRING, &value_element_item0)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&value_iter, &value_=
element_iter);\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\tvalue_element_item1 =3D value_element->item1;\n"
> ++				   "\t\tvalue_element_item1 =3D value_element->item1;\n"
> + 				   "\n"
> +-				   "\t/* Marshal a uint32_t onto the message */\n"
> +-				   "\tif (! dbus_message_iter_append_basic (&value_element_iter, DB=
US_TYPE_UINT32, &value_element_item1)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&value_iter, &value_el=
ement_iter);\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> ++				   "\t\t/* Marshal a uint32_t onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_append_basic (&value_element_iter, =
DBUS_TYPE_UINT32, &value_element_item1)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&value_iter, &value_=
element_iter);\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\tif (! dbus_message_iter_close_container (&value_iter, &value_=
element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> ++				   "\t\tif (! dbus_message_iter_close_container (&value_iter, &valu=
e_element_iter)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\t}\n"
> + 				   "}\n"
> + 				   "\n"
> +@@ -2912,41 +2924,43 @@
> + 				   "\treturn -1;\n"
> + 				   "}\n"
> + 				   "\n"
> +-				   "for (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> +-				   "\tDBusMessageIter                     value_element_iter;\n"
> +-				   "\tconst char *                        value_element_item0;\n"
> +-				   "\tuint32_t                            value_element_item1;\n"
> +-				   "\tconst MyDictEntryArrayValueElement *value_element;\n"
> ++				   "if (value) {\n"
> ++				   "\tfor (size_t value_i =3D 0; value[value_i]; value_i++) {\n"
> ++				   "\t\tDBusMessageIter                     value_element_iter;\n"
> ++				   "\t\tconst char *                        value_element_item0;\n"
> ++				   "\t\tuint32_t                            value_element_item1;\n"
> ++				   "\t\tconst MyDictEntryArrayValueElement *value_element;\n"
> + 				   "\n"
> +-				   "\tvalue_element =3D value[value_i];\n"
> ++				   "\t\tvalue_element =3D value[value_i];\n"
> + 				   "\n"
> +-				   "\t/* Marshal a structure onto the message */\n"
> +-				   "\tif (! dbus_message_iter_open_container (&value_iter, DBUS_TYP=
E_DICT_ENTRY, NULL, &value_element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> ++				   "\t\t/* Marshal a structure onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_open_container (&value_iter, DBUS_T=
YPE_DICT_ENTRY, NULL, &value_element_iter)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\tvalue_element_item0 =3D value_element->item0;\n"
> ++				   "\t\tvalue_element_item0 =3D value_element->item0;\n"
> + 				   "\n"
> +-				   "\t/* Marshal a char * onto the message */\n"
> +-				   "\tif (! dbus_message_iter_append_basic (&value_element_iter, DB=
US_TYPE_STRING, &value_element_item0)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&value_iter, &value_el=
ement_iter);\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> ++				   "\t\t/* Marshal a char * onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_append_basic (&value_element_iter, =
DBUS_TYPE_STRING, &value_element_item0)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&value_iter, &value_=
element_iter);\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\tvalue_element_item1 =3D value_element->item1;\n"
> ++				   "\t\tvalue_element_item1 =3D value_element->item1;\n"
> + 				   "\n"
> +-				   "\t/* Marshal a uint32_t onto the message */\n"
> +-				   "\tif (! dbus_message_iter_append_basic (&value_element_iter, DB=
US_TYPE_UINT32, &value_element_item1)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&value_iter, &value_el=
ement_iter);\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> +-				   "\t}\n"
> ++				   "\t\t/* Marshal a uint32_t onto the message */\n"
> ++				   "\t\tif (! dbus_message_iter_append_basic (&value_element_iter, =
DBUS_TYPE_UINT32, &value_element_item1)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&value_iter, &value_=
element_iter);\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\n"
> +-				   "\tif (! dbus_message_iter_close_container (&value_iter, &value_=
element_iter)) {\n"
> +-				   "\t\tdbus_message_iter_abandon_container (&iter, &value_iter);\n"
> +-				   "\t\treturn -1;\n"
> ++				   "\t\tif (! dbus_message_iter_close_container (&value_iter, &valu=
e_element_iter)) {\n"
> ++				   "\t\t\tdbus_message_iter_abandon_container (&iter, &value_iter);=
\n"
> ++				   "\t\t\treturn -1;\n"
> ++				   "\t\t}\n"
> + 				   "\t}\n"
> + 				   "}\n"
> + 				   "\n"
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/test_com.netsplit.Nih.Test_pro=
xy.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/test_com.netsplit.Nih.Test_proxy.c
> +@@ -27359,6 +27359,7 @@
> + 		TEST_TRUE (unix_fd_to_str_replied);
> +=20
> + 		TEST_EQ_P (last_data, parent);
> ++		TEST_NE (last_str_value[0], '\0');
> + 		TEST_TRUE (strchr ("0123456789", last_str_value[0]));
> + 		TEST_ALLOC_PARENT (last_str_value, parent);
> +=20
> +@@ -27673,6 +27674,7 @@
> +=20
> + 		TEST_EQ (ret, 0);
> +=20
> ++		TEST_NE (str_value[0], '\0');
> + 		TEST_TRUE (strchr ("0123456789", str_value[0]));
> + 		TEST_ALLOC_PARENT (str_value, parent);
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/test_property.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/test_property.c
> +@@ -8733,7 +8733,7 @@
> + 	TypeVar *       var;
> + 	NihListEntry *  attrib;
> + 	NihDBusProxy *  proxy =3D NULL;
> +-	void *          parent =3D NULL;
> ++	void *          parent __attribute__((unused)) =3D NULL;
> + 	pid_t           pid =3D -1;
> + 	int             status;
> + 	DBusMessage *   method_call;
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/expected/test_method_object_fu=
nction_standard.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/expected/test_method_object_functio=
n_standard.c
> +@@ -136,17 +136,19 @@
> + 			goto enomem;
> + 		}
> +=20
> +-		for (size_t output_i =3D 0; output[output_i]; output_i++) {
> +-			const char *output_element;
> ++		if (output) {
> ++			for (size_t output_i =3D 0; output[output_i]; output_i++) {
> ++				const char *output_element;
> +=20
> +-			output_element =3D output[output_i];
> ++				output_element =3D output[output_i];
> +=20
> +-			/* Marshal a char * onto the message */
> +-			if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRING=
, &output_element)) {
> +-				dbus_message_iter_abandon_container (&iter, &output_iter);
> +-				dbus_message_unref (reply);
> +-				reply =3D NULL;
> +-				goto enomem;
> ++				/* Marshal a char * onto the message */
> ++				if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRIN=
G, &output_element)) {
> ++					dbus_message_iter_abandon_container (&iter, &output_iter);
> ++					dbus_message_unref (reply);
> ++					reply =3D NULL;
> ++					goto enomem;
> ++				}
> + 			}
> + 		}
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/expected/test_method_reply_fun=
ction_standard.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/expected/test_method_reply_function=
_standard.c
> +@@ -7,7 +7,6 @@
> + 	DBusMessageIter output_iter;
> +=20
> + 	nih_assert (message !=3D NULL);
> +-	nih_assert (output !=3D NULL);
> +=20
> + 	/* If the sender doesn't care about a reply, don't bother wasting
> + 	 * effort constructing and sending one.
> +@@ -28,16 +27,18 @@
> + 		return -1;
> + 	}
> +=20
> +-	for (size_t output_i =3D 0; output[output_i]; output_i++) {
> +-		const char *output_element;
> +-
> +-		output_element =3D output[output_i];
> +-
> +-		/* Marshal a char * onto the message */
> +-		if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRING,=
 &output_element)) {
> +-			dbus_message_iter_abandon_container (&iter, &output_iter);
> +-			dbus_message_unref (reply);
> +-			return -1;
> ++	if (output) {
> ++		for (size_t output_i =3D 0; output[output_i]; output_i++) {
> ++			const char *output_element;
> ++
> ++			output_element =3D output[output_i];
> ++
> ++			/* Marshal a char * onto the message */
> ++			if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRING=
, &output_element)) {
> ++				dbus_message_iter_abandon_container (&iter, &output_iter);
> ++				dbus_message_unref (reply);
> ++				return -1;
> ++			}
> + 		}
> + 	}
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/expected/test_method_reply_fun=
ction_deprecated.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/expected/test_method_reply_function=
_deprecated.c
> +@@ -7,7 +7,6 @@
> + 	DBusMessageIter output_iter;
> +=20
> + 	nih_assert (message !=3D NULL);
> +-	nih_assert (output !=3D NULL);
> +=20
> + 	/* If the sender doesn't care about a reply, don't bother wasting
> + 	 * effort constructing and sending one.
> +@@ -28,16 +27,18 @@
> + 		return -1;
> + 	}
> +=20
> +-	for (size_t output_i =3D 0; output[output_i]; output_i++) {
> +-		const char *output_element;
> +-
> +-		output_element =3D output[output_i];
> +-
> +-		/* Marshal a char * onto the message */
> +-		if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRING,=
 &output_element)) {
> +-			dbus_message_iter_abandon_container (&iter, &output_iter);
> +-			dbus_message_unref (reply);
> +-			return -1;
> ++	if (output) {
> ++		for (size_t output_i =3D 0; output[output_i]; output_i++) {
> ++			const char *output_element;
> ++
> ++			output_element =3D output[output_i];
> ++
> ++			/* Marshal a char * onto the message */
> ++			if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRING=
, &output_element)) {
> ++				dbus_message_iter_abandon_container (&iter, &output_iter);
> ++				dbus_message_unref (reply);
> ++				return -1;
> ++			}
> + 		}
> + 	}
> +=20
> +--- libnih-1.0.3.orig/nih-dbus-tool/tests/expected/test_method_object_fu=
nction_no_input.c
> ++++ libnih-1.0.3/nih-dbus-tool/tests/expected/test_method_object_functio=
n_no_input.c
> +@@ -88,17 +88,19 @@
> + 			goto enomem;
> + 		}
> +=20
> +-		for (size_t output_i =3D 0; output[output_i]; output_i++) {
> +-			const char *output_element;
> ++		if (output) {
> ++			for (size_t output_i =3D 0; output[output_i]; output_i++) {
> ++				const char *output_element;
> +=20
> +-			output_element =3D output[output_i];
> ++				output_element =3D output[output_i];
> +=20
> +-			/* Marshal a char * onto the message */
> +-			if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRING=
, &output_element)) {
> +-				dbus_message_iter_abandon_container (&iter, &output_iter);
> +-				dbus_message_unref (reply);
> +-				reply =3D NULL;
> +-				goto enomem;
> ++				/* Marshal a char * onto the message */
> ++				if (! dbus_message_iter_append_basic (&output_iter, DBUS_TYPE_STRIN=
G, &output_element)) {
> ++					dbus_message_iter_abandon_container (&iter, &output_iter);
> ++					dbus_message_unref (reply);
> ++					reply =3D NULL;
> ++					goto enomem;
> ++				}
> + 			}
> + 		}
> +=20
> diff --git a/meta-oe/recipes-support/libnih/libnih_1.0.3.bb b/meta-oe/rec=
ipes-support/libnih/libnih_1.0.3.bb
> new file mode 100644
> index 0000000..b5e5e12
> --- /dev/null
> +++ b/meta-oe/recipes-support/libnih/libnih_1.0.3.bb
> @@ -0,0 +1,40 @@
> +# Copyright (c) 2013  LG Electronics, Inc.
> +
> +SUMMARY =3D "libnih library"
> +DESCRIPTION =3D "libnih is a small library for C application development=
 \
> +    containing functions that, despite its name, are not implemented \
> +    elsewhere in the standard library set. \
> +    \
> +    libnih is roughly equivalent to other C libraries such as glib, \
> +    except that its focus is on a small size and intended for \
> +    applications that sit very low in the software stack, especially \
> +    outside of /usr. \
> +    \
> +    It expressly does not reimplement functions that already exist in \
> +    libraries ordinarily shipped in /lib such libc6, and does not do \
> +    foolish things like invent arbitrary typedefs for perfectly good C t=
ypes."
> +
> +SECTION =3D "libs"
> +
> +LICENSE =3D "GPL-2.0"
> +LIC_FILES_CHKSUM =3D "file://COPYING;md5=3D751419260aa954499f7abaabaa882=
bbe"
> +
> +DEPENDS =3D "dbus libnih-native"
> +DEPENDS_class-native =3D "dbus-native"
> +
> +PR =3D "r0"
> +
> +SRC_URI =3D "https://launchpad.net/${BPN}/1.0/${PV}/+download/${BP}.tar.=
gz;name=3Dtarball"
> +SRC_URI +=3D "file://libnih_1.0.3-4ubuntu16.patch;name=3Dpatch"
> +
> +SRC_URI[tarball.md5sum] =3D "db7990ce55e01daffe19006524a1ccb0"
> +SRC_URI[tarball.sha256sum] =3D "897572df7565c0a90a81532671e23c63f99b4efd=
e2eecbbf11e7857fbc61f405"
> +
> +SRC_URI[patch.md5sum] =3D ""
> +SRC_URI[patch.sha256sum] =3D ""
> +
> +inherit autotools
> +inherit gettext
> +
> +# target libnih requires native nih-dbus-tool
> +BBCLASSEXTEND =3D "native"
> --=20
> 1.8.4.2
>=20
>=20
>=20

> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--nnsmrxvwvwwfeoju
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iEYEARECAAYFAleXQKMACgkQN1Ujt2V2gBx8IgCgrWLAMS82kHHOI5ZMHxvqLhsl
LjEAniPy0ScLrTZZHjluGy+898LVA/Ql
=H+Oe
-----END PGP SIGNATURE-----

--nnsmrxvwvwwfeoju--
