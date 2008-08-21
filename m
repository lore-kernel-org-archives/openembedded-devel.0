Received: from [209.85.162.183] (helo=el-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1KWCuV-0002FG-Hz
	for openembedded-devel@openembedded.org; Thu, 21 Aug 2008 18:21:19 +0200
Received: by el-out-1112.google.com with SMTP id y26so36000ele.21
	for <openembedded-devel@openembedded.org>;
	Thu, 21 Aug 2008 09:20:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=jCb0J7FVTLFgAFAhNS45i3RhhORQ76FAjf8I0BGl3gY=;
	b=iPPguzw9y045kr26BXWFXpeZt+iXXjZYS6mVhQdw4pLzvSN9Ar1sW8Pn4nlxDxnos5
	ttsIAvgum5/9LNHy9lY2ucC+BhfFxCJn+zzINag5EWaWiJkX52CJb//AAOu0ZLtbMuuR
	OM3lkJFzVV47lWlAwOst+9AA/uWZgutm2cqpk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=jijKPLVuGfV+gwOEG+PC4uuLO66fhGl5YKTGK+K9dzdKnb5VN5Gf+GUik05lUBOxNf
	EF6KO/sWiGCXUvxZQ4LHRyRIQz63i+QTe/EG2trIPX2smghjPkWCnvuhKGwdYuqcQ7Rl
	Gwskvl+axrDSXORY2NuiP92eHtQdGzysgFBn8=
Received: by 10.114.58.6 with SMTP id g6mr1642196waa.68.1219335608355;
	Thu, 21 Aug 2008 09:20:08 -0700 (PDT)
Received: by 10.114.241.11 with HTTP; Thu, 21 Aug 2008 09:20:08 -0700 (PDT)
Message-ID: <19c1b8a90808210920j10545e21u874d18157b80f6d3@mail.gmail.com>
Date: Thu, 21 Aug 2008 09:20:08 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1219309425.21890.1.camel@mill.internal.reciva.com>
MIME-Version: 1.0
References: <19c1b8a90808200142y33c5baa3uee2398d7f87b4cc6@mail.gmail.com>
	<1219309425.21890.1.camel@mill.internal.reciva.com>
Cc: openembedded-devel@openembedded.org
Subject: Re: uclibc and uclibc-locale support in gcc 4.3.1
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
X-List-Received-Date: Thu, 21 Aug 2008 16:21:23 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Aug 21, 2008 at 2:03 AM, Phil Blundell <pb@reciva.com> wrote:
> On Wed, 2008-08-20 at 01:42 -0700, Khem Raj wrote:
>> 4. Disable libobjc for arm uclibc. If someone really needs some
>> packages on uclibc which need objc support then you better fix gcc
>> first :)
>
> Actually you seem to be disabling both libobjc and the Objective-C
> compiler itself for all uclibc systems, not just ARM.  Is that what you
> wanted?

Yes because  I saw it failing for x86 uclibc as well.

>
> p.
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


