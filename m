Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 615ADC5479D
	for <webhook@archiver.kernel.org>; Mon,  9 Jan 2023 23:01:31 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
 by mx.groups.io with SMTP id smtpd.web11.89227.1673305288948225137
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 09 Jan 2023 15:01:29 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=pdtug5U2;
 spf=pass (domain: gmail.com, ip: 209.85.214.171, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f171.google.com with SMTP id d3so11228779plr.10
        for <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 15:01:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=14ywfIu0ZDoOLDbwOu8YXinbqAl4d1jmzY4iKqpijx8=;
        b=pdtug5U2S6SSg7K8csmjBAoRiXWn8/m+JnTB0dWYGqtyal7vhG+zpRUS3JdTZJZN3O
         WKFdld217jUorlE8bzCLpiui8SsTbeqBQcY2VipjKZNe1IRgT4OLZqLAzB3jKvi4+mgd
         ZsFJGa6uNPCZxUK736W4oVPxLOMbc5FcGXDL766pxVKlCvtpAhaC8yucyzqafzdprBFQ
         m+0AUjSu5V8zM1vvQZTUINTEtM3Q7np3A9Ia6IJ+Sz+fJbcEJKxlr2uYKcH9MwenQLVs
         T+eb6GfulSFfvB30vcFIvWR3C4Idmzj3bH4xnyjAwyBL3vPWiZUHNTNK1LyMV0xPGf8I
         asyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=14ywfIu0ZDoOLDbwOu8YXinbqAl4d1jmzY4iKqpijx8=;
        b=39UvgmGV14z+5B2t/jf7SaDnXG/7HSLfVXuHA6l8Q8lgVnLEYIbp150DWfr6yvSKW4
         5CsBP74O3k2hmcODw7od45MbBp0RpTTn++jaqOMjoLafhTDZCnXI+3cLfj6RT0tcR1pt
         Q5J7Om1DaXBRlsPhcQbvq6LU+ihc0ewxQ/wkM9MRdS0GWNaCiJq+yWmVcxn5MfBXR3Z+
         NE8JD9DiTrH8D4bVTC76whNsjFBEXBLN8xMZsjeb2ybbFubWalHYFpyecaaz3bVWy4Jn
         Npg08WqbXBi4uZRPrUIrwDfBSBL3tVrAcqlqfrMhaSTSEHOHUiORBqlYOrjC8Bc5sFLF
         D6Ag==
X-Gm-Message-State: AFqh2kpeG42PcgJCXk7eLHAIeXlT7SaRHhR/gfymsTKsKhxlvUtWZHEZ
	psVR+dvHzxjzR9UpzUTcuf0ZA1vd0sRRLw==
X-Google-Smtp-Source: AMrXdXvg976uhY835dtjILEw/vIFOyN1M2Ip/Ryqqtvd30pe67fHmC4ML9LL8duwBTV9QC+obWrsog==
X-Received: by 2002:a17:903:186:b0:188:d2b3:26c1 with SMTP id z6-20020a170903018600b00188d2b326c1mr88010673plg.10.1673305287863;
        Mon, 09 Jan 2023 15:01:27 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:9181:1cf0::ee35])
        by smtp.gmail.com with ESMTPSA id s21-20020a170902b19500b00189e1522982sm6605165plr.168.2023.01.09.15.01.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 15:01:27 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Khem Raj <raj.khem@gmail.com>
Subject: [meta-oe][PATCH] trace-cmd: Update to upstream submitted patches
Date: Mon,  9 Jan 2023 15:01:25 -0800
Message-Id: <20230109230125.1297631-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Mon, 09 Jan 2023 23:01:31 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/100492

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ...LFS64-interfaces-off64_t-and-lseek64.patch |  68 ++++----
 .../0002-Drop-using-_LARGEFILE64_SOURCE.patch | 145 ++++++++++++++++++
 .../trace-cmd/trace-cmd_3.1.5.bb              |   1 +
 3 files changed, 180 insertions(+), 34 deletions(-)
 create mode 100644 meta-oe/recipes-kernel/trace-cmd/files/0002-Drop-using-_LARGEFILE64_SOURCE.patch

