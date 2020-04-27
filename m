Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web11.1957.1587975989334419186
 for <openembedded-devel@lists.openembedded.org>;
 Mon, 27 Apr 2020 01:26:29 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=s/mibiBf;
 spf=pass (domain: gmail.com, ip: 209.85.208.179, mailfrom: jacob.kroon@gmail.com)
Received: by mail-lj1-f179.google.com with SMTP id b2so16592288ljp.4
        for <openembedded-devel@lists.openembedded.org>; Mon, 27 Apr 2020 01:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-language:content-transfer-encoding;
        bh=IW/nk4gLvik66QRIxpOyHZjGIQnWRGlqGm1yCt7TI6Y=;
        b=s/mibiBfuCUKwNu8xUxjvUx0vMNG2ApOQ2SBTrlVwJs4Q2UQgzlyqbmZRv0UzSwR/k
         VkTVNU39/kv7T/GKJY6f8ToQK2hH8Ur7VBaTir77SSbGc0epYVILceNMyr9fQCUb4cCT
         6wCwexYGxzrk80CNRVOq1eX7PQpJcHKP6UZrzURyogt934+cZ2jO1FvIhb0s11XN4Pup
         +cJeQWTbNQEQ/aN7ao06eQcdN1h+ikrNszepaSzoaQBVSre7sT83i6Ux9/pn97GiEAy5
         4Kdg35dUt5g1V8jK6Z0p0XIGTpujcbvbu8sykRlxEUwGYKOtl8n2ZBVw/djf8aRNOdmG
         CDmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=IW/nk4gLvik66QRIxpOyHZjGIQnWRGlqGm1yCt7TI6Y=;
        b=DwU8t18y7TS5fJspDNba/0EXhB+aorzu2UX4QpuGDaJyzdB1TTo25bl3HScAQnyxrq
         PVjUUtFeX7Xw0p34ZXZ32hkxw5uL9Bk0+sDY6dv8ex+pnTskmS4a3e7hnEOE4JOEXoGF
         90XkawP2dVbwEgHJ0dOQ3VFaaw8QdqOc1XwYbbB03zma35CT/7s4qqLSkajj1FULWA7y
         adNVtY+aVt+lY31JlOg6CmcbZvRLbjfT/lD8N8O9fK2cnhPzzhZKqgGlJ05Nbl/2YyEe
         2f8kL0I/fB1Vbb8m2LJM2mkZFuhyWh1zW7wJzi5g+ZxG5EoaL7DOb1DJC+4bbhIZnK2x
         Vzcw==
X-Gm-Message-State: AGi0PuYWFoThNkZpuFwtPw1Xrrf8QILXBPSt96hiFylyDbpseReir3Ox
	Vevv3sQetvNuIC2h8D46oTaFZVMY
X-Google-Smtp-Source: APiQypISI4tXx9nIiwVkRs1zt+zA+DSQM7BUo+X3YgnzVrPIukk/boAQgXBptVEFIfCbqY49zoSvkw==
X-Received: by 2002:a2e:2c11:: with SMTP id s17mr13254853ljs.119.1587975986927;
        Mon, 27 Apr 2020 01:26:26 -0700 (PDT)
Return-Path: <jacob.kroon@gmail.com>
Received: from localhost.localdomain ([213.185.29.22])
        by smtp.gmail.com with ESMTPSA id j8sm10603848lfk.88.2020.04.27.01.26.25
        for <openembedded-devel@lists.openembedded.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Apr 2020 01:26:26 -0700 (PDT)
Subject: Re: [oe] [meta-java][PATCH] openjdk-8: update to latest ga version 252
To: openembedded-devel@lists.openembedded.org
References: <20200420084632.3229835-1-richard.leitner@skidata.com>
 <20200427062736.GA6062@pcleri>
From: "Jacob Kroon" <jacob.kroon@gmail.com>
Message-ID: <826e1c97-8061-653b-096b-d8ba5636a799@gmail.com>
Date: Mon, 27 Apr 2020 10:26:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200427062736.GA6062@pcleri>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 4/27/20 8:27 AM, Richard Leitner wrote:
> fyi: This patch has been added to master-next.
> 
> Any test results are welcome!
> 

I think this breaks building openjre:

> WARNING: openjdk-8-native-252-r0 do_fetch: Checksum mismatch for local file /home/jkroon/Downloads/yocto/openjdk8-252-langtools-jdk8u252-ga.tar.bz2
> Cleaning and trying again.
> WARNING: openjdk-8-native-252-r0 do_fetch: Renaming /home/jkroon/Downloads/yocto/openjdk8-252-langtools-jdk8u252-ga.tar.bz2 to /home/jkroon/Downloads/yocto/openjdk8-252-langtools-jdk8u252-ga.tar.bz2_bad-checksum_2cde0f920e96038c8fe27af3e802bcd90b894a2feb37fed0604cc53787807dfe
> WARNING: openjre-8-242-r0 do_fetch: Checksum mismatch for local file /home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2
> Cleaning and trying again.
> WARNING: openjre-8-242-r0 do_fetch: Renaming /home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2 to /home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2_bad-checksum_633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece
> WARNING: openjre-8-242-r0 do_fetch: Checksum failure encountered with download of https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u242-ga.tar.bz2;downloadfilename=openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2;name=openjdk - will attempt other sources if available
> ERROR: openjre-8-242-r0 do_fetch: Fetcher failure for URL: 'https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u242-ga.tar.bz2;downloadfilename=openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2;name=openjdk'. Checksum mismatch!
> File: '/home/jkroon/Downloads/yocto/openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2' has sha256 checksum 633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece when a83f8daa2afece63bf7ae95cfbca91ef765424c40b9f5b45e4a3c2d4da0f7a95 was expected
> If this change is expected (e.g. you have upgraded to a new version without updating the checksums) then you can use these lines within the recipe:
> SRC_URI[openjdk.sha256sum] = "633f1d20d4d8d36fea1680140b5514ab153096a19c306b812fbbd19314c8dece"
> Otherwise you should retry the download and/or check with upstream to determine if the file has become corrupted or otherwise unexpectedly modified.
> ERROR: openjre-8-242-r0 do_fetch: Fetcher failure for URL: 'https://hg.openjdk.java.net/jdk8u/jdk8u/archive/jdk8u242-ga.tar.bz2;downloadfilename=openjdk8-242-jdk8u-jdk8u242-ga.tar.bz2;name=openjdk'. Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in: /tmp/ramdisk/tmp-master-glibc/work/i686-oe-linux/openjre-8/242-r0/temp/log.do_fetch.15248
> ERROR: Task (/home/jkroon/Projects/tmp-linux/build/../meta-java/recipes-core/openjdk/openjre-8_242.bb:do_fetch) failed with exit code '1'
> Waiting for 1 running tasks to finish:
> 0: openjdk-8-native-252-r0 do_fetch (pid 15246)   0% |

/Jacob
