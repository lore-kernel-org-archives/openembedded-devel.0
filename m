Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-wr0-f194.google.com (mail-wr0-f194.google.com
	[209.85.128.194])
	by mail.openembedded.org (Postfix) with ESMTP id E7ABF78093
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 11:25:50 +0000 (UTC)
Received: by mail-wr0-f194.google.com with SMTP id k20so2298609wre.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 26 Sep 2017 04:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=i+cxKC96DXprCTfPSmgDbi4YzqiJtAQ5q3hLWO5qhrM=;
	b=bar2WBUCX+hLzSKkfMVgnqA2ckWDgPfAY9MGjzNAfsDa/sCiJnNWcglo2p9OcojIzQ
	mN+BmDpoK38UY7PCjWEllTTYvhp7h4kJPL+j06EwM8IgQuPQxWbKfn90NXyb/G2sB7xS
	3/2BpGpk0JeKa61tRlDILGqcekQwzM770pOydke8ZnP7w8K1eaPzEgv4jYfNqL6s1wG4
	oWFut/aNKcBX6YdAzeZdwNr0UGJdos9D7LjvWDoBvhcVQGUPzNT6282LladHdy7OeWzM
	7LcNejd8KUeHFP34HcH1MKsEFWaPMXK3DmCo6e3Atwu1rPV/KlN9objzyjsHIXBs4Q0A
	/M2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=i+cxKC96DXprCTfPSmgDbi4YzqiJtAQ5q3hLWO5qhrM=;
	b=hyICILECtOHjtqpanQaOnmE3gTtRNp6c7Cd7ttLZsDe+GJXSP4jkr7aAzLfRw9YcjP
	6wxKaRBd0t+BWxaC34g1vzAOQWelrA3SA7kusMDYt6QeIAaZ6AVHRqSnm2QMG+TpG5rU
	f+BjcPuXdvduedNvUuOYyqVxAZCJPtKwftnkcCkIvrTlKc48UWseZ2ukAkblsYpJME9i
	kN3RKieZE3ZXgz7KmvrIYIGaxh9vRuDABElRZRMwTAUy8+HuLniW2vQEmBN+74zMmsxB
	ZRspo2BGFMo6gF1+nLSlUmL99iMW1YuhI6UNslpbWdb2qX1asjYGPSpi/ytm5HEYcprt
	SwOg==
X-Gm-Message-State: AHPjjUilQIIkvG3FLwVRPOLZBzVWl1uxJCAKNdTz2mhVZ4mPw7ERwWSx
	fZ4lZXr4kWRUk7pmtZTTVNxmUDV1PBSRZv8w+sAs5A==
X-Google-Smtp-Source: AOwi7QAIYj/7L2AXI1KQhNNmCVElj2LU9Toh7zJwEuHhTRAqpvWfkxu5q4LBdg0uphk0P5mkVXBqsHy1DM3d8VTmvhI=
X-Received: by 10.46.0.23 with SMTP id 23mr3929785lja.64.1506425151085; Tue,
	26 Sep 2017 04:25:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.83.83 with HTTP; Tue, 26 Sep 2017 04:25:30 -0700 (PDT)
In-Reply-To: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
References: <20170907085136.20862-1-ricardo.ribalda@gmail.com>
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Tue, 26 Sep 2017 13:25:30 +0200
Message-ID: <CAPybu_35KFovka0osUe4SXpV2aZHj9J=k3Ft1jJKhc16qXTxZg@mail.gmail.com>
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-java][PATCH 1/2] icedtea-native: Fix segmentation build during build
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
X-List-Received-Date: Tue, 26 Sep 2017 11:25:51 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ping?

