Received: from mail-la0-f47.google.com ([209.85.215.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1TRmAE-0001Sq-To
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 17:49:39 +0200
Received: by mail-la0-f47.google.com with SMTP id h5so2496976lam.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:36:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1DyOfh7gKE5oar+Nu7x15zXBFwqLiVskU7zSHg4gBa8=;
	b=LyoQHLVn7b0wWzD5CWmhCHon2YUfJzr4PoUY3q1w2jdavW1PP/P78Pq5hzOouftcLs
	uZKIQeZA0ZGatkDvA82VUxmYke2zfPRJ2KuKRwLueSlz2H2bc/HHlhPxyUWC4em4+vpS
	J6c1YJao03ywXM9VvtUZZBvOtH1wAdffZeKVIzinkGCPf8vTaI4sJkY5NEKB4k6YK0Fb
	lnAItPLplNUKQCPzSOK0i28H8gXKPq7VvzmWj8U5i+ALwTr6pz+ywMKnw2s3R1cN+a2s
	p8XzMrZUowto5u+0FQwsQwTJaX8mLnLKOoIfiiE2dD6W9A5gKUOkUC1oPyB6GATUCzdE
	sYLA==
Received: by 10.112.24.6 with SMTP id q6mr9355293lbf.24.1351265767983;
	Fri, 26 Oct 2012 08:36:07 -0700 (PDT)
Received: from [192.168.1.101] ([37.191.128.59])
	by mx.google.com with ESMTPS id nr2sm580095lab.5.2012.10.26.08.36.05
	(version=SSLv3 cipher=OTHER); Fri, 26 Oct 2012 08:36:06 -0700 (PDT)
Message-ID: <508AADE4.2010409@gmail.com>
Date: Fri, 26 Oct 2012 17:36:04 +0200
From: =?ISO-8859-1?Q?Martin_Erts=E5s?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.9) Gecko/20121024 Thunderbird/10.0.9
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1351241920-15135-1-git-send-email-martiert@gmail.com>
	<1351241920-15135-2-git-send-email-martiert@gmail.com>
	<lybofpuwri.fsf@ensc-virt.intern.sigma-chemnitz.de>
	<CAJTo0LaxgdhkxtWRgpZ2-QY857myw-ZpdrDpi3kyxkfxQWfGvg@mail.gmail.com>
In-Reply-To: <CAJTo0LaxgdhkxtWRgpZ2-QY857myw-ZpdrDpi3kyxkfxQWfGvg@mail.gmail.com>
Subject: Re: [meta-systemd][PATCH v2 2/2] meta-systemd: ntp: Fix starting of ntpdate.service
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 26 Oct 2012 15:49:39 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 10/26/12 17:07, Burton, Ross wrote:
> On 26 October 2012 15:35, Enrico Scholz<enrico.scholz@sigma-chemnitz.de>  wrote:
>> Martin Ertsaas<martiert@gmail.com>  writes:
>>
>>>   Type=oneshot
>>> -ExecStart=/usr/bin/ntpd -q -g -x
>>> +ExecStart=/usr/bin/ntpdate pool.ntp.org
>> This should be made configurable. E.g.
>>
>>    Environment=NTPHOSTS=pool.ntp.org
>>    EnvironmentFile=-/etc/sysconfig/ntp.conf
>>    ExecStart=/usr/bin/ntpdate $NTPHOSTS
>  From http://www.pool.ntp.org/en/vendors.html:
>
> "To allow you to use the pool as the default time service in your
> application, we will set you up with special hostnames, for example
> 0.vendor.pool.ntp.org, 1.vendor.pool.ntp.org, 2.vendor.pool.ntp.org
> and 3.vendor.pool.ntp.org.
> You must absolutely not use the default pool.ntp.org zone names as the
> default configuration in your application or appliance."
>
> Someone -- probably someone on the TSC I suspect as a representative
> of the YP -- should register a vendor pool so we can default to
> 0.yocto.pool.ntp.org or something similar.
>
> Ross
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
That sounds like a good way to do it. Then we can simply use that as the 
default, and have the possibility to use an NTPHOST or something.

Should we leave this until someone registers a pool, or what would be a 
good default pool until someone does it?

- Martin


