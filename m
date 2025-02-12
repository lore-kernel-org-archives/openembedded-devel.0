Return-Path: <raj.khem@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 420D9C02198
	for <webhook@archiver.kernel.org>; Wed, 12 Feb 2025 06:24:54 +0000 (UTC)
Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
 by mx.groups.io with SMTP id smtpd.web11.9205.1739341486804399297
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 11 Feb 2025 22:24:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=hFh+zjO8;
 spf=pass (domain: gmail.com, ip: 209.85.214.179, mailfrom: raj.khem@gmail.com)
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-21f6f18b474so55180725ad.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 11 Feb 2025 22:24:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739341486; x=1739946286; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Y9w5wYdAqlE0Zj+wURxZX7KAJfK+vwgKNB7NWOU7lj0=;
        b=hFh+zjO8mfrETwbFX2JOYTsf4pFjbm+uqR7ImqSeLFl4JHuLcrHFRhjcpGnzqIwhfJ
         WBJtwUy+AT7D2NQolgRVl2FLE/XG5KPOl48B+1RAHZHxJpwnuEUUFmSiZKmPN7ELjCTV
         xc3/QdT/B5px6BC32L2YcXDngIbwSTh5OYKROtaYTAv8A4i4L7l5RuHLjm0I7brDJvNJ
         L+gbyTh4XVPoqvMDAncSK8Q4gZiPur5bQANaeVoD2IhoY+FOss6XdUsFOyFhAe7HPAxo
         IPbJiZmX8be/Nn26h+pgiVn/At62hyJpaLS7GkOxUl+JZPa1+4IW/bIiUF2YMhFayeQl
         oziw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739341486; x=1739946286;
        h=content-transfer-encoding:in-reply-to:organization:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9w5wYdAqlE0Zj+wURxZX7KAJfK+vwgKNB7NWOU7lj0=;
        b=d5mOG2whK57DfgOxzLCCnF4Y2l6+jvXuz4mCbrkDzJDr3T9m1LPkKPWvLkY8Pwqf28
         epFpTKzmPBtYlQAhSieuD5/lClyx/71SIIMPmEB6kYKnfLs3TwWI1ItZoYHpxunEbS7B
         Nimtf15ESyBbCaWwwXKiKNnAIuVZMp/+CAAZ1PT+oNUCXzRdQxeoQZZ3Ryn4x9FFC1PC
         OX8Tb1/tQ0CfaEUV+gXl5Q4/n4IqgEX0w9ThO+EoFLidzgYJRb4zacPmGloWUXBVbXvk
         122NBqXelvWGfZ6A+1LVaMEYRZVj2w6MSBgnLBmtO0JqMI4BXff+s7TIMOdekYgvqZCt
         ow2Q==
X-Forwarded-Encrypted: i=1; AJvYcCXtwG7CxDeoTZrNnADBtsrXXuiL7FKoxe2fxSiR9wJ+lCQluqxDo2HanP1Ot8Yd86Gm0/o2PRuINFmrrbboCs0pCaQ=@lists.openembedded.org
X-Gm-Message-State: AOJu0Yy7iFSkfWZ8841qdPQPPL49ZCq+k4YNk2dygQOEjp7oZVYH9he6
	5M3/KSYwXx5uXD+8f4/CvRkEL5Q/PAajIpsba34hu6Q0tuBDPIqzwoSWOrsM
X-Gm-Gg: ASbGnct31RD6n4h9/NxEmC6DKYDLmo60hNXw6ICeU8ylTlmtyzGLflc3rBdLelIZOg2
	QmYzQnvC68aJT0UV6wSVnSuwBSBF9iUTnjvgsILGAXjyNGUjZaEtu12nsGWtwXT+AKpUe/x/UgI
	R0Qe+W/c/hoBM/BXq47RwnMsGKVN9W7nZJSQISrwdmCh2zUIG0E8QHWdmus1oqQxpxGcOauHc2q
	WQgbU0zqdIzlG5rGCJIrVkpTYFQLIleeOXJ1bOB3UqOPl2DeIXUAeEoduOZPMZmp3iJU6AFmM6h
	0dCFKLMswW09Q0yYxIiWX69I
X-Google-Smtp-Source: AGHT+IGLbkoVISzr/pmWmd0qv9uYhSVCzrcVIBDG70y2TFEv+vPq/uCG4DIaFSnfDCocBdAMC7Wzng==
X-Received: by 2002:a05:6a20:6a11:b0:1e1:ad39:cc5c with SMTP id adf61e73a8af0-1ee5c7472famr3792471637.14.1739341486038;
        Tue, 11 Feb 2025 22:24:46 -0800 (PST)
Received: from ?IPV6:2601:646:8201:fd20::7bcf? ([2601:646:8201:fd20::7bcf])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7307a29ecdesm6872399b3a.173.2025.02.11.22.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 11 Feb 2025 22:24:45 -0800 (PST)
Message-ID: <dc7d6bd8-fdab-4550-b55d-17dfb0a4a6b2@gmail.com>
Date: Tue, 11 Feb 2025 22:24:44 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [meta-gnome][PATCH] gegl: update 0.4.52 -> 0.4.54
To: f_l_k@t-online.de, openembedded-devel@lists.openembedded.org
References: <20250212045238.56929-1-f_l_k@t-online.de>
Content-Language: en-US
From: Khem Raj <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <20250212045238.56929-1-f_l_k@t-online.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Feb 2025 06:24:54 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/115439

this patch is not captured by lore and I do get

strange value in author field of the patch when I grab it from mail
and OE git refuses to accept '=' in author email address.

Please check your mail agent something is off

On 2/11/25 8:52 PM, Markus Volk via lists.openembedded.org wrote:
> This update is required for gimp-3.0.0-RC3
> 
> Signed-off-by: Markus Volk <f_l_k@t-online.de>
> ---
>   meta-gnome/recipes-gimp/gegl/{gegl_0.4.52.bb => gegl_0.4.54.bb} | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>   rename meta-gnome/recipes-gimp/gegl/{gegl_0.4.52.bb => gegl_0.4.54.bb} (96%)
> 
> diff --git a/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb b/meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb
> similarity index 96%
> rename from meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
> rename to meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb
> index 2717b3fa8f..a7f676ef05 100644
> --- a/meta-gnome/recipes-gimp/gegl/gegl_0.4.52.bb
> +++ b/meta-gnome/recipes-gimp/gegl/gegl_0.4.54.bb
> @@ -28,7 +28,7 @@ ANY_OF_DISTRO_FEATURES = "${GTK3DISTROFEATURES}"
>   SHPV = "${@gnome_verdir("${PV}")}"
>   
>   SRC_URI = "https://download.gimp.org/pub/${BPN}/${SHPV}/${BP}.tar.xz"
> -SRC_URI[sha256sum] = "ca212a0fc3e0448c5058c51ca6a0d30fdfb02971f21f28820da2b4901396000a"
> +SRC_URI[sha256sum] = "35a342f08c6b4379adee2cb5748fc4e307cfdcf2417c0bb17d6ca6543f238b1e"
>   
>   PACKAGECONFIG ??= "gexiv2 libraw librsvg pango poppler sdl2"
>   PACKAGECONFIG:class-native = "librsvg"
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#115435): https://lists.openembedded.org/g/openembedded-devel/message/115435
> Mute This Topic: https://lists.openembedded.org/mt/111138000/1997914
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [raj.khem@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


