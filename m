Return-Path: <martin.jansa@gmail.com>
Received: from mail-wr0-f170.google.com (mail-wr0-f170.google.com
	[209.85.128.170])
	by mail.openembedded.org (Postfix) with ESMTP id 2E23D60269
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Oct 2017 07:52:50 +0000 (UTC)
Received: by mail-wr0-f170.google.com with SMTP id o44so3863851wrf.11
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 Oct 2017 00:52:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=r0Mp/1FE0/InidU2bpc7bJGu+qt1gMurx+XdS/0F/vE=;
	b=UHtOLZKRKyG1DiRybeta4F0gA6Bra8hIkWUTcTfWBq6Q893T7+DeX3xIMmkmR0Q0EL
	mE84ibxLfXk6nvL3w7CuHuCkybKLA6RPPIXrbDeVOGKV52wJ0zVE3WS3T9u91eeA7pQE
	Dwf1+9ddblqwTQVrqkBPgeyNATv3+lscKag9hcN0zhu6ff3z3XfWS0nITed6GhypJ2eA
	uqW2+b6l7JaRp1tmJzLsp8FmmgNeqi90MEBVTdxjyBc3+NcEVfBfWXQdJFKDcRArmZmp
	b3qY6Yvf0d1tWst9Xaq9kOVG60a2uaLo1NZ/W54BeNiN7eEM0Kf+eT3pZLyzwsCbovVl
	fugw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=r0Mp/1FE0/InidU2bpc7bJGu+qt1gMurx+XdS/0F/vE=;
	b=hIWdxjPNTAXVcjAC7d3HYmcxBOLXCP6Q+oMqPP4Jx2FW0W7MHoh9KXCUMMgqKarBWP
	I40TflaRBcL6o4kFSrgHN9QFZrHATcWWj3HZ4zcIHEaa2qLJqMVJvLezVdrZnDK+EbLB
	VbIZx3oTB+H9enY52pM1vgUtHeIMRWI7R5/5bDKLzUZI9p3MciTs+biEK76jbx1ino6z
	PKqn+4r4a9Ys0oF244K2RYbhGAhYEdNZoJ6ybBjXj7YPdZeGen3YbRzIu98rhXY4DnUh
	ncSc3Rl8ErPUb2rV0EvBLWHP5UbNZhX0PjtnAFLbZi5gKXv5PohIUZ2tbgf3nmB1wSCM
	C5Kg==
X-Gm-Message-State: AMCzsaUwDyzpDzqR0FLeh0Twm1WYBdjmvq3+C/gNARWR1N2VHHIdkoyx
	eqlh7iY2AiGrFOHZB8MV2lu5Huxi6RtVG4L5t1o=
X-Google-Smtp-Source: AOwi7QDA00+SjxL3QQyP0IRDJfapWTnioJkLdhoRBtV+G4PCTUNZUhNp6C5FOuOR4r9eS/onyPgE6acBe3JqfDcb7BA=
X-Received: by 10.223.158.210 with SMTP id b18mr9865543wrf.99.1507017171992;
	Tue, 03 Oct 2017 00:52:51 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.28.183.212 with HTTP; Tue, 3 Oct 2017 00:52:51 -0700 (PDT)
In-Reply-To: <20171002222529.GE16828@denix.org>
References: <1499835521-973-1-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<1499835521-973-2-git-send-email-huangqy.fnst@cn.fujitsu.com>
	<20171002222529.GE16828@denix.org>
From: Martin Jansa <martin.jansa@gmail.com>
Date: Tue, 3 Oct 2017 09:52:51 +0200
Message-ID: <CA+chaQfoeaFsCzx3NqUWsW-_MrRuTwXzQcS2o-D95Y6EKuk7tQ@mail.gmail.com>
To: Denys Dmytriyenko <denis@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
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
X-List-Received-Date: Tue, 03 Oct 2017 07:52:51 -0000
Content-Type: text/plain; charset="UTF-8"

Yes, I've seen this few times as well.

On Tue, Oct 3, 2017 at 12:25 AM, Denys Dmytriyenko <denis@denix.org> wrote:

