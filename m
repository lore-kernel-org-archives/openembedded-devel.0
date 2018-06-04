Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id 9D79D74F9C
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  4 Jun 2018 02:49:09 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id e11-v6so4589706pgq.0
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 03 Jun 2018 19:49:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:subject:date:message-id:in-reply-to:references;
	bh=b1vHabkvuTbwyfXaUdZzSzXJU/Hs2dzjFfderh3bGPc=;
	b=FYHrukyCc/eDBCAeS2ujItjQSSdXe71VgU5/WYDtY+j4k+V4bMTJaq0zPXl6Rf2Hfw
	GYw9JMbAGXpcFTIUKAAwqNPPw8D3AP2gSS1ROgTTV20aoADobwPnb2v15jrPjgYw3UYm
	D5tBvclxqryMtfOBTv9UgJjJSxqM2X8es9au//H4zuqpRE7l+144xPVIbYW/7w4gWJuy
	dwwnG0cjIzYZAgomUnCBzcQ2A/xAC3fjcGmyDMJvT2vmXLnt+yrHngBhdSbabAtCrvXo
	1++b5ZG4a/YGc80j5/kW+p59Ii07ftDtY0gmChxo15qfRhRyr7IvGg/UAsMG6CvYhYHG
	FlwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
	:references;
	bh=b1vHabkvuTbwyfXaUdZzSzXJU/Hs2dzjFfderh3bGPc=;
	b=uBQk6ItF1ILZurUlh0CSnbl8BcbVtm0TNmm5BYtwgqQrCdLC3/uQ+9PcFF+qMtuDMB
	y+rZ8lsdq91nfwRI8LnWUQ9EmMOtqN9XWsyZFt/NSTQrEyPdz96KqXSnlF/D0xoq9vKL
	dWgEKjLJYg8qzDofN1Nnd9IL82gXoSgLM3sVixVe36YGb6771CH4nzMJR/+zRqQXQUo8
	X61H9JcFjm9MVwqhr04cNfJgsc81/4utshbpZc69JYpqNcfeEY4k64fhMo6tA/gfvKS7
	zo73zkaz2dAtl+6GlF9c7/htNnSWIi1SvqR3TmpB156ni+b3wd5EVzr1UKDBLTAjt9q4
	d1Sg==
X-Gm-Message-State: ALKqPwdcN7zM3iCuUzREma2nw3JhxTNda+rF2zhwcg36fV8BYnxWBEuD
	Q7cIdTLPfP+IWIo1ghYyOEe76g==
X-Google-Smtp-Source: ADUXVKL7WLeGCvMNwx/PWSug9Sal0MM5lllnHvjyOXvs/FdN894JSeOOkB59wkt3JuiXltjx/Qaahg==
X-Received: by 2002:a63:384d:: with SMTP id
	h13-v6mr15788455pgn.209.1528080550466; 
	Sun, 03 Jun 2018 19:49:10 -0700 (PDT)
Received: from akuster-ThinkPad-T460s.hsd1.ca.comcast.net
	([2601:202:4000:1184:f1bd:c539:22b:bbf1])
	by smtp.gmail.com with ESMTPSA id
	o10-v6sm62844021pgc.80.2018.06.03.19.49.09
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
	Sun, 03 Jun 2018 19:49:09 -0700 (PDT)
From: Armin Kuster <akuster808@gmail.com>
To: akuster808@gmail.com,
	openembedded-devel@lists.openembedded.org
Date: Sun,  3 Jun 2018 19:48:49 -0700
Message-Id: <997caf9146cd3797cd054e2adebd1fbb4df91911.1528080420.git.akuster808@gmail.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <cover.1528080420.git.akuster808@gmail.com>
References: <cover.1528080420.git.akuster808@gmail.com>
Subject: [morty 15/15] dnsmasq: backport CVE fixes from dnsmasq 2.78
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
X-List-Received-Date: Mon, 04 Jun 2018 02:49:09 -0000

From: Zhang Xiao <xiao.zhang@windriver.com>

