Return-Path: <raj.khem@gmail.com>
Received: from mail-qt0-f193.google.com (mail-qt0-f193.google.com
	[209.85.216.193])
	by mail.openembedded.org (Postfix) with ESMTP id C42867943D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 21:17:34 +0000 (UTC)
Received: by mail-qt0-f193.google.com with SMTP id h4-v6so11710919qtj.7
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 24 Aug 2018 14:17:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=DKc2ME1q9Is3XzWmbvCeTv5NIYipcf47HRTQTdtV5qU=;
	b=W++/uFEEPg3xx7Xb+AxJJE+7kPn3rr7b3IYQJD5K7ydhzpp3uhugNTfSk9tqU6q8Kj
	14anSLBRTUgD4zh7ZjNUQlDOy07zw3hO8g2BgCI7+GNSMW1wyJitw2c2gJOCYOKZlnIe
	SMGy/QdJdil5Q8kQlZBkldqak0/GZtVpXXScoc+VFdPMwqjwIJKs6q6a3PlZ4euwoYc0
	ipIbxKG8ETj/FH9VmwcEKnM9/QubOGPuOwpHULrLMqU9ezxvXhEA0hcjR8UMMZn7KRp7
	/WcIr5H/0+FGsnGxND8Pt2o9YgLjc+69DlID6mO/yIrsbo5nknyjza2IXfQv3DBO1fTN
	pf0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=DKc2ME1q9Is3XzWmbvCeTv5NIYipcf47HRTQTdtV5qU=;
	b=uh+W9Z5TAwuAZ8QLDWdQQmcEpdOhRHxwZFLcNHWG/zT1tiIz2PFIuiRvsy1LHIqsnu
	aJk2LDKLl8waDxqyPqgrH1PCv+aU/ERNoHQgeWkOrZiQUWL31mIj2tqi8lLA3ChE16om
	OJH/42FfVtUFdxuOc3uMIGqQbTB0yR4gcrNneh3uOND5gj39FzLNV4DM0L13BFvYwzMc
	1fzRpIEUj+7aSEKWIuZoQ0vuk0I9xPxRPEfCX7pQtl3NDR7AEk2FsP4e0eVzL+pY63vP
	J7IL1zSeO2yDeWOxhG0w/TzSOlsxdIP0/1WkEy7/kVadHiD30EaYY/dQ1ASrkEDE0ZIt
	RPDw==
X-Gm-Message-State: APzg51D3+WA+khigR7H9q6pJS6VqGwwvOzcKEGyXkQ1jPCIvvBUuulkr
	ZD6pjTZwmIRJkVtx8eAx+2WexlUb0TgtcJlZwlY=
X-Google-Smtp-Source: ANB0Vdb0qHo5T6pRqy3Qh5Us1pylcO7NMGuMuYt17yy/gu4yiWI4PIKAb5t3k8N6jNdF5w6ergjdF/mIrFpgkppoBbI=
X-Received: by 2002:ac8:758d:: with SMTP id
	s13-v6mr3779456qtq.161.1535145455419; 
	Fri, 24 Aug 2018 14:17:35 -0700 (PDT)
MIME-Version: 1.0
References: <1532074765-8918-1-git-send-email-changqing.li@windriver.com>
	<20180806141924.GC1361@jama>
