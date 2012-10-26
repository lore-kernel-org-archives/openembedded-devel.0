Received: from mga06.intel.com ([134.134.136.21] helo=orsmga101.jf.intel.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1TRlid-0000p2-Lv
	for openembedded-devel@lists.openembedded.org;
	Fri, 26 Oct 2012 17:21:08 +0200
Received: from mail-ob0-f197.google.com ([209.85.214.197])
	by mga02.intel.com with ESMTP/TLS/RC4-SHA; 26 Oct 2012 08:07:36 -0700
Received: by mail-ob0-f197.google.com with SMTP id tb18so8700082obb.0
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 26 Oct 2012 08:07:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type:x-gm-message-state;
	bh=GRQ2rSt9mB6cC+m/rqF1d7kH1dAVd3yRQJMGpj6+jks=;
	b=oXkJp/GEXfcIED+Y48Ldm9NwK1MleDIf/jAcROpghIUakm5rsQ/qugImHlxlRC4XiS
	0QR6/l0xd8ANHVrr/3M9rCy+GRyDD3yspTkGkPH+fjAEssyJtYthgF+ZOR8BGa4XM5YG
	OyHhI2f6E8js36/LYvP7bkthtFkpKoyKKYgQjcQD1k5Co479CFwYi0bjHRAzWLab2ETB
	LD4S2TZ8EZAiDNW/g8rJRsozRxsEhnk7zZFGjU3rylO3M9Req8qru8nsRDMy7Sp/iCvD
	MJjb64cBeGTPs3qOGuSAIPIokzi2Wb29o97pEqZXp3xrErF4U36bQWPmYPhU1PnYuhkD
	lQhA==
Received: by 10.182.0.1 with SMTP id 1mr18508339oba.18.1351264055284;
	Fri, 26 Oct 2012 08:07:35 -0700 (PDT)
Received: by 10.182.0.1 with SMTP id 1mr18508329oba.18.1351264055092; Fri, 26
	Oct 2012 08:07:35 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.182.46.70 with HTTP; Fri, 26 Oct 2012 08:07:14 -0700 (PDT)
In-Reply-To: <lybofpuwri.fsf@ensc-virt.intern.sigma-chemnitz.de>
References: <1351241920-15135-1-git-send-email-martiert@gmail.com>
	<1351241920-15135-2-git-send-email-martiert@gmail.com>
	<lybofpuwri.fsf@ensc-virt.intern.sigma-chemnitz.de>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Fri, 26 Oct 2012 16:07:14 +0100
Message-ID: <CAJTo0LaxgdhkxtWRgpZ2-QY857myw-ZpdrDpi3kyxkfxQWfGvg@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQk/I9xKxOcUVLg6Um0sHpQdqvV8oOJoo88XKlpJoGZtgDXaW4WMFzupmm4cWs86lJY8dKe52gd1NamH5kKnZfNQJPJMcuwud2mBnyge+pBAkxJu9SXC7L4FAt62FruDTWz0jp31T+EHK43NnP6KDgz7q20Hs+Xmgp9HVHWC5NNLntzOSdHIW2GFd725jhVM/P2PSYMe
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
X-List-Received-Date: Fri, 26 Oct 2012 15:21:08 -0000
Content-Type: text/plain; charset=UTF-8

On 26 October 2012 15:35, Enrico Scholz <enrico.scholz@sigma-chemnitz.de> wrote:
> Martin Ertsaas <martiert@gmail.com> writes:
>
>>  Type=oneshot
>> -ExecStart=/usr/bin/ntpd -q -g -x
>> +ExecStart=/usr/bin/ntpdate pool.ntp.org
>
> This should be made configurable. E.g.
>
>   Environment=NTPHOSTS=pool.ntp.org
>   EnvironmentFile=-/etc/sysconfig/ntp.conf
>   ExecStart=/usr/bin/ntpdate $NTPHOSTS

From http://www.pool.ntp.org/en/vendors.html:

"To allow you to use the pool as the default time service in your
application, we will set you up with special hostnames, for example
0.vendor.pool.ntp.org, 1.vendor.pool.ntp.org, 2.vendor.pool.ntp.org
and 3.vendor.pool.ntp.org.
You must absolutely not use the default pool.ntp.org zone names as the
default configuration in your application or appliance."

Someone -- probably someone on the TSC I suspect as a representative
of the YP -- should register a vendor pool so we can default to
0.yocto.pool.ntp.org or something similar.

Ross


