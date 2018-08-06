Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com
	[209.85.221.68])
	by mail.openembedded.org (Postfix) with ESMTP id 1D62074553
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  6 Aug 2018 14:19:15 +0000 (UTC)
Received: by mail-wr1-f68.google.com with SMTP id j5-v6so12539423wrr.8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 06 Aug 2018 07:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:date:to:cc:subject:message-id:references:mime-version
	:content-disposition:in-reply-to:user-agent;
	bh=dtT+8AtIg46dBIdlHyV10OisHNA5l6p/PCI41Z6oqsE=;
	b=tjYASJOJQQPZHpgAWIRuSDQGUs/5ibZhdlk6/lVuVvl86gHDMENGXJPc2BETgwrvDJ
	4gmaVoAwGHSAJkeOrdXZn94hAgClZ77zzKtb9AW8EGXIg1LOG0lmQjBkMvfy81oB7DTy
	Pbg+/jXaKjonOE/6ZizEiR2oKQnr7rDusNexQyr9YKHrPTbV8vNdg2XieTRYFcOfqv+L
	0sOtUIMMxO//Re0SECEmEz9T1B6kTIfg0+GrpH9J9eB3IJO21xiPUER72H5bHx8nUNs7
	ozAJK9qszO23Hu9tO9RzAWgYLZhGVZA3eY0wOym6tlMN7ojTDD2ACuZk+3P9zyyQJb36
	az1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:date:to:cc:subject:message-id:references
	:mime-version:content-disposition:in-reply-to:user-agent;
	bh=dtT+8AtIg46dBIdlHyV10OisHNA5l6p/PCI41Z6oqsE=;
	b=SoRqpZ002UJ8pTGVWPYb6CVCm+5Ycu09LO1MFSq3HHJu4HvlrPROkeuD0gOv8ayH3f
	E8Arm2kEM4InqrF8hxFnG3fPb6bnx5sOA7BPCghKMJrpSsDD5K5gEa7x+zwNHomaokzA
	RIYjJbeQEBQ1VgtaKi7Ui+Cmz3Mwe69mVl+7cHPNZmRmB2duPnFmzJvTG53NX9HywQi0
	c3R+K+7x6NsRvwATUpvv4m9P7qcKGMCpIGQyrBe3b83Lzrg+7yxWgMaa2L7cQe543roA
	C9E47l/MBoq69/puNF0FHE4jVDCp3KJ4AJddm0VIZNfFV59v7oIPx8hg3KDmZ02MbT8X
	kV8A==
X-Gm-Message-State: AOUpUlFLKj3LPZMQuSPnsZQFIIW2avIUoaaqVCpGH8VJuzr78YCxbP/r
	13vbcP6zJavcQsefcwjt8wo=
X-Google-Smtp-Source: AAOMgpdVo7q5Dr14MkR5IA4PmTa2GczGJVXXsa1zdCg+UJehZf05T3JvfeUuLvwouxlCCd7KhwJanQ==
X-Received: by 2002:adf:8ec2:: with SMTP id
	q60-v6mr9431068wrb.275.1533565156633; 
	Mon, 06 Aug 2018 07:19:16 -0700 (PDT)