In-Reply-To: <20180806141924.GC1361@jama>
From: Khem Raj <raj.khem@gmail.com>
Date: Fri, 24 Aug 2018 14:17:09 -0700
Message-ID: <CAMKF1spJG0PpkLY2a==5X5=bVOcjCkn_kFtMGedugwtrsqyA5w@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH][meta-oe] protobuf-c: fix build error with protobuf 3.6.0.1
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
X-List-Received-Date: Fri, 24 Aug 2018 21:17:35 -0000
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 6, 2018 at 7:19 AM Martin Jansa <martin.jansa@gmail.com> wrote:
>
> On Fri, Jul 20, 2018 at 04:19:25PM +0800, changqing.li@windriver.com wrote:
> > From: Changqing Li <changqing.li@windriver.com>
> >
> > 1. protoc-c depend on protobuf, from protobuf 3.6.0.1,
> > scoped_array is removed, but protoc-c still use scoped_array,
> > caused compile error.
> >
> > 2. fix compile error since missing namespace
>
> There is also an error in grpc caused by new protobuf 3.6.0.1 (the same
> with 3.6.1).
>
> It triggers the build failure only on older hosts, I'm seeing the issue
> on Ubuntu 14.04 with gcc 4.8.4 and wasn't able to reproduce it on Ubuntu
> 18.04 with gcc 7.3.0.
>
> grpc-native fails to build with;
>
> DEBUG: Executing shell function do_compile
> NOTE: VERBOSE=1 cmake --build
> TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build --target all
> -- -j 24
> [1/13] cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
> TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/usr/bin/protoc
> --grpc_out=generate_mock_code=true:TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --cpp_out=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --plugin=protoc-gen-grpc=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/grpc_cpp_plugin
> -I . -I /usr/local/include src/proto/grpc/status/status.proto
> FAILED: gens/src/proto/grpc/status/status.grpc.pb.cc
> gens/src/proto/grpc/status/status.grpc.pb.h
> gens/src/proto/grpc/status/status_mock.grpc.pb.h
> gens/src/proto/grpc/status/status.pb.cc
> gens/src/proto/grpc/status/status.pb.h
> cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
> TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/usr/bin/protoc
> --grpc_out=generate_mock_code=true:TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --cpp_out=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --plugin=protoc-gen-grpc=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/grpc_cpp_plugin
> -I . -I /usr/local/include src/proto/grpc/status/status.proto
> terminate called after throwing an instance of 'std::system_error'
>   what():  Unknown error -1
> --grpc_out: protoc-gen-grpc: Plugin killed by signal 6.
> [2/13] cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
> TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/usr/bin/protoc
> --grpc_out=generate_mock_code=true:TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --cpp_out=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --plugin=protoc-gen-grpc=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/grpc_cpp_plugin
> -I . -I /usr/local/include
> src/proto/grpc/reflection/v1alpha/reflection.proto
> FAILED: gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc
> gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.h
> gens/src/proto/grpc/reflection/v1alpha/reflection_mock.grpc.pb.h
> gens/src/proto/grpc/reflection/v1alpha/reflection.pb.cc
> gens/src/proto/grpc/reflection/v1alpha/reflection.pb.h
> cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
> TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/usr/bin/protoc
> --grpc_out=generate_mock_code=true:TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --cpp_out=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
> --plugin=protoc-gen-grpc=TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/grpc_cpp_plugin
> -I . -I /usr/local/include
> src/proto/grpc/reflection/v1alpha/reflection.proto
> terminate called after throwing an instance of 'std::system_error'
>   what():  Unknown error -1
> --grpc_out: protoc-gen-grpc: Plugin killed by signal 6.
> ninja: build stopped: subcommand failed.
> WARNING: exit code 1 from a shell command.
> ERROR: Function failed: do_compile (log file is located at
> TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/temp/log.do_compile.26868)
>
> I was assuming it's caused by missing BUILD_CXXFLAGS += "-std=c++11"
> but adding that also doesn't help.
>
> Anyone else seeing this? I'm tempted to just switch back to protobuf
> 3.5.x, because we might switch to newer Ubuntu sooner then switching to
> meta-oe with protobuf 3.6.x.

I can reproduce the same problem on ubuntu 14.04/gcc-4.8.x host. one possible
alternative is to let grpc use its own copy of protobuf which it ships
as a submodule.
I will try it out here and if it works then I think that would be a
possible solution.

