Return-Path: <prvs=7372357f8=Richard.Leitner@skidata.com>
Received: from mail1.skidata.com (mail1.skidata.com [91.230.2.99])
	by mail.openembedded.org (Postfix) with ESMTP id 7C9BC755F4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Oct 2015 09:43:03 +0000 (UTC)
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: AqsEAELpMVasEApK/2dsb2JhbABehApvBrp0hgkZhgICgXsBAQEBAQGBC4Q2AQEEMgFWCw0LCSUPAkYGDQYCAogxxSgBLIZ3hH6FFxeEFwWHQocKh3aFHYophngXkwSEaHGEd4EGAQEB
X-IPAS-Result: AqsEAELpMVasEApK/2dsb2JhbABehApvBrp0hgkZhgICgXsBAQEBAQGBC4Q2AQEEMgFWCw0LCSUPAkYGDQYCAogxxSgBLIZ3hH6FFxeEFwWHQocKh3aFHYophngXkwSEaHGEd4EGAQEB
Message-ID: <5631E9F1.20104@skidata.com>
Date: Thu, 29 Oct 2015 10:42:09 +0100
From: Richard Leitner <richard.leitner@skidata.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Icedove/31.8.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <C3B2E501-2242-41EF-B8CD-9F5A9D395691@gmail.com>
In-Reply-To: <C3B2E501-2242-41EF-B8CD-9F5A9D395691@gmail.com>
X-Originating-IP: [172.16.60.30]
Subject: Re: [meta-java][PATCH 2/4] meta-java: rely on well known bootstrap-path
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
X-List-Received-Date: Thu, 29 Oct 2015 09:43:05 -0000
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 8bit

On 10/28/2015 06:59 PM, Jens Rehsack wrote:
> Instead of potential circular depending virtual/javac-native (even this
> recipe provides such a useable java-native), rely on well known path
> via cacao-native to build up to icedtea7-native in reliable manner.
> 
> virtual/javac-native should be used by parts not belonging to the bootstrap
> phase.
> 
> Signed-off-by: Jens Rehsack <sno@netbsd.org>

Hi Jens,
I get following error during the OpenJDK 7u91 build for a CortexA9
target with VFP & X11.
Currently I have no time to dig deeper into the problem. Sorry for that!
Maybe you can take a look at it?


ERROR: Function failed: do_configure (log file is located at
/build/myTarget/tmp/work/x86_64-linux/cacao-native/1.6.1-r0/temp/log.do_configure.8290)
ERROR: Logfile of failure stored in:
/build/myTarget/tmp/work/x86_64-linux/cacao-native/1.6.1-r0/temp/log.do_configure.8290
Log data follows:
| DEBUG: Executing python function sysroot_cleansstate
| DEBUG: Python function sysroot_cleansstate finished
| DEBUG: Executing shell function autotools_preconfigure
| DEBUG: Shell function autotools_preconfigure finished
| DEBUG: Executing python function autotools_copy_aclocals
| DEBUG: Python function autotools_copy_aclocals finished
| DEBUG: Executing shell function do_configure
| libtoolize: putting auxiliary files in AC_CONFIG_AUX_DIR, `.'.
| libtoolize: copying file `./config.guess'
| libtoolize: copying file `./config.sub'
| libtoolize: copying file `./install-sh'
| libtoolize: copying file `./ltmain.sh'
| libtoolize: putting macros in `m4'.
| libtoolize: copying file `m4/libtool.m4'
| libtoolize: You should add the contents of `m4/libtool.m4' to
`aclocal.m4'.
| libtoolize: copying file `m4/ltoptions.m4'
| libtoolize: You should add the contents of `m4/ltoptions.m4' to
`aclocal.m4'.
| libtoolize: copying file `m4/ltsugar.m4'
| libtoolize: You should add the contents of `m4/ltsugar.m4' to
`aclocal.m4'.
| libtoolize: copying file `m4/ltversion.m4'
| libtoolize: copying file `m4/lt~obsolete.m4'
| libtoolize: You should add the contents of `m4/lt~obsolete.m4' to
`aclocal.m4'.
| libtoolize: Consider adding `AC_CONFIG_MACRO_DIR([m4])' to
configure.ac and
| libtoolize: rerunning libtoolize, to keep the correct libtool macros
in-tree.
| rm: cannot remove 'src/mm/boehm-gc/ltmain.sh': No such file or directory
| WARNING: exit code 1 from a shell command.
| ERROR: Function failed: do_configure (log file is located at
/build/myTarget/tmp/work/x86_64-linux/cacao-native/1.6.1-r0/temp/log.do_configure.8290)
ERROR: Task 693
(virtual:native:/opt/yocto/poky/meta-java/recipes-core/cacao/cacao_1.6.1.bb,
do_configure) failed with exit code '1'



best regards,
Richard L

