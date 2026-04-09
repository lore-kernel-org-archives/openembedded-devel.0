Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2C02E98FDB
	for <webhook@archiver.kernel.org>; Thu,  9 Apr 2026 09:40:39 +0000 (UTC)
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.128473.1775727631390438536
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 09 Apr 2026 02:40:31 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=KrhwHGEs;
 spf=pass (domain: gmail.com, ip: 209.85.128.51, mailfrom: skandigraun@gmail.com)
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-488a88aeec9so7939275e9.2
        for <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 02:40:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775727630; x=1776332430; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6DgDwn1l8l14ahkqtaZWsrcvmTx+9Yq9aSqrij90Me8=;
        b=KrhwHGEsqy87J9M7mqB+oaOjiMbdFDqS3PD1XZEt7hQHUMYTE2W706OaeCSVJ/oWe7
         gbl6spHNRmiy4pUITOlZwLgI2nuL1O4JgQnBgZECV1Tt2F1RkTEPTj8Ras0FqZKCjLh3
         CAPtyKrAGdTCm5EXVOpp+aGA7n1JSER0zgYJbITSI8qunxg00aLpZm+qfECrBDpy+JDY
         jvxkPaF2SrM9pIFV7VbGwR7B1PoAqEhOsc0SzxAgaDOL67oEixDrIVO8lBaOdW3lfgER
         5VGnLoLxLJWC0uRvPJCZnKDfyM09jbAt2Tx1cjIIyCMqH7BBs6ep0hI+bdixXNfFg5Fh
         OKdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775727630; x=1776332430;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6DgDwn1l8l14ahkqtaZWsrcvmTx+9Yq9aSqrij90Me8=;
        b=V6yvjTiytIWsfaAatwYaa5w1slQEDQ3G9EOamNwS/Ck9xdqk8hiTStcy9bzI7Oad4i
         aagvujEOT6eXTSH98iCBPLpmfolXN+TbFYhrYYbk7wPpIHgVRyyq2ytYOKYZYQzwkjTI
         WuF0tT4EOihMfGKkwGat440oKz+hczHfW5A5jBZHFQrIRJRM+Cdowyqji1ooUEXhzz+8
         gVyzdMQ9mkBXww1nQtdoAoYJT8CRn8Osp7f0es5UQj6to4Qe3PlD7Azsj74WFXwt9tfy
         lpiIPtf8XnNSOooOQXVVtpM0tNcqedgIIz/vPDSpAS82KxKLuxTjy9j6hg7CRl6ppFiK
         SELA==
X-Forwarded-Encrypted: i=1; AJvYcCVnu+xwsk3hj3JbDJPaS7M01f+1Tc/cIV7VVDeg9w1v48h4iS36YBE42wRr8AXWBsbpYqXimSfJ+q3Uw2IxjBl0TaE=@lists.openembedded.org
X-Gm-Message-State: AOJu0YyqpVl8tVTCtQ8LAJF1NCJgabfAgjfCQ2b7mhCDDw1nKcqDSMwF
	v75pZplHo+57nM/cT+1FxqrQxFflfmlgWQUbFK8cJf7XmL6B2N4vAIeRSEp/9Q==
X-Gm-Gg: AeBDieu/okEmFCu32umzOCZW3bTK3xnFD0ZxbT10WHV2DOSfIPCedPYcoAX98zxGDTT
	uW0ZZnrlbOSyCN7kft1SuU20OoiVoyhmO8MknZ4Ji9up/9uDED7Nw1agary8UXKXAz1wcxkCNoU
	1MGhA+lzSZ15JEA6zPGvobIPn+uwUdqCZk1yYjl+4F4EqGAQOWj7BjErMaZnNRd4EQF6ZaBqW6P
	mYDGExaQ9zF+YhbgiMOnnfaLr4gaYY30slxqZunqfxQFZEIUteEapJcdI0/d+CzrKEgwujgCypI
	FYSdI0ByvLUst3OVZ0p5FFY3uXDsJJn8Tr73cIVk6XH7cxHyYkoRUxeVBpXckErPU2dUy+j2IPV
	FUfuGeDp/Mdvp+M0nE+9t/3EMc+2vcuperREDS9/edWRdz1O/Isihqv1ajyBnNdalJ74IDeN/7b
	AWcjgloo33y6uvIjtIyveF4+HrvC5auvjGTWe85BIR5A==
