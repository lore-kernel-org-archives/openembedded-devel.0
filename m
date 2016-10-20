Return-Path: <andre.draszik@gmail.com>
Received: from mail-lf0-f66.google.com (mail-lf0-f66.google.com
	[209.85.215.66])
	by mail.openembedded.org (Postfix) with ESMTP id 727886080F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 22:33:23 +0000 (UTC)
Received: by mail-lf0-f66.google.com with SMTP id b75so2707386lfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Oct 2016 15:33:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:from:to:subject:date:message-id:mime-version
	:content-transfer-encoding;
	bh=3dYSA2I6gxUGCV/cN1jEbo5toHzAmu8UjWfaAtS7Yhs=;
	b=H95en8w37YZKpdhUtPEeE90NbWLU1qARizbn9jinKxkre5eJ4NguNUdjprfr0SrlOD
	heRdXympyyqxWol0QcnqoAjCWF4ixzwCv7nATE446zVeMdzOOMSphSOGweDBwQfht1N6
	KubYhPokMWG6t0f3WYMQrrWjPj2oTxViVXtluXMwlMqXMRHXb8l2J5wqbqGI6GEfDIy5
	uEcczl9w4XkKMFHri5/Jo7TjcM13ECjLrCSyp7fogBxB3GTuLk96W6PhAcYjWR23RkRD
	94yoUXiIKJPc0k83K3s+7pXEVI/Y5WbbRs2aUyk0IsMiqS6aGnZibucVq5Hjdf3/zwSF
	Tg7A==
X-Gm-Message-State: AA6/9RlNRFCrNfeI6Z40YrwcmOADJPXXFJ7vM2eX0pgs8uUVl9v/WwKbMotJTsGTfBC8Zg==
X-Received: by 10.194.246.169 with SMTP id xx9mr1636580wjc.76.1477002803581;
	Thu, 20 Oct 2016 15:33:23 -0700 (PDT)
Received: from tfsielt31850.tycofs.com (31-187-15-27.dynamic.upc.ie.
	[31.187.15.27])
	by smtp.gmail.com with ESMTPSA id o143sm849036wmd.7.2016.10.20.15.33.22
	for <openembedded-devel@lists.openembedded.org>
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Thu, 20 Oct 2016 15:33:22 -0700 (PDT)
From: =?UTF-8?q?Andr=C3=A9=20Draszik?= <git@andred.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 20 Oct 2016 23:33:21 +0100
Message-Id: <20161020223321.7992-1-git@andred.net>
X-Mailer: git-send-email 2.9.3
MIME-Version: 1.0
Subject: [meta-networking][morty][PATCH] c-ares: fix CVE-2016-5180
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
X-List-Received-Date: Thu, 20 Oct 2016 22:33:24 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Backport patch to fix CVE-2016-5180 from c-ares upstream:
  https://c-ares.haxx.se/adv_20160929.html

Signed-off-by: André Draszik <git@andred.net>
---
 .../c-ares/c-ares/CVE-2016-5180.patch              | 166 +++++++++++++++++++++
 .../recipes-support/c-ares/c-ares_1.11.0.bb        |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 meta-networking/recipes-support/c-ares/c-ares/CVE-2016-5180.patch

