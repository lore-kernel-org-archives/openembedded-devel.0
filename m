Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f177.google.com (mail-vc0-f177.google.com
	[209.85.220.177])
	by mail.openembedded.org (Postfix) with ESMTP id C55F96EC7F
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 17:52:07 +0000 (UTC)
Received: by mail-vc0-f177.google.com with SMTP id if17so2188976vcb.8
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 10:52:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=8deKihiOEz6eqbtkwDVPTG3ZQcmXGzRV62h8CgoU5lM=;
	b=o+NL+1/Oy7TTGF5iO1k6CQcjLUP27I12WaoCd1bey389B42A0S4LZAMV+DMY+Z3tfo
	3rOOvxLIZpo32iE+pTx8axEwWlXcYKcb6BJjuwmmSf+CODB7E3H5XRtal6uIe47gJd/F
	quq3VYUbeq5Bw6DHuodEzV5FTBmyp77peMwNQyG7JYIOix6eekZddkEgEsJBTiAL1NrY
	qtHBT0xMzYpiQWcvFt/1EGQXW8VG/4RRibytZ6lPx3F5kxRRGQoRBrenruK6PRLOOdKL
	HEP52Nntb1cpzNVPmQjlQBJwO4962JYFUER0cvA6JPNtRJqtWxqeP2UANoQdaG56JBWD
	oDbA==
MIME-Version: 1.0
X-Received: by 10.58.31.136 with SMTP id a8mr717226vei.20.1396547522814; Thu,
	03 Apr 2014 10:52:02 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 3 Apr 2014 10:52:02 -0700 (PDT)
Date: Thu, 3 Apr 2014 10:52:02 -0700
Message-ID: <CAFeBWL7vUgXu--hS3TArd7BfrgF-2VqvcY=mKzxXb4ohgqnh0Q@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: LXDM failure on master-next
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
X-List-Received-Date: Thu, 03 Apr 2014 17:52:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello everybody, my image has been booting into shell instead of LXDM ever
since I switched to master-next from Dora.

I believe LXDM is not compatible with the new systemd, but my knowledge is
limited. Here is what I gathered so far:

1.5 Dora:

root@overo:~$  cat log | grep -i lxdm
Jan 01 00:02:38 overo systemd[1]: Looking at job lxdm.service/start
conflicted_by=no
Jan 01 00:02:38 overo systemd[1]: Looking at job lxdm.service/stop
conflicted_by=no
Jan 01 00:02:38 overo systemd[1]: Fixing conflicting jobs by deleting
job lxdm.service/stop
Jan 01 00:02:38 overo systemd[1]: Installed new job lxdm.service/start as 89
Jan 01 00:02:48 overo systemd[1]: About to execute: /usr/sbin/lxdm
Jan 01 00:02:48 overo systemd[1]: Forked /usr/sbin/lxdm as 127
Jan 01 00:02:48 overo systemd[127]: Executing: /usr/sbin/lxdm
Jan 01 00:02:53 overo kernel[114]: [    4.286621] systemd[1]: Looking
at job lxdm.service/start conflicted_by=no
Jan 01 00:02:53 overo kernel[114]: [    4.286651] systemd[1]: Looking
at job lxdm.service/stop conflicted_by=no
Jan 01 00:02:53 overo kernel[114]: [    4.286682] systemd[1]: Fixing
conflicting jobs by deleting job lxdm.service/stop
Jan 01 00:02:53 overo kernel[114]: [    4.289398] systemd[1]:
Installed new job lxdm.service/start as 89
Jan 01 00:02:55 overo kernel[114]: [   15.754699] systemd[1]:
lxdm.service changed dead -> running
Jan 01 00:02:55 overo kernel[114]: [   15.754852] systemd[1]: Job
lxdm.service/start finished, result=done
Jan 01 00:02:55 overo systemd[1]: lxdm.service changed dead -> running
Jan 01 00:02:55 overo systemd[1]: Job lxdm.service/start finished, result=done
root@overo:~$

master-next:

root@overo:~$  cat systemd_log | grep -i lxdm
Jan 01 00:22:42 overo systemd[1]: Got message type=method_call
sender=n/a destination=org.freedesktop.systemd1
object=/org/freedesktop/systemd1/unit/lxdm_2eservice
interface=org.freedesktop.DBus.Properties member=GetAll cookie=1
reply_cookie=0 error=n/a
Jan 01 00:22:42 overo systemd[1]: Collecting lxdm.service
Jan 01 00:22:42 overo systemd[1]: Failed to send unit change signal
for lxdm.service: Transport endpoint is not connected
Jan 01 00:22:42 overo systemd[1]: Failed to send unit remove signal
for lxdm.service: Transport endpoint is not connected
root@overo:~$



Manually starting the service works. Adding the lxdm service to multi-user
target works also, however this feels like a hack.

Any pointers will be appreciated!

Thanks,

Adam

