Return-Path: <Changqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id B861B74573
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  7 Aug 2018 09:05:27 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id w7795S34017040
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 7 Aug 2018 02:05:28 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Tue, 7 Aug 2018 02:05:27 -0700
To: Martin Jansa <martin.jansa@gmail.com>
References: <1532074765-8918-1-git-send-email-changqing.li@windriver.com>
	<20180806141924.GC1361@jama>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <65a53da2-ec4e-4189-a6ff-e6ba74bc0178@windriver.com>
Date: Tue, 7 Aug 2018 17:05:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20180806141924.GC1361@jama>
X-Originating-IP: [128.224.162.228]
Cc: openembedded-devel@lists.openembedded.org
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
X-List-Received-Date: Tue, 07 Aug 2018 09:05:27 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 08/06/2018 10:19 PM, Martin Jansa wrote:
> On Fri, Jul 20, 2018 at 04:19:25PM +0800, changqing.li@windriver.com wrote:
>> From: Changqing Li <changqing.li@windriver.com>
>>
>> 1. protoc-c depend on protobuf, from protobuf 3.6.0.1,
>> scoped_array is removed, but protoc-c still use scoped_array,
>> caused compile error.
>>
>> 2. fix compile error since missing namespace
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
>    what():  Unknown error -1
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
>    what():  Unknown error -1
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
>
> Cheers,

This error is reported during grpc_cpp_plugin try to load libprotobuf.so,
not related to the "-std=c++11".  but now, I don't have proper solution
for this.  so I am ok about switch back to protobuf 3.5.x if you need it.

//sandy

