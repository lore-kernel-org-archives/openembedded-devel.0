Return-Path: <denis@denix.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46FE2C433FE
	for <webhook@archiver.kernel.org>; Wed, 12 Oct 2022 19:28:41 +0000 (UTC)
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
 by mx.groups.io with SMTP id smtpd.web11.1449.1665602913753316619
 for <openembedded-devel@lists.openembedded.org>;
 Wed, 12 Oct 2022 12:28:34 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: denix.org, ip: 64.68.198.64, mailfrom: denis@denix.org)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F104240DE3;
	Wed, 12 Oct 2022 19:28:32 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vr5YtESthxk8; Wed, 12 Oct 2022 19:28:32 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-80-88.washdc.fios.verizon.net [100.15.80.88])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D53E940DD6;
	Wed, 12 Oct 2022 19:28:31 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 2F7BA174A38; Wed, 12 Oct 2022 15:28:29 -0400 (EDT)
Date: Wed, 12 Oct 2022 15:28:29 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Armin Kuster <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe] [meta-oe][kirkstone][PATCH] audit: Install audit.h from
 audit package.
Message-ID: <20221012192829.GG22689@denix.org>
References: <20220923021317.1987661-1-jpuhlman@mvista.com>
 <CAMKF1soPiM5Tvd3EDkp0v++BM8SJ9i0M0iuP7gRF8KBuNgWbMQ@mail.gmail.com>
 <cf167e15-dc26-8204-a9be-acac1845dcb8@mvista.com>
 <6fe4ae19-24e1-e212-4f38-ea5767e4f8bd@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
In-Reply-To: <6fe4ae19-24e1-e212-4f38-ea5767e4f8bd@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Content-Transfer-Encoding: quoted-printable
List-Id: <openembedded-devel.lists.openembedded.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <openembedded-devel@lists.openembedded.org>; Wed, 12 Oct 2022 19:28:41 -0000
X-Groupsio-URL: https://lists.openembedded.org/g/openembedded-devel/message/99148

On Sun, Sep 25, 2022 at 10:59:57AM -0400, Armin Kuster wrote:
>=20
>=20
> On 9/22/22 23:38, Jeremy Puhlman wrote:
> >Yup.
> >
> thanks for the feedback.
>=20
> commit has been backported.

I see this in kirkstone-next - any ETA when it will merge to kirkstone br=
anch?=20
Thanks!


> -armin
> >On 9/22/2022 8:25 PM, Khem Raj wrote:
> >>does this backport fix it for you
> >>
> >>https://patchwork.yoctoproject.org/project/oe/patch/20220921081916.17=
313-1-mikko.rapeli@linaro.org/
> >>
> >>
> >>On Thu, Sep 22, 2022 at 10:13 PM Jeremy Puhlman
> >><jpuhlman@mvista.com> wrote:
> >>>Source: MontaVista Software, LLC
> >>>MR: 121884
> >>>Type: Defect Fix
> >>>Disposition: Submitted to meta-oe
> >>>ChangeID: 2708329947da5ec2f96a8478771f56cfce95f616
> >>>Description:
> >>>
> >>>The last upgrade to audit, changed libaudit.h to use "audit.h", whic=
h
> >>>makes the build work for this package, but breaks any other package
> >>>trying to use libaudit.h, like libsemanage.
> >>>
> >>>build/tmp/work/aarch64-montavista-linux/libsemanage/3.3-r0/recipe-sy=
sroot/usr/include/libaudit.h:30:10:
> >>>fatal error: audit.h: No such file or directory
> >>>=A0=A0=A0 30 | #include "audit.h"
> >>>=A0=A0=A0=A0=A0=A0 |=A0=A0=A0=A0=A0=A0=A0=A0=A0 ^~~~~~~~~
> >>>compilation terminated.
> >>>
> >>>Install audit.h so other applications can use it.
> >>>
> >>>Signed-off-by: Jeremy A. Puhlman <jpuhlman@mvista.com>
> >>>---
> >>>=A0 meta-oe/recipes-security/audit/audit_3.0.8.bb | 1 +
> >>>=A0 1 file changed, 1 insertion(+)
> >>>
> >>>diff --git a/meta-oe/recipes-security/audit/audit_3.0.8.bb
> >>>b/meta-oe/recipes-security/audit/audit_3.0.8.bb
> >>>index 3dbfc9e60..6195b6749 100644
> >>>--- a/meta-oe/recipes-security/audit/audit_3.0.8.bb
> >>>+++ b/meta-oe/recipes-security/audit/audit_3.0.8.bb
> >>>@@ -110,4 +110,5 @@ do_install:append() {
> >>>
> >>>=A0=A0=A0=A0=A0=A0=A0=A0 # Create /var/spool/audit directory for aud=
isp-remote
> >>>=A0=A0=A0=A0=A0=A0=A0=A0 install -m 0700 -d ${D}${localstatedir}/spo=
ol/audit
> >>>+=A0=A0=A0=A0=A0=A0 install -m 644 ${S}/lib/audit.h ${D}${includedir=
}/audit.h
> >>>=A0 }
> >>>--=20
> >>>2.35.4

