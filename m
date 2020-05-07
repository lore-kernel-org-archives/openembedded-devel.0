Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.9217.1588867172542857494
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 08:59:32 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==3967e7612ff==cbing@cybernetics.com)
X-ASG-Debug-ID: 1588867153-0fb3b0649e64ce90001-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id bxWH6MH71LbT3Nnb for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2020 11:59:13 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTP id 9945763 for openembedded-devel@lists.openembedded.org; Thu, 07 May 2020 11:59:13 -0400
Subject: Re: [oe] [meta-oe] php: error running opcache
From: "Claude Bing" <cbing@cybernetics.com>
X-ASG-Orig-Subj: Re: [oe] [meta-oe] php: error running opcache
To: openembedded-devel@lists.openembedded.org
Reply-To: openembedded-devel@lists.openembedded.org
References: <160CC6B663840241.1278@lists.openembedded.org>
Message-ID: <bded3d1a-d0b0-0fd7-a023-0d358650a721@cybernetics.com>
Date: Thu, 7 May 2020 11:59:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
In-Reply-To: <160CC6B663840241.1278@lists.openembedded.org>
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1588867153
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 1429
X-Barracuda-BRTS-Status: 1
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

I think that I have fixed the issue by overriding the following line in
php_7.4.4.bb:

PACKAGECONFIG[opcache] = "--enable-opcache,--disable-opcache"

  to

PACKAGECONFIG[opcache] = "--enable-opcache=shared,--disable-opcache"

Regards,

Claude Bing

On 5/7/20 10:53 AM, Claude Bing wrote:
> Hello all.  I am in the process of upgrading our Yocto installation to
> the Dunfell branch(es), and I came across a peculiar issue with PHP.  We
> use the opcache extension, but it is emitting the following error on
> startup:
> 
> Failed loading
> /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so:
> /usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined
> symbol: shm_unlink
> 
> Is anyone else having this issue in their environment?  I will continue
> researching to see what caused the problem to appear between Zeus and
> Dunfell, but I suspect it has something to do with the PHP 7.4 upgrade.
> 
> 
> 
> 
