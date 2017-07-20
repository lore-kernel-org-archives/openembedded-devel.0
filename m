Return-Path: <raj.khem@gmail.com>
Received: from mail-wm0-f66.google.com (mail-wm0-f66.google.com [74.125.82.66])
	by mail.openembedded.org (Postfix) with ESMTP id C417A7835F
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 17:02:31 +0000 (UTC)
Received: by mail-wm0-f66.google.com with SMTP id t3so3260391wme.2
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 20 Jul 2017 10:02:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc; bh=hJ7gk1YqDP3EvfEBhTi4sm91GnZlPaUZIiual4kA+Ew=;
	b=JyV2Poz1Xx2ZdbsvmGWZXVkSp6PeFN4daGkE/pBIaBPUqrsn/24aLSyASqByd2Zy36
	8Cy+RJtnXykmAJ5e54Se+6VF7+dzKluzRkKE9UO7C0NJ+G0J46jfXA+gm55EKRI2DOou
	NGaO0jNaxiXbZ3G7elW0aa8kmjFG3VdbmZ3uIUk04Hz86hkGZtuqY47aP3P4LAmAfFAZ
	meyemMSx/h9Z85105Gq7OAko4cbis5Kj9JwcilXZIvJuC5XR1TqYhr+fpoxXEtkATzDd
	tIVH6fmGKXIiFvyMdElAWwKEU4210puoPLCbIlIXUiQnvWL/CAVcDzqwT0xKQzgtpFt1
	CtrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc;
	bh=hJ7gk1YqDP3EvfEBhTi4sm91GnZlPaUZIiual4kA+Ew=;
	b=KM2GX54pNhk+scP4L8oICkIb7xF9ca1neCSfTJc6Ap8C7abN5QD+VNeck+tJoIWbzl
	LaU4gYLXw6hUbjXwCP3HMMI4To1r2c4bT3pZlTewDl35aITbnOmSKu68pCjCUeyAxmls
	L5RVBD37B4/mmRAG+sb9WUdoZVHWO3AUtWVY2kchzaKrKG2/OrsPNMs59CsCHk06mry7
	7ONZF+xYpahrA7Y7u6ctkZwKm9xgxBHRV9nCroRTtAVW3ladikwAfzgykrRFXGWgyMba
	DFVT0zrlMgjeZunoJNc++nO2M3kO4FewjhjpDiV9htnkR8lM4sJVYc3w2K/Uque0idMW
	UBqw==
X-Gm-Message-State: AIVw111YFYJ2E+ci061QO0DZHY+QSXyg6dno6Jwfm37QgJu03tRlF2Kp
	9JzbiO+znf7mHp6NjLkoc7FQZjs7/Q==
X-Received: by 10.80.145.2 with SMTP id e2mr3360584eda.8.1500563186177; Thu,
	20 Jul 2017 08:06:26 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.80.149.173 with HTTP; Thu, 20 Jul 2017 08:05:55 -0700 (PDT)
In-Reply-To: <CA+chaQfPrnGpgXibiSt9NS4qKH+eQt53oNcm+i-k=eAYWUscbg@mail.gmail.com>
References: <20170711063102.10384-1-raj.khem@gmail.com>
	<CA+chaQfPrnGpgXibiSt9NS4qKH+eQt53oNcm+i-k=eAYWUscbg@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Thu, 20 Jul 2017 11:05:55 -0400
Message-ID: <CAMKF1srwmf_7RdvJ7i-5NMK7smB-fTw-p9nP1HANpKRwj4uvNQ@mail.gmail.com>
To: Martin Jansa <martin.jansa@gmail.com>
Cc: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] qwt-qt5: Fix rpath issues
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
X-List-Received-Date: Thu, 20 Jul 2017 17:02:32 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, Jul 20, 2017 at 6:39 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> I still see QA warning from this one just on .debug file now:
>
>
> qwt-qt5-6.1.3: qwt-qt5-dbg: found library in wrong location:
> /usr/plugins/designer/.debug/libqwt_designer_plugin.so [libdir]
>

OK I guess we also need

INSANE_SKIP_${PN}-dbg += "libdir"

>
> On Tue, Jul 11, 2017 at 8:31 AM, Khem Raj <raj.khem@gmail.com> wrote:
>>
>> It errors out
>> usr/plugins/designer/libqwt_designer_plugin.so [rpaths]
>> QA Issue: qwt-qt5-plugins: found library in wrong location:
>> /usr/plugins/designer/libqwt_designer_plugin.so
>>
>> Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> ---
>>  recipes-qt/qwt/qwt-qt5.inc                |  5 +++--
>>  recipes-qt/qwt/qwt-qt5/remove_rpath.patch | 17 +++++++++++++++++
>>  2 files changed, 20 insertions(+), 2 deletions(-)
>>  create mode 100644 recipes-qt/qwt/qwt-qt5/remove_rpath.patch
>>
>> diff --git a/recipes-qt/qwt/qwt-qt5.inc b/recipes-qt/qwt/qwt-qt5.inc
>> index ee4fbd7..90bd9f7 100644
>> --- a/recipes-qt/qwt/qwt-qt5.inc
>> +++ b/recipes-qt/qwt/qwt-qt5.inc
>> @@ -8,9 +8,8 @@ LIC_FILES_CHKSUM =
>> "file://COPYING;md5=dac2743472b0462ff3cfb4af42051c88"
>>  DEPENDS = "qtbase qtsvg qttools"
>>
>>  SRC_URI = "${SOURCEFORGE_MIRROR}/qwt/qwt-${PV}.tar.bz2;name=qwt \
>> +           file://remove_rpath.patch \
>>            "
>> -#           file://qwt6.patch
>> -#           file://qwt6-fix-linking-with-ld-gold.patch"
>>
>>  S = "${WORKDIR}/qwt-${PV}"
>>
>> @@ -45,3 +44,5 @@ FILES_${PN}-plugins = "${prefix}/plugins/designer/*.so"
>>  FILES_${PN}-dbg += "${prefix}/plugins/designer/.debug"
>>  FILES_${PN}-doc += "${prefix}/doc"
>>
>> +INSANE_SKIP_${PN}-plugins += "libdir"
>> +
>> diff --git a/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
>> b/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
>> new file mode 100644
>> index 0000000..14b65d6
>> --- /dev/null
>> +++ b/recipes-qt/qwt/qwt-qt5/remove_rpath.patch
>> @@ -0,0 +1,17 @@
>> +Remove rpath from library, it points to build area which is not
>> +ok
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +
>> +Index: qwt-6.1.3/designer/designer.pro
>> +===================================================================
>> +--- qwt-6.1.3.orig/designer/designer.pro
>> ++++ qwt-6.1.3/designer/designer.pro
>> +@@ -83,7 +83,6 @@ contains(QWT_CONFIG, QwtDesigner) {
>> +         # compile the path for finding the Qwt library
>> +         # into the plugin. Not supported on Windows !
>> +
>> +-        QMAKE_RPATHDIR *= $${QWT_INSTALL_LIBS}
>> +         qwtAddLibrary($${QWT_OUT_ROOT}/lib, qwt)
>> +
>> +         contains(QWT_CONFIG, QwtDll) {
>> --
>> 2.13.2
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

