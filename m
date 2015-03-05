Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 347 seconds by postgrey-1.34 at layers.openembedded.org;
	Thu, 05 Mar 2015 07:38:58 UTC
Received: from retry101.mer-nm.internl.net (vif1-retry101.mer-nm.internl.net
	[217.149.192.107])
	by mail.openembedded.org (Postfix) with ESMTP id 1F01565C7B
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 07:38:58 +0000 (UTC)
Received: from smtp102.mer-nm.internl.net (smtp102.mer-nm.internl.net
	[217.149.192.138])
	by retry101.mer-nm.internl.net (Postfix) with ESMTP id 81FBC414B2
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:33:16 +0100 (CET)
Received: from amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.128])
	by smtp102.mer-nm.internl.net (Postfix) with ESMTP id C876A4033C
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:33:10 +0100 (CET)
X-Spam-Flag: NO
X-Spam-Score: -2.899
X-Spam-Level: 
X-Spam-Status: No, score=-2.899 tagged_above=-999 required=3.5
	tests=[BAYES_00=-2.9, URIBL_BLOCKED=0.001] autolearn=disabled
X-Spam-Languages: en la eo
Received: from smtp102.mer-nm.internl.net ([217.149.192.138])
	by amavisd-new (mailscanner05.wrt-nm.internl.net [217.149.192.160])
	(amavisd-new, port 10024)
	with ESMTP for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:33:09 +0100 (CET)
Received: from TOP-EX01.TOPIC.LOCAL (mail.topic.nl [82.204.13.182])
	(using TLSv1 with cipher AES128-SHA (128/128 bits))
	(No client certificate requested)
	by smtp102.mer-nm.internl.net (Postfix) with ESMTPS
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  5 Mar 2015 08:33:09 +0100 (CET)
Received: from [192.168.80.121] (192.168.80.121) by TOP-EX01.TOPIC.LOCAL
	(192.168.10.102) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Thu, 5 Mar 2015 08:34:24 +0100
Message-ID: <54F806B4.7040005@topic.nl>
Date: Thu, 5 Mar 2015 08:33:08 +0100
From: Mike Looijmans <mike.looijmans@topic.nl>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1425457252-8056-1-git-send-email-mike.looijmans@topic.nl>
	<20150304220348.GK2337@jama>
In-Reply-To: <20150304220348.GK2337@jama>
X-Originating-IP: [192.168.80.121]
X-EXCLAIMER-MD-CONFIG: 9833cda7-5b21-4d34-9a38-8d025ddc3664
X-EXCLAIMER-MD-BIFURCATION-INSTANCE: 0
Subject: Re: [meta-oe][PATCH] opencv: Upgrade to 2.4.11
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
X-List-Received-Date: Thu, 05 Mar 2015 07:38:59 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: quoted-printable