diff --git a/meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch b/meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch
index 830f1d96e1..1e5415ef6a 100644
--- a/meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch
+++ b/meta-oe/recipes-kernel/trace-cmd/files/0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch
@@ -1,18 +1,18 @@
-From c6190920d405a5a6df3797153be93905d98a65f5 Mon Sep 17 00:00:00 2001
+From 9c3213a3b64e049c1aa065300b01ee751699b01f Mon Sep 17 00:00:00 2001
 From: Khem Raj <raj.khem@gmail.com>
 Date: Fri, 6 Jan 2023 16:53:06 -0800
-Subject: [PATCH] Replace LFS64 interfaces off64_t and lseek64
+Subject: [PATCH 1/2] Replace LFS64 interfaces off64_t and lseek64
 
 Musl does not define these interfaces unless -D_LARGEFILE64_SOURCE is
-defined and that too it is transitional until apps switch to using 64bit
-off_t. We pass -D_LARGEFILE64_SOURCE in makefiles already therefore
+defined and that too it is transitional until apps switch to using 64-bit
+off_t. We pass -D_FILE_OFFSET_BITS=64 in makefiles already therefore
 original lseek and off_t are already 64bit
 
 This fixes build with latest musl which has dropped LFS64 interfaces [1]
 
 [1] https://git.musl-libc.org/cgit/musl/commit/?id=246f1c811448f37a44b41cd8df8d0ef9736d95f4i
 
-Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20230107010245.1290391-1-raj.khem@gmail.com/]
+Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20230109225315.1284538-1-raj.khem@gmail.com/]
 Signed-off-by: Khem Raj <raj.khem@gmail.com>
 ---
  .../include/private/trace-cmd-private.h       |  12 +-
@@ -27,7 +27,7 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  9 files changed, 142 insertions(+), 142 deletions(-)
 
 diff --git a/lib/trace-cmd/include/private/trace-cmd-private.h b/lib/trace-cmd/include/private/trace-cmd-private.h
-index 271f0541..ac2d02c3 100644
+index 05c084ce..f2cf8dc8 100644
 --- a/lib/trace-cmd/include/private/trace-cmd-private.h
 +++ b/lib/trace-cmd/include/private/trace-cmd-private.h
 @@ -106,7 +106,7 @@ const char *tracecmd_get_trace_clock(struct tracecmd_input *handle);
@@ -48,7 +48,7 @@ index 271f0541..ac2d02c3 100644
  int tracecmd_write_options(struct tracecmd_output *handle);
  int tracecmd_write_meta_strings(struct tracecmd_output *handle);
  int tracecmd_append_options(struct tracecmd_output *handle);