X-Received: by 2002:a05:600c:35d6:b0:488:bc6a:528d with SMTP id 5b1f17b1804b1-488bc6a550fmr148944605e9.22.1775727629344;
        Thu, 09 Apr 2026 02:40:29 -0700 (PDT)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488cd153d76sm63285755e9.0.2026.04.09.02.40.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 02:40:28 -0700 (PDT)
Message-ID: <61a5591b-f7f8-4209-ad6b-cbb63d8bddcf@gmail.com>
Date: Thu, 9 Apr 2026 11:40:28 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-oe][scarthgap][PATCH 11/11] nmap: rename enum
 PCAP_SOCKET
To: Jinfeng.Wang.CN@windriver.com, openembedded-devel@lists.openembedded.org
References: <20260409061904.1694992-1-jinfeng.wang.cn@windriver.com>
 <20260409061904.1694992-12-jinfeng.wang.cn@windriver.com>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <20260409061904.1694992-12-jinfeng.wang.cn@windriver.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Thu, 09 Apr 2026 09:40:39 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/126148

This can become messy, because the layer revisions are not tied to each
other (sure, there are recommendations, but not enforced). Yocto testing
happens usually with a 1-2 weeks old meta-oe, which would mean that this
recipe would be broken until the release of Yocto - also, it would be
the broken when used an older Yocto Scarthgap versions.

What if this patch would be extended, handling both the new and old
versions at the same time? I'm thinking about ifdefs, something like

#ifdef PCAP_SOCKET
  NM_PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
#else
  PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
#endif

(at all other relevant places also)

That way it wouldn't have to be an optional patch, and it wouldn't break
the recipe - at the worst case it would be just unnecessary (if the
oe-core counterpart is rejected).