=EF=BB=BFOn 04-03-15 23:03, Martin Jansa wrote:
> On Wed, Mar 04, 2015 at 09:20:52AM +0100, Mike Looijmans wrote:
>> Upgrade OpenCV to the 2.4.11 release.
>>
>> Remove the opencv-fix-pkgconfig-generation patch which has been integrat=
ed upstream,
>> be it in modified form.
>> ---
>>   .../opencv/opencv-fix-pkgconfig-generation.patch   | 44 --------------=
--------
>>   meta-oe/recipes-support/opencv/opencv_2.4.bb       |  8 ++--
>>   2 files changed, 3 insertions(+), 49 deletions(-)
>>   delete mode 100644 meta-oe/recipes-support/opencv/opencv/opencv-fix-pk=
gconfig-generation.patch
>>
>> diff --git a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-=
generation.patch b/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconf=
ig-generation.patch
>> deleted file mode 100644
>> index d352778..0000000
>> --- a/meta-oe/recipes-support/opencv/opencv/opencv-fix-pkgconfig-generat=
ion.patch
>> +++ /dev/null
>> @@ -1,44 +0,0 @@
>> -Fix pkg-config generation
>> -
>> -Replace absolute library path with library name spec and library search
>> -path option.
>> -
>> -The fix has been provided by Ray Rashif (code.opencv.org/issues/1925)
>> -
>> -Upstream-Status: Pending
>> -
>> -diff -Nbaur OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake OpenCV-2.4=
.3/cmake/OpenCVGenPkgconfig.cmake
>> ---- OpenCV-2.4.3.orig/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:1=
4.243505926 +0000
>> -+++ OpenCV-2.4.3/cmake/OpenCVGenPkgconfig.cmake	2012-11-04 08:40:42.286=
649120 +0000
>> -@@ -10,7 +10,7 @@
>> - # --------------------------------------------------------------------=
-----------------------
>> - set(prefix      "${CMAKE_INSTALL_PREFIX}")
>> - set(exec_prefix "\${prefix}")
>> --set(libdir      "") #TODO: need link paths for OpenCV_EXTRA_COMPONENTS
>> -+set(libdir      "\${prefix}/${OPENCV_LIB_INSTALL_PATH}")
>> - set(includedir  "\${prefix}/${OPENCV_INCLUDE_INSTALL_PATH}")
>> - set(VERSION     ${OPENCV_VERSION})
>> -
>> -@@ -36,10 +36,11 @@
>> - ocv_list_reverse(OpenCV_EXTRA_COMPONENTS)
>> -
>> - #build the list of components
>> --set(OpenCV_LIB_COMPONENTS_ "")
>> -+set(OpenCV_LIB_COMPONENTS_ "-L\${libdir}")
>> - foreach(CVLib ${OpenCV_LIB_COMPONENTS})
>> -   get_target_property(libpath ${CVLib} LOCATION_${CMAKE_BUILD_TYPE})
>> -   get_filename_component(libname "${libpath}" NAME)
>> -+  get_filename_component(lname "${libpath}" NAME_WE)
>> -
>> -   if(INSTALL_TO_MANGLED_PATHS)
>> -     set(libname "${libname}.${OPENCV_VERSION}")
>> -@@ -52,7 +53,8 @@
>> -     set(installDir "${OPENCV_LIB_INSTALL_PATH}")
>> -   endif()
>> -
>> --  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} \${exec_prefix=
}/${installDir}/${libname}")
>> -+  string(REPLACE "libopencv" "-lopencv" lname "${lname}")
>> -+  set(OpenCV_LIB_COMPONENTS_ "${OpenCV_LIB_COMPONENTS_} ${lname}")
>> - endforeach()
>> -
>> - # add extra dependencies required for OpenCV
>> diff --git a/meta-oe/recipes-support/opencv/opencv_2.4.bb b/meta-oe/reci=
pes-support/opencv/opencv_2.4.bb
>> index 63d7c8b..e57f9a6 100644
>> --- a/meta-oe/recipes-support/opencv/opencv_2.4.bb
>> +++ b/meta-oe/recipes-support/opencv/opencv_2.4.bb
>> @@ -9,12 +9,10 @@ ARM_INSTRUCTION_SET =3D "arm"
>>
>>   DEPENDS =3D "python-numpy libtool swig swig-native python bzip2 zlib g=
lib-2.0"
>>
>> -SRCREV =3D "df8e28283f09825cca0c2902160b7abebcfe1b64"
>> -SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4 \
>> -           file://opencv-fix-pkgconfig-generation.patch \
>> -"
>> +SRCREV =3D "2c9547e3147779001811d01936aed38f560929fc"
>> +SRC_URI =3D "git://github.com/Itseez/opencv.git;branch=3D2.4"
>>
>> -PV =3D "2.4.9+git${SRCPV}"
>> +PV =3D "2.4.11+git${SRCPV}"
>
> Please Fix this issue first:
> WARNING: QA Issue: libopencv-highgui rdepends on jasper, but it isn't a
> build dependency? [build-deps]
> WARNING: QA Issue: libopencv-highgui rdepends on libdc1394, but it isn't
> a build dependency? [build-deps]

I didn't get any warnings, which platform did you use?
I guess the recipe needs some explicit "disable" calls, it probably=20
auto-detected these on your system.


>
>>   S =3D "${WORKDIR}/git"
>>
>> --
>> 1.9.1
>>
>> --
>>=20

Met vriendelijke groet / kind regards,

Mike Looijmans
System Expert


TOPIC Embedded Systems
Eindhovenseweg 32-C, NL-5683 KH Best
Postbus 440, NL-5680 AK Best
Telefoon: (+31) (0) 499 33 69 79
Telefax:  (+31) (0) 499 33 69 70
E-mail: mike.looijmans@topic.nl
Website: www.topic.nl

Please consider the environment before printing this e-mail

Topic zoekt gedreven (embedded) software specialisten!
http://topic.nl/vacatures/topic-zoekt-software-engineers/

_______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>


