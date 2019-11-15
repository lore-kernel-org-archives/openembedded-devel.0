Return-Path: <raj.khem@gmail.com>
Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com
	[209.85.214.195])
	by mail.openembedded.org (Postfix) with ESMTP id B3B6C7C446
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 20:47:34 +0000 (UTC)
Received: by mail-pl1-f195.google.com with SMTP id j12so5451102plt.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 Nov 2019 12:47:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cj23QssI4EFyrwZP+lOSgqo7Y6OCtMcE5mj6QHUiF6g=;
	b=AE+meRMdjP+tejlohHYLzcV6SohW3fDOjpUhhYsTU7m5x8d55beFXZo2EAM0Ekyab9
	ETHUl6zjIoiEZBZvhA4zwFJE/xzQK1Nude6ovzSTxUhRXPVs5trOhYEzynT9iwt1Uted
	3sR2xcApMGjFuCyYix9kC2xphRp4GCBiNlEhAx0ddiGrAlmQynPfEsVZylKHNKE/0lDR
	wc3nhePzZAMPajefpUMuzQMA4FAWdUbMybe62w0NZklHoutMkNlXUKbFNW0DaF/yaVFA
	e15O2R/zoFwrnh/iIBhju8/iyxXTKQuIbSJw1cn/9xkuBfNc16nr/9/C1sxPX4N3uYq0
	SI6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=Cj23QssI4EFyrwZP+lOSgqo7Y6OCtMcE5mj6QHUiF6g=;
	b=AxPbILj6u+dulteChPxCmygU3aDjxi4rj0aokHu5Zegxj0yplXwfhF0DDWiTEafSxC
	Oj/nbG8Rzk/6FQjuQZRdcZaH4a7sgJlzzPwGC/oLMkfo/Cq9ptww+7H1Inh29kIb0cwA
	EXd4EUoKcMBx8ceAChotat/bG+o9xhGWDdQoE7wZgl7ZGojbneUx/bBS8P44HzCAc+yr
	VH1WRBi6v2OqdK3Omo1cB2UIz4CtWSsIqsJYD2JfLoVbnJves4VtGnBEwMkDU77U9Ngh
	H22Gz00NtxZfbJ2Oixydzh37SM/Mr/rbE2RBJsPepjSRK9cdPgBZ9QYswhUghnIt9Sdh
	RIGQ==
X-Gm-Message-State: APjAAAXKBCrlj0SZIiybulARaz+MvNPL0IDSKxV72iOyOwGIz8XWGv4P
	xCeRwHH1N7i+cpQN0tUb4POOhLHadoo=
X-Google-Smtp-Source: APXvYqxelxlBa0vcaNwyOHqZ9Impc4N1F1WYcXiXnxEXcmT19WbiA1bHDXhtNY8etYP+H4lCe9PBmA==
X-Received: by 2002:a17:902:6b01:: with SMTP id
	o1mr1857508plk.24.1573850855139; 
	Fri, 15 Nov 2019 12:47:35 -0800 (PST)
Received: from apollo.hsd1.ca.comcast.net ([2601:646:8500:1c20::30e8])
	by smtp.gmail.com with ESMTPSA id s15sm6524246pjp.3.2019.11.15.12.47.33
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 15 Nov 2019 12:47:34 -0800 (PST)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Fri, 15 Nov 2019 12:47:20 -0800
Message-Id: <20191115204720.1294151-1-raj.khem@gmail.com>
X-Mailer: git-send-email 2.24.0
MIME-Version: 1.0
Subject: [meta-gnome][PATCH] evince: Fix build with clang
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
X-List-Received-Date: Fri, 15 Nov 2019 20:47:35 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Enhance the patch for printf format checking to make clang work as well

Signed-off-by: Khem Raj <raj.khem@gmail.com>
Cc: Andreas Müller <schnitzeltony@gmail.com>
---
 ...002-add-a-formatting-attribute-check.patch | 96 ++++++++++++++++++-
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch b/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
index e87da90bce..c374fc9430 100644
--- a/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
+++ b/meta-gnome/recipes-gnome/evince/evince/0002-add-a-formatting-attribute-check.patch
@@ -19,16 +19,104 @@ Signed-off-by: Khem Raj <raj.khem@gmail.com>
  cut-n-paste/unarr/common/unarr.c | 2 +-
  1 file changed, 1 insertion(+), 1 deletion(-)
 
-diff --git a/cut-n-paste/unarr/common/unarr.c b/cut-n-paste/unarr/common/unarr.c
-index 97ec92a..9e6e3ad 100644
 --- a/cut-n-paste/unarr/common/unarr.c
 +++ b/cut-n-paste/unarr/common/unarr.c
-@@ -92,7 +92,7 @@ size_t ar_get_global_comment(ar_archive *ar, void *buffer, size_t count)
+@@ -92,7 +92,7 @@ size_t ar_get_global_comment(ar_archive
      return ar->get_comment(ar, buffer, count);
  }
  
 -void ar_log(const char *prefix, const char *file, int line, const char *msg, ...)
