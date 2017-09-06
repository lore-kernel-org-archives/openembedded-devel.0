Return-Path: <ricardo.ribalda@gmail.com>
Received: from mail-lf0-f47.google.com (mail-lf0-f47.google.com
	[209.85.215.47])
	by mail.openembedded.org (Postfix) with ESMTP id 704A760290
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Sep 2017 13:39:02 +0000 (UTC)
Received: by mail-lf0-f47.google.com with SMTP id d17so17806008lfe.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Sep 2017 06:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ebhAEGWnPIMnG1YBqRzf5BU1L3MCbWpxc9rsVmoTrh4=;
	b=MF/H8skmx6ewUJEA5tkCgfoajfcoY5ZskMTJrLhbDz1tKCVuWBh6iQArpzuvRhKwQA
	GBIdDu+qPZW+4bjrRoy0nhfRHdj2I0YXjfdNWhAWETRhrusXXlmfmTWX1rICp7ISnXcs
	KmrJKo2+kfAoo43a/lg+GVfGOcm11J5GQ8yAcan6qLeTtoTxKrqTT7oqfZI60OJkUMyK
	H0d1ng0Tw6w+pHEirfT8zTyaOnS3GpSDjkZGBKMol55/sYRqj9DfTapTFLdqgxN7qPHL
	H+asuYKv1anOnlTUkBv92PmC+6hXknJA+8y3U2Q24/svUT3q01d/x7bZA/5w+MYv2XoK
	/C3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ebhAEGWnPIMnG1YBqRzf5BU1L3MCbWpxc9rsVmoTrh4=;
	b=MCNPxh9JCbvuxx7yK1qnINDvcbUuVMwRGXDnfiFSjG7pJjhgt4A30ygeQeD8IKZTuD
	tuEXvMF/eKj+TkNwYjxmwI+MkpbDMIDOIIU9MTJWxrZ7iurbq+a0OfvH/D5Ytu9yLivt
	Qhqa7h9Arc9tEeUQ67gsKfyi4kFCkKR8xPInkYMBJ6TBD5kOnSQYZlnIBMAJUq5vZJ4u
	JVVlOEXW1E/tIOBcJIO0GjcM2lkh3UeZRz3sRyCxz5pW2O852c3Tmq4sbX6WQfkHTsQy
	Xx3ZBx/1SfqbFsIaFVaxrEI4mFOYIjXQmAKKpUJMzqLtZ1+SBmjFkF7YNd/wZM4Hz32+
	kRcw==
X-Gm-Message-State: AHPjjUiuvXAOEBsYMByesFnAzSV+sSQn7Mj57uNhlRbZ62C6EQo2jf3R
	xV+nqUukhKW//kcXemtoAHkyA0nfaA==
X-Google-Smtp-Source: ADKCNb5cqd+J5uIfutdB7apyHnZmf0sAAYhFlYwb8beiewNsNUGPGHbOrLjmUAOCofL74fflmac26t1AFnqov8Zy/5I=
X-Received: by 10.25.25.80 with SMTP id 77mr1007974lfz.163.1504705143024; Wed,
	06 Sep 2017 06:39:03 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.25.83.83 with HTTP; Wed, 6 Sep 2017 06:38:42 -0700 (PDT)
From: Ricardo Ribalda Delgado <ricardo.ribalda@gmail.com>
Date: Wed, 6 Sep 2017 15:38:42 +0200
Message-ID: <CAPybu_1BguLCcMbeS0whX9+W0DjrBczUQ6gPQoH75HHUOTd_Ew@mail.gmail.com>
To: Henning Heinold <henning@itconsulting-heinold.de>, 
	Mario Domenech Goulart <mario@ossystems.com.br>,
	Maxin John <maxin.john@intel.com>, 
	Otavio Salvador <otavio@ossystems.com.br>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: icedtea7-native SIGSEGV build with gcc7
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
X-List-Received-Date: Wed, 06 Sep 2017 13:39:02 -0000
Content-Type: text/plain; charset="UTF-8"

Hi!

After updating my computer to gcc7 (Debian testing) icedtea7-native
fails to build, resulting in a SIGSEGV in javac. (see the error
attached at the end)

After some google digging I found a possible reason for this error
https://bugzilla.redhat.com/show_bug.cgi?id=1423751 . But

BUILD_CFLAGS += "-fno-store-merging -fno-code-hoisting -fno-ipa-cp
-fno-ipa-vrp -fno-split-loops"
BUILD_CXXFLAGS += "-fno-store-merging -fno-code-hoisting -fno-ipa-cp
-fno-ipa-vrp -fno-split-loops"

did not do the trick.


