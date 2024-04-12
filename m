Return-Path: <rsangam@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F63BC4345F
	for <webhook@archiver.kernel.org>; Fri, 12 Apr 2024 06:59:51 +0000 (UTC)
Received: from mail-ot1-f43.google.com (mail-ot1-f43.google.com [209.85.210.43])
 by mx.groups.io with SMTP id smtpd.web10.40990.1712905187344513323
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 11 Apr 2024 23:59:47 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=f7LYCTTn;
 spf=pass (domain: mvista.com, ip: 209.85.210.43, mailfrom: rsangam@mvista.com)
Received: by mail-ot1-f43.google.com with SMTP id 46e09a7af769-6ea1c0afd8eso331064a34.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 11 Apr 2024 23:59:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1712905186; x=1713509986; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=G6DyzcPOo8SwqseRkq8v10TcLeoCxov3NLLsdL39ovc=;
        b=f7LYCTTnoRf0dlg5ZSxEcMlUEYyYRYaN2PlGURstzSXCtE4t/LVX/AzCdmN0vjfruC
         oPkPsSWMXcLenlzn7TfXnQi/kSeEtrLN9T6hvppnP2G4y8dZ990mxhu2tkgH2rImdZ1B
         Iz47IhDTegApCx6TkFf/JWBoKEz73Yz5MF/xA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712905186; x=1713509986;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G6DyzcPOo8SwqseRkq8v10TcLeoCxov3NLLsdL39ovc=;
        b=uhf/NnjPX00x6Z4qoYJDixUOWbHMwdRYH/XQEwdXwnbZkZogY9on7Cjkl73uRWyi60
         aXiI3O+4pUFfwKQyDF10jqDE/xdSTJYofvrL0Zuks8pwnJXZM7rKafEkpWn5kIu5ZDGW
         qlMHH+DLqs2mYoQ3B3UzHOCUzz+/mDUbrTzR5OtrXWLLbspmIgEH3KNhTWktc9soy2ha
         DC/+RttkDCNfW3AReVoaUVwHoxmWS3LAfDpg9kzyMqu4kgKZcB7ucmzQb1ai2Tbfj+Ug
         dClXpYRTg0eQH93cW1c5RGfKwAiCEPtjBKzwDAFADVS6HN+W3KVicqASLm8rnzfhRu5K
         zHjQ==
X-Gm-Message-State: AOJu0Yx31Gej7T0JM9IfpGieymC91C3/vWW0wQVCE8oENieaBwFi9gEl
	TgjmxflvlEW9ltHK2hIDszbDmrbCPrQCnUd+dkhvuCV22061jv4wJ0MWE2OhXIp5WKvR0GIFync
	l
X-Google-Smtp-Source: AGHT+IGzrhZRSpi1ItwS4i46bkFO1p48azoDKANF8HDcvMNjuE4/dKywWW8utAJDoOuP4yqlUT+g8g==
X-Received: by 2002:a05:6830:1315:b0:6ea:2f91:ef2d with SMTP id p21-20020a056830131500b006ea2f91ef2dmr1840919otq.4.1712905185741;
        Thu, 11 Apr 2024 23:59:45 -0700 (PDT)
Received: from MVIN00040.mvista.com ([49.207.200.214])
        by smtp.gmail.com with ESMTPSA id c31-20020a631c5f000000b005dc9439c56bsm2099672pgm.13.2024.04.11.23.59.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Apr 2024 23:59:45 -0700 (PDT)
From: Rohini Sangam <rsangam@mvista.com>
To: openembedded-devel@lists.openembedded.org
Cc: Rohini Sangam <rsangam@mvista.com>,
	Siddharth Doshi <sdoshi@mvista.com>
Subject: [meta-oe][kirkstone][PATCH] xterm: Security fix for CVE-2023-40359
Date: Fri, 12 Apr 2024 12:29:37 +0530
Message-Id: <20240412065937.154652-1-rsangam@mvista.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Fri, 12 Apr 2024 06:59:51 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/109936

