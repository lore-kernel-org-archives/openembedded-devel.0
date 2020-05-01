Received: from mail-wr1-f67.google.com (mail-wr1-f67.google.com [209.85.221.67])
 by mx.groups.io with SMTP id smtpd.web10.11697.1588344411015870359
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 01 May 2020 07:46:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=HGI4x7F9;
 spf=pass (domain: gmail.com, ip: 209.85.221.67, mailfrom: robert.berger.oe.devel@gmail.com)
Received: by mail-wr1-f67.google.com with SMTP id x18so11788767wrq.2
        for <openembedded-devel@lists.openembedded.org>; Fri, 01 May 2020 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=JRJnn5xDBShsLq1tX4sYek2XSylL8h3W4rJCdy8dEk8=;
        b=HGI4x7F9EfsCm6+VFbAGAwfYKTG4XFTKIuKEvAc4tvdAlr6Dw3G+sKNZRf4tszKqx6
         RokeUqCFevWG5sd4zgnK4IoqRwqH0cSu3WR8DMYJK6QLWompM7Zsc7JLjXmw+ULrrmZI
         dlDM3fjGv7fUeCv7t/L4GHrGLy0G+moEbX0CiUD9OsMrBi5Gj22y2DkO4LiFGAYmvZvv
         6L77K9gAS92hgW+Os6rl7OGysG5Kkd1tguslmqgqz/0jlneRPX+aC+RpGBLlj669lolx
         mZszrIZ5Wbe3FJV/sTdmGJH+qXXtT/aLk79YsBzEjm4v3Zvzc4UKKmim1p6/KCMLf+7q
         /z9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=JRJnn5xDBShsLq1tX4sYek2XSylL8h3W4rJCdy8dEk8=;
        b=pQJqfb7pMygEtwHN4dhtMCIU9OtsZnCmac8guMTq6YHbS52DSN8RKSayfIo6ZDJ1x+
         WtV+H/Wju2iAjcnO9ShNb3oCguenHzSogd8LqhGuVrjsXn1ByTraTTtrW/VdZYDh0Ab1
         Jc0RQ5tvcJfn80ayATdrSPx38tNbesGgdfAfmIGhwnCUraWFbHP1PlOxzAmzGSfMaywA
         txRTVkK1jl+exdN5TPviGjSu0PEtf3t7grRGYoqBfnFBUrh85vKBbdG57lqoi72f01xg
         D7+3fT8/zwDeXuyuXKYNrOhNGTWF6+7l1AiigZdBZGMy4/L+Fgs8YTQhGCmL9XGuvp7E
         0Pyg==
X-Gm-Message-State: AGi0PubZ4r9F79xt7Hc9427QkqjBOfXI5FAkJiiC4IkRFSrStrtGpRC3
	KSRJYwy7XVDqG6EO1d4Jwz8=
X-Google-Smtp-Source: APiQypL5pgg6a5vgSxi3MCGpHnA3F9Php+H6qdMZsJg01qOvzmTLOqS66zF4/0oJf+6vAL66Dd8pYA==
X-Received: by 2002:a5d:500b:: with SMTP id e11mr4452431wrt.272.1588344409532;
        Fri, 01 May 2020 07:46:49 -0700 (PDT)
Return-Path: <robert.berger.oe.devel@gmail.com>
Received: from [192.168.42.52] (ppp-94-65-43-120.home.otenet.gr. [94.65.43.120])
        by smtp.gmail.com with ESMTPSA id v16sm4185033wml.30.2020.05.01.07.46.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 01 May 2020 07:46:49 -0700 (PDT)
Subject: Re: [oe] [meta-java] host gcc-9, icetea-7 gcc-9 but how older gcc versions?
To: openembedded-devel@lists.openembedded.org,
 Richard Leitner <richard.leitner@skidata.com>
Cc: oecore.mailinglist@gmail.com
References: <7946cd8c-4a94-5e5a-7bdc-64963af21006@gmail.com>
 <20200429100259.GA249641@pcleri>
 <92bb1785-280d-ba90-9366-e2a7793d36d5@gmail.com>
 <20200429130233.GB249641@pcleri>
 <1550debd-8a7f-9a1a-0e12-9566b69405b4@gmail.com>
 <cbc9dc58-61a7-8133-698c-6570f85f85f6@gmail.com>
 <20200430211745.GC410632@pcleri>
 <160AE28F2E93B445.19580@lists.openembedded.org>
From: "Robert Berger" <robert.berger.oe.devel@gmail.com>
Message-ID: <0237cfe6-4162-a253-4799-678177dca1ab@gmail.com>
Date: Fri, 1 May 2020 17:46:47 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <160AE28F2E93B445.19580@lists.openembedded.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit

Hi,

Just for completeness I tried with a

gcc (Ubuntu 9.3.0-10ubuntu2~16.04) 9.3.0
Copyright (C) 2019 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.

same behavior. Compiler refuses to compile without my patch.

Just looking at the code I believe the compiler should complain unless 
you tell it otherwise.

That's what it complains about:

| In function ‘int fprintf(FILE*, const char*, ...)’,
|     inlined from ‘FormatRule* ADLParser::template_parse()’ at 
/workdir/build/container-x86-64-java/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/adlparse.cpp:3803:34:
| /usr/include/x86_64-linux-gnu/bits/stdio2.h:97:24: error: ‘%s’ 
directive argument is null [-Werror=format-overflow=]
|    97 |   return __fprintf_chk (__stream, __USE_FORTIFY_LEVEL - 1, __fmt,
|       |          ~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
|    98 |    __va_arg_pack ());
|       |    ~~~~~~~~~~~~~~~~~


If we look at the source code:

vim 
/workdir/build/container-x86-64-java/tmp/work/x86_64-linux/icedtea7-native/2.1.3-r1.0/icedtea-2.1.3/build/openjdk-boot/hotspot/src/share/vm/adlc/adlparse.cpp 
+3803

   // Debug Stuff
   if (_AD._adl_debug > 1) fprintf(stderr,"Format Rule: %s\n", desc);

At the beginnig of this method you can see:

//------------------------------template_parse-----------------------------------
FormatRule* ADLParser::template_parse(void) {
   char       *desc   = NULL;
   FormatRule *format = (new FormatRule(desc));
...

So I guess the compiler is wrong to complain, since desc could be NULL.

Regards,

Robert