On 4/9/26 08:19, Wang, Jinfeng (CN) via lists.openembedded.org wrote:
> From: Kai Kang <kai.kang@windriver.com>
> 
> It fails to build nmap after upgrade libpcap to 1.10.6 which defines the
> macro PCAP_SOCKET already. Rename the enum PCAP_SOCKET to NM_PCAP_SOCKET
> for nmap to make it work with libpcap 1.10.6.
> 
> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> Signed-off-by: Jinfeng Wang <jinfeng.wang.cn@windriver.com>
> ---
>  .../files/nmap-rename-enum-PCAP_SOCKET.patch  | 86 +++++++++++++++++++
>  meta-oe/recipes-security/nmap/nmap_7.80.bb    |  1 +
>  2 files changed, 87 insertions(+)
>  create mode 100644 meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
> 
> diff --git a/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
> new file mode 100644
> index 0000000000..e6bf26ebb6
> --- /dev/null
> +++ b/meta-oe/recipes-security/nmap/files/nmap-rename-enum-PCAP_SOCKET.patch
> @@ -0,0 +1,86 @@
> +The enum PCAP_SOCKET conflicts with the one from libpcap 1.10.6 and fails to
> +compile:
> +
> +In file included from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap/pcap.h:130,
> +                 from /path_to/tmp-glibc/work/corei7-64-wrs-linux/nmap/7.80/recipe-sysroot/usr/include/pcap.h:43,
> +                 from tcpip.h:140,
> +                 from nse_nsock.cc:4:
> +nse_nsock.cc:36:3: error: expected identifier before 'int'
> +   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
> +      |   ^~~~~~~~~~~
> +nse_nsock.cc:36:3: error: expected '}' before 'int'
> +nse_nsock.cc:33:6: note: to match this '{'
> +   33 | enum {
> +      |      ^
> +nse_nsock.cc:36:15: error: expected unqualified-id before '=' token
> +   36 |   PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
> +      |               ^
> +nse_nsock.cc:40:1: error: expected declaration before '}' token
> +   40 | };
> +      | ^
> +
> +The enum PCAP_SOCKET is removed in nmap later version. But the removal commit
> +involves extra logic change, so just rename the enum PCAP_SOCKET to
> +NM_PCAP_SOCKET to make it work with libpcap 1.10.6.
> +
> +Upstream-Status: Inappropriate [local fix to work with libpcap 1.10.6]
> +
> +Signed-off-by: Kai Kang <kai.kang@windriver.com>
> +---
> + nse_nsock.cc | 12 ++++++------
> + 1 file changed, 6 insertions(+), 6 deletions(-)
> +
> +diff --git a/nse_nsock.cc b/nse_nsock.cc
> +index df98666..9cecac6 100644
> +--- a/nse_nsock.cc
> ++++ b/nse_nsock.cc
> +@@ -33,7 +33,7 @@
> + enum {
> +   NSOCK_POOL = lua_upvalueindex(1),
> +   NSOCK_SOCKET = lua_upvalueindex(2), /* nsock socket metatable */
> +-  PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
> ++  NM_PCAP_SOCKET = lua_upvalueindex(3), /* pcap socket metatable */
> +   THREAD_SOCKETS = lua_upvalueindex(4), /* <Thread, Table of Sockets (keys)> */
> +   CONNECT_WAITING = lua_upvalueindex(5), /* Threads waiting to lock */
> +   KEY_PCAP = lua_upvalueindex(6) /* Keys to pcap sockets */
> +@@ -959,7 +959,7 @@ static int nsock_gc (lua_State *L)
> + }
> + 
> + 
> +-/****************** PCAP_SOCKET ***********************************************/
> ++/****************** NM_PCAP_SOCKET ***********************************************/
> + 
> + static void dnet_to_pcap_device_name (lua_State *L, const char *device)
> + {
> +@@ -1026,7 +1026,7 @@ static int l_pcap_open (lua_State *L)
> +       nsock_iod_delete(*nsiod, NSOCK_PENDING_ERROR);
> +       luaL_error(L, "can't open pcap reader on %s", device);
> +     }
> +-    lua_pushvalue(L, PCAP_SOCKET);
> ++    lua_pushvalue(L, NM_PCAP_SOCKET);
> +     lua_setmetatable(L, -2);
> +     lua_pushvalue(L, 7); /* the pcap socket key */
> +     lua_pushvalue(L, -2); /* the pcap socket nsiod */
> +@@ -1134,7 +1134,7 @@ LUALIB_API int luaopen_nsock (lua_State *L)
> +   /* library upvalues */
> +   nsock_pool nsp = new_pool(L); /* NSOCK_POOL */
> +   lua_newtable(L); /* NSOCK_SOCKET */
> +-  lua_newtable(L); /* PCAP_SOCKET */
> ++  lua_newtable(L); /* NM_PCAP_SOCKET */
> +   nseU_weaktable(L, 0, MAX_PARALLELISM, "k"); /* THREAD_SOCKETS */
> +   nseU_weaktable(L, 0, 1000, "k"); /* CONNECT_WAITING */
> +   nseU_weaktable(L, 0, 0, "v"); /* KEY_PCAP */
> +@@ -1154,11 +1154,11 @@ LUALIB_API int luaopen_nsock (lua_State *L)
> +   lua_pop(L, 1); /* NSOCK_SOCKET */
> + 
> +   /* Create the nsock pcap metatable */
> +-  lua_pushvalue(L, top+3); /* PCAP_SOCKET */
> ++  lua_pushvalue(L, top+3); /* NM_PCAP_SOCKET */
> +   for (i = top+1; i <= top+nupvals; i++) lua_pushvalue(L, i);
> +   lua_pushcclosure(L, pcap_gc, nupvals);
> +   lua_setfield(L, top+3, "__gc");
> +-  lua_pop(L, 1); /* PCAP_SOCKET */
> ++  lua_pop(L, 1); /* NM_PCAP_SOCKET */
> + 
> + #if HAVE_OPENSSL
> +   /* Set up the SSL certificate userdata code in nse_ssl_cert.cc. */
> diff --git a/meta-oe/recipes-security/nmap/nmap_7.80.bb b/meta-oe/recipes-security/nmap/nmap_7.80.bb
> index f9fe82a91d..18b1a50246 100644
> --- a/meta-oe/recipes-security/nmap/nmap_7.80.bb
> +++ b/meta-oe/recipes-security/nmap/nmap_7.80.bb
> @@ -12,6 +12,7 @@ SRC_URI = "http://nmap.org/dist/${BP}.tar.bz2 \
>             file://0002-Fix-building-with-libc.patch \
>             file://0001-Make-ndiff-support-python3.patch \
>             file://0001-configure.ac-make-ndiff-depend-on-python3.patch \
> +           file://nmap-rename-enum-PCAP_SOCKET.patch \
>             "
>  
>  SRC_URI[md5sum] = "d37b75b06d1d40f27b76d60db420a1f5"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#126122): https://lists.openembedded.org/g/openembedded-devel/message/126122
> Mute This Topic: https://lists.openembedded.org/mt/118738443/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


