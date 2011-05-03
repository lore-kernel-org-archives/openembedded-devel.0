Received: from mail-px0-f169.google.com ([209.85.212.169])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1QHKab-0002dv-NQ
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 May 2011 20:44:53 +0200
Received: by pxi9 with SMTP id 9so211829pxi.28
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 03 May 2011 11:42:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:date:from:to:subject:message-id
	:mail-followup-to:references:mime-version:content-type
	:content-disposition:in-reply-to:user-agent;
	bh=KPUnPt0Wo4SVuSbCLvbZhDlhuM4DZAYVTgL9jLIWSZ8=;
	b=lpKtFd6jSpOBT2NN6di383XycsaHQus55kwaCxPt3p1MzECy0V6kNvgEiFzFPx3LFo
	msHGMq1uNcwYy6WNKHc5XxTN6t9Qg00Dk2ga8byf1dQKPrC75n1evWhwFKARdO4oTn3L
	iINJu27gotWjoR5HuSCpBFiC8P/MJr30AyYbA=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mail-followup-to:references
	:mime-version:content-type:content-disposition:in-reply-to
	:user-agent;
	b=if8n7xQlkTDqQdpLDi7INEIiVtIKZP5yfGp2q9ybZn3SF4PCDhL402ZrD4L2YgZUF1
	ohAhAABs1Qz/UYv87NdSstD/x9dJRTyIZTyfsWEDU490zNvpfJXQx2dzxfT+Ow0ZE704
	5hPTQd3zdbhEe3PdfAJXZHEI0fVFyWSbUyc3Q=
Received: by 10.68.27.68 with SMTP id r4mr243909pbg.133.1304448132342;
	Tue, 03 May 2011 11:42:12 -0700 (PDT)
Received: from sakrah.homelinux.org
	(99-57-141-118.lightspeed.sntcca.sbcglobal.net [99.57.141.118])
	by mx.google.com with ESMTPS id o3sm194474pbt.61.2011.05.03.11.42.09
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 03 May 2011 11:42:10 -0700 (PDT)
Date: Tue, 3 May 2011 11:41:40 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20110503184140.GC5436@sakrah.homelinux.org>
Mail-Followup-To: openembedded-devel@lists.openembedded.org
References: <4DA97D88.9020509@atmel.com>
MIME-Version: 1.0
In-Reply-To: <4DA97D88.9020509@atmel.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: undefined reference to `__gnu_thumb1_case_uqi'
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
X-List-Received-Date: Tue, 03 May 2011 18:44:54 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (16/04/11 13:29), Ulf Samuelsson wrote:
> The following code, (part of a bootloader - at91bootstrap-3.0)
> 
> "void sub(unsigned char Mode)
> {
>     switch (Mode) {
>     ...
>     /* 4 case statements */
> "
> 
> generates an error when compiling in thumb mode, using the latest OE.
> 
> "undefined reference to `__gnu_thumb1_case_uqi'"
> 
> I think this subroutine will optimize a switch statment
> with only a few choices.
> 
> 
> Googling for this seems to indicate that __gnu_thumb1_case_uqi is part
> of libgcc, but hidden.
> 
> Switches used: -DCONFIG_THUMB -mthumb -mthumb-interwork
> 
> Any clues on fixing this?

what is your linker command ? Are you using gcc to do the linking or
calling out ld explicitly.

> Meanwhile I will rewrite the bootloader using if statements
> 
> Best Regards
> Ulf Samuelsson
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

-- 
-Khem


