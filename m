Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.4462.1794542498156677793
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 12 Nov 2026 20:01:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=GrjGcksi;
 spf=pass (domain: gmail.com, ip: 74.125.224.54, mailfrom: schonm@gmail.com)
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-67c6a0abc2eso547523d50.0
        for <openembedded-devel@lists.openembedded.org>; Thu, 12 Nov 2026 20:01:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794542497; x=1795147297; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8U7w8RyW/Ts3WmJ5zfGrGQFrW4EBhfX6iFttEjlh3x8=;
        b=GrjGcksi2rZE2p+AQzfq/Phe5oH44IMAFq8j8h7qKmNpxXbFSH0mF9GYwdGP7aQe/t
         jp25iAKFB8xRfsw1UNhwS60e5qV4KwbvshAMb33SQyU5ZYzERyjfOn6ewbDx1YeO+oN4
         LKJHxw6lCYpkUpRF9u4H/3Mb3pW59MGoTjiGl2wX7gN/vbWAcTCLgaY6Jlvgd/MCDN4B
         oL/K/VBNMWI124OqoYCfU3EDHYzg4EmM3SSKaGvs4G/EhmgKn5cVK0v6c4kXB70jSVqF
         c1WdEhWKLVwaSG9uNjxmq2JL1OmI4xicQzYjcj97EwJkWrI4A7Q4m2sj9419EM6yCoor
         kfbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794542497; x=1795147297;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8U7w8RyW/Ts3WmJ5zfGrGQFrW4EBhfX6iFttEjlh3x8=;
        b=fa7FmXjE8qlwGR1VYHjm+SXs2JM3y5jGi6Aqby+wreSww8MKAJoBlmMjAno2DbtnOg
         F0ol8dVRX4eYaEBcUMqQS60njTlJ+D53rDED2qvPb4GU7FkHXnoi4TUKcvjRfGufrpaa
         Ay0F7FbnOYOMk/ikx3+X/b1VOjMtU0TR8Ik5zq0RifyixlPGmzd29J0mKC6kRimXkZ6q
         v4EQNc4gz6YBUEoQpuF5BCUFBYdDbziMwRdyNSDtrA6lfMerNuznNw2orq1uCgqxsKqE
         LhbyDeLdxFTDoXwaolWwdWlHLiTjb96e1RTqfPAMY5HekVshkuMJe7GuW44xwgKXDRSB
         ZjgA==
X-Gm-Message-State: APuU4Z+FWGprQhdukZ7kfNPNrJvYMarHOmuzjDjrig6G+5o1ZMFRRCj1
	TZXk0ai17JiQer3/AQL00GQbNDnNWI+qQCmGL+mRYpiRKGrrV3ReUIz/0Pb7ef0W
X-Gm-Gg: AYBFou3BJJHH0qrDg+paC/2KKnWM4ed+sSgoYxB57r86oCn2HISr/00EDB/KyxCl0tJ
	Pqqra50xljU7X9+wggqB8fTtqKBaAY3RNcRUiiNmzqp73Kanc5TCt1eAoAUuTTan+WsgCjdq/4m
	ZqNlUNuNAUQ65sXaV9e6s2CW4tH+IE8GZEzJo42SxVyHAwSpoDjQqzO2HcI9tQ6GAZJtmg2uHoY
	ZlpE7ZTQz0cwqu3EJn7JiefE2YggzTz+OBvNZH5YM1Y6bLC0dGIR0XLSxcoS2y7a79koet6Lkaa
	m5Agk8NWGzzLGLN+nGnc2YkjV9dTjYk+Nt6/t9/htEoazEqCdmOVEKnscLwtuy6azuRvPTNvX35
	2hj5tHgq/4mC4qLCBOgWnnsQ0TJbc2pl38obWnqmQuEEaT8nhubAJX8SE3YgMPQStob7leV5l13
	wIUjbA6NVQjfmWWU5+39QTJIQrDNzXO901YijYxD3CZ7xDWh7gjKObou5i51DKTrZPvAYoZPFwn
	sp1yPiu2YC2VL/pmH/wM/kksN2Vv+pyFvGcY7KE4pgD85mrlmz4w9IWOgfVaOYg+z3mMFbC1n37
	5cFSnpbmUUTmT8Ke2r+X2+wYeQ6Btko/8shJgl01c4nfD034nISkEzeRtCs5YmDWGeIKStqaNKB
	LfdnyGsuL3sC/HM4UAfD31on2Ub+0nvpFddG3ObawxDnOb06bwMPz1w==
X-Received: by 2002:a05:690e:4002:b0:679:a2c3:b2e9 with SMTP id 956f58d0204a3-67d897a639dmr790857d50.101.1794542496964;
        Thu, 12 Nov 2026 20:01:36 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67d8a629a2dsm1039809d50.21.2026.11.12.20.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 20:01:36 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH] apache2: upgrade 2.4.70 -> 2.4.71
Date: Thu, 12 Nov 2026 23:01:21 -0500
Message-ID: <20261113040121.1553219-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Fri, 13 Nov 2026 04:01:48 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132222
Content-Type: text/plain; charset="utf-8"

Fix [buildpaths] qa issue in config_vars.mk

