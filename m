Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1P5vWF-0004n7-QO
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 09:13:01 +0200
Received: by bwz9 with SMTP id 9so1968082bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 00:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=jUS6gFqjQvzyz1mNpF+Nrnmlte2Du8CSy/oRTdu6NCQ=;
	b=V6w0lGSpdEZW2NimPMClDV4Cqm4xQfQMB1NI7uFnBc8u9uy15Hdgr5PAA6V/UqSm8b
	MtKOoxrxhO05b2KUzreWPaJl7w/xBOUV1Bm5f+gwPhPv2HCs6HuOibN4cYR2OWR+G6Li
	HOYfCnlICJ9nvji5WE8lC+m0GNAZIRyaTs3AY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=EmHyHhiAD4EC+VThtt8KhK7OteUaxtIiVkSHdNzyG+83oWjzXHl1kaQTr51+u5R5Tc
	7ipw7Jds6CKPFdiMVzTWsk14+1uOFTnPhVbXp/1ekSYpyhxwPwHWdNfDRHMIIdm6OtNQ
	WJ5xmsqSglRdTAGa9WNTZLTDXnZ0VkN+7EZr4=
Received: by 10.204.69.18 with SMTP id x18mr7309463bki.34.1286953951134;
	Wed, 13 Oct 2010 00:12:31 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id o12sm6904004bkb.9.2010.10.13.00.12.29
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Oct 2010 00:12:30 -0700 (PDT)
Date: Wed, 13 Oct 2010 09:12:28 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20101013071227.GD3549@jama>
References: <1286935114-4673-1-git-send-email-raj.khem@gmail.com>
	<AANLkTinMcWBJG3WprZVTw038rMfO4pjNcyre-Bg3ZhMi@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <AANLkTinMcWBJG3WprZVTw038rMfO4pjNcyre-Bg3ZhMi@mail.gmail.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] distutils-common-base.bbclass: Prepend STAGING_LIBDIR to linker library search path.
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
X-List-Received-Date: Wed, 13 Oct 2010 07:13:01 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, Oct 13, 2010 at 08:59:40AM +0200, Frans Meulenbroeks wrote:
> 2010/10/13 Khem Raj <raj.khem@gmail.com>:
> > * This was done generically in bitbake.conf this should be done on
> >  demand and distutils based recipes seem to need it. So we define it
> >  here.
> 
> Based on your commit message I expected a change in bitbake.conf too.
> Am I mssing something here?

That changes was already commited and it's used only for
LIBTOOL_HAS_SYSROOT.

This is fixing build of all python recipes using distutils.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

-- 
Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com


