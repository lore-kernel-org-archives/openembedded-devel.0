Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1Olz6v-0000xr-6Q
	for openembedded-devel@lists.openembedded.org;
	Thu, 19 Aug 2010 09:00:26 +0200
Received: by fxm6 with SMTP id 6so854484fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 19 Aug 2010 00:00:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=hkq2Z9JwuQmvVfsVywMRfp84vhKt4LrhnPDM3NuvaLE=;
	b=Kl7ZPm/00SWmHV/AdWevQ9wPZ1hWIN73tkJC9ZW8oFMxmyxnimZDYhQcDxPcHcTpz7
	JsDpBDclA1HaeExa12qpCAqdGkvQA+Qv4+r12HCcC1Be5OwKIFMno8ZuhCFDk0Jiz7Y8
	QH6yR+YeKtULXTkQDQIy4PS5DpdKv7bF7DX2k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=ZGnFjNLGsUlNdqaaIA6OxGW+iGWh2RLpfo7Mc3IVVsya4jLqwf6epJ9a582cPvX97S
	TbGEVRI4KiHINTJAfWr9GYV57ee0Gd1A2ZN9e/dRCFsVA5cgexGWMR+oCYdPs4yv99VJ
	QaCC1QMCIvBXj/UgciOp745qPJpyP9Pk/fJlc=
Received: by 10.223.119.82 with SMTP id y18mr8794347faq.60.1282201205189; Thu,
	19 Aug 2010 00:00:05 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Wed, 18 Aug 2010 23:59:45 -0700 (PDT)
In-Reply-To: <AANLkTin1LNj80zSFxs81euO+0gw2bEA-JCpkx8s04FLh@mail.gmail.com>
References: <1282198749-25911-1-git-send-email-coolaj86@gmail.com>
	<AANLkTin1LNj80zSFxs81euO+0gw2bEA-JCpkx8s04FLh@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Thu, 19 Aug 2010 00:59:45 -0600
Message-ID: <AANLkTikW7eaRS4Ov0n9eT+_0qgU1E=8Q_3+P2SRN3eRo@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [PATCH] removed duplicate node recipe
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
X-List-Received-Date: Thu, 19 Aug 2010 07:00:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

I created the node recipe in the last e-mail patch, but I had a leftover
test file that I didn't mean to commit. This removed it.

AJ ONeal


On Thu, Aug 19, 2010 at 12:50 AM, Frans Meulenbroeks <
fransmeulenbroeks@gmail.com> wrote:

> 2010/8/19 AJ ONeal <coolaj86@gmail.com>:
> > ---
> >  recipes/node/node_v0.1.104.bb |   23 -----------------------
> >  1 files changed, 0 insertions(+), 23 deletions(-)
> >  delete mode 100644 recipes/node/node_v0.1.104.bb
> >
> > diff --git a/recipes/node/node_v0.1.104.bb b/recipes/node/
> node_v0.1.104.bb
> > deleted file mode 100644
> > index 368b8fb..0000000
> > --- a/recipes/node/node_v0.1.104.bb
> > +++ /dev/null
> > @@ -1,23 +0,0 @@
> > -DESCRIPTION = "nodeJS Evented I/O for V8 JavaScript"
> > -PR = "r0"
> > -DEPENDS = "openssl"
> > -SRC_URI = " \
> > -http://nodejs.org/dist/node-v${PV}.tar.gz \
> > -"
> > -#libev-cross.patch
> > -#node-cross.patch
> > -SRC_URI[md5sum] = "907fa1e0a2f1f0c3df5efc97fd05a7d2"
> > -SRC_URI[sha256sum] =
> "a1c776f44bc07305dc0e56df17cc3260eaafa0394c3b06c27448ad85bec272df"
> > -S = "${WORKDIR}/node-v${PV}"
> > -do_configure () {
> > -./configure
> > -}
> > -do_compile () {
> > -export DEST_CPU=arm
> > -make
> > -}
> > -do_install () {
> > -install -d ${D}${bindir}/
> > -install -m 0755 ${S}/node ${D}${bindir}/
> > -}
> > -FILES_${PN} = "${bindir}/node"
> > --
> > 1.6.0.4
> >
> Not sure where you got this from but my tree does not have a node
> recipe and it does not show up in dev head in cgit.
>
> Frans
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