CVE-2017-1449{1-6}

Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
Signed-off-by: Joe Slater <joe.slater@windriver.com>
Signed-off-by: Armin Kuster <akuster808@gmail.com>
---
 .../dnsmasq/dnsmasq-CVE-2017-14491-02.patch        |  75 ++++++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch   | 268 +++++++++++++++++++++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch   |  37 +++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch   |  37 +++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch   |  37 +++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch   |  48 ++++
 .../dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch   |  73 ++++++
 .../recipes-support/dnsmasq/dnsmasq_2.76.bb        |   7 +
 8 files changed, 582 insertions(+)
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491-02.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch
 create mode 100644 meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch

diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491-02.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491-02.patch
new file mode 100644
index 0000000..3e73feb
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491-02.patch
@@ -0,0 +1,75 @@
+From e441ac5247cf8252ac8db08d53862af4065d9586 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Tue, 26 Sep 2017 22:00:11 +0100
+Subject: [PATCH 7/7] Security fix, CVE-2017-14491, DNS heap buffer overflow.
+
+commit 62cb936cb7ad5f219715515ae7d32dd281a5aa1f upstream
+git://thekelleys.org.uk/dnsmasq
+
+Further fix to 0549c73b7ea6b22a3c49beb4d432f185a81efcbc
+Handles case when RR name is not a pointer to the question,
+only occurs for some auth-mode replies, therefore not
+detected by fuzzing (?)
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/rfc1035.c | 27 +++++++++++++++------------
+ 1 file changed, 15 insertions(+), 12 deletions(-)
+
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index 78410d6..e5628ba 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -1071,32 +1071,35 @@ int add_resource_record(struct dns_header *header, char *limit, int *truncp, int
+ 
+   va_start(ap, format);   /* make ap point to 1st unamed argument */
+ 
+-  /* nameoffset (1 or 2) + type (2) + class (2) + ttl (4) + 0 (2) */
+-  CHECK_LIMIT(12);
+-
+   if (nameoffset > 0)
+     {
++      CHECK_LIMIT(2);
+       PUTSHORT(nameoffset | 0xc000, p);
+     }
+   else
+     {
+       char *name = va_arg(ap, char *);
+-      if (name)
+-	p = do_rfc1035_name(p, name, limit);
+-        if (!p)
+-          {
+-            va_end(ap);
+-            goto truncated;
+-          }
+-
++      if (name && !(p = do_rfc1035_name(p, name, limit)))
++	{
++	  va_end(ap);
++	  goto truncated;
++	}
++      
+       if (nameoffset < 0)
+ 	{
++	  CHECK_LIMIT(2);
+ 	  PUTSHORT(-nameoffset | 0xc000, p);
+ 	}
+       else
+-	*p++ = 0;
++	{
++	  CHECK_LIMIT(1);
++	  *p++ = 0;
++	}
+     }
+ 
++  /* type (2) + class (2) + ttl (4) + rdlen (2) */
++  CHECK_LIMIT(10);
++  
+   PUTSHORT(type, p);
+   PUTSHORT(class, p);
+   PUTLONG(ttl, p);      /* TTL */
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch
new file mode 100644
index 0000000..0598678
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14491.patch
@@ -0,0 +1,268 @@
+From 8644f7c99c5e2fde6b6872a4ab820d3520f44e24 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Mon, 25 Sep 2017 18:17:11 +0100
+Subject: [PATCH 1/7] Security fix, CVE-2017-14491 DNS heap buffer overflow.
+
+commit 0549c73b7ea6b22a3c49beb4d432f185a81efcbc upstream
+git://thekelleys.org.uk/dnsmasq
+
+Fix heap overflow in DNS code. This is a potentially serious
+security hole. It allows an attacker who can make DNS
+requests to dnsmasq, and who controls the contents of
+a domain, which is thereby queried, to overflow
+(by 2 bytes) a heap buffer and either crash, or
+even take control of, dnsmasq.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/dnsmasq.h |  2 +-
+ src/dnssec.c  |  2 +-
+ src/option.c  |  2 +-
+ src/rfc1035.c | 50 +++++++++++++++++++++++++++++++++++++++++---------
+ src/rfc2131.c |  4 ++--
+ src/rfc3315.c |  4 ++--
+ src/util.c    |  7 ++++++-
+ 7 files changed, 54 insertions(+), 17 deletions(-)
+
+diff --git a/src/dnsmasq.h b/src/dnsmasq.h
+index 1896a64..ed5da36 100644
+--- a/src/dnsmasq.h
++++ b/src/dnsmasq.h
+@@ -1161,7 +1161,7 @@ u32 rand32(void);
+ u64 rand64(void);
+ int legal_hostname(char *c);
+ char *canonicalise(char *s, int *nomem);
+-unsigned char *do_rfc1035_name(unsigned char *p, char *sval);
++unsigned char *do_rfc1035_name(unsigned char *p, char *sval, char *limit);
+ void *safe_malloc(size_t size);
+ void safe_pipe(int *fd, int read_noblock);
+ void *whine_malloc(size_t size);
+diff --git a/src/dnssec.c b/src/dnssec.c
+index 3c77c7d..f45c804 100644
+--- a/src/dnssec.c
++++ b/src/dnssec.c
+@@ -2227,7 +2227,7 @@ size_t dnssec_generate_query(struct dns_header *header, unsigned char *end, char
+ 
+   p = (unsigned char *)(header+1);
+ 	
+-  p = do_rfc1035_name(p, name);
++  p = do_rfc1035_name(p, name, NULL);
+   *p++ = 0;
+   PUTSHORT(type, p);
+   PUTSHORT(class, p);
+diff --git a/src/option.c b/src/option.c
+index d8c57d6..0e1c326 100644
+--- a/src/option.c
++++ b/src/option.c
+@@ -1378,7 +1378,7 @@ static int parse_dhcp_opt(char *errstr, char *arg, int flags)
+ 		    }
+ 		  
+ 		  p = newp;
+-		  end = do_rfc1035_name(p + len, dom);
++		  end = do_rfc1035_name(p + len, dom, NULL);
+ 		  *end++ = 0;
+ 		  len = end - p;
+ 		  free(dom);
+diff --git a/src/rfc1035.c b/src/rfc1035.c
+index 24d08c1..78410d6 100644
+--- a/src/rfc1035.c
++++ b/src/rfc1035.c
+@@ -1049,6 +1049,7 @@ int check_for_ignored_address(struct dns_header *header, size_t qlen, struct bog
+   return 0;
+ }
+ 
++
+ int add_resource_record(struct dns_header *header, char *limit, int *truncp, int nameoffset, unsigned char **pp, 
+ 			unsigned long ttl, int *offset, unsigned short type, unsigned short class, char *format, ...)
+ {
+@@ -1058,12 +1059,21 @@ int add_resource_record(struct dns_header *header, char *limit, int *truncp, int
+   unsigned short usval;
+   long lval;
+   char *sval;
++#define CHECK_LIMIT(size) \
++  if (limit && p + (size) > (unsigned char*)limit) \
++    { \
++      va_end(ap); \
++      goto truncated; \
++    }
+ 
+   if (truncp && *truncp)
+     return 0;
+- 
++
+   va_start(ap, format);   /* make ap point to 1st unamed argument */
+-  
++
++  /* nameoffset (1 or 2) + type (2) + class (2) + ttl (4) + 0 (2) */
++  CHECK_LIMIT(12);
++
+   if (nameoffset > 0)
+     {
+       PUTSHORT(nameoffset | 0xc000, p);
+@@ -1072,7 +1082,13 @@ int add_resource_record(struct dns_header *header, char *limit, int *truncp, int
+     {
+       char *name = va_arg(ap, char *);
+       if (name)
+-	p = do_rfc1035_name(p, name);
++	p = do_rfc1035_name(p, name, limit);
++        if (!p)
++          {
++            va_end(ap);
++            goto truncated;
++          }
++
+       if (nameoffset < 0)
+ 	{
+ 	  PUTSHORT(-nameoffset | 0xc000, p);
+@@ -1093,6 +1109,7 @@ int add_resource_record(struct dns_header *header, char *limit, int *truncp, int
+       {
+ #ifdef HAVE_IPV6
+       case '6':
++        CHECK_LIMIT(IN6ADDRSZ);
+ 	sval = va_arg(ap, char *); 
+ 	memcpy(p, sval, IN6ADDRSZ);
+ 	p += IN6ADDRSZ;
+@@ -1100,36 +1117,47 @@ int add_resource_record(struct dns_header *header, char *limit, int *truncp, int
+ #endif
+ 	
+       case '4':
++        CHECK_LIMIT(INADDRSZ);
+ 	sval = va_arg(ap, char *); 
+ 	memcpy(p, sval, INADDRSZ);
+ 	p += INADDRSZ;
+ 	break;
+ 	
+       case 'b':
++        CHECK_LIMIT(1);
+ 	usval = va_arg(ap, int);
+ 	*p++ = usval;
+ 	break;
+ 	
+       case 's':
++        CHECK_LIMIT(2);
+ 	usval = va_arg(ap, int);
+ 	PUTSHORT(usval, p);
+ 	break;
+ 	
+       case 'l':
++        CHECK_LIMIT(4);
+ 	lval = va_arg(ap, long);
+ 	PUTLONG(lval, p);
+ 	break;
+ 	
+       case 'd':
+-	/* get domain-name answer arg and store it in RDATA field */
+-	if (offset)
+-	  *offset = p - (unsigned char *)header;
+-	p = do_rfc1035_name(p, va_arg(ap, char *));
+-	*p++ = 0;
++        /* get domain-name answer arg and store it in RDATA field */
++        if (offset)
++          *offset = p - (unsigned char *)header;
++        p = do_rfc1035_name(p, va_arg(ap, char *), limit);
++        if (!p)
++          {
++            va_end(ap);
++            goto truncated;
++          }
++        CHECK_LIMIT(1);
++        *p++ = 0;
+ 	break;
+ 	
+       case 't':
+ 	usval = va_arg(ap, int);
++        CHECK_LIMIT(usval);
+ 	sval = va_arg(ap, char *);
+ 	if (usval != 0)
+ 	  memcpy(p, sval, usval);
+@@ -1141,20 +1169,24 @@ int add_resource_record(struct dns_header *header, char *limit, int *truncp, int
+ 	usval = sval ? strlen(sval) : 0;
+ 	if (usval > 255)
+ 	  usval = 255;
++        CHECK_LIMIT(usval + 1);
+ 	*p++ = (unsigned char)usval;
+ 	memcpy(p, sval, usval);
+ 	p += usval;
+ 	break;
+       }
+ 
++#undef CHECK_LIMIT
+   va_end(ap);	/* clean up variable argument pointer */
+   
+   j = p - sav - 2;
+-  PUTSHORT(j, sav);     /* Now, store real RDLength */
++ /* this has already been checked against limit before */
++ PUTSHORT(j, sav);     /* Now, store real RDLength */
+   
+   /* check for overflow of buffer */
+   if (limit && ((unsigned char *)limit - p) < 0)
+     {
++truncated:
+       if (truncp)
+ 	*truncp = 1;
+       return 0;
+diff --git a/src/rfc2131.c b/src/rfc2131.c
+index b7c167e..0dffd36 100644
+--- a/src/rfc2131.c
++++ b/src/rfc2131.c
+@@ -2419,10 +2419,10 @@ static void do_options(struct dhcp_context *context,
+ 
+ 	      if (fqdn_flags & 0x04)
+ 		{
+-		  p = do_rfc1035_name(p, hostname);
++		  p = do_rfc1035_name(p, hostname, NULL);
+ 		  if (domain)
+ 		    {
+-		      p = do_rfc1035_name(p, domain);
++		      p = do_rfc1035_name(p, domain, NULL);
+ 		      *p++ = 0;
+ 		    }
+ 		}
+diff --git a/src/rfc3315.c b/src/rfc3315.c
+index 3f4d69c..73bdee4 100644
+--- a/src/rfc3315.c
++++ b/src/rfc3315.c
+@@ -1472,10 +1472,10 @@ static struct dhcp_netid *add_options(struct state *state, int do_refresh)
+       if ((p = expand(len + 2)))
+ 	{
+ 	  *(p++) = state->fqdn_flags;
+-	  p = do_rfc1035_name(p, state->hostname);
++	  p = do_rfc1035_name(p, state->hostname, NULL);
+ 	  if (state->send_domain)
+ 	    {
+-	      p = do_rfc1035_name(p, state->send_domain);
++	      p = do_rfc1035_name(p, state->send_domain, NULL);
+ 	      *p = 0;
+ 	    }
+ 	}
+diff --git a/src/util.c b/src/util.c
+index 93b24f5..a377e6f 100644
+--- a/src/util.c
++++ b/src/util.c
+@@ -218,15 +218,20 @@ char *canonicalise(char *in, int *nomem)
+   return ret;
+ }
+ 
+-unsigned char *do_rfc1035_name(unsigned char *p, char *sval)
++unsigned char *do_rfc1035_name(unsigned char *p, char *sval, char *limit)
+ {
+   int j;
+   
+   while (sval && *sval)
+     {
++      if (limit && p + 1 > (unsigned char*)limit)
++        return p;
++
+       unsigned char *cp = p++;
+       for (j = 0; *sval && (*sval != '.'); sval++, j++)
+ 	{
++          if (limit && p + 1 > (unsigned char*)limit)
++            return p;
+ #ifdef HAVE_DNSSEC
+ 	  if (option_bool(OPT_DNSSEC_VALID) && *sval == NAME_ESCAPE)
+ 	    *p++ = (*(++sval))-1;
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch
new file mode 100644
index 0000000..1994931
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14492.patch
@@ -0,0 +1,37 @@
+From 6a0e7dbac67a8393e4505e593e5c46544c53eae0 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Mon, 25 Sep 2017 18:47:15 +0100
+Subject: [PATCH 2/7] Security fix, CVE-2017-14492, DHCPv6 RA heap overflow.
+
+commit 24036ea507862c7b7898b68289c8130f85599c10 upstream
+git://thekelleys.org.uk/dnsmasq
+
+Fix heap overflow in IPv6 router advertisement code.
+This is a potentially serious security hole, as a
+crafted RA request can overflow a buffer and crash or
+control dnsmasq. Attacker must be on the local network.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/radv.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/radv.c b/src/radv.c
+index 749b666..d09fe0e 100644
+--- a/src/radv.c
++++ b/src/radv.c
+@@ -198,6 +198,9 @@ void icmp6_packet(time_t now)
+       /* look for link-layer address option for logging */
+       if (sz >= 16 && packet[8] == ICMP6_OPT_SOURCE_MAC && (packet[9] * 8) + 8 <= sz)
+ 	{
++	  if ((packet[9] * 8 - 2) * 3 - 1 >= MAXDNAME) {
++	    return;
++	  }
+ 	  print_mac(daemon->namebuff, &packet[10], (packet[9] * 8) - 2);
+ 	  mac = daemon->namebuff;
+ 	}
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch
new file mode 100644
index 0000000..ae99cf4
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14493.patch
@@ -0,0 +1,37 @@
+From f23f4be3cb72d307806e3d3ca14779f69ac5494c Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Mon, 25 Sep 2017 18:52:50 +0100
+Subject: [PATCH 3/7] Security fix, CVE-2017-14493, DHCPv6 - Stack buffer
+ overflow.
+
+commit 3d4ff1ba8419546490b464418223132529514033 upstream
+git://thekelleys.org.uk/dnsmasq
+
+Fix stack overflow in DHCPv6 code. An attacker who can send
+a DHCPv6 request to dnsmasq can overflow the stack frame and
+crash or control dnsmasq.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/rfc3315.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/rfc3315.c b/src/rfc3315.c
+index 73bdee4..8d18a28 100644
+--- a/src/rfc3315.c
++++ b/src/rfc3315.c
+@@ -206,6 +206,9 @@ static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
+   /* RFC-6939 */
+   if ((opt = opt6_find(opts, end, OPTION6_CLIENT_MAC, 3)))
+     {
++      if (opt6_len(opt) - 2 > DHCP_CHADDR_MAX) {
++        return 0;
++      }
+       state->mac_type = opt6_uint(opt, 0, 2);
+       state->mac_len = opt6_len(opt) - 2;
+       memcpy(&state->mac[0], opt6_ptr(opt, 2), state->mac_len);
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch
new file mode 100644
index 0000000..a6f0e2a
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14494.patch
@@ -0,0 +1,37 @@
+From aba3f8df87d104d599920ea44e96191601638961 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Mon, 25 Sep 2017 20:05:11 +0100
+Subject: [PATCH 4/7] Security fix, CVE-2017-14494, Infoleak handling DHCPv6
+ forwarded requests.
+
+commit 33e3f1029c9ec6c63e430ff51063a6301d4b2262 upstream
+git://thekelleys.org.uk/dnsmasq
+
+Fix information leak in DHCPv6. A crafted DHCPv6 packet can
+cause dnsmasq to forward memory from outside the packet
+buffer to a DHCPv6 server when acting as a relay.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/rfc3315.c | 3 +++
+ 1 file changed, 3 insertions(+)
+
+diff --git a/src/rfc3315.c b/src/rfc3315.c
+index 8d18a28..03b3f84 100644
+--- a/src/rfc3315.c
++++ b/src/rfc3315.c
+@@ -216,6 +216,9 @@ static int dhcp6_maybe_relay(struct state *state, void *inbuff, size_t sz,
+   
+   for (opt = opts; opt; opt = opt6_next(opt, end))
+     {
++      if (opt6_ptr(opt, 0) + opt6_len(opt) >= end) {
++        return 0;
++      }
+       int o = new_opt6(opt6_type(opt));
+       if (opt6_type(opt) == OPTION6_RELAY_MSG)
+ 	{
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch
new file mode 100644
index 0000000..31014d1
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14495.patch
@@ -0,0 +1,48 @@
+From e4ae220ee00dcad20a716432badd3210b442ddb4 Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Mon, 25 Sep 2017 20:16:50 +0100
+Subject: [PATCH 6/7] Security fix, CVE-2017-14495, OOM in DNS response
+ creation.
+
+commit 51eadb692a5123b9838e5a68ecace3ac579a3a45 upstream
+git://thekelleys.org.uk/dnsmasq
+
+Fix out-of-memory Dos vulnerability. An attacker which can
+send malicious DNS queries to dnsmasq can trigger memory
+allocations in the add_pseudoheader function
+The allocated memory is never freed which leads to a DoS
+through memory exhaustion. dnsmasq is vulnerable only
+if one of the following option is specified:
+--add-mac, --add-cpe-id or --add-subnet.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/edns0.c | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/src/edns0.c b/src/edns0.c
+index a2ef0ea..f48c084 100644
+--- a/src/edns0.c
++++ b/src/edns0.c
+@@ -192,9 +192,15 @@ size_t add_pseudoheader(struct dns_header *header, size_t plen, unsigned char *l
+ 	  !(p = skip_section(p, 
+ 			     ntohs(header->ancount) + ntohs(header->nscount) + ntohs(header->arcount), 
+ 			     header, plen)))
++      {
++	free(buff);
+ 	return plen;
++      }
+       if (p + 11 > limit)
+-       return plen; /* Too big */
++      {
++        free(buff);
++        return plen; /* Too big */
++      }
+       *p++ = 0; /* empty name */
+       PUTSHORT(T_OPT, p);
+       PUTSHORT(udp_sz, p); /* max packet length, 512 if not given in EDNS0 header */
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch
new file mode 100644
index 0000000..fc50ef0
--- /dev/null
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq/dnsmasq-CVE-2017-14496.patch
@@ -0,0 +1,73 @@
+From c25545680679a12d78dd80662ed1bc5d97a38d6d Mon Sep 17 00:00:00 2001
+From: Simon Kelley <simon@thekelleys.org.uk>
+Date: Mon, 25 Sep 2017 20:11:58 +0100
+Subject: [PATCH 5/7] Security fix, CVE-2017-14496, Integer underflow in DNS
+ response creation.
+
+commit 897c113fda0886a28a986cc6ba17bb93bd6cb1c7 upstream
+git://thekelleys.org.uk/dnsmasq
+
+Fix DoS in DNS. Invalid boundary checks in the
+add_pseudoheader function allows a memcpy call with negative
+size An attacker which can send malicious DNS queries
+to dnsmasq can trigger a DoS remotely.
+dnsmasq is vulnerable only if one of the following option is
+specified: --add-mac, --add-cpe-id or --add-subnet.
+
+Upstream-Status: Backport
+
+Signed-off-by: Zhang Xiao <xiao.zhang@windriver.com>
+---
+ src/edns0.c | 13 ++++++++++++-
+ 1 file changed, 12 insertions(+), 1 deletion(-)
+
+diff --git a/src/edns0.c b/src/edns0.c
+index c7a101e..a2ef0ea 100644
+--- a/src/edns0.c
++++ b/src/edns0.c
+@@ -144,7 +144,7 @@ size_t add_pseudoheader(struct dns_header *header, size_t plen, unsigned char *l
+ 	  GETSHORT(len, p);
+ 	  
+ 	  /* malformed option, delete the whole OPT RR and start again. */
+-	  if (i + len > rdlen)
++	  if (i + 4 + len > rdlen)
+ 	    {
+ 	      rdlen = 0;
+ 	      is_last = 0;
+@@ -193,6 +193,8 @@ size_t add_pseudoheader(struct dns_header *header, size_t plen, unsigned char *l
+ 			     ntohs(header->ancount) + ntohs(header->nscount) + ntohs(header->arcount), 
+ 			     header, plen)))
+ 	return plen;
++      if (p + 11 > limit)
++       return plen; /* Too big */
+       *p++ = 0; /* empty name */
+       PUTSHORT(T_OPT, p);
+       PUTSHORT(udp_sz, p); /* max packet length, 512 if not given in EDNS0 header */
+@@ -204,6 +206,11 @@ size_t add_pseudoheader(struct dns_header *header, size_t plen, unsigned char *l
+       /* Copy back any options */
+       if (buff)
+ 	{
++          if (p + rdlen > limit)
++          {
++            free(buff);
++            return plen; /* Too big */
++          }
+ 	  memcpy(p, buff, rdlen);
+ 	  free(buff);
+ 	  p += rdlen;
+@@ -217,8 +224,12 @@ size_t add_pseudoheader(struct dns_header *header, size_t plen, unsigned char *l
+   /* Add new option */
+   if (optno != 0 && replace != 2)
+     {
++      if (p + 4 > limit)
++       return plen; /* Too big */
+       PUTSHORT(optno, p);
+       PUTSHORT(optlen, p);
++      if (p + optlen > limit)
++       return plen; /* Too big */
+       memcpy(p, opt, optlen);
+       p += optlen;  
+       PUTSHORT(p - datap, lenp);
+-- 
+2.11.0
+
diff --git a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
index 41573d9..5b68d98 100644
--- a/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
+++ b/meta-networking/recipes-support/dnsmasq/dnsmasq_2.76.bb
@@ -2,6 +2,13 @@ require dnsmasq.inc
 
 SRC_URI += "\
     file://lua.patch \
+    file://dnsmasq-CVE-2017-14491.patch \
+    file://dnsmasq-CVE-2017-14492.patch \
+    file://dnsmasq-CVE-2017-14493.patch \
+    file://dnsmasq-CVE-2017-14494.patch \
+    file://dnsmasq-CVE-2017-14496.patch \
+    file://dnsmasq-CVE-2017-14495.patch \
+    file://dnsmasq-CVE-2017-14491-02.patch \
 "
 
 SRC_URI[dnsmasq-2.76.md5sum] = "6610f8233ca89b15a1bb47c788ffb84f"
-- 
2.7.4