On the other hand:
export BUILD_CC = "${CCACHE}${BUILD_PREFIX}gcc-6"
export BUILD_CXX = "${CCACHE}${BUILD_PREFIX}g++-6"
export BUILD_CPP = "${BUILD_PREFIX}gcc-6 ${BUILD_CC_ARCH} -E"

Managed to build icedtea7-native fine.


Has anyone experienced something similar?


Regards!

| (cd  ./langtools/make && \
|   /var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/sysroots/x86_64-linux/usr/bin/make
JDK_TOPDIR=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/jdk
JDK_MAKE_SHARED_DIR=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/jdk/make/common/shared
EXTERNALSANITYCONTROL=true SOURCE_LANGUAGE_VERSION=7
TARGET_CLASS_VERSION=7 MILESTONE=fcs BUILD_NUMBER=b21
JDK_BUILD_NUMBER=b21 FULL_VERSION=1.7.0_03-icedtea-b21
PREVIOUS_JDK_VERSION=1.6.0 JDK_VERSION=1.7.0_03 JDK_MKTG_VERSION=7u3
JDK_MAJOR_VERSION=1 JDK_MINOR_VERSION=7 JDK_MICRO_VERSION=0
PREVIOUS_MAJOR_VERSION=1 PREVIOUS_MINOR_VERSION=6
PREVIOUS_MICRO_VERSION=0 STATIC_CXX=false ARCH_DATA_MODEL=64
COOKED_JDK_UPDATE_VERSION=30 COOKED_BUILD_NUMBER=21
ALT_OUTPUTDIR=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools
ALT_BOOTDIR=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0
all)
| make[3]: Entering directory
'/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langtools/make'
| JAVA_HOME=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0
ANT_OPTS=-Djava.io.tmpdir='/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/build/ant-tmp'
/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/sysroots/x86_64-linux/usr/bin/ant
-diagnostics > /var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/build/ant-diagnostics.log
; \
|   JAVA_HOME=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0
ANT_OPTS=-Djava.io.tmpdir='/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/build/ant-tmp'
/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/sysroots/x86_64-linux/usr/bin/ant
-version >> /var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/build/ant-diagnostics.log
| Aborted
| JAVA_HOME=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0
ANT_OPTS=-Djava.io.tmpdir='/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/build/ant-tmp'
/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/sysroots/x86_64-linux/usr/bin/ant
-Djdk.version=1.7.0_03 -Dfull.version='1.7.0_03-icedtea-b21'
-Drelease=1.7.0_03 -Dbuild.number=b21 -Djavac.debug=true
-Ddebug.classfiles=true -Djavac.target=7 -Djavac.source=7
-Dboot.java.home=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/bootstrap/jdk1.6.0
-Dimport.jdk=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/jdk
-Dbuild.dir=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/build
-Ddist.dir=/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk.build/langtools/dist
build
| Buildfile: /var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langtools/make/build.xml
| #
| # A fatal error has been detected by the Java Runtime Environment:
| #
| #  SIGSEGV (0xb) at pc=0x00007f03929f0808, pid=26143, tid=139653340595968
| #
| # JRE version: 7.0_03-b21
| # Java VM: OpenJDK 64-Bit Server VM (22.0-b10 mixed mode linux-amd64
compressed oops)
| # Derivative: IcedTea7 2.1.3
| # Distribution: Built on Debian GNU/Linux testing (buster) (Wed Sep
6 05:55:44 CEST 2017)
| # Problematic frame:
| # V  [libjvm.so+0x78b808]  vframeArray::unpack_to_stack(frame&, int, int)+0x88
| #
| # Failed to write core dump. Core dumps have been disabled. To
enable core dumping, try "ulimit -c unlimited" before starting Java
again
| #
| # An error report file with more information is saved as:
| # /var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langtools/make/hs_err_pid26143.log
| #
| # If you would like to submit a bug report, please include
| # instructions on how to reproduce the bug and visit:
| #   http://icedtea.classpath.org/bugzilla
| #
| Aborted
| Makefile:201: recipe for target 'build' failed
| make[3]: *** [build] Error 134
| make[3]: Leaving directory
'/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk/langtools/make'
| make/langtools-rules.gmk:37: recipe for target 'langtools-build' failed
| make[2]: *** [langtools-build] Error 2
| make[2]: Leaving directory
'/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk'
| Makefile:244: recipe for target 'build_product_image' failed
| make[1]: *** [build_product_image] Error 2
| make[1]: Leaving directory
'/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk'
| Makefile:2115: recipe for target 'stamps/icedtea.stamp' failed
| make: *** [stamps/icedtea.stamp] Error 2
| ERROR: oe_runmake failed
| ERROR: Function failed: do_compile (log file is located at
/var/lib/jenkins/workspace/qt5022-cesium-clean/build/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/temp/log.do_compile.1778)

-- 
Ricardo Ribalda

