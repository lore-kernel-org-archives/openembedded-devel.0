Return-Path: <ankit.tarot@gmail.com>
Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com
	[209.85.210.193])
	by mail.openembedded.org (Postfix) with ESMTP id A0251745A7
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 Oct 2018 04:04:27 +0000 (UTC)
Received: by mail-pf1-f193.google.com with SMTP id m77-v6so12507882pfi.8
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Oct 2018 21:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to; 
	bh=Kdr5nopVl8kor7iljvoFGogh5tSazr/TMRuazJwpulA=;
	b=LdCCbwFS8tVJ+bGmUn/991duvUZJPigW5xJnDAwMCYs5DTrCh4J39NrfgokvrOyMMR
	EFW33NsmPYJvRLrF+QmgzhZWLsDWwbvkqRisXHSwHS4ALKWIJVfKQna3FCP3ZZikFLae
	qRREhTAR2curbpaR7vdSb0kPmzRTBw1dG8qZBNsaoMVqyyWQvfqckZFfZaqc26SmOOQJ
	C2rvLTHNbe1mKudLtPCUPpjkZLKt0iypVnn03mT85WAytsS0xX5myZ06/PyK87zEkidM
	P8ZV5Wzd1o/fJKJ6iXUffp9tZEGu0sP15y62qHv8ENeMYGx46NJoaV5n5kHM36U9NI/n
	2SQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to;
	bh=Kdr5nopVl8kor7iljvoFGogh5tSazr/TMRuazJwpulA=;
	b=V0GDG61dArOBcEcEosBgvPkJUQySwBFz6gDl6dQEVUP9oMO0hLbJMpmT6nYAOBW1dc
	fuXvBw1QyyDdXkRAT0OR/IdEyk0ge3U/FOyqvSTPfUmxfheKQ4YY1LLdDVrM2Sgcumjc
	Eoi4orgqosIkiUq2bR/SUgF0no2V/5TZdKrIeYTTyJ09QMxddjmmFHe9RkvL/ZzsfrP8
	n1H57B2TXRLC2Ghrzj5zu78BmQPH0SyZs2lvXHAZMjhpjsQAywxoYWA+ENht/j7hl6nj
	NOaZDjtuxbcazF9R/7CTPLAW+Lta9bB+T7F0TTpE8VGcMTsJwwopdagP9JkYCLFc6HBH
	j3zA==
X-Gm-Message-State: ABuFfoipLB0J1/FJuhoOt8t35pbLp/wNiXgnjm/kUmW0jI6gYA/TCMos
	AA+h+G7kUGIus8aXL7nXjme7KvIukOZnYZwN9FF0jqSO
X-Google-Smtp-Source: ACcGV61bm6EdUfl045DIhNfxch9vwCGPvJSFkPXhnS40T9EV295bydg4jpdAJiEkDYYME2iNOH9hASM/jstT9GUPUOc=
X-Received: by 2002:a62:968a:: with SMTP id
	s10-v6mr24717553pfk.191.1539749068264; 
	Tue, 16 Oct 2018 21:04:28 -0700 (PDT)
MIME-Version: 1.0
References: <1539610432-25870-1-git-send-email-ankit.tarot@gmail.com>
In-Reply-To: <1539610432-25870-1-git-send-email-ankit.tarot@gmail.com>
From: Ankit Navik <ankit.tarot@gmail.com>
Date: Wed, 17 Oct 2018 09:34:17 +0530
Message-ID: <CAM_RqkNk9aFPGRN=2oWS+xHoLxZLm7Ht9Zcrc1VytV+xNqaSTw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] opencl-icd-loader: Initial recipe for OpenCL ICD loader
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
X-List-Received-Date: Wed, 17 Oct 2018 04:04:27 -0000
Content-Type: text/plain; charset="UTF-8"

Soft reminder
On Mon, Oct 15, 2018 at 7:07 PM Ankit Navik <ankit.tarot@gmail.com> wrote:
>
> This patch provides ICD loader library, ICD loader test binary
> and some helper library for test.
>
> Signed-off-by: Ankit Navik <ankit.tarot@gmail.com>
> ---
>  .../opencl-icd-loader/opencl-icd-loader_git.bb     | 45 ++++++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
>
> diff --git a/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> new file mode 100644
> index 0000000..7c49c8d
> --- /dev/null
> +++ b/meta-oe/recipes-core/opencl-icd-loader/opencl-icd-loader_git.bb
> @@ -0,0 +1,45 @@
> +SUMMARY  = "OpenCL ICD Loader"
> +DESCRIPTION = "OpenCL compute ICD Loader from Khronos Group"
> +LICENSE  = "Khronos"
> +LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=ec724732ce73269486574c718ef0c79b"
> +SECTION = "base"
> +
> +inherit pkgconfig cmake
> +
> +S = "${WORKDIR}/git"
> +SRCREV = "b342ff7b7f70a4b3f2cfc53215af8fa20adc3d86"
> +SRC_URI = "git://github.com/KhronosGroup/OpenCL-ICD-Loader.git"
> +
> +do_install () {
> +       install -d ${D}${bindir}
> +       install -m 0755 ${B}/bin/icd_loader_test ${D}${bindir}/
> +       chrpath -d ${D}${bindir}/icd_loader_test
> +       install -d ${D}${libdir}
> +       install -m 0644 ${B}/lib/libIcdLog.so ${D}${libdir}/
> +       install -m 0644 ${B}/lib/libOpenCLDriverStub.so ${D}${libdir}/
> +       chrpath -d ${D}${libdir}/libOpenCLDriverStub.so
> +       install -m 0644 ${B}/lib/libOpenCL.so.1.2 ${D}${libdir}/
> +       cd ${D}${libdir}
> +       ln -s libOpenCL.so.1.2 libOpenCL.so.1
> +       ln -s libOpenCL.so.1 libOpenCL.so
> +}
> +
> +PACKAGES = "opencl-icd-loader opencl-icd-loader-dev"
> +PACKAGES += "libicdlog libicdlog-dbg"
> +PACKAGE_DEBUG_SPLIT_STYLE = "debug-without-src"
> +
> +FILES_${PN} = " \
> +       ${bindir}/icd_loader_test \
> +       ${libdir}/libOpenCLDriverStub.so \
> +       ${libdir}/libOpenCL.so.1.2 \
> +"
> +FILES_${PN}-dev = " \
> +       ${libdir}/libOpenCL.so \
> +       ${libdir}/libOpenCL.so.1 \
> +"
> +
> +FILES_libicdlog = "${libdir}/libIcdLog.so"
> +FILES_libicdlog-dbg = "${libdir}/.debug/libIcdLog.so"
> +
> +DEPENDS = "opencl-headers"
> +RDEPENDS_${PN} = "libicdlog"
> --
> 1.9.1
>

