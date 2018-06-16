Return-Path: <raj.khem@gmail.com>
Received: from mail-pf0-f195.google.com (mail-pf0-f195.google.com
	[209.85.192.195])
	by mail.openembedded.org (Postfix) with ESMTP id 286C4751F2
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 15:43:55 +0000 (UTC)
Received: by mail-pf0-f195.google.com with SMTP id y5-v6so6209419pfn.4
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 16 Jun 2018 08:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:references:from:organization:message-id:date:user-agent
	:mime-version:in-reply-to:content-language:content-transfer-encoding;
	bh=rRK32nmqgUhsmEghBfAi/FWD1BUYMC7371CPucG9Cs4=;
	b=UlCQjl4Fx72RH9bjQ036PIH+qdCLv+AOyhq/A1oQyD1eeKucDxcx5sYrxJC4P6hD1A
	tGFhOXOe1wjcRcjc33vfY1wNQj8jE/SSw1/u09w0BcWuLrNTWkyADDdH1pj6MwHWfAuY
	UniXrfkjduHnhdrKdW/fFlLEKdlEkq7R7ZX6J1F9MG1ba/1yNwkUcaJyqkrKpTLL7bhb
	ypvgENzg7206cKplK4asXksZJkUbCyWgP3Zr5429t0/hmwgSOfy41Gxc+HpgIjrjPyJv
	BXaKqpPC/1R1ykmwrSsvgu97l7ftyjwgl/KHsSiMYQZtmluTSPDmaVxWwQNK3un6cGKo
	iTfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:references:from:organization
	:message-id:date:user-agent:mime-version:in-reply-to
	:content-language:content-transfer-encoding;
	bh=rRK32nmqgUhsmEghBfAi/FWD1BUYMC7371CPucG9Cs4=;
	b=Y8qfPkxSisW0b7hjTYIb5KU6XxJugIgvXvMFOAyTV6+uLbNkvYPIUIv3PLqydKslfh
	sqz2CvEkSQVgJLB7ByjkXiqj7+XZbz2SJuHM5oYGID4Y3A2b8nNllEZkyhPYJ5P0Mz25
	kVQadFef9DIQ/TVSFE4YIt92/5EYG4WbPAskpJSrVhygLKIyVIVLBpsWOqDDiNfEgGkY
	fd7EkoWP01/uZDW0XsWSgIFPnAwUsUmEvMWdAseRi9rCMyTqJxpSCQIvvxZDflCiRvzw
	LDK070dsEPW/Y/SWMKTCRwknRk4BbWiXkzBZ2oAosEZncRwv6g1YrBxoiRKFy4P76itC
	umkQ==
X-Gm-Message-State: APt69E1fCsH2YM5N65Eo0WtsJTMS2NPvc5UATlBVa1I4jbG9HMypvDlM
	GX9DcfAWoyHi9Zb/3kLhsTNcjlXY
X-Google-Smtp-Source: ADUXVKI1jVHHBfeNUkXZdwS0PwpBffbjkJSA0f/CsDC1glUHsPzMM/kk7YqolBZQcopk+M0w4jqwtQ==
X-Received: by 2002:a65:48c9:: with SMTP id
	o9-v6mr5613130pgs.262.1529163836571; 
	Sat, 16 Jun 2018 08:43:56 -0700 (PDT)
Received: from hermes.local ([2601:646:877f:9499:9414:1129:bb93:e38c])
	by smtp.gmail.com with ESMTPSA id
	v85-v6sm19244665pgb.50.2018.06.16.08.43.55
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 16 Jun 2018 08:43:56 -0700 (PDT)
To: Ovidiu Panait <ovidiu.panait@windriver.com>,
	openembedded-devel@lists.openembedded.org
References: <1529050946-24921-1-git-send-email-ovidiu.panait@windriver.com>
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
Message-ID: <737e868b-2e97-4daf-44fe-fde1554f2624@gmail.com>
Date: Sat, 16 Jun 2018 08:43:08 -0700
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.0
MIME-Version: 1.0
In-Reply-To: <1529050946-24921-1-git-send-email-ovidiu.panait@windriver.com>
Subject: Re: [meta-networking][PATCH 1/1] net-snmp: Fix host contamination
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
X-List-Received-Date: Sat, 16 Jun 2018 15:43:56 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Ovidiu

On 6/15/18 1:22 AM, Ovidiu Panait wrote:
> If "/usr/local/ssl/include" directory exists on the host machine, net-snmp will
> also search the host openssl headers:
> 
> build/net-snmp/temp$ grep -i "/usr/local/ssl/include" log.do_compile
> x86_64-wrs-linux-libtool: compile: x86_64-wrs-linux-gcc ... -I/usr/local/ssl/include
> 
> Fix this by selecting the proper sysroot headers using
> --with-openssl=${STAGING_EXECPREFIXDIR}
> 
> Signed-off-by: Ovidiu Panait <ovidiu.panait@windriver.com>
> ---
>   meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> index 5c827bb86..6f6f19ac9 100644
> --- a/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> +++ b/meta-networking/recipes-protocols/net-snmp/net-snmp_5.7.3.bb
> @@ -66,7 +66,8 @@ EXTRA_OECONF = "--enable-shared \
>                   --with-install-prefix=${D} \
>                   --with-persistent-directory=${localstatedir}/lib/net-snmp \
>                   ${@oe.utils.conditional('SITEINFO_ENDIANNESS', 'le', '--with-endianness=little', '--with-endianness=big', d)} \
> -"
> +                --with-openssl=${STAGING_EXECPREFIXDIR} \
> +                "
>   
>   # net-snmp needs to have mib-modules=smux enabled to enable quagga to support snmp
>   EXTRA_OECONF += "--with-mib-modules=smux"
> @@ -121,8 +122,10 @@ do_install_append() {
>       install -m 0644 ${WORKDIR}/snmpd.service ${D}${systemd_unitdir}/system
>       install -m 0644 ${WORKDIR}/snmptrapd.service ${D}${systemd_unitdir}/system
>       sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
> +           -e "s@${STAGING_DIR_TARGET}@@g" \

this change here and similar change below is causing build failures 
since we are removing tags which are used to replace target sysroot 
especially for crossscripts which exposes the host paths e.g. -L/usr/lib 
into net-snmp-config files. This shows up later in dependent packages 
which fail to detect net-snmp features due to this host contamination 
e.g corosync, ntop, keepalived this is worse on x86_64 where it might 
still work but for musl targets you get straight errors everywhere.

If you can explain what these changes are fixing. May be we can come up 
with alternatives which dont cause the above said regression. Please 
rework through this patch

>           -i ${D}${bindir}/net-snmp-create-v3-user
>       sed    -e "s@^NSC_SRCDIR=.*@NSC_SRCDIR=.@g" \
> +           -e "s@${STAGING_DIR_TARGET}@@g" \
>              -e "s@\([^ ]*-fdebug-prefix-map=[^ ]*\)\1*@@g" \
>              -e "s@\([^ ]*--sysroot=[^ ]*\)\1*@@g" \
>              -e "s@\([^ ]*--with-libtool-sysroot=[^ ]*\)\1*@@g" \
> 

