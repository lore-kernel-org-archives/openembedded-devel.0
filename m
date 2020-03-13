Return-Path: <akuster808@gmail.com>
Received: from mail-pl1-f193.google.com (mail-pl1-f193.google.com
	[209.85.214.193])
	by mail.openembedded.org (Postfix) with ESMTP id 0707C61CB9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 15:36:44 +0000 (UTC)
Received: by mail-pl1-f193.google.com with SMTP id t3so4403710plz.9
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2020 08:36:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:autocrypt:message-id:date:user-agent
	:mime-version:in-reply-to:content-transfer-encoding:content-language;
	bh=4FVywF93XHv3f3kZsni5xS8ZMxT5SOs7pns6JSmhujU=;
	b=QMd855jhZX0IrYKZJqNJOZV8Iy2tX31h7qkjLc2tmgOpNGPeOusMw5aLF0OEHjnSym
	cn+sEshBwbZ4N8lCzx+aRuIbNnXum5PCDBSl6Y7jgap5PZw6WDU/+xY3uxnWOvk+NyL2
	kR1pQsO/Mh8ZzmT1pN94Y/qeLW2fv/SWplJbSS42Fc2kUZdzFidO1IBc7Va+xix1ucXG
	hxm6RNIG8kO9Aamp+KrojgKDMJIDCoQMMUcK83tpDH8LoJTVmLLbIZzhVsdGTS0Z3RcW
	rAivKwMVwePYG72BNll3n9ropnqrRF+0LmUG4S7szlTQHIII7vy/FBUMxdfA8funmKlo
	XV8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:autocrypt:message-id
	:date:user-agent:mime-version:in-reply-to:content-transfer-encoding
	:content-language;
	bh=4FVywF93XHv3f3kZsni5xS8ZMxT5SOs7pns6JSmhujU=;
	b=cuAiwa//d3MTM2IIi79GrrPOPq/dDpULrbL1lpwe2TOkJxp3d/nmIYucUjPT+sqkGH
	vpwHyGQqJDC335axSokJLCHQBgWrfE1rltrGnuG5QCBBzSHJFpoqmDcL9swZp6gk75nd
	hoMBAhPTLoRaY1EnbKsJP4YCI0SUIa/jdxEQVt6EgzcL7rPndaqgDQHFWtmX+ndYpS1Z
	rcxEl6yXMhyQNgY3FDBdcKHTJPuu+TDegnvinqPZgulZ27Cr+cCUotqywmIgoNIhCCX2
	fMhrKuSgPOP6Q40v7V1u1nc8/1Zjwg87NRHhl/Qq1w2xz4nTwgUI8Mksrtvwd3oTfRjw
	iEaA==
X-Gm-Message-State: ANhLgQ23gIZP95eYjmE7KiP51fXR+v9oKgzDYKSMn2G2eelUqmpfQl5t
	H1u7YTTfCwemG9dajIRDXBAvr0fq
X-Google-Smtp-Source: ADFU+vuEqxdnMRLE4GH9cqKN/dzADjP53IxYmk8Uqzzk9uvGTmyfo+xDrNiAKbDEZd9qo7MPxhQXRA==
X-Received: by 2002:a17:90b:288:: with SMTP id
	az8mr8763591pjb.25.1584113805578; 
	Fri, 13 Mar 2020 08:36:45 -0700 (PDT)
Received: from ?IPv6:2601:202:4180:a5c0:b971:4aa1:90b2:e851?
	([2601:202:4180:a5c0:b971:4aa1:90b2:e851])
	by smtp.gmail.com with ESMTPSA id
	u5sm37654930pfb.153.2020.03.13.08.36.44
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
	Fri, 13 Mar 2020 08:36:44 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org
References: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
From: akuster808 <akuster808@gmail.com>
Autocrypt: addr=akuster808@gmail.com; prefer-encrypt=mutual; keydata=
	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
	8CS2NxU=