> On Wed, Jul 12, 2017 at 12:58:38PM +0800, Huang Qiyu wrote:
> >   Add qt5-ptest.inc file for qt ptest related tasks
> >         1)      Rewrite do_compile_ptest task for qt
> >         2)      Add new do_compile_ptest_base and task do_install_ptest
> >         3)      Write do_populate_sysroot_append to resolve
> do_compile_ptest_base problem in yocto2.3
>
> Something in this order of tasks is not completely correct - I just got
> qtxmlpatterns:do_install_ptest very early on (after fetch/unpack, but
> before
> compile/install). Even before pseudo-native fnished building and
> installing.
> And since do_install_ptest task marked as "fakeroot", it obviously failed:
>
> NOTE: Running task 614 of 7991 (/OE/master/sources/meta-qt5/
> recipes-qt/qt5/qtxmlpatterns_git.bb:do_install_ptest)
> ERROR: Failed to spawn fakeroot worker to run /OE/master/sources/meta-qt5/
> recipes-qt/qt5/qtxmlpatterns_git.bb:do_install_ptest: [Errno 2] No such
> file or directory: '/OE/master/build/tmp-glibc/sysroots-components/x86_64/
> pseudo-native/usr/bin/pseudo'
>
> Has anyone else seen this?
>
> --
> Denys
>
>
> >         The compile error log is shown as follow:
> >         cd auto/ && ( test -e Makefile || /yocto/work001/fnst/huangqy/
> work_qt/build/tmp/work/i586-p
> > oky-linux/qtxmlpatterns/5.8.0+gitAUTOINC+9f7e01b582-r0/
> recipe-sysroot-native/usr/bin/qt5/qmake -o M
> > akefile /yocto/work001/fnst/huangqy/work_qt/build/tmp/work/i586-
> poky-linux/qtxmlpatterns/5.8.0+gitA
> > UTOINC+9f7e01b582-r0/git/tests/auto/auto.pro ) && make -f Makefile
> >         Project ERROR: Could not find feature xml-schema.
> >         Makefile:42: recipe for target 'sub-auto-make_first' failed
> >
> > Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>
> > ---
> >  recipes-qt/qt5/qt5-ptest.inc | 62 ++++++++++++++++++++++++++++++
> ++++++++++++++
> >  1 file changed, 62 insertions(+)
> >  create mode 100644 recipes-qt/qt5/qt5-ptest.inc
> >
> > diff --git a/recipes-qt/qt5/qt5-ptest.inc b/recipes-qt/qt5/qt5-ptest.inc
> > new file mode 100644
> > index 0000000..49d44ac
> > --- /dev/null
> > +++ b/recipes-qt/qt5/qt5-ptest.inc
> > @@ -0,0 +1,62 @@
> > +SRC_URI += "file://run-ptest"
> > +
> > +inherit ptest
> > +
> > +addtask do_populate_sysroot after do_install before
> do_compile_ptest_base
> > +deltask do_compile_ptest_base
> > +addtask do_compile_ptest_base after do_populate_sysroot before
> do_install_ptest
> > +addtask do_install_ptest after do_compile_ptest_base before do_package
> > +
> > +do_compile_ptest() {
> > +    cd ${S}/tests
> > +    qmake -o Makefile tests.pro
> > +    oe_runmake
> > +}
> > +
> > +do_populate_sysroot_append() {
> > +    workdir = d.getVar('WORKDIR')
> > +    srcdir = workdir + '/sysroot-destdir/usr/'
> > +    destdir = workdir + '/recipe-sysroot/usr/'
> > +
> > +    def copyFiles(sourceDir, targetDir, filelist):
> > +        for file in os.listdir(sourceDir):
> > +            sourceFile = os.path.join(sourceDir,  file)
> > +            targetFile = os.path.join(targetDir,  file)
> > +            filelist.append(targetFile)    #record the file list
> > +            if os.path.isfile(sourceFile):
> > +                if not os.path.exists(targetDir):
> > +                    os.makedirs(targetDir)
> > +                if not os.path.exists(targetFile)
> or(os.path.exists(targetFile) and (os.path.getsize(targetFile) !=
> os.path.getsize(sourceFile))):
> > +                        open(targetFile, "wb").write(open(sourceFile,
> "rb").read())
> > +            if os.path.isdir(sourceFile):
> > +                First_Directory = False
> > +                copyFiles(sourceFile, targetFile, filelist)
> > +
> > +    if os.path.exists(destdir):
> > +        Tmpfilelist = []
> > +        copyFiles(srcdir, destdir, Tmpfilelist)
> > +
> > +        fp=open(workdir + '/filelist', 'w')
> > +        for i in Tmpfilelist:
> > +            fp.write(i)
> > +            fp.write("\n")
> > +        fp.close()
> > +}
> > +
> > +fakeroot do_install_ptest() {
> > +    mkdir -p ${D}${PTEST_PATH}
> > +    t=${D}${PTEST_PATH}
> > +    for var in ` find ${S}/tests/auto/ -name tst_*`; do
> > +        if [ -z ` echo ${var##*/} | grep '\.'` ]; then
> > +            echo ${var##*/} >> ${t}/tst_list
> > +            install -m 0644  ${var} ${t}
> > +        fi
> > +    done
> > +    for file in `cat ${WORKDIR}/filelist`; do
> > +       if [ -f $file ]; then
> > +           rm -f $file
> > +       fi
> > +    done
> > +    rm -f ${WORKDIR}/filelist
> > +}
> > +
> > --
> > 2.7.4
> >
> >
> >
> > --
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

