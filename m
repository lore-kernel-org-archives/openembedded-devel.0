Return-Path: <Kai.Kang@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 40A946D548
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 27 Aug 2019 01:40:55 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id x7R1e43i005104
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 26 Aug 2019 18:40:30 -0700
Received: from [128.224.162.179] (128.224.162.179) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.468.0;
	Mon, 26 Aug 2019 18:40:07 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20190816071246.168087-1-kai.kang@windriver.com>
	<28f7200e-c9ed-e8fd-b067-25731c475981@windriver.com>
	<CALbNGRT1Xg_TLMmSusD2ESNvuCF=aD8ONJK7_S3L7s4kZwJ4_g@mail.gmail.com>
	<CALbNGRTri949iQT=judPQ+kdsr8oWqyB0a1WDrdfCxqx71Kw2Q@mail.gmail.com>
	<1654f218-c8f9-64ea-dfd8-496860af6ca1@windriver.com>
	<CAMKF1sqpPg6bxtYD7vL9XckcJxfiYuNVscyMay2EWeyknM0Z2g@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <57be0426-253d-cae1-5118-5a0a48147f01@windriver.com>
Date: Tue, 27 Aug 2019 09:39:22 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqpPg6bxtYD7vL9XckcJxfiYuNVscyMay2EWeyknM0Z2g@mail.gmail.com>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-xfce][Patch] xfce4-datetime-setter: fix compile error and requires distro feature x11
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
X-List-Received-Date: Tue, 27 Aug 2019 01:40:55 -0000
Content-Language: en-US
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2019/8/27 上午9:37, Khem Raj wrote:
>
>
> On Mon, Aug 26, 2019 at 6:11 PM Kang Kai <Kai.Kang@windriver.com 
> <mailto:Kai.Kang@windriver.com>> wrote:
>
>     On 2019/8/24 上午4:45, Andreas Müller wrote:
>     > On Fri, Aug 23, 2019 at 10:38 PM Andreas Müller
>     <schnitzeltony@gmail.com <mailto:schnitzeltony@gmail.com>> wrote:
>     >> On Fri, Aug 23, 2019 at 3:59 AM Kang Kai
>     <Kai.Kang@windriver.com <mailto:Kai.Kang@windriver.com>> wrote:
>     >>> On 2019/8/16 下午3:12, kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com> wrote:
>     >>>> From: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     >>>>
>     >>>> It fails to compile xfce4-datetime-setter occasionally when
>     system load
>     >>>> is high:
>     >>>>
>     >>>> | ../git/xfce/main.c:42:10: fatal error:
>     cc-datetime-resources.h: No such file or directory
>     >>>> |    42 | #include "cc-datetime-resources.h"
>     >>>> |       | ^~~~~~~~~~~~~~~~~~~~~~~~~
>     >>>> | compilation terminated.
>     >>>>
>     >>>> Update datetime_panel_dep to make sure cc-datetime-resources.h be
>     >>>> generated before including.
>     >>> Hi Andreas,
>     >>>
>     >>> Any comment on this patch please? And I also sent a pull
>     request on github.
>     >>>
>     >>> Regards,
>     >>> Kai
>     >>>
>     >>>
>     >>>> xfce4-datetime-setter depends on libxfce4ui which requires distro
>     >>>> feature 'x11', so make it require 'x11' too.
>     >>>>
>     >>>> Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     >>>> ---
>     >>>>    .../files/fix-inner-dependency.patch       | 28
>     +++++++++++++++++++
>     >>>>    .../xfce4-datetime-setter_3.32.2.bb
>     <http://xfce4-datetime-setter_3.32.2.bb>          |  7 +++--
>     >>>>    2 files changed, 33 insertions(+), 2 deletions(-)
>     >>>>    create mode 100644
>     meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch
>     >>>>
>     >>>> diff --git
>     a/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch
>     b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch
>     >>>> new file mode 100644
>     >>>> index 000000000..9cccb892f
>     >>>> --- /dev/null
>     >>>> +++
>     b/meta-xfce/recipes-apps/xfce4-datetime-setter/files/fix-inner-dependency.patch
>     >>>> @@ -0,0 +1,28 @@
>     >>>> +It fails to compile xfce4-datetime-setter occasionally when
>     system load is high:
>     >>>> +
>     >>>> +| ../git/xfce/main.c:42:10: fatal error:
>     cc-datetime-resources.h: No such file or directory
>     >>>> +|    42 | #include "cc-datetime-resources.h"
>     >>>> +|       | ^~~~~~~~~~~~~~~~~~~~~~~~~
>     >>>> +| compilation terminated.
>     >>>> +
>     >>>> +Update datetime_panel_dep to make sure
>     cc-datetime-resources.h be generated
>     >>>> +before including.
>     >>>> +
>     >>>> +Upstream-Status: Submitted
>     [https://github.com/schnitzeltony/xfce4-datetime-setter/pull/2]
>     >>>> +
>     >>>> +Signed-off-by: Kai Kang <kai.kang@windriver.com
>     <mailto:kai.kang@windriver.com>>
>     >>>> +---
>     >>>> +diff --git a/panels/datetime/meson.build
>     b/panels/datetime/meson.build
>     >>>> +index c5bf39c..241e177 100644
>     >>>> +--- a/panels/datetime/meson.build
>     >>>> ++++ b/panels/datetime/meson.build
>     >>>> +@@ -175,7 +175,8 @@ datetime_panel_lib = static_library(
>     >>>> +
>     >>>> + datetime_panel_dep = declare_dependency(
>     >>>> +   include_directories: [ common_inc,
>     include_directories('.') ],
>     >>>> +-  link_with: datetime_panel_lib
>     >>>> ++  link_with: datetime_panel_lib,
>     >>>> ++  sources: resources
>     >>>> + )
>     >>>> +
>     >>>> + subdir('po-timezones')
>     >>>> diff --git
>     a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>     <http://xfce4-datetime-setter_3.32.2.bb>
>     b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>     <http://xfce4-datetime-setter_3.32.2.bb>
>     >>>> index d64358537..4d128ac51 100644
>     >>>> ---
>     a/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>     <http://xfce4-datetime-setter_3.32.2.bb>
>     >>>> +++
>     b/meta-xfce/recipes-apps/xfce4-datetime-setter/xfce4-datetime-setter_3.32.2.bb
>     <http://xfce4-datetime-setter_3.32.2.bb>
>     >>>> @@ -6,13 +6,16 @@ LIC_FILES_CHKSUM =
>     "file://COPYING;md5=75859989545e37968a99b631ef42722e"
>     >>>>
>     >>>>    DEPENDS = "glib-2.0-native libxfce4ui"
>     >>>>
>     >>>> -SRC_URI =
>     "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https
>     <http://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https>"
>     >>>> +SRC_URI =
>     "git://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https
>     <http://github.com/schnitzeltony/xfce4-datetime-setter.git;protocol=https>
>     \
>     >>>> +  file://fix-inner-dependency.patch \
>     >>>> +"
>     >>>>    SRCREV = "5c7a73a3824b03b91719e05e2604b97c7a72d50f"
>     >>>>
>     >>>>    S = "${WORKDIR}/git"
>     >>>>
>     >>>>    inherit gettext meson distro_features_check
>     >>>> -REQUIRED_DISTRO_FEATURES = "systemd"
>     >>>> +
>     >>>> +REQUIRED_DISTRO_FEATURES = "systemd x11"
>     >>>>
>     >>>>    FILES_${PN} += "${datadir}/icons/hicolor"
>     >>>>
>     >> Woops I missed that completely - will check
>     > Thanks! Did apply the patch
>
>     Hi Andreas,
>
>     Thanks.
>
>
>     Hi Khem,
>
>     Would you like to review this patch? Thanks.
>
>
> This looks fine to me have we not applied it yet ?

I didn't see it in master-next. :(

Kai


>
>     Kai
>
>
>     >
>     > Andreas
>     >
>
>     -- 
>     Kai Kang
>

-- 
Kai Kang


