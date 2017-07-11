Return-Path: <martin.jansa@gmail.com>
Received: from mail-yw0-f180.google.com (mail-yw0-f180.google.com
	[209.85.161.180])
	by mail.openembedded.org (Postfix) with ESMTP id 8B33E78044
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 10:04:13 +0000 (UTC)
Received: by mail-yw0-f180.google.com with SMTP id l21so46639209ywb.1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 11 Jul 2017 03:04:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=H0coGM6bcbrHLvtSuScaSKEfQg6ItDtMbuXzVHlKCPQ=;
	b=iXFwp/PFKLWy7BzbCOU80yRdhX8i8f2n68l3gI7jqE6pqA0baqaVS2Q/LKV0fgUjzM
	ToELn96G0sbDutaSjYdGmJovDWKKMXntbOnMpXpxnAugWb2T2q5y+38wTucalo1YURHP
	+O/gjH+8xR3xkF0rq6ScsdMM/f/Q7HuM7ZFUrydLMMhHOxSSPoStDRC4irqfF0lKl5GG
	pe4xnHvll92mLuPt3ZA2tTIkrRFZL1yo7NA+rOaq6IEYYN3CzhNgOu+RsOL/dYf8ZW2A
	Nx8SaiZF3sparr6JwQbEw6vojtAAb9mYXjzjARxmFu4Ox9GApLTCukYEAKpvtChPlmHn
	NMCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=H0coGM6bcbrHLvtSuScaSKEfQg6ItDtMbuXzVHlKCPQ=;
	b=eOOAPW+RNxVvRH8lsJGuahl5Z6+p8BxqcH7WHMv7BWnFlKdlTlRzSeuOdI9APWzGxt
	YRiAyh7X2XlB5k/hNq+ugDTKM0CbAnJiSSza6dlf8UJlczWV5vnNes+H+HaD7YPOvTPl
	8QtwDn7D3gOpbS6+ANLl9hmUknlntq9yzsC8mHIKUkfh3PYrRsSWdW/Z5ZDZVbcayuCX
	7igPIF/XlCQbf7kqnMiX2ce4c9ucfLyU4ZVXZjW/wyM+k+SOAdDWvIavGLMBGhoplrSP
	euhCD5eBq0oRFoi5occuFxJbKogCzipDsrwMkwNOBhTEcJnopzP051BI9VL5DW40r700
	/HXw==
X-Gm-Message-State: AIVw112UN+rmWyZJBqoKyuA6yzLRaKbxUjg8OZJ43v5zhYbBGKOg1KPH
	edmmDdBdp6fELBFIEJlQgX65FkyY/bD3
X-Received: by 10.129.62.29 with SMTP id l29mr4064088ywa.9.1499763722958; Tue,
	11 Jul 2017 02:02:02 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.37.77.4 with HTTP; Tue, 11 Jul 2017 02:02:02 -0700 (PDT)
In-Reply-To: <1498801625-1064-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
References: <1498801625-1064-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1498801625-1064-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 11 Jul 2017 11:02:02 +0200
Message-ID: <CA+chaQdn0qcX5xpvUo8tr+gM9KeTfErz0mNJBfgvAy0-XL+3Dw@mail.gmail.com>
To: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5] [PATCH v3 1/3] qt5: add qt5-ptest.inc
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
X-List-Received-Date: Tue, 11 Jul 2017 10:04:15 -0000
Content-Type: text/plain; charset="UTF-8"

This breaks qtxmlpatterns-native build as shown in:
http://errors.yoctoproject.org/Errors/Details/147039/

On Fri, Jun 30, 2017 at 7:47 AM, Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
wrote:

> Add qt5-ptest.inc file for qt ptest related tasks
>     1)  Rewrite do_compile_ptest task for qt
>     2)  Add new do_compile_ptest_base and task do_install_ptest
>     3)  Write do_populate_sysroot_append to resolve do_compile_ptest_base
> problem in yocto2.3
>     The compile error log is shown as follow:
>     cd auto/ && ( test -e Makefile || /yocto/work001/fnst/huangqy/
> work_qt/build/tmp/work/i586-poky-linux/qtxmlpatterns/5.8.
> 0+gitAUTOINC+9f7e01b582-r0/recipe-sysroot-native/usr/bin/qt5/qmake -o
> Makefile /yocto/work001/fnst/huangqy/work_qt/build/tmp/work/i586-
> poky-linux/qtxmlpatterns/5.8.0+gitAUTOINC+9f7e01b582-r0/git/tests/auto/
> auto.pro ) && make -f Makefile
>     Project ERROR: Could not find feature xml-schema.
>     Makefile:42: recipe for target 'sub-auto-make_first' failed
>
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> ---
>  recipes-qt/qt5/qt5-ptest.inc | 61 ++++++++++++++++++++++++++++++
> ++++++++++++++
>  1 file changed, 61 insertions(+)
>  create mode 100644 recipes-qt/qt5/qt5-ptest.inc
>
> diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
> new file mode 100644
> index 0000000..da0b65a
> --- /dev/null
> +++ b/recipes-qt/qt5/qt5-ptest.inc
> @@ -0,0 +1,61 @@
> +SRC_URI += "file://run-ptest"
> +
> +inherit ptest
> +
> +addtask do_populate_sysroot after do_install before do_compile_ptest_base
> +deltask do_compile_ptest_base
> +addtask do_compile_ptest_base after do_populate_sysroot before
> do_install_ptest
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
> +                if not os.path.exists(targetFile)
> or(os.path.exists(targetFile) and (os.path.getsize(targetFile) !=
> os.path.getsize(sourceFile))):
> +                        open(targetFile, "wb").write(open(sourceFile,
> "rb").read())
> +            if os.path.isdir(sourceFile):
> +                First_Directory = False
> +                copyFiles(sourceFile, targetFile, filelist)
> +
> +    Tmpfilelist = []
> +    copyFiles(srcdir, destdir, Tmpfilelist)
> +
> +    fp=open(workdir + '/filelist', 'w')
> +    for i in Tmpfilelist:
> +        fp.write(i)
> +        fp.write("\n")
> +    fp.close()
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
>

