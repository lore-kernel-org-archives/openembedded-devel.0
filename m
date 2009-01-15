Received: from [209.85.198.240] (helo=rv-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1LNXSB-00071O-QW
	for openembedded-devel@openembedded.org; Thu, 15 Jan 2009 20:00:32 +0100
Received: by rv-out-0708.google.com with SMTP id k29so1434736rvb.0
	for <openembedded-devel@openembedded.org>;
	Thu, 15 Jan 2009 10:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=Kq9XNAnbDf64dFGypCgPfxeCeHTLvqHTDAQ4oFx2rG0=;
	b=El82nmk325xlDV9xLZNCXZ8fI+/XU+t2bPO/xhEdwl96s94+/B7ct1iRxJxk+YblgA
	SOSGuF/j+DMKbj6KA7PwVWSPOcS8TQyPCfk/kowEJCUPRumEFGMXtFkeZSsub9AjuglE
	m4o2T846sdW3rDkhrzgS2kltNGh7aUdnfnlAI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=ezxbEy0bhn/0UHLhgjyuvjWNYOLnYDPLCHShQuxSsvm2SaTzQ4MY2I5os0GOPHb99H
	drduZ45sdM9k/bhxih65yjlgw1sEZY8bO2ange+HxWk9XeQskKrJcmWGpNZzO8aJ1AXe
	dDty/yn4jaZMXYo66shbP0MnfVvg89sdADMEY=
Received: by 10.141.23.7 with SMTP id a7mr753073rvj.238.1232045630896;
	Thu, 15 Jan 2009 10:53:50 -0800 (PST)
Received: by 10.140.194.15 with HTTP; Thu, 15 Jan 2009 10:53:50 -0800 (PST)
Message-ID: <19c1b8a90901151053n5402dcbdle52c090fe5c94c71@mail.gmail.com>
Date: Thu, 15 Jan 2009 10:53:50 -0800
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <gkn5jf$7gl$1@ger.gmane.org>
MIME-Version: 1.0
References: <20090115061418.GA13352@denix.org> <gkmmn6$pmf$1@ger.gmane.org>
	<20090115074118.GC7020@gmail.com> <gkn5jf$7gl$1@ger.gmane.org>
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
X-List-Received-Date: Thu, 15 Jan 2009 19:00:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Thu, Jan 15, 2009 at 3:10 AM, Koen Kooi <k.kooi@student.utwente.nl> wrote:
> On 15-01-09 08:41, Khem Raj wrote:
>>
>> On (15/01/09 07:56), Koen Kooi wrote:
>>>
>>> On 15-01-09 07:14, Denys Dmytriyenko wrote:
>>>
>>>> libvolume-id-dev does not provide the actual .so library, but it
>>>> contains a
>>>> symlink in /usr/lib, which points to /lib/libvolume.so.0 (the host one!)
>>>> instead of ../../lib/ one...
>>>
>>> That's the intended behaviours, since installing the packages will have
>>> it point to ${libdir}/libvolume.so.0 on your device. I'm not sure if we
>>> want to patch every package to use relative symlinks.
>>
>> We would use -dev packages on staged area normally to compile other apps
>> depending on a given packge if we do not fix the symlink I think it will
>> try to link to wrong library.
>
> We don't use the -dev packages to populate staging :) I keep trying to
> convince Richard that we should use them, but he keeps coming up with good
> reasons not to do so :)

Hmm then why do we generate them ?. We do not need these packages on
target unless we switch to
native development on target.

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
>


