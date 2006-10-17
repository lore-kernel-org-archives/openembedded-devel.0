Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <lvcargnini@gmail.com>) id 1GZqD8-0000je-Ge
	for openembedded-devel@lists.openembedded.org;
	Tue, 17 Oct 2006 16:46:30 +0200
Received: by ug-out-1314.google.com with SMTP id m3so923881ugc
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Oct 2006 07:39:38 -0700 (PDT)
Received: by 10.78.201.2 with SMTP id y2mr9410052huf;
	Tue, 17 Oct 2006 07:39:37 -0700 (PDT)
Received: by 10.78.183.14 with HTTP; Tue, 17 Oct 2006 07:39:37 -0700 (PDT)
Message-ID: <ae36f8040610170739h22a324cdh9c31d08fa97895b8@mail.gmail.com>
Date: Tue, 17 Oct 2006 12:39:37 -0200
From: "=?ISO-8859-1?Q?Lu=EDs_Cargnini?=" <lvcargnini@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
X-Content-Filtered-By: Mailman/MimeDel 2.1.9
Subject: poblems compiling to omap
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Linux Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 17 Oct 2006 14:46:30 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: quoted-printable
Content-Disposition: inline

Hi i update my oe last night and started an bitbak bootstrap-image and in
the i received 2 errors one with u-boot thatg i fixed but last error was :
| make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/linux-
omap1-2.6.x+git-r0/git'
|   GEN     .version
| make[1]: Entering directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/linux-
omap1-2.6.x+git-r0/git'
|   CHK     include/linux/compile.h
|   UPD     include/linux/compile.h
|   CC      init/version.o
|   LD      init/built-in.o
| make[1]: Leaving directory
`/home/lvcargnini/puc/instramed/openembedded/tmp/work/linux-
omap1-2.6.x+git-r0/git'
|   LD      .tmp_vmlinux1
| arch/arm/plat-omap/built-in.o: In function `omap_mcbsp_free':
| mcbsp.c:(.text+0x3f80): undefined reference to `omap_dsp_release_mem'
| arch/arm/plat-omap/built-in.o: In function `omap_mcbsp_request':
| mcbsp.c:(.text+0x4048): undefined reference to `omap_dsp_request_mem'
| make: *** [.tmp_vmlinux1] Error 1
| FATAL: oe_runmake failed
NOTE: Task failed:
/home/lvcargnini/puc/instramed/openembedded/tmp/work/linux-
omap1-2.6.x+git-r0/temp/log.do_compile.10609
NOTE: package linux-omap1-2.6.x+git-r0: task do_compile: failed
ERROR: TaskFailed event exception, aborting
NOTE: package linux-omap1-2.6.x+git: failed
ERROR: Build of bootstrap-image failed


How to fix this ????
How to change the kernel image that OE will use ??? where i change this,
because i have a kernel that compile without errors


--=20
Thanks && Regards
Msc. Bsc. Lu=EDs Vit=F3rio Cargnini
IEEE Member
Mastering Degree student @ PUC-RS Electrical Engineer Faculty

