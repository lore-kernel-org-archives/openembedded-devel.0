Received: from [209.85.200.173] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dbaryshkov@gmail.com>) id 1KQLva-0004Fu-IG
	for openembedded-devel@lists.openembedded.org;
	Tue, 05 Aug 2008 14:46:14 +0200
Received: by wf-out-1314.google.com with SMTP id 23so2766520wfg.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 05 Aug 2008 05:46:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=3pbftmTDCulVQUf80Nml48d/XuLU/jMwWpw354a6xAA=;
	b=p7qK/xUDyuNxKLzxzw0qs/U+jLclmVlfp1eL8E19978BbEjtdtN6X0TR8FYPlrbh8w
	xfpq8d4pIGqhrrSGMv1ZqkCN7lTbg4NWm9CKshIYS6bht3ZA5Azec+J8/h7d0Dk53dVO
	hPaLi7Sy5kW/ilLg21mUngGpPUbVn3ZWna3SQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=Fymt+OpbUkmfHoeMBeoIjUm3jrUZmlu0FVJxHGrYtD6khiSnKTKH4r43kQuqGpm/Uv
	nKtZAMoZHLfKO0U1gbS4klGSKZIUIuDoBULLIneKiBWbu4x9GBC3qkgutno3XCTSFBhR
	yBM55XBqMsVsxwizFtTnxwJ+HI6hZib7kweFw=
Received: by 10.142.158.3 with SMTP id g3mr5432672wfe.344.1217940372892;
	Tue, 05 Aug 2008 05:46:12 -0700 (PDT)
Received: from doriath.ww600.siemens.net ( [212.248.25.26])
	by mx.google.com with ESMTPS id 32sm12104487wfa.8.2008.08.05.05.46.09
	(version=SSLv3 cipher=RC4-MD5); Tue, 05 Aug 2008 05:46:12 -0700 (PDT)
Date: Tue, 5 Aug 2008 16:45:14 +0400
From: Dmitry Baryshkov <dbaryshkov@gmail.com>
To: Robert Schuster <theBohemian@gmx.net>
Message-ID: <20080805124514.GA5131@doriath.ww600.siemens.net>
References: <48239d390808040638r7a5e6351x4c8346497451adae@mail.gmail.com>
	<48980E9D.8000709@gmx.net>
MIME-Version: 1.0
In-Reply-To: <48980E9D.8000709@gmx.net>
User-Agent: Mutt/1.5.18 (2008-05-17)
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: ppc64 host
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
X-List-Received-Date: Tue, 05 Aug 2008 12:46:15 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Aug 05, 2008 at 10:26:05AM +0200, Robert Schuster wrote:
> Hi,
> 
> Sergey Lapin schrieb:
> > Hi, all!
> > 
> > Do anybody had any success running OE builds on ppc64 host?
> just send this boxen over to me and I'll check it out.
> 
> 
> Just kidding! :)
> 
> > If not, is there any advice regarding that?
> You might run into trouble when qemu needs to execute some stuff from
> the target platform as they do not list[0] ppc64 host cpu support
> explicitly.
> 
> Otherwise follow the steps are applicable for other distros/CPUs as
> well: /bin/sh needs to be bash etc.
> 
> Would be cool if you tell us whether you have success.

I'm building the OE images on the ppc64 host (Apple xServe G5):
Debian lenny (current), 64-bit kernel, 32-bit userspace.
To successfully build packages for arm, I had to manually override
BUILD_ARCH to be ppc (misdetected as ppc64) and disable binary locale
generation (qemu segfaulted).

I'm going to try to build OE image in fully 64 bit environment, but that
is not going to happen soon.

-- 
With best wishes
Dmitry



