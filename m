Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585FCCAC5B8
	for <webhook@archiver.kernel.org>; Sun,  5 Oct 2025 13:06:20 +0000 (UTC)
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
 by mx.groups.io with SMTP id smtpd.web10.10118.1759669574535489288
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 05 Oct 2025 06:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=O4t1+ltg;
 spf=pass (domain: gmail.com, ip: 209.85.208.51, mailfrom: skandigraun@gmail.com)
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-637e74e9104so3490685a12.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 06:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759669573; x=1760274373; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=6xfJWf9EbOaXH6FlUKurYhNsREcW77K131xetEBPTbE=;
        b=O4t1+ltgmtlyYI6ZCzY0sIVvJKkDXQkfqYJ9VHjN9xLmiNjXoaehJY2sm61597InqL
         DNO/PzQUR41KjZUwsazTgbWZnYgc7xb0BUCJf5je/KkQwq+QRpNfMwx1Ri2xwKeYbl54
         MjAgWt954t5T86TcKZqe9DPGSZVS4a+7bI32AMvcqBXaf4VFPfP4gYDY/qFMiXAyLsZE
         0c4ssR02TaAigNj6UnfEJ//zS2AvxRXsAc0eixAYLO3lYuflyO6B+25J+jUBQpIm4gBG
         VIEw4yXMYrhTH+V3i6ukzfw15kfMaXQnGUaX7jCW4d2N5C/WTxmLcP8srFrbLzq8+/In
         vDpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759669573; x=1760274373;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6xfJWf9EbOaXH6FlUKurYhNsREcW77K131xetEBPTbE=;
        b=xLgnfRcCJhYiLV9OirLn+kZ7TIWhGq3Z8YJEqPNkg9MglI7T8lWBjLyiq3G2mJJkv0
         /w4zeoINLw4U3lbHTtIZNTce1kV1K6bO/sp2qQnhU0mbQcoGodJCdKLN+Fan/2/BiI1X
         U1kyRRLg9U832rVSRZUkWTxcKNIt2CLM2yRU+rt3+6ssorFdD9JtbH8WeS8u7skO97uz
         nphg3GoDOV31lqV2FD1K6O6LtgEp1sDUVtc9u4JeLYMdfaW419QuunckFyp5sJTjf8op
         AhngUHY28P9pSrCiuSUxut6FIEvfb61lKc3FWRSD3XVQIutPPB1Bj5G+7bSTyhRHgLHb
         vV/w==
X-Gm-Message-State: AOJu0YwdfXUvaEXftTfS6YlIulPdz4uVm9hxh0TrbBSnpsbC2qa6j1kb
	rc494VimfBZBWqgvS5NF6fScAhx3g/RCw+YR2HWCcKrFfMxQ63kdzcR6aAZBXg==
X-Gm-Gg: ASbGncuWcku896faigxINSZ5ExpDQBqpSzOwCDnIapwmlj7cjRFaS1LZIKisjcdxTKD
	apYgxuGuJibZPTTmgm8En2N/n79d1BKfsKe/TDyoxot8U9+MaxeuayGV4ftiIx/8nwg3nN1hznJ
	QQg1jiClEmIo64lrCM4k1YS3aPVM/MAI7g8F21Eb03aceQNT/z1NKjJhhV6fFO0ll4gFQ+95iaA
	r2+Xgr6kcy2ivOrfhTC7fbS5w8zCS3t3K7lrx8tiqAyjdML1aN2dmPbxe/PV+YZhUADXwoJBhwT
	udzKbteKknfcamJuZEBkdzGVuCyfo+I26aY3DsszFGMh2/Vv9a6HALoWILfT9doUTcK0QxrnT2D
	l5br55rRyLoWrGyGZm+/AbqzgfNE3w2Yq0JCqT/ecv4ieMPBD2hfuWYc=
X-Google-Smtp-Source: AGHT+IFXjdVXywO9bp24y8f9gTBDLb9od1DbwyXPp9BNnQCDd3bedIXd1wb/iWEUbJDZv8DO8zy+fQ==
X-Received: by 2002:a17:907:7f13:b0:b3b:d167:944a with SMTP id a640c23a62f3a-b49c3255f5emr1269077366b.57.1759669572157;
        Sun, 05 Oct 2025 06:06:12 -0700 (PDT)
