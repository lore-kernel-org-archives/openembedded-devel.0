Return-Path: <raj.khem@gmail.com>
Received: from mail-pg0-f66.google.com (mail-pg0-f66.google.com [74.125.83.66])
	by mail.openembedded.org (Postfix) with ESMTP id B32FC74DD2
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 19:19:44 +0000 (UTC)
Received: by mail-pg0-f66.google.com with SMTP id q14-v6so1324636pgt.13
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Jun 2018 12:19:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=0EBwlxXebn4DXton6USq6N08EBQXSTjhcs/GjJX++AA=;
	b=LEF7u2Ob2jbPULUyGZzyqWvsuTHxDU4uIRQ4DHY7SHOU6+PVPPogOepsHd7VzWuQTz
	7LcaVIKb1YoZ+rc6wacVP9hy5NrgrYCWkrg0z8HrluFnA54vuhd2ZV6zajmJkrmyK2AL
	Vnh2i0s4/oMtQFi8lUtxdUmBGlUecHpZbT2M9LYVz1sDYGSA3LD9f7Jk3DfOohI8tpAd
	KqcZFSk7NJflKJP7KYTV9Dp1hL46Eh22OZeV/UuOn6JN7/OunAx81qg0BD0eQdSKumwe
	AmVvIpbcRpFbaYrYabaGHjtjWr7elOxK4zR/uMC7UXQ3TQp/jV+pQDYAtm31zPNnVfiu
	xwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=0EBwlxXebn4DXton6USq6N08EBQXSTjhcs/GjJX++AA=;
	b=t5Zmw80wK/smBZ6nb+yzDbfHns1ZP5805fuV4H008j5lQ968cAP/F0/ndgP6kh9NSf
	esl5UaZhslVyGF24pEfiuFXWRW74jjWLvQ+ylejxfm8vrfx5sn4Bxll0Nxhpfhz93OVl
	4tpGxxEmWq94/qPEu5uwvO5lF0tTv2ZZCE1eu5bxOquQIOCrk0OrP5fkDakRkh3SJ34d
	PsVfoC9CUkErHT57momJybdq1Tsa6oqKUTa6MRDoMaHvcg6/dQKYm9JX6yaowLQIP6UF
	fdLdjcrcc4F963dLBGbWNlhBudcjd7Nfwj/qLN2Km/KHFtE2nZzQaA9xP0D4HgbEdWLz
	KZZg==
X-Gm-Message-State: APt69E0Q56Eo3WSOVJY+RtA3oYirOSSuHGsswXmssgcDOSa8eaL8PWmZ
	RGRFgTfueuBQlYx4Uyjcn1Vx5g==
X-Google-Smtp-Source: ADUXVKK6+quF10/VKBHQkkAHEy0gWw/junSZUPdklR5sDAplB0kJWZNvFsn2KrXD2615a7ZtDme92w==
X-Received: by 2002:a65:450c:: with SMTP id
	n12-v6mr8330720pgq.242.1529867985205; 
	Sun, 24 Jun 2018 12:19:45 -0700 (PDT)
Received: from localhost.localdomain ([2601:646:877f:9499::91a0])
	by smtp.gmail.com with ESMTPSA id
	m11-v6sm36700461pfj.25.2018.06.24.12.19.43
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sun, 24 Jun 2018 12:19:44 -0700 (PDT)
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Date: Sun, 24 Jun 2018 12:18:40 -0700
Message-Id: <20180624191845.31082-15-raj.khem@gmail.com>
X-Mailer: git-send-email 2.18.0
In-Reply-To: <20180624191845.31082-1-raj.khem@gmail.com>
References: <20180624191845.31082-1-raj.khem@gmail.com>
Subject: [meta-networking][PATCH 15/20] squid: Fix build with gcc8
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
X-List-Received-Date: Sun, 24 Jun 2018 19:19:45 -0000