CVE fixed:
- CVE-2023-40359 xterm: ReGIS reporting for character-set names containing characters other than alphanumerics or underscore
Upstream-Status: Backport from https://github.com/ThomasDickey/xterm-snapshots/commit/41ba5cf31da5e43477811b28009d64d3f643fd29

Note: The CVE patch is part of minor version-up and is extracted from the snapshot of xterm-379c.
Documentation of the commit shows 2 different overflows being fixed and hence the fix was extracted from the commit.

Signed-off-by: Rohini Sangam <rsangam@mvista.com>
Signed-off-by: Siddharth Doshi <sdoshi@mvista.com>
---
 .../xorg-app/xterm/CVE-2023-40359.patch       | 388 ++++++++++++++++++
 .../recipes-graphics/xorg-app/xterm_372.bb    |   1 +
 2 files changed, 389 insertions(+)
 create mode 100644 meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch

diff --git a/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch
new file mode 100644
index 000000000..342a8d872
--- /dev/null
+++ b/meta-oe/recipes-graphics/xorg-app/xterm/CVE-2023-40359.patch
@@ -0,0 +1,388 @@
+From 41ba5cf31da5e43477811b28009d64d3f643fd29 Mon Sep 17 00:00:00 2001
+From: "Thomas E. Dickey" <dickey@invisible-island.net>
+Date: Wed, 8 Mar 2023 01:06:03 +0000
+Subject: [PATCH] snapshot of project "xterm", label xterm-379c
+
+Upstream-Status: Backport from https://github.com/ThomasDickey/xterm-snapshots/commit/41ba5cf31da5e43477811b28009d64d3f643fd29
+CVE: CVE-2023-40359
+
+Signed-off-by: Rohini Sangam <rsangam@mvista.com>
+
+---
+ graphics_regis.c | 235 +++++++++++++++++++++++++++--------------------
+ 1 file changed, 133 insertions(+), 102 deletions(-)
+
+diff --git a/graphics_regis.c b/graphics_regis.c
+index 479bb79..cf14437 100644
+--- a/graphics_regis.c
++++ b/graphics_regis.c
+@@ -1,8 +1,8 @@
+-/* $XTermId: graphics_regis.c,v 1.129 2022/02/21 13:33:08 tom Exp $ */
++/* $XTermId: graphics_regis.c,v 1.139 2023/03/08 01:06:03 tom Exp $ */
+ 
+ /*
+- * Copyright 2014-2021,2022 by Ross Combs
+- * Copyright 2014-2021,2022 by Thomas E. Dickey
++ * Copyright 2014-2022,2023 by Ross Combs
++ * Copyright 2014-2022,2023 by Thomas E. Dickeiy
+  *
+  *                         All Rights Reserved
+  *
+@@ -119,6 +119,14 @@ typedef struct RegisTextControls {
+     int       slant; /* for italic/oblique */
+ } RegisTextControls;
+ 
++#define S_QUOTE '\''
++#define D_QUOTE '"'
++
++#define isQuote(ch)   ((ch) == S_QUOTE || (ch) == D_QUOTE)
++#define PickQuote(ch) ((ch) == S_QUOTE ? D_QUOTE : S_QUOTE)
++
++#define isName(c) ((c) == '_' || isalnum(CharOf(c)))
++
+ #define FixedCopy(dst, src, len) strncpy(dst, src, len - 1)[len - 1] = '\0'
+ #define CopyFontname(dst, src) FixedCopy(dst, src, (size_t) REGIS_FONTNAME_LEN)
+ 
+@@ -538,8 +546,8 @@ draw_or_save_patterned_pixel(RegisGraphicsContext *context, int x, int y)
+ static int
+ sort_points(void const *l, void const *r)
+ {
+-    RegisPoint const *const lp = l;
+-    RegisPoint const *const rp = r;
++    RegisPoint const *const lp = (RegisPoint const *) l;
++    RegisPoint const *const rp = (RegisPoint const *) r;
+ 
+     if (lp->y < rp->y)
+ 	return -1;
+@@ -3151,6 +3159,37 @@ extract_regis_command(RegisDataFragment *input, char *command)
+     return 1;
+ }
+ 
++/*
++ *  * Check a ReGIS alphabet name before reporting it, to pick an appropriate
++ *   * delimiter.  If the string is empty, or contains nonreportable characters,
++ *    * just return NUL.
++ *     */
++static int
++pick_quote(const char *value)
++{
++    Bool s_quote = False;
++    Bool d_quote = False;
++
++    if (*value != '\0') {
++	while (*value != '\0') {
++	    int ch = CharOf(*value++);
++	    if (ch == D_QUOTE)
++		d_quote = True;
++	    else if (ch == S_QUOTE)
++		s_quote = True;
++	    else if (!isName(ch))
++		s_quote = d_quote = True;
++	}
++    } else {
++	s_quote = d_quote = True;
++    }
++    return ((s_quote && d_quote)
++	    ? 0
++	    : (s_quote
++	       ? D_QUOTE
++	       : S_QUOTE));
++}
++
+ static int
+ extract_regis_string(RegisDataFragment *input, char *out, unsigned maxlen)
+ {
+@@ -3166,7 +3205,7 @@ extract_regis_string(RegisDataFragment *input, char *out, unsigned maxlen)
+ 	return 0;
+ 
+     ch = peek_fragment(input);
+-    if (ch != '\'' && ch != '"')
++    if (!isQuote(ch))
+ 	return 0;
+     open_quote_ch = ch;
+     outlen = 0U;
+@@ -3246,7 +3285,7 @@ extract_regis_parenthesized_data(RegisDataFragment *input,
+     for (; input->pos < input->len; input->pos++, output->len++) {
+ 	char prev_ch = ch;
+ 	ch = input->start[input->pos];
+-	if (ch == '\'' || ch == '"') {
++	if (isQuote(ch)) {
+ 	    if (open_quote_ch == '\0') {
+ 		open_quote_ch = ch;
+ 	    } else {
+@@ -3314,7 +3353,7 @@ extract_regis_option(RegisDataFragment *input,
+     if (ch == ';' || ch == ',' ||
+ 	ch == '(' || ch == ')' ||
+ 	ch == '[' || ch == ']' ||
+-	ch == '"' || ch == '\'' ||
++	isQuote(ch) ||
+ 	isdigit(CharOf(ch))) {
+ 	return 0;
+     }
+@@ -3330,7 +3369,7 @@ extract_regis_option(RegisDataFragment *input,
+ 	TRACE(("looking at char '%c' in option '%c'\n", ch, *option));
+ 	/* FIXME: any special rules for commas? */
+ 	/* FIXME: handle escaped quotes */
+-	if (ch == '\'' || ch == '"') {
++	if (isQuote(ch)) {
+ 	    if (open_quote_ch == ch) {
+ 		open_quote_ch = '\0';
+ 	    } else {
+@@ -5008,6 +5047,7 @@ parse_regis_command(RegisParseState *state)
+ static int
+ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ {
++    XtermWidget xw = context->display_graphic->xw;
+     RegisDataFragment optionarg;
+ 
+     if (!extract_regis_option(&state->input, &state->option, &optionarg))
+@@ -5586,13 +5626,18 @@ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ 		       state->option, fragment_to_tempstr(&optionarg)));
+ 		break;
+ 	    } {
+-		char reply[64];
++		unsigned err_code = 0U;
++		unsigned err_char = 0U;
+ 
+ 		TRACE(("got report last error condition\n"));
+ 		/* FIXME: implement after adding error tracking */
+-		sprintf(reply, "\"%u,%u\"\r", 0U, 0U);
+-		unparseputs(context->display_graphic->xw, reply);
+-		unparse_end(context->display_graphic->xw);
++		unparseputc(xw, D_QUOTE);
++		unparseputn(xw, err_code);
++		unparseputc(xw, ',');
++		unparseputn(xw, err_char);
++		unparseputc(xw, D_QUOTE);
++		unparseputc(xw, '\r');
++		unparse_end(xw);
+ 	    }
+ 	    break;
+ 	case 'I':
+@@ -5639,8 +5684,8 @@ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ 		/* FIXME: implement arrow key movement */
+ 		/* FIXME: implement button/key collection */
+ 
+-		unparseputs(context->display_graphic->xw, "\r");
+-		unparse_end(context->display_graphic->xw);
++                unparseputc(xw, '\r');
++		unparse_end(xw);
+ 
+ 		skip_regis_whitespace(&optionarg);
+ 		if (!fragment_consumed(&optionarg)) {
+@@ -5657,25 +5702,22 @@ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ 	    if (!fragment_consumed(&optionarg)) {
+ 		TRACE(("DATA_ERROR: unexpected arguments to ReGIS report command option '%c' arg \"%s\"\n",
+ 		       state->option, fragment_to_tempstr(&optionarg)));
+-		break;
+-	    } {
+-		char buffer[32];
+-
+-		if (state->load_index == MAX_REGIS_ALPHABETS) {
+-		    /* If this happens something went wrong elsewhere. */
+-		    TRACE(("DATA_ERROR: unable to report current load alphabet\n"));
+-		    unparseputs(context->display_graphic->xw, "A0\"\"\r");
+-		    unparse_end(context->display_graphic->xw);
+-		    break;
++	    } else if (state->load_index == MAX_REGIS_ALPHABETS) {
++		/* If this happens something went wrong elsewhere. */
++		TRACE(("DATA_ERROR: unable to report current load alphabet\n"));
++		unparseputs(xw, "A0\"\"\r");
++		unparse_end(xw);
++	    } else {
++		int delim = pick_quote(state->load_name);
++		if (delim != '\0') {
++		    unparseputs(xw, "A");
++		    unparseputn(xw, state->load_alphabet);
++		    unparseputc(xw, delim);
++		    unparseputs(xw, state->load_name);
++		    unparseputc(xw, delim);
+ 		}
+-
+-		unparseputs(context->display_graphic->xw, "A");
+-		sprintf(buffer, "%u", state->load_alphabet);
+-		unparseputs(context->display_graphic->xw, buffer);
+-		unparseputs(context->display_graphic->xw, "\"");
+-		unparseputs(context->display_graphic->xw, state->load_name);
+-		unparseputs(context->display_graphic->xw, "\"\r");
+-		unparse_end(context->display_graphic->xw);
++		unparseputc(xw, '\r');
++		unparse_end(xw);
+ 	    }
+ 	    break;
+ 	case 'M':
+@@ -5717,13 +5759,18 @@ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ 		}
+ 
+ 		if (name == '=') {
+-		    char reply[64];
++		    unsigned max_available = 1000U;
++		    unsigned cur_available = max_available;
+ 
+ 		    TRACE(("got report macrograph storage request\n"));
+ 		    /* FIXME: Implement when macrographs are supported. */
+-		    sprintf(reply, "\"%u,%u\"\r", 1000U, 1000U);
+-		    unparseputs(context->display_graphic->xw, reply);
+-		    unparse_end(context->display_graphic->xw);
++		    unparseputc(xw, D_QUOTE);
++		    unparseputn(xw, cur_available);
++		    unparseputc(xw, ',');
++		    unparseputn(xw, max_available);
++		    unparseputc(xw, D_QUOTE);
++		    unparseputc(xw, '\r');
++		    unparse_end(xw);
+ 		} else if (name < 'A' || name > 'Z') {
+ 		    TRACE(("DATA_ERROR: invalid macrograph name: \"%c\"\n", name));
+ 		    /* FIXME: what should happen? */
+@@ -5732,12 +5779,13 @@ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ 		    char temp[8];
+ 
+ 		    TRACE(("got report macrograph request for name '%c'\n", name));
+-		    sprintf(temp, "@=%c", name);
+-		    unparseputs(context->display_graphic->xw, temp);
++		    unparseputs(xw, "@=");
++		    unparseputc(xw, name);
+ 		    /* FIXME: Allow this to be disabled for security reasons. */
+ 		    /* FIXME: implement when macrographs are supported. */
+-		    unparseputs(context->display_graphic->xw, "@;\r");
+-		    unparse_end(context->display_graphic->xw);
++		    unparseputs(xw, "@;");
++		    unparseputc(xw, '\r');
++		    unparse_end(xw);
+ 		}
+ 	    }
+ 	    break;
+@@ -5785,78 +5833,61 @@ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ 		TRACE(("got report cursor position (output=%d)\n", output));
+ 
+ 		/* FIXME: look into supporting ANSI locator reports (DECLRP) */
++                unparseputc(xw, L_BLOK);
+ 		if (output == 1) {
+-		    char reply[64];
++		    /* FIXME: verify in absolute, not user, coordinates */
++		    unparseputn(xw, (unsigned) context->graphics_output_cursor_x);
++		    unparseputc(xw, ',');
++		    unparseputn(xw, (unsigned) context->graphics_output_cursor_y);
++		} else if (context->multi_input_mode) {
++		    /* FIXME: track input coordinates */
++		    unsigned x = 0, y = 0;	/* placeholders */
++
++                    /* send CSI240~[x,y]\r with current input cursor location */
++
++		    /* FIXME: verify no leading char or button sequence */
++		    /* FIXME: should we ever send an eight-bit CSI? */
+ 
+ 		    /* FIXME: verify in absolute, not user, coordinates */
+-		    sprintf(reply, "[%d,%d]\r",
+-			    context->graphics_output_cursor_x,
+-			    context->graphics_output_cursor_y);
+-		    unparseputs(context->display_graphic->xw, reply);
+-		    unparse_end(context->display_graphic->xw);
++		    TRACE(("sending multi-mode input report at %u,%u\n", x, y));
++		    unparseputn(xw, x);
++		    unparseputc(xw, ',');
++		    unparseputn(xw, y);
+ 		} else {
+-		    char reply[64];
+-		    int x, y;
+-
+-		    if (context->multi_input_mode) {
+-			/* FIXME: track input coordinates */
+-			x = y = 0;	/* placeholders */
+-
+-			/* send CSI240~[x,y]\r with current input cursor location */
+-
+-			/* FIXME: verify no leading char or button sequence */
+-			/* FIXME: should we ever send an eight-bit CSI? */
+-			/* FIXME: verify in absolute, not user, coordinates */
+-			TRACE(("sending multi-mode input report at %d,%d\n",
+-			       x, y));
+-			sprintf(reply, "[%d,%d]\r", x, y);
+-			unparseputs(context->display_graphic->xw, reply);
+-			unparse_end(context->display_graphic->xw);
+-			break;
+-		    } else {
+-			char ch;
+-
+-			/* FIXME: wait for first non-arrow keypress or mouse click, and don't update graphics while waiting */
+-			ch = ' ';	/* placeholder */
+-			x = y = 0;	/* placeholders */
+-
+-			/* send <key or button>[x,y]\r to report input cursor location */
+-
+-			/* null button: CSI240~ */
+-			/* left button: CSI241~ */
+-			/* middle button: CSI243~ */
+-			/* right button: CSI245~ */
+-			/* extra button: CSI247~ */
+-			/* FIXME: support DECLBD to change button assignments */
+-			/* FIXME: verify no leading char or button sequence */
+-			TRACE(("sending one-shot input report with %c at %d,%d\n",
+-			       ch, x, y));
+-#if 0				/* FIXME - dead code */
+-			if (ch == '\r') {
+-			    /* Return only reports the location. */
+-			    sprintf(reply, "[%d,%d]\r", x, y);
+-			} else if (ch == '\177') {
+-			    /* DEL exits locator mode reporting nothing. */
+-			    sprintf(reply, "\r");
+-			} else
+-#endif
+-			{
+-			    sprintf(reply, "%c[%d,%d]\r", ch, x, y);
+-			}
+-			unparseputs(context->display_graphic->xw, reply);
+-			unparse_end(context->display_graphic->xw);
+-			/* FIXME: exit one-shot mode and disable input cursor */
+-			break;
++
++		    char ch = ' ';	/* placeholder */
++		    unsigned x = 0, y = 0;	/* placeholders */
++
++		    /* FIXME: wait for first non-arrow keypress or mouse click, and don't update graphics while waiting */
++		    /* send <key or button>[x,y]\r to report input cursor location */
++
++		    /* null button: CSI240~ */
++		    /* left button: CSI241~ */
++		    /* middle button: CSI243~ */
++		    /* right button: CSI245~ */
++		    /* extra button: CSI247~ */
++		    /* FIXME: support DECLBD to change button assignments */
++		    /* FIXME: verify no leading char or button sequence */
++		    TRACE(("sending one-shot input report with %c at %u,%u\n",
++			   ch, x, y));
++		    if (ch != '\177') {
++			unparseputn(xw, x);
++			unparseputc(xw, ',');
++			unparseputn(xw, y);
+ 		    }
++                    /* FIXME: exit one-shot mode and disable input cursor */
+ 		}
++                unparseputc(xw, R_BLOK);
++		unparseputc(xw, '\r');
++		unparse_end(xw);
+ 	    }
+ 	    break;
+ 	default:
+ 	    TRACE(("DATA_ERROR: sending empty report for unknown ReGIS report command option '%c' arg \"%s\"\n",
+ 		   state->option, fragment_to_tempstr(&optionarg)));
+ 	    /* Unknown report request types must receive empty reports. */
+-	    unparseputs(context->display_graphic->xw, "\r");
+-	    unparse_end(context->display_graphic->xw);
++	    unparseputs(xw, "\r");
++	    unparse_end(xw);
+ 	    break;
+ 	}
+ 	break;
+@@ -6154,7 +6185,7 @@ parse_regis_option(RegisParseState *state, RegisGraphicsContext *context)
+ 
+ 		TRACE(("using display page number: %d\n", page));
+ 		context->display_page = (unsigned) page;
+-		map_regis_graphics_pages(context->display_graphic->xw, context);
++		map_regis_graphics_pages(xw, context);
+ 	    }
+ 	    break;
+ 	case 'T':
+-- 
+2.35.7
+
diff --git a/meta-oe/recipes-graphics/xorg-app/xterm_372.bb b/meta-oe/recipes-graphics/xorg-app/xterm_372.bb
index 223bc0a49..84308b184 100644
--- a/meta-oe/recipes-graphics/xorg-app/xterm_372.bb
+++ b/meta-oe/recipes-graphics/xorg-app/xterm_372.bb
@@ -7,6 +7,7 @@ LIC_FILES_CHKSUM = "file://xterm.h;beginline=3;endline=31;md5=5ec6748ed90e588caa
 SRC_URI = "http://invisible-mirror.net/archives/${BPN}/${BP}.tgz \
            file://0001-Add-configure-time-check-for-setsid.patch \
            file://CVE-2022-45063.patch \
+	    file://CVE-2023-40359.patch \
           "
 
 SRC_URI[sha256sum] = "c6d08127cb2409c3a04bcae559b7025196ed770bb7bf26630abcb45d95f60ab1"
-- 
2.34.1