-@@ -393,7 +393,7 @@ struct tracecmd_msg_handle {
+@@ -394,7 +394,7 @@ struct tracecmd_msg_handle {
  	short			cpu_count;
  	short			version;	/* Current protocol version */
  	unsigned long		flags;
@@ -57,7 +57,7 @@ index 271f0541..ac2d02c3 100644
  	bool			done;
  	bool			cache;
  	int			cfd;
-@@ -542,8 +542,8 @@ int tracecmd_write_guest_time_shift(struct tracecmd_output *handle,
+@@ -543,8 +543,8 @@ int tracecmd_write_guest_time_shift(struct tracecmd_output *handle,
  struct tracecmd_compress_chunk {
  	unsigned int		size;
  	unsigned int		zsize;
@@ -68,7 +68,7 @@ index 271f0541..ac2d02c3 100644
  };
  struct tracecmd_compression;
  struct tracecmd_compression_proto {
-@@ -569,7 +569,7 @@ int tracecmd_compress_buffer_read(struct tracecmd_compression *handle, char *dst
+@@ -570,7 +570,7 @@ int tracecmd_compress_buffer_read(struct tracecmd_compression *handle, char *dst
  int tracecmd_compress_pread(struct tracecmd_compression *handle, char *dst, int len, off_t offset);
  int tracecmd_compress_buffer_write(struct tracecmd_compression *handle,
  				   const void *data, unsigned long long size);
@@ -682,7 +682,7 @@ index 0b2de710..3a555c36 100644
  
  	close(fd);
 diff --git a/lib/trace-cmd/trace-output.c b/lib/trace-cmd/trace-output.c
-index bdec75d6..37bb3ec0 100644
+index 1c0f7b77..ad740d65 100644
 --- a/lib/trace-cmd/trace-output.c
 +++ b/lib/trace-cmd/trace-output.c
 @@ -112,7 +112,7 @@ do_write_check(struct tracecmd_output *handle, const void *data, long long size)
@@ -703,7 +703,7 @@ index bdec75d6..37bb3ec0 100644
  }
  
  static inline int do_preed(struct tracecmd_output *handle, void *dst, int len, off_t offset)
-@@ -518,12 +518,12 @@ out_write_section_header(struct tracecmd_output *handle, unsigned short header_i
+@@ -526,12 +526,12 @@ out_write_section_header(struct tracecmd_output *handle, unsigned short header_i
  	/* Section ID */
  	endian2 = convert_endian_2(handle, header_id);
  	if (do_write_check(handle, &endian2, 2))
@@ -718,7 +718,7 @@ index bdec75d6..37bb3ec0 100644
  
  	/* Section description */
  	if (description)
-@@ -532,13 +532,13 @@ out_write_section_header(struct tracecmd_output *handle, unsigned short header_i
+@@ -540,13 +540,13 @@ out_write_section_header(struct tracecmd_output *handle, unsigned short header_i
  		desc = -1;
  	endian4 = convert_endian_4(handle, desc);
  	if (do_write_check(handle, &endian4, 4))
@@ -734,7 +734,7 @@ index bdec75d6..37bb3ec0 100644
  	return offset;
  }
  
-@@ -559,13 +559,13 @@ __hidden int out_update_section_header(struct tracecmd_output *handle, tsize_t o
+@@ -567,13 +567,13 @@ __hidden int out_update_section_header(struct tracecmd_output *handle, tsize_t o
  	if (size < 8)
  		return -1;
  	size -= 8;
@@ -750,7 +750,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  	return 0;
  }
-@@ -587,7 +587,7 @@ static int save_string_section(struct tracecmd_output *handle, bool compress)
+@@ -595,7 +595,7 @@ static int save_string_section(struct tracecmd_output *handle, bool compress)
  	if (compress)
  		flags |= TRACECMD_SEC_FL_COMPRESS;
  	offset = out_write_section_header(handle, TRACECMD_OPTION_STRINGS, "strings", flags, false);
@@ -759,7 +759,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  
  	out_compression_start(handle, compress);
-@@ -637,7 +637,7 @@ static int read_header_files(struct tracecmd_output *handle, bool compress)
+@@ -645,7 +645,7 @@ static int read_header_files(struct tracecmd_output *handle, bool compress)
  		flags |= TRACECMD_SEC_FL_COMPRESS;
  	offset = out_write_section_header(handle, TRACECMD_OPTION_HEADER_INFO,
  					  "headers", flags, true);
@@ -768,7 +768,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  
  	out_compression_start(handle, compress);
-@@ -965,7 +965,7 @@ static int read_ftrace_files(struct tracecmd_output *handle, bool compress)
+@@ -973,7 +973,7 @@ static int read_ftrace_files(struct tracecmd_output *handle, bool compress)
  		flags |= TRACECMD_SEC_FL_COMPRESS;
  	offset = out_write_section_header(handle, TRACECMD_OPTION_FTRACE_EVENTS,
  					  "ftrace events", flags, true);
@@ -777,7 +777,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  
  	create_event_list_item(handle, &systems, &list);
-@@ -1024,7 +1024,7 @@ static int read_event_files(struct tracecmd_output *handle,
+@@ -1032,7 +1032,7 @@ static int read_event_files(struct tracecmd_output *handle,
  		flags |= TRACECMD_SEC_FL_COMPRESS;
  	offset = out_write_section_header(handle, TRACECMD_OPTION_EVENT_FORMATS,
  					  "events format", flags, true);
@@ -786,7 +786,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  	/*
  	 * If any of the list is the special keyword "all" then
-@@ -1138,7 +1138,7 @@ static int read_proc_kallsyms(struct tracecmd_output *handle, bool compress)
+@@ -1146,7 +1146,7 @@ static int read_proc_kallsyms(struct tracecmd_output *handle, bool compress)
  		flags |= TRACECMD_SEC_FL_COMPRESS;
  	offset = out_write_section_header(handle, TRACECMD_OPTION_KALLSYMS,
  					  "kallsyms", flags, true);
@@ -795,7 +795,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  
  	out_compression_start(handle, compress);
-@@ -1202,7 +1202,7 @@ static int read_ftrace_printk(struct tracecmd_output *handle, bool compress)
+@@ -1210,7 +1210,7 @@ static int read_ftrace_printk(struct tracecmd_output *handle, bool compress)
  	if (compress)
  		flags |= TRACECMD_SEC_FL_COMPRESS;
  	offset = out_write_section_header(handle, TRACECMD_OPTION_PRINTK, "printk", flags, true);
@@ -804,7 +804,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  
  	out_compression_start(handle, compress);
-@@ -1247,8 +1247,8 @@ static int save_tracing_file_data(struct tracecmd_output *handle,
+@@ -1255,8 +1255,8 @@ static int save_tracing_file_data(struct tracecmd_output *handle,
  	unsigned long long endian8;
  	char *file = NULL;
  	struct stat st;
@@ -815,7 +815,7 @@ index bdec75d6..37bb3ec0 100644
  	int ret = -1;
  
  	file = get_tracing_file(handle, filename);
-@@ -1842,9 +1842,9 @@ static int write_options_v6(struct tracecmd_output *handle)
+@@ -1850,9 +1850,9 @@ static int write_options_v6(struct tracecmd_output *handle)
  	return 0;
  }
  
@@ -827,7 +827,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  	offset = convert_endian_8(handle, offset);
  	if (do_write_check(handle, &offset, 8))
-@@ -1867,7 +1867,7 @@ static int update_options_start(struct tracecmd_output *handle, off64_t offset)
+@@ -1875,7 +1875,7 @@ static int update_options_start(struct tracecmd_output *handle, off64_t offset)
   *
   * Returns zero on success and -1 on error.
   */
@@ -836,7 +836,7 @@ index bdec75d6..37bb3ec0 100644
  {
  	tsize_t curr;
  	int ret;
-@@ -1887,7 +1887,7 @@ int tracecmd_prepare_options(struct tracecmd_output *handle, off64_t offset, int
+@@ -1895,7 +1895,7 @@ int tracecmd_prepare_options(struct tracecmd_output *handle, off64_t offset, int
  		break;
  	case SEEK_END:
  		offset = do_lseek(handle, offset, SEEK_END);
@@ -845,7 +845,7 @@ index bdec75d6..37bb3ec0 100644
  			return -1;
  		break;
  	}
-@@ -2059,7 +2059,7 @@ __hidden void *trace_get_options(struct tracecmd_output *handle, size_t *len)
+@@ -2067,7 +2067,7 @@ __hidden void *trace_get_options(struct tracecmd_output *handle, size_t *len)
  	if (!buf)
  		goto out;
  
@@ -854,7 +854,7 @@ index bdec75d6..37bb3ec0 100644
  		goto out;
  	*len = read(msg_handle.cfd, buf, offset);
  	if (*len != offset) {
-@@ -2270,7 +2270,7 @@ int tracecmd_write_cmdlines(struct tracecmd_output *handle)
+@@ -2278,7 +2278,7 @@ int tracecmd_write_cmdlines(struct tracecmd_output *handle)
  		flags |= TRACECMD_SEC_FL_COMPRESS;
  	offset = out_write_section_header(handle, TRACECMD_OPTION_CMDLINES,
  					  "command lines", flags, true);
@@ -863,7 +863,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  
  	out_compression_start(handle, compress);
-@@ -2519,7 +2519,7 @@ static int update_buffer_cpu_offset_v6(struct tracecmd_output *handle,
+@@ -2527,7 +2527,7 @@ static int update_buffer_cpu_offset_v6(struct tracecmd_output *handle,
  	current = do_lseek(handle, 0, SEEK_CUR);
  
  	/* Go to the option data, where will write the offest */
@@ -872,7 +872,7 @@ index bdec75d6..37bb3ec0 100644
  		tracecmd_warning("could not seek to %lld", b_offset);
  		return -1;
  	}
-@@ -2528,7 +2528,7 @@ static int update_buffer_cpu_offset_v6(struct tracecmd_output *handle,
+@@ -2536,7 +2536,7 @@ static int update_buffer_cpu_offset_v6(struct tracecmd_output *handle,
  		return -1;
  
  	/* Go back to end of file */
@@ -881,7 +881,7 @@ index bdec75d6..37bb3ec0 100644
  		tracecmd_warning("could not seek to %lld", offset);
  		return -1;
  	}
-@@ -2652,7 +2652,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+@@ -2660,7 +2660,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
  		data_files[i].data_offset &= ~(page_size - 1);
  
  		ret = do_lseek(handle, data_files[i].data_offset, SEEK_SET);
@@ -890,7 +890,7 @@ index bdec75d6..37bb3ec0 100644
  			goto out_free;
  
  		if (!tracecmd_get_quiet(handle))
-@@ -2660,7 +2660,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+@@ -2668,7 +2668,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
  				i, (unsigned long long)data_files[i].data_offset);
  
  		if (data[i].size) {
@@ -899,7 +899,7 @@ index bdec75d6..37bb3ec0 100644
  				goto out_free;
  			read_size = out_copy_fd_compress(handle, data[i].fd,
  							 data[i].size, &data_files[i].write_size,
-@@ -2678,19 +2678,19 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+@@ -2686,19 +2686,19 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
  
  		if (!HAS_SECTIONS(handle)) {
  			/* Write the real CPU data offset in the file */
@@ -922,7 +922,7 @@ index bdec75d6..37bb3ec0 100644
  				goto out_free;
  		}
  		if (!tracecmd_get_quiet(handle)) {
-@@ -2709,7 +2709,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
+@@ -2717,7 +2717,7 @@ __hidden int out_write_cpu_data(struct tracecmd_output *handle,
  		goto out_free;
  
  	free(data_files);
@@ -931,7 +931,7 @@ index bdec75d6..37bb3ec0 100644
  		return -1;
  
  	if (out_update_section_header(handle, offset))
-@@ -2978,7 +2978,7 @@ __hidden int out_save_options_offset(struct tracecmd_output *handle, unsigned lo
+@@ -2986,7 +2986,7 @@ __hidden int out_save_options_offset(struct tracecmd_output *handle, unsigned lo
  			return -1;
  
  		new = do_lseek(handle, 0, SEEK_CUR);
@@ -940,7 +940,7 @@ index bdec75d6..37bb3ec0 100644
  			return -1;
  
  		en8 = convert_endian_8(handle, start);
-@@ -2986,7 +2986,7 @@ __hidden int out_save_options_offset(struct tracecmd_output *handle, unsigned lo
+@@ -2994,7 +2994,7 @@ __hidden int out_save_options_offset(struct tracecmd_output *handle, unsigned lo
  			return -1;
  
  		handle->options_start = new;
@@ -950,7 +950,7 @@ index bdec75d6..37bb3ec0 100644
  	} else {
  		handle->options_start = start;
 diff --git a/lib/trace-cmd/trace-recorder.c b/lib/trace-cmd/trace-recorder.c
-index f387091f..a5ac8be3 100644
+index 23499f30..c172ad64 100644
 --- a/lib/trace-cmd/trace-recorder.c
 +++ b/lib/trace-cmd/trace-recorder.c
 @@ -51,7 +51,7 @@ static int append_file(int size, int dst, int src)
diff --git a/meta-oe/recipes-kernel/trace-cmd/files/0002-Drop-using-_LARGEFILE64_SOURCE.patch b/meta-oe/recipes-kernel/trace-cmd/files/0002-Drop-using-_LARGEFILE64_SOURCE.patch
new file mode 100644
index 0000000000..7b2ea79eb3
--- /dev/null
+++ b/meta-oe/recipes-kernel/trace-cmd/files/0002-Drop-using-_LARGEFILE64_SOURCE.patch
@@ -0,0 +1,145 @@
+From 47005e155c291ee6a2460cbf9eee604997e87063 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 9 Jan 2023 14:48:49 -0800
+Subject: [PATCH 2/2] Drop using _LARGEFILE64_SOURCE
+
+Its no longer needed since we have dropped using LF64 interfaces
+
+Upstream-Status: Submitted [https://lore.kernel.org/linux-trace-devel/20230109225315.1284538-2-raj.khem@gmail.com/T/#u]
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+---
+ lib/trace-cmd/trace-input.c    | 1 -
+ lib/trace-cmd/trace-output.c   | 1 -
+ lib/trace-cmd/trace-recorder.c | 1 -
+ tracecmd/trace-hist.c          | 1 -
+ tracecmd/trace-listen.c        | 1 -
+ tracecmd/trace-mem.c           | 1 -
+ tracecmd/trace-profile.c       | 1 -
+ tracecmd/trace-read.c          | 1 -
+ tracecmd/trace-restore.c       | 1 -
+ tracecmd/trace-split.c         | 1 -
+ 10 files changed, 10 deletions(-)
+
+diff --git a/lib/trace-cmd/trace-input.c b/lib/trace-cmd/trace-input.c
+index 9b128403..3dd13ce4 100644
+--- a/lib/trace-cmd/trace-input.c
++++ b/lib/trace-cmd/trace-input.c
+@@ -3,7 +3,6 @@
+  * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
+  *
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <stdbool.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/lib/trace-cmd/trace-output.c b/lib/trace-cmd/trace-output.c
+index ad740d65..eee847e3 100644
+--- a/lib/trace-cmd/trace-output.c
++++ b/lib/trace-cmd/trace-output.c
+@@ -3,7 +3,6 @@
+  * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
+  *
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <dirent.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/lib/trace-cmd/trace-recorder.c b/lib/trace-cmd/trace-recorder.c
+index c172ad64..70ce52e2 100644
+--- a/lib/trace-cmd/trace-recorder.c
++++ b/lib/trace-cmd/trace-recorder.c
+@@ -3,7 +3,6 @@
+  * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
+  *
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <fcntl.h>
+diff --git a/tracecmd/trace-hist.c b/tracecmd/trace-hist.c
+index efb790ac..62fe4f9b 100644
+--- a/tracecmd/trace-hist.c
++++ b/tracecmd/trace-hist.c
+@@ -5,7 +5,6 @@
+  * Several of the ideas in this file came from Arnaldo Carvalho de Melo's
+  * work on the perf ui.
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <dirent.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tracecmd/trace-listen.c b/tracecmd/trace-listen.c
+index 86d2b9e9..e95c5711 100644
+--- a/tracecmd/trace-listen.c
++++ b/tracecmd/trace-listen.c
+@@ -3,7 +3,6 @@
+  * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
+  *
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <dirent.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tracecmd/trace-mem.c b/tracecmd/trace-mem.c
+index 25eb0861..3e1ac9f3 100644
+--- a/tracecmd/trace-mem.c
++++ b/tracecmd/trace-mem.c
+@@ -11,7 +11,6 @@
+  * was written for the newer version. I decided to do some of it here
+  * in C.
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <dirent.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tracecmd/trace-profile.c b/tracecmd/trace-profile.c
+index 6a2cc3d0..d12a0e5e 100644
+--- a/tracecmd/trace-profile.c
++++ b/tracecmd/trace-profile.c
+@@ -5,7 +5,6 @@
+  */
+ 
+ /** FIXME: Convert numbers based on machine and file */
+-#define _LARGEFILE64_SOURCE
+ #include <stdio.h>
+ #include <stdlib.h>
+ #include <string.h>
+diff --git a/tracecmd/trace-read.c b/tracecmd/trace-read.c
+index c094ad6a..52ba818e 100644
+--- a/tracecmd/trace-read.c
++++ b/tracecmd/trace-read.c
+@@ -3,7 +3,6 @@
+  * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
+  *
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <dirent.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tracecmd/trace-restore.c b/tracecmd/trace-restore.c
+index 5bf29c52..e9ca3225 100644
+--- a/tracecmd/trace-restore.c
++++ b/tracecmd/trace-restore.c
+@@ -3,7 +3,6 @@
+  * Copyright (C) 2009, 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
+  *
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <dirent.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+diff --git a/tracecmd/trace-split.c b/tracecmd/trace-split.c
+index 851ec94e..1daa847d 100644
+--- a/tracecmd/trace-split.c
++++ b/tracecmd/trace-split.c
+@@ -3,7 +3,6 @@
+  * Copyright (C) 2010 Red Hat Inc, Steven Rostedt <srostedt@redhat.com>
+  *
+  */
+-#define _LARGEFILE64_SOURCE
+ #include <dirent.h>
+ #include <stdio.h>
+ #include <stdlib.h>
+-- 
+2.39.0
+
diff --git a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
index 50d73df03a..d8909bd690 100644
--- a/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
+++ b/meta-oe/recipes-kernel/trace-cmd/trace-cmd_3.1.5.bb
@@ -8,6 +8,7 @@ LIC_FILES_CHKSUM = " \
 
 SRC_URI = "git://git.kernel.org/pub/scm/linux/kernel/git/rostedt/trace-cmd.git;branch=master \
            file://0001-Replace-LFS64-interfaces-off64_t-and-lseek64.patch \
+           file://0002-Drop-using-_LARGEFILE64_SOURCE.patch \
            file://0001-Do-not-emit-useless-rpath.patch"
 SRCREV = "18233e4c32857cb7ddd4960beeec8360ed834fc5"
 
-- 
2.39.0