Signed-off-by: Khem Raj <raj.khem@gmail.com>
---
 ..._edirectory_userip_acl-refactoring-f.patch | 506 ++++++++++++++++++
 .../0002-smblib-fix-buffer-over-read.patch    |  39 ++
 .../recipes-daemons/squid/squid_3.5.27.bb     |   3 +
 3 files changed, 548 insertions(+)
 create mode 100644 meta-networking/recipes-daemons/squid/files/0001-Bug-4843-pt1-ext_edirectory_userip_acl-refactoring-f.patch
 create mode 100644 meta-networking/recipes-daemons/squid/files/0002-smblib-fix-buffer-over-read.patch

diff --git a/meta-networking/recipes-daemons/squid/files/0001-Bug-4843-pt1-ext_edirectory_userip_acl-refactoring-f.patch b/meta-networking/recipes-daemons/squid/files/0001-Bug-4843-pt1-ext_edirectory_userip_acl-refactoring-f.patch
new file mode 100644
index 0000000000..001d9e906e
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0001-Bug-4843-pt1-ext_edirectory_userip_acl-refactoring-f.patch
@@ -0,0 +1,506 @@
+From 01a44c96dbd04936e9cb2501745a834a0b09d504 Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <yadij@users.noreply.github.com>
+Date: Sun, 13 May 2018 06:57:41 +0000
+Subject: [PATCH] Bug 4843 pt1: ext_edirectory_userip_acl refactoring for GCC-8
+ (#204)
+
+Proposed changes to this helper to fix strcat / strncat buffer
+overread / overflow issues.
+
+The approach takes three parts:
+
+* adds a makeHexString function to replace many for-loops
+  catenating bits of strings together with hex conversion into a
+  second buffer. Replacing with a snprintf() and buffer overflow
+  handling.
+
+* a copy of Ip::Address::lookupHostIp to convert the input
+  string into IP address binary format, then generate the hex
+  string using the above new hex function instead of looped
+  sub-string concatenations across several buffers.
+  This removes all the "00" and "0000" strncat() calls and
+  allows far simpler code even with added buffer overflow
+  handling.
+
+* replace multiple string part concatenations with a few simpler
+  calls to snprintf() for all the search_ip buffer constructions.
+  Adding buffer overflow handling as needed for the new calls.
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ .../ext_edirectory_userip_acl.cc              | 376 ++++++------------
+ 1 file changed, 120 insertions(+), 256 deletions(-)
+
+diff --git a/helpers/external_acl/eDirectory_userip/ext_edirectory_userip_acl.cc b/helpers/external_acl/eDirectory_userip/ext_edirectory_userip_acl.cc
+index 63609e4..ad16bfd 100644
+--- a/helpers/external_acl/eDirectory_userip/ext_edirectory_userip_acl.cc
++++ b/helpers/external_acl/eDirectory_userip/ext_edirectory_userip_acl.cc
+@@ -67,6 +67,9 @@
+ #ifdef HAVE_LDAP_H
+ #include <ldap.h>
+ #endif
++#ifdef HAVE_NETDB_H
++#include <netdb.h>
++#endif
+ 
+ #ifdef HELPER_INPUT_BUFFER
+ #define EDUI_MAXLEN     HELPER_INPUT_BUFFER
+@@ -714,11 +717,14 @@ BindLDAP(edui_ldap_t *l, char *dn, char *pw, unsigned int t)
+ 
+     /* Copy details - dn and pw CAN be NULL for anonymous and/or TLS */
+     if (dn != NULL) {
++        if (strlen(dn) >= sizeof(l->dn))
++            return LDAP_ERR_OOB; /* DN too large */
++
+         if ((l->basedn[0] != '\0') && (strstr(dn, l->basedn) == NULL)) {
+             /* We got a basedn, but it's not part of dn */
+-            xstrncpy(l->dn, dn, sizeof(l->dn));
+-            strncat(l->dn, ",", 1);
+-            strncat(l->dn, l->basedn, strlen(l->basedn));
++            const int x = snprintf(l->dn, sizeof(l->dn)-1, "%s,%s", dn, l->basedn);
++            if (x < 0 || static_cast<size_t>(x) >= sizeof(l->dn))
++                return LDAP_ERR_OOB; /* DN too large */
+         } else
+             xstrncpy(l->dn, dn, sizeof(l->dn));
+     }
+@@ -778,24 +784,73 @@ BindLDAP(edui_ldap_t *l, char *dn, char *pw, unsigned int t)
+     }
+ }
+ 
++// XXX: duplicate (partial) of Ip::Address::lookupHostIp
++/**
++ * Convert the IP address string representation in src to
++ * its binary representation.
++ *
++ * \return binary representation of the src IP address.
++ *         Must be free'd using freeaddrinfo().
++ */
++static struct addrinfo *
++makeIpBinary(const char *src)
++{
++    struct addrinfo want;
++    memset(&want, 0, sizeof(want));
++    want.ai_flags = AI_NUMERICHOST; // prevent actual DNS lookups!
++
++    struct addrinfo *dst = nullptr;
++    if (getaddrinfo(src, nullptr, &want, &dst) != 0) {
++        // not an IP address
++        /* free any memory getaddrinfo() dynamically allocated. */
++        if (dst)
++            freeaddrinfo(dst);
++        return nullptr;
++    }
++
++    return dst;
++}
++
++/**
++ * Convert srcLen bytes from src into HEX and store into dst, which
++ * has a maximum content size of dstSize including c-string terminator.
++ * The dst value produced will be a 0-terminated c-string.
++ *
++ * \retval   N  length of dst written (excluding c-string terminator)
++ * \retval -11  (LDAP_ERR_OOB) buffer overflow detected
++ */
++static int
++makeHexString(char *dst, const int dstSize, const char *src, const int srcLen)
++{
++    // HEX encoding doubles the amount of bytes/octets copied
++    if ((srcLen*2) >= dstSize)
++        return LDAP_ERR_OOB; // cannot copy that many
++
++    *dst = 0;
++
++    for (int k = 0; k < srcLen; ++k) {
++        int c = static_cast<int>(src[k]);
++        if (c < 0)
++            c = c + 256;
++        char hexc[4];
++        const int hlen = snprintf(hexc, sizeof(hexc), "%02X", c);
++        if (hlen < 0 || static_cast<size_t>(hlen) > sizeof(hexc)) // should be impossible
++            return LDAP_ERR_OOB;
++        strcat(dst, hexc);
++    }
++    return strlen(dst);
++}
++
+ /*
+  * ConvertIP() - <edui_ldap_t> <ip>
+  *
+  * Take an IPv4 address in dot-decimal or IPv6 notation, and convert to 2-digit HEX stored in l->search_ip
+  * This is the networkAddress that we search LDAP for.
+- *
+- * PENDING -- CHANGE OVER TO inet*_pton, but inet6_pton does not provide the correct syntax
+- *
+  */
+ static int
+ ConvertIP(edui_ldap_t *l, char *ip)
+ {
+-    char bufa[EDUI_MAXLEN], bufb[EDUI_MAXLEN], obj[EDUI_MAXLEN];
+-    char hexc[4], *p;
+     void *y, *z;
+-    size_t s;
+-    long x;
+-    int i, j, t, swi;                           /* IPv6 "::" cut over toggle */
+     if (l == NULL) return LDAP_ERR_NULL;
+     if (ip == NULL) return LDAP_ERR_PARAM;
+     if (!(l->status & LDAP_INIT_S)) return LDAP_ERR_INIT;       /* Not initalized */
+@@ -831,183 +886,22 @@ ConvertIP(edui_ldap_t *l, char *ip)
+             l->status |= (LDAP_IPV4_S);
+         z = NULL;
+     }
+-    s = strlen(ip);
+-    *(bufa) = '\0';
+-    *(bufb) = '\0';
+-    *(obj) = '\0';
+-    /* StringSplit() will zero out bufa & obj at each call */
+-    memset(l->search_ip, '\0', sizeof(l->search_ip));
+-    xstrncpy(bufa, ip, sizeof(bufa));                       /* To avoid segfaults, use bufa instead of ip */
+-    swi = 0;
+-    if (l->status & LDAP_IPV6_S) {
+-        /* Search for :: in string */
+-        if ((bufa[0] == ':') && (bufa[1] == ':')) {
+-            /* bufa starts with a ::, so just copy and clear */
+-            xstrncpy(bufb, bufa, sizeof(bufb));
+-            *(bufa) = '\0';
+-            ++swi;                              /* Indicates that there is a bufb */
+-        } else if ((bufa[0] == ':') && (bufa[1] != ':')) {
+-            /* bufa starts with a :, a typo so just fill in a ':', cat and clear */
+-            bufb[0] = ':';
+-            strncat(bufb, bufa, strlen(bufa));
+-            *(bufa) = '\0';
+-            ++swi;                              /* Indicates that there is a bufb */
+-        } else {
+-            p = strstr(bufa, "::");
+-            if (p != NULL) {
+-                /* Found it, break bufa down and split into bufb here */
+-                *(bufb) = '\0';
+-                i = strlen(p);
+-                memcpy(bufb, p, i);
+-                *p = '\0';
+-                bufb[i] = '\0';
+-                ++swi;                              /* Indicates that there is a bufb */
+-            }
+-        }
+-    }
+-    s = strlen(bufa);
+-    if (s < 1)
+-        s = strlen(bufb);
+-    while (s > 0) {
+-        if ((l->status & LDAP_IPV4_S) && (swi == 0)) {
+-            /* Break down IPv4 address  */
+-            t = StringSplit(bufa, '.', obj, sizeof(obj));
+-            if (t > 0) {
+-                errno = 0;
+-                x = strtol(obj, (char **)NULL, 10);
+-                if (((x < 0) || (x > 255)) || ((errno != 0) && (x == 0)) || ((obj[0] != '0') && (x == 0)))
+-                    return LDAP_ERR_OOB;                        /* Out of bounds -- Invalid address */
+-                memset(hexc, '\0', sizeof(hexc));
+-                int hlen = snprintf(hexc, sizeof(hexc), "%02X", (int)x);
+-                strncat(l->search_ip, hexc, hlen);
+-            } else
+-                break;                              /* reached end of octet */
+-        } else if (l->status & LDAP_IPV6_S) {
+-            /* Break down IPv6 address */
+-            if (swi > 1)
+-                t = StringSplit(bufb, ':', obj, sizeof(obj));           /* After "::" */
+-            else
+-                t = StringSplit(bufa, ':', obj, sizeof(obj));           /* Before "::" */
+-            /* Convert octet by size (t) - and fill 0's */
+-            switch (t) {                            /* IPv6 is already in HEX, copy contents */
+-            case 4:
+-                hexc[0] = (char) toupper((int)obj[0]);
+-                i = (int)hexc[0];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[1] = (char) toupper((int)obj[1]);
+-                i = (int)hexc[1];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[2] = '\0';
+-                strncat(l->search_ip, hexc, 2);
+-                hexc[0] = (char) toupper((int)obj[2]);
+-                i = (int)hexc[0];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[1] = (char) toupper((int)obj[3]);
+-                i = (int)hexc[1];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[2] = '\0';
+-                strncat(l->search_ip, hexc, 2);
+-                break;
+-            case 3:
+-                hexc[0] = '0';
+-                hexc[1] = (char) toupper((int)obj[0]);
+-                i = (int)hexc[1];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[2] = '\0';
+-                strncat(l->search_ip, hexc, 2);
+-                hexc[0] = (char) toupper((int)obj[1]);
+-                i = (int)hexc[0];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[1] = (char) toupper((int)obj[2]);
+-                i = (int)hexc[1];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[2] = '\0';
+-                strncat(l->search_ip, hexc, 2);
+-                break;
+-            case 2:
+-                strncat(l->search_ip, "00", 2);
+-                hexc[0] = (char) toupper((int)obj[0]);
+-                i = (int)hexc[0];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[1] = (char) toupper((int)obj[1]);
+-                i = (int)hexc[1];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[2] = '\0';
+-                strncat(l->search_ip, hexc, 2);
+-                break;
+-            case 1:
+-                strncat(l->search_ip, "00", 2);
+-                hexc[0] = '0';
+-                hexc[1] = (char) toupper((int)obj[0]);
+-                i = (int)hexc[1];
+-                if (!isxdigit(i))
+-                    return LDAP_ERR_OOB;                    /* Out of bounds */
+-                hexc[2] = '\0';
+-                strncat(l->search_ip, hexc, 2);
+-                break;
+-            default:
+-                if (t > 4)
+-                    return LDAP_ERR_OOB;
+-                break;
+-            }
+-            /* Code to pad the address with 0's between a '::' */
+-            if ((strlen(bufa) == 0) && (swi == 1)) {
+-                /* We are *AT* the split, pad in some 0000 */
+-                t = strlen(bufb);
+-                /* How many ':' exist in bufb ? */
+-                j = 0;
+-                for (i = 0; i < t; ++i) {
+-                    if (bufb[i] == ':')
+-                        ++j;
+-                }
+-                --j;                                /* Preceding "::" doesn't count */
+-                t = 8 - (strlen(l->search_ip) / 4) - j;         /* Remainder */
+-                if (t > 0) {
+-                    for (i = 0; i < t; ++i)
+-                        strncat(l->search_ip, "0000", 4);
+-                }
+-            }
+-        }
+-        if ((bufa[0] == '\0') && (swi > 0)) {
+-            s = strlen(bufb);
+-            ++swi;
+-        } else
+-            s = strlen(bufa);
+-    }
+-    s = strlen(l->search_ip);
+ 
+-    /* CHECK sizes of address, truncate or pad */
+-    /* if "::" is at end of ip, then pad another block or two */
+-    while ((l->status & LDAP_IPV6_S) && (s < 32)) {
+-        strncat(l->search_ip, "0000", 4);
+-        s = strlen(l->search_ip);
+-    }
+-    if ((l->status & LDAP_IPV6_S) && (s > 32)) {
+-        /* Too long, truncate */
+-        l->search_ip[32] = '\0';
+-        s = strlen(l->search_ip);
+-    }
+-    /* If at end of ip, and its not long enough, then pad another block or two */
+-    while ((l->status & LDAP_IPV4_S) && (s < 8)) {
+-        strncat(l->search_ip, "00", 2);
+-        s = strlen(l->search_ip);
+-    }
+-    if ((l->status & LDAP_IPV4_S) && (s > 8)) {
+-        /* Too long, truncate */
+-        l->search_ip[8] = '\0';
+-        s = strlen(l->search_ip);
++    size_t s = LDAP_ERR_INVALID;
++    if (struct addrinfo *dst = makeIpBinary(ip)) {
++        if (dst->ai_family == AF_INET6) {
++            struct sockaddr_in6 *sia = reinterpret_cast<struct sockaddr_in6 *>(dst->ai_addr);
++            const char *ia = reinterpret_cast<const char *>(sia->sin6_addr.s6_addr);
++            s = makeHexString(l->search_ip, sizeof(l->search_ip), ia, 16); // IPv6 = 16-byte address
++
++        } else if (dst->ai_family == AF_INET) {
++            struct sockaddr_in *sia = reinterpret_cast<struct sockaddr_in *>(dst->ai_addr);
++            const char *ia = reinterpret_cast<const char *>(&(sia->sin_addr));
++            s = makeHexString(l->search_ip, sizeof(l->search_ip), ia, 4);  // IPv4 = 4-byte address
++        } // else leave s with LDAP_ERR_INVALID value
++        freeaddrinfo(dst);
+     }
+ 
+-    /* Completed, s is length of address in HEX */
+     return s;
+ }
+ 
+@@ -1099,48 +993,42 @@ SearchFilterLDAP(edui_ldap_t *l, char *group)
+     }
+     if (group == NULL) {
+         /* No groupMembership= to add, yay! */
+-        xstrncpy(bufa, "(&", sizeof(bufa));
+-        strncat(bufa, edui_conf.search_filter, strlen(edui_conf.search_filter));
+         /* networkAddress */
+-        snprintf(bufb, sizeof(bufb), "(|(networkAddress=1\\23%s)", bufc);
+         if (l->status & LDAP_IPV4_S) {
+-            int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=8\\23\\00\\00%s)(networkAddress=9\\23\\00\\00%s))", \
+-                              bufc, bufc);
+-            strncat(bufb, bufd, ln);
++            const int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=8\\23\\00\\00%s)(networkAddress=9\\23\\00\\00%s)", bufc, bufc);
++            if (ln < 0 || static_cast<size_t>(ln) >= sizeof(bufd))
++                return LDAP_ERR_OOB;
++
+         } else if (l->status & LDAP_IPV6_S) {
+-            int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=10\\23\\00\\00%s)(networkAddress=11\\23\\00\\00%s))", \
+-                              bufc, bufc);
+-            strncat(bufb, bufd, ln);
+-        } else
+-            strncat(bufb, ")", 1);
+-        strncat(bufa, bufb, strlen(bufb));
+-        strncat(bufa, ")", 1);
++            const int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=10\\23\\00\\00%s)(networkAddress=11\\23\\00\\00%s)", bufc, bufc);
++            if (ln < 0 || static_cast<size_t>(ln) >= sizeof(bufd))
++                return LDAP_ERR_OOB;
++        }
++        const int x = snprintf(bufa, sizeof(bufa), "(&%s(|(networkAddress=1\\23%s)%s))", edui_conf.search_filter, bufc, bufd);
++        if (x < 0 || static_cast<size_t>(x) >= sizeof(bufa))
++            return LDAP_ERR_OOB;
++
+     } else {
+         /* Needs groupMembership= to add... */
+-        xstrncpy(bufa, "(&(&", sizeof(bufa));
+-        strncat(bufa, edui_conf.search_filter, strlen(edui_conf.search_filter));
+         /* groupMembership -- NOTE: Squid *MUST* provide "cn=" from squid.conf */
+-        snprintf(bufg, sizeof(bufg), "(groupMembership=%s", group);
+         if ((l->basedn[0] != '\0') && (strstr(group, l->basedn) == NULL)) {
+-            strncat(bufg, ",", 1);
+-            strncat(bufg, l->basedn, strlen(l->basedn));
++            const int ln = snprintf(bufg, sizeof(bufg), ",%s", l->basedn);
++            if (ln < 0 || static_cast<size_t>(ln) >= sizeof(bufd))
++                return LDAP_ERR_OOB;
+         }
+-        strncat(bufg, ")", 1);
+-        strncat(bufa, bufg, strlen(bufg));
+         /* networkAddress */
+-        snprintf(bufb, sizeof(bufb), "(|(networkAddress=1\\23%s)", bufc);
+         if (l->status & LDAP_IPV4_S) {
+-            int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=8\\23\\00\\00%s)(networkAddress=9\\23\\00\\00%s))", \
+-                              bufc, bufc);
+-            strncat(bufb, bufd, ln);
++            const int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=8\\23\\00\\00%s)(networkAddress=9\\23\\00\\00%s)", bufc, bufc);
++            if (ln < 0 || static_cast<size_t>(ln) >= sizeof(bufd))
++                return LDAP_ERR_OOB;
+         } else if (l->status & LDAP_IPV6_S) {
+-            int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=10\\23\\00\\00%s)(networkAddress=11\\23\\00\\00%s))", \
+-                              bufc, bufc);
+-            strncat(bufb, bufd, ln);
+-        } else
+-            strncat(bufb, ")", 1);
+-        strncat(bufa, bufb, strlen(bufb));
+-        strncat(bufa, "))", 2);
++            const int ln = snprintf(bufd, sizeof(bufd), "(networkAddress=10\\23\\00\\00%s)(networkAddress=11\\23\\00\\00%s)", bufc, bufc);
++            if (ln < 0 || static_cast<size_t>(ln) >= sizeof(bufd))
++                return LDAP_ERR_OOB;
++        }
++        const int x = snprintf(bufa, sizeof(bufa), "(&(&%s(groupMembership=%s%s)(|(networkAddress=1\\23%s)%s)))", edui_conf.search_filter, group, bufg, bufc, bufd);
++        if (x < 0 || static_cast<size_t>(x) >= sizeof(bufa))
++            return LDAP_ERR_OOB;
+     }
+     s = strlen(bufa);
+     xstrncpy(l->search_filter, bufa, sizeof(l->search_filter));
+@@ -1212,10 +1100,10 @@ static int
+ SearchIPLDAP(edui_ldap_t *l)
+ {
+     ber_len_t i, x;
+-    ber_len_t j, k;
+-    ber_len_t y, z;
+-    int c;
+-    char bufa[EDUI_MAXLEN], bufb[EDUI_MAXLEN], hexc[4];
++    ber_len_t j;
++    ber_len_t z;
++    char bufa[EDUI_MAXLEN];
++    char bufb[EDUI_MAXLEN];
+     LDAPMessage *ent;
+     if (l == NULL) return LDAP_ERR_NULL;
+     if (l->lp == NULL) return LDAP_ERR_POINTER;
+@@ -1273,19 +1161,11 @@ SearchIPLDAP(edui_ldap_t *l)
+                         /* bufa is the address, just compare it */
+                         if (!(l->status & LDAP_IPV4_S) || (l->status & LDAP_IPV6_S))
+                             break;                          /* Not looking for IPv4 */
+-                        for (k = 0; k < z; ++k) {
+-                            c = (int) bufa[k];
+-                            if (c < 0)
+-                                c = c + 256;
+-                            int hlen = snprintf(hexc, sizeof(hexc), "%02X", c);
+-                            if (k == 0)
+-                                xstrncpy(bufb, hexc, sizeof(bufb));
+-                            else
+-                                strncat(bufb, hexc, hlen);
+-                        }
+-                        y = strlen(bufb);
++                        const int blen = makeHexString(bufb, sizeof(bufb), bufa, z);
++                        if (blen < 0)
++                            return blen;
+                         /* Compare value with IP */
+-                        if (memcmp(l->search_ip, bufb, y) == 0) {
++                        if (memcmp(l->search_ip, bufb, blen) == 0) {
+                             /* We got a match! - Scan 'ber' for 'cn' values */
+                             z = ldap_count_values_len(ber);
+                             for (j = 0; j < z; ++j) {
+@@ -1308,19 +1188,11 @@ SearchIPLDAP(edui_ldap_t *l)
+                         /* bufa + 2 is the address (skip 2 digit port) */
+                         if (!(l->status & LDAP_IPV4_S) || (l->status & LDAP_IPV6_S))
+                             break;                          /* Not looking for IPv4 */
+-                        for (k = 2; k < z; ++k) {
+-                            c = (int) bufa[k];
+-                            if (c < 0)
+-                                c = c + 256;
+-                            int hlen = snprintf(hexc, sizeof(hexc), "%02X", c);
+-                            if (k == 2)
+-                                xstrncpy(bufb, hexc, sizeof(bufb));
+-                            else
+-                                strncat(bufb, hexc, hlen);
+-                        }
+-                        y = strlen(bufb);
++                        const int blen = makeHexString(bufb, sizeof(bufb), &bufa[2], z);
++                        if (blen < 0)
++                            return blen;
+                         /* Compare value with IP */
+-                        if (memcmp(l->search_ip, bufb, y) == 0) {
++                        if (memcmp(l->search_ip, bufb, blen) == 0) {
+                             /* We got a match! - Scan 'ber' for 'cn' values */
+                             z = ldap_count_values_len(ber);
+                             for (j = 0; j < z; ++j) {
+@@ -1343,19 +1215,11 @@ SearchIPLDAP(edui_ldap_t *l)
+                         /* bufa + 2 is the address (skip 2 digit port) */
+                         if (!(l->status & LDAP_IPV6_S))
+                             break;                          /* Not looking for IPv6 */
+-                        for (k = 2; k < z; ++k) {
+-                            c = (int) bufa[k];
+-                            if (c < 0)
+-                                c = c + 256;
+-                            int hlen = snprintf(hexc, sizeof(hexc), "%02X", c);
+-                            if (k == 2)
+-                                xstrncpy(bufb, hexc, sizeof(bufb));
+-                            else
+-                                strncat(bufb, hexc, hlen);
+-                        }
+-                        y = strlen(bufb);
++                        const int blen = makeHexString(bufb, sizeof(bufb), &bufa[2], z);
++                        if (blen < 0)
++                            return blen;
+                         /* Compare value with IP */
+-                        if (memcmp(l->search_ip, bufb, y) == 0) {
++                        if (memcmp(l->search_ip, bufb, blen) == 0) {
+                             /* We got a match! - Scan 'ber' for 'cn' values */
+                             z = ldap_count_values_len(ber);
+                             for (j = 0; j < z; ++j) {
diff --git a/meta-networking/recipes-daemons/squid/files/0002-smblib-fix-buffer-over-read.patch b/meta-networking/recipes-daemons/squid/files/0002-smblib-fix-buffer-over-read.patch
new file mode 100644
index 0000000000..c8f0c47bd1
--- /dev/null
+++ b/meta-networking/recipes-daemons/squid/files/0002-smblib-fix-buffer-over-read.patch
@@ -0,0 +1,39 @@
+From a6b1e0fd14311587186e40d09bff5c8c3aada2e4 Mon Sep 17 00:00:00 2001
+From: Amos Jeffries <squid3@treenet.co.nz>
+Date: Sat, 25 Jul 2015 05:53:16 -0700
+Subject: [PATCH] smblib: fix buffer over-read
+
+When parsing SMB LanManager packets with invalid protocol ID and the
+default set of Squid supported protocols. It may access memory outside
+the buffer storing protocol names.
+
+smblib is only used by already deprecated helpers which are deprecated
+due to far more significant NTLM protocol issues. It will also only
+result in packets being rejected later with invalid protocol names. So
+this is a minor bug rather than a vulnerability.
+
+ Detected by Coverity Scan. Issue 1256165
+---
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Backport
+
+ lib/smblib/smblib-util.c | 6 +++++-
+ 1 file changed, 5 insertions(+), 1 deletion(-)
+
+diff --git a/lib/smblib/smblib-util.c b/lib/smblib/smblib-util.c
+index 6139ae2..e722cbb 100644
+--- a/lib/smblib/smblib-util.c
++++ b/lib/smblib/smblib-util.c
+@@ -204,7 +204,11 @@ int SMB_Figure_Protocol(const char *dialects[], int prot_index)
+ {
+     int i;
+ 
+-    if (dialects == SMB_Prots) { /* The jobs is easy, just index into table */
++    // prot_index may be a value outside the table SMB_Types[]
++    // which holds data at offsets 0 to 11
++    int ourType = (prot_index < 0 || prot_index > 11);
++
++    if (ourType && dialects == SMB_Prots) { /* The jobs is easy, just index into table */
+ 
+         return(SMB_Types[prot_index]);
+     } else { /* Search through SMB_Prots looking for a match */
diff --git a/meta-networking/recipes-daemons/squid/squid_3.5.27.bb b/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
index 7dae3cd83f..1557c4b2d6 100644
--- a/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
+++ b/meta-networking/recipes-daemons/squid/squid_3.5.27.bb
@@ -23,6 +23,8 @@ SRC_URI = "http://www.squid-cache.org/Versions/v${MAJ_VER}/${MIN_VER}/${BPN}-${P
            file://squid-don-t-do-squid-conf-tests-at-build-time.patch \
            file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch \
            file://0001-tools.cc-fixed-unused-result-warning.patch \
+           file://0001-Bug-4843-pt1-ext_edirectory_userip_acl-refactoring-f.patch \
+           file://0002-smblib-fix-buffer-over-read.patch \
            "
 
 SRC_URI_remove_toolchain-clang = "file://0001-configure-Check-for-Wno-error-format-truncation-comp.patch"
@@ -48,6 +50,7 @@ PACKAGECONFIG ??= "${@bb.utils.contains('TARGET_ARCH', 'powerpc', 'noatomics', '
 PACKAGECONFIG[libnetfilter-conntrack] = "--with-netfilter-conntrack=${includedir}, --without-netfilter-conntrack, libnetfilter-conntrack"
 PACKAGECONFIG[noatomics] = "squid_cv_gnu_atomics=no,squid_cv_gnu_atomics=yes,,"
 PACKAGECONFIG[ipv6] = "--enable-ipv6,--disable-ipv6,"
+PACKAGECONFIG[werror] = "--enable-strict-error-checking,--disable-strict-error-checking,"
 
 BASIC_AUTH = "DB SASL LDAP"
 
-- 
2.18.0