>
>> Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> ---
>>   ...c-fix-compile-error-with-protobuf-3.6.0.1.patch | 207 +++++++++++++++++++++
>>   .../recipes-devtools/protobuf/protobuf-c_1.3.0.bb  |   4 +-
>>   2 files changed, 210 insertions(+), 1 deletion(-)
>>   create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
>>
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
>> new file mode 100644
>> index 0000000..17f5b58
>> --- /dev/null
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
>> @@ -0,0 +1,207 @@
>> +From fb77cbce29d9ea4d4acbfd6ba72cb1cffabf649a Mon Sep 17 00:00:00 2001
>> +From: Changqing Li <changqing.li@windriver.com>
>> +Date: Fri, 20 Jul 2018 11:47:53 +0800
>> +Subject: [PATCH] protobuf-c: fix compile error with protobuf 3.6.0.1
>> +
>> +Backport from upstream:
>> +https://github.com/protobuf-c/protobuf-c/pull/328
>> +
>> +1. protoc-c depend on protobuf, from protobuf 3.6.0.1,
>> +scoped_array is removed, but protoc-c still use scoped_array,
>> +caused compile error.
>> +
>> +2. fix compile error since missing namespace
>> +
>> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
>> +---
>> + protoc-c/c_field.cc     |  2 +-
>> + protoc-c/c_field.h      |  2 +-
>> + protoc-c/c_file.cc      |  8 ++++----
>> + protoc-c/c_file.h       | 10 +++++-----
>> + protoc-c/c_generator.cc | 12 ++++++------
>> + protoc-c/c_helpers.cc   |  4 +++-
>> + protoc-c/c_message.cc   |  6 +++---
>> + protoc-c/c_message.h    |  7 ++++---
>> + 8 files changed, 27 insertions(+), 24 deletions(-)
>> +
>> +diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
>> +index 9fa56ef..eaa38d2 100644
>> +--- a/protoc-c/c_field.cc
>> ++++ b/protoc-c/c_field.cc
>> +@@ -189,7 +189,7 @@ void FieldGenerator::GenerateDescriptorInitializerGeneric(io::Printer* printer,
>> + FieldGeneratorMap::FieldGeneratorMap(const Descriptor* descriptor)
>> +   : descriptor_(descriptor),
>> +     field_generators_(
>> +-      new scoped_ptr<FieldGenerator>[descriptor->field_count()]) {
>> ++      new std::unique_ptr<FieldGenerator>[descriptor->field_count()]) {
>> +   // Construct all the FieldGenerators.
>> +   for (int i = 0; i < descriptor->field_count(); i++) {
>> +     field_generators_[i].reset(MakeGenerator(descriptor->field(i)));
>> +diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
>> +index 91f1a03..94b2fad 100644
>> +--- a/protoc-c/c_field.h
>> ++++ b/protoc-c/c_field.h
>> +@@ -117,7 +117,7 @@ class FieldGeneratorMap {
>> +
>> +  private:
>> +   const Descriptor* descriptor_;
>> +-  scoped_array<scoped_ptr<FieldGenerator> > field_generators_;
>> ++  std::unique_ptr<std::unique_ptr<FieldGenerator>[]> field_generators_;
>> +
>> +   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
>> +
>> +diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
>> +index 9851768..6dae516 100644
>> +--- a/protoc-c/c_file.cc
>> ++++ b/protoc-c/c_file.cc
>> +@@ -83,13 +83,13 @@ FileGenerator::FileGenerator(const FileDescriptor* file,
>> +                              const string& dllexport_decl)
>> +   : file_(file),
>> +     message_generators_(
>> +-      new scoped_ptr<MessageGenerator>[file->message_type_count()]),
>> ++      new std::unique_ptr<MessageGenerator>[file->message_type_count()]),
>> +     enum_generators_(
>> +-      new scoped_ptr<EnumGenerator>[file->enum_type_count()]),
>> ++      new std::unique_ptr<EnumGenerator>[file->enum_type_count()]),
>> +     service_generators_(
>> +-      new scoped_ptr<ServiceGenerator>[file->service_count()]),
>> ++      new std::unique_ptr<ServiceGenerator>[file->service_count()]),
>> +     extension_generators_(
>> +-      new scoped_ptr<ExtensionGenerator>[file->extension_count()]) {
>> ++      new std::unique_ptr<ExtensionGenerator>[file->extension_count()]) {
>> +
>> +   for (int i = 0; i < file->message_type_count(); i++) {
>> +     message_generators_[i].reset(
>> +diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
>> +index ed38ce4..adc2841 100644
>> +--- a/protoc-c/c_file.h
>> ++++ b/protoc-c/c_file.h
>> +@@ -98,13 +98,13 @@ class FileGenerator {
>> +  private:
>> +   const FileDescriptor* file_;
>> +
>> +-  scoped_array<scoped_ptr<MessageGenerator> > message_generators_;
>> +-  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
>> +-  scoped_array<scoped_ptr<ServiceGenerator> > service_generators_;
>> +-  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
>> ++  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> message_generators_;
>> ++  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
>> ++  std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_generators_;
>> ++  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
>> +
>> +   // E.g. if the package is foo.bar, package_parts_ is {"foo", "bar"}.
>> +-  vector<string> package_parts_;
>> ++  std::vector<string> package_parts_;
>> +
>> +   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
>> + };
>> +diff --git a/protoc-c/c_generator.cc b/protoc-c/c_generator.cc
>> +index a0d0cb6..c46cfe4 100644
>> +--- a/protoc-c/c_generator.cc
>> ++++ b/protoc-c/c_generator.cc
>> +@@ -80,13 +80,13 @@ namespace c {
>> + //   "foo=bar,baz,qux=corge"
>> + // parses to the pairs:
>> + //   ("foo", "bar"), ("baz", ""), ("qux", "corge")
>> +-void ParseOptions(const string& text, vector<pair<string, string> >* output) {
>> +-  vector<string> parts;
>> ++void ParseOptions(const string& text, std::vector<std::pair<string, string> >* output) {
>> ++  std::vector<string> parts;
>> +   SplitStringUsing(text, ",", &parts);
>> +
>> +   for (unsigned i = 0; i < parts.size(); i++) {
>> +     string::size_type equals_pos = parts[i].find_first_of('=');
>> +-    pair<string, string> value;
>> ++    std::pair<string, string> value;
>> +     if (equals_pos == string::npos) {
>> +       value.first = parts[i];
>> +       value.second = "";
>> +@@ -105,7 +105,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
>> +                             const string& parameter,
>> +                             OutputDirectory* output_directory,
>> +                             string* error) const {
>> +-  vector<pair<string, string> > options;
>> ++  std::vector<std::pair<string, string> > options;
>> +   ParseOptions(parameter, &options);
>> +
>> +   // -----------------------------------------------------------------
>> +@@ -149,7 +149,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
>> +
>> +   // Generate header.
>> +   {
>> +-    scoped_ptr<io::ZeroCopyOutputStream> output(
>> ++    std::unique_ptr<io::ZeroCopyOutputStream> output(
>> +       output_directory->Open(basename + ".h"));
>> +     io::Printer printer(output.get(), '$');
>> +     file_generator.GenerateHeader(&printer);
>> +@@ -157,7 +157,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
>> +
>> +   // Generate cc file.
>> +   {
>> +-    scoped_ptr<io::ZeroCopyOutputStream> output(
>> ++    std::unique_ptr<io::ZeroCopyOutputStream> output(
>> +       output_directory->Open(basename + ".c"));
>> +     io::Printer printer(output.get(), '$');
>> +     file_generator.GenerateSource(&printer);
>> +diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
>> +index b79b5b0..f4ef73d 100644
>> +--- a/protoc-c/c_helpers.cc
>> ++++ b/protoc-c/c_helpers.cc
>> +@@ -86,6 +86,8 @@ namespace c {
>> + #pragma warning(disable:4996)
>> + #endif
>> +
>> ++using std::vector;
>> ++
>> + string DotsToUnderscores(const string& name) {
>> +   return StringReplace(name, ".", "_", true);
>> + }
>> +@@ -559,7 +561,7 @@ static int CEscapeInternal(const char* src, int src_len, char* dest,
>> + }
>> + string CEscape(const string& src) {
>> +   const int dest_length = src.size() * 4 + 1; // Maximum possible expansion
>> +-  scoped_array<char> dest(new char[dest_length]);
>> ++  std::unique_ptr<char[]> dest(new char[dest_length]);
>> +   const int len = CEscapeInternal(src.data(), src.size(),
>> +                                   dest.get(), dest_length, false);
>> +   GOOGLE_DCHECK_GE(len, 0);
>> +diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
>> +index 6b22c71..85a946e 100755
>> +--- a/protoc-c/c_message.cc
>> ++++ b/protoc-c/c_message.cc
>> +@@ -83,11 +83,11 @@ MessageGenerator::MessageGenerator(const Descriptor* descriptor,
>> +   : descriptor_(descriptor),
>> +     dllexport_decl_(dllexport_decl),
>> +     field_generators_(descriptor),
>> +-    nested_generators_(new scoped_ptr<MessageGenerator>[
>> ++    nested_generators_(new std::unique_ptr<MessageGenerator>[
>> +       descriptor->nested_type_count()]),
>> +-    enum_generators_(new scoped_ptr<EnumGenerator>[
>> ++    enum_generators_(new std::unique_ptr<EnumGenerator>[
>> +       descriptor->enum_type_count()]),
>> +-    extension_generators_(new scoped_ptr<ExtensionGenerator>[
>> ++    extension_generators_(new std::unique_ptr<ExtensionGenerator>[
>> +       descriptor->extension_count()]) {
>> +
>> +   for (int i = 0; i < descriptor->nested_type_count(); i++) {
>> +diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
>> +index 8b115d1..114c2d0 100644
>> +--- a/protoc-c/c_message.h
>> ++++ b/protoc-c/c_message.h
>> +@@ -126,9 +126,10 @@ class MessageGenerator {
>> +   const Descriptor* descriptor_;
>> +   string dllexport_decl_;
>> +   FieldGeneratorMap field_generators_;
>> +-  scoped_array<scoped_ptr<MessageGenerator> > nested_generators_;
>> +-  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
>> +-  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
>> ++
>> ++  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> nested_generators_;
>> ++  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
>> ++  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_generators_;
>> +
>> +   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
>> + };
>> +--
>> +2.7.4
>> +
>> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
>> index 9b69690..7017b69 100644
>> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
>> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
>> @@ -15,7 +15,9 @@ DEPENDS = "protobuf-native protobuf"
>>   PV .= "+git${SRCPV}"
>>   SRCREV = "dac1a65feac4ad72f612aab99f487056fbcf5c1a"
>>   
>> -SRC_URI = "git://github.com/protobuf-c/protobuf-c.git"
>> +SRC_URI = "git://github.com/protobuf-c/protobuf-c.git \
>> +           file://0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch \
>> +"
>>   
>>   S = "${WORKDIR}/git"
>>   
>> -- 
>> 2.7.4
>>
>> -- 
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

-- 
BRs

Sandy(Li Changqing)
+861084778653


