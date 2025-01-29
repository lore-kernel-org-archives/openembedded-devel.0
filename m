Return-Path: <leon.anavi@konsulko.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 002F7C02190
	for <webhook@archiver.kernel.org>; Wed, 29 Jan 2025 11:41:05 +0000 (UTC)
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
 by mx.groups.io with SMTP id smtpd.web10.10686.1738150849299357079
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Jan 2025 03:40:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@konsulko.com header.s=google header.b=g6bg6mnc;
 spf=pass (domain: konsulko.com, ip: 209.85.221.49, mailfrom: leon.anavi@konsulko.com)
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-38634c35129so6022133f8f.3
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 03:40:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=konsulko.com; s=google; t=1738150847; x=1738755647; darn=lists.openembedded.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2pZQRnd/V2BUM7QJWt1lA8FGXV9NuHW2szu2Eq6omg4=;
        b=g6bg6mncZHz8PzLcYNAMokc5opFbNVRs/IOQa/lyAlMsKxmIoNgLgHH1KLBaac7bbD
         +3PxVp/I4kusgDEnwhUEkWf5cpZet94XcrUe4wXatyo7CGc+v+AgOBS3t+OL3qCKnM42
         HNlju/h0HbPqMObK4rFdvzFVSnLf6wCBHUPP8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738150847; x=1738755647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2pZQRnd/V2BUM7QJWt1lA8FGXV9NuHW2szu2Eq6omg4=;
        b=n5hC+7KNWqBvZ/Am++hli+/f75gtKPw3MDA6dwbhJN+GM5uf5l/KGSrX3YAeMiSmOW
         8G9doLMR71k1jlkq+tgYk63BbL/HyeUdQbNioL8oThlVrIXB3+HS+tGj0RS9s3xMY5gH
         N5oxL9DideUXyHwRokjDM5bGC0/xOVEBb4SXOQRlM41a7j8IDqbtRrVGZNjhiG4GJDfz
         UvhtDxp884Yhx56exAbikbJmrYkXN1cq8cv1O7QD1aBJXectCl9hUDwhmf3K8rH84z/z
         qfGGDVkRe4X0W+csRGlSe4emw8KewnGmcu+K4bMf75cri+TCzfaYZnOj77+X2Rv1DqAQ
         QX+A==
X-Gm-Message-State: AOJu0Yy1KXbAcNrmFA3wUAXdZS7CEaWv3GvBuNfakRf1dm0d9K/SRslV
	NAYmVyRXsaMZucme4cwLVY9g7tuh0dTM1jW/Pmk98dBWty/u2sazLz5sc2jUGa+hEBDfuIxwj23
	s
X-Gm-Gg: ASbGncvY0AFO6Fa9C3agVU+Vb5jDRhqoFffDpod4935LpF/Naa4XaU5luIBoho4SGtK
	2VfzK3JjTTwwjHGM72G2EURiqnP7bKnIFjaYRK9ZaFJKCyOdpvLl1gIb2zqV+mqEtA+SCEv4JK8
	kJcEnMTpCzwxrLkzE40q/fDQkFympP5JNh2lUpDsauDFhQAn8CljhgxSHOZAd03aeJgQgxBGP31
	n+llUM6qZFSry8wt9L0v7ryy0i76Bbl7Vk00FKPpXdmdWtsy9IJ1sFBcju8k46317jJoS5WUDiw
	DQLwmP++UIeldGS0LKhIEoI89Ku9eg==
X-Google-Smtp-Source: AGHT+IFmnI8p1N6sTsCuHjMqAOCtgQbktLFfuDT3WoGB9vdpyqzXaUKj29jAJ7gH0y8yQGsGO66rVQ==
X-Received: by 2002:a05:6000:1866:b0:385:df5d:622c with SMTP id ffacd0b85a97d-38c51b5f206mr2346340f8f.30.1738150846940;
        Wed, 29 Jan 2025 03:40:46 -0800 (PST)
