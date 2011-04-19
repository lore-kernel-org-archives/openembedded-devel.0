Received: from mail-ew0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <patda293@student.liu.se>) id 1QCCNh-0006cA-FM
	for openembedded-devel@lists.openembedded.org;
	Tue, 19 Apr 2011 16:58:22 +0200
Received: by ewy5 with SMTP id 5so1718094ewy.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Apr 2011 07:55:50 -0700 (PDT)
Received: by 10.14.43.218 with SMTP id l66mr2145642eeb.188.1303224948805;
	Tue, 19 Apr 2011 07:55:48 -0700 (PDT)
Received: from localhost.localdomain (h241n2-n-a31.ias.bredband.telia.com
	[217.208.43.241])
	by mx.google.com with ESMTPS id q53sm4857629eeh.25.2011.04.19.07.55.47
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 19 Apr 2011 07:55:47 -0700 (PDT)
From: =?UTF-8?q?Patrik=20Dahlstr=C3=B6m?= <patda293@student.liu.se>
To: openembedded-devel@lists.openembedded.org
Date: Tue, 19 Apr 2011 16:55:07 +0200
Message-Id: <1303224907-13125-1-git-send-email-patda293@student.liu.se>
X-Mailer: git-send-email 1.7.4.1
MIME-Version: 1.0
Subject: [PATCH] nodejs: Make configure script not use host libutil
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
X-List-Received-Date: Tue, 19 Apr 2011 14:58:22 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Without this patch the configure script of nodejs-0.4.2 will use host libs for libutil. Excerpt from build/config.log:

Checking for library util
==>

int main() {
        return 0;
}

<==
[1/2] cxx: build/.conf_check_0/test.cpp -> build/.conf_check_0/testbuild/default/test_1.o
['arm-angstrom-linux-gnueabi-g++', '-march=armv7-a', '-mtune=cortex-a8', '-mfpu=neon', '-mfloat-abi=softfp', '-mthumb-interwork', '-mno-thumb', '--sysroot=/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-gnueabi', '-fexpensive-optimizations', '-fomit-frame-pointer', '-frename-registers', '-O2', '-ggdb2', '-fpermissive', '-fvisibility-inlines-hidden', '-DHAVE_OPENSSL=1', '../test.cpp', '-c', '-o', 'default/test_1.o']
[2/2] cxx_link: build/.conf_check_0/testbuild/default/test_1.o -> build/.conf_check_0/testbuild/default/testprog
/usr/lib/libutil.so: file not recognized: File format not recognized
collect2: ld returned 1 exit status
['arm-angstrom-linux-gnueabi-g++', '-march=armv7-a', '-mtune=cortex-a8', '-mfpu=neon', '-mfloat-abi=softfp', '-mthumb-interwork', '-mno-thumb', '--sysroot=/home/bitbake/build/tmp_beagleboard/sysroots/armv7a-angstrom-linux-gnueabi', 'default/test_1.o', '-o', '/home/bitbake/build/tmp_beagleboard/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build/.conf_check_0/testbuild/default/testprog', '-Wl,-O1', '-Wl,--hash-style=gnu', '-L/usr/lib', '-L/usr/local/lib', '-Wl,-Bdynamic', '-lutil']
command returned 'Build failed:  -> task failed (err #1): \n\t{task: cxx_link test_1.o -> testprog}'not found

It is strange how the configure script still continues even though it didn't find some of its dependencies.
Eventually the build will fail with:

default/src/node_stdio_4.o: In function `node::OpenPTY(v8::Arguments const&)':
/home/bitbake/build/tmp_beagleboard/work/armv7a-angstrom-linux-gnueabi/nodejs-0.4.2-r0/node-v0.4.2/build/../src/node_stdio.cc:241: undefined reference to `openpty'
collect2: ld returned 1 exit status

Signed-off-by: Patrik Dahlström <patda293@student.liu.se>
---
 recipes/nodejs/nodejs_0.4.2.bb |    2 ++
 1 files changed, 2 insertions(+), 0 deletions(-)

diff --git a/recipes/nodejs/nodejs_0.4.2.bb b/recipes/nodejs/nodejs_0.4.2.bb
index 912eb5d..40787b4 100644
--- a/recipes/nodejs/nodejs_0.4.2.bb
+++ b/recipes/nodejs/nodejs_0.4.2.bb
@@ -18,6 +18,8 @@ S = "${WORKDIR}/node-v${PV}"
 CCACHE = ""
 
 do_configure () {
+  sed -i -e 's:/usr/lib:${STAGING_LIBDIR}:g' wscript
+  sed -i -e 's:/usr/local/lib:${STAGING_LIBDIR}:g' wscript
   ./configure --prefix=${prefix} --without-snapshot
 }
 
-- 
1.7.4.1



