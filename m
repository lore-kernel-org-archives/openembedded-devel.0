Return-Path: <schnitzeltony@googlemail.com>
Received: from mail-ve0-f182.google.com (mail-ve0-f182.google.com
	[209.85.128.182])
	by mail.openembedded.org (Postfix) with ESMTP id 746646EA4A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 18:08:05 +0000 (UTC)
Received: by mail-ve0-f182.google.com with SMTP id jw12so551924veb.41
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 11:08:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=googlemail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=2CgV118xmUowzOnehuECyBA0jE/Q9l54/nGqyARQDUE=;
	b=CdoVm0YRdB4CjRGaBDKZGNieheIcnN92aI7kFzNygOvPj8RXjYgIhso+fgQe1fvM3I
	YPscEjYMMbakkNWiJoGlGgWR1EWcKyKFxKacFIo8/KFSuWHpIGfQdcY1k8vcCv1LCVXA
	i33moNUxfRwz2Ep/bXiiYh0JgylWl0ioWH6uehOKxaI/JkjMjScbhnzPuKIMfwOJCps9
	8ea0ZvcOUecpYav8mwrC6Q4B3LX1c4rqgUHUhTF7ndmpouzLeDRWAchTphsQEKsCsHc5
	kwHZ4h+MSExPckPWLx/DqCyEI5UDQMA3L/x88Lq9cVJVvy+Q+JB3/FAgylqt7bjHG2Un
	f1cQ==
MIME-Version: 1.0
X-Received: by 10.52.3.129 with SMTP id c1mr7385592vdc.37.1396548486403; Thu,
	03 Apr 2014 11:08:06 -0700 (PDT)
Received: by 10.52.120.4 with HTTP; Thu, 3 Apr 2014 11:08:06 -0700 (PDT)
In-Reply-To: <CAFeBWL7vUgXu--hS3TArd7BfrgF-2VqvcY=mKzxXb4ohgqnh0Q@mail.gmail.com>
References: <CAFeBWL7vUgXu--hS3TArd7BfrgF-2VqvcY=mKzxXb4ohgqnh0Q@mail.gmail.com>
Date: Thu, 3 Apr 2014 20:08:06 +0200
Message-ID: <CALbNGRQicuF8b4Aon-dzJ9bWDQW2v51WKMMCoZf4ex8Onfv1Yw@mail.gmail.com>
From: =?UTF-8?Q?Andreas_M=C3=BCller?= <schnitzeltony@googlemail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: LXDM failure on master-next
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
X-List-Received-Date: Thu, 03 Apr 2014 18:08:08 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Apr 3, 2014 at 7:52 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> Hello everybody, my image has been booting into shell instead of LXDM ever
> since I switched to master-next from Dora.
>
> I believe LXDM is not compatible with the new systemd, but my knowledge is
> limited. Here is what I gathered so far:
>
> 1.5 Dora:
>
> root@overo:~$  cat log | grep -i lxdm
> Jan 01 00:02:38 overo systemd[1]: Looking at job lxdm.service/start
> conflicted_by=no
> Jan 01 00:02:38 overo systemd[1]: Looking at job lxdm.service/stop
> conflicted_by=no
> Jan 01 00:02:38 overo systemd[1]: Fixing conflicting jobs by deleting
> job lxdm.service/stop
> Jan 01 00:02:38 overo systemd[1]: Installed new job lxdm.service/start as 89
> Jan 01 00:02:48 overo systemd[1]: About to execute: /usr/sbin/lxdm
> Jan 01 00:02:48 overo systemd[1]: Forked /usr/sbin/lxdm as 127
> Jan 01 00:02:48 overo systemd[127]: Executing: /usr/sbin/lxdm
> Jan 01 00:02:53 overo kernel[114]: [    4.286621] systemd[1]: Looking
> at job lxdm.service/start conflicted_by=no
> Jan 01 00:02:53 overo kernel[114]: [    4.286651] systemd[1]: Looking
> at job lxdm.service/stop conflicted_by=no
> Jan 01 00:02:53 overo kernel[114]: [    4.286682] systemd[1]: Fixing
> conflicting jobs by deleting job lxdm.service/stop
> Jan 01 00:02:53 overo kernel[114]: [    4.289398] systemd[1]:
> Installed new job lxdm.service/start as 89
> Jan 01 00:02:55 overo kernel[114]: [   15.754699] systemd[1]:
> lxdm.service changed dead -> running
> Jan 01 00:02:55 overo kernel[114]: [   15.754852] systemd[1]: Job
> lxdm.service/start finished, result=done
> Jan 01 00:02:55 overo systemd[1]: lxdm.service changed dead -> running
> Jan 01 00:02:55 overo systemd[1]: Job lxdm.service/start finished, result=done
> root@overo:~$
>
> master-next:
>
> root@overo:~$  cat systemd_log | grep -i lxdm
> Jan 01 00:22:42 overo systemd[1]: Got message type=method_call
> sender=n/a destination=org.freedesktop.systemd1
> object=/org/freedesktop/systemd1/unit/lxdm_2eservice
> interface=org.freedesktop.DBus.Properties member=GetAll cookie=1
> reply_cookie=0 error=n/a
> Jan 01 00:22:42 overo systemd[1]: Collecting lxdm.service
> Jan 01 00:22:42 overo systemd[1]: Failed to send unit change signal
> for lxdm.service: Transport endpoint is not connected
> Jan 01 00:22:42 overo systemd[1]: Failed to send unit remove signal
> for lxdm.service: Transport endpoint is not connected
> root@overo:~$
>
>
>
> Manually starting the service works. Adding the lxdm service to multi-user
> target works also, however this feels like a hack.
>
> Any pointers will be appreciated!
>
> Thanks,
>
> Adam
See http://lists.openembedded.org/pipermail/openembedded-core/2014-April/091380.html

