Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web08.643.1611942933174626842
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 29 Jan 2021 09:55:33 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=N7L4tTBF;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: raj.khem@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id c1so7315708qtc.1
        for <openembedded-devel@lists.openembedded.org>; Fri, 29 Jan 2021 09:55:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to;
        bh=QI/Byf3YWPw5utYJokG2Vx8cVXu36pQz2ylryI2mCb4=;
        b=N7L4tTBF1n5IvoxLfbpVyx8TkEzZVzIYw16scnrY1P0/WGotoENPrndwQhT0CBoMFw
         27gaJYeWj60gIO+XtvhKX/8CrxOE+qVmmpZvWovpNMvIWDHQcDcroDojVKmfoV4Wq6BI
         v7wlD90FYXVW4Jc2QiplPAv1ZhnkcXSjeZISb6h+Ai+1dPTRqGbU0Fxa7l3pAZFHWW4L
         7gmsSltb3AK/fxKTr/AX1WUqwqXRc03SY+TcjGoNswEv/U2eNqMWNc/j+Y3LtMtyW4jV
         pZhPVGnLDMq5po9lvjaZZPAM3jfSJrMdw8T0i9D1E7ssmHYY5iqy73cOjq10uAwDNlyf
         3hrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to;
        bh=QI/Byf3YWPw5utYJokG2Vx8cVXu36pQz2ylryI2mCb4=;
        b=DS9u8F8HSgusp2F79DBrsivyeWrrFBcmhjZyjnvxPco6VXu8V+Syg+km++UYnVNMNW
         4ovNij4V3e5Ca1QCsDPCIaogJtjDKESR4lqQ3ND1aXbu8+wSu46soi0ZCjhcDo1s5l/N
         V9B2WafWN7gbNKYm8eLAUAd0SdgyivuVVe5FdAv3ujCtTn7FaQIn0YZJvQS1AcZooiJd
         SnwL8arCZ25wvBciB7w14qKIY5HPqsExyoV2Ifvv77k8+1pji9g4eIyVgjk6KHCvPCka
         wBzK54XcGRqYHT/SUBVq0Eyli2DxSRUgyGt2FuhT/cPQNepVYksgw9wRrjlM1re1GUe0
         s4KA==
X-Gm-Message-State: AOAM532YKYIAI4hbpbUhVMidpMQjBVCZClGb9PGrWjtE9TXk1ega7/34
	ne3wu1l5WE/oRP4uk2b9d3oKLbk6ZAiXBHS2Mfw=
X-Google-Smtp-Source: ABdhPJyYoqKH3dGHtvIjOQeUtb9afqEavRlh+84a1m64sQBfzQlL+PkBLbarOFOKzHWUAKRFiTupG7zd0tOdGhLEF6w=
X-Received: by 2002:ac8:5894:: with SMTP id t20mr5294081qta.194.1611942931575;
 Fri, 29 Jan 2021 09:55:31 -0800 (PST)
MIME-Version: 1.0
References: <20210129100359.vwoop7ksfrvfpmlb@vctlabs.com>
In-Reply-To: <20210129100359.vwoop7ksfrvfpmlb@vctlabs.com>
From: "Khem Raj" <raj.khem@gmail.com>
Date: Fri, 29 Jan 2021 09:55:05 -0800
Message-ID: <CAMKF1sqKS-1ANz9DBkDkn3MQgzA0FsW4GCAPgRsoBeUt5Fhw_g@mail.gmail.com>
Subject: Re: [oe] [meta-oe][PATCH] sip3: simplify recipe
To: "S. Lockwood-Childs" <sjl@vctlabs.com>, 
	openembeded-devel <openembedded-devel@lists.openembedded.org>
Content-Type: text/plain; charset="UTF-8"

Can you rebase it on top of master-next

On Fri, Jan 29, 2021 at 2:00 AM S. Lockwood-Childs <sjl@vctlabs.com> wrote:
>
> The custom configure block can be shared between target
> and native if you just configure the sysroot option accordingly
> and use STAGING_INCDIR to locate the python headers to build
> against.
>
> Signed-off-by: S. Lockwood-Childs <sjl@vctlabs.com>
> ---
>  meta-oe/recipes-devtools/sip/sip3_4.19.23.bb | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> index 320755b84..ae8df5055 100644
> --- a/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> +++ b/meta-oe/recipes-devtools/sip/sip3_4.19.23.bb
> @@ -19,24 +19,17 @@ PACKAGES += "python3-sip3"
>
>  BBCLASSEXTEND = "native"
>
> -do_configure_prepend_class-target() {
> -    echo "py_platform = linux" > sip.cfg
> -    echo "py_inc_dir = %(sysroot)/${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
> -    echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
> -    echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
> -    echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
> -    echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> -    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${STAGING_DIR_HOST} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
> -}
> +CONFIGURE_SYSROOT = "${STAGING_DIR_HOST}"
> +CONFIGURE_SYSROOT_class-native = "${STAGING_DIR_NATIVE}"
>
> -do_configure_prepend_class-native() {
> +do_configure_prepend() {
>      echo "py_platform = linux" > sip.cfg
> -    echo "py_inc_dir = ${includedir}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
> +    echo "py_inc_dir = ${STAGING_INCDIR}/python%(py_major).%(py_minor)${PYTHON_ABI}" >> sip.cfg
>      echo "sip_bin_dir = ${D}/${bindir}" >> sip.cfg
>      echo "sip_inc_dir = ${D}/${includedir}" >> sip.cfg
>      echo "sip_module_dir = ${D}/${libdir}/python%(py_major).%(py_minor)/site-packages" >> sip.cfg
>      echo "sip_sip_dir = ${D}/${datadir}/sip" >> sip.cfg
> -    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot=${STAGING_DIR_NATIVE}
> +    ${PYTHON} configure.py --configuration sip.cfg --sip-module PyQt5.sip --sysroot ${CONFIGURE_SYSROOT} CC="${CC}" CXX="${CXX}" LINK="${CXX}" STRIP="" LINK_SHLIB="${CXX}" CFLAGS="${CFLAGS}" CXXFLAGS="${CXXFLAGS}" LFLAGS="${LDFLAGS}"
>  }
>
>  do_install() {
> --
> 2.20.1
>
> 
>