On Thu, Sep 7, 2017 at 10:51 AM, Ricardo Ribalda Delgado
<ricardo.ribalda@gmail.com> wrote:
> Without this patch, icedtea-native do_compile() results in a SIGSEGV
> when compiled with GCC7
>
> Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> ---
>  recipes-core/icedtea/icedtea7-native.inc           |  2 +
>  .../openjdk-7-03b147/vframeArray_Fix_sigsegv.patch | 60 ++++++++++++++++=
++++++
>  2 files changed, 62 insertions(+)
>  create mode 100644 recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix=
_sigsegv.patch
>
> diff --git a/recipes-core/icedtea/icedtea7-native.inc b/recipes-core/iced=
tea/icedtea7-native.inc
> index 55cb7e7a5024..7d625eb536ed 100644
> --- a/recipes-core/icedtea/icedtea7-native.inc
> +++ b/recipes-core/icedtea/icedtea7-native.inc
> @@ -43,6 +43,7 @@ SRC_URI =3D " \
>    file://jaxws_fix_NullPointerException.patch;apply=3Dno \
>    file://timezoneszip.patch \
>    file://sigsegv.patch;apply=3Dno \
> +  file://vframeArray_Fix_sigsegv.patch;apply=3Dno \
>    "
>
>  S =3D "${WORKDIR}/${ICEDTEA}"
> @@ -154,6 +155,7 @@ do_configure_append() {
>
>         patch -p1 < ${WORKDIR}/jaxws_fix_NullPointerException.patch
>         patch -p1 < ${WORKDIR}/sigsegv.patch
> +       patch -p1 < ${WORKDIR}/vframeArray_Fix_sigsegv.patch
>  }
>
>  EXTRA_OEMAKE =3D ' \
> diff --git a/recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix_sigseg=
v.patch b/recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix_sigsegv.pat=
ch
> new file mode 100644
> index 000000000000..62fe8b207011
> --- /dev/null
> +++ b/recipes-core/icedtea/openjdk-7-03b147/vframeArray_Fix_sigsegv.patch
> @@ -0,0 +1,60 @@
> +Disable Optimization on vframeArray::unpack_to_stack
> +
> +GCC7 triggers a sigsegv while building:
> +
> +
> +| JAVA_HOME=3D/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/wor=
k/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk=
1.6.0 ANT_OPTS=3D-Djava.io.tmpdir=3D'/home/ricardo/curro/qt5022/build-qt502=
2-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3=
/build/openjdk.build/langtools/build/ant-tmp' /home/ricardo/curro/qt5022/bu=
ild-qt5022-pyro/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/reci=
pe-sysroot-native/usr/bin/ant -Djdk.version=3D1.7.0_03 -Dfull.version=3D'1.=
7.0_03-icedtea-b21'  -Drelease=3D1.7.0_03 -Dbuild.number=3Db21 -Djavac.debu=
g=3Dtrue -Ddebug.classfiles=3Dtrue -Djavac.target=3D7 -Djavac.source=3D7 -D=
boot.java.home=3D/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/wor=
k/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk=
1.6.0 -Dimport.jdk=3D/home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp=
/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/j=
dk  ....
> +| Buildfile: /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work=
/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langto=
ols/make/build.xml
> +| #
> +| # A fatal error has been detected by the Java Runtime Environment:
> +| #
> +| #  SIGSEGV (0xb) at pc=3D0x00007fad7906e868, pid=3D9747, tid=3D1403830=
55484672
> +| #
> +| # JRE version: 7.0_03-b21
> +| # Java VM: OpenJDK 64-Bit Server VM (22.0-b10 mixed mode linux-amd64 c=
ompressed oops)
> +| # Derivative: IcedTea7 2.1.3
> +| # Distribution: Custom build (Thu Sep  7 09:36:21 CEST 2017)
> +| # Problematic frame:
> +| # V  [libjvm.so+0x78b868]  vframeArray::unpack_to_stack(frame&, int, i=
nt)+0x88
> +| #
> +| # Failed to write core dump. Core dumps have been disabled. To enable =
core dumping, try "ulimit -c unlimited" before starting Java again
> +| #
> +| # An error report file with more information is saved as:
> +| # /home/ricardo/curro/qt5022/build-qt5022-pyro/build/tmp/work/x86_64-l=
inux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langtools/make/=
hs_err_pid9747.log
> +| #
> +| # If you would like to submit a bug report, please include
> +| # instructions on how to reproduce the bug and visit:
> +| #   http://icedtea.classpath.org/bugzilla
> +| #
> +| Aborted
> +
> +
> +Upstream-Status: Inappropriate
> +
> +Signed-off-by: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
> +diff --git a/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp b=
/build/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp
> +index 52b080999224..81b6a09ea91a 100644
> +--- a/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp
> ++++ b/openjdk-boot/hotspot/src/share/vm/runtime/vframeArray.cpp
> +@@ -500,7 +500,7 @@ void vframeArray::fill_in(JavaThread* thread,
> +   }
> + }
> +
> +-void vframeArray::unpack_to_stack(frame &unpack_frame, int exec_mode, i=
nt caller_actual_parameters) {
> ++void __attribute__((optimize("O0"))) vframeArray::unpack_to_stack(frame=
 &unpack_frame, int exec_mode, int caller_actual_parameters) {
> +   // stack picture
> +   //   unpack_frame
> +   //   [new interpreter frames ] (frames are skeletal but walkable)
> +diff --git a/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp b/buil=
d/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp
> +index 52b080999224..81b6a09ea91a 100644
> +--- a/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp
> ++++ b/openjdk/hotspot/src/share/vm/runtime/vframeArray.cpp
> +@@ -500,7 +500,7 @@ void vframeArray::fill_in(JavaThread* thread,
> +   }
> + }
> +
> +-void vframeArray::unpack_to_stack(frame &unpack_frame, int exec_mode, i=
nt caller_actual_parameters) {
> ++void __attribute__((optimize("O0"))) vframeArray::unpack_to_stack(frame=
 &unpack_frame, int exec_mode, int caller_actual_parameters) {
> +   // stack picture
> +   //   unpack_frame
> +   //   [new interpreter frames ] (frames are skeletal but walkable)
> --
> 2.14.1
>



--=20
Ricardo Ribalda

