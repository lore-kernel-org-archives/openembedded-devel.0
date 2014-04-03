Return-Path: <adam.yh.lee@gmail.com>
Received: from mail-vc0-f172.google.com (mail-vc0-f172.google.com
	[209.85.220.172])
	by mail.openembedded.org (Postfix) with ESMTP id 761E56E77A
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  3 Apr 2014 19:54:40 +0000 (UTC)
Received: by mail-vc0-f172.google.com with SMTP id la4so2378499vcb.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 03 Apr 2014 12:54:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=WrnxIVXGZVr3pgOEjRAPNScHxxWnuJhqSklkbnKpnk0=;
	b=ah1zw6mW3Zxsv0bFVCsuKLbSSQVmU767ggA98FvMG49hS+xs4iCONbrqaBUzQQmvJl
	bizsnszyMZslyEQH7jL0BkwwEMbGUAY1z215gnXjIOuoDlQEbgtYIFFdl6diL7kxrGDj
	ZoYwbqWvoxfEabXhlqTagGAs/D68zvytU59k27Kro6wE6zkchHZZZ/90560VSDxJvcRV
	EyErwdqfaaC/+RkCqYmybk7XV95DOm0lPsDYDXpyCaSt6eDiMTisdjLh8twgH1A2Ef+d
	YdPSpRurVEiLc78tCiooeUPnVBowRnDEHVwpa7tzJZ/gM/1Pep0a5LmYi1m8Z7uRLWoN
	rcIw==
MIME-Version: 1.0
X-Received: by 10.59.9.38 with SMTP id dp6mr1200184ved.24.1396554880607; Thu,
	03 Apr 2014 12:54:40 -0700 (PDT)
Received: by 10.52.85.67 with HTTP; Thu, 3 Apr 2014 12:54:40 -0700 (PDT)
In-Reply-To: <CALbNGRQicuF8b4Aon-dzJ9bWDQW2v51WKMMCoZf4ex8Onfv1Yw@mail.gmail.com>
References: <CAFeBWL7vUgXu--hS3TArd7BfrgF-2VqvcY=mKzxXb4ohgqnh0Q@mail.gmail.com>
	<CALbNGRQicuF8b4Aon-dzJ9bWDQW2v51WKMMCoZf4ex8Onfv1Yw@mail.gmail.com>
Date: Thu, 3 Apr 2014 12:54:40 -0700
Message-ID: <CAFeBWL4CT0k4XYNH1bUwyrEiRSApPsPg+f2hHS5nZR+=b-p-ng@mail.gmail.com>
From: Adam Lee <adam.yh.lee@gmail.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
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
X-List-Received-Date: Thu, 03 Apr 2014 19:54:42 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Great! Exactly what I needed.

Thanks Andreas,

Adam


On Thu, Apr 3, 2014 at 11:08 AM, Andreas M=FCller <
schnitzeltony@googlemail.com> wrote:

> On Thu, Apr 3, 2014 at 7:52 PM, Adam Lee <adam.yh.lee@gmail.com> wrote:
> > Hello everybody, my image has been booting into shell instead of LXDM
> ever
> > since I switched to master-next from Dora.
> >
> > I believe LXDM is not compatible with the new systemd, but my knowledge
> is
> > limited. Here is what I gathered so far:
> >
> > 1.5 Dora:
> >
> > root@overo:~$  cat log | grep -i lxdm
> > Jan 01 00:02:38 overo systemd[1]: Looking at job lxdm.service/start
> > conflicted_by=3Dno
> > Jan 01 00:02:38 overo systemd[1]: Looking at job lxdm.service/stop
> > conflicted_by=3Dno
> > Jan 01 00:02:38 overo systemd[1]: Fixing conflicting jobs by deleting
> > job lxdm.service/stop
> > Jan 01 00:02:38 overo systemd[1]: Installed new job lxdm.service/start
> as 89
> > Jan 01 00:02:48 overo systemd[1]: About to execute: /usr/sbin/lxdm
> > Jan 01 00:02:48 overo systemd[1]: Forked /usr/sbin/lxdm as 127
> > Jan 01 00:02:48 overo systemd[127]: Executing: /usr/sbin/lxdm
> > Jan 01 00:02:53 overo kernel[114]: [    4.286621] systemd[1]: Looking
> > at job lxdm.service/start conflicted_by=3Dno
> > Jan 01 00:02:53 overo kernel[114]: [    4.286651] systemd[1]: Looking
> > at job lxdm.service/stop conflicted_by=3Dno
> > Jan 01 00:02:53 overo kernel[114]: [    4.286682] systemd[1]: Fixing
> > conflicting jobs by deleting job lxdm.service/stop
> > Jan 01 00:02:53 overo kernel[114]: [    4.289398] systemd[1]:
> > Installed new job lxdm.service/start as 89
> > Jan 01 00:02:55 overo kernel[114]: [   15.754699] systemd[1]:
> > lxdm.service changed dead -> running
> > Jan 01 00:02:55 overo kernel[114]: [   15.754852] systemd[1]: Job
> > lxdm.service/start finished, result=3Ddone
> > Jan 01 00:02:55 overo systemd[1]: lxdm.service changed dead -> running
> > Jan 01 00:02:55 overo systemd[1]: Job lxdm.service/start finished,
> result=3Ddone
> > root@overo:~$
> >
> > master-next:
> >
> > root@overo:~$  cat systemd_log | grep -i lxdm
> > Jan 01 00:22:42 overo systemd[1]: Got message type=3Dmethod_call
> > sender=3Dn/a destination=3Dorg.freedesktop.systemd1
> > object=3D/org/freedesktop/systemd1/unit/lxdm_2eservice
> > interface=3Dorg.freedesktop.DBus.Properties member=3DGetAll cookie=3D1
> > reply_cookie=3D0 error=3Dn/a
> > Jan 01 00:22:42 overo systemd[1]: Collecting lxdm.service
> > Jan 01 00:22:42 overo systemd[1]: Failed to send unit change signal
> > for lxdm.service: Transport endpoint is not connected
> > Jan 01 00:22:42 overo systemd[1]: Failed to send unit remove signal
> > for lxdm.service: Transport endpoint is not connected
> > root@overo:~$
> >
> >
> >
> > Manually starting the service works. Adding the lxdm service to
> multi-user
> > target works also, however this feels like a hack.
> >
> > Any pointers will be appreciated!
> >
> > Thanks,
> >
> > Adam
> See
> http://lists.openembedded.org/pipermail/openembedded-core/2014-April/0913=
80.html
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

