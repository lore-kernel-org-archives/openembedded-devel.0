Received: from mail-fx0-f212.google.com ([209.85.220.212])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NWxVh-0000wH-Ra
	for openembedded-devel@lists.openembedded.org;
	Mon, 18 Jan 2010 20:43:40 +0100
Received: by fxm4 with SMTP id 4so1139425fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 18 Jan 2010 11:41:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=qhwRu5IRMlCGzCFEEuqkA2K/xyBve4x4dIs4mDYdR84=;
	b=mVJaOoZ2fS6OS71iWOD6sHSu3b5Ts748nl2jRQNHuR62mgE/dj3ZXifpuE2K4cWoJo
	75Erz9cLejkYEi8w4rsAbLR8sxFQelX5q37nss9OBoTzRT1O82+O7YlV/RyCaoILEVY0
	7Mxm4p7XyRAeFwSVtG5xqimT0uUxmndHJIC6U=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=Xc28anNQtj7Nfy5c+AVNpOjpAxBGu4gIh9D+E1L6EFeO9uyvEb/d8Hnfz9MrTCYLtJ
	//rxDP2L23tAJ6cmBFlFWCXHRhN1tDiaMVyL9E1HbIeKqEwiA1I0y42qzYi+yUWsgOXw
	YVA9uZq6Kvpb8UsWarbBYyo1mjhdJHNm+LAqE=
Received: by 10.87.46.24 with SMTP id y24mr338949fgj.1.1263843683296;
	Mon, 18 Jan 2010 11:41:23 -0800 (PST)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id 3sm11663626fge.16.2010.01.18.11.41.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 18 Jan 2010 11:41:22 -0800 (PST)
Date: Mon, 18 Jan 2010 11:41:37 -0800
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100118194137.GA31712@gmail.com>
References: <> <1263733818-32111-1-git-send-email-camelguo@gmail.com>
	<201001171430.39964.holger+oe@freyther.de>
	<op.u6oir0rqmn1qzu@guohr-laptop-ubuntu>
MIME-Version: 1.0
In-Reply-To: <op.u6oir0rqmn1qzu@guohr-laptop-ubuntu>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.212
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] Set preferred glibc to 2.10.1 in conf/distro/micro.conf
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
X-List-Received-Date: Mon, 18 Jan 2010 19:43:40 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On (17/01/10 21:37), Guo Hongruan wrote:
> 在 Sun, 17 Jan 2010 21:30:39 +0800，Holger Hans Peter Freyther
> <holger+oe@freyther.de> 写道:
> 
> >On Sunday 17 January 2010 14:10:18 Guo Hongruan wrote:
> >>* the preferred version of binutils of conf/distro/micro.conf is 2.19.51
> >>* the preferred version of glibc is 2.6.1 which is defined in
> >> sane-toolchain.inc * the ld produced by binutils-2.19.51
> >>reports that it
> >> can not find the __begin symbol when linking with glibc-2.6.1
> >
> >It would be really great if you could start to read emails too.
> >
> >So now we now two ways to cure the symptoms but we have no idea about the
> >underlying root cause.
> >
> >Is it too much to ask what the actual error is? The __begin
> >reminds me of a
> >bug in the linker script Khem was pointing out?
> 
> 
> I guess you are using latest binutils. There has been changes in ld
> which surfaced this issue. So either you could switch back to using
> older binutils like 2.18 or something. Or you could also port the patch
> recipes/glibc/glibc-2.9/glibc-2.9-use-_begin.patch
> 
> That's the cause of the building failure. I think it is better to
> use the newer version of glibc that to port the patch to glibc-2.6.1

It takes quite a bit to validate a toolchain (gcc/binutils/libc) before
it is pushed as default preference. Dont use sword to kill a
fly. You could very well backport the one patch and keep using 2.6.1
if you want to upgrade make sure that its stable enough and tested
enough on some common architecuture/machines but as eglibc is default
libc for micro I wouldnt worry too much for glibc as it might not hit
all users of micro.
> 
> 
> >
> >_______________________________________________
> >Openembedded-devel mailing list
> >Openembedded-devel@lists.openembedded.org
> >http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> 
> 
> -- 
> Guo Hongruan, Embedded Linux Consultant
> Skype: camelguo
> Twitter: camelguo
> http://www.gulessoft.com
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


