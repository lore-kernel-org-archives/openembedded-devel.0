Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1P0qZ1-0003Gs-UI
	for openembedded-devel@lists.openembedded.org;
	Wed, 29 Sep 2010 08:55:15 +0200
Received: by iwn2 with SMTP id 2so664575iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 28 Sep 2010 23:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=LCruER/3eq4Dl6mQrXeBfQR5BdmAzj7PUVsN4xb6i5Y=;
	b=PUOaCQjYVA5LNOBW6y98byjXFc07DPRYKP+LO748umtU2pt8y9CWOsNOacHI1em2Fo
	m2IlrL9669Cwm/q9fl+lmShPFaFufz4F1UXR5w8j80KpTWGx8wZxKgvLcvKQAP7MX4tx
	Gr4TlGaDnPbuV9AxgljerIl1wE+Jp4QitYiQc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=FQJN9cesIax6viAM+7dfMAwkd40z7zwesE9ulakmbY1zJz3TF7sOZaFCNMWbvg78Ek
	jQmKTw7fU1UjSKc417eshGWAD08FsP2tMHQkEyRirxRIB6bxEH8HjQhJtFJDYRbl1wVp
	vJXHfMmsLEHUlZc5bTrCTjbm8yQBpBN6Nc828=
MIME-Version: 1.0
Received: by 10.231.33.205 with SMTP id i13mr1289898ibd.59.1285743280501; Tue,
	28 Sep 2010 23:54:40 -0700 (PDT)
Received: by 10.231.32.10 with HTTP; Tue, 28 Sep 2010 23:54:40 -0700 (PDT)
In-Reply-To: <AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
References: <AANLkTikjs7DrdBxNpo0GpGy-FkbG3MEQe=+aT8if_a_C@mail.gmail.com>
	<AANLkTimxud8X-EdsRC1FrJg8Xpya7S_BM5vKSs3K7Vi5@mail.gmail.com>
Date: Wed, 29 Sep 2010 08:54:40 +0200
Message-ID: <AANLkTikDLYVEa=X5eHj7kB+9O3Hu=a_Our7iAimyW0-c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: generate a named kernel in ${DEPLOY_DIR_IMAGE}
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
X-List-Received-Date: Wed, 29 Sep 2010 06:55:25 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/29 Andrea Adami <andrea.adami@gmail.com>:
> On Tue, Sep 28, 2010 at 6:54 PM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:

> We solved same issues with linux-kexecboot.inc including linux.inc and
> redefining vars/tasks.
> In particular
> ...
> PACKAGES = ""
> PROVIDES = ""
> ...
> KERNEL_IMAGE_BASE_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${PV}-${PR}-${MACHINE}"
> KERNEL_IMAGE_SYMLINK_NAME = "${KERNEL_IMAGETYPE}-kexecboot-${MACHINE}"
> ...
>
> do_populate_sysroot() {
> }
>
> do_install() {
> }
>
> python do_package() {
> }
>

Tried this. works nice.
Two small remarks:

I would have expected you had to add something like:
FILESPATHPKG_append = ":linux-${PV}"
I had to add this to get access to the linux patches.

And this:
S = "${WORKDIR}/linux-${PV}"
might perhaps better end up in the base recipe (in my case linux_2.6.34.bb)
(actually thinking of it the FILESPATHPKG might also be moved into there).

Should I prepare a patch for that ?

Frans.


