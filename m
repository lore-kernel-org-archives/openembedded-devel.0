Return-Path: <akuster808@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5DC5EB64DD
	for <webhook@archiver.kernel.org>; Sun, 16 Jul 2023 19:17:15 +0000 (UTC)
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.web10.4236.1689535031972543001
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 16 Jul 2023 12:17:12 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="signature has expired" header.i=@gmail.com header.s=20221208 header.b=X0BQYgRG;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: akuster808@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-577ddda6ab1so54301647b3.0
        for <openembedded-devel@lists.openembedded.org>; Sun, 16 Jul 2023 12:17:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689535031; x=1692127031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=oU1ol0H4VTIVcg5wi8RuWx5+19BevCWDKU+yxcZdAwU=;
        b=X0BQYgRGcnkHFMqCVXpvP72BESvkWzzApimuenlU6Z/bo6jKZrPndHUziJxUHFYi+O
         gwO7k3U9ZlsU/oo7Ht266dEYwC5PlgPRiTCzC+WSeIWrO5GgvloX3Bpx/DjkAzhJgxZy
         wQA/nphpqn3t0NlVpblO7nOBMC8F5uTthTQI0J2qUdKZb8oi028P3OCLZGljzBKBZ+IB
         sNbS5XMyHOthA7b+xhHIf3MSpvWLntkoE201OKOkcyRJnOwx5ene3CscQMM/7xhW/xQP
         +w60CTSnWySDPsyKJX4kPOFUC0FOO4iIG3dQDq98dhAa5BzkdG75srIuKlLoxcPOqb/N
         TvGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689535031; x=1692127031;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oU1ol0H4VTIVcg5wi8RuWx5+19BevCWDKU+yxcZdAwU=;
        b=XwFkL2+nnQOoAJb5X916rGU6TtdqBy/qiZFTtEHn7I9vggVfbI63cmmySXTNErlOoX
         G45/B62KBepoIuBuMOLLsoxmjHaPa0TrNvJ0QaJBJYTEjk6liiUMFpX+uSEi6o9Aikp4
         1zLSpNtRdEAOhnLQW1Z7tjcD8giIOhyPh5jiJDYKSYVgrNTfvZklluJGJ1oovZZRqklI
         dtB6+5/qiN5htF1lAjGfkQ+3/c05nd/bIfBA5rPQ6kINAQxh6E7a5YApWxu2R0Vh/cXb
         x0RIE7tKI3lOZhPB36byRXCVj72JrWDQX4XPsGN1vQr3O2Nax+Y0WoxCiZ4qAikuP/Wp
         dryA==
X-Gm-Message-State: ABy/qLZOl2Gz9Hh6uzYzsdR4YhVxl9Nvx/5YGFm8CMpjJLsIFNUN+X/h
	EOi3OBAxIIRNzOBmdzXsxt6UmyDthd8=
X-Google-Smtp-Source: APBJJlF6MtEEzD7ourk9kfuBcqHJG9Pe88n1/CnDnaXIxqGYGZt8c3dqmf4HmwKq1yyKO9m4BArxpw==
X-Received: by 2002:a81:6d42:0:b0:56c:e260:e2d5 with SMTP id i63-20020a816d42000000b0056ce260e2d5mr9210587ywc.7.1689535030902;
        Sun, 16 Jul 2023 12:17:10 -0700 (PDT)
Received: from ?IPV6:2600:1700:9190:ba10:54fe:9eab:47f4:c789? ([2600:1700:9190:ba10:54fe:9eab:47f4:c789])
        by smtp.gmail.com with ESMTPSA id x206-20020a817cd7000000b0057a8dd7f707sm3446073ywc.2.2023.07.16.12.17.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Jul 2023 12:17:10 -0700 (PDT)
