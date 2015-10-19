Return-Path: <joe.slater@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id EA35F76FF2
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 21:36:06 +0000 (UTC)
Received: from ALA-HCB.corp.ad.wrs.com (ala-hcb.corp.ad.wrs.com
	[147.11.189.41])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id t9JLa5jw011640
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Oct 2015 14:36:06 -0700 (PDT)
Received: from ALA-MBA.corp.ad.wrs.com ([169.254.3.159]) by
	ALA-HCB.corp.ad.wrs.com ([147.11.189.41]) with mapi id 14.03.0248.002;
	Mon, 19 Oct 2015 14:36:05 -0700
From: "Slater, Joseph" <joe.slater@windriver.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Thread-Topic: [oe] [meta-initramfs][PATCH 1/1] dracut: RDEPEND on util-linux
Thread-Index: AQHRCDwdlSUJqA2Q0kKZ1EMZKQ7rnp5vAOCAgARab0A=
Date: Mon, 19 Oct 2015 21:36:04 +0000
Message-ID: <007BD92917A2324FA403BCF9A464CF84919460D6@ALA-MBA.corp.ad.wrs.com>
References: <1445018245-30292-1-git-send-email-jslater@windriver.com>
	<CAMKF1srrWsnVLACj5gNGQrBpvO-XU=gc9gOX2qqyKGkfU_7Umw@mail.gmail.com>
In-Reply-To: <CAMKF1srrWsnVLACj5gNGQrBpvO-XU=gc9gOX2qqyKGkfU_7Umw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [147.11.216.76]
MIME-Version: 1.0
Subject: Re: [meta-initramfs][PATCH 1/1] dracut: RDEPEND on util-linux
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
X-List-Received-Date: Mon, 19 Oct 2015 21:36:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable



> -----Original Message-----
> From: openembedded-devel-bounces@lists.openembedded.org [mailto:openembed=
ded-devel-
> bounces@lists.openembedded.org] On Behalf Of Khem Raj
> Sent: Friday, October 16, 2015 1:05 PM
> To: openembeded-devel
> Subject: Re: [oe] [meta-initramfs][PATCH 1/1] dracut: RDEPEND on util-lin=
ux
>=20
> On Fri, Oct 16, 2015 at 10:57 AM, Joe Slater <jslater@windriver.com> wrot=
e:
> > We might need findmnt and setsid, which are in the
> > util-linux package.
>=20
> would it make sense to put them in a independent package ?

If we do, I think we should make util-linux RDEPEND on it (them), so we won=
't break other
stuff that assumes that's where they are.

Joe


> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

