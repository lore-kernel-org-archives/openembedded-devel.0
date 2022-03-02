Return-Path: <ross@burtonini.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDD9CC433EF
	for <webhook@archiver.kernel.org>; Wed,  2 Mar 2022 10:29:12 +0000 (UTC)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com
 [209.85.221.43])
 by mx.groups.io with SMTP id smtpd.web12.5989.1646216951757346529
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 02:29:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@burtonini-com.20210112.gappssmtp.com header.s=20210112
 header.b=5r2X8rKV;
 spf=pass (domain: burtonini.com, ip: 209.85.221.43,
 mailfrom: ross@burtonini.com)
Received: by mail-wr1-f43.google.com with SMTP id r10so1994749wrp.3
        for <openembedded-devel@lists.openembedded.org>;
 Wed, 02 Mar 2022 02:29:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=burtonini-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YB97M4q8vDK/v3IFpHGMamWdpTaCe/4R5gx3bZa5Bsk=;
        b=5r2X8rKVtGo4sfSV/9ZfwXYMgfHFqcEcNJYyLFj4BWHkje2B/tIflpWrS8DKKfY4FS
         9HmarpPUS2J7YLEn7tekqrGk+9p+F82R4wKqCpM25OZFkoZx+3Gq0OnTjcDqzgKwEvgA
         0PUA/fzjLzDOuER6FkI+VVJqnuKrmCxXXtbYShu2JVeXafBUJgmh7QPJVt9sCR0scAvF
         9tjtoVFsbPYSVDoPA4UlGyS1qKKr9OCOsO8gUsgGrI4ZC1Ej2Wr+gVEyRn3cAbuuZxdb
         bK02O4+cAcv13aaWhwv7T0hm4mBJghf8xSJGD5m7HJ88QPOvxqJrifEhT3jgAvc5rNDO
         tOOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YB97M4q8vDK/v3IFpHGMamWdpTaCe/4R5gx3bZa5Bsk=;
        b=zf7NUOMfXg7ukGKHi0XN2bbqF2k1qvhUI23gJjVlFpQSrcB/8LC2azjqpt74dMv6VZ
         vAI+6SsmZTb2aNRSnxlPvaIQ1jwfkBQPye9+5a7TD1d3SGLMrrU9AiZ/c/D1bvIUS2tA
         N2pfYcXskBtkLFVAvecYBeph9Me+Fy5a02/WQp5uMWypdO2uDwf6F/5WAoBGQxIBjIkr
         fUejLrgwLgrTCls/kDYiyYEDvHzNZ43mLoLasBxq2glvopRVgGD/t5rPLYAtGVPJYCC5
         hDBrWVRhVsJ8XZno1UULXo0EhGBhVZ3BXfNuQGkiI9uNF53vXBT0hJ0K0xzgcbme4u9K
         DP8g==
X-Gm-Message-State: AOAM530DUNb4uq9BTGgGZTH/uLPXUJ+wu909nts64vZIRnwVtnk0+abv
	JzHd6v9fGQcCYy61n5VR927WVurdmnsO9hq7u7Ozew==
X-Google-Smtp-Source: 
 ABdhPJzq/jAy2rLOZEcQUtreEsLAHwn6pgd1mE0tXyYLwPOfLIAicoeeOqno5H3019CJtgKM6a7eoiA92KcW722REWY=
X-Received: by 2002:a5d:5918:0:b0:1f0:3295:f4ec with SMTP id
 v24-20020a5d5918000000b001f03295f4ecmr1608123wrd.451.1646216949838; Wed, 02
 Mar 2022 02:29:09 -0800 (PST)
MIME-Version: 1.0
References: <20220223102016.28259-1-sanakazisk19@gmail.com>
In-Reply-To: <20220223102016.28259-1-sanakazisk19@gmail.com>
From: Ross Burton <ross@burtonini.com>
Date: Wed, 2 Mar 2022 10:28:58 +0000
Message-ID: 
 <CAAnfSTuHU7om3vZTMHL0dSzoeqJwPqSUPHbQX8yXfp6q=k_ANQ@mail.gmail.com>
Subject: Re: [oe] [meta-oe][dunfell][PATCH] protobuf: Fix CVE-2021-22570
To: sana kazi <sanakazisk19@gmail.com>
Cc: openembedded-devel@lists.openembedded.org, ranjitsinh.rathod@kpit.com
Content-Type: text/plain; charset="UTF-8"
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 02 Mar 2022 10:29:12 -0000
X-Groupsio-URL: 
 https://lists.openembedded.org/g/openembedded-devel/message/95687

This causes QA warnings:

WARNING: protobuf-native-3.11.4-r0 do_patch: Fuzz detected:
Applying patch CVE-2021-22570.patch
patching file src/google/protobuf/descriptor.cc
Hunk #1 succeeded at 2603 with fuzz 1 (offset -23 lines).
Hunk #2 succeeded at 2817 with fuzz 1 (offset -14 lines).
Hunk #3 succeeded at 4006 (offset -17 lines).
Hunk #4 succeeded at 4050 (offset -18 lines).
Hunk #5 succeeded at 4368 (offset -18 lines).
The context lines in the patches can be updated with devtool:
devtool modify protobuf-native
devtool finish --force-patch-refresh protobuf-native <layer_path>
Don't forget to review changes done by devtool!

Ross

