Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Yao.Zhao@windriver.com>) id 1SraJd-0007Xz-IG
	for openembedded-devel@lists.openembedded.org;
	Wed, 18 Jul 2012 21:53:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.3) with ESMTP id q6IF30wJ015713
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Jul 2012 08:03:00 -0700 (PDT)
Received: from [128.224.147.210] (128.224.147.210) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.1.255.0;
	Wed, 18 Jul 2012 08:02:59 -0700
Message-ID: <5006D01E.2080409@windriver.com>
Date: Wed, 18 Jul 2012 11:02:54 -0400
From: Yao Zhao <yao.zhao@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:13.0) Gecko/20120615 Thunderbird/13.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-Originating-IP: [128.224.147.210]
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: bzip2-native problem
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
X-List-Received-Date: Wed, 18 Jul 2012 19:53:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

Got a problem about bzip2-native:

The reason is that when unpacking xextproto-7.2.0.tar.bz2, 
bzip2-native's build is triggered too because of another package's 
dependency. And loader can't find libbz2.so.0 which is in sysroot(host 
bzip2 used libbz2.so.1 so it is sure the libbz2.so.0 in sysroot) I have 
searched the paths in PATH below and only find bzip2 in 2 places: host 
/bin/bzip2 and sysroot bzip2.

In bzip2's Makefile, the install is make -j xxx ... although the install 
is first to install libbz2.so.0 then bzip2 but because of the "-j xxx" 
so it is possible that bzip2 is installed first but libbz2.so.0 is not 
ready yet(in a subshell this link is created).
So I have to make the install atomic or at least don't install in parallel.

so there are a couple of workarounds:
1.set PARALLEL_MAKEINST="" (one line change, and only one library, 2 
binaries installed(bzip2, bzip2recover) + 3 scripts + a couple of links)
2.make a statically linked bzip2 and bzip2recover
3.like perl or python native to make a bzip2-native subdir in sysroot 
then only packages explicitly inherit bzip2native which will set the path.

I need your advice!

thanks,
yao

Here is the tail of log.do_unpack.6884:
  --------------------------------------------------
DEBUG: SITE files ['endian-big', 'bit-32', 'powerpc-common', 'common-linux', 'common-glibc', 'powerpc32-linux', 'powerpc-linux', 'common']
DEBUG: Executing shell function wrl_buildlink
DEBUG: Shell function wrl_buildlink finished
DEBUG: Executing python function do_unpack
DEBUG: Executing python function base_do_unpack
NOTE: Unpacking /builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/downloads/xextproto-7.2.0.tar.bz2 to /builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/tmp/work/ppce500mc-wrs-linux/xextproto-1_7.2.0-r0/
bzip2: error while loading shared libraries: libbz2.so.0: cannot open shared object file: No such file or directory
tar: This does not look like a tar archive
tar: Exiting with failure status due to previous errors
DEBUG: Python function base_do_unpack finished
DEBUG: Python function do_unpack finished
ERROR: Function failed: Unpack failure for URL: 'http://xorg.freedesktop.org/releases/individual/proto/xextproto-7.2.0.tar.bz2'. Unpack command PATH="/builds-2012-07-13-001944/fsl-p4080_std_tc/layers/oe-core/scripts:/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin/ppce500mc-wrs-linux:/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/tmp/sysroots/fsl-p4080/usr/bin/crossscripts:
/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/tmp/sysroots/x86_64-linux/usr/sbin:/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/tmp/sysroots/x86_64-linux/usr/bin:/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/tmp/sysroots/x86_64-linux/sbin:/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/tmp/sysroots/x86_64-linux//bin:/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/bin:/ba2/yow
-blade16.2/builds-2012-07-13-001944/fsl-p4080_std_tc/layers/oe-core/scripts:/builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake/bin/:/wrlinux-x/layers/wrlinux/scripts:/builds-2012-07-13-001944/fsl-p4080_std_tc/scripts:/usr/kerberos/bin:/usr/local/bin:/bin:/usr/bin:/builds-2012-07-13-001944/fsl-p4080_std_tc/layers/local/scripts:/wrlinux-x/layers/wrlinux/scripts:/wrlinux-x/layers/wrlcompat/sc
ripts" bzip2 -dc /builds-2012-07-13-001944/fsl-p4080_std_tc/bitbake_build/downloads/xextproto-7.2.0.tar.bz2 | tar x --no-same-owner -f - failed with return value 2



