Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
 by mx.groups.io with SMTP id smtpd.web12.795.1600186522589176351
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 15 Sep 2020 09:15:22 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=sBWDC8/q;
 spf=pass (domain: gmail.com, ip: 209.85.210.193, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f193.google.com with SMTP id n14so2218571pff.6
        for <openembedded-devel@lists.openembedded.org>; Tue, 15 Sep 2020 09:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:organization:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=irVmEJrOUMWl0JPVbvSx5dGZ84CRex7M4dbBnMeRxl4=;
        b=sBWDC8/qj6H0pta1BUiSnCG/rDct+eL+59XRXUBJiHI8bH2WzZFujM9eHREdy7+kcM
         radCZZ3cy9eSlOEWUH0SBPOiiaA8X7UzIuBXIRBYK6GPmcGx9dtYfnfjmgTeceTbF11C
         j53C/txBclZKK8wG9etlmcECw9l3B/SRlIo0lnol/7uADAqm6cFQAWn1hFBfXSqT4slL
         JK4AYpChk86Pr2HubRXelCrlzPDLh2NOoh+uw7BSZ31i53Tiuyf3gEdgee0PsxJEgM04
         JY5E1MHwMb/4wwk7PjOvVo2IycBaMaPZ0yyN/WQGqb3wd299xCVa2TEo5Lfip7o5EYZw
         +Y/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=irVmEJrOUMWl0JPVbvSx5dGZ84CRex7M4dbBnMeRxl4=;
        b=n9cGZSn4HI9MrgBBjSUjo43YJ+xu38ipUfqJpmEZoYBxyV/Id9tPUHhVL7hMjtKzWW
         rvMX4/2IdJeEujPTiBZg7S+VNLR+k3aHwvfzoeJibepZ/R615jyY4fsIpSCp9eS9ZcbT
         lllnZbsmRtSYHw2asEhCfhwLOoBVkS13X3MQYo2nqGRUEBKKARK/Y0T+a0iVXJfQasfv
         DNWp0J2VdEkzGVO+mIl2gjKrb5Jtuy8mhnVW811xg0CQoppzWeEdS+vTxTUhhBfqkrjt
         ImmvzXE4tV2IuGdlnuPQAWWUCm4YrheQMHx7ANy871VCboZ18/T9j9B+KXd9XCRi9Ywp
         /Kmw==
X-Gm-Message-State: AOAM530KX6++8rzw67grG4HXGOrM4/3hhDcYzHtuU2TNsnwyz2Pa5kFU
	Bk1MIsvXSfIBTxcXFfecZ3giFjsEQ1K0jQ==
X-Google-Smtp-Source: ABdhPJyv4YLgaDfU5qUWM9OQ/DbrGz69G1E+O4Nsxmds+ECWiiyPmLouMjs0ZN2IyQhmcUSh/HedRg==
X-Received: by 2002:a63:3441:: with SMTP id b62mr15094120pga.191.1600186521640;
        Tue, 15 Sep 2020 09:15:21 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPv6:2601:646:9200:4e0:65be:52e2:459a:b2e1? ([2601:646:9200:4e0:65be:52e2:459a:b2e1])
        by smtp.gmail.com with ESMTPSA id i1sm14196906pfk.21.2020.09.15.09.15.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Sep 2020 09:15:21 -0700 (PDT)
Subject: Re: [oe][meta-oe][zeus][PATCH] rsyslog: fix wrong option of PACKAGECONFIG[valgrind]
To: haiqing <haiqing.bai@windriver.com>,
 openembedded-devel@lists.openembedded.org
References: <20200915091850.215655-1-Haiqing.Bai@windriver.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <28f8f9cc-985e-f457-8d2e-99c62147f264@gmail.com>
Date: Tue, 15 Sep 2020 09:15:20 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <20200915091850.215655-1-Haiqing.Bai@windriver.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-GB
Content-Transfer-Encoding: 7bit

this seems to be applicable on master as well. Can you check if we need 
it on master.

On 9/15/20 2:18 AM, haiqing wrote:
> The source configure.ac shows:
> --enable-valgrind: Enable somes special code that rsyslog core developers
>                     consider useful for testing.Do NOT use if you don't
>                     exactly know what you are doing, except if told so
>                     by rsyslog developers.
>                     NOT to be used by distro maintainers for building regular
>                     packages.
> 
> --without-valgrind-testbench:
>                     Don't use valgrind in testbench
> 
> PACKAGECONFIG[valgrind] should use '--without-valgrind-testbench'
> And after this fix, the code which removes the valgrind depended
> ptest cases for arm,mips is no longer needed.
> 
> Signed-off-by: Haiqing Bai <Haiqing.Bai@windriver.com>
> ---
>   meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb | 8 +-------
>   1 file changed, 1 insertion(+), 7 deletions(-)
> 
> diff --git a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> index 8287d2b7f..5b8af8d37 100644
> --- a/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> +++ b/meta-oe/recipes-extended/rsyslog/rsyslog_8.1910.0.bb
> @@ -74,7 +74,7 @@ PACKAGECONFIG[mysql] = "--enable-mysql,--disable-mysql,mysql5,"
>   PACKAGECONFIG[postgresql] = "--enable-pgsql,--disable-pgsql,postgresql,"
>   PACKAGECONFIG[libdbi] = "--enable-libdbi,--disable-libdbi,libdbi,"
>   PACKAGECONFIG[mail] = "--enable-mail,--disable-mail,,"
> -PACKAGECONFIG[valgrind] = "--enable-valgrind,--disable-valgrind,valgrind,"
> +PACKAGECONFIG[valgrind] = ",--without-valgrind-testbench,valgrind,"
>   
>   TESTDIR = "tests"
>   do_compile_ptest() {
> @@ -98,12 +98,6 @@ do_install_ptest() {
>       # fix the abs_top_builddir
>       sed -i 's,^\(abs_top_builddir = \).*,\1${PTEST_PATH}/,' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
>   
> -    # valgrind is not compatible with arm and mips,
> -    # so remove related test cases if there is no valgrind.
> -    if [ x${VALGRIND} = x ]; then
> -        sed -i '/udp-msgreduc-/d' ${D}${PTEST_PATH}/${TESTDIR}/Makefile
> -    fi
> -
>       # install test-driver
>       install -m 644 ${S}/test-driver ${D}${PTEST_PATH}
>   
> 
> 
> 
> 
