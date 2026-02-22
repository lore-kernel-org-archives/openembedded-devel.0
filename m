Return-Path: <skandigraun@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13781C636C4
	for <webhook@archiver.kernel.org>; Sun, 22 Feb 2026 22:03:41 +0000 (UTC)
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.22974.1771797810781715456
 for <openembedded-devel@lists.openembedded.org>;
 Sun, 22 Feb 2026 14:03:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=XekJcWI1;
 spf=pass (domain: gmail.com, ip: 209.85.221.54, mailfrom: skandigraun@gmail.com)
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4359a302794so2729340f8f.1
        for <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 14:03:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771797809; x=1772402609; darn=lists.openembedded.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8La+lRRT36bigRQUn03gwfb4rnZwoxgCElhKC6P//R4=;
        b=XekJcWI1uSsmPzazGL4DBuOyHaVAAHPUtuFg7wC5WwRhpN64ipHpRWPc2ou6ln+KbZ
         b+SRkPuTiKCUyPRwfywJHTJl4pnlCOynCYhqmVNjP1FTdxqK7Vcj1f4PCWlxH6saLFQN
         u9Qlt/ERpEMUsBoapBRPELj4DucoClXGHTqJ96JkrskAjOCCdSGYkXoK8LlJPyEU96T5
         f6zpM/5eAOSLC8yLZz0u4+y49MuLFCpm5a04Jeaf8V+gHx3NGLyV3Vh9+a6M8oCSGhbp
         zNnWDe4z3Fp8Wy11HZKtpjtCHwcjgG2fG2yBeIvWYqdtV30J+My3D32kmoB9i6qw9K/+
         0Prw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771797809; x=1772402609;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8La+lRRT36bigRQUn03gwfb4rnZwoxgCElhKC6P//R4=;
        b=OqXqcHiJTfbZqAlUA6uAgVbu59KiJeAea8QNLyOOOTowAJN0xqNpeQrnI9XEr2fpLy
         JD+anw1p+Dsw4DJzBAIyPoOWTxWBnBKrYYEsTK7B7ldzzN4BumG9AsXHP7CHvLFCZ0vt
         ou3Ok4YMuiWUvBgrsXmBTGqygFrUWlBbt7zFmcP/WuaGNsFaSaRFQX/oU52fsNYzlFuO
         zme4LL7rNZDs2xuJ/3ZlBzduGRHHGnDnGUoRxI0HYoVSEdey57KUNvX6wn4/kDU8PPEk
         vh+58hgL1FXIzoT+b/XK9YqcBSMFdyuE5mTnpRVC31Cytw9T1vTPu90RDAU18f72zNlN
         l0CQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCv1cs+vL2tf3qNzUdYO1YG+MZvL/C38N/IBmrnvykTixNnwQOHEsTzc1HBANwmrsoyqqsoNKvfJE3aFxJqN/ifbg=@lists.openembedded.org
X-Gm-Message-State: AOJu0YwcrmuxpBGntl2I9lkiRQLZr5VMjEJXzm7aRqMiIgkXKUIhAnJY
	A1dE6y3dDcaGaxYEYFpeSwvItbJG/y9AKuNg55NX6889fKbRJpaSyqml
X-Gm-Gg: AZuq6aLSesi2AFbGRtCtkZZP57mHl+DYT4GjLlrok/W+G7VJb2hcOiogrouKyNULj4h
	8s2Wz5zM5sPFFQi7VMskag4JPxj93Ww4/ptyPK1uvlcz1gYBfr9YRSFnzjckdZouVS0sy0Csff7
	yyl7BsR3+mCL1IOYasmhaKB1hVqi3CFV/nb87BCAiuk5VeSSR11fldfMslP+TvIU3gWwNRTdgfe
	29mbjekbqzbS9wsETh56jciuRhj5H9LYezdz1+lKIAOTI6vzru8HeruKGGcIWvSJEYn9KYLdUA3
	RpbV8R6MpWk250xwUCKr1MZofukuvD+jv5xmNMnzB2bS5ceMkrvoS7OuwumVPFX319DnV7FBUVb
	ALI91UliCfGvEjMjcEAr2VD/H4dH0aOGuCPErerk2GfzTSUA4o8sJuU9j8WgLT6R1yJ437VjBsO
	UCgDvCcZOmyfc60mEjC5soTMyvz/pZ0ag=
X-Received: by 2002:a5d:64c7:0:b0:435:ae97:b37 with SMTP id ffacd0b85a97d-4396f18f61dmr13988190f8f.52.1771797808730;
        Sun, 22 Feb 2026 14:03:28 -0800 (PST)
Received: from [192.168.1.106] ([51.154.145.205])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4c977sm15388093f8f.32.2026.02.22.14.03.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Feb 2026 14:03:28 -0800 (PST)
Message-ID: <a11b45eb-1ee0-4274-9780-5a86105a7a1f@gmail.com>
Date: Sun, 22 Feb 2026 23:03:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [oe] [RFC_V2] [meta-oe]: Improving ext* sparse image generation:
 migrating from img2simg to ext2simg_android for ext* filesystem
To: ashishkumar.mishra@bmwtechworks.in,
 openembedded-devel@lists.openembedded.org
