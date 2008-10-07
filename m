Received: from [193.201.35.47] (helo=bq8.dotserv.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC6y-0007G3-VT
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:56:25 +0200
Received: from localhost (077233226018.hef.nianet.dk [77.233.226.18] (may be
	forged))
	by bq8.dotserv.com (8.13.1/8.13.1) with ESMTP id m97Cpk4l021252
	for <openembedded-devel@openembedded.org>;
	Tue, 7 Oct 2008 14:51:51 +0200
Received: from esben by localhost with local (Exim 4.69)
	(envelope-from <esbenhaabendal@gmail.com>) id 1KnC2U-00014t-8p
	for openembedded-devel@openembedded.org; Tue, 07 Oct 2008 14:51:46 +0200
From: eha@doredevelopment.dk
To: openembedded-devel@openembedded.org
Date: Tue,  7 Oct 2008 14:51:33 +0200
Message-Id: <1223383906-4111-1-git-send-email-eha@doredevelopment.dk>
X-Mailer: git-send-email 1.5.4.3
In-Reply-To: <>
References: <>
Subject: Canadian SDK support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 07 Oct 2008 12:56:25 -0000

Hi

I have added preliminary support for canadian cross-building of toolchain/SDK
images.

The idea is to be able to build any combination of host->target toolchain
with OE.  The primary goal here (for me), is to be able build mingw32
toolchains for OpenEmbedded projects, so that those unlucky Windows
developers can build and debug applications using native development
tools.

To avoid messing with with existing recipes more than needed, and the
cross-sdk recipes in particular, I have introduce 3 new classes:
canadian-cross, canadian-native, and canadian-sdk.

As the name suggest, they can to some extend be compared to the existing
cross, native, and cross-sdk classes.

canadian-cross recipes are for building internal cross compiler tools,
which will be used to build for the sdk architecture (fx. i586-mingw32).
The host triplet for canadian-cross is
build, build, sdk

canadian-native recipes are for building internal libraries for sdk arch.
The host triplet for canadian-native is
build, sdk, sdk

canadian-sdk recipes are for building the actual sdk cross compiler tools
which should be run on the sdk architecture.
The host triplet for canadian-sdk is
build, sdk, target

Currently, I am able to build using

target = powerpc-linux
sdk = i586-mingw32

Tested on
build = i686-linux
build = x86_64_linux

The only supported versions are
binutils = 2.18
gcc = 4.2.2
glibc = 2.6.1 (nptl)

All the necessary changes can be pulled from
http://git.doredevelopment.dk/openembedded.git
git://git.doredevelopment.dk/openembedded.git

which is a branch of org.openembedded.dev from the git trial repository,
or you can apply the attached patches on top of org.openembedded.dev
yourself.

Next steps will be to extend with more target architectures and with some
*-linux sdk architechtures.

Diffstat:
 classes/canadian-cross.bbclass                                        |   68 ++++
 classes/canadian-native.bbclass                                       |   90 ++++++
 classes/canadian-sdk.bbclass                                          |   97 ++++++
 classes/cross.bbclass                                                 |    1 
 classes/insane.bbclass                                                |    6 
 classes/native.bbclass                                                |    2 
 classes/package_ipk.bbclass                                           |   10 
 classes/sdk.bbclass                                                   |    3 
 classes/siteinfo.bbclass                                              |    8 
 conf/bitbake.conf                                                     |   23 +
 packages/binutils/binutils-canadian-cross.inc                         |   28 +
 packages/binutils/binutils-canadian-sdk_2.18.bb                       |   29 ++
 packages/binutils/mingw-binutils-canadian-cross_2.17.50-20060824-1.bb |   11 
 packages/binutils/mingw-binutils_2.17.50-20060824-1.bb                |   12 
 packages/gcc/gcc-4.2.2/canadian-build-modules-configure.patch         |   22 +
 packages/gcc/gcc-canadian-cross-initial.inc                           |    4 
 packages/gcc/gcc-canadian-sdk-build.inc                               |   81 +++++
 packages/gcc/gcc-canadian-sdk-package.inc                             |   36 ++
 packages/gcc/gcc-canadian-sdk_4.2.2.bb                                |   27 +
 packages/gcc/gcc-package-sdk.inc                                      |   14 
 packages/gcc/mingw-gcc-3.4.5-20060117-2/includedir.patch              |   12 
 packages/gcc/mingw-gcc-build.inc                                      |   35 ++
 packages/gcc/mingw-gcc-canadian-cross-initial_3.4.5-20060117-2.bb     |    7 
 packages/gcc/mingw-gcc-canadian-cross_3.4.5-20060117-2.bb             |   26 +
 packages/gcc/mingw-gcc_3.4.5-20060117-2.bb                            |   25 +
 packages/meta/canadian-sdk.bb                                         |  143 ++++++++++
 packages/meta/external-toolchain.bb                                   |    2 
 packages/meta/meta-toolchain.bb                                       |    4 
 packages/mingw/mingw-runtime-headers_3.14.bb                          |   20 +
 packages/mingw/mingw-runtime_3.14.bb                                  |   21 +
 packages/mingw/mingw-w32api-headers_3.11.bb                           |   20 +
 packages/mingw/mingw-w32api_3.11.bb                                   |   17 +
 packages/tasks/task-sdk-canadian-host.bb                              |   24 +


Best regards,
Esben Haabendal


