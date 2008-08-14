Received: from [66.249.82.234] (helo=wx-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KTfRM-0008W9-Ou
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Aug 2008 18:12:44 +0200
Received: by wx-out-0506.google.com with SMTP id i29so332972wxd.3
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 14 Aug 2008 09:12:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=LrzWOGID0UIjmt6R+0rNgN+RC0ijVG2qwqVdrHgaBYU=;
	b=IG93kw86Qiak9HTJfHeDibJjg0EUcMJr7cS7YZewfDtZ/1fJepATRmhDgCueuXN8kB
	Mg7vYFZUOVEj0MUUenCUsnc2/8PfQaTAdhMMvx0qhVoJLKkNNnYaU6Kc3Dm325no6Tyi
	CpZQEzfLdt9mhL6FdsKV9s7JTVwRNImeXgBF8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=xrZo54Ob7HeFv+rs7BSyvd6Ka3AismBeOFNVnWtUtkdu0io+ZaKwxRIR/4tiRKlV31
	gV0L9tFCkxQFiD/u9OySAPhIaYWUzM4RMvpwiyfd4+RRgXDc1Ry73bJbmcNdORprwJCd
	lolloBECXBjPB396VzHc4UTEQ6zrtob+JOjRk=
Received: by 10.114.123.19 with SMTP id v19mr1393832wac.168.1218730323671;
	Thu, 14 Aug 2008 09:12:03 -0700 (PDT)
Received: by 10.114.241.11 with HTTP; Thu, 14 Aug 2008 09:12:03 -0700 (PDT)
Message-ID: <19c1b8a90808140912i1130cc41te354a7becc6dceaf@mail.gmail.com>
Date: Thu, 14 Aug 2008 09:12:03 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <200808051841.39947.mickey@vanille-media.de>
MIME-Version: 1.0
References: <1217952738.24777.175.camel@mill.internal.reciva.com>
	<200808051841.39947.mickey@vanille-media.de>
Subject: Re: enabling objc in gcc
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
X-List-Received-Date: Thu, 14 Aug 2008 16:12:45 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I think it was disable to get over a libobjc build issue seen on uclibc. see
http://gcc.gnu.org/bugzilla/show_bug.cgi?id=32332

But I am still getting this issue even after this is disabled.

Thanks

-Khem

On Tue, Aug 5, 2008 at 9:41 AM, Michael 'Mickey' Lauer
<mickey@vanille-media.de> wrote:
> Am Dienstag 05 August 2008 18:12:18 schrieb Phil Blundell:
>> At the moment, Objective-C seems to be disabled in
>> gcc-configure-common.inc.  Is there any particular reason for this, or
>> alternatively are there any objections to enabling it?
>
> Fwiw, I'd like to see that enabled as well.
>
> --
> :M:
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


