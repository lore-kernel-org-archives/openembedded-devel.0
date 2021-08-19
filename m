Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
 by mx.groups.io with SMTP id smtpd.web09.72948.1629394739613936145
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 19 Aug 2021 10:38:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mn+96QVv;
 spf=pass (domain: gmail.com, ip: 209.85.210.176, mailfrom: raj.khem@gmail.com)
Received: by mail-pf1-f176.google.com with SMTP id y190so6177603pfg.7
        for <openembedded-devel@lists.openembedded.org>; Thu, 19 Aug 2021 10:38:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=gbticVZIOQAyCOc0OUnDlyAUuwooutR0tNbOfFdTHZM=;
        b=mn+96QVvy0aeWwBfqtNMUlpNxA+FG+qWMZLW0DtoSDWk0EaEXVDCyRs/DPHC0ch/7h
         jHKGRCbTkXrCD9z7JdgCpiAd99AsTJ9Hhl0KORgvWg+h4kqzaR+NZ7sKrtv0kWltaLuh
         Kau/tqrE6wdCgRMSTsg1RQAWUHwU8IdWsM0c+FLCHOC0UhE2R1PeVFK980EAByJDZtVN
         PUROY1AvN9VcB3FcbrY9J//sejJZzWqN/1h8vn2D5zbGV7ZDm8h37ezvp/ME4NoTErCD
         fXIVlJ6Is1EBMt1SFgU0dTrwfqQdOXFLN2003WCWCWwBQGtoZiPFxZRj2BXQo2lTqRvJ
         LM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=gbticVZIOQAyCOc0OUnDlyAUuwooutR0tNbOfFdTHZM=;
        b=qztMUSpYV5/5A8rcZTWofuL/fs+P1L2Bhbm0EUHnSAUcVMD41Jnb+pAWG0UNnM3dFH
         +25s0erUDpcr7C3q8aMAbavgfU0I69Dx4ICw72PYc8kg87c3THKZFknumzyygtl5K9KJ
         bocZpF/kpxUgj0m5KlbJiBNwalU5VCjlllii0jCpwVlCh/Pli+VMyKZ5MTyYOZ+TOHsH
         kz5xS/2i6Qz9AZCN9+ZuUHVdh0vzoydNMyR5WiKxr3Tz5dghNf35+TjgLBoHcWnqr+Gr
         Fntf3WneVlAivYt2N/anSSb8Xv/gDMVTDfxu8y2t4zWk22NW/hFiZ4/CknsnTfK8ZkN7
         4DCA==
X-Gm-Message-State: AOAM533mTyHwM+lxd45hnNxBSnZaePUfDA2ULs1x70Zep2NbofA1fqCa
	GRt7gFfj76jndF7/cVkTI80=
X-Google-Smtp-Source: ABdhPJx1vR68v9qOXcMNzkhGosV5HROR93s7wM312M1eai0Oe99y+FGru77XjyRByAiFHIpWz8ag5A==
X-Received: by 2002:a05:6a00:1946:b0:3e3:2b82:8faa with SMTP id s6-20020a056a00194600b003e32b828faamr4416700pfk.79.1629394739089;
        Thu, 19 Aug 2021 10:38:59 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:18c3:56ba:32c4:2fdd? ([2601:646:9200:a0f0:18c3:56ba:32c4:2fdd])
        by smtp.gmail.com with UTF8SMTPSA id l185sm4107384pfd.62.2021.08.19.10.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Aug 2021 10:38:58 -0700 (PDT)
Message-ID: <5987cfa7-19a9-bb39-88d7-00275e20322d@gmail.com>
Date: Thu, 19 Aug 2021 10:38:57 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0
Subject: Re: [oe] [meta-oe][PATCH v2] bootchart: drop; unfetchable
To: Tim Orling <ticotimo@gmail.com>, openembedded-devel@lists.openembedded.org
References: <20210819173150.3607310-1-ticotimo@gmail.com>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20210819173150.3607310-1-ticotimo@gmail.com>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/19/21 10:31 AM, Tim Orling wrote:
> This was replaced by bootchart2 long ago in oe-core.
> gitorious.org no longer exists, so this is unfetchable.
> 
> Also, this has seen no development since bootchart2 was
> created.
> 

it needs to be removed from packagegroup-meta-oe as well.

