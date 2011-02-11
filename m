Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Po1SC-0004Q2-LN
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 23:27:05 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Po1R8-0003i9-4n from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Feb 2011 14:25:58 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	svr-orw-fem-01.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Fri, 11 Feb 2011 14:25:57 -0800
Received: from [172.30.80.144] ([172.30.80.144]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Fri, 11 Feb 2011 15:25:56 -0700
Message-ID: <4D55B76D.9090806@mentor.com>
Date: Fri, 11 Feb 2011 15:25:49 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1296768970-19738-1-git-send-email-schnitzeltony@gmx.de>
	<201102102318.21822.schnitzeltony@gmx.de>
In-Reply-To: <201102102318.21822.schnitzeltony@gmx.de>
X-OriginalArrivalTime: 11 Feb 2011 22:25:56.0365 (UTC)
	FILETIME=[A6AFE3D0:01CBCA3A]
Subject: Re: [PATCH] clutter: fix broken clutter-gtk
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
X-List-Received-Date: Fri, 11 Feb 2011 22:27:05 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 02/10/2011 03:18 PM, Andreas Mueller wrote:
> On Thursday 03 February 2011 22:36:10 Andreas Mueller wrote:
>> * Since clutter 1.4.2 clutter-gtk fails for machines/archs configuring
>> * flavour=eglx with (see clutter.inc)
>> *
>> * | Making all in clutter-gtk
>> * | make[2]: Entering directory `/home/Superandi/tmp/work/armv7a-angstrom-linux-gnueabi/clutter-gtk-0.10.8-r2.0/clutter-gtk-0.10.8/clutter-gtk'
>> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-embed.lo
>> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-scrollable.lo
>> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-util.lo
>> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-viewport.lo
>> * |   CC     libclutter_gtk_0.10_la-gtk-clutter-zoomable.lo
>> * |   CCLD   libclutter-gtk-0.10.la
>> * | /home/Superandi/tmp/sysroots/i686-linux/usr/armv7a/lib/gcc/arm-angstrom-linux-gnueabi/4.3.3/../../../../arm-angstrom-linux-gnueabi/bin/ld: cannot find -lclutter-egl-1.0
>> *
>> * Since clutter 1.3.x in 'configure.ac' the meaning of 'CLUTTER_WINSYS' has
>> * changed. In clutter 1.2.x 'CLUTTER_WINSYS' contained the value passed by
>> * 'flavour' (in the error case 'eglx'). In 1.3.x this variable is set in
>> * 'configure.ac'. For flavour=eglx it is set to 'egl'! The correct value
>> * 'eglx' is found in 'CLUTTER_SONAME_INFIX'. Some of the '*.pc.in' files
>> * were changed. clutter-gtk fell victim for clutter-x11.pc.in.
>> *
>> * Build tested for all clutter recipes with
>> *
>> * BB_VERSION        = "1.10.2"
>> * MACHINE           = "overo"
>> * DISTRO            = "angstrom"
>> * DISTRO_VERSION    = "2010.7-test-20110203"
>>
>> Signed-off-by: Andreas Mueller<schnitzeltony@gmx.de>
>> ---
>>   .../clutter/clutter-1.4.2/fix-lib-location.patch   |   63 ++++++++++++++++++++
>>   recipes/clutter/clutter_1.4.2.bb                   |    3 +-
>>   2 files changed, 65 insertions(+), 1 deletions(-)
>>   create mode 100644 recipes/clutter/clutter-1.4.2/fix-lib-location.patch
>>
>> diff --git a/recipes/clutter/clutter-1.4.2/fix-lib-location.patch b/recipes/clutter/clutter-1.4.2/fix-lib-location.patch
>> new file mode 100644
>> index 0000000..ad4589c
>> --- /dev/null
>> +++ b/recipes/clutter/clutter-1.4.2/fix-lib-location.patch
>> @@ -0,0 +1,63 @@
>> +diff --git a/clutter/cally/cally.pc.in b/clutter/cally/cally.pc.in
>> +index 224668f..b313ad6 100644
>> +--- a/clutter/cally/cally.pc.in
>> ++++ b/clutter/cally/cally.pc.in
>> +@@ -13,6 +13,6 @@ Name: Cally
>> + Description: Clutter Accessibility Implementation Library
>> + Version: @VERSION@
>> + Requires: atk clutter-1.0
>> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
>> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
>> + Cflags: -I${includedir}/clutter-${apiversion}
>> + Requires: ${requires}
>> +diff --git a/clutter/cogl/cogl/cogl.pc.in b/clutter/cogl/cogl/cogl.pc.in
>> +index 7975f4f..39358ca 100644
>> +--- a/clutter/cogl/cogl/cogl.pc.in
>> ++++ b/clutter/cogl/cogl/cogl.pc.in
>> +@@ -8,10 +8,11 @@ backend=@COGL_WINSYS@ #only kept for backward compatability
>> + winsys=@COGL_WINSYS@
>> + cogl=@COGL_DRIVER@ #only kept for backward compatability
>> + driver=@COGL_DRIVER@
>> ++soname_infix=@CLUTTER_SONAME_INFIX@
>> +
>> + Name: COGL
>> + Description: Clutter GL abstraction library (${winsys}/${driver} backend)
>> + Version: @VERSION@
>> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
>> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
>> + Cflags: -I${includedir}/clutter-${apiversion}
>> + Requires: ${requires}
>> +diff --git a/clutter/win32/clutter-win32.pc.in b/clutter/win32/clutter-win32.pc.in
>> +index ad9a2b4..36b7a6f 100644
>> +--- a/clutter/win32/clutter-win32.pc.in
>> ++++ b/clutter/win32/clutter-win32.pc.in
>> +@@ -7,10 +7,11 @@ requires=@CLUTTER_REQUIRES@
>> + backend=@CLUTTER_WINSYS@ #only kept for backward compatability
>> + winsys=@CLUTTER_WINSYS@
>> + cogl_driver=@COGL_DRIVER@
>> ++soname_infix=@CLUTTER_SONAME_INFIX@
>> +
>> + Name: Clutter
>> + Description: Clutter Core Library (${winsys}/${cogl_driver} backend)
>> + Version: @VERSION@
>> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
>> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
>> + Cflags: -I${includedir}/clutter-${apiversion}
>> + Requires: ${requires}
>> +diff --git a/clutter/x11/clutter-x11.pc.in b/clutter/x11/clutter-x11.pc.in
>> +index ad9a2b4..36b7a6f 100644
>> +--- a/clutter/x11/clutter-x11.pc.in
>> ++++ b/clutter/x11/clutter-x11.pc.in
>> +@@ -7,10 +7,11 @@ requires=@CLUTTER_REQUIRES@
>> + backend=@CLUTTER_WINSYS@ #only kept for backward compatability
>> + winsys=@CLUTTER_WINSYS@
>> + cogl_driver=@COGL_DRIVER@
>> ++soname_infix=@CLUTTER_SONAME_INFIX@
>> +
>> + Name: Clutter
>> + Description: Clutter Core Library (${winsys}/${cogl_driver} backend)
>> + Version: @VERSION@
>> +-Libs: -L${libdir} -lclutter-${winsys}-${apiversion}
>> ++Libs: -L${libdir} -lclutter-${soname_infix}-${apiversion}
>> + Cflags: -I${includedir}/clutter-${apiversion}
>> + Requires: ${requires}
>> diff --git a/recipes/clutter/clutter_1.4.2.bb b/recipes/clutter/clutter_1.4.2.bb
>> index d3159f4..12b6eb5 100644
>> --- a/recipes/clutter/clutter_1.4.2.bb
>> +++ b/recipes/clutter/clutter_1.4.2.bb
>> @@ -2,10 +2,11 @@ require clutter.inc
>>
>>   DEPENDS += "json-glib"
>>
>> -PR = "${INC_PR}.0"
>> +PR = "${INC_PR}.1"
>>
>>   SRC_URI = "http://source.clutter-project.org/sources/clutter/1.4/clutter-${PV}.tar.bz2 \
>>              file://test-conformance-fix.patch \
>> +           file://fix-lib-location.patch \
>>              ${INC_SRC_URI} \
>>             "
>>
>>
> ping&  some advertisement for this patch at
>
> http://bugzilla.clutter-project.org/show_bug.cgi?id=2549
> http://git.clutter-project.org/clutter/commit/?h=clutter-1.4&id=14cb728aa92518b35c1085cd728ecd17ef8a73fa
> http://git.clutter-project.org/clutter/commit/?id=615c200707411bad14d6864e679ec8c279ec276b

Applied, thanks for your patience.

-- 
Tom Rini
Mentor Graphics Corporation


