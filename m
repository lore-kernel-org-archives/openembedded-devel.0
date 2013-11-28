Return-Path: <diego.sueiro@gmail.com>
Received: from mail-ie0-f172.google.com (mail-ie0-f172.google.com
	[209.85.223.172])
	by mail.openembedded.org (Postfix) with ESMTP id 5AA6E610D4
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 22:03:04 +0000 (UTC)
Received: by mail-ie0-f172.google.com with SMTP id qd12so15059720ieb.31
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 28 Nov 2013 14:03:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type; bh=juIHbGky3RqfDImu+cUD8vQEidPOJMDjQTO4VekJTUw=;
	b=d1z6jhYV29apPcyOw0bQ4LgCyaUkSSUCEpRvIUUe7RDfnHZNnwvw3C2Kw1MrMs7ROg
	Je+CK2LDeRjJPxofQPKJn/oVSWfVCGoIcxKcq1UOign4MqlrANxDlfcz/IwhKBGaxiMU
	1AvkoA9rBZlOsBaLr0554A+vI4ZCjp1/fuGYsxdANeVsG2M+FoqSRIWdPTaoaLR+akbb
	uGCANek5u5w4FHKwaG8HCk2GpGfpEUWHhD0VkbqmxPviW1Ee5hd3oa8R8u3lf4tefJsY
	hl8jOmkQrIT4/7a7eSvLLZVHIy7y50eyOwOhZqEscvp9NEA/uwqRDiKcItzD4h8z5dol
	ufIA==
X-Received: by 10.43.151.12 with SMTP id kq12mr2809icc.55.1385676183565; Thu,
	28 Nov 2013 14:03:03 -0800 (PST)
MIME-Version: 1.0
Received: by 10.64.26.233 with HTTP; Thu, 28 Nov 2013 14:02:43 -0800 (PST)
In-Reply-To: <20131128190221.GD3724@deserted.net>
References: <CAMCfZKEEYRnDP36tKtn=rqXEdY3VVucDMv0FdYntjYmaw3=fMg@mail.gmail.com>
	<20131128182423.GC3724@deserted.net>
	<CAMCfZKFLW-FzmEDdquj2+H8ePnOOAZDGpoRPV+CPhD_VvzDW7Q@mail.gmail.com>
	<20131128190221.GD3724@deserted.net>
From: Diego Sueiro <diego.sueiro@gmail.com>
Date: Thu, 28 Nov 2013 20:02:43 -0200
Message-ID: <CAMCfZKGaTKreSQmLcmNMbUD0TeGWhCbFidBwUKq0SAPEAskeeA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Subject: Re: Change to vsftpd recipe
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
X-List-Received-Date: Thu, 28 Nov 2013 22:03:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Joe,

Looking at your commit, you are populating "/var/run/vsftpd/empty" using
the file "/etc/default/volatiles/99_vsftpd". This file is used in a
sysVinit system.

Since I'm using systemd, I believe that "/etc/default/volatiles/" is not
scanned by Yocto as you can see here:
http://git.yoctoproject.org/cgit.cgi/poky/plain/meta/recipes-core/initscripts/initscripts-1.0/populate-volatile.sh

So, I think we need an universal solution.

Regards,

--
*dS
Diego Sueiro

/*long live rock 'n roll*/


On Thu, Nov 28, 2013 at 5:02 PM, Joe MacDonald <joe@deserted.net> wrote:

> [Re: [oe] Change to vsftpd recipe] On 13.11.28 (Thu 16:52) Diego Sueiro
> wrote:
>
> > On Thu, Nov 28, 2013 at 4:24 PM, Joe MacDonald <joe@deserted.net> wrote:
> >
> > > Care to take a run at reverting 1c4921817 in your tree and see if that
> > > clears things up for you?  I'd do it myself but I'm waist-deep in a
> > > different investigation right now and it sounds like you might be able
> > > to do a quick test.
> > >
> >
> > Joe,
> >
> > I did not get this QA error.
> > The installed directory should be "/var/run/vsftpd/empty" and not
> > "/run/vsftpd/empty" as pointed on error message.
> > Did you added "install -d ${D}${localstatedir}/run/vsftpd/empty" on
> > do_install function?
>
> Yep, here's the modified do_install in its entirety:
>
> ------------------------------------------------------------------------
> do_install() {
>     install -d ${D}${sbindir}
>     install -d ${D}${mandir}/man8
>     install -d ${D}${mandir}/man5
>     oe_runmake 'DESTDIR=${D}' install
>     install -d ${D}${sysconfdir}
>     install -m 600 ${WORKDIR}/vsftpd.conf ${D}${sysconfdir}/vsftpd.conf
>     install -d ${D}${sysconfdir}/init.d/
>     install -m 755 ${WORKDIR}/init ${D}${sysconfdir}/init.d/vsftpd
>     install -d ${D}/${sysconfdir}/default/volatiles
>     install -m 644 ${WORKDIR}/volatiles.99_vsftpd
> ${D}/${sysconfdir}/default/volatiles/99_vsftpd
>
>     install -m 600 ${WORKDIR}/vsftpd.ftpusers ${D}${sysconfdir}/
>     install -m 600 ${WORKDIR}/vsftpd.user_list ${D}${sysconfdir}/
>     if ! test -z "${PAMLIB}" ; then
>         install -d ${D}${sysconfdir}/pam.d/
>         cp ${S}/RedHat/vsftpd.pam ${D}${sysconfdir}/pam.d/vsftpd
>         sed -i "s:/lib/security:${base_libdir}/security:"
> ${D}${sysconfdir}/pam.d/vsftpd
>         sed -i "s:ftpusers:vsftpd.ftpusers:" ${D}${sysconfdir}/pam.d/vsftpd
>     fi
>     install -d ${D}${localstatedir}/run/vsftpd/empty
> }
> ------------------------------------------------------------------------
>
> -J.
>
> >
> > Regards,
> >
> > --
> > *dS
> > Diego Sueiro
> >
> > /*long live rock 'n roll*/
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> -Joe MacDonald.
> :wq
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>

