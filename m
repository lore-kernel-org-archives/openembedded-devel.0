Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web11.516.1616609639381702950
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 24 Mar 2021 11:13:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=U7mg1Yj1;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id bt4so12173804pjb.5
        for <openembedded-devel@lists.openembedded.org>; Wed, 24 Mar 2021 11:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:organization:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=HKXHahOfmeGXR5aG2rdqcHvnwi1z4SahvCjvlHI7THU=;
        b=U7mg1Yj17dUiTL17pUI31r873+nHCW79sVgFnsYEotGZvc28rq6CiqruY8W/sQtiLx
         8Kx6+Smd1KIe+u4MpWoo7pLCuPxE4JbKOHYdYK+xFlNd9LV9tKWjLD6fREUaGhoJp14r
         bTKrvhgF1+ieeAqpGZLpfCaYEI0Ah5QDuNBBlIivt+UmHOfRfrwM8IPBp105H4goSdee
         gGS/l6DXpUhg3YR+0fk9kAuNAfGQCKIIC/wi2snZLw01ESCQqswrrNSW0xpTC/SKRbMc
         n8fk+NTdyZWR7/8YMOGPO9Yo3rEpnAZV7bApVWujHE6n2CWxxzajvEFKy2f/dBtDWTLP
         +2Ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=HKXHahOfmeGXR5aG2rdqcHvnwi1z4SahvCjvlHI7THU=;
        b=H7EBx00WZXXb4uF8w6QB0FHKfcq9DpOH4pXnYEHYk5DTGSAqxt42DPpgaT0b6rqyoe
         rl9u6eDL9XUXclys7NgWIOSJD8q+2KLmLldlNxjHJofzy0pbndlfOfNW7WrRJcaTiOCW
         eic1v4ELyN7OkDykxOW5xwldl2A7w4xaqOvKfUWsNVhj2IRHEdXIXD5mQ+NRwJxhd1kN
         pgDqaGNkIk5j1jQpmpZsNSm3hYs7c/pZ0Eqs4WjVg6RXepMjs92KyyQMT3gjBUvGgBBB
         3IqMYFameCt4TWv9FDSxA1KK+5tyfGWbNnMEEkmBMwf3pT3S88Q1+IVTTA5sjZ4yDYYx
         xPHg==
X-Gm-Message-State: AOAM5335M2LrZ4fYw1wx64zg0cZiFj/shuyoQMRTmi/7Cec4m1mPpAya
	sS6CrR+PjwXZ8pAn4+pJMOs=
X-Google-Smtp-Source: ABdhPJzTJIO+ZuAV7GrNoBl2acJlrvJ8WDUFEp8KwFWvg7Ihk+jrCTpBUZ5sGBndNBXnuHLYCud25Q==
X-Received: by 2002:a17:90a:5d09:: with SMTP id s9mr4589904pji.172.1616609638571;
        Wed, 24 Mar 2021 11:13:58 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:a0f0:2da1:1afd:1712:ea8b? ([2601:646:9200:a0f0:2da1:1afd:1712:ea8b])
        by smtp.gmail.com with ESMTPSA id l25sm3288484pgu.72.2021.03.24.11.13.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Mar 2021 11:13:58 -0700 (PDT)
Subject: Re: [meta-oe][master][PATCH] libcroco: Add fix for CVE-2020-12825
To: "Neetika.Singh" <Neetika.Singh@kpit.com>,
 openembedded-devel@lists.openembedded.org
Cc: nisha.parrakat@kpit.com
References: <1616607489-18742-1-git-send-email-Neetika.Singh@kpit.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <4610ad3b-61a7-5705-6442-71c7c56780a8@gmail.com>
Date: Wed, 24 Mar 2021 11:13:57 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.16; rv:78.0)
 Gecko/20100101 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <1616607489-18742-1-git-send-email-Neetika.Singh@kpit.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

Does not apply cleanly on master. Please rebase it on latest master or 
master-next and resend.

