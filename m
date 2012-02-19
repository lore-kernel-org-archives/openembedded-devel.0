Received: from mail-pz0-f47.google.com ([209.85.210.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Ryuke-0006dD-NU
	for openembedded-devel@lists.openembedded.org;
	Sun, 19 Feb 2012 01:35:41 +0100
Received: by daln34 with SMTP id n34so3820647dal.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Feb 2012 16:27:23 -0800 (PST)
Received-SPF: pass (google.com: domain of raj.khem@gmail.com designates
	10.68.75.135 as permitted sender) client-ip=10.68.75.135; 
Authentication-Results: mr.google.com;
	spf=pass (google.com: domain of raj.khem@gmail.com
	designates 10.68.75.135 as permitted sender)
	smtp.mail=raj.khem@gmail.com;
	dkim=pass header.i=raj.khem@gmail.com
Received: from mr.google.com ([10.68.75.135])
	by 10.68.75.135 with SMTP id c7mr46186542pbw.43.1329611243790 (num_hops
	= 1); Sat, 18 Feb 2012 16:27:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent; bh=ZMoDjJItdXfIC6aJfvM+ORW3s7Kv/qdF3W0XpLrJuxU=;
	b=treAR42j3uU1Ts5zspaFnTj1wlhvV7Sh3+1w/ENNC3Cz63D/yg90AOUw65Tg7sxRdE
	7LCapT2wwrRIhIjvW7YkfyLtVBcl+WB6yFtHf+rEvga2TVTsV+eXV3bhMY3H2ZTpLrPH
	qSm6/VJBTSqRjdARhz3XrjB/Izv7Tl4fM7DAk=
Received: by 10.68.75.135 with SMTP id c7mr37795770pbw.43.1329611243695;
	Sat, 18 Feb 2012 16:27:23 -0800 (PST)
Received: from sakrah.homelinux.org
	(99-57-140-209.lightspeed.sntcca.sbcglobal.net. [99.57.140.209])
	by mx.google.com with ESMTPS id
	kx17sm20628557pbb.19.2012.02.18.16.27.21
	(version=TLSv1/SSLv3 cipher=OTHER);
	Sat, 18 Feb 2012 16:27:22 -0800 (PST)
Date: Sat, 18 Feb 2012 16:27:34 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20120219002734.GA9459@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
MIME-Version: 1.0
In-Reply-To: <1329600022-8027-1-git-send-email-heinold@inf.fu-berlin.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [oe-classic][PATCH 00/12] openjdk
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
X-List-Received-Date: Sun, 19 Feb 2012 00:35:41 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (18/02/12 22:20), Henning Heinold wrote:
> Hi,
> 
> in good old tradition I send this patches for review against
> older openembedded.dev branch. It makes openjdk buildable
> again and updates it to version 1.11.1.
> Work was sponsored by Koan s.a.s. If nobody objects I will
> commit it on monday.

the patches look sane. Two things I would think will be nice is
1. are these patches needed on 2011.03 branch ? if yes please submit
the pull request for the maintenance branch too
2. Are any of these patches needed for meta-java or any other
layer then they should be forwarded ported to respective layer
as well

Thx
-Khem

> 
> Bye Henning
> 
> Henning Heinold (12):
>   libbecj-bootstrap: use sort for build order of the javafiles and
>     introduce INC_PR, backported from meta-java
>   jamvm-inital: rework libffi detection
>   cacao-native: update hg version
>   icedtea6-native: add linux kernel version 3 support
>   ecj-inital: rename recipe to ecj-initial-native
>   jamvm: add recipes which combines native and target
>   angstrom-jalimo.conf,sane-toolchain-java.inc: use jamvm-git instead
>     of cacao-hg as java-native
>   rhino: add version 1.7r2
>   ecj-bootstrap-native: update ecj script
>   openjdk: backport 1.11.1 release from meta-java
>   angstrom-jalimo.conf: prefer icedtea 1.11.1 for openjdk6
>   openjdk-6-common.inc: fix hardcoded path for allowing to build with
>     linux 3.x
> 
>  conf/distro/include/angstrom-jalimo.conf           |    6 +-
>  conf/distro/include/sane-toolchain-java.inc        |    2 +-
>  recipes/cacao/cacao-native.inc                     |   15 ++-
>  recipes/cacao/cacao-native_hg.bb                   |    8 +-
>  recipes/classpath/classpath-native.inc             |    2 +-
>  recipes/ecj/ecj-bootstrap-native.bb                |    2 +-
>  recipes/ecj/ecj-initial-native.bb                  |   35 +++
>  recipes/ecj/ecj-initial.bb                         |   35 ---
>  recipes/ecj/files/ecj.in                           |   23 +--
>  recipes/ecj/libecj-bootstrap.inc                   |    4 +-
>  recipes/ecj/libecj-bootstrap_3.6.1.bb              |    2 +-
>  recipes/ecj/libecj-bootstrap_3.6.bb                |    2 +-
>  .../icedtea-support_linux_3.patch                  |   19 ++
>  recipes/icedtea/icedtea6-native_1.7.10.bb          |    4 +-
>  recipes/jamvm/jamvm-initial/libffi.patch           |   68 ++++++
>  recipes/jamvm/jamvm-initial_1.4.5.bb               |   12 +-
>  recipes/jamvm/jamvm-native.inc                     |    2 +-
>  recipes/jamvm/jamvm.inc                            |   36 +++-
>  recipes/jamvm/jamvm/jamvm-jni_h-noinst.patch       |   13 ++
>  recipes/jamvm/jamvm/libffi.patch                   |   69 ++++++
>  recipes/jamvm/jamvm_git.bb                         |   15 ++
>  recipes/mozilla/rhino-native_1.7r2.bb              |    5 +
>  recipes/mozilla/rhino_1.7r2.bb                     |   45 ++++
>  .../openjdk-langtools-native_0.0+jdk7-b31.bb       |    2 +-
>  recipes/openjdk/openjdk-6-6b24/build-hacks.patch   |   79 +++++++
>  .../openjdk/openjdk-6-6b24/cacao-libtoolize.patch  |   12 +
>  .../openjdk-6-6b24/cacao-loadavg-makefile.patch    |   12 +
>  recipes/openjdk/openjdk-6-6b24/cacao-loadavg.patch |   27 +++
>  .../openjdk-6-6b24/fix_hotspot_crosscompile.patch  |   51 +++++
>  .../openjdk-6-6b24/icedtea-crosscompile-fix.patch  |  216 ++++++++++++++++++
>  .../openjdk-6-6b24/icedtea-fix-xrender.patch       |   13 ++
>  .../openjdk-6-6b24/icedtea-hostbuildcc.patch       |   12 +
>  .../icedtea-hotspot-dlvsym-uclibc.patch            |   16 ++
>  .../icedtea-hotspot-glibc-version.patch            |   23 ++
>  .../openjdk-6-6b24/icedtea-hotspot-isfinte.patch   |   15 ++
>  .../openjdk-6-6b24/icedtea-hotspot-isnanf.patch    |   21 ++
>  .../openjdk-6-6b24/icedtea-hotspot-loadavg.patch   |   28 +++
>  .../openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch  |   39 ++++
>  .../icedtea-jdk-remove-unused-backtrace.patch      |   41 ++++
>  .../openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch |   12 +
>  .../openjdk-6-6b24/icedtea-launcher-stdc++.patch   |   13 ++
>  .../openjdk-6-6b24/icedtea-libnet-renaming.patch   |  148 +++++++++++++
>  .../openjdk-6-6b24/icedtea-remove_werror.patch     |   14 ++
>  .../icedtea-shark-arm-linux-cpu-detection.patch    |  113 ++++++++++
>  .../openjdk-6-6b24/icedtea-unbreak-float.patch     |   18 ++
>  .../openjdk-6-6b24/icedtea-zero-hotspotfix.patch   |   41 ++++
>  recipes/openjdk/openjdk-6-6b24/jvm.cfg             |   43 ++++
>  recipes/openjdk/openjdk-6-common.inc               |  165 +++++++++------
>  recipes/openjdk/openjdk-6-release-6b24.inc         |  115 ++++++++++
>  recipes/openjdk/openjdk-6/build-hacks.patch        |   31 +++
>  .../openjdk-6/cacao-disable-stackbase-check.patch  |   12 +
>  recipes/openjdk/openjdk-6/cacao-libtoolize.patch   |   18 ++
>  recipes/openjdk/openjdk-6/cacao-vfp-compat.patch   |   37 ++++
>  recipes/openjdk/openjdk-6/fix-llvm-libs.patch      |   13 ++
>  .../openjdk-6/fix_hotspot_crosscompile.patch       |   94 ++++++++
>  .../openjdk-6/icedtea-crosscompile-fix.patch       |  229 ++++++++++++++++++++
>  .../openjdk-6/icedtea-fix-jar-command.patch        |   13 ++
>  .../openjdk/openjdk-6/icedtea-hasgettransfer.patch |  131 +++++++++++
>  .../openjdk/openjdk-6/icedtea-hostbuildcc.patch    |   12 +
>  .../openjdk-6/icedtea-hotspot-glibc-version.patch  |   23 ++
>  .../openjdk-6/icedtea-hotspot-isfinte.patch        |   15 ++
>  .../openjdk/openjdk-6/icedtea-hotspot-isnanf.patch |   21 ++
>  .../openjdk-6/icedtea-hotspot-loadavg.patch        |   28 +++
>  .../openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch        |   13 ++
>  .../openjdk-6/icedtea-jdk-iconv-uclibc.patch       |   39 ++++
>  .../icedtea-jdk-remove-unused-backtrace.patch      |   41 ++++
>  .../openjdk-6/icedtea-jdk-unpack-uclibc.patch      |   12 +
>  .../openjdk-6/icedtea-launcher-stdc++.patch        |   13 ++
>  .../openjdk-6/icedtea-libnet-renaming.patch        |  148 +++++++++++++
>  .../openjdk/openjdk-6/icedtea-llvm_headers.patch   |   29 +++
>  .../openjdk/openjdk-6/icedtea-remove_werror.patch  |   14 ++
>  .../openjdk/openjdk-6/icedtea-unbreak-float.patch  |   18 ++
>  recipes/openjdk/openjdk-6/jvm.cfg                  |   41 ++++
>  recipes/openjdk/openjdk-6/mkbc_returncode.patch    |   11 +
>  .../openjdk-6/shark-arm-linux-cpu-detection.patch  |  113 ++++++++++
>  .../openjdk/openjdk-6/shark-build-openjdkdir.patch |   13 ++
>  recipes/openjdk/openjdk-6/zero-cmpswap-long.patch  |   20 ++
>  recipes/openjdk/openjdk-6_6b24-1.11.1.bb           |   18 ++
>  78 files changed, 2787 insertions(+), 146 deletions(-)
>  create mode 100644 recipes/ecj/ecj-initial-native.bb
>  delete mode 100644 recipes/ecj/ecj-initial.bb
>  create mode 100644 recipes/icedtea/icedtea6-native-1.7.10/icedtea-support_linux_3.patch
>  create mode 100644 recipes/jamvm/jamvm-initial/libffi.patch
>  create mode 100644 recipes/jamvm/jamvm/jamvm-jni_h-noinst.patch
>  create mode 100644 recipes/jamvm/jamvm/libffi.patch
>  create mode 100644 recipes/jamvm/jamvm_git.bb
>  create mode 100644 recipes/mozilla/rhino-native_1.7r2.bb
>  create mode 100644 recipes/mozilla/rhino_1.7r2.bb
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/build-hacks.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/cacao-libtoolize.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/cacao-loadavg-makefile.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/cacao-loadavg.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/fix_hotspot_crosscompile.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-crosscompile-fix.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-fix-xrender.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hostbuildcc.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-dlvsym-uclibc.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-glibc-version.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isfinte.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-isnanf.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-hotspot-loadavg.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-jdk-iconv-uclibc.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-jdk-remove-unused-backtrace.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-jdk-unpack-uclibc.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-launcher-stdc++.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-libnet-renaming.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-remove_werror.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-shark-arm-linux-cpu-detection.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-unbreak-float.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/icedtea-zero-hotspotfix.patch
>  create mode 100644 recipes/openjdk/openjdk-6-6b24/jvm.cfg
>  create mode 100644 recipes/openjdk/openjdk-6-release-6b24.inc
>  create mode 100644 recipes/openjdk/openjdk-6/build-hacks.patch
>  create mode 100644 recipes/openjdk/openjdk-6/cacao-disable-stackbase-check.patch
>  create mode 100644 recipes/openjdk/openjdk-6/cacao-libtoolize.patch
>  create mode 100644 recipes/openjdk/openjdk-6/cacao-vfp-compat.patch
>  create mode 100644 recipes/openjdk/openjdk-6/fix-llvm-libs.patch
>  create mode 100644 recipes/openjdk/openjdk-6/fix_hotspot_crosscompile.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-crosscompile-fix.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-fix-jar-command.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-hasgettransfer.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-hostbuildcc.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-glibc-version.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-isfinte.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-isnanf.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-hotspot-loadavg.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-RTLD_NOLOAD.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-iconv-uclibc.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-remove-unused-backtrace.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-jdk-unpack-uclibc.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-launcher-stdc++.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-libnet-renaming.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-llvm_headers.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-remove_werror.patch
>  create mode 100644 recipes/openjdk/openjdk-6/icedtea-unbreak-float.patch
>  create mode 100644 recipes/openjdk/openjdk-6/jvm.cfg
>  create mode 100644 recipes/openjdk/openjdk-6/mkbc_returncode.patch
>  create mode 100644 recipes/openjdk/openjdk-6/shark-arm-linux-cpu-detection.patch
>  create mode 100644 recipes/openjdk/openjdk-6/shark-build-openjdkdir.patch
>  create mode 100644 recipes/openjdk/openjdk-6/zero-cmpswap-long.patch
>  create mode 100644 recipes/openjdk/openjdk-6_6b24-1.11.1.bb
> 
> -- 
> 1.7.9
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


