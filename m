Received: from [209.85.198.247] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LNMxL-0001Xn-Mf
	for openembedded-devel@lists.openembedded.org;
	Thu, 15 Jan 2009 08:48:01 +0100
Received: by rv-out-0708.google.com with SMTP id f25so1068597rvb.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 14 Jan 2009 23:41:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=gW+9hFvHuxgvRs5adrB93Kbq8vK8FAGGYvP2E9LTxu0=;
	b=igGCfaXhVXVatcDJ+UPOiw6zkdSEHxghUFY5Va0xwXj6aRXS5r6PyfURW8MtMwpDVo
	d9x9fo793HZL2p9gv7iA8YM1A6qd3+GOVs+c+U6PWnzvg5rsL0b7Ng5pkJakGgs5RGqL
	s7l+VazASGhBNDZHPFK3XwWzt5n+PDIVYUJYc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=BbSLwHhTVNEjirdisX1WJfFufoGcVlZwKgruqgPqjxaGpUq0A+INJZxypy7QKJGHAs
	Yl66xF9Zco9Lk+s2dgYOQf/4Re1ROCSUiCEbWqAK1t79fAr7JidQ5cOt17FxRD0iazSk
	jBdvA6uio+Ekkqne0HvLvb0cozfAET352qppg=
Received: by 10.114.211.2 with SMTP id j2mr677727wag.139.1232005280812;
	Wed, 14 Jan 2009 23:41:20 -0800 (PST)
Received: from localhost (adsl-71-146-7-99.dsl.pltn13.sbcglobal.net
	[71.146.7.99])
	by mx.google.com with ESMTPS id m28sm49899943poh.25.2009.01.14.23.41.19
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 14 Jan 2009 23:41:20 -0800 (PST)
Date: Wed, 14 Jan 2009 23:41:18 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090115074118.GC7020@gmail.com>
References: <20090115061418.GA13352@denix.org> <gkmmn6$pmf$1@ger.gmane.org>
MIME-Version: 1.0
In-Reply-To: <gkmmn6$pmf$1@ger.gmane.org>
User-Agent: Mutt/1.5.17+20080114 (2008-01-14)
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC] Fix udev pulling in libvolume-id-dev
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
X-List-Received-Date: Thu, 15 Jan 2009 07:48:02 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (15/01/09 07:56), Koen Kooi wrote:
> On 15-01-09 07:14, Denys Dmytriyenko wrote:
>
>> libvolume-id-dev does not provide the actual .so library, but it contains a
>> symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!)
>> instead of ../../lib/ one...
>
> That's the intended behaviours, since installing the packages will have  
> it point to ${libdir}/libvolume.so.0 on your device. I'm not sure if we  
> want to patch every package to use relative symlinks.

We would use -dev packages on staged area normally to compile other apps
depending on a given packge if we do not fix the symlink I think it will
try to link to wrong library.


>
>> The first patch attached fixes this in udev and should be a no brainer. Unless
>> someone objects, I'll push it in in a day or two.
>>
>> Since I was debugging the code which actually does this shlib magic in
>> package.bbclass, I thought it might be useful to prevent this kind of issues
>> in the future by skipping symlinks while looking for SONAME/NEEDED in the
>> objdump - please see the second patch attached and provide feedback.
>
> The change to package.bbclass looks OK to me, if that gets applied we  
> can leave out the udev patch.
>
> regards,
>
> Koen
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


