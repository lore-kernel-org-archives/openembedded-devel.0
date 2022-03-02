Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A68B0C433F5
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 13:59:55 +0000 (UTC)
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by mx.groups.io with SMTP id smtpd.web10.7485.1646229594373439964
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 05:59:54 -0800
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: arm.com, ip: 217.140.110.172, mailfrom: ross.burton@arm.com)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7D2B813D5
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 05:59:53 -0800 (PST)
Received: from oss-tx204.lab.cambridge.arm.com
 (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 27A133F73D
	for <openembedded-devel@lists.openembedded.org>;
 Wed,  2 Mar 2022 05:59:53 -0800 (PST)
From: Ross Burton <ross.burton@arm.com>
To: openembedded-devel@lists.openembedded.org
Subject: [PATCH][dunfell] protobuf: fix patch fuzz
Date: Wed,  2 Mar 2022 13:59:48 +0000
Message-Id: <20220302135948.4086055-1-ross.burton@arm.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 13:59:55 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95688

Applying patch CVE-2021-22570.patch
patching file src/google/protobuf/descriptor.cc
Hunk #1 succeeded at 2603 with fuzz 1 (offset -23 lines).
Hunk #2 succeeded at 2817 with fuzz 1 (offset -14 lines).
Hunk #3 succeeded at 4006 (offset -17 lines).
Hunk #4 succeeded at 4050 (offset -18 lines).
Hunk #5 succeeded at 4368 (offset -18 lines).

Signed-off-by: Ross Burton <ross.burton@arm.com>
---
 .../protobuf/protobuf/CVE-2021-22570.patch    | 25 +++++++++++++------
 1 file changed, 17 insertions(+), 8 deletions(-)

diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.pa=
tch b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
index be3180181a..bb9594e968 100644
--- a/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
+++ b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
@@ -1,13 +1,22 @@
+From f5ce0700d80c776186b0fb0414ef20966a3a6a03 Mon Sep 17 00:00:00 2001
+From: "Sana.Kazi" <Sana.Kazi@kpit.com>
+Date: Wed, 23 Feb 2022 15:50:16 +0530
+Subject: [PATCH] protobuf: Fix CVE-2021-22570
+
 CVE: CVE-2021-22570
 Upstream-Status: Backport [https://src.fedoraproject.org/rpms/protobuf/b=
lob/394beeacb500861f76473d47e10314e6a3600810/f/CVE-2021-22570.patch]
 Comment: Removed first and second hunk
 Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
=20
+---
+ src/google/protobuf/descriptor.cc | 20 ++++++++++++++++++++
+ 1 file changed, 20 insertions(+)
+
 diff --git a/src/google/protobuf/descriptor.cc b/src/google/protobuf/des=
criptor.cc
-index 7af37c57f3..03c4e2b516 100644
+index 6835a3cde..1514ae531 100644
 --- a/src/google/protobuf/descriptor.cc
 +++ b/src/google/protobuf/descriptor.cc
-@@ -2626,6 +2626,8 @@ void Descriptor::DebugString(int depth, std::strin=
g* contents,
+@@ -2603,6 +2603,8 @@ void Descriptor::DebugString(int depth, std::strin=
g* contents,
        const Descriptor::ReservedRange* range =3D reserved_range(i);
        if (range->end =3D=3D range->start + 1) {
          strings::SubstituteAndAppend(contents, "$0, ", range->start);
@@ -15,8 +24,8 @@ index 7af37c57f3..03c4e2b516 100644
 +        strings::SubstituteAndAppend(contents, "$0 to max, ", range->st=
art);
        } else {
          strings::SubstituteAndAppend(contents, "$0 to $1, ", range->sta=
rt,
-                                   range->end - 1);
-@@ -2829,6 +2831,8 @@ void EnumDescriptor::DebugString(
+                                      range->end - 1);
+@@ -2815,6 +2817,8 @@ void EnumDescriptor::DebugString(
        const EnumDescriptor::ReservedRange* range =3D reserved_range(i);
        if (range->end =3D=3D range->start) {
          strings::SubstituteAndAppend(contents, "$0, ", range->start);
@@ -24,8 +33,8 @@ index 7af37c57f3..03c4e2b516 100644
 +        strings::SubstituteAndAppend(contents, "$0 to max, ", range->st=
art);
        } else {
          strings::SubstituteAndAppend(contents, "$0 to $1, ", range->sta=
rt,
-                                   range->end);
-@@ -4019,6 +4023,11 @@ bool DescriptorBuilder::AddSymbol(const std::stri=
ng& full_name,
+                                      range->end);
+@@ -4002,6 +4006,11 @@ bool DescriptorBuilder::AddSymbol(const std::stri=
ng& full_name,
    // Use its file as the parent instead.
    if (parent =3D=3D nullptr) parent =3D file_;
 =20
@@ -37,7 +46,7 @@ index 7af37c57f3..03c4e2b516 100644
    if (tables_->AddSymbol(full_name, symbol)) {
      if (!file_tables_->AddAliasUnderParent(parent, name, symbol)) {
        // This is only possible if there was already an error adding som=
ething of
-@@ -4059,6 +4068,11 @@ bool DescriptorBuilder::AddSymbol(const std::stri=
ng& full_name,
+@@ -4041,6 +4050,11 @@ bool DescriptorBuilder::AddSymbol(const std::stri=
ng& full_name,
  void DescriptorBuilder::AddPackage(const std::string& name,
                                     const Message& proto,
                                     const FileDescriptor* file) {
@@ -49,7 +58,7 @@ index 7af37c57f3..03c4e2b516 100644
    if (tables_->AddSymbol(name, Symbol(file))) {
      // Success.  Also add parent package, if any.
      std::string::size_type dot_pos =3D name.find_last_of('.');
-@@ -4372,6 +4386,12 @@ FileDescriptor* DescriptorBuilder::BuildFileImpl(
+@@ -4354,6 +4368,12 @@ FileDescriptor* DescriptorBuilder::BuildFileImpl(
    }
    result->pool_ =3D pool_;
 =20
--=20
2.25.1


