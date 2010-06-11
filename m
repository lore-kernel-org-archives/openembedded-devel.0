Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OMxe6-0006Ak-0q
	for openembedded-devel@lists.openembedded.org;
	Fri, 11 Jun 2010 08:23:16 +0200
Received: by fxm9 with SMTP id 9so452754fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 23:18:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=hBY5qJEDjj6rrJ1BKiIXSVyvaHCyKjocaLAOI8cPIjg=;
	b=DDOhROkvUVHUx/8tXihDhR7dWOzvk7peMmnjQwVx/6Ze/IIYwMdprDacBfnU0o4wpj
	i2bFkZ5XQhFJwbIonChpj88ntE+hZ6vHGUnVwXwXABZxSvw5ilwWCsMeFkxc4vvXRP1W
	xjWuqYfxPWaFbG8bKUDf+bjMpXuOW683NUPy0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=iI3B6nrX15AVEJd/RvP8Fnyn3FcovJyKpfjjQ3fSYCFbRZRSaZfKv5a8aicqGiHvuf
	fI+QJNHQ37GQ8BPqGd9Al9ymYk4jAf5VAjq/0f7WHu6DsnPe0tEoRphQaxmfmv1Eixcg
	353uerjyX1ImDASPkIzKhEvGm916hcgVohQpA=
Received: by 10.223.17.136 with SMTP id s8mr1313074faa.41.1276237130536;
	Thu, 10 Jun 2010 23:18:50 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 7sm3617395far.6.2010.06.10.23.18.49
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 23:18:49 -0700 (PDT)
Date: Fri, 11 Jun 2010 08:18:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100611061838.GS1403@jama>
References: <1276200457-11650-1-git-send-email-Martin.Jansa@gmail.com>
	<4C11CF60.5060106@freyther.de>
MIME-Version: 1.0
In-Reply-To: <4C11CF60.5060106@freyther.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] navit: enable qml build
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
X-List-Received-Date: Fri, 11 Jun 2010 06:23:20 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Jun 11, 2010 at 01:53:36PM +0800, Holger Freyther wrote:
> On 06/11/2010 04:07 AM, Martin Jansa wrote:
> > * but for now without DEPENDS on qt4-x11-free, because 4.7.0 is not yet
> >   released and building qt4-x11-free just because of navit (for someone
> >   not using it for something else) takes a lot of time
> 
> I might not understand everything here, but this looks dangerous. A
> package rebuild should always generate the same kind of package.

Yes it's dangerous indeed.

Python DEPENDS contains 
${@base_contains('DISTRO_FEATURES', 'tk', 'tk', '', d)}

Then it's ensured that if you have tk in DISTRO_FEATURES then it's
picked by automatic in do_configure. But if you don't have it in
DISTRO_FEATURES then it depends if you build something depending on tk
before trying to build python or not. Even worse case is when you build
an image (ie kernel, python (without tk), th, something_depending_on_tk)
and then someone PR bump python and now you'll get python with tk).

I guess there is plenty of examples where configure has "automatic" by
default and we don't DEPEND on optional stuff and also don't force it
with --disable-some-optional-feature :/.

I think that best solution would be something like
DEPENDS += "${@base_contains('DISTRO_FEATURES', 'qt', 'qt4-x11-free', '', d)}"
EXTRA_OECONF += "${@base_contains('DISTRO_FEATURES', 'qt', '--enable-gui-qml', '--disable-gui-qml', d)}"

which is not so common in OE AFAIK and looks like how USE flags are
handled in gentoo (but they have better syntax to make it shorter).

Regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


