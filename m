Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web11.11592.1588948918912702352
 for <openembedded-devel@lists.openembedded.org>;
 Fri, 08 May 2020 07:41:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==397780a3020==cbing@cybernetics.com)
X-ASG-Debug-ID: 1588948900-0fb3b0649e6959b0001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id XK4euRE3oYX3yh1z; Fri, 08 May 2020 10:41:40 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTP id 9947813; Fri, 08 May 2020 10:41:40 -0400
Subject: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
To: Adrian Bunk <bunk@stusta.de>
X-ASG-Orig-Subj: Re: [oe] [meta-oe][PATCH] php: fix opcache link error in 7.4
Cc: openembedded-devel@lists.openembedded.org
References: <20200507142806.48643a47@cy-rd-cb>
 <20200508105610.GA8452@localhost>
From: "Claude Bing" <cbing@cybernetics.com>
Message-ID: <090c0075-c785-e3fd-1da4-c56518a64c0c@cybernetics.com>
Date: Fri, 8 May 2020 10:42:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <20200508105610.GA8452@localhost>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1588948900
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1804
X-Barracuda-BRTS-Status: 1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 5/8/20 6:56 AM, Adrian Bunk wrote:
> On Thu, May 07, 2020 at 02:28:06PM -0400, Claude Bing wrote:
>> Explicitly specifying -lrt is required for opcache to be linked against
>> the proper dependencies.  Additionally, PHP disables libdl when it
>> detects a cross-compilation environment for some reason.  In order to
>> load any type of extension, re-enabling libdl is required.
>> ...
>> +# link against librt (libc) if opcache is specified in order to avoid the
>> +# following error:
>> +# Failed loading /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined symbol: shm_unlink
>> +LDFLAGS += "${@ " -lrt " if bb.utils.contains('PACKAGECONFIG', 'opcache', 'true', 'false', d) else "" }"
> 
> Is this actually a bug in 0001-opcache-config.m4-enable-opcache.patch
> and should instead be fixed there?

Yes, that does indeed fix the problem.  Would you like me to reply to
this thread with a new patch, or create a different thread?

> 
> -    AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
> -    AC_MSG_RESULT([yes])
> -    PHP_CHECK_LIBRARY(rt, shm_unlink, [PHP_ADD_LIBRARY(rt,1,OPCACHE_SHARED_LIBADD)])
> +  AC_DEFINE(HAVE_SHM_MMAP_POSIX, 1, [Define if you have POSIX mmap() SHM support])
> 
> I would guess re-adding the PHP_CHECK_LIBRARY fixes your problem?
> 
>> +# Adding these flags enables dynamic library support, which is disabled by
>> +# default when cross compiling
>> +# See https://bugs.php.net/bug.php?id=60109
>> +CFLAGS += " -DHAVE_LIBDL "
>> +LDFLAGS += " -ldl "
>> +
>> ...
> 
> The linked PHP bug was closed in 2018 due to lack of feedback.

I have now added a comment to hopefully reopen the issue.

> 
> cu
> Adrian
> 
