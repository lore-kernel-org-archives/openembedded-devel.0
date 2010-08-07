Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1OhZ4V-0004BE-Ll
	for openembedded-devel@lists.openembedded.org;
	Sat, 07 Aug 2010 04:23:41 +0200
Received: by iwn38 with SMTP id 38so1777054iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Aug 2010 19:23:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=kbq/bItuvh+tAH7KgX1V6C/4zgDQLcp6ZV9ugjq+4yI=;
	b=bGjswHvX9rwiFPdejEtu6ETUVVxLPv50a1Lff4Y4PgacIqPICmAVvz56iZHhl2rNe8
	WOJQhNRMGCgvOk3m6eLOr22O/b9dARV2uwqW0ATLSVnP4F+AWaHbXK+NyqLlgW2yj3na
	wVRa0V2sCY20kPbmX7YL9VMqOAFYYy7f57cXk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=VBTwy11BSgXFOMjcL4DS22NyhUEmV5U7GZzjY4ZwJTLh7INYCEnXGkUiHdqPjm72r8
	kr5/z93qmf4Sd9e60nEtPBC6P2XHHCNvU+kgpDadwky3tyQshm5mQIfNUKr6PmxvUN3K
	A8N9fI1WE0wvLL4yLSTr5hktdfR88PQ7dAGYc=
MIME-Version: 1.0
Received: by 10.231.166.72 with SMTP id l8mr14657072iby.95.1281147809880; Fri, 
	06 Aug 2010 19:23:29 -0700 (PDT)
Received: by 10.231.145.77 with HTTP; Fri, 6 Aug 2010 19:23:29 -0700 (PDT)
In-Reply-To: <AANLkTikiJFvOn_=VkTf7y5LTCUh5WOqfOhj8Udwbc5Ws@mail.gmail.com>
References: <4C5A612E.9040702@gmail.com>
	<AANLkTik-B0=_JyGLe1dpz9x+h-HE+H8AWd22uO8ioeaG@mail.gmail.com>
	<AANLkTimGYvMxV0MfaVZ8qRFCoFus8NMcUnJyBVHO8NB5@mail.gmail.com>
	<AANLkTim14Nqs6SJvda5YsD883HZxTp0jiRTbReM4QXGd@mail.gmail.com>
	<AANLkTikiJFvOn_=VkTf7y5LTCUh5WOqfOhj8Udwbc5Ws@mail.gmail.com>
Date: Sat, 7 Aug 2010 11:53:29 +0930
Message-ID: <AANLkTi=B6DBq0z0Ra5OhB6iqirTCGje2-snfFodwfHUi@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] Remove redundant dependencies upon opkg and opkg-collateral.
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
X-List-Received-Date: Sat, 07 Aug 2010 02:23:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 7 August 2010 11:19, Chris Larson <clarson@kergoth.com> wrote:
>
> BOOTSTRAP_EXTRA_RDEPENDS is a remnant. =A0We wouldn't want them controlli=
ng it
> from there anyway. =A0The fact that I INHERIT package_ipk doesn't mean I'=
m
> constructing an ipk image, only that I'm *emitting* packages of that
> format. =A0IMAGE_PKGTYPE controls which rootfs_* bbclass will be used to
> construct the image, but that doesn't control which package *manager* for
> that type will be used, nor whether it should be installed at all
> (ONLINE_PACKAGE_MANAGEMENT).

Thanks, that does clear up how things are intended to behave. However
it doesn't reflect the reality of package_deb.bbclass and
package_ipk.bbclass, which both add their package managers to the
image unconditionally. i.e. using INHERIT=3D"package_ipk" and
ONLINE_PACKAGE_MANAGEMENT=3D"none" will still get you an image with opkg
installed.

My intention here is to cut off some of opkg's tentacles in OE. I
expect more pruning will be required.

-Graham


