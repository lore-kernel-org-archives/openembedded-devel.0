Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Oly3T-0005Dp-4c
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 07:52:47 +0200
Received: by iwn38 with SMTP id 38so1441510iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 18 Aug 2010 22:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=5QlmRV9WOl7/uRIjlQCrXQCc9Cd79Ivfwzs5B225MLs=;
	b=q2VskCan6FxTfsiWpF1yqmFwf+D4JXfrf1lqHtbUpawBH/gulB8BvWzx1ST75Mc3El
	xD6tE8prok8C7hLTVSE0m5j5lduAY1f63k4P2sbMBFq5qEux2+2UdPPUPZlH8o5ip1au
	Fsxk21aUpoOkmfg5JiyAsmToOrzPi3v7HMm6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=FSI19/5g5sae59aDTytCvP6l+DKtFR7mhTOVLDSo0ZnbHbX/iV8L8IYwy4iOEQ8mRy
	KPeMGariCWO83xcDGD++E2pdj4BLXxwGMjuF6qo8sEm7qRjYWP1QWqv/Kj1m3natK8UK
	ytvnV9U6FXtp8UmiNhRHWdx1GNOT1x8Q3Rvu4=
MIME-Version: 1.0
Received: by 10.231.146.129 with SMTP id h1mr10416981ibv.181.1282197148689;
	Wed, 18 Aug 2010 22:52:28 -0700 (PDT)
Received: by 10.231.208.72 with HTTP; Wed, 18 Aug 2010 22:52:28 -0700 (PDT)
In-Reply-To: <1282185550-3423-1-git-send-email-jkridner@beagleboard.org>
References: <1282185550-3423-1-git-send-email-jkridner@beagleboard.org>
Date: Thu, 19 Aug 2010 07:52:28 +0200
Message-ID: <AANLkTinMA4NRMPPo3hE-cM8xdRWT825OaXqYYiHVWjrD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] angstrom-version: install not mkdir
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
X-List-Received-Date: Thu, 19 Aug 2010 05:52:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/8/19 Jason Kridner <jkridner@beagleboard.org>:
> Thanks Steve Sakoman for finding this.
>
> Signed-off-by: Jason Kridner <jkridner@beagleboard.org>
> ---
> =A0recipes/angstrom/angstrom-version.bb | =A0 =A04 ++--
> =A01 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes/angstrom/angstrom-version.bb b/recipes/angstrom/angs=
trom-version.bb
> index a2f1335..7b167f1 100644
> --- a/recipes/angstrom/angstrom-version.bb
> +++ b/recipes/angstrom/angstrom-version.bb
> @@ -1,7 +1,7 @@
> =A0LICENSE =3D "MIT"
>
> =A0PV =3D "${DISTRO_VERSION}"
> -PR =3D "r4"
> +PR =3D "r5"
> =A0PE =3D "1"
>
> =A0SRC_URI =3D "file://lsb_release"
> @@ -14,7 +14,7 @@ export METADATA_BRANCH
> =A0export TARGET_SYS
>
> =A0do_install() {
> - =A0 =A0 =A0 mkdir -p ${D}${sysconfdir}
> + =A0 =A0 =A0 install -d ${D}${sysconfdir}
> =A0 =A0 =A0 =A0echo "Angstrom ${DISTRO_VERSION}" > ${D}${sysconfdir}/angs=
trom-version
> =A0 =A0 =A0 =A0echo "Built from branch: ${METADATA_BRANCH}" >> ${D}${sysc=
onfdir}/angstrom-version
> =A0 =A0 =A0 =A0echo "Revision: ${METADATA_REVISION}" >> ${D}${sysconfdir}=
/angstrom-version
> --

pushed, thank you


