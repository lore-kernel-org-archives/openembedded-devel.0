Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB0CDC5479D
	for <webhook@archiver.kernel.org>; Sat,  7 Jan 2023 01:37:40 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
 by mx.groups.io with SMTP id smtpd.web11.11665.1673055451377161261
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 06 Jan 2023 17:37:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=ZJbZ5RIp;
 spf=pass (domain: gmail.com, ip: 209.85.214.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f176.google.com with SMTP id y1so3552100plb.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 06 Jan 2023 17:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TeAW5usizZPaHlEcCXfoELKIQDCbxcOdN+oavf+5JJM=;
        b=ZJbZ5RIp6xapiNlOYVTpRN7JdPm+ALojC+7kyaYtPyp/Zy87FzxYeCx/pGIJnCiO6k
         h9ykt2QCCuZ3AeqLzrQKg4GtzulHKzh0Or8AjqV6sy6NsJJwNK/kf5GqF8qc7ZkxtKq0
         7VZsaRXQgCaIfCxmrQGdpxAcc7MFaGBPK61LymF0+XwkA+Q2YmnsNePlS+IxaUH+BiU2
         3Y3gKiCDCkVAFq6+ThZYbIRJfMBbgtSe5tHaYWpzPsbTLJpWoPdjoA47CBULuuvCfIc7
         dCgz1HA1q7b2mqcUFnLJARYSpwZCk5RGBSRag1c4eUwgZPL2p8sXulSGI2cL3HhHeepK
         Er4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TeAW5usizZPaHlEcCXfoELKIQDCbxcOdN+oavf+5JJM=;
        b=BFvLT7cCtSjkqm4ndn1Qb5mFR5D9qZOk+rXnj7kkQSBN+2IQP3L3pPi4yhSip0f0cM
         gev6mFQ08gthN0giU6nRh6zmommqYCEXvEyro/v6z0G1Bc+LLbRPzcYGsXqQYsWwnmet
         3QDQJaZyB5oqPvDX53ly0ZVVOeKnrA9ALwxcV3zu8xPKWoNanpUFkvRpbACoeSyUv3Dl
         9Gc1kULJJ4eSD9sKmXWa3bk4EIfzVbv+ha3g2NLmIYb+PRYJbJX5LTln2WYBX5/I9zr7
         3YrjYWFJKyWwRaIp7Qy/ECbW3GnnjWGE5ZeZZqfWik+8refedlpKpHfwL67JG+whtrXU
         RfzA==
X-Gm-Message-State: AFqh2kpcnZ/eFHo1MYYjqxiG8B37H4eK9zs9/aZvVqNorw+OcdjH58+7
	X2UQdSCdx6JwuFnANXMnhlDQfvdNzRWW1w==
X-Google-Smtp-Source: AMrXdXtWqy7o/jTLFkk+FDUjAqd2A1cHqdk7s1ku2nd3LP+OXpo865YqGOeoXXBo0yOmdf0M2edAeg==
X-Received: by 2002:a17:902:d589:b0:189:7f28:43a7 with SMTP id k9-20020a170902d58900b001897f2843a7mr80325549plh.29.1673055449729;
        Fri, 06 Jan 2023 17:37:29 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id q14-20020a17090311ce00b00189c536c72asm1545816plh.148.2023.01.06.17.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jan 2023 17:37:29 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH 2/2] trace-cmd: Upgrade to 3.1.5
Date: Fri,  6 Jan 2023 17:37:26 -0800
Message-Id: <20230107013726.1315822-2-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230107013726.1315822-1-raj.khem@gmail.com>
References: <20230107013726.1315822-1-raj.khem@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sat, 07 Jan 2023 01:37:40 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100428

= Drop uneeded 0001-trace-cmd-make-it-build-with-musl.patch
- Update LFS64 patch with the upstream submitted one
- Add a patch to remove useless rpaths

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 .../0001-Do-not-emit-useless-rpath.patch      |   34 +
 ...LFS64-interfaces-off64_t-and-lseek64.patch | 1136 +++++++++++++++++
 ...01-trace-cmd-make-it-build-with-musl.patch |  132 --
 .../0002-replace-off64_t-and-lseek64.patch    |  426 -------
 .../trace-cmd/trace-cmd_2.9.1.bb              |   32 -
 .../trace-cmd/trace-cmd_3.1.5.bb              |   31 +
 6 files changed, 1201 insertions(+), 590 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/trace-cmd/files/0001-Do-not-emit-useless-rpath.patch
 create mode 100644 meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch
 delete mode 100644 meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch
 delete mode 100644 meta-oe/recipes-kernel/trace-cmd/files/0002-replace-off64_t-and-lseek64.patch
 delete mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
 create mode 100644 meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb

diff --git a/meta-oe/recipes-kernel/trace-cmd/files/0001-Do-not-emit-useless-rpath.patch b/meta-oe/recipes-kernel/trace-cmd/files/0001-Do-not-emit-useless-rpath.patch
new file mode 100644
index 0000000000..13a86e65d1
--- /dev/null
+++ b/meta-oe/recipes-kernel/trace-cmd/files/0001-Do-not-emit-useless-rpath.patch
@@ -0,0 +1,34 @@
+From 90fbc3423b5ccdbd54b5851c32b9f92c6658d634 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 6 Jan 2023 17:30:24 -0800
+Subject: [PATCH] Do not emit useless rpath
+
+rpath is pointing to standard libdir which is un-used and yocto build QA
+flag it, there is no need to set rpaths when building in this
+environment
+
+Fixes
+do_package_qa: QA Issue: trace-cmd: /usr/bin/trace-cmd contains probably-redundant RPATH /usr/lib [useless-rpaths]
+
+Upstream-Status: Inappropriate [OE-Specific]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ scripts/utils.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/scripts/utils.mk b/scripts/utils.mk
+index 3fc2d74f..309a8599 100644
+--- a/scripts/utils.mk
++++ b/scripts/utils.mk
+@@ -64,7 +64,7 @@ do_compile =							\
+ 
+ do_app_build =						\
+ 	($(print_app_build)				\
+-	$(CC) $^ -rdynamic -Wl,-rpath=$(libdir) -o $@ $(LDFLAGS) $(CONFIG_LIBS) $(LIBS))
++	$(CC) $^ -rdynamic -o $@ $(LDFLAGS) $(CONFIG_LIBS) $(LIBS))
+ 
+ do_build_static_lib =				\
+ 	($(print_static_lib_build)		\
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch b/meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch
new file mode 100644
index 0000000000..830f1d96e1
--- /dev/null
+++ b/meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch
@@ -0,0 +1,1136 @@
+From c6190920d405a5a6df3797153be93905d98a65f5 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 6 Jan 2023 16:53:06 -0800
+Subject: [PATCH] Replace LFS64 interfaces off64_t and lseek64
+
+Musl does not define these interfaces unless -D_LARGEFILE64_SOURCE is
+defined and that too it is transitional until apps switch to using 64bit
+off_t. We pass -D_LARGEFILE64_SOURCE in makefiles already therefore
+original lseek and off_t are already 64bit
+
+This fixes build with latest musl which has dropped LFS64 interfaces [1]
+
+[1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4i
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20230107010245.1290391-1-raj.khem@gmail.com/]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ .../include/private/trace-cmd-private.h       |  12 +-
+ lib/trace-cmd/include/trace-cmd-local.h       |   4 +-
+ lib/trace-cmd/trace-compress.c                |  30 ++---
+ lib/trace-cmd/trace-input.c                   | 110 +++++++++---------
+ lib/trace-cmd/trace-msg.c                     |  20 ++--
+ lib/trace-cmd/trace-output.c                  |  64 +++++-----
+ lib/trace-cmd/trace-recorder.c                |   8 +-
+ tracecmd/trace-dump.c                         |  34 +++---
+ tracecmd/trace-read.c                         |   2 +-
+ 9 files changed, 142 insertions(+), 142 deletions(-)
+
+diff --git a/lib/trace-cmd/include/private/trace-cmd-private.h b/lib/trace-cmd/include/private/trace-cmd-private.h
+index 271f0541..ac2d02c3 100644
+--- a/lib/trace-cmd/include/private/trace-cmd-private.h
++++ b/lib/trace-cmd/include/private/trace-cmd-private.h
+@@ -106,7 +106,7 @@ const char *tracecmd_get_trace_clock(struct tracecmd_input *handle);
+ const char *tracecmd_get_cpustats(struct tracecmd_input *handle);
+ const char *tracecmd_get_uname(struct tracecmd_input *handle);
+ const char *tracecmd_get_version(struct tracecmd_input *handle);
+-off64_t tracecmd_get_cpu_file_size(struct tracecmd_input *handle, int cpu);
++off_t tracecmd_get_cpu_file_size(struct tracecmd_input *handle, int cpu);
+ 
+ static inline int tracecmd_host_bigendian(void)
+ {
+@@ -336,7 +336,7 @@ int tracecmd_write_buffer_info(struct tracecmd_output *handle);
+ 
+ int tracecmd_write_cpus(struct tracecmd_output *handle, int cpus);
+ int tracecmd_write_cmdlines(struct tracecmd_output *handle);
+-int tracecmd_prepare_options(struct tracecmd_output *handle, off64_t offset, int whence);
++int tracecmd_prepare_options(struct tracecmd_output *handle, off_t offset, int whence);
+ int tracecmd_write_options(struct tracecmd_output *handle);
+ int tracecmd_write_meta_strings(struct tracecmd_output *handle);
+ int tracecmd_append_options(struct tracecmd_output *handle);
+@@ -393,7 +393,7 @@ struct tracecmd_msg_handle {
+ 	short			cpu_count;
+ 	short			version;	/* Current protocol version */
+ 	unsigned long		flags;
+-	off64_t			cache_start_offset;
++	off_t			cache_start_offset;
+ 	bool			done;
+ 	bool			cache;
+ 	int			cfd;
+@@ -542,8 +542,8 @@ int tracecmd_write_guest_time_shift(struct tracecmd_output *handle,
+ struct tracecmd_compress_chunk {
+ 	unsigned int		size;
+ 	unsigned int		zsize;
+-	off64_t			zoffset;
+-	off64_t			offset;
++	off_t			zoffset;
++	off_t			offset;
+ };
+ struct tracecmd_compression;
+ struct tracecmd_compression_proto {
+@@ -569,7 +569,7 @@ int tracecmd_compress_buffer_read(struct tracecmd_compression *handle, char *dst
+ int tracecmd_compress_pread(struct tracecmd_compression *handle, char *dst, int len, off_t offset);
+ int tracecmd_compress_buffer_write(struct tracecmd_compression *handle,
+ 				   const void *data, unsigned long long size);
+-off64_t tracecmd_compress_lseek(struct tracecmd_compression *handle, off64_t offset, int whence);
++off_t tracecmd_compress_lseek(struct tracecmd_compression *handle, off_t offset, int whence);
+ int tracecmd_compress_proto_get_name(struct tracecmd_compression *compress,
+ 				     const char **name, const char **version);
+ bool tracecmd_compress_is_supported(const char *name, const char *version);
+diff --git a/lib/trace-cmd/include/trace-cmd-local.h b/lib/trace-cmd/include/trace-cmd-local.h
+index db0b2c21..ebd6f152 100644
+--- a/lib/trace-cmd/include/trace-cmd-local.h
++++ b/lib/trace-cmd/include/trace-cmd-local.h
+@@ -94,13 +94,13 @@ out_add_buffer_option(struct tracecmd_output *handle, const char *name,
+ struct cpu_data_source {
+ 	int fd;
+ 	int size;
+-	off64_t offset;
++	off_t offset;
+ };
+ 
+ int out_write_cpu_data(struct tracecmd_output *handle, int cpus,
+ 		       struct cpu_data_source *data, const char *buff_name);
+ int out_write_emty_cpu_data(struct tracecmd_output *handle, int cpus);
+-off64_t msg_lseek(struct tracecmd_msg_handle *msg_handle, off64_t offset, int whence);
++off_t msg_lseek(struct tracecmd_msg_handle *msg_handle, off_t offset, int whence);
+ unsigned long long get_last_option_offset(struct tracecmd_input *handle);
+ unsigned int get_meta_strings_size(struct tracecmd_input *handle);
+ int trace_append_options(struct tracecmd_output *handle, void *buf, size_t len);
+diff --git a/lib/trace-cmd/trace-compress.c b/lib/trace-cmd/trace-compress.c
+index 461de8d0..1b852f18 100644
+--- a/lib/trace-cmd/trace-compress.c
++++ b/lib/trace-cmd/trace-compress.c
+@@ -117,12 +117,12 @@ static inline int buffer_extend(struct tracecmd_compression *handle, unsigned in
+  *
+  * Returns the new file pointer on success, or -1 in case of an error.
+  */
+-off64_t tracecmd_compress_lseek(struct tracecmd_compression *handle, off64_t offset, int whence)
++off_t tracecmd_compress_lseek(struct tracecmd_compression *handle, off_t offset, int whence)
+ {
+ 	unsigned long p;
+ 
+ 	if (!handle || !handle->buffer)
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 
+ 	switch (whence) {
+ 	case SEEK_CUR:
+@@ -135,11 +135,11 @@ off64_t tracecmd_compress_lseek(struct tracecmd_compression *handle, off64_t off
+ 		p = offset;
+ 		break;
+ 	default:
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 	}
+ 
+ 	if (buffer_extend(handle, p))
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 
+ 	handle->pointer = p;
+ 
+@@ -678,7 +678,7 @@ int tracecmd_compress_copy_from(struct tracecmd_compression *handle, int fd, int
+ 	unsigned int size;
+ 	unsigned int all;
+ 	unsigned int r;
+-	off64_t offset;
++	off_t offset;
+ 	char *buf_from;
+ 	char *buf_to;
+ 	int endian4;
+@@ -700,7 +700,7 @@ int tracecmd_compress_copy_from(struct tracecmd_compression *handle, int fd, int
+ 		return -1;
+ 
+ 	/* save the initial offset and write 0 as initial chunk count */
+-	offset = lseek64(handle->fd, 0, SEEK_CUR);
++	offset = lseek(handle->fd, 0, SEEK_CUR);
+ 	write_fd(handle->fd, &chunks, 4);
+ 
+ 	do {
+@@ -760,13 +760,13 @@ int tracecmd_compress_copy_from(struct tracecmd_compression *handle, int fd, int
+ 	if (all)
+ 		return -1;
+ 
+-	if (lseek64(handle->fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	endian4 = tep_read_number(handle->tep, &chunks, 4);
+ 	/* write chunks count*/
+ 	write_fd(handle->fd, &chunks, 4);
+-	if (lseek64(handle->fd, 0, SEEK_END) == (off_t)-1)
++	if (lseek(handle->fd, 0, SEEK_END) == (off_t)-1)
+ 		return -1;
+ 
+ 	if (read_size)
+@@ -796,7 +796,7 @@ int tracecmd_load_chunks_info(struct tracecmd_compression *handle,
+ 	struct tracecmd_compress_chunk *chunks = NULL;
+ 	unsigned long long size = 0;
+ 	unsigned int count = 0;
+-	off64_t offset;
++	off_t offset;
+ 	int ret = -1;
+ 	char buf[4];
+ 	int i;
+@@ -804,8 +804,8 @@ int tracecmd_load_chunks_info(struct tracecmd_compression *handle,
+ 	if (!handle)
+ 		return -1;
+ 
+-	offset = lseek64(handle->fd, 0, SEEK_CUR);
+-	if (offset == (off64_t)-1)
++	offset = lseek(handle->fd, 0, SEEK_CUR);
++	if (offset == (off_t)-1)
+ 		return -1;
+ 
+ 	if (read(handle->fd, buf, 4) != 4)
+@@ -822,7 +822,7 @@ int tracecmd_load_chunks_info(struct tracecmd_compression *handle,
+ 		goto out;
+ 
+ 	for (i = 0; i < count; i++) {
+-		chunks[i].zoffset = lseek64(handle->fd, 0, SEEK_CUR);
++		chunks[i].zoffset = lseek(handle->fd, 0, SEEK_CUR);
+ 		if (chunks[i].zoffset == (off_t)-1)
+ 			goto out;
+ 		if (read(handle->fd, buf, 4) != 4)
+@@ -833,13 +833,13 @@ int tracecmd_load_chunks_info(struct tracecmd_compression *handle,
+ 			goto out;
+ 		chunks[i].size = tep_read_number(handle->tep, buf, 4);
+ 		size += chunks[i].size;
+-		if (lseek64(handle->fd, chunks[i].zsize, SEEK_CUR) == (off64_t)-1)
++		if (lseek(handle->fd, chunks[i].zsize, SEEK_CUR) == (off_t)-1)
+ 			goto out;
+ 	}
+ 
+ 	ret = count;
+ out:
+-	if (lseek64(handle->fd, offset, SEEK_SET) == (off64_t)-1)
++	if (lseek(handle->fd, offset, SEEK_SET) == (off_t)-1)
+ 		ret = -1;
+ 
+ 	if (ret > 0 && chunks_info)
+@@ -872,7 +872,7 @@ int tracecmd_uncompress_chunk(struct tracecmd_compression *handle,
+ 	if (!handle || !handle->proto || !handle->proto->uncompress_block || !chunk || !data)
+ 		return -1;
+ 
+-	if (lseek64(handle->fd, chunk->zoffset + 8, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, chunk->zoffset + 8, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	bytes_in = malloc(chunk->zsize);
+diff --git a/lib/trace-cmd/trace-input.c b/lib/trace-cmd/trace-input.c
+index 594eb74a..9b128403 100644
+--- a/lib/trace-cmd/trace-input.c
++++ b/lib/trace-cmd/trace-input.c
+@@ -37,8 +37,8 @@ static int force_read = 0;
+ 
+ struct page_map {
+ 	struct list_head	list;
+-	off64_t			offset;
+-	off64_t			size;
++	off_t			offset;
++	off_t			size;
+ 	void			*map;
+ 	int			ref_count;
+ };
+@@ -54,7 +54,7 @@ struct follow_event {
+ 
+ struct page {
+ 	struct list_head	list;
+-	off64_t			offset;
++	off_t			offset;
+ 	struct tracecmd_input	*handle;
+ 	struct page_map		*page_map;
+ 	void			*map;
+@@ -541,7 +541,7 @@ static struct file_section *section_open(struct tracecmd_input *handle, int id)
+ 	if (!sec)
+ 		return NULL;
+ 
+-	if (lseek64(handle->fd, sec->data_offset, SEEK_SET) == (off64_t)-1)
++	if (lseek(handle->fd, sec->data_offset, SEEK_SET) == (off_t)-1)
+ 		return NULL;
+ 
+ 	if ((sec->flags & TRACECMD_SEC_FL_COMPRESS) && in_uncompress_block(handle))
+@@ -593,7 +593,7 @@ static int read_header_files(struct tracecmd_input *handle)
+ 
+ 	if (!HAS_SECTIONS(handle))
+ 		section_add_or_update(handle, TRACECMD_OPTION_HEADER_INFO, 0, 0,
+-				      lseek64(handle->fd, 0, SEEK_CUR));
++				      lseek(handle->fd, 0, SEEK_CUR));
+ 
+ 	if (do_read_check(handle, buf, 12))
+ 		return -1;
+@@ -800,7 +800,7 @@ static int read_ftrace_files(struct tracecmd_input *handle, const char *regex)
+ 
+ 	if (!HAS_SECTIONS(handle))
+ 		section_add_or_update(handle, TRACECMD_OPTION_FTRACE_EVENTS, 0, 0,
+-				      lseek64(handle->fd, 0, SEEK_CUR));
++				      lseek(handle->fd, 0, SEEK_CUR));
+ 
+ 	if (regex) {
+ 		sreg = &spreg;
+@@ -875,7 +875,7 @@ static int read_event_files(struct tracecmd_input *handle, const char *regex)
+ 
+ 	if (!HAS_SECTIONS(handle))
+ 		section_add_or_update(handle, TRACECMD_OPTION_EVENT_FORMATS, 0, 0,
+-				      lseek64(handle->fd, 0, SEEK_CUR));
++				      lseek(handle->fd, 0, SEEK_CUR));
+ 
+ 	if (regex) {
+ 		sreg = &spreg;
+@@ -962,7 +962,7 @@ static int read_proc_kallsyms(struct tracecmd_input *handle)
+ 		return 0;
+ 	if (!HAS_SECTIONS(handle))
+ 		section_add_or_update(handle, TRACECMD_OPTION_KALLSYMS, 0, 0,
+-				      lseek64(handle->fd, 0, SEEK_CUR));
++				      lseek(handle->fd, 0, SEEK_CUR));
+ 
+ 	if (read4(handle, &size) < 0)
+ 		return -1;
+@@ -999,7 +999,7 @@ static int read_ftrace_printk(struct tracecmd_input *handle)
+ 
+ 	if (!HAS_SECTIONS(handle))
+ 		section_add_or_update(handle, TRACECMD_OPTION_PRINTK, 0, 0,
+-				      lseek64(handle->fd, 0, SEEK_CUR));
++				      lseek(handle->fd, 0, SEEK_CUR));
+ 
+ 	if (read4(handle, &size) < 0)
+ 		return -1;
+@@ -1173,7 +1173,7 @@ static int handle_section(struct tracecmd_input *handle, struct file_section *se
+ 	unsigned long long size;
+ 	int ret;
+ 
+-	if (lseek64(handle->fd, section->section_offset, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, section->section_offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 	if (read_section_header(handle, &id, &flags, &size, NULL))
+ 		return -1;
+@@ -1181,7 +1181,7 @@ static int handle_section(struct tracecmd_input *handle, struct file_section *se
+ 	if (id != section->id)
+ 		return -1;
+ 
+-	section->data_offset = lseek64(handle->fd, 0, SEEK_CUR);
++	section->data_offset = lseek(handle->fd, 0, SEEK_CUR);
+ 	if ((section->flags & TRACECMD_SEC_FL_COMPRESS) && in_uncompress_block(handle))
+ 		return -1;
+ 
+@@ -1225,7 +1225,7 @@ static int read_headers(struct tracecmd_input *handle, const char *regex)
+ 	if (!handle->options_start)
+ 		return -1;
+ 
+-	if (lseek64(handle->fd, handle->options_start, SEEK_SET) == (off64_t)-1) {
++	if (lseek(handle->fd, handle->options_start, SEEK_SET) == (off_t)-1) {
+ 		tracecmd_warning("Filed to goto options offset %lld", handle->options_start);
+ 		return -1;
+ 	}
+@@ -1269,11 +1269,11 @@ static unsigned long long calc_page_offset(struct tracecmd_input *handle,
+ 	return offset & ~(handle->page_size - 1);
+ }
+ 
+-static int read_page(struct tracecmd_input *handle, off64_t offset,
++static int read_page(struct tracecmd_input *handle, off_t offset,
+ 		     int cpu, void *map)
+ {
+-	off64_t save_seek;
+-	off64_t ret;
++	off_t save_seek;
++	off_t ret;
+ 
+ 	if (handle->use_pipe) {
+ 		ret = read(handle->cpu_data[cpu].pipe_fd, map, handle->page_size);
+@@ -1291,9 +1291,9 @@ static int read_page(struct tracecmd_input *handle, off64_t offset,
+ 	}
+ 
+ 	/* other parts of the code may expect the pointer to not move */
+-	save_seek = lseek64(handle->fd, 0, SEEK_CUR);
++	save_seek = lseek(handle->fd, 0, SEEK_CUR);
+ 
+-	ret = lseek64(handle->fd, offset, SEEK_SET);
++	ret = lseek(handle->fd, offset, SEEK_SET);
+ 	if (ret < 0)
+ 		return -1;
+ 	ret = read(handle->fd, map, handle->page_size);
+@@ -1301,7 +1301,7 @@ static int read_page(struct tracecmd_input *handle, off64_t offset,
+ 		return -1;
+ 
+ 	/* reset the file pointer back */
+-	lseek64(handle->fd, save_seek, SEEK_SET);
++	lseek(handle->fd, save_seek, SEEK_SET);
+ 
+ 	return 0;
+ }
+@@ -1348,7 +1348,7 @@ static int chunk_cmp(const void *A, const void *B)
+ 	return 1;
+ }
+ 
+-static struct tracecmd_compress_chunk *get_zchunk(struct cpu_data *cpu, off64_t offset)
++static struct tracecmd_compress_chunk *get_zchunk(struct cpu_data *cpu, off_t offset)
+ {
+ 	struct cpu_zdata *cpuz = &cpu->compress;
+ 	struct tracecmd_compress_chunk *chunk;
+@@ -1398,7 +1398,7 @@ found:
+ 	free(cache);
+ }
+ 
+-static void *read_zpage(struct tracecmd_input *handle, int cpu, off64_t offset)
++static void *read_zpage(struct tracecmd_input *handle, int cpu, off_t offset)
+ {
+ 	struct cpu_data *cpu_data = &handle->cpu_data[cpu];
+ 	struct tracecmd_compress_chunk *chunk;
+@@ -1448,12 +1448,12 @@ error:
+ }
+ 
+ static void *allocate_page_map(struct tracecmd_input *handle,
+-			       struct page *page, int cpu, off64_t offset)
++			       struct page *page, int cpu, off_t offset)
+ {
+ 	struct cpu_data *cpu_data = &handle->cpu_data[cpu];
+ 	struct page_map *page_map;
+-	off64_t map_size;
+-	off64_t map_offset;
++	off_t map_size;
++	off_t map_offset;
+ 	void *map;
+ 	int ret;
+ 	int fd;
+@@ -1544,7 +1544,7 @@ static void *allocate_page_map(struct tracecmd_input *handle,
+ }
+ 
+ static struct page *allocate_page(struct tracecmd_input *handle,
+-				  int cpu, off64_t offset)
++				  int cpu, off_t offset)
+ {
+ 	struct cpu_data *cpu_data = &handle->cpu_data[cpu];
+ 	struct page **pages;
+@@ -1851,7 +1851,7 @@ static int update_page_info(struct tracecmd_input *handle, int cpu)
+  *        -1 on error
+  */
+ static int get_page(struct tracecmd_input *handle, int cpu,
+-		    off64_t offset)
++		    off_t offset)
+ {
+ 	/* Don't map if the page is already where we want */
+ 	if (handle->cpu_data[cpu].offset == offset &&
+@@ -1895,7 +1895,7 @@ static int get_page(struct tracecmd_input *handle, int cpu,
+ 
+ static int get_next_page(struct tracecmd_input *handle, int cpu)
+ {
+-	off64_t offset;
++	off_t offset;
+ 
+ 	if (!handle->cpu_data[cpu].page && !handle->use_pipe)
+ 		return 0;
+@@ -2122,7 +2122,7 @@ struct tep_record *
+ tracecmd_read_cpu_last(struct tracecmd_input *handle, int cpu)
+ {
+ 	struct tep_record *record = NULL;
+-	off64_t offset, page_offset;
++	off_t offset, page_offset;
+ 
+ 	offset = handle->cpu_data[cpu].file_offset +
+ 		handle->cpu_data[cpu].file_size;
+@@ -2183,7 +2183,7 @@ tracecmd_set_cpu_to_timestamp(struct tracecmd_input *handle, int cpu,
+ 			      unsigned long long ts)
+ {
+ 	struct cpu_data *cpu_data = &handle->cpu_data[cpu];
+-	off64_t start, end, next;
++	off_t start, end, next;
+ 
+ 	if (cpu < 0 || cpu >= handle->cpus) {
+ 		errno = -EINVAL;
+@@ -3064,11 +3064,11 @@ static int init_cpu_zfile(struct tracecmd_input *handle, int cpu)
+ {
+ 	struct cpu_data *cpu_data;
+ 	unsigned long long size;
+-	off64_t offset;
++	off_t offset;
+ 
+ 	cpu_data = &handle->cpu_data[cpu];
+-	offset = lseek64(handle->fd, 0, SEEK_CUR);
+-	if (lseek64(handle->fd, cpu_data->file_offset, SEEK_SET) == (off_t)-1)
++	offset = lseek(handle->fd, 0, SEEK_CUR);
++	if (lseek(handle->fd, cpu_data->file_offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	strcpy(cpu_data->compress.file, COMPR_TEMP_FILE);
+@@ -3079,7 +3079,7 @@ static int init_cpu_zfile(struct tracecmd_input *handle, int cpu)
+ 	if (tracecmd_uncompress_copy_to(handle->compress, cpu_data->compress.fd, NULL, &size))
+ 		return -1;
+ 
+-	if (lseek64(handle->fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	cpu_data->file_offset = handle->next_offset;
+@@ -3098,7 +3098,7 @@ static int init_cpu_zpage(struct tracecmd_input *handle, int cpu)
+ 	int count;
+ 	int i;
+ 
+-	if (lseek64(handle->fd, cpu_data->file_offset, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, cpu_data->file_offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	count = tracecmd_load_chunks_info(handle->compress, &cpu_data->compress.chunks);
+@@ -3576,7 +3576,7 @@ static int handle_option_done(struct tracecmd_input *handle, char *buf, int size
+ 	if (size < 8)
+ 		return -1;
+ 
+-	offset = lseek64(handle->fd, 0, SEEK_CUR);
++	offset = lseek(handle->fd, 0, SEEK_CUR);
+ 	if (offset >= size)
+ 		handle->options_last_offset = offset - size;
+ 
+@@ -3584,7 +3584,7 @@ static int handle_option_done(struct tracecmd_input *handle, char *buf, int size
+ 	if (!offset)
+ 		return 0;
+ 
+-	if (lseek64(handle->fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	return handle_options(handle);
+@@ -3741,7 +3741,7 @@ static int handle_options(struct tracecmd_input *handle)
+ 	int ret;
+ 
+ 	if (!HAS_SECTIONS(handle)) {
+-		handle->options_start = lseek64(handle->fd, 0, SEEK_CUR);
++		handle->options_start = lseek(handle->fd, 0, SEEK_CUR);
+ 	} else {
+ 		if (read_section_header(handle, &id, &flags, NULL, NULL))
+ 			return -1;
+@@ -4102,7 +4102,7 @@ int init_latency_data(struct tracecmd_input *handle)
+ 		if (ret)
+ 			return -1;
+ 
+-		lseek64(handle->latz.fd, 0, SEEK_SET);
++		lseek(handle->latz.fd, 0, SEEK_SET);
+ 	}
+ 
+ 	return 0;
+@@ -4118,7 +4118,7 @@ static int init_buffer_cpu_data(struct tracecmd_input *handle, struct input_buff
+ 	if (handle->cpu_data)
+ 		return -1;
+ 
+-	if (lseek64(handle->fd, buffer->offset, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, buffer->offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 	if (read_section_header(handle, &id, &flags, NULL, NULL))
+ 		return -1;
+@@ -4246,7 +4246,7 @@ static int read_and_parse_cmdlines(struct tracecmd_input *handle)
+ 
+ 	if (!HAS_SECTIONS(handle))
+ 		section_add_or_update(handle, TRACECMD_OPTION_CMDLINES, 0, 0,
+-				      lseek64(handle->fd, 0, SEEK_CUR));
++				      lseek(handle->fd, 0, SEEK_CUR));
+ 
+ 
+ 	if (read_data_and_size(handle, &cmdlines, &size) < 0)
+@@ -4554,9 +4554,9 @@ static int read_metadata_strings(struct tracecmd_input *handle)
+ 	unsigned short id;
+ 	unsigned int csize, rsize;
+ 	unsigned long long size;
+-	off64_t offset;
++	off_t offset;
+ 
+-	offset = lseek64(handle->fd, 0, SEEK_CUR);
++	offset = lseek(handle->fd, 0, SEEK_CUR);
+ 	do {
+ 		if (read_section_header(handle, &id, &flags, &size, NULL))
+ 			break;
+@@ -4575,12 +4575,12 @@ static int read_metadata_strings(struct tracecmd_input *handle)
+ 			if (flags & TRACECMD_SEC_FL_COMPRESS)
+ 				in_uncompress_reset(handle);
+ 		} else {
+-			if (lseek64(handle->fd, size, SEEK_CUR) == (off_t)-1)
++			if (lseek(handle->fd, size, SEEK_CUR) == (off_t)-1)
+ 				break;
+ 		}
+ 	} while (1);
+ 
+-	if (lseek64(handle->fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(handle->fd, offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	return found ? 0 : -1;
+@@ -4683,9 +4683,9 @@ struct tracecmd_input *tracecmd_alloc_fd(int fd, int flags)
+ 	handle->page_size = page_size;
+ 	handle->next_offset = page_size;
+ 
+-	offset = lseek64(handle->fd, 0, SEEK_CUR);
+-	handle->total_file_size = lseek64(handle->fd, 0, SEEK_END);
+-	lseek64(handle->fd, offset, SEEK_SET);
++	offset = lseek(handle->fd, 0, SEEK_CUR);
++	handle->total_file_size = lseek(handle->fd, 0, SEEK_END);
++	lseek(handle->fd, offset, SEEK_SET);
+ 
+ 	if (HAS_COMPRESSION(handle)) {
+ 		zname = read_string(handle);
+@@ -5533,7 +5533,7 @@ static int copy_options_recursive(struct tracecmd_input *in_handle,
+ 			if (!next)
+ 				break;
+ 
+-			if (do_lseek(in_handle, next, SEEK_SET) == (off64_t)-1)
++			if (do_lseek(in_handle, next, SEEK_SET) == (off_t)-1)
+ 				return -1;
+ 
+ 			if (read_section_header(in_handle, &id, &flags, NULL, NULL))
+@@ -5648,7 +5648,7 @@ int tracecmd_copy_options(struct tracecmd_input *in_handle,
+ 	if (!in_handle->options_start)
+ 		return 0;
+ 
+-	if (lseek64(in_handle->fd, in_handle->options_start, SEEK_SET) == (off64_t)-1)
++	if (lseek(in_handle->fd, in_handle->options_start, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	if (copy_options(in_handle, out_handle) < 0)
+@@ -5980,10 +5980,10 @@ tracecmd_buffer_instance_handle(struct tracecmd_input *handle, int indx)
+ 	new_handle->pid_maps = NULL;
+ 	if (!HAS_SECTIONS(handle)) {
+ 		/* Save where we currently are */
+-		offset = lseek64(handle->fd, 0, SEEK_CUR);
++		offset = lseek(handle->fd, 0, SEEK_CUR);
+ 
+-		ret = lseek64(handle->fd, buffer->offset, SEEK_SET);
+-		if (ret == (off64_t)-1) {
++		ret = lseek(handle->fd, buffer->offset, SEEK_SET);
++		if (ret == (off_t)-1) {
+ 			tracecmd_warning("could not seek to buffer %s offset %ld",
+ 					  buffer->name, buffer->offset);
+ 			goto error;
+@@ -6001,7 +6001,7 @@ tracecmd_buffer_instance_handle(struct tracecmd_input *handle, int indx)
+ 			tracecmd_warning("failed to read sub buffer %s", buffer->name);
+ 			goto error;
+ 		}
+-		ret = lseek64(handle->fd, offset, SEEK_SET);
++		ret = lseek(handle->fd, offset, SEEK_SET);
+ 		if (ret < 0) {
+ 			tracecmd_warning("could not seek to back to offset %ld", offset);
+ 			goto error;
+@@ -6171,13 +6171,13 @@ const char *tracecmd_get_version(struct tracecmd_input *handle)
+  *
+  * Provides a method to extract the cpu file size saved in @handle.
+  *
+- * Returns the cpu file size saved in trace.dat file or (off64_t)-1 for
++ * Returns the cpu file size saved in trace.dat file or (off_t)-1 for
+  * invalid cpu index.
+  */
+-off64_t tracecmd_get_cpu_file_size(struct tracecmd_input *handle, int cpu)
++off_t tracecmd_get_cpu_file_size(struct tracecmd_input *handle, int cpu)
+ {
+ 	if (cpu < 0 || cpu >= handle->cpus)
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 	return handle->cpu_data[cpu].file_size;
+ }
+ 
+diff --git a/lib/trace-cmd/trace-msg.c b/lib/trace-cmd/trace-msg.c
+index 0b2de710..3a555c36 100644
+--- a/lib/trace-cmd/trace-msg.c
++++ b/lib/trace-cmd/trace-msg.c
+@@ -183,26 +183,26 @@ static int __msg_write(int fd, struct tracecmd_msg *msg, bool network)
+ 	return __do_write_check(fd, msg->buf, data_size);
+ }
+ 
+-__hidden off64_t msg_lseek(struct tracecmd_msg_handle *msg_handle, off64_t offset, int whence)
++__hidden off_t msg_lseek(struct tracecmd_msg_handle *msg_handle, off_t offset, int whence)
+ {
+-	off64_t cache_offset = msg_handle->cache_start_offset;
+-	off64_t ret;
++	off_t cache_offset = msg_handle->cache_start_offset;
++	off_t ret;
+ 
+ 	/*
+ 	 * lseek works only if the handle is in cache mode,
+ 	 * cannot seek on a network socket
+ 	 */
+ 	if (!msg_handle->cache || msg_handle->cfd < 0)
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 
+ 	if (whence == SEEK_SET) {
+ 		if (offset < cache_offset)
+-			return (off64_t)-1;
++			return (off_t)-1;
+ 		offset -= cache_offset;
+ 	}
+ 
+-	ret = lseek64(msg_handle->cfd, offset, whence);
+-	if (ret == (off64_t)-1)
++	ret = lseek(msg_handle->cfd, offset, whence);
++	if (ret == (off_t)-1)
+ 		return ret;
+ 
+ 	return ret + cache_offset;
+@@ -639,7 +639,7 @@ static int flush_cache(struct tracecmd_msg_handle *msg_handle)
+ 	if (!msg_handle->cache || fd < 0)
+ 		return 0;
+ 	msg_handle->cache = false;
+-	if (lseek64(fd, 0, SEEK_SET) == (off64_t)-1)
++	if (lseek(fd, 0, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 	do {
+ 		ret = read(fd, buf, MSG_MAX_DATA_LEN);
+@@ -650,8 +650,8 @@ static int flush_cache(struct tracecmd_msg_handle *msg_handle)
+ 			break;
+ 	} while (ret >= 0);
+ 
+-	msg_handle->cache_start_offset = lseek64(fd, 0, SEEK_CUR);
+-	if (msg_handle->cache_start_offset == (off64_t)-1)
++	msg_handle->cache_start_offset = lseek(fd, 0, SEEK_CUR);
++	if (msg_handle->cache_start_offset == (off_t)-1)
+ 		return -1;
+ 
+ 	close(fd);
+diff --git a/lib/trace-cmd/trace-output.c b/lib/trace-cmd/trace-output.c
+index bdec75d6..37bb3ec0 100644
+--- a/lib/trace-cmd/trace-output.c
++++ b/lib/trace-cmd/trace-output.c
+@@ -112,7 +112,7 @@ do_write_check(struct tracecmd_output *handle, const void *data, long long size)
+ 	return __do_write_check(handle->fd, data, size);
+ }
+ 
+-static inline off64_t do_lseek(struct tracecmd_output *handle, off_t offset, int whence)
++static inline off_t do_lseek(struct tracecmd_output *handle, off_t offset, int whence)
+ {
+ 	if (handle->do_compress)
+ 		return tracecmd_compress_lseek(handle->compress, offset, whence);
+@@ -120,7 +120,7 @@ static inline off64_t do_lseek(struct tracecmd_output *handle, off_t offset, int
+ 	if (handle->msg_handle)
+ 		return msg_lseek(handle->msg_handle, offset, whence);
+ 
+-	return lseek64(handle->fd, offset, whence);
++	return lseek(handle->fd, offset, whence);
+ }
+ 
+ static inline int do_preed(struct tracecmd_output *handle, void *dst, int len, off_t offset)
+@@ -518,12 +518,12 @@ out_write_section_header(struct tracecmd_output *handle, unsigned short header_i
+ 	/* Section ID */
+ 	endian2 = convert_endian_2(handle, header_id);
+ 	if (do_write_check(handle, &endian2, 2))
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 
+ 	/* Section flags */
+ 	endian2 = convert_endian_2(handle, flags);
+ 	if (do_write_check(handle, &endian2, 2))
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 
+ 	/* Section description */
+ 	if (description)
+@@ -532,13 +532,13 @@ out_write_section_header(struct tracecmd_output *handle, unsigned short header_i
+ 		desc = -1;
+ 	endian4 = convert_endian_4(handle, desc);
+ 	if (do_write_check(handle, &endian4, 4))
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 
+ 	offset = do_lseek(handle, 0, SEEK_CUR);
+ 	size = 0;
+ 	/* Reserve for section size */
+ 	if (do_write_check(handle, &size, 8))
+-		return (off64_t)-1;
++		return (off_t)-1;
+ 	return offset;
+ }
+ 
+@@ -559,13 +559,13 @@ __hidden int out_update_section_header(struct tracecmd_output *handle, tsize_t o
+ 	if (size < 8)
+ 		return -1;
+ 	size -= 8;
+-	if (do_lseek(handle, offset, SEEK_SET) == (off64_t)-1)
++	if (do_lseek(handle, offset, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 
+ 	endian8 = convert_endian_8(handle, size);
+ 	if (do_write_check(handle, &endian8, 8))
+ 		return -1;
+-	if (do_lseek(handle, current, SEEK_SET) == (off64_t)-1)
++	if (do_lseek(handle, current, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 	return 0;
+ }
+@@ -587,7 +587,7 @@ static int save_string_section(struct tracecmd_output *handle, bool compress)
+ 	if (compress)
+ 		flags |= TRACECMD_SEC_FL_COMPRESS;
+ 	offset = out_write_section_header(handle, TRACECMD_OPTION_STRINGS, "strings", flags, false);
+-	if (offset == (off64_t)-1)
++	if (offset == (off_t)-1)
+ 		return -1;
+ 
+ 	out_compression_start(handle, compress);
+@@ -637,7 +637,7 @@ static int read_header_files(struct tracecmd_output *handle, bool compress)
+ 		flags |= TRACECMD_SEC_FL_COMPRESS;
+ 	offset = out_write_section_header(handle, TRACECMD_OPTION_HEADER_INFO,
+ 					  "headers", flags, true);
+-	if (offset == (off64_t)-1)
++	if (offset == (off_t)-1)
+ 		return -1;
+ 
+ 	out_compression_start(handle, compress);
+@@ -965,7 +965,7 @@ static int read_ftrace_files(struct tracecmd_output *handle, bool compress)
+ 		flags |= TRACECMD_SEC_FL_COMPRESS;
+ 	offset = out_write_section_header(handle, TRACECMD_OPTION_FTRACE_EVENTS,
+ 					  "ftrace events", flags, true);
+-	if (offset == (off64_t)-1)
++	if (offset == (off_t)-1)
+ 		return -1;
+ 
+ 	create_event_list_item(handle, &systems, &list);
+@@ -1024,7 +1024,7 @@ static int read_event_files(struct tracecmd_output *handle,
+ 		flags |= TRACECMD_SEC_FL_COMPRESS;
+ 	offset = out_write_section_header(handle, TRACECMD_OPTION_EVENT_FORMATS,
+ 					  "events format", flags, true);
+-	if (offset == (off64_t)-1)
++	if (offset == (off_t)-1)
+ 		return -1;
+ 	/*
+ 	 * If any of the list is the special keyword "all" then
+@@ -1138,7 +1138,7 @@ static int read_proc_kallsyms(struct tracecmd_output *handle, bool compress)
+ 		flags |= TRACECMD_SEC_FL_COMPRESS;
+ 	offset = out_write_section_header(handle, TRACECMD_OPTION_KALLSYMS,
+ 					  "kallsyms", flags, true);
+-	if (offset == (off64_t)-1)
++	if (offset == (off_t)-1)
+ 		return -1;
+ 
+ 	out_compression_start(handle, compress);
+@@ -1202,7 +1202,7 @@ static int read_ftrace_printk(struct tracecmd_output *handle, bool compress)
+ 	if (compress)
+ 		flags |= TRACECMD_SEC_FL_COMPRESS;
+ 	offset = out_write_section_header(handle, TRACECMD_OPTION_PRINTK, "printk", flags, true);
+-	if (offset == (off64_t)-1)
++	if (offset == (off_t)-1)
+ 		return -1;
+ 
+ 	out_compression_start(handle, compress);
+@@ -1247,8 +1247,8 @@ static int save_tracing_file_data(struct tracecmd_output *handle,
+ 	unsigned long long endian8;
+ 	char *file = NULL;
+ 	struct stat st;
+-	off64_t check_size;
+-	off64_t size;
++	off_t check_size;
++	off_t size;
+ 	int ret = -1;
+ 
+ 	file = get_tracing_file(handle, filename);
+@@ -1842,9 +1842,9 @@ static int write_options_v6(struct tracecmd_output *handle)
+ 	return 0;
+ }
+ 
+-static int update_options_start(struct tracecmd_output *handle, off64_t offset)
++static int update_options_start(struct tracecmd_output *handle, off_t offset)
+ {
+-	if (do_lseek(handle, handle->options_start, SEEK_SET) == (off64_t)-1)
++	if (do_lseek(handle, handle->options_start, SEEK_SET) == (off_t)-1)
+ 		return -1;
+ 	offset = convert_endian_8(handle, offset);
+ 	if (do_write_check(handle, &offset, 8))
+@@ -1867,7 +1867,7 @@ static int update_options_start(struct tracecmd_output *handle, off64_t offset)
+  *
+  * Returns zero on success and -1 on error.
+  */
+-int tracecmd_prepare_options(struct tracecmd_output *handle, off64_t offset, int whence)
++int tracecmd_prepare_options(struct tracecmd_output *handle, off_t offset, int whence)
+ {
+ 	tsize_t curr;
+ 	int ret;
+@@ -1887,7 +1887,7 @@ int tracecmd_prepare_options(struct tracecmd_output *handle, off64_t offset, int
+ 		break;
+ 	case SEEK_END:
+ 		offset = do_lseek(handle, offset, SEEK_END);
+-		if (offset == (off64_t)-1)
++		if (offset == (off_t)-1)
+ 			return -1;
+ 		break;
+ 	}
+@@ -2059,7 +2059,7 @@ __hidden void *trace_get_options(struct tracecmd_output *handle, size_t *len)
+ 	if (!buf)
+ 		goto out;
+ 
+-	if (do_lseek(&out_handle, 0, SEEK_SET) == (off64_t)-1)
++	if (do_lseek(&out_handle, 0, SEEK_SET) == (off_t)-1)
+ 		goto out;
+ 	*len = read(msg_handle.cfd, buf, offset);
+ 	if (*len != offset) {
+@@ -2270,7 +2270,7 @@ int tracecmd_write_cmdlines(struct tracecmd_output *handle)
+ 		flags |= TRACECMD_SEC_FL_COMPRESS;
+ 	offset = out_write_section_header(handle, TRACECMD_OPTION_CMDLINES,
+ 					  "command lines", flags, true);
+-	if (offset == (off64_t)-1)
++	if (offset == (off_t)-1)
+ 		return -1;
+ 
+ 	out_compression_start(handle, compress);
+@@ -2519,7 +2519,7 @@ static int update_buffer_cpu_offset_v6(struct tracecmd_output *handle,
+ 	current = do_lseek(handle, 0, SEEK_CUR);
+ 
+ 	/* Go to the option data, where will write the offest */
+-	if (do_lseek(handle, b_offset, SEEK_SET) == (off64_t)-1) {
++	if (do_lseek(handle, b_offset, SEEK_SET) == (off_t)-1) {
+ 		tracecmd_warning("could not seek to %lld", b_offset);
+ 		return -1;
+ 	}
+@@ -2528,7 +2528,7 @@ static int update_buffer_cpu_offset_v6(struct tracecmd_output *handle,
+ 		return -1;
+ 
+ 	/* Go back to end of file */
+-	if (do_lseek(handle, current, SEEK_SET) == (off64_t)-1) {
++	if (do_lseek(handle, current, SEEK_SET) == (off_t)-1) {
+ 		tracecmd_warning("could not seek to %lld", offset);
+ 		return -1;
+ 	}
+@@ -2652,7 +2652,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+ 		data_files[i].data_offset &= ~(page_size - 1);
+ 
+ 		ret = do_lseek(handle, data_files[i].data_offset, SEEK_SET);
+-		if (ret == (off64_t)-1)
++		if (ret == (off_t)-1)
+ 			goto out_free;
+ 
+ 		if (!tracecmd_get_quiet(handle))
+@@ -2660,7 +2660,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+ 				i, (unsigned long long)data_files[i].data_offset);
+ 
+ 		if (data[i].size) {
+-			if (lseek64(data[i].fd, data[i].offset, SEEK_SET) == (off64_t)-1)
++			if (lseek(data[i].fd, data[i].offset, SEEK_SET) == (off_t)-1)
+ 				goto out_free;
+ 			read_size = out_copy_fd_compress(handle, data[i].fd,
+ 							 data[i].size, &data_files[i].write_size,
+@@ -2678,19 +2678,19 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+ 
+ 		if (!HAS_SECTIONS(handle)) {
+ 			/* Write the real CPU data offset in the file */
+-			if (do_lseek(handle, data_files[i].file_data_offset, SEEK_SET) == (off64_t)-1)
++			if (do_lseek(handle, data_files[i].file_data_offset, SEEK_SET) == (off_t)-1)
+ 				goto out_free;
+ 			endian8 = convert_endian_8(handle, data_files[i].data_offset);
+ 			if (do_write_check(handle, &endian8, 8))
+ 				goto out_free;
+ 			/* Write the real CPU data size in the file */
+-			if (do_lseek(handle, data_files[i].file_write_size, SEEK_SET) == (off64_t)-1)
++			if (do_lseek(handle, data_files[i].file_write_size, SEEK_SET) == (off_t)-1)
+ 				goto out_free;
+ 			endian8 = convert_endian_8(handle, data_files[i].write_size);
+ 			if (do_write_check(handle, &endian8, 8))
+ 				goto out_free;
+ 			offset = data_files[i].data_offset + data_files[i].write_size;
+-			if (do_lseek(handle, offset, SEEK_SET) == (off64_t)-1)
++			if (do_lseek(handle, offset, SEEK_SET) == (off_t)-1)
+ 				goto out_free;
+ 		}
+ 		if (!tracecmd_get_quiet(handle)) {
+@@ -2709,7 +2709,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+ 		goto out_free;
+ 
+ 	free(data_files);
+-	if (do_lseek(handle, 0, SEEK_END) == (off64_t)-1)
++	if (do_lseek(handle, 0, SEEK_END) == (off_t)-1)
+ 		return -1;
+ 
+ 	if (out_update_section_header(handle, offset))
+@@ -2978,7 +2978,7 @@ __hidden int out_save_options_offset(struct tracecmd_output *handle, unsigned lo
+ 			return -1;
+ 
+ 		new = do_lseek(handle, 0, SEEK_CUR);
+-		if (do_lseek(handle, handle->options_start, SEEK_SET) == (off64_t)-1)
++		if (do_lseek(handle, handle->options_start, SEEK_SET) == (off_t)-1)
+ 			return -1;
+ 
+ 		en8 = convert_endian_8(handle, start);
+@@ -2986,7 +2986,7 @@ __hidden int out_save_options_offset(struct tracecmd_output *handle, unsigned lo
+ 			return -1;
+ 
+ 		handle->options_start = new;
+-		if (do_lseek(handle, new, SEEK_SET) == (off64_t)-1)
++		if (do_lseek(handle, new, SEEK_SET) == (off_t)-1)
+ 			return -1;
+ 	} else {
+ 		handle->options_start = start;
+diff --git a/lib/trace-cmd/trace-recorder.c b/lib/trace-cmd/trace-recorder.c
+index f387091f..a5ac8be3 100644
+--- a/lib/trace-cmd/trace-recorder.c
++++ b/lib/trace-cmd/trace-recorder.c
+@@ -51,7 +51,7 @@ static int append_file(int size, int dst, int src)
+ 	char buf[size];
+ 	int r;
+ 
+-	lseek64(src, 0, SEEK_SET);
++	lseek(src, 0, SEEK_SET);
+ 
+ 	/* If there's an error, then we are pretty much screwed :-p */
+ 	do {
+@@ -82,10 +82,10 @@ void tracecmd_free_recorder(struct tracecmd_recorder *recorder)
+ 					  recorder->fd2, recorder->fd1);
+ 			/* Error on copying, then just keep fd1 */
+ 			if (ret) {
+-				lseek64(recorder->fd1, 0, SEEK_END);
++				lseek(recorder->fd1, 0, SEEK_END);
+ 				goto close;
+ 			}
+-			lseek64(recorder->fd1, 0, SEEK_SET);
++			lseek(recorder->fd1, 0, SEEK_SET);
+ 			ftruncate(recorder->fd1, 0);
+ 		}
+ 		append_file(recorder->page_size, recorder->fd1, recorder->fd2);
+@@ -305,7 +305,7 @@ static inline void update_fd(struct tracecmd_recorder *recorder, int size)
+ 		fd = recorder->fd1;
+ 
+ 	/* Zero out the new file we are writing to */
+-	lseek64(fd, 0, SEEK_SET);
++	lseek(fd, 0, SEEK_SET);
+ 	ftruncate(fd, 0);
+ 
+ 	recorder->fd = fd;
+diff --git a/tracecmd/trace-dump.c b/tracecmd/trace-dump.c
+index 22e3d871..11c1baf1 100644
+--- a/tracecmd/trace-dump.c
++++ b/tracecmd/trace-dump.c
+@@ -101,7 +101,7 @@ static int do_lseek(int fd, int offset, int whence)
+ 	if (read_compress)
+ 		return tracecmd_compress_lseek(compress, offset, whence);
+ 
+-	return lseek64(fd, offset, whence);
++	return lseek(fd, offset, whence);
+ }
+ 
+ static int read_file_string(int fd, char *dst, int len)
+@@ -446,7 +446,7 @@ static void dump_section_header(int fd, enum dump_items v, unsigned short *flags
+ 	const char *desc;
+ 	int desc_id;
+ 
+-	offset = lseek64(fd, 0, SEEK_CUR);
++	offset = lseek(fd, 0, SEEK_CUR);
+ 	if (read_file_number(fd, &id, 2))
+ 		die("cannot read the section id");
+ 
+@@ -500,13 +500,13 @@ static void dump_option_buffer(int fd, unsigned short option, int size)
+ 		return;
+ 	}
+ 
+-	current = lseek64(fd, 0, SEEK_CUR);
+-	if (lseek64(fd, offset, SEEK_SET) == (off_t)-1)
++	current = lseek(fd, 0, SEEK_CUR);
++	if (lseek(fd, offset, SEEK_SET) == (off_t)-1)
+ 		die("cannot goto buffer offset %lld", offset);
+ 
+ 	dump_section_header(fd, FLYRECORD, &flags);
+ 
+-	if (lseek64(fd, current, SEEK_SET) == (off_t)-1)
++	if (lseek(fd, current, SEEK_SET) == (off_t)-1)
+ 		die("cannot go back to buffer option");
+ 
+ 	do_print(OPTIONS|FLYRECORD, "\t\t[Option BUFFER, %d bytes]\n", size);
+@@ -773,7 +773,7 @@ static void dump_sections(int fd, int count)
+ 	unsigned short flags;
+ 
+ 	while (sec) {
+-		if (lseek64(fd, sec->offset, SEEK_SET) == (off_t)-1)
++		if (lseek(fd, sec->offset, SEEK_SET) == (off_t)-1)
+ 			die("cannot goto option offset %lld", sec->offset);
+ 
+ 		dump_section_header(fd, sec->verbosity, &flags);
+@@ -826,7 +826,7 @@ static int dump_option_done(int fd, int size)
+ 	if (!offset)
+ 		return 0;
+ 
+-	if (lseek64(fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(fd, offset, SEEK_SET) == (off_t)-1)
+ 		die("cannot goto next options offset %lld", offset);
+ 
+ 	do_print(OPTIONS, "\n\n");
+@@ -1006,7 +1006,7 @@ static void dump_therest(int fd)
+ 		else if (strncmp(str, HEAD_FLYRECORD, 10) == 0)
+ 			dump_flyrecord(fd);
+ 		else {
+-			lseek64(fd, -10, SEEK_CUR);
++			lseek(fd, -10, SEEK_CUR);
+ 			break;
+ 		}
+ 	}
+@@ -1060,7 +1060,7 @@ static void get_meta_strings(int fd)
+ 	unsigned short fl, id;
+ 	int desc_id;
+ 
+-	offset = lseek64(fd, 0, SEEK_CUR);
++	offset = lseek(fd, 0, SEEK_CUR);
+ 	do {
+ 		if (read_file_number(fd, &id, 2))
+ 			break;
+@@ -1074,7 +1074,7 @@ static void get_meta_strings(int fd)
+ 			if ((fl & TRACECMD_SEC_FL_COMPRESS)) {
+ 				read_file_number(fd, &csize, 4);
+ 				read_file_number(fd, &rsize, 4);
+-				lseek64(fd, -8, SEEK_CUR);
++				lseek(fd, -8, SEEK_CUR);
+ 				if (uncompress_block())
+ 					break;
+ 			} else {
+@@ -1083,12 +1083,12 @@ static void get_meta_strings(int fd)
+ 			read_metadata_strings(fd, rsize);
+ 			uncompress_reset();
+ 		} else {
+-			if (lseek64(fd, size, SEEK_CUR) == (off_t)-1)
++			if (lseek(fd, size, SEEK_CUR) == (off_t)-1)
+ 				break;
+ 		}
+ 	} while (1);
+ 
+-	if (lseek64(fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(fd, offset, SEEK_SET) == (off_t)-1)
+ 		die("cannot restore the original file location");
+ }
+ 
+@@ -1102,9 +1102,9 @@ static int walk_v7_sections(int fd)
+ 	int desc_id;
+ 	const char *desc;
+ 
+-	offset = lseek64(fd, 0, SEEK_CUR);
++	offset = lseek(fd, 0, SEEK_CUR);
+ 	do {
+-		soffset = lseek64(fd, 0, SEEK_CUR);
++		soffset = lseek(fd, 0, SEEK_CUR);
+ 		if (read_file_number(fd, &id, 2))
+ 			break;
+ 
+@@ -1149,11 +1149,11 @@ static int walk_v7_sections(int fd)
+ 				 id, soffset, desc, fl, size);
+ 		}
+ 
+-		if (lseek64(fd, size, SEEK_CUR) == (off_t)-1)
++		if (lseek(fd, size, SEEK_CUR) == (off_t)-1)
+ 			break;
+ 	} while (1);
+ 
+-	if (lseek64(fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(fd, offset, SEEK_SET) == (off_t)-1)
+ 		die("cannot restore the original file location");
+ 
+ 	return count;
+@@ -1170,7 +1170,7 @@ static void dump_v7_file(int fd)
+ 	get_meta_strings(fd);
+ 	sections = walk_v7_sections(fd);
+ 
+-	if (lseek64(fd, offset, SEEK_SET) == (off_t)-1)
++	if (lseek(fd, offset, SEEK_SET) == (off_t)-1)
+ 		die("cannot goto options offset %lld", offset);
+ 
+ 	dump_options(fd);
+diff --git a/tracecmd/trace-read.c b/tracecmd/trace-read.c
+index 224a6dde..c094ad6a 100644
+--- a/tracecmd/trace-read.c
++++ b/tracecmd/trace-read.c
+@@ -195,7 +195,7 @@ static void print_event(struct trace_seq *s, struct tracecmd_input *handle,
+ #define TEST_READ_AT 0
+ #if TEST_READ_AT
+ #define DO_TEST
+-static off64_t test_read_at_offset;
++static off_t test_read_at_offset;
+ static int test_read_at_copy = 100;
+ static int test_read_at_index;
+ static void show_test(struct tracecmd_input *handle)
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch b/meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch
deleted file mode 100644
index 220991804b..0000000000
--- a/meta-oe/recipes-kernel/trace-cmd/files/0001-trace-cmd-make-it-build-with-musl.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From b63f13d2df91ede45288653b21e0d30a6b45f2ac Mon Sep 17 00:00:00 2001
-From: Beniamin Sandu <beniaminsandu@gmail.com>
-Date: Mon, 30 Nov 2020 18:24:48 +0200
-Subject: [PATCH] trace-cmd: make it build with musl
-
-Signed-off-by: Beniamin Sandu <beniaminsandu@gmail.com>
----
- include/trace-cmd/trace-cmd.h |  1 +
- lib/trace-cmd/trace-msg.c     |  1 +
- lib/trace-cmd/trace-plugin.c  |  2 ++
- lib/tracefs/tracefs-events.c  |  1 +
- tracecmd/trace-agent.c        |  1 +
- tracecmd/trace-setup-guest.c  |  1 +
- tracecmd/trace-tsync.c        | 15 ++++++++++-----
- 7 files changed, 17 insertions(+), 5 deletions(-)
-
-diff --git a/include/trace-cmd/trace-cmd.h b/include/trace-cmd/trace-cmd.h
-index f3c95f3..a697905 100644
---- a/include/trace-cmd/trace-cmd.h
-+++ b/include/trace-cmd/trace-cmd.h
-@@ -6,6 +6,7 @@
- #ifndef _TRACE_CMD_H
- #define _TRACE_CMD_H
- 
-+#include <sys/types.h>
- #include "traceevent/event-parse.h"
- 
- #define TRACECMD_MAGIC { 23, 8, 68 }
-diff --git a/lib/trace-cmd/trace-msg.c b/lib/trace-cmd/trace-msg.c
-index 4a0bfa9..fc1f2c7 100644
---- a/lib/trace-cmd/trace-msg.c
-+++ b/lib/trace-cmd/trace-msg.c
-@@ -21,6 +21,7 @@
- #include <arpa/inet.h>
- #include <sys/types.h>
- #include <linux/types.h>
-+#include <byteswap.h>
- 
- #include "trace-write-local.h"
- #include "trace-cmd-local.h"
-diff --git a/lib/trace-cmd/trace-plugin.c b/lib/trace-cmd/trace-plugin.c
-index 92f9edf..c2ef3dc 100644
---- a/lib/trace-cmd/trace-plugin.c
-+++ b/lib/trace-cmd/trace-plugin.c
-@@ -8,6 +8,8 @@
- #include <dlfcn.h>
- #include <sys/stat.h>
- #include <libgen.h>
-+#include <limits.h>
-+
- #include "trace-cmd.h"
- #include "trace-local.h"
- 
-diff --git a/lib/tracefs/tracefs-events.c b/lib/tracefs/tracefs-events.c
-index 8e825f5..a8d8560 100644
---- a/lib/tracefs/tracefs-events.c
-+++ b/lib/tracefs/tracefs-events.c
-@@ -13,6 +13,7 @@
- #include <errno.h>
- #include <sys/stat.h>
- #include <fcntl.h>
-+#include <limits.h>
- 
- #include "kbuffer.h"
- #include "tracefs.h"
-diff --git a/tracecmd/trace-agent.c b/tracecmd/trace-agent.c
-index b581696..abfefac 100644
---- a/tracecmd/trace-agent.c
-+++ b/tracecmd/trace-agent.c
-@@ -20,6 +20,7 @@
- #include <unistd.h>
- #include <linux/vm_sockets.h>
- #include <pthread.h>
-+#include <limits.h>
- 
- #include "trace-local.h"
- #include "trace-msg.h"
-diff --git a/tracecmd/trace-setup-guest.c b/tracecmd/trace-setup-guest.c
-index 899848c..99595a1 100644
---- a/tracecmd/trace-setup-guest.c
-+++ b/tracecmd/trace-setup-guest.c
-@@ -13,6 +13,7 @@
- #include <string.h>
- #include <sys/stat.h>
- #include <unistd.h>
-+#include <limits.h>
- 
- #include "trace-local.h"
- #include "trace-msg.h"
-diff --git a/tracecmd/trace-tsync.c b/tracecmd/trace-tsync.c
-index e639788..b8b5ac3 100644
---- a/tracecmd/trace-tsync.c
-+++ b/tracecmd/trace-tsync.c
-@@ -104,13 +104,15 @@ int tracecmd_host_tsync(struct buffer_instance *instance,
- 
- 	pthread_attr_init(&attrib);
- 	pthread_attr_setdetachstate(&attrib, PTHREAD_CREATE_JOINABLE);
--	if (!get_first_cpu(&pin_mask, &mask_size))
--		pthread_attr_setaffinity_np(&attrib, mask_size, pin_mask);
- 
- 	ret = pthread_create(&instance->tsync_thread, &attrib,
- 			     tsync_host_thread, &instance->tsync);
--	if (!ret)
-+	if (!ret) {
-+		if (!get_first_cpu(&pin_mask, &mask_size))
-+			pthread_setaffinity_np(instance->tsync_thread, mask_size, pin_mask);
- 		instance->tsync_thread_running = true;
-+	}
-+
- 	if (pin_mask)
- 		CPU_FREE(pin_mask);
- 	pthread_attr_destroy(&attrib);
-@@ -243,11 +245,14 @@ unsigned int tracecmd_guest_tsync(char *tsync_protos,
- 	pthread_attr_init(&attrib);
- 	tsync->sync_proto = proto;
- 	pthread_attr_setdetachstate(&attrib, PTHREAD_CREATE_JOINABLE);
--	if (!get_first_cpu(&pin_mask, &mask_size))
--		pthread_attr_setaffinity_np(&attrib, mask_size, pin_mask);
- 
- 	ret = pthread_create(thr_id, &attrib, tsync_agent_thread, tsync);
- 
-+	if (!ret) {
-+		if (!get_first_cpu(&pin_mask, &mask_size))
-+			pthread_setaffinity_np(*thr_id, mask_size, pin_mask);
-+	}
-+
- 	if (pin_mask)
- 		CPU_FREE(pin_mask);
- 	pthread_attr_destroy(&attrib);
--- 
-2.25.1
-
diff --git a/meta-oe/recipes-kernel/trace-cmd/files/0002-replace-off64_t-and-lseek64.patch b/meta-oe/recipes-kernel/trace-cmd/files/0002-replace-off64_t-and-lseek64.patch
deleted file mode 100644
index 453a888b52..0000000000
--- a/meta-oe/recipes-kernel/trace-cmd/files/0002-replace-off64_t-and-lseek64.patch
+++ /dev/null
@@ -1,426 +0,0 @@
-From 6dab4b10be4df906375d0dcfa5bbffc43d3d953a Mon Sep 17 00:00:00 2001
-From: Khem Raj <raj.khem@gmail.com>
-Date: Thu, 22 Dec 2022 00:58:26 -0800
-Subject: [PATCH 2/2] replace off64_t and lseek64
-
-Musl does not define these interfaces unless -D_LARGEFILE64_SOURCE is
-defined and that too it is transitional until apps switch to using 64bit
-off_t
-
-Upstream-Status: Pending
-Signed-off-by: Khem Raj <raj.khem@gmail.com>
----
- lib/trace-cmd/trace-input.c    | 54 +++++++++++++++++-----------------
- lib/trace-cmd/trace-output.c   | 44 +++++++++++++--------------
- lib/trace-cmd/trace-recorder.c |  8 ++---
- tracecmd/trace-dump.c          |  6 ++--
- tracecmd/trace-read.c          |  2 +-
- 5 files changed, 57 insertions(+), 57 deletions(-)
-
-diff --git a/lib/trace-cmd/trace-input.c b/lib/trace-cmd/trace-input.c
-index af97883e..c3f91fcd 100644
---- a/lib/trace-cmd/trace-input.c
-+++ b/lib/trace-cmd/trace-input.c
-@@ -33,15 +33,15 @@ static int force_read = 0;
- 
- struct page_map {
- 	struct list_head	list;
--	off64_t			offset;
--	off64_t			size;
-+	off_t			offset;
-+	off_t			size;
- 	void			*map;
- 	int			ref_count;
- };
- 
- struct page {
- 	struct list_head	list;
--	off64_t			offset;
-+	off_t			offset;
- 	struct tracecmd_input	*handle;
- 	struct page_map		*page_map;
- 	void			*map;
-@@ -385,7 +385,7 @@ static int read_header_files(struct tracecmd_input *handle)
- 	free(header);
- 
- 	handle->ftrace_files_start =
--		lseek64(handle->fd, 0, SEEK_CUR);
-+		lseek(handle->fd, 0, SEEK_CUR);
- 
- 	return 0;
- 
-@@ -581,7 +581,7 @@ static int read_ftrace_files(struct tracecmd_input *handle, const char *regex)
- 	}
- 
- 	handle->event_files_start =
--		lseek64(handle->fd, 0, SEEK_CUR);
-+		lseek(handle->fd, 0, SEEK_CUR);
- 
- 	if (sreg) {
- 		regfree(sreg);
-@@ -817,11 +817,11 @@ static unsigned long long calc_page_offset(struct tracecmd_input *handle,
- 	return offset & ~(handle->page_size - 1);
- }
- 
--static int read_page(struct tracecmd_input *handle, off64_t offset,
-+static int read_page(struct tracecmd_input *handle, off_t offset,
- 		     int cpu, void *map)
- {
--	off64_t save_seek;
--	off64_t ret;
-+	off_t save_seek;
-+	off_t ret;
- 
- 	if (handle->use_pipe) {
- 		ret = read(handle->cpu_data[cpu].pipe_fd, map, handle->page_size);
-@@ -839,9 +839,9 @@ static int read_page(struct tracecmd_input *handle, off64_t offset,
- 	}
- 
- 	/* other parts of the code may expect the pointer to not move */
--	save_seek = lseek64(handle->fd, 0, SEEK_CUR);
-+	save_seek = lseek(handle->fd, 0, SEEK_CUR);
- 
--	ret = lseek64(handle->fd, offset, SEEK_SET);
-+	ret = lseek(handle->fd, offset, SEEK_SET);
- 	if (ret < 0)
- 		return -1;
- 	ret = read(handle->fd, map, handle->page_size);
-@@ -849,7 +849,7 @@ static int read_page(struct tracecmd_input *handle, off64_t offset,
- 		return -1;
- 
- 	/* reset the file pointer back */
--	lseek64(handle->fd, save_seek, SEEK_SET);
-+	lseek(handle->fd, save_seek, SEEK_SET);
- 
- 	return 0;
- }
-@@ -881,12 +881,12 @@ static void free_page_map(struct page_map *page_map)
- }
- 
- static void *allocate_page_map(struct tracecmd_input *handle,
--			       struct page *page, int cpu, off64_t offset)
-+			       struct page *page, int cpu, off_t offset)
- {
- 	struct cpu_data *cpu_data = &handle->cpu_data[cpu];
- 	struct page_map *page_map;
--	off64_t map_size;
--	off64_t map_offset;
-+	off_t map_size;
-+	off_t map_offset;
- 	void *map;
- 	int ret;
- 
-@@ -967,7 +967,7 @@ static void *allocate_page_map(struct tracecmd_input *handle,
- }
- 
- static struct page *allocate_page(struct tracecmd_input *handle,
--				  int cpu, off64_t offset)
-+				  int cpu, off_t offset)
- {
- 	struct cpu_data *cpu_data = &handle->cpu_data[cpu];
- 	struct page **pages;
-@@ -1219,7 +1219,7 @@ static int update_page_info(struct tracecmd_input *handle, int cpu)
-  *        -1 on error
-  */
- static int get_page(struct tracecmd_input *handle, int cpu,
--		    off64_t offset)
-+		    off_t offset)
- {
- 	/* Don't map if the page is already where we want */
- 	if (handle->cpu_data[cpu].offset == offset &&
-@@ -1263,7 +1263,7 @@ static int get_page(struct tracecmd_input *handle, int cpu,
- 
- static int get_next_page(struct tracecmd_input *handle, int cpu)
- {
--	off64_t offset;
-+	off_t offset;
- 
- 	if (!handle->cpu_data[cpu].page && !handle->use_pipe)
- 		return 0;
-@@ -1484,7 +1484,7 @@ struct tep_record *
- tracecmd_read_cpu_last(struct tracecmd_input *handle, int cpu)
- {
- 	struct tep_record *record = NULL;
--	off64_t offset, page_offset;
-+	off_t offset, page_offset;
- 
- 	offset = handle->cpu_data[cpu].file_offset +
- 		handle->cpu_data[cpu].file_size;
-@@ -1545,7 +1545,7 @@ tracecmd_set_cpu_to_timestamp(struct tracecmd_input *handle, int cpu,
- 			      unsigned long long ts)
- {
- 	struct cpu_data *cpu_data = &handle->cpu_data[cpu];
--	off64_t start, end, next;
-+	off_t start, end, next;
- 
- 	if (cpu < 0 || cpu >= handle->cpus) {
- 		errno = -EINVAL;
-@@ -2965,7 +2965,7 @@ void tracecmd_print_events(struct tracecmd_input *handle, const char *regex)
- 		regex = ".*";
- 
- 	if (!handle->ftrace_files_start) {
--		lseek64(handle->fd, handle->header_files_start, SEEK_SET);
-+		lseek(handle->fd, handle->header_files_start, SEEK_SET);
- 		read_header_files(handle);
- 	}
- 	ret = read_ftrace_files(handle, regex);
-@@ -3120,13 +3120,13 @@ struct tracecmd_input *tracecmd_alloc_fd(int fd)
- 	handle->page_size = page_size;
- 
- 	handle->header_files_start =
--		lseek64(handle->fd, 0, SEEK_CUR);
-+		lseek(handle->fd, 0, SEEK_CUR);
- 
- 	handle->total_file_size =
--		lseek64(handle->fd, 0, SEEK_END);
-+		lseek(handle->fd, 0, SEEK_END);
- 
- 	handle->header_files_start =
--		lseek64(handle->fd, handle->header_files_start, SEEK_SET);
-+		lseek(handle->fd, handle->header_files_start, SEEK_SET);
- 
- 	return handle;
- 
-@@ -3419,7 +3419,7 @@ static int copy_header_files(struct tracecmd_input *handle, int fd)
- {
- 	unsigned long long size;
- 
--	lseek64(handle->fd, handle->header_files_start, SEEK_SET);
-+	lseek(handle->fd, handle->header_files_start, SEEK_SET);
- 
- 	/* "header_page"  */
- 	if (read_copy_data(handle, 12, fd) < 0)
-@@ -3713,9 +3713,9 @@ tracecmd_buffer_instance_handle(struct tracecmd_input *handle, int indx)
- 	new_handle->pid_maps = NULL;
- 
- 	/* Save where we currently are */
--	offset = lseek64(handle->fd, 0, SEEK_CUR);
-+	offset = lseek(handle->fd, 0, SEEK_CUR);
- 
--	ret = lseek64(handle->fd, buffer->offset, SEEK_SET);
-+	ret = lseek(handle->fd, buffer->offset, SEEK_SET);
- 	if (ret < 0) {
- 		warning("could not seek to buffer %s offset %ld\n",
- 			buffer->name, buffer->offset);
-@@ -3730,7 +3730,7 @@ tracecmd_buffer_instance_handle(struct tracecmd_input *handle, int indx)
- 		goto error;
- 	}
- 
--	ret = lseek64(handle->fd, offset, SEEK_SET);
-+	ret = lseek(handle->fd, offset, SEEK_SET);
- 	if (ret < 0) {
- 		warning("could not seek to back to offset %ld\n", offset);
- 		goto error;
-diff --git a/lib/trace-cmd/trace-output.c b/lib/trace-cmd/trace-output.c
-index 4a9a857d..0f5acd2f 100644
---- a/lib/trace-cmd/trace-output.c
-+++ b/lib/trace-cmd/trace-output.c
-@@ -800,8 +800,8 @@ static int save_tracing_file_data(struct tracecmd_output *handle,
- 	unsigned long long endian8;
- 	char *file = NULL;
- 	struct stat st;
--	off64_t check_size;
--	off64_t size;
-+	off_t check_size;
-+	off_t size;
- 	int ret = -1;
- 
- 	file = get_tracing_file(handle, filename);
-@@ -1069,7 +1069,7 @@ int tracecmd_write_options(struct tracecmd_output *handle)
- 			return -1;
- 
- 		/* Save the data location in case it needs to be updated */
--		options->offset = lseek64(handle->fd, 0, SEEK_CUR);
-+		options->offset = lseek(handle->fd, 0, SEEK_CUR);
- 
- 		if (do_write_check(handle, options->data,
- 				   options->size))
-@@ -1099,9 +1099,9 @@ int tracecmd_append_options(struct tracecmd_output *handle)
- 	if (handle->options_written)
- 		return 0;
- 
--	if (lseek64(handle->fd, 0, SEEK_END) == (off_t)-1)
-+	if (lseek(handle->fd, 0, SEEK_END) == (off_t)-1)
- 		return -1;
--	offset = lseek64(handle->fd, -2, SEEK_CUR);
-+	offset = lseek(handle->fd, -2, SEEK_CUR);
- 	if (offset == (off_t)-1)
- 		return -1;
- 
-@@ -1119,7 +1119,7 @@ int tracecmd_append_options(struct tracecmd_output *handle)
- 			return -1;
- 
- 		/* Save the data location in case it needs to be updated */
--		options->offset = lseek64(handle->fd, 0, SEEK_CUR);
-+		options->offset = lseek(handle->fd, 0, SEEK_CUR);
- 
- 		if (do_write_check(handle, options->data,
- 				   options->size))
-@@ -1156,10 +1156,10 @@ int tracecmd_update_option(struct tracecmd_output *handle,
- 	}
- 
- 	/* Save current offset */
--	offset = lseek64(handle->fd, 0, SEEK_CUR);
-+	offset = lseek(handle->fd, 0, SEEK_CUR);
- 
--	ret = lseek64(handle->fd, option->offset, SEEK_SET);
--	if (ret == (off64_t)-1) {
-+	ret = lseek(handle->fd, option->offset, SEEK_SET);
-+	if (ret == (off_t)-1) {
- 		warning("could not seek to %lld\n", option->offset);
- 		return -1;
- 	}
-@@ -1167,8 +1167,8 @@ int tracecmd_update_option(struct tracecmd_output *handle,
- 	if (do_write_check(handle, data, size))
- 		return -1;
- 
--	ret = lseek64(handle->fd, offset, SEEK_SET);
--	if (ret == (off64_t)-1) {
-+	ret = lseek(handle->fd, offset, SEEK_SET);
-+	if (ret == (off_t)-1) {
- 		warning("could not seek to %lld\n", offset);
- 		return -1;
- 	}
-@@ -1243,11 +1243,11 @@ out_free:
- int tracecmd_write_cpu_data(struct tracecmd_output *handle,
- 			    int cpus, char * const *cpu_data_files)
- {
--	off64_t *offsets = NULL;
-+	off_t *offsets = NULL;
- 	unsigned long long *sizes = NULL;
--	off64_t offset;
-+	off_t offset;
- 	unsigned long long endian8;
--	off64_t check_size;
-+	off_t check_size;
- 	char *file;
- 	struct stat st;
- 	int ret;
-@@ -1263,7 +1263,7 @@ int tracecmd_write_cpu_data(struct tracecmd_output *handle,
- 	if (!sizes)
- 		goto out_free;
- 
--	offset = lseek64(handle->fd, 0, SEEK_CUR);
-+	offset = lseek(handle->fd, 0, SEEK_CUR);
- 
- 	/* hold any extra data for data */
- 	offset += cpus * (16);
-@@ -1318,8 +1318,8 @@ int tracecmd_write_cpu_data(struct tracecmd_output *handle,
- 		if (!tracecmd_get_quiet(handle))
- 			fprintf(stderr, "CPU%d data recorded at offset=0x%llx\n",
- 				i, (unsigned long long) offsets[i]);
--		offset = lseek64(handle->fd, offsets[i], SEEK_SET);
--		if (offset == (off64_t)-1) {
-+		offset = lseek(handle->fd, offsets[i], SEEK_SET);
-+		if (offset == (off_t)-1) {
- 			warning("could not seek to %lld\n", offsets[i]);
- 			goto out_free;
- 		}
-@@ -1369,11 +1369,11 @@ int tracecmd_append_buffer_cpu_data(struct tracecmd_output *handle,
- 	tsize_t offset;
- 	stsize_t ret;
- 
--	offset = lseek64(handle->fd, 0, SEEK_CUR);
-+	offset = lseek(handle->fd, 0, SEEK_CUR);
- 
- 	/* Go to the option data, where will write the offest */
--	ret = lseek64(handle->fd, option->offset, SEEK_SET);
--	if (ret == (off64_t)-1) {
-+	ret = lseek(handle->fd, option->offset, SEEK_SET);
-+	if (ret == (off_t)-1) {
- 		warning("could not seek to %lld\n", option->offset);
- 		return -1;
- 	}
-@@ -1382,8 +1382,8 @@ int tracecmd_append_buffer_cpu_data(struct tracecmd_output *handle,
- 		return -1;
- 
- 	/* Go back to end of file */
--	ret = lseek64(handle->fd, offset, SEEK_SET);
--	if (ret == (off64_t)-1) {
-+	ret = lseek(handle->fd, offset, SEEK_SET);
-+	if (ret == (off_t)-1) {
- 		warning("could not seek to %lld\n", offset);
- 		return -1;
- 	}
-diff --git a/lib/trace-cmd/trace-recorder.c b/lib/trace-cmd/trace-recorder.c
-index 2a6e2b67..d83320d9 100644
---- a/lib/trace-cmd/trace-recorder.c
-+++ b/lib/trace-cmd/trace-recorder.c
-@@ -53,7 +53,7 @@ static int append_file(int size, int dst, int src)
- 	char buf[size];
- 	int r;
- 
--	lseek64(src, 0, SEEK_SET);
-+	lseek(src, 0, SEEK_SET);
- 
- 	/* If there's an error, then we are pretty much screwed :-p */
- 	do {
-@@ -84,10 +84,10 @@ void tracecmd_free_recorder(struct tracecmd_recorder *recorder)
- 					  recorder->fd2, recorder->fd1);
- 			/* Error on copying, then just keep fd1 */
- 			if (ret) {
--				lseek64(recorder->fd1, 0, SEEK_END);
-+				lseek(recorder->fd1, 0, SEEK_END);
- 				goto close;
- 			}
--			lseek64(recorder->fd1, 0, SEEK_SET);
-+			lseek(recorder->fd1, 0, SEEK_SET);
- 			ftruncate(recorder->fd1, 0);
- 		}
- 		append_file(recorder->page_size, recorder->fd1, recorder->fd2);
-@@ -371,7 +371,7 @@ static inline void update_fd(struct tracecmd_recorder *recorder, int size)
- 		fd = recorder->fd1;
- 
- 	/* Zero out the new file we are writing to */
--	lseek64(fd, 0, SEEK_SET);
-+	lseek(fd, 0, SEEK_SET);
- 	ftruncate(fd, 0);
- 
- 	recorder->fd = fd;
-diff --git a/tracecmd/trace-dump.c b/tracecmd/trace-dump.c
-index 5642f12a..0a54bf42 100644
---- a/tracecmd/trace-dump.c
-+++ b/tracecmd/trace-dump.c
-@@ -487,7 +487,7 @@ static void dump_options(int fd)
- 
- 		count++;
- 		if (!DUMP_CHECK(OPTIONS)) {
--			lseek64(fd, size, SEEK_CUR);
-+			lseek(fd, size, SEEK_CUR);
- 			continue;
- 		}
- 		switch (option) {
-@@ -533,7 +533,7 @@ static void dump_options(int fd)
- 		default:
- 			do_print(OPTIONS, " %d %d\t[Unknown option, size - skipping]\n",
- 				 option, size);
--			lseek64(fd, size, SEEK_CUR);
-+			lseek(fd, size, SEEK_CUR);
- 			break;
- 		}
- 	}
-@@ -579,7 +579,7 @@ static void dump_therest(int fd)
- 		else if (strncmp(str, HEAD_FLYRECORD, 10) == 0)
- 			dump_flyrecord(fd);
- 		else {
--			lseek64(fd, -10, SEEK_CUR);
-+			lseek(fd, -10, SEEK_CUR);
- 			break;
- 		}
- 	}
-diff --git a/tracecmd/trace-read.c b/tracecmd/trace-read.c
-index e1811074..181a69df 100644
---- a/tracecmd/trace-read.c
-+++ b/tracecmd/trace-read.c
-@@ -187,7 +187,7 @@ static void print_event(struct trace_seq *s, struct tracecmd_input *handle,
- #define TEST_READ_AT 0
- #if TEST_READ_AT
- #define DO_TEST
--static off64_t test_read_at_offset;
-+static off_t test_read_at_offset;
- static int test_read_at_copy = 100;
- static int test_read_at_index;
- static void show_test(struct tracecmd_input *handle)
--- 
-2.39.0
-
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
deleted file mode 100644
index 51e46533de..0000000000
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_2.9.1.bb
+++ /dev/null
@@ -1,32 +0,0 @@
-SUMMARY = "User-space front-end command-line tool for ftrace"
-
-LICENSE = "GPL-2.0-only & LGPL-2.1-only"
-LIC_FILES_CHKSUM = "file://COPYING;md5=873f48a813bded3de6ebc54e6880c4ac"
-
-SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master \
-           file://0001-trace-cmd-make-it-build-with-musl.patch \
-           file://0002-replace-off64_t-and-lseek64.patch \
-           "
-
-SRCREV = "530b1a0caef39466e16bbd49de5afef89656f03f"
-
-S = "${WORKDIR}/git"
-
-DEPENDS += "libtraceevent libtracefs zstd xmlto-native asciidoc-native"
-
-inherit pkgconfig
-
-TARGET_CC_ARCH += "${LDFLAGS}"
-
-do_compile() {
-        oe_runmake libdir_relative=${BASELIB} libs
-        oe_runmake libdir_relative=${BASELIB} all
-}
-
-do_install() {
-       oe_runmake libdir_relative=${BASELIB} etcdir=${sysconfdir} DESTDIR=${D} install install_libs
-       mkdir -p ${D}${libdir}/traceevent/plugins/${BPN}
-       mv ${D}/${libdir}/traceevent/plugins/*.so ${D}${libdir}/traceevent/plugins/${BPN}/
-}
-
-FILES:${PN} += "${libdir}/traceevent ${libdir}/traceevent/plugins ${libdir}/tracefs"
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
new file mode 100644
index 0000000000..50d73df03a
--- /dev/null
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -0,0 +1,31 @@
+SUMMARY = "User-space front-end command-line tool for ftrace"
+
+LICENSE = "GPL-2.0-only & LGPL-2.1-only"
+LIC_FILES_CHKSUM = " \
+    file://LICENSES/GPL-2.0;md5=e6a75371ba4d16749254a51215d13f97 \
+    file://LICENSES/LGPL-2.1;md5=b370887980db5dd40659b50909238dbd \
+    "
+
+SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master \
+           file://0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch \
+           file://0001-Do-not-emit-useless-rpath.patch"
+SRCREV = "18233e4c32857cb7ddd4960beeec8360ed834fc5"
+
+S = "${WORKDIR}/git"
+
+DEPENDS += "libtraceevent libtracefs zstd xmlto-native asciidoc-native swig-native bison-native flex-native"
+
+inherit pkgconfig bash-completion
+
+TARGET_CC_ARCH += "${LDFLAGS}"
+
+do_compile() {
+        oe_runmake libdir_relative=${BASELIB} libs
+        oe_runmake libdir_relative=${BASELIB} all
+}
+
+do_install() {
+       oe_runmake libdir_relative=${BASELIB} etcdir=${sysconfdir} pkgconfig_dir=${libdir}/pkgconfig DESTDIR=${D} install install_libs
+       # Because makefile uses cp instead of install we need to change owner of files
+       chown -R root:root ${D}${libdir}
+}
-- 
2.39.0


