Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
 by mx.groups.io with SMTP id smtpd.web11.789.1588740289523003449
 for <openembedded-devel@lists.openembedded.org>;
 Tue, 05 May 2020 21:44:49 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=cnGIvW1o;
 spf=pass (domain: gmail.com, ip: 209.85.208.174, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f174.google.com with SMTP id f11so924348ljp.1
        for <openembedded-devel@lists.openembedded.org>; Tue, 05 May 2020 21:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=D0sK2bWXifRRTUQ6nFuc2HI1KvmGAK6SmcHS2xYHmEk=;
        b=cnGIvW1oD0rIUeaeAYU1LYNy1hXgwDWQyDBonhKRlJL6mRSpnb9E3Sjj+q7L0Pyenh
         JHKsUzPVjFzFyXoOBrCxNkGxGy/0eX8vWWW1acKreV8dIwWGmhVVc6i122TMo+yZDsDo
         rlPtRq9/TPReciUaAEGZWoOfOBeYTDM6tcN0YnPIBI9yphOd0jwrymEhTR3WSe1XCF5j
         +BfbjojOrJSmKCAfC401xt29FNkIA/IuEmw40DP46UsvoZIkO+3jv908InRYYfSscCKp
         uVcdIuaKFVoicEkU3gfAQHgMyDcon8bmRr97Aep0H8tdzC4d/mG1DlJ4TMjyFStXdkYx
         UEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=D0sK2bWXifRRTUQ6nFuc2HI1KvmGAK6SmcHS2xYHmEk=;
        b=l6yvphK7Zkm3MV0p4huDZFFiwc5XevvFC15HDlD+02cxaBICy8vhHI9cbo+qrT/YUq
         jTYWyZUt/8zFAmPSmDv1mAM3hMxXRJ8dvri33xCXDjZ5p1YFcgQXBtaa+29Ew68Y/AAz
         bynLnHN4BGh4bFizY025zyxkHZ1YNKsKXEytkApyf4072QheN76bARCIx/NTdd89Vx2v
         XJtg79tSqttdJjwTOcyVeUNuwXPijcF0uYqaiRj9L7oDgNkJRzOvh7oW1skrHGt9179Y
         83poTZK83y5wkICKM6D7NIK9IqaWmmL2Da144eNFPYgNKH6Juv1VV1veeQRRW9y9CNgA
         5PuQ==
X-Gm-Message-State: AGi0PuZPbHXQ9zv3TKDOQirNBZCL2z11YLsNSb7p42ZeEOggMtZUwMoV
	4cV1RtSB0yKpgPalL+q56hI=
X-Google-Smtp-Source: APiQypJQBkrrkd60eEhzxhZLl34QG+CoowF+8RzslXYP/5LxYYExMOHW/EyFzgx1o8rjHth5Zap50Q==
X-Received: by 2002:a2e:2245:: with SMTP id i66mr3804978lji.191.1588740287573;
        Tue, 05 May 2020 21:44:47 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id m15sm444609lji.21.2020.05.05.21.44.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 05 May 2020 21:44:46 -0700 (PDT)
To: openembedded-devel@lists.openembedded.org,
 Richard Leitner <richard.leitner@skidata.com>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Subject: [meta-java] g0hl1n/jdk8-fix
Message-ID: <b01c2189-5348-feaa-a545-fc5fabdeb072@gmail.com>
Date: Wed, 6 May 2020 06:44:45 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hi Richard,

Just a FYI, I successfully built branch g0hl1n/jdk8-fix, 
00fa8f5e330679d00275010c7fda976caae44a00, on my Fedora 32 system with 
gcc v10.

I did notice a comment typo in commit, "openjdk-8: require GCC >= v6", 
0207ab72c58662cf7ac60229a5e14879b73f461d:

> diff --git a/recipes-core/openjdk/openjdk-8-common.inc b/recipes-core/openjdk/openjdk-8-common.inc
> index 084ead9..c78bb2a 100644
> --- a/recipes-core/openjdk/openjdk-8-common.inc
> +++ b/recipes-core/openjdk/openjdk-8-common.inc
> @@ -171,7 +171,7 @@ EXTRA_OECONF_append = "\
>  
>  # Since v6, GCC sets the default C++ standard to C++14 and introduces
>  # dead store elimination by default.
> -# Since v10, GCC defaults to -fcommon.
> +# Since v10, GCC defaults to -fno-common.
>  # OpenJDK 8 is not ready for either of these changes.
>  GLOBAL_FLAGS = "-fno-lifetime-dse -fno-delete-null-pointer-checks -fcommon"

/Jacob
