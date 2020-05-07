Received: from mail.cybernetics.com (mail.cybernetics.com [173.71.130.66])
 by mx.groups.io with SMTP id smtpd.web10.7704.1588863254560136454
 for <openembedded-devel@lists.openembedded.org>;
 Thu, 07 May 2020 07:54:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: cybernetics.com, ip: 173.71.130.66, mailfrom: btv1==3967e7612ff==cbing@cybernetics.com)
X-ASG-Debug-ID: 1588863153-0fb3b0649e649410002-aWHRdb
Received: from cybernetics.com ([10.10.4.126]) by mail.cybernetics.com with ESMTP id H3JN3SHaNjwZvLfN for <openembedded-devel@lists.openembedded.org>; Thu, 07 May 2020 10:52:47 -0400 (EDT)
X-Barracuda-Envelope-From: cbing@cybernetics.com
X-ASG-Whitelist: Client
Received: from [10.157.1.18] (HELO [192.168.184.100])
  by cybernetics.com (CommuniGate Pro SMTP 5.1.14)
  with ESMTP id 9945449 for openembedded-devel@lists.openembedded.org; Thu, 07 May 2020 10:52:34 -0400
To: openembedded-devel@lists.openembedded.org
From: cbing@cybernetics.com
Subject: [meta-oe] php: error running opcache
Message-ID: <e3a2f998-9889-da3e-1983-91c5d40572a2@cybernetics.com>
X-ASG-Orig-Subj: [meta-oe] php: error running opcache
Date: Thu, 7 May 2020 10:53:14 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.7.0
MIME-Version: 1.0
X-Barracuda-Connect: UNKNOWN[10.10.4.126]
X-Barracuda-Start-Time: 1588863167
X-Barracuda-URL: https://10.10.4.122:443/cgi-mod/mark.cgi
X-Barracuda-BRTS-Status: 1
X-Virus-Scanned: by bsmtpd at cybernetics.com
X-Barracuda-Scan-Msg-Size: 653
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Hello all.  I am in the process of upgrading our Yocto installation to
the Dunfell branch(es), and I came across a peculiar issue with PHP.  We
use the opcache extension, but it is emitting the following error on
startup:

Failed loading
/usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so:
/usr/lib/php7/extensions/no-debug-non-zts-20190902/opcache.so: undefined
symbol: shm_unlink

Is anyone else having this issue in their environment?  I will continue
researching to see what caused the problem to appear between Zeus and
Dunfell, but I suspect it has something to do with the PHP 7.4 upgrade.

-- 
Regards,

Claude Bing
