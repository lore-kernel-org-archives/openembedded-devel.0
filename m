Return-Path: <otavio.salvador@gmail.com>
Received: from mail-ob0-f178.google.com (mail-ob0-f178.google.com
	[209.85.214.178])
	by mail.openembedded.org (Postfix) with ESMTP id 8C1546AFD4
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  3 Jul 2013 18:30:52 +0000 (UTC)
Received: by mail-ob0-f178.google.com with SMTP id fb19so547575obc.9
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jul 2013 11:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type;
	bh=fEgSYi6Lc2S/1YLEFHurRNJBmS1+3nVoJgJRtDdhbd8=;
	b=c67fXp1gK8lR4cIQTjw7XBq9YJIdSg+j8v7G4TylIH1DAg9MJB4PxV5tYRnPuuOwb1
	MSX0j3RjsR5Eigwgr1uFXbj9aJZRAKX29SXyaipc2kzMqYJ8ptmABVx1u955Wu26hmUX
	lpQpmny6pnCtJ0SpQqVWPUPMT1wvPS4+udJwDMDk7txefTBsLK6O6r7BIrOE2pyZ2/9A
	5gYSSIFO7VB+1qDkrfP8kvaI8UKieUrDymOq8xsfldGgG284OM0mQIXObZFFKIc6jvCN
	cCR0Hc+8/BKmtrcqj+ZnbGBVlzQfeh2JxdrK8MST8oi3zo+bvCUeKuSceg9mDHiYUtj1
	GJ2g==
MIME-Version: 1.0
X-Received: by 10.182.118.129 with SMTP id km1mr2090129obb.15.1372876253379;
	Wed, 03 Jul 2013 11:30:53 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.182.98.133 with HTTP; Wed, 3 Jul 2013 11:30:53 -0700 (PDT)
In-Reply-To: <CAJTo0Lar2HO_cr6Az31Sqkxp=7ATSg+jG_b5DkD=t9vCUaJa0g@mail.gmail.com>
References: <1372864933-17240-1-git-send-email-otavio@ossystems.com.br>
	<CAJTo0LbQA+r7B0RVDy_0CJivi8H+3yktHUZqCFzz1=AcTkXDiw@mail.gmail.com>
	<CAP9ODKoyQfZRmikLwxVcxCXdtikVGNKk8DwRsfNaRURqp4+HPA@mail.gmail.com>
	<CAJTo0Lar2HO_cr6Az31Sqkxp=7ATSg+jG_b5DkD=t9vCUaJa0g@mail.gmail.com>
Date: Wed, 3 Jul 2013 15:30:53 -0300
X-Google-Sender-Auth: eSPIAbZs0NuXu3ZANY5L-qgvj10
Message-ID: <CAP9ODKpfZ51PorenwkNq1HccwU0N=3AtGzOAOC4yp1iE1=LJGw@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: "Burton, Ross" <ross.burton@intel.com>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe PATCH] lmbench: Add /run onto package
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 03 Jul 2013 18:30:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Wed, Jul 3, 2013 at 3:28 PM, Burton, Ross <ross.burton@intel.com> wrote:
> On 3 July 2013 17:46, Otavio Salvador <otavio@ossystems.com.br> wrote:
>>> This is part of base-files in oe-core master, so you shouldn't need
>>> this to create the /run directory.  Obviously any attempt at packaging
>>> files inside /run is doomed.
>>
>> It has a subdir on it.
>>
>> ...
>> lrwxrwxrwx root/root         0 2013-07-03 13:43 ./var/run -> /run
>> drwxr-xr-x root/root         0 2013-07-03 13:43 ./run/
>> drwxr-xr-x root/root         0 2013-07-03 13:43 ./run/lmbench/
>
> /run is volatile.  Both systemd (directly) and sysvinit (through
> fstab) put a tmpfs on /run, so that's not going to achieve much.

Ok; I will remove the /run and send a v2.

Thanks,

--
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://projetos.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