Received: from desktop ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b4865e7c47fsm915639966b.37.2025.10.05.06.06.11
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 06:06:11 -0700 (PDT)
From: Gyorgy Sarvari <skandigraun@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: [meta-oe][kirkstone][PATCH] botan: patch CVE-2024-39312
Date: Sun,  5 Oct 2025 15:06:10 +0200
Message-ID: <20251005130611.615842-1-skandigraun@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 05 Oct 2025 13:06:20 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/120248

Details: https://nvd.nist.gov/vuln/detail/CVE-2024-39312

Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
---
 ...Address-various-name-constraint-bugs.patch | 749 ++++++++++++++++++
 meta-oe/recipes-crypto/botan/botan_2.19.1.bb  |   1 +
 2 files changed, 750 insertions(+)
 create mode 100644 meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch

diff --git a/meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch b/meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch
new file mode 100644
index 0000000000..e9abdaedb3
--- /dev/null
+++ b/meta-oe/recipes-crypto/botan/botan/0001-Address-various-name-constraint-bugs.patch
@@ -0,0 +1,749 @@
+From 6c39cdf1aa7efccb5dbeaf859fddf06500b78aa8 Mon Sep 17 00:00:00 2001
+From: Jack Lloyd <jack@randombit.net>
+Date: Sun, 7 Jul 2024 05:02:48 -0400
+Subject: [PATCH] Address various name constraint bugs
+
+CVE: CVE-2024-39312
+Upstream-Status: Backport [https://github.com/randombit/botan/commit/68338f5912534c74469f7f4e6e22b37aa5159952]
+
+Signed-off-by: Gyorgy Sarvari <skandigraun@gmail.com>
+---
+ src/lib/x509/asn1_alt_name.cpp     |   4 +
+ src/lib/x509/name_constraint.cpp   | 313 ++++++++++++++++++++++++++++-
+ src/lib/x509/pkix_types.h          |  37 +++-
+ src/lib/x509/x509_ext.cpp          |  80 +++-----
+ src/lib/x509/x509cert.cpp          |  30 ++-
+ src/python/botan2.py               |   2 +
+ src/scripts/test_python.py         |   3 -
+ src/tests/test_name_constraint.cpp |  10 +-
+ 8 files changed, 401 insertions(+), 78 deletions(-)
+
+diff --git a/src/lib/x509/asn1_alt_name.cpp b/src/lib/x509/asn1_alt_name.cpp
+index a347a31..574b9fb 100644
+--- a/src/lib/x509/asn1_alt_name.cpp
++++ b/src/lib/x509/asn1_alt_name.cpp
+@@ -257,6 +257,10 @@ void AlternativeName::decode_from(BER_Decoder& source)
+             const uint32_t ip = load_be<uint32_t>(obj.bits(), 0);
+             add_attribute("IP", ipv4_to_string(ip));
+             }
++         else if(obj.length() != 16)
++            {
++            throw Decoding_Error("Invalid length for IP address SAN");
++            }
+          }
+ 
+       }
+diff --git a/src/lib/x509/name_constraint.cpp b/src/lib/x509/name_constraint.cpp
+index c904572..632bc8c 100644
+--- a/src/lib/x509/name_constraint.cpp
++++ b/src/lib/x509/name_constraint.cpp
+@@ -163,31 +163,48 @@ GeneralName::MatchResult GeneralName::matches(const X509_Certificate& cert) cons
+ 
+ bool GeneralName::matches_dns(const std::string& nam) const
+    {
+-   if(nam.size() == name().size())
++   const std::string constraint = tolower_string(name());
++   const std::string issued = tolower_string(nam);
++
++   if(nam.size() == constraint.size())
+       {
+-      return tolower_string(nam) == tolower_string(name());
++      return issued == constraint;
+       }
+-   else if(name().size() > nam.size())
++   else if(constraint.size() > nam.size())
+       {
+       // The constraint is longer than the issued name: not possibly a match
+       return false;
+       }
+-   else // name.size() < nam.size()
++   else
+       {
+-      // constr is suffix of nam
+-      const std::string constr = name().front() == '.' ? name() : "." + name();
+-      const std::string substr = nam.substr(nam.size() - constr.size(), constr.size());
+-      return tolower_string(constr) == tolower_string(substr);
++      if(constraint.empty()) {
++         return true;
++      }
++
++      std::string substr = issued.substr(nam.size() - constraint.size(), constraint.size());
++
++      if(constraint.front() == '.') {
++         return substr == constraint;
++      } else if(substr[0] == '.') {
++         return substr.substr(1) == constraint;
++      } else {
++         return substr == constraint && issued[issued.size() - constraint.size() - 1] == '.';
+       }
+    }
++}
+ 
+ bool GeneralName::matches_dn(const std::string& nam) const
+    {
+    std::stringstream ss(nam);
+-   std::stringstream tt(name());
+-   X509_DN nam_dn, my_dn;
+-
++   X509_DN nam_dn;
+    ss >> nam_dn;
++   return matches_dn_obj(nam_dn);
++   }
++
++bool GeneralName::matches_dn_obj(const X509_DN& nam_dn) const
++   {
++   std::stringstream tt(name());
++   X509_DN my_dn;
+    tt >> my_dn;
+ 
+    auto attr = nam_dn.get_attributes();
+@@ -270,4 +287,278 @@ std::ostream& operator<<(std::ostream& os, const GeneralSubtree& gs)
+    os << gs.minimum() << "," << gs.maximum() << "," << gs.base();
+    return os;
+    }
++
++NameConstraints::NameConstraints(std::vector<GeneralSubtree>&& permitted_subtrees,
++                                 std::vector<GeneralSubtree>&& excluded_subtrees) :
++   m_permitted_subtrees(permitted_subtrees), m_excluded_subtrees(excluded_subtrees)
++   {
++   for(const auto& c : m_permitted_subtrees)
++      {
++      m_permitted_name_types.insert(c.base().type());
++      }
++   for(const auto& c : m_excluded_subtrees)
++      {
++      m_excluded_name_types.insert(c.base().type());
++      }
++   }
++
++namespace {
++
++bool looks_like_ipv4(const std::string& s)
++   {
++   try
++     {
++     // ignores return value
++     string_to_ipv4(s);
++     return true;
++     }
++   catch(...)
++      {
++      return false;
++      }
++   }
++
++}
++
++bool NameConstraints::is_permitted(const X509_Certificate& cert, bool reject_unknown) const {
++   if(permitted().empty()) {
++      return true;
++   }
++
++   const auto& alt_name = cert.subject_alt_name();
++
++   if(reject_unknown) {
++      if(m_permitted_name_types.find("URI") != m_permitted_name_types.end() && !alt_name.get_attribute("URI").empty()) {
++         return false;
++      }
++      if(m_permitted_name_types.find("RFC822") != m_permitted_name_types.end() && !alt_name.get_attribute("RFC822").empty()) {
++         return false;
++      }
++   }
++
++   auto is_permitted_dn = [&](const X509_DN& dn) {
++      // If no restrictions, then immediate accept
++      if(m_permitted_name_types.find("DN") == m_permitted_name_types.end()) {
++         return true;
++      }
++
++      if(dn.empty()) {
++         return true;
++      }
++
++      for(const auto& c : m_permitted_subtrees) {
++         if(c.base().type() == "DN" && c.base().matches_dn_obj(dn)) {
++            return true;
++         }
++      }
++
++      // There is at least one permitted name and we didn't match
++      return false;
++   };
++
++   auto is_permitted_dns_name = [&](const std::string& name) {
++      if(name.empty() || name[0] == '.') {
++         return false;
++      }
++
++      // If no restrictions, then immediate accept
++      if(m_permitted_name_types.find("DNS") == m_permitted_name_types.end()) {
++         return true;
++      }
++
++      for(const auto& c : m_permitted_subtrees) {
++         if(c.base().type() == "DNS" && c.base().matches_dns(name)) {
++            return true;
++         }
++      }
++
++      // There is at least one permitted name and we didn't match
++      return false;
++   };
++
++   auto is_permitted_ipv4 = [&](const std::string& ipv4) {
++      // If no restrictions, then immediate accept
++      if(m_permitted_name_types.find("IP") == m_permitted_name_types.end()) {
++         return true;
++      }
++
++      for(const auto& c : m_permitted_subtrees) {
++         if(c.base().type() == "IP" && c.base().matches_ip(ipv4)) {
++            return true;
++         }
++      }
++
++      // There is at least one permitted name and we didn't match
++      return false;
++   };
++
++   if(!is_permitted_dn(cert.subject_dn())) {
++      return false;
++   }
++
++   if(!is_permitted_dn(alt_name.dn()))
++      {
++      return false;
++      }
++
++   for(const auto& alt_dns : alt_name.get_attribute("DNS")) {
++      if(!is_permitted_dns_name(alt_dns)) {
++         return false;
++      }
++   }
++
++   for(const auto& alt_ipv4 : alt_name.get_attribute("IP")) {
++      if(!is_permitted_ipv4(alt_ipv4)) {
++         return false;
++      }
++   }
++
++   if(!alt_name.has_items())
++      {
++      for(const auto& cn : cert.subject_info("Name"))
++         {
++         if(cn.find(".") != std::string::npos)
++            {
++            if(looks_like_ipv4(cn))
++               {
++               if(!is_permitted_ipv4(cn))
++                  {
++                  return false;
++                  }
++               }
++            else
++               {
++               if(!is_permitted_dns_name(cn))
++                  {
++                  return false;
++                  }
++               }
++            }
++         }
++      }
++
++   // We didn't encounter a name that doesn't have a matching constraint
++   return true;
+ }
++
++bool NameConstraints::is_excluded(const X509_Certificate& cert, bool reject_unknown) const {
++   if(excluded().empty()) {
++      return false;
++   }
++
++   const auto& alt_name = cert.subject_alt_name();
++
++   if(reject_unknown) {
++      if(m_excluded_name_types.find("URI") != m_excluded_name_types.end() && !alt_name.get_attribute("URI").empty()) {
++         return false;
++      }
++      if(m_excluded_name_types.find("RFC822") != m_excluded_name_types.end() && !alt_name.get_attribute("RFC822").empty()) {
++         return false;
++      }
++   }
++
++   auto is_excluded_dn = [&](const X509_DN& dn) {
++      // If no restrictions, then immediate accept
++      if(m_excluded_name_types.find("DN") == m_excluded_name_types.end()) {
++         return false;
++      }
++
++      if(dn.empty()) {
++         return false;
++      }
++
++      for(const auto& c : m_excluded_subtrees) {
++         if(c.base().type() == "DN" && c.base().matches_dn_obj(dn)) {
++            return true;
++         }
++      }
++
++      // There is at least one excluded name and we didn't match
++      return false;
++   };
++
++   auto is_excluded_dns_name = [&](const std::string& name) {
++      if(name.empty() || name[0] == '.') {
++         return true;
++      }
++
++      // If no restrictions, then immediate accept
++      if(m_excluded_name_types.find("DNS") == m_excluded_name_types.end()) {
++         return false;
++      }
++
++      for(const auto& c : m_excluded_subtrees) {
++         if(c.base().type() == "DNS" && c.base().matches_dns(name)) {
++            return true;
++         }
++      }
++
++      // There is at least one excluded name and we didn't match
++      return false;
++   };
++
++   auto is_excluded_ipv4 = [&](const std::string& ipv4) {
++      // If no restrictions, then immediate accept
++      if(m_excluded_name_types.find("IP") == m_excluded_name_types.end()) {
++         return false;
++      }
++
++      for(const auto& c : m_excluded_subtrees) {
++         if(c.base().type() == "IP" && c.base().matches_ip(ipv4)) {
++            return true;
++         }
++      }
++
++      // There is at least one excluded name and we didn't match
++      return false;
++   };
++
++   if(is_excluded_dn(cert.subject_dn())) {
++      return true;
++   }
++
++   if(is_excluded_dn(alt_name.dn())) {
++      return true;
++   }
++
++   for(const auto& alt_dns : alt_name.get_attribute("DNS")) {
++      if(is_excluded_dns_name(alt_dns)) {
++         return true;
++      }
++   }
++
++   for(const auto& alt_ipv4 : alt_name.get_attribute("IP")) {
++      if(is_excluded_ipv4(alt_ipv4)) {
++         return true;
++      }
++   }
++
++   if(!alt_name.has_items())
++      {
++      for(const auto& cn : cert.subject_info("Name"))
++         {
++         if(cn.find(".") != std::string::npos)
++            {
++            if(looks_like_ipv4(cn))
++               {
++               if(is_excluded_ipv4(cn))
++                  {
++                  return true;
++                  }
++               }
++            else
++               {
++               if(is_excluded_dns_name(cn))
++                  {
++                  return true;
++                  }
++               }
++            }
++         }
++      }
++
++   // We didn't encounter a name that matched any prohibited name
++   return false;
++}
++
++}  // namespace Botan
+diff --git a/src/lib/x509/pkix_types.h b/src/lib/x509/pkix_types.h
+index 9831219..0b85887 100644
+--- a/src/lib/x509/pkix_types.h
++++ b/src/lib/x509/pkix_types.h
+@@ -191,6 +191,9 @@ class BOTAN_PUBLIC_API(2,0) Attribute final : public ASN1_Object
+ * Handles parsing GeneralName types in their BER and canonical string
+ * encoding. Allows matching GeneralNames against each other using
+ * the rules laid out in the RFC 5280, sec. 4.2.1.10 (Name Contraints).
++*
++* This entire class is deprecated and will be removed in a future
++* major release
+ */
+ class BOTAN_PUBLIC_API(2,0) GeneralName final : public ASN1_Object
+    {
+@@ -213,6 +216,7 @@ class BOTAN_PUBLIC_API(2,0) GeneralName final : public ASN1_Object
+       * Creates a new GeneralName for its string format.
+       * @param str type and name, colon-separated, e.g., "DNS:google.com"
+       */
++      BOTAN_DEPRECATED("Deprecated no replacement")
+       GeneralName(const std::string& str);
+ 
+       void encode_into(DER_Encoder&) const override;
+@@ -234,15 +238,17 @@ class BOTAN_PUBLIC_API(2,0) GeneralName final : public ASN1_Object
+       * @param cert certificate to be matched
+       * @return the match result
+       */
++      BOTAN_DEPRECATED("Deprecated no replacement")
+       MatchResult matches(const X509_Certificate& cert) const;
+ 
+-   private:
+-      std::string m_type;
+-      std::string m_name;
+-
+       bool matches_dns(const std::string&) const;
+       bool matches_dn(const std::string&) const;
++      bool matches_dn_obj(const X509_DN& dn) const;
+       bool matches_ip(const std::string&) const;
++
++   private:
++      std::string m_type;
++      std::string m_name;
+    };
+ 
+ std::ostream& operator<<(std::ostream& os, const GeneralName& gn);
+@@ -253,6 +259,9 @@ std::ostream& operator<<(std::ostream& os, const GeneralName& gn);
+ * The Name Constraint extension adds a minimum and maximum path
+ * length to a GeneralName to form a constraint. The length limits
+ * are currently unused.
++*
++* This entire class is deprecated and will be removed in a future
++* major release
+ */
+ class BOTAN_PUBLIC_API(2,0) GeneralSubtree final : public ASN1_Object
+    {
+@@ -260,6 +269,7 @@ class BOTAN_PUBLIC_API(2,0) GeneralSubtree final : public ASN1_Object
+       /**
+       * Creates an empty name constraint.
+       */
++      BOTAN_DEPRECATED("Deprecated no replacement")
+       GeneralSubtree() : m_base(), m_minimum(0), m_maximum(std::numeric_limits<std::size_t>::max())
+       {}
+ 
+@@ -269,6 +279,7 @@ class BOTAN_PUBLIC_API(2,0) GeneralSubtree final : public ASN1_Object
+       * @param min minimum path length
+       * @param max maximum path length
+       */
++      BOTAN_DEPRECATED("Deprecated no replacement")
+       GeneralSubtree(const GeneralName& base, size_t min, size_t max)
+       : m_base(base), m_minimum(min), m_maximum(max)
+       {}
+@@ -277,6 +288,7 @@ class BOTAN_PUBLIC_API(2,0) GeneralSubtree final : public ASN1_Object
+       * Creates a new name constraint for its string format.
+       * @param str name constraint
+       */
++      BOTAN_DEPRECATED("Deprecated no replacement")
+       GeneralSubtree(const std::string& str);
+ 
+       void encode_into(DER_Encoder&) const override;
+@@ -325,9 +337,7 @@ class BOTAN_PUBLIC_API(2,0) NameConstraints final
+       * @param excluded_subtrees names for which the certificate is not permitted
+       */
+       NameConstraints(std::vector<GeneralSubtree>&& permitted_subtrees,
+-                    std::vector<GeneralSubtree>&& excluded_subtrees)
+-      : m_permitted_subtrees(permitted_subtrees), m_excluded_subtrees(excluded_subtrees)
+-      {}
++                      std::vector<GeneralSubtree>&& excluded_subtrees);
+ 
+       /**
+       * @return permitted names
+@@ -339,9 +349,22 @@ class BOTAN_PUBLIC_API(2,0) NameConstraints final
+       */
+       const std::vector<GeneralSubtree>& excluded() const { return m_excluded_subtrees; }
+ 
++      /**
++      * Return true if all of the names in the certificate are permitted
++      */
++      bool is_permitted(const X509_Certificate& cert, bool reject_unknown) const;
++
++      /**
++      * Return true if any of the names in the certificate are excluded
++      */
++      bool is_excluded(const X509_Certificate& cert, bool reject_unknown) const;
++
+    private:
+       std::vector<GeneralSubtree> m_permitted_subtrees;
+       std::vector<GeneralSubtree> m_excluded_subtrees;
++
++      std::set<std::string> m_permitted_name_types;
++      std::set<std::string> m_excluded_name_types;
+    };
+ 
+ /**
+diff --git a/src/lib/x509/x509_ext.cpp b/src/lib/x509/x509_ext.cpp
+index e81e15c..51bc517 100644
+--- a/src/lib/x509/x509_ext.cpp
++++ b/src/lib/x509/x509_ext.cpp
+@@ -601,27 +601,27 @@ void Name_Constraints::decode_inner(const std::vector<uint8_t>& in)
+    {
+    std::vector<GeneralSubtree> permit, exclude;
+    BER_Decoder ber(in);
+-   BER_Decoder ext = ber.start_cons(SEQUENCE);
+-   BER_Object per = ext.get_next_object();
++   BER_Decoder inner = ber.start_cons(SEQUENCE);
++   BER_Object per = inner.get_next_object();
+ 
+-   ext.push_back(per);
++   inner.push_back(per);
+    if(per.is_a(0, ASN1_Tag(CONSTRUCTED | CONTEXT_SPECIFIC)))
+       {
+-      ext.decode_list(permit,ASN1_Tag(0),ASN1_Tag(CONSTRUCTED | CONTEXT_SPECIFIC));
++      inner.decode_list(permit,ASN1_Tag(0),ASN1_Tag(CONSTRUCTED | CONTEXT_SPECIFIC));
+       if(permit.empty())
+          throw Encoding_Error("Empty Name Contraint list");
+       }
+ 
+-   BER_Object exc = ext.get_next_object();
+-   ext.push_back(exc);
+-   if(per.is_a(1, ASN1_Tag(CONSTRUCTED | CONTEXT_SPECIFIC)))
++   BER_Object exc = inner.get_next_object();
++   inner.push_back(exc);
++   if(exc.is_a(1, ASN1_Tag(CONSTRUCTED | CONTEXT_SPECIFIC)))
+       {
+-      ext.decode_list(exclude,ASN1_Tag(1),ASN1_Tag(CONSTRUCTED | CONTEXT_SPECIFIC));
++      inner.decode_list(exclude,ASN1_Tag(1),ASN1_Tag(CONSTRUCTED | CONTEXT_SPECIFIC));
+       if(exclude.empty())
+          throw Encoding_Error("Empty Name Contraint list");
+       }
+ 
+-   ext.end_cons();
++   inner.end_cons();
+ 
+    if(permit.empty() && exclude.empty())
+       throw Encoding_Error("Empty Name Contraint extension");
+@@ -650,11 +650,17 @@ void Name_Constraints::contents_to(Data_Store& subject, Data_Store&) const
+       }
+    }
+ 
+-void Name_Constraints::validate(const X509_Certificate& subject, const X509_Certificate& issuer,
++void Name_Constraints::validate(const X509_Certificate& subject, const X509_Certificate& /*issuer*/,
+       const std::vector<std::shared_ptr<const X509_Certificate>>& cert_path,
+       std::vector<std::set<Certificate_Status_Code>>& cert_status,
+       size_t pos)
+    {
++   // This is much smaller limit than in Botan3 because here name constraint checks
++   // are much more expensive due to optimizations which would be difficult to
++   // backport here.
++   const size_t MAX_NC_COMPARES = (1 << 12);
++   const size_t total_constraints = m_name_constraints.permitted().size() + m_name_constraints.excluded().size();
++
+    if(!m_name_constraints.permitted().empty() || !m_name_constraints.excluded().empty())
+       {
+       if(!subject.is_CA_cert())
+@@ -663,54 +669,34 @@ void Name_Constraints::validate(const X509_Certificate& subject, const X509_Cert
+          }
+ 
+       const bool issuer_name_constraint_critical =
+-         issuer.is_critical("X509v3.NameConstraints");
++         subject.is_critical("X509v3.NameConstraints");
+ 
+       // Check that all subordinate certs pass the name constraint
+       for(size_t j = 0; j < pos; ++j)
+          {
+-         bool permitted = m_name_constraints.permitted().empty();
+-         bool failed = false;
++         const auto& cert = cert_path.at(j);
+ 
+-         for(auto c: m_name_constraints.permitted())
+-            {
+-            switch(c.base().matches(*cert_path.at(j)))
+-               {
+-               case GeneralName::MatchResult::NotFound:
+-               case GeneralName::MatchResult::All:
+-                  permitted = true;
+-                  break;
+-               case GeneralName::MatchResult::UnknownType:
+-                  failed = issuer_name_constraint_critical;
+-                  permitted = true;
+-                  break;
+-               default:
+-                  break;
+-               }
+-            }
++         const size_t total_names =
++            cert->subject_dn().dn_info().size() +
++            cert->subject_alt_name().get_attributes().size();
+ 
+-         for(auto c: m_name_constraints.excluded())
+-            {
+-            switch(c.base().matches(*cert_path.at(j)))
+-               {
+-               case GeneralName::MatchResult::All:
+-               case GeneralName::MatchResult::Some:
+-                  failed = true;
+-                  break;
+-               case GeneralName::MatchResult::UnknownType:
+-                  failed = issuer_name_constraint_critical;
+-                  break;
+-               default:
+-                  break;
+-               }
+-            }
++         if(total_names * total_constraints >= MAX_NC_COMPARES) {
++            cert_status.at(j).insert(Certificate_Status_Code::NAME_CONSTRAINT_ERROR);
++            continue;
++         }
+ 
+-         if(failed || !permitted)
+-            {
++         if(!m_name_constraints.is_permitted(*cert, issuer_name_constraint_critical)) {
+             cert_status.at(j).insert(Certificate_Status_Code::NAME_CONSTRAINT_ERROR);
+-            }
++            continue;
++         }
++
++         if(m_name_constraints.is_excluded(*cert, issuer_name_constraint_critical)) {
++            cert_status.at(j).insert(Certificate_Status_Code::NAME_CONSTRAINT_ERROR);
++            continue;
+          }
+       }
+    }
++}
+ 
+ namespace {
+ 
+diff --git a/src/lib/x509/x509cert.cpp b/src/lib/x509/x509cert.cpp
+index 55f279c..fd1bb4c 100644
+--- a/src/lib/x509/x509cert.cpp
++++ b/src/lib/x509/x509cert.cpp
+@@ -17,6 +17,7 @@
+ #include <botan/oids.h>
+ #include <botan/hash.h>
+ #include <botan/hex.h>
++#include <botan/internal/stl_util.h>
+ #include <algorithm>
+ #include <sstream>
+ 
+@@ -788,16 +789,35 @@ bool X509_Certificate::matches_dns_name(const std::string& name) const
+    if(name.empty())
+       return false;
+ 
+-   std::vector<std::string> issued_names = subject_info("DNS");
++   bool is_ipv4 = false;
+ 
+-   // Fall back to CN only if no DNS names are set (RFC 6125 sec 6.4.4)
+-   if(issued_names.empty())
++   try {
++      string_to_ipv4(name);
++      is_ipv4 = true;
++      }
++   catch(...) {}
++
++   std::vector<std::string> issued_names;
++
++   if(subject_alt_name().has_items()) {
++      issued_names = subject_alt_name().get_attribute(is_ipv4 ? "IP" : "DNS");
++   } else if(is_ipv4 == false) {
++      // Use CN only if no SAN is included
+       issued_names = subject_info("Name");
++   }
+ 
+    for(size_t i = 0; i != issued_names.size(); ++i)
+       {
+-      if(host_wildcard_match(issued_names[i], name))
+-         return true;
++      if(is_ipv4)
++         {
++         if(issued_names[i] == name)
++            return true;
++         }
++      else
++         {
++         if(host_wildcard_match(issued_names[i], name))
++            return true;
++         }
+       }
+ 
+    return false;
+diff --git a/src/python/botan2.py b/src/python/botan2.py
+index 6ae1bd6..f424303 100755
+--- a/src/python/botan2.py
++++ b/src/python/botan2.py
+@@ -1285,6 +1285,7 @@ def _load_buf_or_file(filename, buf, file_fn, buf_fn):
+ #
+ class X509Cert(object): # pylint: disable=invalid-name
+     def __init__(self, filename=None, buf=None):
++        self.__obj = c_void_p(0)
+         self.__obj = _load_buf_or_file(filename, buf, _DLL.botan_x509_cert_load_file, _DLL.botan_x509_cert_load)
+ 
+     def __del__(self):
+@@ -1464,6 +1465,7 @@ class X509Cert(object): # pylint: disable=invalid-name
+ #
+ class X509CRL(object):
+     def __init__(self, filename=None, buf=None):
++        self.__obj = c_void_p(0)
+         self.__obj = _load_buf_or_file(filename, buf, _DLL.botan_x509_crl_load_file, _DLL.botan_x509_crl_load)
+ 
+     def __del__(self):
+diff --git a/src/scripts/test_python.py b/src/scripts/test_python.py
+index 2202c0e..c45b9f1 100644
+--- a/src/scripts/test_python.py
++++ b/src/scripts/test_python.py
+@@ -474,9 +474,6 @@ ofvkP1EDmpx50fHLawIDAQAB
+         self.assertEqual(cert.issuer_dn('Organizational Unit', 0), 'bsi')
+         self.assertEqual(cert.issuer_dn('Country', 0), 'DE')
+ 
+-        self.assertTrue(cert.hostname_match('csca-germany'))
+-        self.assertFalse(cert.hostname_match('csca-slovakia'))
+-
+         self.assertEqual(cert.not_before(), 1184858838)
+         self.assertEqual(cert.not_after(), 1831907880)
+ 
+diff --git a/src/tests/test_name_constraint.cpp b/src/tests/test_name_constraint.cpp
+index d99e967..7e08641 100644
+--- a/src/tests/test_name_constraint.cpp
++++ b/src/tests/test_name_constraint.cpp
+@@ -29,17 +29,17 @@ class Name_Constraint_Tests final : public Test
+             std::make_tuple(
+                "Root_Email_Name_Constraint.crt",
+                "Invalid_Email_Name_Constraint.crt",
+-               "Invalid Email Name Constraint",
++               "",
+                "Certificate does not pass name constraint"),
+             std::make_tuple(
+                "Root_DN_Name_Constraint.crt",
+                "Invalid_DN_Name_Constraint.crt",
+-               "Invalid DN Name Constraint",
++               "",
+                "Certificate does not pass name constraint"),
+             std::make_tuple(
+                "Root_DN_Name_Constraint.crt",
+                "Valid_DN_Name_Constraint.crt",
+-               "Valid DN Name Constraint",
++               "",
+                "Verified"),
+             std::make_tuple(
+                "Root_DNS_Name_Constraint.crt",
+@@ -49,12 +49,12 @@ class Name_Constraint_Tests final : public Test
+             std::make_tuple(
+                "Root_IP_Name_Constraint.crt",
+                "Valid_IP_Name_Constraint.crt",
+-               "Valid IP Name Constraint",
++               "",
+                "Verified"),
+             std::make_tuple(
+                "Root_IP_Name_Constraint.crt",
+                "Invalid_IP_Name_Constraint.crt",
+-               "Invalid IP Name Constraint",
++               "",
+                "Certificate does not pass name constraint"),
+             };
+          std::vector<Test::Result> results;
diff --git a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
index 6477da4dbf..71e805b655 100644
--- a/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
+++ b/meta-oe/recipes-crypto/botan/botan_2.19.1.bb
@@ -9,6 +9,7 @@ SRC_URI = "https://botan.randombit.net/releases/Botan-${PV}.tar.xz \
            file://0002-FIX-intermediates-can-sign-their-own-OCSP-responses.patch \
            file://0003-FIX-missing-validation-of-authority-of-delegation-re.patch \
            file://0004-review-comments.patch \
+           file://0001-Address-various-name-constraint-bugs.patch \
            "
 SRC_URI[sha256sum] = "e26e00cfefda64082afdd540d3c537924f645d6a674afed2cd171005deff5560"
 

