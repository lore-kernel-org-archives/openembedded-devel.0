Return-Path: <anders@chargestorm.se>
Received: from stoexhubfe02.domain01.net (STOEXHUBFE02.domain01.net
	[83.145.59.141])
	by mail.openembedded.org (Postfix) with ESMTP id 3625E60CF1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 10 Jan 2014 06:47:53 +0000 (UTC)
Received: from localhost (213.114.79.21) by stoexhubfe02.domain01.net
	(10.12.10.7) with Microsoft SMTP Server id 8.3.279.1; Fri, 10 Jan 2014
	07:47:39 +0100
From: Anders Darander <anders@chargestorm.se>
To: <openembedded-devel@lists.openembedded.org>
Date: Fri, 10 Jan 2014 07:47:49 +0100
Message-ID: <cover.1389336448.git.anders@chargestorm.se>
X-Mailer: git-send-email 1.8.5.2
MIME-Version: 1.0
X-GFI-SMTP-Submission: 1
Cc: Anders Darander <anders@chargestorm.se>
Subject: [meta-oe][PATCH v2 0/1] ktap: deterministic build
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 10 Jan 2014 06:47:53 -0000
Content-Type: text/plain


Add some configuration to the build process of ktap, to get a more 
deterministic build. Currently, the v0.4 recipe will build with 
libelf support (from the elfutils recipe), if that is found during
the compile stage, thus we have a non-deterministic build going on.

At the same time, I'm also adding support for the FFI configuration.
This part has only been imlemented with a limited build test, as it's
only supported on x86_64 (which I'm not normally building for).

The configuration of both LIBELF and FFI has been implemented using 
PACKAGECONFIG, even though it's only the LIBELF part that make any 
real use of that infrastructure. For FFI, it's only been used to get
a consistent configuration tool for both options.


    * basic FFI support (depend on CONFIG_KTAP_FFI)
	FFI will allow call kernel function from ktap script

	cdef [[ int printk(char *fmt, ...); ]]
	C.printk("this is ffi printk from ktap\n")

	(currently only support basic C types, structure support is ongoing)

---
Changes v1 -> v2:
	* Remove PACKAGECONFIG[ffi] from ktap_v0.4.bb, as it's already defined
	  in ktap.inc.

The following changes since commit 3402bfac6b595c622e4590a8ff5eaaa854e2a2a3:

  inetutils: fix compile error when PATH_PROCNET_DEV is undefined (2014-01-08 22:26:26 +0000)

are available in the git repository at:

  git://github.com/darander/meta-oe ktap_v0.4
  https://github.com/darander/meta-oe/tree/ktap_v0.4

Anders Darander (1):
  ktap: add configs for elfutils and ffi

 meta-oe/recipes-kernel/ktap/ktap-module_0.4.bb |  5 ++++-
 meta-oe/recipes-kernel/ktap/ktap.inc           |  2 ++
 meta-oe/recipes-kernel/ktap/ktap_0.4.bb        | 11 ++++++++++-
 3 files changed, 16 insertions(+), 2 deletions(-)

-- 
1.8.5.2