-+void __attribute__((__format__ (__printf__, 4, 0))) ar_log(const char *prefix, const char *file, int line, const char *msg, ...)
++void __attribute__((__format__ (__printf__, 4, 5))) ar_log(const char *prefix, const char *file, int line, const char *msg, ...)
  {
      va_list args;
      va_start(args, msg);
+--- a/cut-n-paste/synctex/synctex_parser_utils.c
++++ b/cut-n-paste/synctex/synctex_parser_utils.c
+@@ -87,11 +87,11 @@ void _synctex_free(void * ptr) {
+ #   include <syslog.h>
+ #endif
+ 
+-int _synctex_error(const char * reason, ...) __attribute__((__format__ (__printf__, 1, 2)));
+-int _synctex_log(int level, const char * prompt, const char * reason, va_list arg) __attribute__((__format__ (__printf__, 3, 0)));
+-
+-int _synctex_log(int level, const char * prompt, const char * reason,va_list arg) {
++static int _synctex_log(int level, const char * prompt, const char * reason, ...) SYNCTEX_PRINTF_FORMAT(3, 0);
++static int _synctex_log(int level, const char * prompt, const char * reason, ...) {
++	va_list arg;
+ 	int result;
++	va_start(arg, reason);
+ #	ifdef SYNCTEX_RECENT_WINDOWS
+ 	{/*	This code is contributed by William Blum.
+         As it does not work on some older computers,
+@@ -133,10 +133,10 @@ int _synctex_log(int level, const char *
+     result += vfprintf(where, reason, arg);
+     result += fprintf(where,"\n");
+ #   endif
++    va_end(arg);
+ 	return result;
+ }
+ 
+-__attribute__((__format__ (__printf__, 1, 0)))
+ int _synctex_error(const char * reason,...) {
+     va_list arg;
+     int result;
+@@ -355,6 +355,7 @@ char * _synctex_merge_strings(const char
+ 		size_t len = strlen(temp);
+ 		if(UINT_MAX-len<size) {
+ 			_synctex_error("!  _synctex_merge_strings: Capacity exceeded.");
++			va_end(arg);
+ 			return NULL;
+ 		}
+ 		size+=len;
+@@ -374,6 +375,7 @@ char * _synctex_merge_strings(const char
+ 					if(dest != strncpy(dest,temp,size)) {
+ 						_synctex_error("!  _synctex_merge_strings: Copy problem");
+ 						free(result);
++						va_end(arg);
+ 						result = NULL;
+ 						return NULL;
+ 					}
+--- a/cut-n-paste/synctex/synctex_parser.c
++++ b/cut-n-paste/synctex/synctex_parser.c
+@@ -8411,6 +8411,7 @@ struct synctex_updater_t {
+     int length;             /*  the number of chars appended */
+ };
+ 
++static int _synctex_updater_print(synctex_updater_p updater, const char * format, ...) SYNCTEX_PRINTF_FORMAT(2, 3);
+ static int _synctex_updater_print(synctex_updater_p updater, const char * format, ...) {
+     int result = 0;
+     if (updater) {
+@@ -8447,6 +8448,7 @@ static int vasprintf(char **ret,
+ /**
+  *  gzvprintf is not available until OSX 10.10
+  */
++static int _synctex_updater_print_gz(synctex_updater_p updater, const char * format, ...) SYNCTEX_PRINTF_FORMAT(2, 3);
+ static int _synctex_updater_print_gz(synctex_updater_p updater, const char * format, ...) {
+     int result = 0;
+     if (updater) {
+--- a/cut-n-paste/synctex/synctex_parser_utils.h
++++ b/cut-n-paste/synctex/synctex_parser_utils.h
+@@ -85,7 +85,11 @@ extern "C" {
+ #	else
+ #		define SYNCTEX_ARE_PATH_CHARACTERS_EQUAL(left,right) (toupper(left) != toupper(right))
+ #	endif
+-    
++#	ifdef __GNUC__
++#		define SYNCTEX_PRINTF_FORMAT(si, ftc) __attribute__ ((format (printf, si, ftc)))
++#	else
++#		define SYNCTEX_PRINTF_FORMAT(si, ftc)
++#	endif    
+ /*  This custom malloc functions initializes to 0 the newly allocated memory.
+  *  There is no bzero function on windows. */
+ void *_synctex_malloc(size_t size);
+@@ -97,8 +101,8 @@ void _synctex_free(void * ptr);
+ /*  This is used to log some informational message to the standard error stream.
+  *  On Windows, the stderr stream is not exposed and another method is used.
+  *	The return value is the number of characters printed.	*/
+-    int _synctex_error(const char * reason,...);
+-    int _synctex_debug(const char * reason,...);
++    int _synctex_error(const char * reason,...) SYNCTEX_PRINTF_FORMAT(1, 2);
++    int _synctex_debug(const char * reason,...) SYNCTEX_PRINTF_FORMAT(1, 2);
+ 
+ /*  strip the last extension of the given string, this string is modified!
+  *  This function depends on the OS because the path separator may differ.
-- 
2.24.0


