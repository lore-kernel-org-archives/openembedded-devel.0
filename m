Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id ABD926BAAB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  2 Jan 2019 16:59:29 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x02GwJdM028007
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 2 Jan 2019 08:59:04 -0800
Received: from [172.25.44.4] (172.25.44.4) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.408.0;
	Wed, 2 Jan 2019 08:58:24 -0800
To: Peace Lee <iipeace5@gmail.com>
References: <20181230165033.8850-1-raj.khem@gmail.com>
	<b9c25a20-eee6-c603-87a7-324bfca98587@windriver.com>
	<CAC53cca8St1ML=govQowc5OtpNS2ftv-d-ZGBBn8YH6=k-mHjg@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <07876792-0a06-c91c-fb4d-4efb033ef5c5@windriver.com>
Date: Wed, 2 Jan 2019 11:58:23 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAC53cca8St1ML=govQowc5OtpNS2ftv-d-ZGBBn8YH6=k-mHjg@mail.gmail.com>
X-Originating-IP: [172.25.44.4]
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH 1/3] guider: add a new runtime profiler package
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
X-List-Received-Date: Wed, 02 Jan 2019 16:59:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 8bit

On 1/2/19 9:00 AM, Peace Lee wrote:
> Thanks for your advice :)
> 
> Should I submit a new patch again after changing a below patch?
> I am not familiar with this process ;)

I expect that Khem will do that once he wakes up.

> It couldn't be reached to openembedded-devel members When I sent patch 
> first so that I sent github pull-request to Khem Raj.

We send patches to the oe-devel list, people comment, the gatekeeper
merges at some point. The process is documented here:

https://www.openembedded.org/wiki/How_to_submit_a_patch_to_OpenEmbedded

> 
> Anyway, I agree with your comments (fixing typos, moving the recipe to 
> meta-tool, dropping last some lines).
> But what does "_Shouldn't the packages that guider uses be recommended 
> at least?_" mean?

I thought that you were forking top, perf, etc and then screen-scrapping
  the output but it seems that you have reimplemented(parts of)
the functionality of these tools so we don't need to add a
DEPENDS/RECOMMENDS to the recipe to ensure that top for example
is added to the system image.

> Guider only requires "python-ctypes, python-shell, python-json, 
> python-subprocess" package :)

Khem's recipe has that covered then:

+RDEPENDS_${PN} = "python-ctypes python-shell \
+                  python-json python-subprocess"

> Some kernel configurations and patches are needed to trace user-level 
> functions but it depends on users.

The yocto-kenrel-cache:
 
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/00-README

has the concept of features:
 
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features
such as:
 
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-kernel-cache/tree/features/lttng

since this recipe is for meta-openembedded rather than oe-core,
we'd leave it up to users as you say. meta-openembedded depends on
oe-core but the two projects are organized by different people.



Do you have a document that explains your motivation for creating guider
and perhaps documents a few cases where it's better than the standard
tools? I likely just need to play with guider a bit more but it seems
like a use case that walked people though a performance issue that you
resolved more easily with guider than with the plethora of linux tools:
   http://www.brendangregg.com/linuxperf.html
would be good marketing.


../Randy

> 
> Happy new year!
> 
> On Tue, Jan 1, 2019 at 4:30 AM Randy MacLeod 
> <randy.macleod@windriver.com <mailto:randy.macleod@windriver.com>> wrote:
> 
>     Neat tool! I'll have to play with it a bit more.
> 
>     On 12/30/18 11:50 AM, Khem Raj wrote:
>      > From: Peace Lee <iipeace5@gmail.com <mailto:iipeace5@gmail.com>>
>      >
>      > guider [1] is a system-wide performance analyzer for platforms based
> 
>     Well, it seems to be more of a meta-tool that uses standard tools.
>     In addition, it improves usability at the cost of defining policy
>     such as immediately analyzing some data collection on target.
>     It would be nice to succinctly summarize that if you can.
>      > on linux kernel. it can measure vary system resource usage and
>     s/it/It/
>     s/vary/a variety of/
>      > trace thread/process activities. and it reports vary meaningful
>      > output to analyze system status.
>     It reports very meaningful output to analyze system status.
>      >
>      > [1] https://github.com/iipeace/guider
>      >
>      > Signed-off-by: Peace Lee <iipeace5@gmail.com
>     <mailto:iipeace5@gmail.com>>
>      > Signed-off-by: Khem Raj <raj.khem@gmail.com
>     <mailto:raj.khem@gmail.com>>
>      > ---
>      >   .../recipes-devtools/guider/guider_3.9.3.bb
>     <http://guider_3.9.3.bb>   | 34 +++++++++++++++++++
>      >   1 file changed, 34 insertions(+)
>      >   create mode 100644
>     meta-oe/recipes-devtools/guider/guider_3.9.3.bb <http://guider_3.9.3.bb>
>      >
>      > diff --git a/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
>     <http://guider_3.9.3.bb>
>     b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
>     <http://guider_3.9.3.bb>
>      > new file mode 100644
>      > index 0000000000..96d6c62ae2
>      > --- /dev/null
>      > +++ b/meta-oe/recipes-devtools/guider/guider_3.9.3.bb
>     <http://guider_3.9.3.bb>
>      > @@ -0,0 +1,34 @@
>      > +SUMMARY = "runtime performance analyzer"
>      > +HOMEPAGE = "https://github.com/iipeace/guider"
>      > +BUGTRACKER = "https://github.com/iipeace/guider/issues"
>      > +AUTHOR = "Peace Lee <ipeace5@gmail.com <mailto:ipeace5@gmail.com>>"
>      > +
>      > +LICENSE = "GPLv2+"
>      > +LIC_FILES_CHKSUM =
>     "file://LICENSE;md5=2c1c00f9d3ed9e24fa69b932b7e7aff2"
>      > +
>      > +SRC_URI = "git://github.com/iipeace/${BPN}
>     <http://github.com/iipeace/$%7BBPN%7D>"
>      > +SRCREV = "ac05a2ce0ab480957d642d947d8f617bd224031d"
>      > +
>      > +S = "${WORKDIR}/git"
>      > +R = "${RECIPE_SYSROOT_NATIVE}"
>      > +
>      > +inherit distutils
>      > +
>      > +GUIDER_OBJ = "guider.pyc"
>      > +GUIDER_SCRIPT = "guider"
>      > +
>      > +do_install() {
>      > +    python ${S}/setup.py install
>      > +
>      > +    install -d ${D}${bindir}
>      > +    install -v -m 0755 ${R}/${bindir}/${GUIDER_SCRIPT}
>     ${D}${bindir}/${GUIDER_SCRIPT}
>      > +
>      > +    install -d ${D}${datadir}/${BPN}
>      > +    install -v -m 0755 ${R}/${datadir}/${BPN}/${GUIDER_OBJ}
>     ${D}${datadir}/${BPN}/${GUIDER_OBJ}
>      > +}
>      > +
>      > +RDEPENDS_${PN} = "python-ctypes python-shell \
>      > +                  python-json python-subprocess"
> 
>     Shouldn't the packages that guider uses be recommended at least?
>     I'm not familiar with the app so maybe it can do useful things without
>     top, perf, etc.
> 
>     Should we add a kernel cfg fragment?
> 
>      > +
>      > +FILES_SOLIBSDEV = ""
>      > +#FILES_${PN} = "usr"
>     Drop that line?
> 
>      >
> 
> 
> 
>     -- 
>     # Randy MacLeod
>     # Wind River Linux
> 


-- 
# Randy MacLeod
# Wind River Linux

