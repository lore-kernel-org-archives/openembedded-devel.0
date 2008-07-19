Received: from [209.85.198.244] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KKAly-0002HL-Tb
	for openembedded-devel@lists.openembedded.org;
	Sat, 19 Jul 2008 13:38:47 +0200
Received: by rv-out-0708.google.com with SMTP id f25so700636rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 19 Jul 2008 04:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=l6WjJCEe5BGaO2xNtC2hqAmxjNxG4UjHMSiEoMEzsaQ=;
	b=GuAmHFZNVqR/38jhDgpE71+h3TujeIpCtXp8vL4SbK/ZzK+Ro07QyqGKmREEF8SnUT
	08Ifmb4URxzDAeTWFpKeu2+rScg99K8gxmZOJ2a6wNPOq0Nkf8C64rVIlVMZGiQCyQ82
	MTiGVIf+YY/QPVyu0wpdRoUKRECFXt+91Q0pQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=mttBSjk1AlCdo3tRj2nYl2FaRc2PJXB//oUVKqRKCugFkoiGJsQ1ZosyRCI1Aq15PA
	N+rJ/PJs4WuKNFMxcbXAkWz0m3+JhXX5ni8eBwZ0GnlxWtBxvyRYi+zETf+kW31jSSt8
	5uvxK97DnIsMAdW3SBLN+kGu2IYwRYC6bwg48=
Received: by 10.115.46.9 with SMTP id y9mr1012622waj.23.1216467473197;
	Sat, 19 Jul 2008 04:37:53 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Sat, 19 Jul 2008 04:37:53 -0700 (PDT)
Message-ID: <f96d234e0807190437i439cd05ctc4fb8d51c653c640@mail.gmail.com>
Date: Sat, 19 Jul 2008 07:37:53 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4880E6BF.3070102@atmel.com>
MIME-Version: 1.0
References: <4880715F.80707@atmel.com> <g5qjd2$5tg$1@ger.gmane.org>
	<4880E6BF.3070102@atmel.com>
Subject: Re: How update kernel recipe?
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Sat, 19 Jul 2008 11:38:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Fri, Jul 18, 2008 at 2:53 PM, Ulf Samuelsson
<ulf.samuelsson@atmel.com> wrote:

> If you have a number of linux_<version>, some with and some
> without support for your board, then it is harder to
> get an overview which kernels are supported.
>
> Drawback would be if you lose out on interesting features
> added by others by using a proprietary recipe.
>
> Very few machines seems to use the vanilla linux.
> Is there any move to merge current boards into vanilla linux_<version> ?

I have been using generic kernels for the GESBC, and CM-X270 work, and
it seems to work pretty well, so that would be my vote.  You're
correct, it is less obvious what kernel supports what board, so
perhaps a readme in the kernel directory would help?

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


