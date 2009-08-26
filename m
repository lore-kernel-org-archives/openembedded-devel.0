Received: from [209.85.216.188] (helo=mail-px0-f188.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1MgDQR-0000Zk-SW
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Aug 2009 10:00:13 +0200
Received: by pxi26 with SMTP id 26so6571940pxi.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Aug 2009 00:42:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:in-reply-to:user-agent;
	bh=cYLO4quKLRLw4D6GCl3ve/65XZaG/ZTmYxsbSDqwg1c=;
	b=IUoDCFOqDsKfpyanNGm9ZI/zwX0yHdQcE2XnO75l504wwgOj7WI+y32dUeu/ubID/i
	YrJsKFt1tuMDms5I4BPicFJe5OtzZ3VQPacA0VmKJWgOu1aWFd0PqpDQzS5l8+BPMpsA
	07zuVa528CvVu/C/8QKrro5IHPqDCD6IQ33GU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:in-reply-to:user-agent;
	b=dIn3rkRwLZ2aggEYX10L48tHKAsN9hCyucOSGDb1TRIvfvOw1hf7ziLLciD/1gl2aj
	w3En47uNDkYLPN1JjWjO+cgHWrwbkAjW0WhAtpul4YeMSzpaGX2bzn7X/ZgWuhtw+SAW
	wpWxkGktJfsdGttZbsdF/3rFU0gC0QPrzsMJg=
Received: by 10.115.100.38 with SMTP id c38mr9317135wam.110.1251272534045;
	Wed, 26 Aug 2009 00:42:14 -0700 (PDT)
Received: from gmail.com (adsl-71-146-29-169.dsl.pltn13.sbcglobal.net
	[71.146.29.169])
	by mx.google.com with ESMTPS id k21sm806346waf.24.2009.08.26.00.42.11
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 26 Aug 2009 00:42:12 -0700 (PDT)
Date: Wed, 26 Aug 2009 00:42:06 -0700
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20090826074206.GA9008@gmail.com>
References: <1251081101-18925-1-git-send-email-raj.khem@gmail.com>
	<200908240549.09079.holger+oe@freyther.de>
	<200908240848.32719.mickey@vanille-media.de>
MIME-Version: 1.0
In-Reply-To: <200908240848.32719.mickey@vanille-media.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH] base.bbclass: Replace os.system with subprocess call.
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
X-List-Received-Date: Wed, 26 Aug 2009 08:00:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On (24/08/09 08:48), Michael 'Mickey' Lauer wrote:
> As a general reminder, please avoid import statements in functions. They're 
> just wasting cycles. Put them into global scope.

looking at base.bbclass I decided to leave it as it is to conform to
other functions coding style but may be we should move the import to
global scope at once sometime.

Thanks

-Khem

> 
> :M:
> 
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


