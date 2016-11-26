Return-Path: <Jackie.Huang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id BFF7371A8B
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 26 Nov 2016 06:26:04 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id uAQ6Q5FG025652
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Nov 2016 22:26:05 -0800 (PST)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.156]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0294.000;
	Fri, 25 Nov 2016 22:26:05 -0800
From: "Huang, Jie (Jackie)" <Jackie.Huang@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-networking][PATCH] samba: fix the hardcoded path in
	init script
Thread-Index: AQHSRkGz8oJPGdcvp0O8sKHx2gEO0qDqzeKw
Date: Sat, 26 Nov 2016 06:26:03 +0000
Message-ID: <1B858668EC6A94408DCA5225FDFA85AA013A3560D2@ALA-MBA.corp.ad.wrs.com>
References: <20161124055713.23487-1-jackie.huang@windriver.com>
	<f95790bd-1e5b-3666-e042-a1fe7aded164@dominion.thruhere.net>
In-Reply-To: <f95790bd-1e5b-3666-e042-a1fe7aded164@dominion.thruhere.net>
Accept-Language: en-US, zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.224.162.146]
MIME-Version: 1.0
Subject: Re: [meta-networking][PATCH] samba: fix the hardcoded path in init script
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
X-List-Received-Date: Sat, 26 Nov 2016 06:26:04 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Koen Kooi
> Sent: Thursday, November 24, 2016 6:40 PM
> To: openembedded-devel@lists.openembedded.org
> Subject: Re: [oe] [meta-networking][PATCH] samba: fix the hardcoded path =
in init script
>=20
> Op 24-11-16 om 06:57 schreef jackie.huang@windriver.com:
> > From: Jackie Huang <jackie.huang@windriver.com>
> >
> > Replace the hardcoded path with base_bindir in init script to fix the
> > error: /etc/init.d/samba.sh: line 15: /usr/bin/ps: No such file or
> > directory /etc/init.d/samba.sh: line 17: /usr/bin/sed: No such file or
> > directory /etc/init.d/samba.sh: line 16: /usr/bin/grep: No such file or
> > directory
> >
> > Signed-off-by: Jackie Huang <jackie.huang@windriver.com> ---
> > meta-networking/recipes-connectivity/samba/samba_4.4.5.bb | 1 + 1 file
> > changed, 1 insertion(+)
> >
> > diff --git a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb
> > b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb index
> > e9694d4..6c1e3ef 100644 ---
> > a/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb +++
> > b/meta-networking/recipes-connectivity/samba/samba_4.4.5.bb @@ -111,6
> > +111,7 @@ do_install_append() { -e
> > 's,/opt/samba/smb.conf,${sysconfdir}/samba/smb.conf,g' \ -e
> > 's,/opt/samba/log,${localstatedir}/log/samba,g' \ -e
> > 's,/etc/init.d/samba.server,${sysconfdir}/init.d/samba.sh,g' \ +
> > -e 's,/usr/bin,${base_bindir},g' \ -i ${D}${sysconfdir}/init.d/samba.sh
> > fi
>=20
> Wouldn't it be better to completely remove the absolute paths?

Yeah, the absolute paths don't seem to be necessary, and I think this=20
check in the init script is not needed as well:

if [ ! -d /usr/bin ]
then                    # /usr not mounted
        exit
fi

I will make a path to remove them if you're agree.

Thanks,
Jackie

>=20
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