Changes with Apache 2.4.71

  *) SECURITY: CVE-2026-119618: mod_http2: heap corruption and RCE in
     assign_headers (cve.mitre.org)
     Concurrent Execution using Shared Resource with Improper
     Synchronization vulnerability in Apache HTTP Server's mod_http2
     in assign_headers() can lead to RCE.
     This issue affects Apache HTTP Server: from 2.4.55 through
     2.4.70.
     Affected releases of mod_h2 from GitHub: from 2.0.8 through
     2.0.42.
     Credits: Anthropic's OSS Scanner, as vulnerability
     ANT-2026-MAPKT6MZ

  *) SECURITY: CVE-2026-109163: mod_vhost_alias 1 byte stack buffer
     overwrite (after CVE-2026-63292) (cve.mitre.org)
     Stack-based buffer overflow vulnerability in Apache HTTP
     Server's mod_vhost_alias (afterÂ CVE-2026-63292)
     This issue affects Apache HTTP Server: 2.4.69 and 2.4.70.
     Credits: Gustavo Aiello

  *) SECURITY: CVE-2026-106023: mod_md NULL pointer dereference leads
     to child process crash (cve.mitre.org)
     NULL pointer dereference vulnerability in Apache HTTP Server's
     mod_md during HTTP request processing.
     This issue affects Apache HTTP Server: from 2.4.30 through
     2.4.70.
     Credits: hexb1n, Yang Song, and JiaSheng He of 360 Vulnerability
     Research Institute, working with 360 TuLongFeng.

  *) mod_md: MDHttpProxy and MDCACertificateFile can now be set per MDomain.
     New directive MDHttpProxyCACertificateFile sets the CA certificates
     used to verify an HTTPS proxy.
     [Michael Kaufmann <mail michael-kaufmann.ch>]

  *) mod_deflate: Read the gzip extra-field (FEXTRA) length as unsigned so a
     length byte with the high bit set is no longer sign-extended, fixing
     inflation of gzip streams that carry an extra field.
     [arshiya tabasum <arshi bugqore.com>]

  *) mod_remoteip: Apply RemoteIP{Trusted,Internal}ProxyList to the virtual host
     they are configured in, and merge the proxy entries of the main server
     and of the virtual host, logging a warning when both have some.
     PR 70207.  [Arturo Bernal]

  *) mod_dav: Fix handling of invalid or overflowing "Timeout:"
     request headers, which could silently grant a lock with an
     already-expired timeout instead of the RFC 4918 maximum.
     PR 65788 [Arturo Bernal]

  *) mod_http2: Correctly handle the asterisk-form of OPTIONS requests
     instead of rejecting them as malformed.  PR 70195.
     [Arturo Bernal <abernal apache.org>]

  *) mod_http2: Fix duplicate logging of header limit violations.
     [Michael Kaufmann <mail michael-kaufmann.ch>]

  *) mod_http2: Fix a crash creating an HTTP/2 session with
     "H2PushDiarySize 0" and debug logging enabled.  [Joe Orton]

  *) mod_dav_lock: Fix dav_generic_load_lock_record() reading the
     indirect-lock key length with the wrong width, which could read
     back a wrong length on big-endian platforms. PR 70299
     [Arturo Bernal]

  *) mod_remoteip: Log a connection closed before a complete PROXY protocol
     header was received at info level rather than as an error.  PR 63893.
     [Joe Orton]

Signed-off-by: Jason Schonberg <schonm@gmail.com>
---
 .../apache2/{apache2_2.4.70.bb => apache2_2.4.71.bb}           | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)
 rename meta-webserver/recipes-httpd/apache2/{apache2_2.4.70.bb => apache2_2.4.71.bb} (99%)

diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.71.bb
similarity index 99%
rename from meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
rename to meta-webserver/recipes-httpd/apache2/apache2_2.4.71.bb
index f34d622495..35c4b2f8b9 100644
--- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.70.bb
+++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.71.bb
@@ -27,7 +27,7 @@ SRC_URI:append:class-target = " \
            "
 
 LIC_FILES_CHKSUM = "file://LICENSE;md5=bddeddfac80b2c9a882241d008bb41c3"
-SRC_URI[sha256sum] = "1eefd7dc95836c5872894ce8e6a37f773d5a6764f0766869d39b8bcf0b1bafc3"
+SRC_URI[sha256sum] = "2bc5da5a33c247341de082717d4ebcb5cb49e8b73a05b7fddf7d5d6dc2f8de62"
 
 S = "${UNPACKDIR}/httpd-${PV}"
 
@@ -134,6 +134,7 @@ do_install:append:class-target() {
            -e 's,-fdebug-prefix-map[^ ]*,,g; s,-fmacro-prefix-map[^ ]*,,g; s,-ffile-prefix-map[^ ]*,,g' \
            -e 's,${HOSTTOOLS_DIR}/,,g' \
            -e 's,APU_INCLUDEDIR = .*,APU_INCLUDEDIR = ,g' \
+           -e 's,${HOME},,g' \
            -e 's,APU_CONFIG = .*,APU_CONFIG = ,g' ${D}${libexecdir}/${PN}/build/config_vars.mk
 
     sed -i -e 's,--sysroot=${STAGING_DIR_TARGET},,g' \
-- 
2.43.0

