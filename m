Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Opia6-0001mT-Tk
	for openembedded-devel@lists.openembedded.org;
	Sun, 29 Aug 2010 16:09:59 +0200
Received: by fxm6 with SMTP id 6so3008671fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 29 Aug 2010 07:09:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=QHyhnKWbCjK+igp4dKMaOl7V0SMQ7rr+YyLa0D0sd9U=;
	b=lP6Rh1hmyedOU/+5RHgLeacu2zcsFyQ5CdX00lk0JD9/I/3ZQA6n52c3Ofemfg/o3j
	VgDrvapEmlF+tCrPQ6F5f0U/CmymXu5T0hslRn5wa/mYYqEZdNHNT9e7BQjoELGbUVmc
	KPtCAZ8VW4fK7c2UMf51SviMy08WGP5rJKaCQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=G9Jnz92xoUPdvq3qf4ADdeXDOvvVM6J1+XNTUp7wg9RRVKqsdkXFlG/Tchi1FReQ+f
	Tx2yUkxUVJdebRHoQsIQu1gZciKvtrsP+kx6ODuBVeQ2C7yUAaplQjkEkbfxAjKLT5HF
	Y4rfmm+6P5U8CFFvsLfszKHL2AG1WcQMqCl2k=
Received: by 10.223.124.9 with SMTP id s9mr2610851far.91.1283090961131;
	Sun, 29 Aug 2010 07:09:21 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm2874048faz.38.2010.08.29.07.09.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sun, 29 Aug 2010 07:09:20 -0700 (PDT)
Date: Sun, 29 Aug 2010 16:10:15 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100829141015.GR17268@jama>
References: <1283086227-13224-1-git-send-email-eric@eukrea.com>
	<lysk1x5xk3.fsf@ensc-virt.intern.sigma-chemnitz.de>
MIME-Version: 1.0
In-Reply-To: <lysk1x5xk3.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] alsa-utils-alsamixer: add ncurses-terminfo RDEPENDS
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
X-List-Received-Date: Sun, 29 Aug 2010 14:09:59 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sun, Aug 29, 2010 at 03:59:56PM +0200, Enrico Scholz wrote:
> Eric Bénard <eric@eukrea.com> writes:
> 
> > +RDEPENDS_alsa-utils-alsamixer = "ncurses-terminfo"
> 
> I think this should be solved in ncurses because it affects other
> packages too; e.g. moving its /etc/terminfo files from 'ncurses' into
> an own package and rrecommending this in the libtinfo package.

I've already added this to few recipes:
http://git.openembedded.org/cgit.cgi/openembedded/log/?qt=grep&q=terminfo

but only as RRECOMMENDS (RDEPENDS would be better), because ncurses-5.7
wasn't default and not all distros had ncurses-terminfo available.

Regards,
-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


