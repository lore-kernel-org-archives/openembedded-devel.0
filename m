Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87C9AC74A5B
	for <webhook@archiver.kernel.org>; Wed, 29 Mar 2023 21:25:17 +0000 (UTC)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
 by mx.groups.io with SMTP id smtpd.web10.9744.1680125112465273205
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 29 Mar 2023 14:25:12 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=BN/sMOmd;
 spf=pass (domain: gmail.com, ip: 209.85.167.172, mailfrom: raj.khem@gmail.com)
Received: by mail-oi1-f172.google.com with SMTP id bi31so12701011oib.9
        for <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 14:25:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680125112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=R/zN3cZv+zufFQjTsARJbfGlWEWTGeCIrRE7wP1HWEM=;
        b=BN/sMOmdqNeE9KsUVSQED8ngWWhIWXZPMFr6yEHMquSdDDb/Jni5OUttQ6PpZC377i
         jOfmo9sItbJJMoSy33atSMDlmcNDaOvSsCl6z9OOIvAK4D+l1jqtJIT8RIcVpTRLggiH
         ZHGcoM7wxXGAqcOKuMHFnUeOX3Mhw2yNZlAdpYnbV5OnXLjFhEJOgW+ZlIHcQpXYEogf
         wKnkhbyqFnepUsi0y9OvhxEF9vpR/3a1+sYT49TcZ4xXHWvTDKZgF9f9ZkIL4vT5B7K3
         TMKmJ8gVZ97jZ8YBp56tEHZBHxdRCX3cF6UOqZ8K2+Bh0eMPtoy41b697IlQ/Bzd5+rZ
         CTRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680125112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=R/zN3cZv+zufFQjTsARJbfGlWEWTGeCIrRE7wP1HWEM=;
        b=QiLoQCmOi91YvNWUuxmSG2gLc0M/IYGWeKxTCA/Llo8cIX8R56PHzgNBakwbgMB92T
         +xEvx0gw/XFBWP0IWG6T2D2iN7+fpjqhvivxqZaml9uv9XYHFb/a1zcjWz/8FWp6XYgJ
         XBd5KXMKm2CeflNLQZN4YzLmewmn2XK5ntNRyT72utv8bm++6zWvkHOTyFsKP3sFOgUJ
         BKlAu6X8GIuBrs7XixoGRTH3DM1dD12UYvtPC/OgZqylR4CpmIm8FxGS17SAveiblgzk
         tIRnIE1LtB3qUVCz9hBvFh1akXHWIhVjw8So8BhG8ifR737ofSSYuEk9eDqPCxurhK5h
         hcNQ==
X-Gm-Message-State: AO0yUKUo+CP9tw/w+AmiATKdicMRigV+TCsJ4TfU4ATYpqbeBSG7rI4p
	6EnWVxdp9F3oeu1BAs+6TJk9B3lKtiEfc4CuZ4Kn0RIKp9A=
X-Google-Smtp-Source: AK7set+om8QEUxsQcIS2Bc4R+ccjx1BAOg0gwWl6SH18yv+2EWMEdKJvboke9lzyB5avl1Q5Uy+18uvJpMHFRU5RVaU=
X-Received: by 2002:a54:4d84:0:b0:387:251b:71fa with SMTP id
 y4-20020a544d84000000b00387251b71famr6656283oix.4.1680125111200; Wed, 29 Mar
 2023 14:25:11 -0700 (PDT)
MIME-Version: 1.0
References: <20230329100810.705855-1-xiangyu.chen@eng.windriver.com>
 <20230329100810.705855-3-xiangyu.chen@eng.windriver.com> <CAMKF1sqVZwc8bRpDZEdy2Vygt0HutrZyc175dL2h7ct7_=r2TA@mail.gmail.com>
In-Reply-To: <CAMKF1sqVZwc8bRpDZEdy2Vygt0HutrZyc175dL2h7ct7_=r2TA@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 29 Mar 2023 14:24:44 -0700
Message-ID: <CAMKF1spcoRgO-NMtQeRysghFvTPRYpD9tsyKd_TG6b+ckAx3eQ@mail.gmail.com>
Subject: Re: [oe][meta-oe][PATCH v3 2/3] protobuf-c: add support of protobuf 4.22.x
To: Xiangyu Chen <xiangyu.chen@eng.windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 29 Mar 2023 21:25:17 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/101825

