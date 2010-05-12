Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCJXC-00035y-MJ
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 May 2010 23:32:10 +0200
Received: by fxm11 with SMTP id 11so577346fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=FVui5SadhIzfEbzroSNV3xvY7zjW3SFxa4bjslAUeu0=;
	b=m0j0BXbjXH3+7Zg8CHenidf2dKQ6bJOOo2zstEXuDRb+mb6wgVJDia2mkJoaMnI762
	Twt0ITYY4kM7if0Fbke//Hsulb1cOUh9ganqxMTm7BobY/Go80UI/d1FZoCavbISUba4
	7HGV2M6SUPkdzBHxEJFqR04Jk7Tlqb1/iCGUM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Qb25EM3olbo3djVhxh2PhdI60pQH6yS8JmYDukT9OEvNbeLbE2razFMW1xQLsNAQyi
	cZZZMGzEYXW8OnrKdMKt6q5iha0B1O6YrfmmQyzk5zZ29w2bSkmQFhnqf7q3oVdaS1BY
	+2sgdJXreWCV4ffs6hcbT++1yz+UYmBdmlNtg=
Received: by 10.223.16.142 with SMTP id o14mr9053960faa.11.1273699688797;
	Wed, 12 May 2010 14:28:08 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm2523521faf.3.2010.05.12.14.28.06
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 May 2010 14:28:07 -0700 (PDT)
Date: Wed, 12 May 2010 23:28:06 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100512212806.GA3370@jama>
References: <20100510232720.GA13708@gmail.com>
	<201005111239.57770.khimov@altell.ru>
	<AANLkTinrTuitVH__A-t7tjdit9HLCf7AYFyl1w4vFLIo@mail.gmail.com>
	<1273657450.1773.43.camel@saphir> <20100512174902.GA9872@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20100512174902.GA9872@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] Move sane-toolchain defaults for gcc binutils and eglibc
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
X-List-Received-Date: Wed, 12 May 2010 21:32:10 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 12, 2010 at 10:49:02AM -0700, Khem Raj wrote:
> On (12/05/10 11:44), Michael 'Mickey' Lauer wrote:
> > Am Mittwoch, den 12.05.2010, 11:39 +0200 schrieb Martin Jansa:
> > > On Tue, May 11, 2010 at 10:39 AM, Roman I Khimov <khimov@altell.ru> wrote:
> > > > В сообщении от Вторник 11 мая 2010 03:27:20 автор Khem Raj написал:
> > > >> 4.4.3 is not so widely used in distributions unlike 4.4.2
> > > 
> > > Hi,
> > > 
> > > My guess: just because it's not preferred by sane-toolchain.inc?
> > > 
> > > >> I can also just add 4.4.4 and leave 4.4.3 as it is if someone wants
> > > >> to keep using 4.4.3
> > > >
> > > > Using 4.4.3 here, think it'd be nice to move to 4.4.4.
> > > 
> > > what about updating
> > > conf/distro/include/sane-toolchain.inc
> > > to 4.4.4 if we don't find any new issue with it?
> > 
> > Sounds good.
> 
> Here is a patch to move gcc to 4.4.4, eglibc to 2.11 and binutils to
> 2.20.1 releases as defaults. I have tested this combination on ARM
> and x86 without any regressions that I dont have on existing combination. 
> 
> sane-toolchain.in is used by kaeilos-2010, shr, micro and minimal DISTROs
> if the maintainers are ok with this then please ack this patch
> 
> Thanks
> -Khem
> 
> Signed-off-by: Khem Raj <raj.khem@gmail.com>

We (SHR) are using this combination already without problems, so ACK.

Acked-by: Martin Jansa <Martin.Jansa@gmail.com>

> diff --git a/conf/distro/include/sane-toolchain.inc b/conf/distro/include/sane-toolchain.inc
> index daa2def..7f249b0 100644
> --- a/conf/distro/include/sane-toolchain.inc
> +++ b/conf/distro/include/sane-toolchain.inc
> @@ -5,14 +5,14 @@
>  #############################################################################
>  
>  # Base line versions, good for most things
> -PREFERRED_GCC_VERSION                ?= "4.4.2"
> -PREFERRED_BINUTILS                   ?= "2.20"
> +PREFERRED_GCC_VERSION                ?= "4.4.4"
> +PREFERRED_BINUTILS                   ?= "2.20.1"
>  
>  # Prefer glibc 2.6 and uclibc 0.9.30, these have had the most testing.
>  PREFERRED_VERSION_glibc             ?= "2.10.1"
>  PREFERRED_VERSION_glibc-initial     ?= "2.10.1"
> -PREFERRED_VERSION_eglibc             ?= "2.10"
> -PREFERRED_VERSION_eglibc-initial     ?= "2.10"
> +PREFERRED_VERSION_eglibc             ?= "2.11"
> +PREFERRED_VERSION_eglibc-initial     ?= "2.11"
>  PREFERRED_VERSION_uclibc            ?= "0.9.30.1"
>  PREFERRED_VERSION_uclibc-initial    ?= "0.9.30.1"
>  

> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