> Signed-off-by: Tim Orling <ticotimo@gmail.com>
> ---
> 
> Changes since v1: add meta-oe to subject prefix
> 
>   ...-rudimentary-support-for-ARM-cpuinfo.patch | 49 -------------------
>   ...release-and-use-PRETTY_NAME-for-the-.patch | 39 ---------------
>   .../bootchart/bootchart_git.bb                | 21 --------
>   3 files changed, 109 deletions(-)
>   delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
>   delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
>   delete mode 100644 meta-oe/recipes-devtools/bootchart/bootchart_git.bb
> 
> diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
> deleted file mode 100644
> index 4581ef25fce..00000000000
> --- a/meta-oe/recipes-devtools/bootchart/bootchart/0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch
> +++ /dev/null
> @@ -1,49 +0,0 @@
> -From 8d40b4c286e005e82fa50b66fbbbde22b7e65e15 Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Sun, 20 May 2012 21:35:34 +0200
> -Subject: [PATCH 1/2] svg: add rudimentary support for ARM cpuinfo
> -
> -On ARM /proc/cpuinfo looks like this:
> -
> -root@beagleboneA3-0428:~# cat /proc/cpuinfo
> -Processor	: ARMv7 Processor rev 2 (v7l)
> -BogoMIPS	: 498.89
> -Features	: swp half thumb fastmult vfp edsp thumbee neon vfpv3 tls
> -CPU implementer	: 0x41
> -CPU architecture: 7
> -CPU variant	: 0x3
> -CPU part	: 0xc08
> -CPU revision	: 2
> -
> -Hardware	: am335xevm
> -Revision	: 0000
> -Serial		: 0000000000000000
> -
> -So no real way to get the actual SoC name, TI AM3359, but a lot better than 'Unknown'
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> -
> -Upstream-Status: submitted
> -
> - svg.c |    4 ++++
> - 1 file changed, 4 insertions(+)
> -
> -diff --git a/svg.c b/svg.c
> -index 80e0292..53724b2 100644
> ---- a/svg.c
> -+++ b/svg.c
> -@@ -178,6 +178,10 @@ void svg_title(void)
> - 				strncpy(cpu, &buf[13], 255);
> - 				break;
> - 			}
> -+			if (strstr(buf, "Processor")) {
> -+				strncpy(cpu, &buf[12], 255);
> -+				break;
> -+			}
> - 		}
> - 		fclose(f);
> - 	}
> ---
> -1.7.10
> -
> diff --git a/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch b/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
> deleted file mode 100644
> index f63d98aee51..00000000000
> --- a/meta-oe/recipes-devtools/bootchart/bootchart/0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch
> +++ /dev/null
> @@ -1,39 +0,0 @@
> -From e3adb4c312c6ba3491b7c173559efac7a53e5abc Mon Sep 17 00:00:00 2001
> -From: Koen Kooi <koen@dominion.thruhere.net>
> -Date: Sun, 20 May 2012 22:12:29 +0200
> -Subject: [PATCH 2/2] svg: open /etc/os-release and use PRETTY_NAME for the
> - 'Build' name
> -
> -Signed-off-by: Koen Kooi <koen@dominion.thruhere.net>
> ----
> -
> -Upstream-Status: Submitted
> -
> - svg.c |   11 +++++++++++
> - 1 file changed, 11 insertions(+)
> -
> -diff --git a/svg.c b/svg.c
> -index 53724b2..c675d84 100644
> ---- a/svg.c
> -+++ b/svg.c
> -@@ -194,6 +194,17 @@ void svg_title(void)
> - 		fclose(f);
> - 	}
> -
> -+	f = fopen("/etc/os-release", "r");
> -+	if(f) {
> -+		while (fgets(buf, 255, f)) {
> -+			if (strstr(buf, "PRETTY_NAME=")) {
> -+				strncpy(build, &buf[12], 255);
> -+				break;
> -+			}
> -+		}
> -+		fclose(f);
> -+	}
> -+
> - 	svg("<text class=\"t1\" x=\"0\" y=\"30\">Bootchart for %s - %s</text>\n",
> - 	    uts.nodename, date);
> - 	svg("<text class=\"t2\" x=\"20\" y=\"50\">System: %s %s %s %s</text>\n",
> ---
> -1.7.10
> -
> diff --git a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb b/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
> deleted file mode 100644
> index 2b75eaac9d8..00000000000
> --- a/meta-oe/recipes-devtools/bootchart/bootchart_git.bb
> +++ /dev/null
> @@ -1,21 +0,0 @@
> -DESCRIPTION = "Monitors where the system spends its time at start, creating a graph of all processes, disk utilization, and wait time."
> -HOMEPAGE = "http://meego.gitorious.org/meego-developer-tools/bootchart"
> -
> -LICENSE = "GPLv2"
> -LIC_FILES_CHKSUM = "file://COPYING;md5=fcb02dc552a041dee27e4b85c7396067"
> -
> -PV = "1.17"
> -PR = "r1"
> -PE = "1"
> -
> -SRC_URI = "git://gitorious.org/meego-developer-tools/bootchart.git;protocol=https \
> -           file://0001-svg-add-rudimentary-support-for-ARM-cpuinfo.patch \
> -           file://0002-svg-open-etc-os-release-and-use-PRETTY_NAME-for-the-.patch \
> -"
> -
> -SRCREV = "a2c7561d4060a9f075339bda89e793c76f2ff6dd"
> -
> -S = "${WORKDIR}/git"
> -
> -inherit autotools
> -
> 
> 
> 
> 
> 