On Wed, 23 Feb 2022 at 10:21, sana kazi <sanakazisk19@gmail.com> wrote:
>
> Fix CVE-2021-22570.
> Link: https://koji.fedoraproject.org/koji/buildinfo?buildID=1916865
> Link: https://src.fedoraproject.org/rpms/protobuf/blob/394beeacb500861f76473d47e10314e6a3600810/f/CVE-2021-22570.patch
>
> Remove first and second hunk because the second argument in
> InsertIfNotPresent() function is of type const char* const& but the
> first and second hunk makes the type of second argument as const string
> which is not compatible with the type of second argument in
> InsertIfNotPresent().
>
> Signed-off-by: Sana Kazi <Sana.Kazi@kpit.com>
> Signed-off-by: Sana Kazi <sanakazisk19@gmail.com>
> ---
>  .../protobuf/protobuf/CVE-2021-22570.patch    | 64 +++++++++++++++++++
>  .../protobuf/protobuf_3.11.4.bb               |  1 +
>  2 files changed, 65 insertions(+)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
>
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
> new file mode 100644
> index 000000000..be3180181
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf/CVE-2021-22570.patch
> @@ -0,0 +1,64 @@
> +CVE: CVE-2021-22570
> +Upstream-Status: Backport [https://src.fedoraproject.org/rpms/protobuf/blob/394beeacb500861f76473d47e10314e6a3600810/f/CVE-2021-22570.patch]
> +Comment: Removed first and second hunk
> +Signed-off-by: Sana.Kazi <Sana.Kazi@kpit.com>
> +
> +diff --git a/src/google/protobuf/descriptor.cc b/src/google/protobuf/descriptor.cc
> +index 7af37c57f3..03c4e2b516 100644
> +--- a/src/google/protobuf/descriptor.cc
> ++++ b/src/google/protobuf/descriptor.cc
> +@@ -2626,6 +2626,8 @@ void Descriptor::DebugString(int depth, std::string* contents,
> +       const Descriptor::ReservedRange* range = reserved_range(i);
> +       if (range->end == range->start + 1) {
> +         strings::SubstituteAndAppend(contents, "$0, ", range->start);
> ++      } else if (range->end > FieldDescriptor::kMaxNumber) {
> ++        strings::SubstituteAndAppend(contents, "$0 to max, ", range->start);
> +       } else {
> +         strings::SubstituteAndAppend(contents, "$0 to $1, ", range->start,
> +                                   range->end - 1);
> +@@ -2829,6 +2831,8 @@ void EnumDescriptor::DebugString(
> +       const EnumDescriptor::ReservedRange* range = reserved_range(i);
> +       if (range->end == range->start) {
> +         strings::SubstituteAndAppend(contents, "$0, ", range->start);
> ++      } else if (range->end == INT_MAX) {
> ++        strings::SubstituteAndAppend(contents, "$0 to max, ", range->start);
> +       } else {
> +         strings::SubstituteAndAppend(contents, "$0 to $1, ", range->start,
> +                                   range->end);
> +@@ -4019,6 +4023,11 @@ bool DescriptorBuilder::AddSymbol(const std::string& full_name,
> +   // Use its file as the parent instead.
> +   if (parent == nullptr) parent = file_;
> +
> ++  if (full_name.find('\0') != std::string::npos) {
> ++    AddError(full_name, proto, DescriptorPool::ErrorCollector::NAME,
> ++             "\"" + full_name + "\" contains null character.");
> ++    return false;
> ++  }
> +   if (tables_->AddSymbol(full_name, symbol)) {
> +     if (!file_tables_->AddAliasUnderParent(parent, name, symbol)) {
> +       // This is only possible if there was already an error adding something of
> +@@ -4059,6 +4068,11 @@ bool DescriptorBuilder::AddSymbol(const std::string& full_name,
> + void DescriptorBuilder::AddPackage(const std::string& name,
> +                                    const Message& proto,
> +                                    const FileDescriptor* file) {
> ++  if (name.find('\0') != std::string::npos) {
> ++    AddError(name, proto, DescriptorPool::ErrorCollector::NAME,
> ++             "\"" + name + "\" contains null character.");
> ++    return;
> ++  }
> +   if (tables_->AddSymbol(name, Symbol(file))) {
> +     // Success.  Also add parent package, if any.
> +     std::string::size_type dot_pos = name.find_last_of('.');
> +@@ -4372,6 +4386,12 @@ FileDescriptor* DescriptorBuilder::BuildFileImpl(
> +   }
> +   result->pool_ = pool_;
> +
> ++  if (result->name().find('\0') != std::string::npos) {
> ++    AddError(result->name(), proto, DescriptorPool::ErrorCollector::NAME,
> ++             "\"" + result->name() + "\" contains null character.");
> ++    return nullptr;
> ++  }
> ++
> +   // Add to tables.
> +   if (!tables_->AddFile(result)) {
> +     AddError(proto.name(), proto, DescriptorPool::ErrorCollector::OTHER,
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> index d2f22ba6b..55d56ff08 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf_3.11.4.bb
> @@ -17,6 +17,7 @@ SRC_URI = "git://github.com/google/protobuf.git;branch=3.11.x;protocol=https \
>             file://0001-protobuf-fix-configure-error.patch \
>             file://0001-Makefile.am-include-descriptor.cc-when-building-libp.patch \
>             file://0001-examples-Makefile-respect-CXX-LDFLAGS-variables-fix-.patch \
> +           file://CVE-2021-22570.patch \
>  "
>  S = "${WORKDIR}/git"
>
> --
> 2.17.1
>
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#95476): https://lists.openembedded.org/g/openembedded-devel/message/95476
> Mute This Topic: https://lists.openembedded.org/mt/89337770/1676615
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [ross@burtonini.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>

