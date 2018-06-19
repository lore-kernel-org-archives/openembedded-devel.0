Return-Path: <Changqing.Li@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6BD1374601
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jun 2018 01:21:31 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id w5J1LMVZ011209
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Mon, 18 Jun 2018 18:21:23 -0700 (PDT)
Received: from [128.224.162.228] (128.224.162.228) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.399.0;
	Mon, 18 Jun 2018 18:21:21 -0700
To: Peter Kjellerstedt <peter.kjellerstedt@axis.com>, Khem Raj
	<raj.khem@gmail.com>
References: <1529036584-91801-1-git-send-email-changqing.li@windriver.com>
	<CAMKF1sroZXMAyOoNB9Fw89tYied94_1XjmT8WKHiMM=Zn7JWVw@mail.gmail.com>
	<1ae4712a-81a9-33e8-9b88-d4af699b13d9@windriver.com>
	<CAMKF1srnMVyP4HKbW3yCYud8tM2pJk7EMCLfY0WV4mv2q-U-eg@mail.gmail.com>
	<b2fe5454-1a27-4a3a-f3e8-20675d781b07@windriver.com>
	<cef6dde2213443c4a43883c93814cbf3@XBOX02.axis.com>
From: Changqing Li <changqing.li@windriver.com>
Message-ID: <1d2ece58-7117-94a2-07e1-418bfbaf7265@windriver.com>
Date: Tue, 19 Jun 2018 09:21:19 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <cef6dde2213443c4a43883c93814cbf3@XBOX02.axis.com>
X-Originating-IP: [128.224.162.228]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH] syslog-ng: fix syslog-ng startup problem with systemd
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 19 Jun 2018 01:21:31 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US



On 06/15/2018 06:41 PM, Peter Kjellerstedt wrote:
>> -----Original Message-----
>> From: openembedded-devel-bounces@lists.openembedded.org
>> [mailto:openembedded-devel-bounces@lists.openembedded.org] On Behalf Of
>> Changqing Li
>> Sent: den 15 juni 2018 10:08
>> To: Khem Raj <raj.khem@gmail.com>
>> Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
>> Subject: Re: [oe] [PATCH] syslog-ng: fix syslog-ng startup problem with
>> systemd
>>
>> On 06/15/2018 02:29 PM, Khem Raj wrote:
>>> On Thu, Jun 14, 2018 at 10:12 PM Changqing Li
>>> <changqing.li@windriver.com> wrote:
>>>> By the way,  I notice that there is no difference between master and
>>>> master-next  for "meta-oe/recipes-support/syslog-ng"
>>>>
>>> pwclient fails to cherry-pick this patch. and me solving conflicts
>>> here can be error prone.
>>>
>>>> Can I know why we need a patch based on master-next? Seems the patch
>>>> will same for master and master-next.
>>>>
>>> since master-next is where the queue for upcoming patches is and
>> sometimes there
>>> are related patches which should be sequenced. Look at my email sent
>>> about master-next
>>        Thanks.  I can see this conflicts commit now.  I use local mirror
>> just now,  so don't see the commit
>>        timely.  Now I got your mean. And I will resend a patch based on
>> master-next later.
>>
>>        //changqing li
>>>> Thanks.
>>>>
>>>> On 06/15/2018 12:48 PM, Khem Raj wrote:
>>>>> Can you rebase and resend it on top of master-next please
>>>>>
>>>>> On Thu, Jun 14, 2018 at 9:23 PM Changqing Li <changqing.li@windriver.com> wrote:
>>>>>> There are one error and one fail when run "systemctl status syslog-ng"
> A general recommendation for Git commits is to keep the line
> lengths within 72 characters. I do not know if OE has some
> actual requirements on this, but I've personally found it to be
> a good recommendation to make Git logs more readable.

Thanks, I will follow this next time.

>
>>>>>> Error opening control socket, bind() failed; socket='/var/run/syslog-ng/syslog-ng.ctl', error='No such file or directory (2)'
>>>>>> Failed to acquire /run/systemd/journal/syslog socket, disabling systemd-syslog source;
>>>>>>
>>>>>> 1. To fix the error info:
>>>>>>       if config with "--with-pidfile-dir=${localstatedir}/run/${BPN}", according to syslog-ng code
>>>>>>       (define PATH_CONTROL_SOCKET    SYSLOG_NG_PATH_PIDFILEDIR "/syslog-ng.ctl"), path of control socket also
>>>>>>       will be /var/run/syslog-ng, but after boot, there is no directory syslog-ng under /var/run,  so this
>>>>>>       will not work for systemd. here change initscript to /var/lib/syslog-ng, and remove --with-pidfile,
>>>>>>       so that sysVinit and systemd all use /var/lib/syslog-ng,  and also remove pid config in the syslog-ng service
>>>>>>       patch to align the pid file path. so both systemd and sysvinit can work.
> I don't think switching to /var/lib is the right thing to do.
> /var/run is tmpfs, but /var/lib may be persistent if the rootfs
> is writable.
>
> The non-existing directory is easily fixed by adding an ExecStartPre
> to the service file. We use this local patch to fix the problem:
>
>  From e4860d18a4e2811a5970a5ff8e66af993882172f Mon Sep 17 00:00:00 2001
> From: Yang Lyu <yangl@axis.com>
> Date: Mon, 15 May 2017 14:36:20 +0200
> Subject: [PATCH] syslog-ng: change path for persist file and pid file
>
> ---
>   contrib/systemd/syslog-ng.service | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/contrib/systemd/syslog-ng.service b/contrib/systemd/syslog-ng.service
> index 3e7a881..ecdca28 100644
> --- a/contrib/systemd/syslog-ng.service
> +++ b/contrib/systemd/syslog-ng.service
> @@ -4,7 +4,8 @@ Documentation=man:syslog-ng(8)
>   
>   [Service]
>   Type=notify
> -ExecStart=@SBINDIR@/syslog-ng -F $SYSLOGNG_OPTS -p @LOCALSTATEDIR@/run/syslogd.pid
> +ExecStartPre=@BASEBINDIR@/mkdir -p @LOCALSTATEDIR@/run/syslog-ng
> +ExecStart=@SBINDIR@/syslog-ng -F $SYSLOGNG_OPTS -p @LOCALSTATEDIR@/run/syslog-ng/syslogd.pid -R @LOCALSTATEDIR@/run/syslog-ng/syslog-ng.persist
>   ExecReload=@BASEBINDIR@/kill -HUP $MAINPID
>   EnvironmentFile=-/etc/default/syslog-ng
>   EnvironmentFile=-/etc/sysconfig/syslog-ng

Thanks. I will change like this if newly upgrade syslog-ng_3.15.1.bb 
still need this.
Also,  for the hard review part, I will make a new patch follow your 
suggestion.

//changqing





-- 
BRs

Sandy(Li Changqing)
+861084778653


