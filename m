Received: from mail-bw0-f226.google.com ([209.85.218.226])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <d.vinokuroff@gmail.com>) id 1NXVGY-0002h5-F4
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Jan 2010 08:46:17 +0100
Received: by bwz26 with SMTP id 26so15113bwz.27
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Jan 2010 23:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:references:in-reply-to
	:content-type:content-transfer-encoding;
	bh=/ZghX3ahQlubk2gjVs+YuLAMUoB10AsFRgZLxYqv8Zs=;
	b=GNhTmZ3oor+9fekBhSSI3TEPTS5irjr4c1QVVZssGIfcax/zvJpqLgrWs4Y4MnlkMN
	S2HudA/Tv1yrHHSVGhH7PxfFG+Xh+gx0giY1lukpOrVEPOoKlltQebiXEjef2GVLSpik
	umolGEJN991hWpj672DGynI04UnHTdrVh0vsw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=t7r/5x7bnCSWr+Ad6GAlpWNPgTSdF+ehumFl6XgH2QC5n6tlGo0izN1+SjPMVxRzV7
	3XV54IbmKd8axYfAWHtq38bAoElMJyiue1rqjwlE0mQkTGgKl01nBnvKdViX9MuE/OZw
	NkVuYOMTGl8Eixk0ZgZcxCge+9le2hk8jJtFc=
Received: by 10.204.33.20 with SMTP id f20mr1946250bkd.196.1263973438073;
	Tue, 19 Jan 2010 23:43:58 -0800 (PST)
Received: from ?192.168.0.100? ([94.180.15.197])
	by mx.google.com with ESMTPS id 16sm1417543bwz.3.2010.01.19.23.43.56
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Jan 2010 23:43:57 -0800 (PST)
Message-ID: <4B56B43C.1010909@gmail.com>
Date: Wed, 20 Jan 2010 12:43:56 +0500
From: Dmitry Vinokurov <d.vinokuroff@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.8pre) Gecko/20100104 Shredder/3.0.1pre
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4B55E183.3090408@gmail.com>
In-Reply-To: <4B55E183.3090408@gmail.com>
X-SA-Exim-Connect-IP: 209.85.218.226
X-SA-Exim-Mail-From: d.vinokuroff@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: How to choose locales?
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
X-List-Received-Date: Wed, 20 Jan 2010 07:46:17 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I should set IMAGE_LINGUAS = "en-us" in image recipe. Now it's only 
en_US in locale dir, as I want.

P.S.: sorry for double post, thunderbird error.

On 19.01.2010 21:44 Dmitry Vinokurov wrote:
> Hello,
>
> How can I choose locales, generated to /usr/lib/locale? Tried to set:
> ENABLE_BINARY_LOCALE_GENERATION = "1"
> GLIBC_GENERATE_LOCALES = "en_US.ISO_646.BASIC"
>
> but still de_DE,  en_GB,  fr_FR in locales dir of image tarball. 
> 'bitbake -e' says that vars are exactly as I set it.
>
> Am I setting right variables?
>
> Thanks
>
-- 
Best Regards,
Dmitry Vinokurov
<d.vinokuroff@gmail.com>



