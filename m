Received: from mail-qy0-f172.google.com ([209.85.221.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1OCdCL-0007MY-AF
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 20:31:54 +0200
Received: by qyk2 with SMTP id 2so1456451qyk.20
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 11:27:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:sender:received
	:in-reply-to:references:from:date:x-google-sender-auth:message-id
	:subject:to:content-type;
	bh=fzSeRmkS6z6DEjHs/+Qvi1R9fH5xOxZnUVDBqBruHzY=;
	b=rJx+L4UjsPj9yIxKcu6fhEhCs++qZnOdB3CLyWjk9EawOUy1ma0oUPzj8enuhXuiMb
	yPD2esDvYKVR3JQrX5jZKfkpvd8k4hjkjZTHyPWwXNkC0rk44xgpSlcE9DzhB0g07W8T
	isV8l5SRjAGPcuBY4Qaw1Y9+ZKyAoM73zRrnk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=uDXp8mtAJn7QoqxfKVED+YVGFg8HKO2MygtVaHwAChR6CNvXrmdaVCvpheKqVzgxCa
	8OCoaDgUGjcA4V/k3FUkg8jL1rG+vUz4uwOnhVRkQ3siNAO/c3zITzATQV21Q5zrkPBA
	FT6NAU/lXV21j91nquHSdcBZTIKDBEFkOkodY=
Received: by 10.224.110.84 with SMTP id m20mr6323614qap.242.1273775251802; 
	Thu, 13 May 2010 11:27:31 -0700 (PDT)
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.222.77 with HTTP; Thu, 13 May 2010 11:27:07 -0700 (PDT)
In-Reply-To: <alpine.DEB.2.00.1005131412550.6436@lynx>
References: <alpine.DEB.2.00.1005131412550.6436@lynx>
From: Chris Larson <clarson@kergoth.com>
Date: Thu, 13 May 2010 11:27:07 -0700
X-Google-Sender-Auth: _tNmRnWcj7CQdB0WXEPDVB8YSxM
Message-ID: <AANLkTimgnFG24NWlGZu4hmXBwpCnJRtX1t1jsNqwhGdc@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.221.172
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: bitbake fetch vs fetchall?
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
X-List-Received-Date: Thu, 13 May 2010 18:31:54 -0000
Content-Type: text/plain; charset=UTF-8

'fetch' fetches for the one recipe you're requesting.  If you bitbake -c
fetch busybox, it fetches busybox.  If you bitbake -c fetchall busybox, it
fetches busybox and all of busybox's dependencies.  This is the case for all
the tasks which end in 'all'.

On Thu, May 13, 2010 at 11:18 AM, Robert P. J. Day <rpjday@crashcourse.ca>wrote:

>
>   based on a quick google, i realize i'm not the only person who's
> once been burned by not knowing about the bitbake "fetchall" command
> versus the "fetch" command.  and i'm aware that, if one wants to fetch
> absolutely *all* software required for a given target, one must use
> "fetchall".
>
>  so, first, what's the difference between these two commands?  and,
> second, there's precious little explanation in the current OE user
> manual about "fetchall".  in fact, in the user manual, there is the
> explanation:
>
> fetch
>
>    Try to download all of the required source files, but don't do
> anything else with them.
>
> which would seem to be slightly misleading and is bound to trip
> someone up.  should not the user manual be extended to describe
> "fetchall"?
>
> rday
>
> --
>
> ========================================================================
> Robert P. J. Day                               Waterloo, Ontario, CANADA
>
>            Linux Consulting, Training and Kernel Pedantry.
>
> Web page:                                          http://crashcourse.ca
> Twitter:                                       http://twitter.com/rpjday
> ========================================================================
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

