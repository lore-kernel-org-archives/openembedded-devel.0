Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13314.1794673084610599109
 for <openembedded-devel@lists.openembedded.org>;
 Sat, 14 Nov 2026 08:18:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=NOP3Crhn;
 spf=pass (domain: gmail.com, ip: 209.85.128.172, mailfrom: schonm@gmail.com)
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b0d63f60bcso22633037b3.3
        for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 08:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794673083; x=1795277883; darn=lists.openembedded.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ACY0/5AuhF6xcc5xMdD83ueI8jtmkDTjN5QnCq18cRY=;
        b=NOP3Crhnl3CYcyIRnlfCunRlXfNzwrPVF0VbEgV5zMiodDFDgf6F7heWQjxBgCfqwf
         3WjUlTsFA2dLpoQMHYFKpsjFDDHmaXmr5PZFOq6KFtYqL8dfwRk9RHxFrfQ4VkHPI7ai
         j5EOLykW4m/UDviCbp8sqBupcs6D51MW1cbpz5+1fTe3Slaih3NHQa+Vk2sPIWBjv640
         i9v9NTaF5PzHReELKIj2tlf4HqWZNJvF6C9h5pDkYrfzrtfCIFIMtVdjv23PmO80XpJJ
         BqmQJWRpN0fjXo9rKL5AkzWyPbzocvuBrV69XQ60hLjJFzgBGYk1ada52u1uHu6SMdQt
         4hZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794673083; x=1795277883;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ACY0/5AuhF6xcc5xMdD83ueI8jtmkDTjN5QnCq18cRY=;
        b=ygPcUOAqtsbc7SwQLxXYHNL1PPv1vcrcxEyOVQ+5Ts65nGTo4dVYNnvCojToHMlLUJ
         CxS2oQYfRHg6/ccBr7wQ7t2XrPQomiX6lFN2tyyi+T0cKh8gPbc7fCWkUYNgZIzfAfcl
         +rZJonmaWx3I4fgv2LiQowugeANzcznC/MgaDo0stfnFa2s+LLiFbC60B+cSAgQSJWLz
         NXPnACZ06AjngjC7uDNbxCx915MRs0oURhyzpPq5Pa8ZLoSRhcJ0UZ0h2je0C/Hg1YFc
         1Ks/+hvQNElf0H+k7p9y9jpWrhDa8zBYxisJfSxyg+SRELfaaENghX+pcJq9kDFeMpO2
         JGVA==
X-Gm-Message-State: APuU4Z9bdtqbODHqbWYr11F3m4YUV6cM499lA8JV44Ug+xHtQR7HqIKw
	D1bOA30tn5F2fOP2t83Ee2zZrtKUgO9+ujf6QiR+RFt/Q2CUwd/UGT/FLpiO5jhJ
X-Gm-Gg: AYBFou2u4ZMZUy4QG7Zc3QDMIyCAZmSuj1C6g3iYT4VGw3mcea2Y38Bw1oo6biBCBr5
	yvx2tIHygQviiakpvvj6I79LUHrZ9EL5Pfg1LCiMRTSt7kKc+Q8lIUGT94f+1Hifqywpm+6e+Ot
	eHRKghut6vgX2i7lt+33XokRkrtF7XAjvLVT310VtoRg8Qv6mZQoQA1kAMK5+JlLhLX74wEffvs
	O5G/hXbg1B+RBTEVdJV9NXf29GXAKZWKBkP19mfJcVjZ1XIQsYefJvWPqlaTqMt6IQpzANn8mv+
	jCyNZmMxvwaecPnPhiLZY5eR5oFwWpfRGaIVNrogvsFm5Dvfl0KKK1w3aaIY+usfrT1wWEmtL/5
	wkhROhGn6XlMWMy7J4eLcuapVI3Oi3rfxOs3YS8USI2DZY0ZlweQ3TgLfFWOea01pvOuVJIvj7V
	wzW2JXzFRksXhW7l+kLozRHaAEzfu3j8KUyHW16bT6FT60dz13WlTo8gjwjvUzp4wAs8XRnyxMU
	33TXTLvGZUBiTFj3p89vL5xRF54XGpVJmmd8D9lc+GSw+JYajmSb941x2hso/g7gQRJa7XrCfkk
	OGOhcja411TK+5dlUWF+ayde73dgOE4PdY2vpwk29+PXH7RgqaljxQZ1ykPLFDxmPHeum9p+rFb
	hwt+MDzHcXrn9hs+Lsa3486oEbLc1oMcMeHIb2DbvvIhqJQmhOy3N
X-Received: by 2002:a05:690c:ec5:b0:8ab:4c8f:2844 with SMTP id 00721157ae682-8b4aa2a0f51mr38746447b3.39.1794673083350;
        Sat, 14 Nov 2026 08:18:03 -0800 (PST)
Return-Path: <schonm@gmail.com>
Received: from localhost.localdomain ([71.3.193.106])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b4aa9f4ad4sm47352917b3.40.2026.11.14.08.18.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 08:18:02 -0800 (PST)
From: Jason Schonberg <schonm@gmail.com>
To: openembedded-devel@lists.openembedded.org
Cc: Jason Schonberg <schonm@gmail.com>
Subject: [meta-webserver][PATCH v2] apache2: upgrade 2.4.70 -> 2.4.71
Date: Sat, 14 Nov 2026 11:17:53 -0500
Message-ID: <20261114161753.15793-1-schonm@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <openembedded-devel@lists.openembedded.org>; Sat, 14 Nov 2026 16:18:14 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/132257
Content-Type: text/plain; charset="utf-8"

Fix [buildpaths] qa issue in config_vars.mk
  ERROR: apache2-2.4.71-r0 do_package_qa: QA Issue:
  File /usr/libexec/apache2/build/config_vars.mk in package
  apache2-dev contains a reference to the build host HOME directory.

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

