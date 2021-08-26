Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
 by mx.groups.io with SMTP id smtpd.web12.34008.1629998239319645195
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 26 Aug 2021 10:17:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=bkA3vLSE;
 spf=pass (domain: gmail.com, ip: 209.85.216.44, mailfrom: raj.khem@gmail.com)
Received: by mail-pj1-f44.google.com with SMTP id u13-20020a17090abb0db0290177e1d9b3f7so7065992pjr.1
        for <openembedded-devel@lists.openembedded.org>; Thu, 26 Aug 2021 10:17:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:organization:in-reply-to:content-transfer-encoding;
        bh=HOO7gRXgdRWKUlN0jW5dr/lwWN4BR4Ure5uTDqUzgsw=;
        b=bkA3vLSElcMbyebEXaAxSlkQRO8a2tZW6lzNi0bf5M7UFQivFzmEvJpYm61c0GGZtU
         tz00Sx9jkrPtPKK+uyNAsWlLZYI51/arfmsRH0SushtB14i1ZFQONuH0W8nq48SJaKmH
         jgWnol/r6tLoWyuGGPKaWcRyA1J9bHZTVBeI78WfMG90HptDXDlMLYV4hzxrfH7YPAit
         OVGH8iIevJ8ecsiafpjF/y5d52H8Y3d7wmUVP/F7zu/sLsz2AoeztdMt8f2wBDISidUG
         7+BWugZ1ULWaHQtwSOOqUVkcJcxgshGsug+oE1+zfXn6yzQyXvU7XR/ZXb0vgBO34yOf
         nlow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=HOO7gRXgdRWKUlN0jW5dr/lwWN4BR4Ure5uTDqUzgsw=;
        b=WC0baL5PZzfrX2kuoImDw8daLiV1zQ87qL/ZGKYDScw8eYoaqeYQPL4vQcASN0lgHs
         famwIE2omuRrspd9Hqh48sDm/kg0jtXRSjSuoeUmlTnaQD1+hEwwZU7NiqJg0awL6ZER
         UP+M9rlfGfIvvFOkF8M0BpMylkX+ZSuqRe9ymzEEiD61pU11830OHnNqM5WmZdF8GHx1
         VJhrkYD0GvsoCPZbu9hiTnS9NvnfMHnfnZUkXFsySE9ie18uXdlT0O54EFT3SojsO/EE
         qVwQQ9vE/mgu9p+3og9OKnVZbd4sGp5gpWl3vAC7oub8B5Xd+9MZ3+gkVDPVndOgR20c
         Ur9g==
X-Gm-Message-State: AOAM531k4VyxfeQa6b91Hy38QRT95eOIbTa7W7SbBsl0Cvjc5EfwWQdL
	7awov4sk+LwDZrt/L0VnA3c=
X-Google-Smtp-Source: ABdhPJxeB/P8apfnqsRexHdCL6rNk7HsG/YI5Ksu1BwJbi69mPIdzCKJH8I2fs0LwYGSROaAS2gHGg==
X-Received: by 2002:a17:90a:4a95:: with SMTP id f21mr18303377pjh.122.1629998238794;
        Thu, 26 Aug 2021 10:17:18 -0700 (PDT)
Return-Path: <raj.khem@gmail.com>
Received: from ?IPV6:2601:646:9200:a0f0:7c29:e163:6b18:8f6c? ([2601:646:9200:a0f0:7c29:e163:6b18:8f6c])
        by smtp.gmail.com with UTF8SMTPSA id y12sm3453987pfa.25.2021.08.26.10.17.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Aug 2021 10:17:18 -0700 (PDT)
Message-ID: <bd46a4b1-2635-a88c-412b-9a3019933ea9@gmail.com>
Date: Thu, 26 Aug 2021 10:17:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:91.0)
 Gecko/20100101 Thunderbird/91.0.2
Subject: Re: [oe] [meta-python][RFC] python3-kivy
To: William Huang <whuang8933@gmail.com>,
 openembedded-devel@lists.openembedded.org
References: <YPWj.1629947089031625845.Nxxr@lists.openembedded.org>
From: "Khem Raj" <raj.khem@gmail.com>
Organization: HIMVIS LLC
In-Reply-To: <YPWj.1629947089031625845.Nxxr@lists.openembedded.org>
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 8/25/21 8:04 PM, William Huang wrote:
> Hello,
> I would like to request for comments on a Kivy recipe. Not sure how I 
> should include the recipe but I added it as an attachment for now. I've 
> also included a recipe that installs example programs into 
> /usr/share/kivy-examples/examples.
> 
> I managed to get it running on a Rockchip rk3399 in a X environment, as 
> well as on a imx8 in a Wayland environment, although I did need to 
> reconfigure libsdl2 to use GLES libraries and remove X11 package in the 
> case of the imx8.
> 
> Any feedback would be great! Not sure if the recipe would be good enough 
> to be included in the meta-python layer as well.
> 

These looks ok on quick look. You could perhaps merge them into a single 
recipe and use PACKAGES to separate out examples into its own output 
package.

Please format it into a patch and email the patch if you want to 
consider it to include into meta-python

> Thanks,
> William Huang
> 
> 
> 
> 
