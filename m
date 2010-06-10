Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OMmx9-00052s-La
	for openembedded-devel@lists.openembedded.org;
	Thu, 10 Jun 2010 20:58:12 +0200
Received: by fxm9 with SMTP id 9so219346fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 10 Jun 2010 11:53:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=NwOW7ydBCx+zb4hTqEORQmKDo4g8RyQYnMtpwC6b1D8=;
	b=GHqDHCiPol8PpWJzbcLWzSf5xXkXLMhkUhhyjYZImE6wSsfs+miO1Q4OOb7VQ/+VYE
	SdRhr4USL4zqZN6HXdaQfVBbVTNEkRB/WxP0YRNY22WzLIHw/v+zEP1jlyIEoSljGJoV
	qyQkH6ePBwkDfuJ0EA4I/rR0jvs+n3HQDfcxw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=vL92RMfFLFCQNWQfKA1S3/QJDFqF4DNv/EPymEcvkqMR87iBYfGyFEXBVXvCdsKRky
	kb//gTEmxiUxhLafzlDSG4UWvZoA+yE1X0HffSUUnF5FOLlbdAmzI9EW70AjUkIv5EaC
	BsJo3ObLCOsYnYPdufKkEKdPir0c3Ku/zeiwY=
Received: by 10.223.21.17 with SMTP id h17mr791042fab.45.1276196025524;
	Thu, 10 Jun 2010 11:53:45 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id u12sm1201897fah.16.2010.06.10.11.53.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Thu, 10 Jun 2010 11:53:44 -0700 (PDT)
Date: Thu, 10 Jun 2010 20:53:33 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100610185333.GO1403@jama>
References: <1276178833-30841-1-git-send-email-Martin.Jansa@gmail.com>
	<201006102153.49588.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201006102153.49588.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] recipes: conform to OE packaging guidelines with RSUGGESTS/RPROVIDES/RCONFLICTS/RREPLACES
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
X-List-Received-Date: Thu, 10 Jun 2010 18:58:12 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Jun 10, 2010 at 09:53:49PM +0400, Roman I Khimov wrote:
> В сообщении от Четверг 10 июня 2010 18:07:13 автор Martin Jansa написал:
> > * even worse than last RDEPENDS/RRECOMMENDS change, because now ie:
> >   opkg info coreutils-doc
> >   Provides: textutils, shellutils, fileutils
> >   Replaces: textutils, shellutils, fileutils
> > 
> > Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
> 
> Any chance to automatically bump PR for all packages touched?

Well PR should be bumped with previous much bigger RDEPENDS/RRECOMMENDS patch already :/.

But my sed foo is not strong enough to replace it quickly (especially
with INC_PR and changes in .inc files).

I did rebuild from scratch + reflash on my devices and plan to bump
DISTRO_PR soon for SHR.. so I'm not really motivated to do :/.

Regards,

-- 
Jansa 'JaMa' Martin     jabber: Martin.Jansa@gmail.com