Received: from localhost ([217.30.68.212]) by smtp.gmail.com with ESMTPSA id
	u65-v6sm608117wmd.31.2018.08.06.07.19.15
	(version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
	Mon, 06 Aug 2018 07:19:15 -0700 (PDT)
From: Martin Jansa <martin.jansa@gmail.com>
X-Google-Original-From: Martin Jansa <Martin.Jansa@gmail.com>
Date: Mon, 6 Aug 2018 16:19:24 +0200
To: changqing.li@windriver.com
Message-ID: <20180806141924.GC1361@jama>
References: <1532074765-8918-1-git-send-email-changqing.li@windriver.com>
MIME-Version: 1.0
In-Reply-To: <1532074765-8918-1-git-send-email-changqing.li@windriver.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
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
X-List-Received-Date: Mon, 06 Aug 2018 14:19:16 -0000
X-Groupsio-MsgNum: 73801
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="R+My9LyyhiUvIEro"
Content-Disposition: inline

--R+My9LyyhiUvIEro
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 20, 2018 at 04:19:25PM +0800, changqing.li@windriver.com wrote:
> From: Changqing Li <changqing.li@windriver.com>
>=20
> 1. protoc-c depend on protobuf, from protobuf 3.6.0.1,
> scoped_array is removed, but protoc-c still use scoped_array,
> caused compile error.
>=20
> 2. fix compile error since missing namespace

There is also an error in grpc caused by new protobuf 3.6.0.1 (the same
with 3.6.1).

It triggers the build failure only on older hosts, I'm seeing the issue
on Ubuntu 14.04 with gcc 4.8.4 and wasn't able to reproduce it on Ubuntu
18.04 with gcc 7.3.0.

grpc-native fails to build with;

DEBUG: Executing shell function do_compile
NOTE: VERBOSE=3D1 cmake --build
TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build --target all
-- -j 24
[1/13] cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/u=
sr/bin/protoc
--grpc_out=3Dgenerate_mock_code=3Dtrue:TOPDIR/BUILD/work/x86_64-linux/grpc-=
native/1.8.5-r0/build/gens
--cpp_out=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
--plugin=3Dprotoc-gen-grpc=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8=
=2E5-r0/build/grpc_cpp_plugin
-I . -I /usr/local/include src/proto/grpc/status/status.proto
FAILED: gens/src/proto/grpc/status/status.grpc.pb.cc
gens/src/proto/grpc/status/status.grpc.pb.h
gens/src/proto/grpc/status/status_mock.grpc.pb.h
gens/src/proto/grpc/status/status.pb.cc
gens/src/proto/grpc/status/status.pb.h=20
cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/u=
sr/bin/protoc
--grpc_out=3Dgenerate_mock_code=3Dtrue:TOPDIR/BUILD/work/x86_64-linux/grpc-=
native/1.8.5-r0/build/gens
--cpp_out=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
--plugin=3Dprotoc-gen-grpc=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8=
=2E5-r0/build/grpc_cpp_plugin
-I . -I /usr/local/include src/proto/grpc/status/status.proto
terminate called after throwing an instance of 'std::system_error'
  what():  Unknown error -1
--grpc_out: protoc-gen-grpc: Plugin killed by signal 6.
[2/13] cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/u=
sr/bin/protoc
--grpc_out=3Dgenerate_mock_code=3Dtrue:TOPDIR/BUILD/work/x86_64-linux/grpc-=
native/1.8.5-r0/build/gens
--cpp_out=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
--plugin=3Dprotoc-gen-grpc=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8=
=2E5-r0/build/grpc_cpp_plugin
-I . -I /usr/local/include
src/proto/grpc/reflection/v1alpha/reflection.proto
FAILED: gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.cc
gens/src/proto/grpc/reflection/v1alpha/reflection.grpc.pb.h
gens/src/proto/grpc/reflection/v1alpha/reflection_mock.grpc.pb.h
gens/src/proto/grpc/reflection/v1alpha/reflection.pb.cc
gens/src/proto/grpc/reflection/v1alpha/reflection.pb.h=20
cd TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/git &&
TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/recipe-sysroot-native/u=
sr/bin/protoc
--grpc_out=3Dgenerate_mock_code=3Dtrue:TOPDIR/BUILD/work/x86_64-linux/grpc-=
native/1.8.5-r0/build/gens
--cpp_out=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/build/gens
--plugin=3Dprotoc-gen-grpc=3DTOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8=
=2E5-r0/build/grpc_cpp_plugin
-I . -I /usr/local/include
src/proto/grpc/reflection/v1alpha/reflection.proto
terminate called after throwing an instance of 'std::system_error'
  what():  Unknown error -1
--grpc_out: protoc-gen-grpc: Plugin killed by signal 6.
ninja: build stopped: subcommand failed.
WARNING: exit code 1 from a shell command.
ERROR: Function failed: do_compile (log file is located at
TOPDIR/BUILD/work/x86_64-linux/grpc-native/1.8.5-r0/temp/log.do_compile.268=
68)

I was assuming it's caused by missing BUILD_CXXFLAGS +=3D "-std=3Dc++11"
but adding that also doesn't help.

Anyone else seeing this? I'm tempted to just switch back to protobuf
3.5.x, because we might switch to newer Ubuntu sooner then switching to
meta-oe with protobuf 3.6.x.

Cheers,

>=20
> Signed-off-by: Changqing Li <changqing.li@windriver.com>
> ---
>  ...c-fix-compile-error-with-protobuf-3.6.0.1.patch | 207 +++++++++++++++=
++++++
>  .../recipes-devtools/protobuf/protobuf-c_1.3.0.bb  |   4 +-
>  2 files changed, 210 insertions(+), 1 deletion(-)
>  create mode 100644 meta-oe/recipes-devtools/protobuf/protobuf-c/0001-pro=
tobuf-c-fix-compile-error-with-protobuf-3.6.0.1.patch
>=20
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c=
-fix-compile-error-with-protobuf-3.6.0.1.patch b/meta-oe/recipes-devtools/p=
rotobuf/protobuf-c/0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.1.=
patch
> new file mode 100644
> index 0000000..17f5b58
> --- /dev/null
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c/0001-protobuf-c-fix-co=
mpile-error-with-protobuf-3.6.0.1.patch
> @@ -0,0 +1,207 @@
> +From fb77cbce29d9ea4d4acbfd6ba72cb1cffabf649a Mon Sep 17 00:00:00 2001
> +From: Changqing Li <changqing.li@windriver.com>
> +Date: Fri, 20 Jul 2018 11:47:53 +0800
> +Subject: [PATCH] protobuf-c: fix compile error with protobuf 3.6.0.1
> +
> +Backport from upstream:
> +https://github.com/protobuf-c/protobuf-c/pull/328
> +
> +1. protoc-c depend on protobuf, from protobuf 3.6.0.1,
> +scoped_array is removed, but protoc-c still use scoped_array,
> +caused compile error.
> +
> +2. fix compile error since missing namespace
> +
> +Signed-off-by: Changqing Li <changqing.li@windriver.com>
> +---
> + protoc-c/c_field.cc     |  2 +-
> + protoc-c/c_field.h      |  2 +-
> + protoc-c/c_file.cc      |  8 ++++----
> + protoc-c/c_file.h       | 10 +++++-----
> + protoc-c/c_generator.cc | 12 ++++++------
> + protoc-c/c_helpers.cc   |  4 +++-
> + protoc-c/c_message.cc   |  6 +++---
> + protoc-c/c_message.h    |  7 ++++---
> + 8 files changed, 27 insertions(+), 24 deletions(-)
> +
> +diff --git a/protoc-c/c_field.cc b/protoc-c/c_field.cc
> +index 9fa56ef..eaa38d2 100644
> +--- a/protoc-c/c_field.cc
> ++++ b/protoc-c/c_field.cc
> +@@ -189,7 +189,7 @@ void FieldGenerator::GenerateDescriptorInitializerGe=
neric(io::Printer* printer,
> + FieldGeneratorMap::FieldGeneratorMap(const Descriptor* descriptor)
> +   : descriptor_(descriptor),
> +     field_generators_(
> +-      new scoped_ptr<FieldGenerator>[descriptor->field_count()]) {
> ++      new std::unique_ptr<FieldGenerator>[descriptor->field_count()]) {
> +   // Construct all the FieldGenerators.
> +   for (int i =3D 0; i < descriptor->field_count(); i++) {
> +     field_generators_[i].reset(MakeGenerator(descriptor->field(i)));
> +diff --git a/protoc-c/c_field.h b/protoc-c/c_field.h
> +index 91f1a03..94b2fad 100644
> +--- a/protoc-c/c_field.h
> ++++ b/protoc-c/c_field.h
> +@@ -117,7 +117,7 @@ class FieldGeneratorMap {
> +=20
> +  private:
> +   const Descriptor* descriptor_;
> +-  scoped_array<scoped_ptr<FieldGenerator> > field_generators_;
> ++  std::unique_ptr<std::unique_ptr<FieldGenerator>[]> field_generators_;
> +=20
> +   static FieldGenerator* MakeGenerator(const FieldDescriptor* field);
> +=20
> +diff --git a/protoc-c/c_file.cc b/protoc-c/c_file.cc
> +index 9851768..6dae516 100644
> +--- a/protoc-c/c_file.cc
> ++++ b/protoc-c/c_file.cc
> +@@ -83,13 +83,13 @@ FileGenerator::FileGenerator(const FileDescriptor* f=
ile,
> +                              const string& dllexport_decl)
> +   : file_(file),
> +     message_generators_(
> +-      new scoped_ptr<MessageGenerator>[file->message_type_count()]),
> ++      new std::unique_ptr<MessageGenerator>[file->message_type_count()]=
),
> +     enum_generators_(
> +-      new scoped_ptr<EnumGenerator>[file->enum_type_count()]),
> ++      new std::unique_ptr<EnumGenerator>[file->enum_type_count()]),
> +     service_generators_(
> +-      new scoped_ptr<ServiceGenerator>[file->service_count()]),
> ++      new std::unique_ptr<ServiceGenerator>[file->service_count()]),
> +     extension_generators_(
> +-      new scoped_ptr<ExtensionGenerator>[file->extension_count()]) {
> ++      new std::unique_ptr<ExtensionGenerator>[file->extension_count()])=
 {
> +=20
> +   for (int i =3D 0; i < file->message_type_count(); i++) {
> +     message_generators_[i].reset(
> +diff --git a/protoc-c/c_file.h b/protoc-c/c_file.h
> +index ed38ce4..adc2841 100644
> +--- a/protoc-c/c_file.h
> ++++ b/protoc-c/c_file.h
> +@@ -98,13 +98,13 @@ class FileGenerator {
> +  private:
> +   const FileDescriptor* file_;
> +=20
> +-  scoped_array<scoped_ptr<MessageGenerator> > message_generators_;
> +-  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
> +-  scoped_array<scoped_ptr<ServiceGenerator> > service_generators_;
> +-  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
> ++  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> message_generato=
rs_;
> ++  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
> ++  std::unique_ptr<std::unique_ptr<ServiceGenerator>[]> service_generato=
rs_;
> ++  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_gene=
rators_;
> +=20
> +   // E.g. if the package is foo.bar, package_parts_ is {"foo", "bar"}.
> +-  vector<string> package_parts_;
> ++  std::vector<string> package_parts_;
> +=20
> +   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(FileGenerator);
> + };
> +diff --git a/protoc-c/c_generator.cc b/protoc-c/c_generator.cc
> +index a0d0cb6..c46cfe4 100644
> +--- a/protoc-c/c_generator.cc
> ++++ b/protoc-c/c_generator.cc
> +@@ -80,13 +80,13 @@ namespace c {
> + //   "foo=3Dbar,baz,qux=3Dcorge"
> + // parses to the pairs:
> + //   ("foo", "bar"), ("baz", ""), ("qux", "corge")
> +-void ParseOptions(const string& text, vector<pair<string, string> >* ou=
tput) {
> +-  vector<string> parts;
> ++void ParseOptions(const string& text, std::vector<std::pair<string, str=
ing> >* output) {
> ++  std::vector<string> parts;
> +   SplitStringUsing(text, ",", &parts);
> +=20
> +   for (unsigned i =3D 0; i < parts.size(); i++) {
> +     string::size_type equals_pos =3D parts[i].find_first_of('=3D');
> +-    pair<string, string> value;
> ++    std::pair<string, string> value;
> +     if (equals_pos =3D=3D string::npos) {
> +       value.first =3D parts[i];
> +       value.second =3D "";
> +@@ -105,7 +105,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
> +                             const string& parameter,
> +                             OutputDirectory* output_directory,
> +                             string* error) const {
> +-  vector<pair<string, string> > options;
> ++  std::vector<std::pair<string, string> > options;
> +   ParseOptions(parameter, &options);
> +=20
> +   // -----------------------------------------------------------------
> +@@ -149,7 +149,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
> +=20
> +   // Generate header.
> +   {
> +-    scoped_ptr<io::ZeroCopyOutputStream> output(
> ++    std::unique_ptr<io::ZeroCopyOutputStream> output(
> +       output_directory->Open(basename + ".h"));
> +     io::Printer printer(output.get(), '$');
> +     file_generator.GenerateHeader(&printer);
> +@@ -157,7 +157,7 @@ bool CGenerator::Generate(const FileDescriptor* file,
> +=20
> +   // Generate cc file.
> +   {
> +-    scoped_ptr<io::ZeroCopyOutputStream> output(
> ++    std::unique_ptr<io::ZeroCopyOutputStream> output(
> +       output_directory->Open(basename + ".c"));
> +     io::Printer printer(output.get(), '$');
> +     file_generator.GenerateSource(&printer);
> +diff --git a/protoc-c/c_helpers.cc b/protoc-c/c_helpers.cc
> +index b79b5b0..f4ef73d 100644
> +--- a/protoc-c/c_helpers.cc
> ++++ b/protoc-c/c_helpers.cc
> +@@ -86,6 +86,8 @@ namespace c {
> + #pragma warning(disable:4996)
> + #endif
> +=20
> ++using std::vector;
> ++
> + string DotsToUnderscores(const string& name) {
> +   return StringReplace(name, ".", "_", true);
> + }
> +@@ -559,7 +561,7 @@ static int CEscapeInternal(const char* src, int src_=
len, char* dest,
> + }
> + string CEscape(const string& src) {
> +   const int dest_length =3D src.size() * 4 + 1; // Maximum possible exp=
ansion
> +-  scoped_array<char> dest(new char[dest_length]);
> ++  std::unique_ptr<char[]> dest(new char[dest_length]);
> +   const int len =3D CEscapeInternal(src.data(), src.size(),
> +                                   dest.get(), dest_length, false);
> +   GOOGLE_DCHECK_GE(len, 0);
> +diff --git a/protoc-c/c_message.cc b/protoc-c/c_message.cc
> +index 6b22c71..85a946e 100755
> +--- a/protoc-c/c_message.cc
> ++++ b/protoc-c/c_message.cc
> +@@ -83,11 +83,11 @@ MessageGenerator::MessageGenerator(const Descriptor*=
 descriptor,
> +   : descriptor_(descriptor),
> +     dllexport_decl_(dllexport_decl),
> +     field_generators_(descriptor),
> +-    nested_generators_(new scoped_ptr<MessageGenerator>[
> ++    nested_generators_(new std::unique_ptr<MessageGenerator>[
> +       descriptor->nested_type_count()]),
> +-    enum_generators_(new scoped_ptr<EnumGenerator>[
> ++    enum_generators_(new std::unique_ptr<EnumGenerator>[
> +       descriptor->enum_type_count()]),
> +-    extension_generators_(new scoped_ptr<ExtensionGenerator>[
> ++    extension_generators_(new std::unique_ptr<ExtensionGenerator>[
> +       descriptor->extension_count()]) {
> +=20
> +   for (int i =3D 0; i < descriptor->nested_type_count(); i++) {
> +diff --git a/protoc-c/c_message.h b/protoc-c/c_message.h
> +index 8b115d1..114c2d0 100644
> +--- a/protoc-c/c_message.h
> ++++ b/protoc-c/c_message.h
> +@@ -126,9 +126,10 @@ class MessageGenerator {
> +   const Descriptor* descriptor_;
> +   string dllexport_decl_;
> +   FieldGeneratorMap field_generators_;
> +-  scoped_array<scoped_ptr<MessageGenerator> > nested_generators_;
> +-  scoped_array<scoped_ptr<EnumGenerator> > enum_generators_;
> +-  scoped_array<scoped_ptr<ExtensionGenerator> > extension_generators_;
> ++
> ++  std::unique_ptr<std::unique_ptr<MessageGenerator>[]> nested_generator=
s_;
> ++  std::unique_ptr<std::unique_ptr<EnumGenerator>[]> enum_generators_;
> ++  std::unique_ptr<std::unique_ptr<ExtensionGenerator>[]> extension_gene=
rators_;
> +=20
> +   GOOGLE_DISALLOW_EVIL_CONSTRUCTORS(MessageGenerator);
> + };
> +--=20
> +2.7.4
> +
> diff --git a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb b/meta=
-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
> index 9b69690..7017b69 100644
> --- a/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
> +++ b/meta-oe/recipes-devtools/protobuf/protobuf-c_1.3.0.bb
> @@ -15,7 +15,9 @@ DEPENDS =3D "protobuf-native protobuf"
>  PV .=3D "+git${SRCPV}"
>  SRCREV =3D "dac1a65feac4ad72f612aab99f487056fbcf5c1a"
> =20
> -SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git"
> +SRC_URI =3D "git://github.com/protobuf-c/protobuf-c.git \
> +           file://0001-protobuf-c-fix-compile-error-with-protobuf-3.6.0.=
1.patch \
> +"
> =20
>  S =3D "${WORKDIR}/git"
> =20
> --=20
> 2.7.4
>=20
> --=20
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

--=20
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com

--R+My9LyyhiUvIEro
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----

iF0EARECAB0WIQRU+ejDffEzV2Je2oc3VSO3ZXaAHAUCW2hY7AAKCRA3VSO3ZXaA
HCJQAJ9HsdYGDUYxA0b8HwTpLwrinuE9NACeKYv0AXkDdM3IOOzxT1Gjhnbx3AI=
=ebr+
-----END PGP SIGNATURE-----

--R+My9LyyhiUvIEro--