Received: from tone.k.g (lan.nucleusys.com. [92.247.61.126])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c2a176449sm16982283f8f.11.2025.01.29.03.40.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 03:40:46 -0800 (PST)
From: Leon Anavi <leon.anavi@konsulko.com>
To: openembedded-devel@lists.openembedded.org
Cc: Leon Anavi <leon.anavi@konsulko.com>
Subject: [meta-python][PATCH 7/7] python3-nanobind: Add recipe
Date: Wed, 29 Jan 2025 13:40:39 +0200
Message-Id: <20250129114039.3562870-7-leon.anavi@konsulko.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250129114039.3562870-1-leon.anavi@konsulko.com>
References: <20250129114039.3562870-1-leon.anavi@konsulko.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Jan 2025 11:41:05 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115137

Add recipe for nanobind, tiny and efficient C++/Python bindings.

Changelog for version 2.4.0:

- Added a function annotation :cpp:class:`nb::call_policy\<Policy\>()
  <call_policy>` which supports custom function wrapping logic,
  calling Policy::precall() before the bound function and
  Policy::postcall() after. This is a low-level interface intended
  for advanced users. The precall and postcall hooks are able to
  observe the Python objects forming the function arguments and
  return value, and the precall hook can change the arguments.
- :cpp:func:`nb::make_iterator <make_iterator>` now accepts its
  iterator arguments by value, rather than by forwarding reference,
  in order to eliminate the hazard of storing a dangling C++
  iterator reference in the returned Python iterator object.
- The std::variant type_caster now does two passes when converting
  from Python. The first pass is done without implicit conversions.
  This fixes an issue where std::variant<U, T> might cast a Python
  object wrapping a T to a U if there is an implicit conversion
  available from T to U.
- Restored support for constructing types with an overloaded
  __new__ that takes no arguments, which regressed with the
  constructor vector call acceleration that was added in nanobind
  2.2.0.
- Bindings for augmented assignment operators (as generated, for
  example, by .def(nb::self += nb::self)) now return the same
  object in Python in the typical case where the C++ operator
  returns a reference to *this. Previously, after a += b, a would
  be replaced with a copy.
- Added an overload to :cpp:func:`nb::isinstance <isinstance>`
  which tests if a Python object is an instance of a Python class.
  This is in addition to the existing overload, which tests if a
  Python object is an instance of a bound C++ class.
- Added support for overriding static properties, such as those
  defined using def_prop_ro_static, in subclasses. Previously this
  would fail with an error.
- Other minor fixes and improvements.

This work was sponsored by GOVCERT.LU.

Signed-off-by: Leon Anavi <leon.anavi@konsulko.com>
---
 .../python/python3-nanobind_2.4.0.bb          | 26 +++++++++++++++++++
 1 file changed, 26 insertions(+)
 create mode 100644 meta-python/recipes-devtools/python/python3-nanobind_2.4.0.bb

diff --git a/meta-python/recipes-devtools/python/python3-nanobind_2.4.0.bb b/meta-python/recipes-devtools/python/python3-nanobind_2.4.0.bb
new file mode 100644
index 0000000000..a151d6db4e
--- /dev/null
+++ b/meta-python/recipes-devtools/python/python3-nanobind_2.4.0.bb
@@ -0,0 +1,26 @@
+SUMMARY = "nanobind: tiny and efficient C++/Python bindings"
+DESCRIPTION = "nanobind: tiny and efficient C++/Python bindings"
+HOMEPAGE = "https://github.com/wjakob/nanobind"
+LICENSE = "BSD-3-Clause"
+LIC_FILES_CHKSUM = "file://LICENSE;md5=7646f9ee25e49eaf53f89a10665c568c"
+
+SRC_URI[sha256sum] = "a0392dee5f58881085b2ac8bfe8e53f74285aa4868b1472bfaf76cfb414e1c96"
+
+inherit pypi python_setuptools_build_meta cmake lib_package
+
+EXTRA_OECMAKE += "-DNB_TEST=OFF"
+
+DEPENDS += "\
+    python3-scikit-build-native \
+    python3-scikit-build-core-native \
+    ninja-native \
+"
+
+do_install:append() {
+    install -d ${D}${base_libdir}/cmake/${PN}
+    install -m 0644 ${S}/cmake/* ${D}${base_libdir}/cmake/${PN}/
+}
+
+FILES:${PN} += "${prefix_native}/* ${prefix_native}/${PN}/* ${base_libdir}/cmake/*"
+
+BBCLASSEXTEND = "native nativesdk"
-- 
2.39.5