here are errors on qemuarm/clang

https://errors.yoctoproject.org/Errors/Build/161813/

On Wed, Mar 29, 2023 at 12:49=E2=80=AFPM Khem Raj <raj.khem@gmail.com> wrot=
e:
>
> I use archlinux for build system and I am still seeing build failure
> for protobuf-c-native
>
> http://sprunge.us/TiQyPZ
>
> On Wed, Mar 29, 2023 at 3:08=E2=80=AFAM Xiangyu Chen
> <xiangyu.chen@eng.windriver.com> wrote:
> >
> > From: Xiangyu Chen <xiangyu.chen@windriver.com>
> >
> > Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > ---
> >  .../0001-add-support-of-protobuf-4.22.x.patch | 315 ++++++++++++++++++
> >  .../protobuf/protobuf-c_1.4.1.bb              |   5 +-
> >  2 files changed, 319 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-a=
dd-support-of-protobuf-4.22.x.patch
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-supp=
ort-of-protobuf-4.22.x.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c=
/0001-add-support-of-protobuf-4.22.x.patch
> > new file mode 100644
> > index 000000000..075b7044c
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-add-support-of-=
protobuf-4.22.x.patch
> > @@ -0,0 +1,315 @@
> > +From 66a0b0d205224f63f19dd8f96abf9dcdc2112331 Mon Sep 17 00:00:00 2001
> > +From: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +Date: Wed, 29 Mar 2023 14:25:17 +0800
> > +Subject: [PATCH] add support of protobuf 4.22.x
> > +
> > +after upgrade the protobuf to 4.22.x, the protobuf-c cannot compile an=
ymore (#544) due to following changes:
> > +1.protobuf using c++14, that cause the command_line_interface.h report=
 error
> > +2.protobuf using abseil-cpp library instead the trace API with GOOGLE_=
 header
> > +3. removed GOOGLE_DISALLOW_EVIL_CONSTRUCTORS
> > +
> > +Upstream-Status: Pending [https://github.com/protobuf-c/protobuf-c/pul=
l/548]
> > +
> > +Signed-off-by: Xiangyu Chen <xiangyu.chen@windriver.com>
> > +---
> > + Makefile.am                   | 2 +-
> > + configure.ac                  | 8 ++++++++
> > + protoc-c/c_bytes_field.h      | 1 -
> > + protoc-c/c_enum.h             | 1 -
> > + protoc-c/c_enum_field.h       | 1 -
> > + protoc-c/c_extension.h        | 1 -
> > + protoc-c/c_field.cc           | 2 +-
> > + protoc-c/c_field.h            | 3 ---
> > + protoc-c/c_file.h             | 1 -
> > + protoc-c/c_generator.h        | 2 --
> > + protoc-c/c_helpers.cc         | 4 ++--
> > + protoc-c/c_message.cc         | 4 ++--
> > + protoc-c/c_message.h          | 1 -
> > + protoc-c/c_message_field.h    | 3 ---
> > + protoc-c/c_primitive_field.cc | 6 +++---
> > + protoc-c/c_primitive_field.h  | 3 ---
> > + protoc-c/c_service.h          | 1 -
> > + protoc-c/c_string_field.h     | 1 -
> > + 18 files changed, 17 insertions(+), 28 deletions(-)
> > +
> > +diff --git a/Makefile.am b/Makefile.am
> > +index c7339ef..3b0d1d6 100644
> > +--- a/Makefile.am
> > ++++ b/Makefile.am
> > +@@ -20,7 +20,7 @@ AM_CPPFLAGS =3D \
> > +       -I${top_builddir} \
> > +       -I${top_srcdir}
> > + AM_CFLAGS =3D ${my_CFLAGS}
> > +-AM_LDFLAGS =3D
> > ++AM_LDFLAGS =3D ${ABSL_LOG_INTERNAL_CHECK_OP_LIBS} ${ABSL_LOG_RAW_HASH=
_SET_LIBS}
> > +
> > + # code coverage
> > +
> > +diff --git a/configure.ac b/configure.ac
> > +index f5a0261..8ed549a 100644
> > +--- a/configure.ac
> > ++++ b/configure.ac
> > +@@ -78,6 +78,14 @@ if test "x$enable_protoc" !=3D "xno"; then
> > +
> > +   AX_CXX_COMPILE_STDCXX(11, noext, mandatory)
> > +
> > ++# now checking 4.22.x protobuf, if so, set cxx as 14
> > ++  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],[AX_CXX_COMPIL=
E_STDCXX(14, noext, mandatory)])
> > ++
> > ++  AS_IF([pkg-config --atleast-version 4.22.0 protobuf],
> > ++    [PKG_CHECK_MODULES([ABSL_LOG_INTERNAL_CHECK_OP], [absl_log_intern=
al_check_op],
> > ++       [PKG_CHECK_MODULES([ABSL_LOG_RAW_HASH_SET], [absl_raw_hash_set=
], [], [AC_MSG_ERROR([Missing absl_raw_hash_set library.])])],
> > ++       [AC_MSG_ERROR([Missing absl_log_internal_check_op library.])])=
])
> > ++
> > +   PKG_CHECK_MODULES([protobuf], [protobuf >=3D 3.0.0],
> > +     [proto3_supported=3Dyes],
> > +     [PKG_CHECK_MODULES([protobuf], [protobuf >=3D 2.6.0])]
> > +diff --git a/protoc-c/c_bytes_field.h b/protoc-c/c_bytes_field.h
> > +index bf873f0..8fc63d3 100644
> > +--- a/protoc-c/c_bytes_field.h
> > ++++ b/protoc-c/c_bytes_field.h
> > +@@ -88,7 +88,6 @@ class BytesFieldGenerator : public FieldGenerator {
> > +  private:
> > +   std::map<std::string, std::string> variables_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(BytesFieldGenerator);
> > + };
> > +
> > +
> > +diff --git a/protoc-c/c_enum.h b/protoc-c/c_enum.h
> > +index 9c34b69..d5e58f0 100644
> > +--- a/protoc-c/c_enum.h
> > ++++ b/protoc-c/c_enum.h
> > +@@ -107,7 +107,6 @@ class EnumGenerator {
> > +   const EnumDescriptor* descriptor_;
> > +   std::string dllexport_decl_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumGenerator);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_enum_field.h b/protoc-c/c_enum_field.h
> > +index 3f8c005..03eb402 100644
> > +--- a/protoc-c/c_enum_field.h
> > ++++ b/protoc-c/c_enum_field.h
> > +@@ -86,7 +86,6 @@ class EnumFieldGenerator : public FieldGenerator {
> > +  private:
> > +   std::map<std::string, std::string> variables_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(EnumFieldGenerator);
> > + };
> > +
> > +
> > +diff --git a/protoc-c/c_extension.h b/protoc-c/c_extension.h
> > +index 9541388..9c5797d 100644
> > +--- a/protoc-c/c_extension.h
> > ++++ b/protoc-c/c_extension.h
> > +@@ -99,7 +99,6 @@ class ExtensionGenerator {
> > +   std::string type_traits_;
> > +   std::string dllexport_decl_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ExtensionGenerator);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
> > +index 0716744..4abdc6d 100644
> > +--- a/protoc-c/c_field.cc
> > ++++ b/protoc-c/c_field.cc
> > +@@ -231,7 +231,7 @@ FieldGeneratorMap::~FieldGeneratorMap() {}
> > +
> > + const FieldGenerator& FieldGeneratorMap::get(
> > +     const FieldDescriptor* field) const {
> > +-  GOOGLE_CHECK_EQ(field->containing_type(), descriptor_);
> > ++  ABSL_CHECK_EQ(field->containing_type(), descriptor_);
> > +   return *field_generators_[field->index()];
> > + }
> > +
> > +diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
> > +index 3cad35d..76d3b0b 100644
> > +--- a/protoc-c/c_field.h
> > ++++ b/protoc-c/c_field.h
> > +@@ -104,8 +104,6 @@ class FieldGenerator {
> > +                                             const std::string &descri=
ptor_addr) const;
> > +   const FieldDescriptor *descriptor_;
> > +
> > +- private:
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGenerator);
> > + };
> > +
> > + // Convenience class which constructs FieldGenerators for a Descripto=
r.
> > +@@ -122,7 +120,6 @@ class FieldGeneratorMap {
> > +
> > +   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FieldGeneratorMap);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
> > +index 8dfd8ba..ec55906 100644
> > +--- a/protoc-c/c_file.h
> > ++++ b/protoc-c/c_file.h
> > +@@ -104,7 +104,6 @@ class FileGenerator {
> > +   std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_genera=
tors_;
> > +   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_ge=
nerators_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_generator.h b/protoc-c/c_generator.h
> > +index ac1ffaf..9260116 100644
> > +--- a/protoc-c/c_generator.h
> > ++++ b/protoc-c/c_generator.h
> > +@@ -94,8 +94,6 @@ class PROTOC_C_EXPORT CGenerator : public CodeGenera=
tor {
> > +                 OutputDirectory* output_directory,
> > +                 std::string* error) const;
> > +
> > +- private:
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(CGenerator);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
> > +index 6fd0cd3..1eaeeb4 100644
> > +--- a/protoc-c/c_helpers.cc
> > ++++ b/protoc-c/c_helpers.cc
> > +@@ -286,7 +286,7 @@ const char* const kKeywordList[] =3D {
> > +
> > + std::set<std::string> MakeKeywordsMap() {
> > +   std::set<std::string> result;
> > +-  for (int i =3D 0; i < GOOGLE_ARRAYSIZE(kKeywordList); i++) {
> > ++  for (int i =3D 0; i < ABSL_ARRAYSIZE(kKeywordList); i++) {
> > +     result.insert(kKeywordList[i]);
> > +   }
> > +   return result;
> > +@@ -548,7 +548,7 @@ std::string CEscape(const std::string& src) {
> > +   std::unique_ptr<char[]> dest(new char[dest_length]);
> > +   const int len =3D CEscapeInternal(src.data(), src.size(),
> > +                                   dest.get(), dest_length, false);
> > +-  GOOGLE_DCHECK_GE(len, 0);
> > ++  ABSL_DCHECK_GE(len, 0);
> > +   return std::string(dest.get(), len);
> > + }
> > +
> > +diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
> > +index 37e8bf8..c7e8515 100755
> > +--- a/protoc-c/c_message.cc
> > ++++ b/protoc-c/c_message.cc
> > +@@ -499,7 +499,7 @@ GenerateMessageDescriptor(io::Printer* printer, bo=
ol gen_init) {
> > +         // NOTE: not supported by protobuf
> > +         vars["maybe_static"] =3D "";
> > +         vars["field_dv_ctype"] =3D "{ ... }";
> > +-        GOOGLE_LOG(DFATAL) << "Messages can't have default values!";
> > ++        ABSL_LOG(FATAL) << "Messages can't have default values!";
> > +         break;
> > +       case FieldDescriptor::CPPTYPE_STRING:
> > +         if (fd->type() =3D=3D FieldDescriptor::TYPE_BYTES || opt.stri=
ng_as_bytes())
> > +@@ -521,7 +521,7 @@ GenerateMessageDescriptor(io::Printer* printer, bo=
ol gen_init) {
> > +           break;
> > +         }
> > +       default:
> > +-        GOOGLE_LOG(DFATAL) << "Unknown CPPTYPE";
> > ++        ABSL_LOG(FATAL) << "Unknown CPPTYPE";
> > +         break;
> > +       }
> > +       if (!already_defined)
> > +diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
> > +index ea1c3ab..e90782b 100644
> > +--- a/protoc-c/c_message.h
> > ++++ b/protoc-c/c_message.h
> > +@@ -137,7 +137,6 @@ class MessageGenerator {
> > +   std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
> > +   std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_ge=
nerators_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_message_field.h b/protoc-c/c_message_field.h
> > +index 39b8d99..42efe36 100644
> > +--- a/protoc-c/c_message_field.h
> > ++++ b/protoc-c/c_message_field.h
> > +@@ -83,9 +83,6 @@ class MessageFieldGenerator : public FieldGenerator =
{
> > +   std::string GetDefaultValue(void) const;
> > +   void GenerateStaticInit(io::Printer* printer) const;
> > +
> > +- private:
> > +-
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageFieldGenerator);
> > + };
> > +
> > +
> > +diff --git a/protoc-c/c_primitive_field.cc b/protoc-c/c_primitive_fiel=
d.cc
> > +index 6990893..d5a7b60 100644
> > +--- a/protoc-c/c_primitive_field.cc
> > ++++ b/protoc-c/c_primitive_field.cc
> > +@@ -99,7 +99,7 @@ void PrimitiveFieldGenerator::GenerateStructMembers(=
io::Printer* printer) const
> > +     case FieldDescriptor::TYPE_STRING  :
> > +     case FieldDescriptor::TYPE_BYTES   :
> > +     case FieldDescriptor::TYPE_GROUP   :
> > +-    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a =
primitive type"; break;
> > ++    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a pr=
imitive type"; break;
> > +
> > +     // No default because we want the compiler to complain if any new
> > +     // types are added.
> > +@@ -143,7 +143,7 @@ std::string PrimitiveFieldGenerator::GetDefaultVal=
ue() const
> > +     case FieldDescriptor::CPPTYPE_BOOL:
> > +       return descriptor_->default_value_bool() ? "1" : "0";
> > +     default:
> > +-      GOOGLE_LOG(DFATAL) << "unexpected CPPTYPE in c_primitive_field"=
;
> > ++      ABSL_LOG(FATAL) << "unexpected CPPTYPE in c_primitive_field";
> > +       return "UNEXPECTED_CPPTYPE";
> > +   }
> > + }
> > +@@ -197,7 +197,7 @@ void PrimitiveFieldGenerator::GenerateDescriptorIn=
itializer(io::Printer* printer
> > +     case FieldDescriptor::TYPE_STRING  :
> > +     case FieldDescriptor::TYPE_BYTES   :
> > +     case FieldDescriptor::TYPE_GROUP   :
> > +-    case FieldDescriptor::TYPE_MESSAGE : GOOGLE_LOG(FATAL) << "not a =
primitive type"; break;
> > ++    case FieldDescriptor::TYPE_MESSAGE : ABSL_LOG(FATAL) << "not a pr=
imitive type"; break;
> > +
> > +     // No default because we want the compiler to complain if any new
> > +     // types are added.
> > +diff --git a/protoc-c/c_primitive_field.h b/protoc-c/c_primitive_field=
.h
> > +index a9eb893..d2bb724 100644
> > +--- a/protoc-c/c_primitive_field.h
> > ++++ b/protoc-c/c_primitive_field.h
> > +@@ -83,9 +83,6 @@ class PrimitiveFieldGenerator : public FieldGenerato=
r {
> > +   std::string GetDefaultValue(void) const;
> > +   void GenerateStaticInit(io::Printer* printer) const;
> > +
> > +- private:
> > +-
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(PrimitiveFieldGenerator);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_service.h b/protoc-c/c_service.h
> > +index 27125a6..4737ff3 100644
> > +--- a/protoc-c/c_service.h
> > ++++ b/protoc-c/c_service.h
> > +@@ -101,7 +101,6 @@ class ServiceGenerator {
> > +   const ServiceDescriptor* descriptor_;
> > +   std::map<std::string, std::string> vars_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(ServiceGenerator);
> > + };
> > +
> > + }  // namespace c
> > +diff --git a/protoc-c/c_string_field.h b/protoc-c/c_string_field.h
> > +index 513cea7..ba258e4 100644
> > +--- a/protoc-c/c_string_field.h
> > ++++ b/protoc-c/c_string_field.h
> > +@@ -88,7 +88,6 @@ class StringFieldGenerator : public FieldGenerator {
> > +  private:
> > +   std::map<std::string, std::string> variables_;
> > +
> > +-  GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(StringFieldGenerator);
> > + };
> > +
> > +
> > +--
> > +2.34.1
> > +
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb b/me=
ta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> > index d724287d6..bdaf43a54 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.4.1.bb
> > @@ -12,7 +12,10 @@ LIC_FILES_CHKSUM =3D "file://LICENSE;md5=3D9f725889e=
0d77383e26cb42b0b62cea2"
> >
> >  DEPENDS =3D "protobuf-native protobuf"
> >
> > -SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git;branch=3Dmaste=
r;protocol=3Dhttps"
> > +SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git;branch=3Dmaste=
r;protocol=3Dhttps \
> > +           file://0001-add-support-of-protobuf-4.22.x.patch \
> > +           "
> > +
> >  SRCREV =3D "abc67a11c6db271bedbb9f58be85d6f4e2ea8389"
> >
> >  S =3D "${WORKDIR}/git"
> > --
> > 2.34.1
> >