On 3/24/21 10:38 AM, Neetika.Singh wrote:
> From: Neetika Singh <Neetika.Singh@kpit.com>
> 
> Added refreshed patch for CVE issue CVE-2020-12825
> Link: https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dda61593003b4c31f25
> 
> Signed-off-by: Neetika.Singh <Neetika.Singh@kpit.com>
> ---
>   .../libcroco/libcroco/CVE-2020-12825.patch         | 190 +++++++++++++++++++++
>   meta/recipes-support/libcroco/libcroco_0.6.13.bb   |   2 +
>   2 files changed, 192 insertions(+)
>   create mode 100644 meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> 
> diff --git a/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> new file mode 100644
> index 0000000..f6c6a55
> --- /dev/null
> +++ b/meta/recipes-support/libcroco/libcroco/CVE-2020-12825.patch
> @@ -0,0 +1,190 @@
> +From 203d62efefe6f79080863dda61593003b4c31f25 Mon Sep 17 00:00:00 2001
> +From: Michael Catanzaro <mcatanzaro@gnome.org>
> +Date: Thu, 13 Aug 2020 20:03:05 -0500
> +Subject: [PATCH] libcroco parser: limit recursion in block and any productions
> +
> +If we don't have any limits, we can recurse forever and overflow the
> +stack.
> +
> +This is for CVE-2020-12825: Stack overflow in cr_parser_parse_any_core
> +in cr-parser.c.
> +
> +Bug: https://gitlab.gnome.org/Archive/libcroco/-/issues/8
> +Patch from https://gitlab.gnome.org/Archive/libcroco/-/merge_requests/5
> +
> +CVE: CVE-2020-12825
> +Upstream Status: Backport [https://gitlab.com/inkscape/inkscape/-/commit/203d62efefe6f79080863dda61593003b4c31f25.patch]
> +---
> + src/cr-parser.c | 44 ++++++++++++++++++++-----------
> + 1 file changed, 29 insertions(+), 15 deletions(-)
> +
> +diff --git a/src/cr-parser.c b/src/cr-parser.c
> +index d85e71f0fc..cd7b6ebd4a 100644
> +--- a/src/cr-parser.c
> ++++ b/src/cr-parser.c
> +@@ -136,6 +136,8 @@ struct _CRParserPriv {
> +
> + #define CHARS_TAB_SIZE 12
> +
> ++#define RECURSIVE_CALLERS_LIMIT 100
> ++
> + /**
> +  * IS_NUM:
> +  *@a_char: the char to test.
> +@@ -343,9 +345,11 @@ static enum CRStatus cr_parser_parse_selector_core (CRParser * a_this);
> +
> + static enum CRStatus cr_parser_parse_declaration_core (CRParser * a_this);
> +
> +-static enum CRStatus cr_parser_parse_any_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_any_core (CRParser * a_this,
> ++                                               guint      n_calls);
> +
> +-static enum CRStatus cr_parser_parse_block_core (CRParser * a_this);
> ++static enum CRStatus cr_parser_parse_block_core (CRParser * a_this,
> ++                                                 guint      n_calls);
> +
> + static enum CRStatus cr_parser_parse_value_core (CRParser * a_this);
> +
> +@@ -783,7 +787,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +         cr_parser_try_to_skip_spaces_and_comments (a_this);
> +
> +         do {
> +-                status = cr_parser_parse_any_core (a_this);
> ++                status = cr_parser_parse_any_core (a_this, 0);
> +         } while (status == CR_OK);
> +
> +         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr,
> +@@ -794,7 +798,7 @@ cr_parser_parse_atrule_core (CRParser * a_this)
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> +                                       token);
> +                 token = NULL;
> +-                status = cr_parser_parse_block_core (a_this);
> ++                status = cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status,
> +                                       FALSE);
> +                 goto done;
> +@@ -929,11 +933,11 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +-        status = cr_parser_parse_any_core (a_this);
> ++        status = cr_parser_parse_any_core (a_this, 0);
> +         CHECK_PARSING_STATUS (status, FALSE);
> +
> +         do {
> +-                status = cr_parser_parse_any_core (a_this);
> ++                status = cr_parser_parse_any_core (a_this, 0);
> +
> +         } while (status == CR_OK);
> +
> +@@ -955,10 +959,12 @@ cr_parser_parse_selector_core (CRParser * a_this)
> +  *in chapter 4.1 of the css2 spec.
> +  *block ::= '{' S* [ any | block | ATKEYWORD S* | ';' ]* '}' S*;
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *FIXME: code this function.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_block_core (CRParser * a_this)
> ++cr_parser_parse_block_core (CRParser * a_this,
> ++                            guint      n_calls)
> + {
> +         CRToken *token = NULL;
> +         CRInputPos init_pos;
> +@@ -966,6 +972,9 @@ cr_parser_parse_block_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this && PRIVATE (a_this), CR_BAD_PARAM_ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token);
> +@@ -995,13 +1004,13 @@ cr_parser_parse_block_core (CRParser * a_this)
> +         } else if (token->type == CBO_TK) {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token = NULL;
> +-                status = cr_parser_parse_block_core (a_this);
> ++                status = cr_parser_parse_block_core (a_this, n_calls + 1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         } else {
> +                 cr_tknzr_unget_token (PRIVATE (a_this)->tknzr, token);
> +                 token = NULL;
> +-                status = cr_parser_parse_any_core (a_this);
> ++                status = cr_parser_parse_any_core (a_this, n_calls + 1);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 goto parse_block_content;
> +         }
> +@@ -1108,7 +1117,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> +                                                token);
> +                 token = NULL;
> +-                status = cr_parser_parse_block_core (a_this);
> ++                status = cr_parser_parse_block_core (a_this, 0);
> +                 CHECK_PARSING_STATUS (status, FALSE);
> +                 ref++;
> +                 goto continue_parsing;
> +@@ -1122,7 +1131,7 @@ cr_parser_parse_value_core (CRParser * a_this)
> +                 status = cr_tknzr_unget_token (PRIVATE (a_this)->tknzr,
> +                                                token);
> +                 token = NULL;
> +-                status = cr_parser_parse_any_core (a_this);
> ++                status = cr_parser_parse_any_core (a_this, 0);
> +                 if (status == CR_OK) {
> +                         ref++;
> +                         goto continue_parsing;
> +@@ -1162,10 +1162,12 @@
> +  *        | FUNCTION | DASHMATCH | '(' any* ')' | '[' any* ']' ] S*;
> +  *
> +  *@param a_this the current instance of #CRParser.
> ++ *@param n_calls used to limit recursion depth
> +  *@return CR_OK upon successfull completion, an error code otherwise.
> +  */
> + static enum CRStatus
> +-cr_parser_parse_any_core (CRParser * a_this)
> ++cr_parser_parse_any_core (CRParser * a_this,
> ++                          guint      n_calls)
> + {
> +         CRToken *token1 = NULL,
> +                 *token2 = NULL;
> +@@ -1173,6 +1184,9 @@ cr_parser_parse_any_core (CRParser * a_this)
> +
> +         g_return_val_if_fail (a_this, CR_BAD_PARAM_ERROR);
> +
> ++        if (n_calls > RECURSIVE_CALLERS_LIMIT)
> ++                return CR_ERROR;
> ++
> +         RECORD_INITIAL_POS (a_this, &init_pos);
> +
> +         status = cr_tknzr_get_next_token (PRIVATE (a_this)->tknzr, &token1);
> +@@ -1211,7 +1225,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                  *We consider parameter as being an "any*" production.
> +                  */
> +                 do {
> +-                        status = cr_parser_parse_any_core (a_this);
> ++                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
> +                 } while (status == CR_OK);
> +
> +                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
> +@@ -1236,7 +1250,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status = cr_parser_parse_any_core (a_this);
> ++                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
> +                 } while (status == CR_OK);
> +
> +                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
> +@@ -1264,7 +1278,7 @@ cr_parser_parse_any_core (CRParser * a_this)
> +                 }
> +
> +                 do {
> +-                        status = cr_parser_parse_any_core (a_this);
> ++                        status = cr_parser_parse_any_core (a_this, n_calls + 1);
> +                 } while (status == CR_OK);
> +
> +                 ENSURE_PARSING_COND (status == CR_PARSING_ERROR);
> +--
> +GitLab
> diff --git a/meta/recipes-support/libcroco/libcroco_0.6.13.bb b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> index 66ee647..2f61f87 100644
> --- a/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> +++ b/meta/recipes-support/libcroco/libcroco_0.6.13.bb
> @@ -19,6 +19,8 @@ BINCONFIG = "${bindir}/croco-0.6-config"
> 
>   inherit gnomebase gtk-doc binconfig-disabled
> 
> +SRC_URI += "file://CVE-2020-12825.patch"
> +
>   SRC_URI[archive.md5sum] = "c80c5a8385011a0260dce6bd0da93dce"
>   SRC_URI[archive.sha256sum] = "767ec234ae7aa684695b3a735548224888132e063f92db585759b422570621d4"
> 
> --
> 2.7.4
> 
> This message contains information that may be privileged or confidential and is the property of the KPIT Technologies Ltd. It is intended only for the person to whom it is addressed. If you are not the intended recipient, you are not authorized to read, print, retain copy, disseminate, distribute, or use this message or any part thereof. If you receive this message in error, please notify the sender immediately and delete all copies of this message. KPIT Technologies Ltd. does not accept any liability for virus infected mails.
> 