References: <rGsP.1771488393837852960.eVnE@lists.openembedded.org>
Content-Language: en-US
From: Gyorgy Sarvari <skandigraun@gmail.com>
In-Reply-To: <rGsP.1771488393837852960.eVnE@lists.openembedded.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Sun, 22 Feb 2026 22:03:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/124535

Personally I don't think that this is a controversial idea. Added a few
short notes inline.


On 2/19/26 09:06, AshishKumar Mishra via lists.openembedded.org wrote:
> Hello Community Members, 
>  
> I would like to propose a change to how we handle sparse image
> generation for ext* file-systems in OpenEmbedded, 
> specifically moving away from the generic img2simg tool toward the
> specialised ext2simg_android in the e2fsprogs [contrib/android]
>  
> *1) Problem*
> Currently, image_types_sparse.bbclass uses img2simg for all
> file-system types. 
> img2simg is a  tool that reads the raw image to find zero-filled blocks. 
> For ext* file-systems, this is inefficient compared to  ext2simg from
> e2fsprogs [contrib/android]
> which understands the file-system structure and uses the block bitmap
> to determine sparse areas.
>  
>  
> *2) History*
> Previously, 'ext2simg' was bundled within android-tools (v5.1 and older).
> The utility has since migrated to the e2fsprogs project (contrib/android).
> However, upstream e2fsprogs does not provide a build system for this tool,
> and it requires libsparse from android-tools to compile.
>  
>  
> *3) Proposed Changes*
> To implement this , below approach is proposed for feedback:
>  
> a. meta-oe (android-tools):
> Export libsparse, libbase, and liblog headers and libraries to the
> sysroot. Currently, these are often internal to the build.
> Reorganise header installation to ${includedir}/sparse to match the
> expected include paths for e2fsprogs contrib tools.
>  
> b.  meta-oe (ext2simg_android )
> Have created an fresh recipe which focus only on getting ext2simg.c
> compiled with andorid sparse.h 
> (as per suggestion on first RFC 
> openembedded-core@lists.openembedded.org | [RFC] Improving ext* sparse
> image generation: migrating from img2simg to ext4sparse for ext*
> filesystem
> <https://lists.openembedded.org/g/openembedded-core/topic/rfc_improving_ext_sparse/117715350> 
> )
> This would link against the exported libsparse from android-tools-native.
>  
> c. meta-oe (image_types_sparse.bbclass):
> Update CONVERSION_CMD:sparse to detect ext* types.
> Use  ext2simg from the e2fsprogs [contrib/android] for these types
> while falling back to img2simg for others (like f2fs).
>  
>  
> *4) Points for Discussion / Feasibility*
>      I am seeking feedback on the following:
>  
> *a. Build Integration: *
> In my PoC, I've used a manual ${CC} call in do_compile:append. 
> Would it be preferred to patch the e2fsprogs Makefile to handle this
> "contrib" tool more natively?

I'd say it depends on how complex the patch is. If it's a trivial one, a
patch could be okay. But usually patch update is a chore that no one
likes, and adding these commands to the recipe shows the intent also better.

>    
> *b. Library Handling: *
>   To ensure the native binary finds libsparse at image creation time,
> I am currently using LD_LIBRARY_PATH in the class. 
>   I suspect a better approach would be ensuring proper RPATH during
> the e2fsprogs build.
>   If members can help for any better way of doing this 

What happens if you add "-Wl,-rpath=../${baselib}
-Wl,-rpath=../../${baselib}" (or similar) to LDFLAGS?

>  
> *c. I have a working proof of concept using RPI4 build *
>    Attached along are the patch
> 001-meta-oe-image_types_sparse-use-ext2simg_android-for-.patch 
>    

e2fsprogs-ext4sparse.inc is missing from the attached patch.

>      
> *5) Logical layout of current POC *
> This commit bridges the gap between these two recipes:
> 1. android-tools:
>    - Updated to v29.0.6 and masked v5.1.1 to provide modern libraries.
>    - Modified do_install to export libsparse, libbase, and liblog
> headers and libraries to the sysroot, enabling external linking.
>  
> 2. image_types_sparse.bbclass:
>    - Updated CONVERSION_CMD to branch by filesystem type, calling
> ext2simg_android specifically for ext* images.
>    - Exported LD_LIBRARY_PATH to the native sysroot to ensure the
> ext2simg_android binary can locate its shared dependencies at runtime.
>  
> 3. Layer Configuration:
>    - Updated layer.conf to support dynamic-layers for SELinux and
> synchronized BBMASK entries to prioritize the updated tools.
>  
>  
> *6) Benefit :*
>     This reduces the time and cost involved while flashing Android RFS
> / Fastboot etc 
>     Even in CI/CD , which all adds to ease of usage and have monetary
> benefit involved with continous CI/CD 
>  
> Looking forward to thoughts / feedback from community members
>  
> Please do let me know if any specific platform or group needs to be
> addressed to have such discussion 
> If there is any specific meeting involved where i can join and
> explain, please do let me know 
> I can connect to team members and works as per suggestion from
> community to fine tune / rework if any specific changes community suggest 
>  
> Thanks , 
> Ashish Kumar Mishra 
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#124499): https://lists.openembedded.org/g/openembedded-devel/message/124499
> Mute This Topic: https://lists.openembedded.org/mt/117889188/6084445
> Group Owner: openembedded-devel+owner@lists.openembedded.org
> Unsubscribe: https://lists.openembedded.org/g/openembedded-devel/unsub [skandigraun@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>


