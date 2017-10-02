Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id E34C171D79
	for <openembedded-devel@lists.openembedded.org>;
	Mon,  2 Oct 2017 22:25:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id D554A209BC;
	Mon,  2 Oct 2017 22:25:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id sMX5J4VbSTtx; Mon,  2 Oct 2017 22:25:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-85-143.washdc.fios.verizon.net
	[100.15.85.143])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id ABECE207A6;
	Mon,  2 Oct 2017 22:25:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id F0F971626B2; Mon,  2 Oct 2017 18:25:29 -0400 (EDT)
Date: Mon, 2 Oct 2017 18:25:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
Message-ID: <20171002222529.GE16828@denix.org>
References: <1499835521-973-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1499835521-973-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
MIME-Version: 1.0
In-Reply-To: <1499835521-973-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-qt5] [PATCH v4 1/4] qt5: add qt5-ptest.inc
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
X-List-Received-Date: Mon, 02 Oct 2017 22:25:31 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jul 12, 2017 at 12:58:38PM +0800, Huang Qiyu wrote:
>   Add qt5-ptest.inc file for qt ptest related tasks
>         1)      Rewrite do_compile_ptest task for qt
>         2)      Add new do_compile_ptest_base and task do_install_ptest
>         3)      Write do_populate_sysroot_append to resolve do_compile_ptest_base problem in yocto2.3

Something in this order of tasks is not completely correct - I just got 
qtxmlpatterns:do_install_ptest very early on (after fetch/unpack, but before 
compile/install). Even before pseudo-native fnished building and installing. 
And since do_install_ptest task marked as "fakeroot", it obviously failed:

NOTE: Running task 614 of 7991 (/OE/master/sources/meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_install_ptest)
ERROR: Failed to spawn fakeroot worker to run /OE/master/sources/meta-qt5/recipes-qt/qt5/qtxmlpatterns_git.bb:do_install_ptest: [Errno 2] No such file or directory: '/OE/master/build/tmp-glibc/sysroots-components/x86_64/pseudo-native/usr/bin/pseudo'

Has anyone else seen this?

-- 
Denys


>         The compile error log is shown as follow:
>         cd auto/ && ( test -e Makefile || /yocto/work001/fnst/huangqy/work_qt/build/tmp/work/i586-p
> oky-linux/qtxmlpatterns/5.8.0+gitAUTOINC+9f7e01b582-r0/recipe-sysroot-native/usr/bin/qt5/qmake -o M
> akefile /yocto/work001/fnst/huangqy/work_qt/build/tmp/work/i586-poky-linux/qtxmlpatterns/5.8.0+gitA
> UTOINC+9f7e01b582-r0/git/tests/auto/auto.pro ) && make -f Makefile
>         Project ERROR: Could not find feature xml-schema.
>         Makefile:42: recipe for target 'sub-auto-make_first' failed
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  recipes-qt/qt5/qt5-ptest.inc | 62 ++++++++++++++++++++++++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 recipes-qt/qt5/qt5-ptest.inc
> 
> diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
> new file mode 100644
> index 0000000..49d44ac
> --- /dev/null
> +++ b/recipes-qt/qt5/qt5-ptest.inc
> @@ -0,0 +1,62 @@
> +SRC_URI += "file://run-ptest"
> +
> +inherit ptest
> +
> +addtask do_populate_sysroot after do_install before do_compile_ptest_base
> +deltask do_compile_ptest_base
> +addtask do_compile_ptest_base after do_populate_sysroot before do_install_ptest
> +addtask do_install_ptest after do_compile_ptest_base before do_package
> +
> +do_compile_ptest() {
> +    cd ${S}/tests
> +    qmake -o Makefile tests.pro
> +    oe_runmake
> +}
> +
> +do_populate_sysroot_append() {
> +    workdir = d.getVar('WORKDIR')
> +    srcdir = workdir + '/sysroot-destdir/usr/'
> +    destdir = workdir + '/recipe-sysroot/usr/'
> +    
> +    def copyFiles(sourceDir, targetDir, filelist):
> +        for file in os.listdir(sourceDir):
> +            sourceFile = os.path.join(sourceDir,  file)
> +            targetFile = os.path.join(targetDir,  file)
> +            filelist.append(targetFile)    #record the file list
> +            if os.path.isfile(sourceFile):
> +                if not os.path.exists(targetDir):
> +                    os.makedirs(targetDir)
> +                if not os.path.exists(targetFile) or(os.path.exists(targetFile) and (os.path.getsize(targetFile) != os.path.getsize(sourceFile))):
> +                        open(targetFile, "wb").write(open(sourceFile, "rb").read())
> +            if os.path.isdir(sourceFile):
> +                First_Directory = False
> +                copyFiles(sourceFile, targetFile, filelist)
> +    
> +    if os.path.exists(destdir):
> +        Tmpfilelist = []
> +        copyFiles(srcdir, destdir, Tmpfilelist)
> +        
> +        fp=open(workdir + '/filelist', 'w')
> +        for i in Tmpfilelist:
> +            fp.write(i)
> +            fp.write("\n")
> +        fp.close()
> +}
> +
> +fakeroot do_install_ptest() {
> +    mkdir -p ${D}${PTEST_PATH}
> +    t=${D}${PTEST_PATH}
> +    for var in ` find ${S}/tests/auto/ -name tst_*`; do
> +        if [ -z ` echo ${var##*/} | grep '\.'` ]; then
> +            echo ${var##*/} >> ${t}/tst_list
> +            install -m 0644  ${var} ${t}
> +        fi
> +    done
> +    for file in `cat ${WORKDIR}/filelist`; do
> +       if [ -f $file ]; then
> +           rm -f $file
> +       fi
> +    done 
> +    rm -f ${WORKDIR}/filelist
> +}
> +
> -- 
> 2.7.4
> 
> 
> 
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

