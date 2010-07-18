Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OaOjW-0007JO-Ah
	for openembedded-devel@lists.openembedded.org;
	Sun, 18 Jul 2010 09:56:23 +0200
Received: by fxm12 with SMTP id 12so1720892fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 18 Jul 2010 00:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=wY0gzBmTJ3GoXHkNBVANFvLtOcUxD6OfXuNMPcU1/m8=;
	b=k6HfZQqRFsHk73tYF9V/rAZBeJOae476ezUhffqfUSBnXz0FK6BKB9Fpc95DIYes+u
	KygULHiEiqNkDuuCAYi2kJU1DcPo7hfZYCgHwqHbQ8N49Is4h2Ity0DU/hyZER0Ri/l8
	Sbu6AXt/mY2NUIx52r+HZ10NiAHMVTfbdGfwQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BiMUoewh+TTW93PPvclrsw8yEKfvSS17puogTu8BG64//M/rjcDFeK5ELbh1fKkmNl
	5yo3b4BUVKUWhxp1uAR696ifRlmKwyg19novGpkguvMfRxrTX/lhcmZ/JzpOV0Mz2MTg
	iCZVcddmwTrk82SJVum9zvSWD+lYx+ad3bb60=
Received: by 10.223.110.83 with SMTP id m19mr2343578fap.26.1279439774912;
	Sun, 18 Jul 2010 00:56:14 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id r2sm1497716faq.28.2010.07.18.00.56.12
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 18 Jul 2010 00:56:13 -0700 (PDT)
Date: Sun, 18 Jul 2010 09:56:38 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100718075638.GC16225@jama>
References: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
MIME-Version: 1.0
In-Reply-To: <1276068782-23257-1-git-send-email-mad_soft@inbox.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 0/3] Recipe for MuPDF
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
X-List-Received-Date: Sun, 18 Jul 2010 07:56:23 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, Jun 09, 2010 at 11:32:59AM +0400, Dmitry Artamonow wrote:
> Hi!
> 
> Here's recipe for MuPDF (X11 pdf viewer and toolkit) and its dependencies.
> Viewer doesn't have any fancy GUI - just a plain window with rendered PDF,
> but it's a good thing on small screens embedded devices usually have,
> as no screen space is wasted on buttons, etc. Viewer is perfectly
> controllable from keyboard (and keyboardless devices like PDAs usually
> have some joystick which is enough to navigate through pages, and other
> tasks can be performed from on-screen keyboard). Also pdf contents is
> scrollable by finger/stylus/mouse. And last, but not least - viewer is
> VERY fast, much faster than poppler/xpdf-based solutions. I never thought
> I can get such a speed of PDF-rendering on ARM-based machine.
> 
> Build tested for armv4(h3600), armv5(hx4700), armv7(beagleboard), x86(qemux86)
> Run tested on armv5 machine (hx4700)

Hi, is there PATCHv2 series with Khem's suggestions fixed?

Would be nice to have it in oe.dev.

Thanks!

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