Message-ID: <1f663de1-6dc9-c9fb-c14b-082de2934777@gmail.com>
Date: Fri, 13 Mar 2020 08:36:43 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.4.1
MIME-Version: 1.0
In-Reply-To: <1584097824-54462-1-git-send-email-wangmy@cn.fujitsu.com>
Subject: Re: [meta-oe][zeus][PATCH] libssh2: CVE-2019-17498.patch
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
X-List-Received-Date: Fri, 13 Mar 2020 15:36:45 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 3/13/20 4:10 AM, Wang Mingyu wrote:
> Security Advisory
>
> References:
> https://cve.mitre.org/cgi-bin/cvename.cgi?name=CVE-2019-17498
is this fix in master?
>
> Signed-off-by: Wang Mingyu <wangmy@cn.fujitsu.com>
> ---
>  .../libssh2/libssh2/CVE-2019-17498.patch      | 131 ++++++++++++++++++
>  .../recipes-support/libssh2/libssh2_1.8.2.bb  |   1 +
>  2 files changed, 132 insertions(+)
>  create mode 100644 meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
>
> diff --git a/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch b/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
> new file mode 100644
> index 000000000..f60764c92
> --- /dev/null
> +++ b/meta-oe/recipes-support/libssh2/libssh2/CVE-2019-17498.patch
> @@ -0,0 +1,131 @@
> +From dedcbd106f8e52d5586b0205bc7677e4c9868f9c Mon Sep 17 00:00:00 2001
> +From: Will Cosgrove <will@panic.com>
> +Date: Fri, 30 Aug 2019 09:57:38 -0700
> +Subject: [PATCH] packet.c: improve message parsing (#402)
> +
> +* packet.c: improve parsing of packets
> +
> +file: packet.c
> +
> +notes:
> +Use _libssh2_get_string API in SSH_MSG_DEBUG/SSH_MSG_DISCONNECT. Additional uint32 bounds check in SSH_MSG_GLOBAL_REQUEST.
> +
> +Upstream-Status: Accepted
> +CVE: CVE-2019-17498
> +
> +Reference to upstream patch:
> +https://github.com/libssh2/libssh2/commit/dedcbd106f8e52d5586b0205bc7677e4c9868f9c
> +
> +---
> + src/packet.c | 68 ++++++++++++++++++++++------------------------------
> + 1 file changed, 29 insertions(+), 39 deletions(-)
> +
> +diff --git a/src/packet.c b/src/packet.c
> +index 38ab6294..2e01bfc5 100644
> +--- a/src/packet.c
> ++++ b/src/packet.c
> +@@ -416,8 +416,8 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> +                     size_t datalen, int macstate)
> + {
> +     int rc = 0;
> +-    char *message = NULL;
> +-    char *language = NULL;
> ++    unsigned char *message = NULL;
> ++    unsigned char *language = NULL;
> +     size_t message_len = 0;
> +     size_t language_len = 0;
> +     LIBSSH2_CHANNEL *channelp = NULL;
> +@@ -469,33 +469,23 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> + 
> +         case SSH_MSG_DISCONNECT:
> +             if(datalen >= 5) {
> +-                size_t reason = _libssh2_ntohu32(data + 1);
> ++                uint32_t reason = 0;
> ++                struct string_buf buf;
> ++                buf.data = (unsigned char *)data;
> ++                buf.dataptr = buf.data;
> ++                buf.len = datalen;
> ++                buf.dataptr++; /* advance past type */
> + 
> +-                if(datalen >= 9) {
> +-                    message_len = _libssh2_ntohu32(data + 5);
> ++                _libssh2_get_u32(&buf, &reason);
> ++                _libssh2_get_string(&buf, &message, &message_len);
> ++                _libssh2_get_string(&buf, &language, &language_len);
> + 
> +-                    if(message_len < datalen-13) {
> +-                        /* 9 = packet_type(1) + reason(4) + message_len(4) */
> +-                        message = (char *) data + 9;
> +-
> +-                        language_len =
> +-                            _libssh2_ntohu32(data + 9 + message_len);
> +-                        language = (char *) data + 9 + message_len + 4;
> +-
> +-                        if(language_len > (datalen-13-message_len)) {
> +-                            /* bad input, clear info */
> +-                            language = message = NULL;
> +-                            language_len = message_len = 0;
> +-                        }
> +-                    }
> +-                    else
> +-                        /* bad size, clear it */
> +-                        message_len = 0;
> +-                }
> +                 if(session->ssh_msg_disconnect) {
> +-                    LIBSSH2_DISCONNECT(session, reason, message,
> +-                                       message_len, language, language_len);
> ++                    LIBSSH2_DISCONNECT(session, reason, (const char *)message,
> ++                                       message_len, (const char *)language,
> ++                                       language_len);
> +                 }
> ++
> +                 _libssh2_debug(session, LIBSSH2_TRACE_TRANS,
> +                                "Disconnect(%d): %s(%s)", reason,
> +                                message, language);
> +@@ -534,23 +526,24 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> +                 int always_display = data[1];
> + 
> +                 if(datalen >= 6) {
> +-                    message_len = _libssh2_ntohu32(data + 2);
> +-
> +-                    if(message_len <= (datalen - 10)) {
> +-                        /* 6 = packet_type(1) + display(1) + message_len(4) */
> +-                        message = (char *) data + 6;
> +-                        language_len = _libssh2_ntohu32(data + 6 +
> +-                                                        message_len);
> +-
> +-                        if(language_len <= (datalen - 10 - message_len))
> +-                            language = (char *) data + 10 + message_len;
> +-                    }
> ++                    struct string_buf buf;
> ++                    buf.data = (unsigned char *)data;
> ++                    buf.dataptr = buf.data;
> ++                    buf.len = datalen;
> ++                    buf.dataptr += 2; /* advance past type & always display */
> ++
> ++                    _libssh2_get_string(&buf, &message, &message_len);
> ++                    _libssh2_get_string(&buf, &language, &language_len);
> +                 }
> + 
> +                 if(session->ssh_msg_debug) {
> +-                    LIBSSH2_DEBUG(session, always_display, message,
> +-                                  message_len, language, language_len);
> ++                    LIBSSH2_DEBUG(session, always_display,
> ++                                  (const char *)message,
> ++                                  message_len, (const char *)language,
> ++                                  language_len);
> +                 }
> +             }
> ++
> +             /*
> +              * _libssh2_debug will actually truncate this for us so
> +              * that it's not an inordinate about of data
> +@@ -576,7 +566,7 @@ _libssh2_packet_add(LIBSSH2_SESSION * session, unsigned char *data,
> +                 uint32_t len = 0;
> +                 unsigned char want_reply = 0;
> +                 len = _libssh2_ntohu32(data + 1);
> +-                if(datalen >= (6 + len)) {
> ++                if((len <= (UINT_MAX - 6)) && (datalen >= (6 + len))) {
> +                     want_reply = data[5 + len];
> +                     _libssh2_debug(session,
> +                                    LIBSSH2_TRACE_CONN,
> diff --git a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
> index fe853cde4..a17ae5b7c 100644
> --- a/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
> +++ b/meta-oe/recipes-support/libssh2/libssh2_1.8.2.bb
> @@ -17,6 +17,7 @@ inherit autotools pkgconfig
>  EXTRA_OECONF += "\
>                   --with-libz \
>                   --with-libz-prefix=${STAGING_LIBDIR} \
> +                 file://CVE-2019-17498.patch \
>                  "
>  
>  # only one of openssl and gcrypt could be set