diff --git a/meta-networking/recipes-support/c-ares/c-ares/CVE-2016-5180.patch b/meta-networking/recipes-support/c-ares/c-ares/CVE-2016-5180.patch
new file mode 100644
index 0000000..0b4fbb4
--- /dev/null
+++ b/meta-networking/recipes-support/c-ares/c-ares/CVE-2016-5180.patch
@@ -0,0 +1,166 @@
+From 115fe381c75147352d7a8d21aa3ffb85ca367219 Mon Sep 17 00:00:00 2001
+From: Daniel Stenberg <daniel@haxx.se>
+Date: Fri, 23 Sep 2016 14:44:11 +0200
+Subject: [PATCH] ares_create_query: avoid single-byte buffer overwrite
+
+... when the name ends with an escaped dot.
+
+CVE-2016-5180
+
+Bug: https://c-ares.haxx.se/adv_20160929.html
+---
+Upstream-Status: Backport [https://c-ares.haxx.se/adv_20160929.html]
+CVE: CVE-2016-5180
+Signed-off-by: André Draszik <git@andred.net>
+ ares_create_query.c | 84 +++++++++++++++++++++++++----------------------------
+ 1 file changed, 39 insertions(+), 45 deletions(-)
+
+diff --git a/ares_create_query.c b/ares_create_query.c
+index a34dda7..7f4c52d 100644
+--- a/ares_create_query.c
++++ b/ares_create_query.c
+@@ -83,61 +83,35 @@
+  * label.  The list is terminated by a label of length zero (which can
+  * be thought of as the root domain).
+  */
+ 
+ int ares_create_query(const char *name, int dnsclass, int type,
+-                      unsigned short id, int rd, unsigned char **buf,
+-                      int *buflen, int max_udp_size)
++                      unsigned short id, int rd, unsigned char **bufp,
++                      int *buflenp, int max_udp_size)
+ {
+-  int len;
++  size_t len;
+   unsigned char *q;
+   const char *p;
++  size_t buflen;
++  unsigned char *buf;
+ 
+   /* Set our results early, in case we bail out early with an error. */
+-  *buflen = 0;
+-  *buf = NULL;
++  *buflenp = 0;
++  *bufp = NULL;
+ 
+-  /* Compute the length of the encoded name so we can check buflen.
+-   * Start counting at 1 for the zero-length label at the end. */
+-  len = 1;
+-  for (p = name; *p; p++)
+-    {
+-      if (*p == '\\' && *(p + 1) != 0)
+-        p++;
+-      len++;
+-    }
+-  /* If there are n periods in the name, there are n + 1 labels, and
+-   * thus n + 1 length fields, unless the name is empty or ends with a
+-   * period.  So add 1 unless name is empty or ends with a period.
++  /* Allocate a memory area for the maximum size this packet might need. +2
++   * is for the length byte and zero termination if no dots or ecscaping is
++   * used.
+    */
+-  if (*name && *(p - 1) != '.')
+-    len++;
+-
+-  /* Immediately reject names that are longer than the maximum of 255
+-   * bytes that's specified in RFC 1035 ("To simplify implementations,
+-   * the total length of a domain name (i.e., label octets and label
+-   * length octets) is restricted to 255 octets or less."). We aren't
+-   * doing this just to be a stickler about RFCs. For names that are
+-   * too long, 'dnscache' closes its TCP connection to us immediately
+-   * (when using TCP) and ignores the request when using UDP, and
+-   * BIND's named returns ServFail (TCP or UDP). Sending a request
+-   * that we know will cause 'dnscache' to close the TCP connection is
+-   * painful, since that makes any other outstanding requests on that
+-   * connection fail. And sending a UDP request that we know
+-   * 'dnscache' will ignore is bad because resources will be tied up
+-   * until we time-out the request.
+-   */
+-  if (len > MAXCDNAME)
+-    return ARES_EBADNAME;
+-
+-  *buflen = len + HFIXEDSZ + QFIXEDSZ + (max_udp_size ? EDNSFIXEDSZ : 0);
+-  *buf = ares_malloc(*buflen);
+-  if (!*buf)
+-      return ARES_ENOMEM;
++  len = strlen(name) + 2 + HFIXEDSZ + QFIXEDSZ +
++    (max_udp_size ? EDNSFIXEDSZ : 0);
++  buf = ares_malloc(len);
++  if (!buf)
++    return ARES_ENOMEM;
+ 
+   /* Set up the header. */
+-  q = *buf;
++  q = buf;
+   memset(q, 0, HFIXEDSZ);
+   DNS_HEADER_SET_QID(q, id);
+   DNS_HEADER_SET_OPCODE(q, QUERY);
+   if (rd) {
+     DNS_HEADER_SET_RD(q, 1);
+@@ -157,23 +131,27 @@ int ares_create_query(const char *name, int dnsclass, int type,
+ 
+   /* Start writing out the name after the header. */
+   q += HFIXEDSZ;
+   while (*name)
+     {
+-      if (*name == '.')
++      if (*name == '.') {
++        free (buf);
+         return ARES_EBADNAME;
++      }
+ 
+       /* Count the number of bytes in this label. */
+       len = 0;
+       for (p = name; *p && *p != '.'; p++)
+         {
+           if (*p == '\\' && *(p + 1) != 0)
+             p++;
+           len++;
+         }
+-      if (len > MAXLABEL)
++      if (len > MAXLABEL) {
++        free (buf);
+         return ARES_EBADNAME;
++      }
+ 
+       /* Encode the length and copy the data. */
+       *q++ = (unsigned char)len;
+       for (p = name; *p && *p != '.'; p++)
+         {
+@@ -193,16 +171,32 @@ int ares_create_query(const char *name, int dnsclass, int type,
+ 
+   /* Finish off the question with the type and class. */
+   DNS_QUESTION_SET_TYPE(q, type);
+   DNS_QUESTION_SET_CLASS(q, dnsclass);
+ 
++  q += QFIXEDSZ;
+   if (max_udp_size)
+   {
+-      q += QFIXEDSZ;
+       memset(q, 0, EDNSFIXEDSZ);
+       q++;
+       DNS_RR_SET_TYPE(q, T_OPT);
+       DNS_RR_SET_CLASS(q, max_udp_size);
++      q += (EDNSFIXEDSZ-1);
++  }
++  buflen = (q - buf);
++
++  /* Reject names that are longer than the maximum of 255 bytes that's
++   * specified in RFC 1035 ("To simplify implementations, the total length of
++   * a domain name (i.e., label octets and label length octets) is restricted
++   * to 255 octets or less."). */
++  if (buflen > (MAXCDNAME + HFIXEDSZ + QFIXEDSZ +
++                (max_udp_size ? EDNSFIXEDSZ : 0))) {
++    free (buf);
++    return ARES_EBADNAME;
+   }
+ 
++  /* we know this fits in an int at this point */
++  *buflenp = (int) buflen;
++  *bufp = buf;
++
+   return ARES_SUCCESS;
+ }
+-- 
+2.9.3
+
diff --git a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
index c98be7d..bea2332 100644
--- a/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
+++ b/meta-networking/recipes-support/c-ares/c-ares_1.11.0.bb
@@ -7,6 +7,7 @@ LICENSE = "MIT"
 LIC_FILES_CHKSUM = "file://ares_init.c;beginline=1;endline=3;md5=53f5ecf4c22c37cf1ddd1ef8f8eccce0"
 
 SRC_URI = "http://c-ares.haxx.se/download/${BP}.tar.gz \
+           file://CVE-2016-5180.patch \
            file://0001-configure.ac-don-t-override-passed-cflags.patch \
 "
 SRC_URI[md5sum] = "d5c6d522cfc54bb6f215a0b7912d46be"
-- 
2.9.3


