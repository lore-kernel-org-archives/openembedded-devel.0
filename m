Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by mail.openembedded.org (Postfix) with ESMTP id 6840C77740
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 23:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 448AB20A48
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 23:11:03 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id a2zCGwblMWK3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 23:11:03 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-95-79.washdc.fios.verizon.net
	[100.15.95.79])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 2D0D4204AF
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 22 Dec 2016 23:11:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 76E791621EE; Thu, 22 Dec 2016 18:11:02 -0500 (EST)
Date: Thu, 22 Dec 2016 18:11:02 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20161222231102.GK30576@denix.org>
References: <32e1bacb35684936a5f570af7030495a@asem.it>
	<65F88FD8-A243-4EC7-83FE-B59F8DF721FE@gmail.com>
	<4a4f95b4feb6470aa17f9fbe6c841038@asem.it>
MIME-Version: 1.0
In-Reply-To: <4a4f95b4feb6470aa17f9fbe6c841038@asem.it>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [meta-qt5] Runtime error with qt5.7
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
X-List-Received-Date: Thu, 22 Dec 2016 23:11:02 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Dec 22, 2016 at 01:18:48PM +0000, Flavio Suligoi wrote:
> Hi Raj,
> 
> I've already used in my image .bb recipe the parameter:
> 
> DISTRO_FEATURES += "x11 opengl"

DISTRO_FEATURES is a global list, not per recipe/image...


> to enable the "-opengl desktop" swith in qtbase_git.bb receipe, but It doesn't work, I always have this error.
> 
> Any other idea or other point where start to investigate?
> Or do you have a image recipe with x11 and the QT5.7 ?
> 
> Thanks,
> 
> Flavio
> 
> ________________________________________
> Da: openembedded-devel-bounces@lists.openembedded.org <openembedded-devel-bounces@lists.openembedded.org> per conto di Khem Raj <raj.khem@gmail.com>
> Inviato: giovedì 22 dicembre 2016 07:00
> A: openembedded-devel@lists.openembedded.org
> Oggetto: Re: [oe] [OE][meta-qt5] Runtime error with qt5.7
> 
> > On Dec 21, 2016, at 4:50 AM, Flavio Suligoi <f.suligoi@asem.it> wrote:
> >
> > QXcbIntegration: Cannot create platform OpenGL context, neither GLX nor EGL are enabled
> > Failed to create OpenGL context for format QSurfaceFormat(version 2.0, options QFlags(), depthBufferSize 24, redBufferSize -1, greenBufferSize -1, blueBufferSize -1, alphaBufferSize -1, stencilBufferSize 8, samples -1, swapBehavior 2, swapInterval 1, profile  0)
> > Aborted
> 
> You might want to check if you have enabled egl in PACKAGECONFIG for qtbase may be you need to enable opengl in DISTRO_FEATURES and/or set
> packageconfig for qtbase
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
> -- 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