Message-ID: <6bcaec9e-0133-c873-65ca-ecc755e0930b@gmail.com>
Date: Sun, 16 Jul 2023 15:17:10 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [oe][meta-networking[mickledore][PATCH 1/1] tcpdump: fix
 CVE-2023-1801
Content-Language: en-US
To: meenali.gupta@windriver.com, openembedded-devel@lists.openembedded.org
Cc: Hari.GPillai@windriver.com
References: <20230714114126.1827763-1-meenali.gupta@windriver.com>
From: akuster808 <akuster808@gmail.com>
In-Reply-To: <20230714114126.1827763-1-meenali.gupta@windriver.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 16 Jul 2023 19:17:15 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/103876



On 7/14/23 7:41 AM, Meenali Gupta via lists.openembedded.org wrote:
> From: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>

Thanks but there is an update to 4.99.4 queued.

- Armin
>
> The SMB protocol decoder in tcpdump version 4.99.3 can perform
> an out-of-bounds write when decoding a crafted network packet
>
> Signed-off-by: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>
> ---
>   .../tcpdump/tcpdump/CVE-2023-1801.patch       | 342 ++++++++++++++++++
>   .../recipes-support/tcpdump/tcpdump_4.99.3.bb |   1 +
>   2 files changed, 343 insertions(+)
>   create mode 100644 meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch
>
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch
> new file mode 100644
> index 000000000..03a1c0aa4
> --- /dev/null
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump/CVE-2023-1801.patch
> @@ -0,0 +1,342 @@
> +From 13336c4054015bef84d93bf51b50b15df6e265bf Mon Sep 17 00:00:00 2001
> +From: Guy Harris <gharris@sonic.net>
> +Date: Mon, 30 Jan 2023 23:03:16 -0800
> +Subject: [PATCH] tcpdump: Have a common routine for converting dates and times
> + to strings.
> +
> +Have a routine that takes a buffer, a strftime format, and a struct tm *
> +as arguments, and:
> +
> +* checks whether the struct tm * is null and, if so, returns a string
> +indicating that the date and time couldn't be converted;
> +
> +* otherwise, passes it to strftime(), along with the buffer and the
> +format argument and, if strftime() returns 0, meaning the string didn't
> +fit into the buffer and thus that the buffer's contents are undefined,
> +returns a string indicating that the date and time didn't fit into the
> +buffer;
> +
> +* otherwise, returns a pointer to the buffer.
> +
> +Call that routine instead of directly calling strftime() in printers;
> +that prevents printing a buffer with undefined data if the buffer isn't
> +big enough for the string.
> +
> +Also, when generating file names using an strftime format, check the
> +return value of strftime() to make sure the buffer didn't overflow.
> +
> +Upstream-Status: Backport[https://github.com/the-tcpdump-group/tcpdump/commit/03c037bbd75588beba3ee09f26d17783d21e30bc]
> +CVE: CVE-2023-1801
> +
> +Signed-off-by: Meenali Gupta <mgupta1@blr-linux-engg1.wrs.com>
> +---
> + netdissect.h   |  3 +++
> + ntp.c          | 21 ++++++---------------
> + print-ahcp.c   | 12 ++++--------
> + print-arista.c | 13 ++++---------
> + print-rx.c     |  8 ++++----
> + print-zep.c    |  7 +++----
> + smbutil.c      | 16 +++++-----------
> + tcpdump.c      | 22 ++++++++++++++++++++--
> + util-print.c   | 36 ++++++++++++++++++++++++++++--------
> + 9 files changed, 77 insertions(+), 61 deletions(-)
> +
> +diff --git a/netdissect.h b/netdissect.h
> +index 5c16be6..b1074ef 100644
> +--- a/netdissect.h
> ++++ b/netdissect.h
> +@@ -423,6 +423,9 @@ extern void ts_print(netdissect_options *, const struct timeval *);
> + extern void signed_relts_print(netdissect_options *, int32_t);
> + extern void unsigned_relts_print(netdissect_options *, uint32_t);
> +
> ++extern const char *nd_format_time(char *buf, size_t bufsize,
> ++    const char *format, const struct tm *timeptr);
> ++
> + extern void fn_print_char(netdissect_options *, u_char);
> + extern void fn_print_str(netdissect_options *, const u_char *);
> + extern u_int nd_printztn(netdissect_options *, const u_char *, u_int, const u_char *);
> +diff --git a/ntp.c b/ntp.c
> +index 4d17932..0a79f81 100644
> +--- a/ntp.c
> ++++ b/ntp.c
> +@@ -55,8 +55,8 @@ p_ntp_time(netdissect_options *ndo,
> +	if (i) {
> +	    int64_t seconds_64bit = (int64_t)i - JAN_1970;
> +	    time_t seconds;
> +-	    struct tm *tm;
> +	    char time_buf[128];
> ++	    const char *time_string;
> +
> +	    seconds = (time_t)seconds_64bit;
> +	    if (seconds != seconds_64bit) {
> +@@ -64,22 +64,13 @@ p_ntp_time(netdissect_options *ndo,
> +		 * It doesn't fit into a time_t, so we can't hand it
> +		 * to gmtime.
> +		 */
> +-		ND_PRINT(" (unrepresentable)");
> ++		time_string = "[Time is too large to fit into a time_t]";
> +	    } else {
> +-		tm = gmtime(&seconds);
> +-		if (tm == NULL) {
> +-		    /*
> +-		     * gmtime() can't handle it.
> +-		     * (Yes, that might happen with some version of
> +-		     * Microsoft's C library.)
> +-		     */
> +-		    ND_PRINT(" (unrepresentable)");
> +-		} else {
> +-		    /* use ISO 8601 (RFC3339) format */
> +-		    strftime(time_buf, sizeof (time_buf), "%Y-%m-%dT%H:%M:%SZ", tm);
> +-		    ND_PRINT(" (%s)", time_buf);
> +-		}
> ++		/* use ISO 8601 (RFC3339) format */
> ++		time_string = nd_format_time(time_buf, sizeof (time_buf),
> ++		  "%Y-%m-%dT%H:%M:%SZ", gmtime(&seconds));
> +	    }
> ++	    ND_PRINT(" (%s)", time_string);
> +	}
> + #endif
> + }
> +diff --git a/print-ahcp.c b/print-ahcp.c
> +index 9859f76..d57edda 100644
> +--- a/print-ahcp.c
> ++++ b/print-ahcp.c
> +@@ -102,18 +102,14 @@ ahcp_time_print(netdissect_options *ndo,
> +                 const u_char *cp, uint8_t len)
> + {
> +	time_t t;
> +-	struct tm *tm;
> +-	char buf[BUFSIZE];
> ++	char buf[sizeof("-yyyyyyyyyy-mm-dd hh:mm:ss UTC")];
> +
> +	if (len != 4)
> +		goto invalid;
> +	t = GET_BE_U_4(cp);
> +-	if (NULL == (tm = gmtime(&t)))
> +-		ND_PRINT(": gmtime() error");
> +-	else if (0 == strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", tm))
> +-		ND_PRINT(": strftime() error");
> +-	else
> +-		ND_PRINT(": %s UTC", buf);
> ++	ND_PRINT(": %s",
> ++	    nd_format_time(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S UTC",
> ++	      gmtime(&t)));
> +	return;
> +
> + invalid:
> +diff --git a/print-arista.c b/print-arista.c
> +index 039a1ff..079ad68 100644
> +--- a/print-arista.c
> ++++ b/print-arista.c
> +@@ -10,7 +10,6 @@
> +
> + #include "netdissect.h"
> + #include "extract.h"
> +-#include "addrtoname.h"
> +
> + /*
> +
> +@@ -93,17 +92,13 @@ arista_print_date_hms_time(netdissect_options *ndo, uint32_t seconds,
> +		uint32_t nanoseconds)
> + {
> +	time_t ts;
> +-	struct tm *tm;
> +-	char buf[BUFSIZE];
> ++	char buf[sizeof("-yyyyyyyyyy-mm-dd hh:mm:ss")];
> +
> +	ts = seconds + (nanoseconds / 1000000000);
> +	nanoseconds %= 1000000000;
> +-	if (NULL == (tm = gmtime(&ts)))
> +-		ND_PRINT("gmtime() error");
> +-	else if (0 == strftime(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S", tm))
> +-		ND_PRINT("strftime() error");
> +-	else
> +-		ND_PRINT("%s.%09u", buf, nanoseconds);
> ++	ND_PRINT("%s.%09u",
> ++	    nd_format_time(buf, sizeof(buf), "%Y-%m-%d %H:%M:%S",
> ++	       gmtime(&ts)), nanoseconds);
> + }
> +
> + int
> +diff --git a/print-rx.c b/print-rx.c
> +index 3f7589e..dbef71c 100644
> +--- a/print-rx.c
> ++++ b/print-rx.c
> +@@ -794,12 +794,12 @@ rx_cache_find(netdissect_options *ndo, const struct rx_header *rxh,
> +			ND_PRINT(" %" PRIu64, _i); \
> +		}
> +
> +-#define DATEOUT() { time_t _t; struct tm *tm; char str[256]; \
> ++#define DATEOUT() { time_t _t; char str[256]; \
> +			_t = (time_t) GET_BE_S_4(bp); \
> +			bp += sizeof(int32_t); \
> +-			tm = localtime(&_t); \
> +-			strftime(str, 256, "%Y/%m/%d %H:%M:%S", tm); \
> +-			ND_PRINT(" %s", str); \
> ++			ND_PRINT(" %s", \
> ++			    nd_format_time(str, sizeof(str), \
> ++			      "%Y/%m/%d %H:%M:%S", localtime(&_t))); \
> +		}
> +
> + #define STOREATTROUT() { uint32_t mask, _i; \
> +diff --git a/print-zep.c b/print-zep.c
> +index fd74368..642b240 100644
> +--- a/print-zep.c
> ++++ b/print-zep.c
> +@@ -83,12 +83,11 @@ static void zep_print_ts(netdissect_options *ndo, const u_char *p)
> +	 */
> +	if (i) {
> +		time_t seconds = i - JAN_1970;
> +-		struct tm *tm;
> +		char time_buf[128];
> +
> +-		tm = localtime(&seconds);
> +-		strftime(time_buf, sizeof (time_buf), "%Y/%m/%d %H:%M:%S", tm);
> +-		ND_PRINT(" (%s)", time_buf);
> ++		ND_PRINT(" (%s)",
> ++		    nd_format_time(time_buf, sizeof (time_buf), "%Y/%m/%d %H:%M:%S",
> ++		      localtime(&seconds)));
> +	}
> + #endif
> + }
> +diff --git a/smbutil.c b/smbutil.c
> +index 7f609f7..f33a323 100644
> +--- a/smbutil.c
> ++++ b/smbutil.c
> +@@ -768,9 +768,8 @@ smb_fdata1(netdissect_options *ndo,
> +	case 'T':
> +	  {
> +	    time_t t;
> +-	    struct tm *lt;
> +	    const char *tstring;
> +-	    char buffer[sizeof("Www Mmm dd hh:mm:ss yyyy\n")];
> ++	    char buffer[sizeof("Www Mmm dd hh:mm:ss yyyyy")];
> +	    uint32_t x;
> +
> +	    switch (atoi(fmt + 1)) {
> +@@ -800,16 +799,11 @@ smb_fdata1(netdissect_options *ndo,
> +		break;
> +	    }
> +	    if (t != 0) {
> +-		lt = localtime(&t);
> +-		if (lt != NULL) {
> +-		    strftime(buffer, sizeof(buffer), "%a %b %e %T %Y%n", lt);
> +-		    tstring = buffer;
> +-		}
> +-		else
> +-		    tstring = "(Can't convert time)\n";
> ++		    tstring = nd_format_time(buffer, sizeof(buffer), "%a %b %e %T %Y",
> ++		    localtime(&t));
> +	    } else
> +-		tstring = "NULL\n";
> +-	    ND_PRINT("%s", tstring);
> ++		tstring = "NULL";
> ++	    ND_PRINT("%s\n", tstring);
> +	    fmt++;
> +	    while (ND_ASCII_ISDIGIT(*fmt))
> +		fmt++;
> +diff --git a/tcpdump.c b/tcpdump.c
> +index 78d0871..b0f75b9 100644
> +--- a/tcpdump.c
> ++++ b/tcpdump.c
> +@@ -843,6 +843,8 @@ MakeFilename(char *buffer, char *orig_name, int cnt, int max_chars)
> +         char *filename = malloc(PATH_MAX + 1);
> +         if (filename == NULL)
> +             error("%s: malloc", __func__);
> ++	if (strlen(orig_name) == 0)
> ++            error("an empty string is not a valid file name");
> +
> +         /* Process with strftime if Gflag is set. */
> +         if (Gflag != 0) {
> +@@ -854,9 +856,25 @@ MakeFilename(char *buffer, char *orig_name, int cnt, int max_chars)
> +           }
> +
> +           /* There's no good way to detect an error in strftime since a return
> +-           * value of 0 isn't necessarily failure.
> ++           *  * value of 0 isn't necessarily failure; if orig_name is an empty
> ++           * string, the formatted string will be empty.
> ++           *
> ++           * However, the C90 standard says that, if there *is* a
> ++           * buffer overflow, the content of the buffer is undefined,
> ++           * so we must check for a buffer overflow.
> ++           *
> ++           * So we check above for an empty orig_name, and only call
> ++           * strftime() if it's non-empty, in which case the return
> ++           * value will only be 0 if the formatted date doesn't fit
> ++           * in the buffer.
> ++           *
> ++           * (We check above because, even if we don't use -G, we
> ++           * want a better error message than "tcpdump: : No such
> ++           * file or directory" for this case.)
> +            */
> +-          strftime(filename, PATH_MAX, orig_name, local_tm);
> ++          if (strftime(filename, PATH_MAX, orig_name, local_tm) == 0) {
> ++            error("%s: strftime", __func__);
> ++          }
> +         } else {
> +           strncpy(filename, orig_name, PATH_MAX);
> +         }
> +diff --git a/util-print.c b/util-print.c
> +index 8b20649..fea6b19 100644
> +--- a/util-print.c
> ++++ b/util-print.c
> +@@ -230,7 +230,8 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long sec, long usec,
> + {
> +	time_t Time = sec;
> +	struct tm *tm;
> +-	char timestr[32];
> ++	char timebuf[32];
> ++	const char *timestr;
> +
> +	if ((unsigned)sec & 0x80000000) {
> +		ND_PRINT("[Error converting time]");
> +@@ -242,14 +243,14 @@ ts_date_hmsfrac_print(netdissect_options *ndo, long sec, long usec,
> +	else
> +		tm = gmtime(&Time);
> +
> +-	if (!tm) {
> +-		ND_PRINT("[Error converting time]");
> +-		return;
> ++
> ++	if (date_flag == WITH_DATE) {
> ++		timestr = nd_format_time(timebuf, sizeof(timebuf),
> ++		    "%Y-%m-%d %H:%M:%S", tm);
> ++	} else {
> ++		timestr = nd_format_time(timebuf, sizeof(timebuf),
> ++		    "%H:%M:%S", tm);
> +	}
> +-	if (date_flag == WITH_DATE)
> +-		strftime(timestr, sizeof(timestr), "%Y-%m-%d %H:%M:%S", tm);
> +-	else
> +-		strftime(timestr, sizeof(timestr), "%H:%M:%S", tm);
> +	ND_PRINT("%s", timestr);
> +
> +	ts_frac_print(ndo, usec);
> +@@ -404,6 +405,25 @@ signed_relts_print(netdissect_options *ndo,
> +	}
> +	unsigned_relts_print(ndo, secs);
> + }
> ++/*
> ++ * Format a struct tm with strftime().
> ++ * If the pointer to the struct tm is null, that means that the
> ++ * routine to convert a time_t to a struct tm failed; the localtime()
> ++ * and gmtime() in the Microsoft Visual Studio C library will fail,
> ++ * returning null, if the value is before the UNIX Epoch.
> ++ */
> ++const char *
> ++nd_format_time(char *buf, size_t bufsize, const char *format,
> ++         const struct tm *timeptr)
> ++{
> ++	if (timeptr != NULL) {
> ++		if (strftime(buf, bufsize, format, timeptr) != 0)
> ++			return (buf);
> ++		else
> ++			return ("[nd_format_time() buffer is too small]");
> ++	} else
> ++		return ("[localtime() or gmtime() couldn't convert the date and time]");
> ++}
> +
> + /* Print the truncated string */
> + void nd_print_trunc(netdissect_options *ndo)
> +--
> +2.40.0
> diff --git a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
> index 03f1b76f9..dfb408dcd 100644
> --- a/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
> +++ b/meta-networking/recipes-support/tcpdump/tcpdump_4.99.3.bb
> @@ -24,6 +24,7 @@ SRC_URI = " \
>       http://www.tcpdump.org/release/${BP}.tar.gz \
>       file://add-ptest.patch \
>       file://run-ptest \
> +    file://CVE-2023-1801.patch \
>   "
>   
>   SRC_URI[sha256sum] = "ad75a6ed3dc0d9732945b2e5483cb41dc8b4b528a169315e499c6861952e73b3"
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#103866): https://lists.openembedded.org/g/openembedded-devel/message/103866
> Mute This Topic: https://lists.openembedded.org/mt/100139373/3616698
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [akuster808@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


