Received: from mail-iw0-f203.google.com ([209.85.223.203])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NYDiX-0001SC-6P
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jan 2010 08:14:08 +0100
Received: by iwn41 with SMTP id 41so736160iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Jan 2010 23:11:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=LTzQnzonAw0oRtCTxqAh8ObE4JeB3DwY81ZaAUp0qg4=;
	b=DLfg4qlq0ElUlQe8tTF3pBWdnDzpc/LiDsz196vfQ3jzrU1mXL2fyQKy6sLbDA9ypL
	Y/5CKAzbRkxuIilHxdim8kUfRll3XcQzFQGSeryT/+B5yfz8rQ7rRpBTNnnRzsD2LSm+
	usTcjKZ0gLVLlt6xdwrkgOOhx96R1tj6DOYeg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=Vze3z/JBFS/jXZURRFNVxmBQ+7FXYlitG/xc2jiPDXC/KR8U6214h7tqsLwfe6whKM
	rkHOIBVIj2vS9DAil3Z1TAnDVs8sb4dUQtrrV9iHSIZPP8cgQsE93eFPEjelt6aMtIg8
	yCvfBQb/tBMRoLRyMO+u4T+vbu2qrNKyD6OZc=
MIME-Version: 1.0
Received: by 10.231.149.201 with SMTP id u9mr3090653ibv.1.1264144307202; Thu, 
	21 Jan 2010 23:11:47 -0800 (PST)
In-Reply-To: <op.u6w8vggrmn1qzu@guohr-laptop-ubuntu>
References: <op.u6w8vggrmn1qzu@guohr-laptop-ubuntu>
Date: Thu, 21 Jan 2010 23:11:47 -0800
Message-ID: <19c1b8a91001212311hdd1a71cm9e2ae5ad285538da@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.203
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: why PREFERRED_PROVIDER_virtual/kernel in conf/machine/sun4cdm.conf does not work
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
X-List-Received-Date: Fri, 22 Jan 2010 07:14:08 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 21, 2010 at 10:41 PM, Guo Hongruan <camelguo@gmail.com> wrote:
> Hi guys,
> =A0I tried to build an openembedded project with the following setting:
> MACHINE=3Dsun4cdm =A0DISTRO=3Dmicro LIBC=3Deglibc
> But I noticed the following warning message after parsing the bb files:
>
> NOTE: multiple providers are available for virtual/kernel (linux-palmpre,
> linux-rt, gumstix-kernel, linux);
> NOTE: consider defining PREFERRED_PROVIDER_virtual/kernel
> NOTE: Preparing runqueue
> NOTE: Dependencies saved to 'depends.dot'
> NOTE: Task dependencies saved to 'task-depends.dot'
>
> My question is:
> In the conf/machine/sun4cdm.conf, there is the defination of
> PREFFERRED_PROVIDER_virtual/kernel, see the following line:
> REFERRED_PROVIDER_virtual/kernel =3D "linux-sun4cdm"
> Why did it not work at all?
>
> Anyone can give me some hints?

you already seem to have generated .dot files for dependencies so check in =
there
why other packages ar being pulled in. May be some modules are pulling
them in or something like that.
and the recipe  linux-sun4cdm_2.6.8.1.bb does not seem to include
linux.inc which should be investigated too.

 > Thanks a lot!
>
> --
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