>
> Cheers,
>
> >
> > Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > ---
> >  ...c-fix-compile-error-with-protobuf-3.6.0.1.patch | 207 +++++++++++++++++++++
> >  .../recipes-devtools/protobuf/protobuf-c_1.3.0.bb  |   4 +-
> >  2 files changed, 210 insertions(+), 1 deletion(-)
> >  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
> >
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
> > new file mode 100644
> > index 0000000..17f5b58
> > --- /dev/null
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
> > @@ -0,0 +1,207 @@
> > +From fb77cbce29d9ea4d4acbfd6ba72cb1cffabf649a Mon Sep 17 00:00:00 2001
> > +From: Changqing Li <changqing.li@windriver.com>
> > +Date: Fri, 20 Jul 2018 11:47:53 +0800
> > +Subject: [PATCH] protobuf-c: fix compile error with protobuf 3.6.0.1
> > +
> > +Backport from upstream:
> > +https://github.com/protobuf-c/protobuf-c/pull/328
> > +
> > +1. protoc-c depend on protobuf, from protobuf 3.6.0.1,
> > +scoped_array is removed, but protoc-c still use scoped_array,
> > +caused compile error.
> > +
> > +2. fix compile error since missing namespace
> > +
> > +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> > +---
> > + protoc-c/c_field.cc     |  2 +-
> > + protoc-c/c_field.h      |  2 +-
> > + protoc-c/c_file.cc      |  8 ++++----
> > + protoc-c/c_file.h       | 10 +++++-----
> > + protoc-c/c_generator.cc | 12 ++++++------
> > + protoc-c/c_helpers.cc   |  4 +++-
> > + protoc-c/c_message.cc   |  6 +++---
> > + protoc-c/c_message.h    |  7 ++++---
> > + 8 files changed, 27 insertions(+), 24 deletions(-)
> > +
> > +diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
> > +index 9fa56ef..eaa38d2 100644
> > +--- a/protoc-c/c_field.cc
> > ++++ b/protoc-c/c_field.cc
> > +@@ -189,7 +189,7 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(io::Printer* printer,
> > + FieldGeneratorMap::FieldGeneratorMap(const Descriptor* descriptor)
> > +   : descriptor_(descriptor),
> > +     field_generators_(
> > +-      new scoped_ptr<FieldGenerator>[descriptor->field_count()]) {
> > ++      new std::unique_ptr<FieldGenerator>[descriptor->field_count()]) {
> > +   // Construct all the FieldGenerators.
> > +   for (int i = 0; i < descriptor->field_count(); i++) {
> > +     field_generators_[i].reset(MakeGenerator(descriptor->field(i)));
> > +diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
> > +index 91f1a03..94b2fad 100644
> > +--- a/protoc-c/c_field.h
> > ++++ b/protoc-c/c_field.h
> > +@@ -117,7 +117,7 @@ class FieldGeneratorMap {
> > +
> > +  private:
> > +   const Descriptor* descriptor_;
> > +-  scoped_array<scoped_ptr<FieldGenerator> > field_generators_;
> > ++  std::unique_ptr<std::unique_ptr<FieldGenerator>[]> field_generators_;
> > +
> > +   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
> > +
> > +diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
> > +index 9851768..6dae516 100644
> > +--- a/protoc-c/c_file.cc
> > ++++ b/protoc-c/c_file.cc
> > +@@ -83,13 +83,13 @@ FileGenerator::FileGenerator(const FileDescriptor* file,
> > +                              const string& dllexport_decl)
> > +   : file_(file),
> > +     message_generators_(
> > +-      new scoped_ptr<MessageGenerator>[file->message_type_count()]),
> > ++      new std::unique_ptr<MessageGenerator>[file->message_type_count()]),
> > +     enum_generators_(
> > +-      new scoped_ptr<EnumGenerator>[file->enum_type_count()]),
> > ++      new std::unique_ptr<EnumGenerator>[file->enum_type_count()]),
> > +     service_generators_(
> > +-      new scoped_ptr<ServiceGenerator>[file->service_count()]),
> > ++      new std::unique_ptr<ServiceGenerator>[file->service_count()]),
> > +     extension_generators_(
> > +-      new scoped_ptr<ExtensionGenerator>[file->extension_count()]) {
> > ++      new std::unique_ptr<ExtensionGenerator>[file->extension_count()]) {
> > +
> > +   for (int i = 0; i < file->message_type_count(); i++) {
> > +     message_generators_[i].reset(
> > +diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
> > +index ed38ce4..adc2841 100644
> > +--- a/protoc-c/c_file.h
> > ++++ b/protoc-c/c_file.h
> > +@@ -98,13 +98,13 @@ class FileGenerator {
> > +  private:
> > +   const FileDescriptor* file_;
> > +
> > +-  scoped_array<scoped_ptr<MessageGenerator> > message_generators_;
> > +-  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
> > +-  scoped_array<scoped_ptr<ServiceGenerator> > service_generators_;
> > +-  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
> > ++  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> message_generators_;
> > ++  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
> > ++  std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_generators_;
> > ++  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
> > +
> > +   // E.g. if the package is foo.bar, package_parts_ is {"foo", "bar"}.
> > +-  vector<string> package_parts_;
> > ++  std::vector<string> package_parts_;
> > +
> > +   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
> > + };
> > +diff --git a/protoc-c/c_generator.cc b/protoc-c/c_generator.cc
> > +index a0d0cb6..c46cfe4 100644
> > +--- a/protoc-c/c_generator.cc
> > ++++ b/protoc-c/c_generator.cc
> > +@@ -80,13 +80,13 @@ namespace c {
> > + //   "foo=bar,baz,qux=corge"
> > + // parses to the pairs:
> > + //   ("foo", "bar"), ("baz", ""), ("qux", "corge")
> > +-void ParseOptions(const string& text, vector<pair<string, string> >* output) {
> > +-  vector<string> parts;
> > ++void ParseOptions(const string& text, std::vector<std::pair<string, string> >* output) {
> > ++  std::vector<string> parts;
> > +   SplitStringUsing(text, ",", &parts);
> > +
> > +   for (unsigned i = 0; i < parts.size(); i++) {
> > +     string::size_type equals_pos = parts[i].find_first_of('=');
> > +-    pair<string, string> value;
> > ++    std::pair<string, string> value;
> > +     if (equals_pos == string::npos) {
> > +       value.first = parts[i];
> > +       value.second = "";
> > +@@ -105,7 +105,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
> > +                             const string& parameter,
> > +                             OutputDirectory* output_directory,
> > +                             string* error) const {
> > +-  vector<pair<string, string> > options;
> > ++  std::vector<std::pair<string, string> > options;
> > +   ParseOptions(parameter, &options);
> > +
> > +   // -----------------------------------------------------------------
> > +@@ -149,7 +149,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
> > +
> > +   // Generate header.
> > +   {
> > +-    scoped_ptr<io::ZeroCopyOutputStream> output(
> > ++    std::unique_ptr<io::ZeroCopyOutputStream> output(
> > +       output_directory->Open(basename + ".h"));
> > +     io::Printer printer(output.get(), '$');
> > +     file_generator.GenerateHeader(&printer);
> > +@@ -157,7 +157,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
> > +
> > +   // Generate cc file.
> > +   {
> > +-    scoped_ptr<io::ZeroCopyOutputStream> output(
> > ++    std::unique_ptr<io::ZeroCopyOutputStream> output(
> > +       output_directory->Open(basename + ".c"));
> > +     io::Printer printer(output.get(), '$');
> > +     file_generator.GenerateSource(&printer);
> > +diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
> > +index b79b5b0..f4ef73d 100644
> > +--- a/protoc-c/c_helpers.cc
> > ++++ b/protoc-c/c_helpers.cc
> > +@@ -86,6 +86,8 @@ namespace c {
> > + #pragma warning(disable:4996)
> > + #endif
> > +
> > ++using std::vector;
> > ++
> > + string DotsToUnderscores(const string& name) {
> > +   return StringReplace(name, ".", "_", true);
> > + }
> > +@@ -559,7 +561,7 @@ static int CEscapeInternal(const char* src, int src_len, char* dest,
> > + }
> > + string CEscape(const string& src) {
> > +   const int dest_length = src.size() * 4 + 1; // Maximum possible expansion
> > +-  scoped_array<char> dest(new char[dest_length]);
> > ++  std::unique_ptr<char[]> dest(new char[dest_length]);
> > +   const int len = CEscapeInternal(src.data(), src.size(),
> > +                                   dest.get(), dest_length, false);
> > +   GOOGLE_DCHECK_GE(len, 0);
> > +diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
> > +index 6b22c71..85a946e 100755
> > +--- a/protoc-c/c_message.cc
> > ++++ b/protoc-c/c_message.cc
> > +@@ -83,11 +83,11 @@ MessageGenerator::MessageGenerator(const Descriptor* descriptor,
> > +   : descriptor_(descriptor),
> > +     dllexport_decl_(dllexport_decl),
> > +     field_generators_(descriptor),
> > +-    nested_generators_(new scoped_ptr<MessageGenerator>[
> > ++    nested_generators_(new std::unique_ptr<MessageGenerator>[
> > +       descriptor->nested_type_count()]),
> > +-    enum_generators_(new scoped_ptr<EnumGenerator>[
> > ++    enum_generators_(new std::unique_ptr<EnumGenerator>[
> > +       descriptor->enum_type_count()]),
> > +-    extension_generators_(new scoped_ptr<ExtensionGenerator>[
> > ++    extension_generators_(new std::unique_ptr<ExtensionGenerator>[
> > +       descriptor->extension_count()]) {
> > +
> > +   for (int i = 0; i < descriptor->nested_type_count(); i++) {
> > +diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
> > +index 8b115d1..114c2d0 100644
> > +--- a/protoc-c/c_message.h
> > ++++ b/protoc-c/c_message.h
> > +@@ -126,9 +126,10 @@ class MessageGenerator {
> > +   const Descriptor* descriptor_;
> > +   string dllexport_decl_;
> > +   FieldGeneratorMap field_generators_;
> > +-  scoped_array<scoped_ptr<MessageGenerator> > nested_generators_;
> > +-  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
> > +-  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
> > ++
> > ++  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> nested_generators_;
> > ++  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
> > ++  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
> > +
> > +   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
> > + };
> > +--
> > +2.7.4
> > +
> > diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
> > index 9b69690..7017b69 100644
> > --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
> > +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
> > @@ -15,7 +15,9 @@ DEPENDS = "protobuf-native protobuf"
> >  PV .= "+git${SRCPV}"
> >  SRCREV = "dac1a65feac4ad72f612aab99f487056fbcf5c1a"
> >
> > -SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
> > +SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
> > +           file://0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch \
> > +"
> >
> >  S = "${WORKDIR}/git"
> >
> > --
> > 2.7.4
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

