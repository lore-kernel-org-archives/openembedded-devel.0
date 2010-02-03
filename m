Received: from mail-yw0-f195.google.com ([209.85.211.195])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dennis.yxun@gmail.com>) id 1NcZbD-0006ub-Ig
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Feb 2010 08:24:34 +0100
Received: by ywh33 with SMTP id 33so993916ywh.16
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 02 Feb 2010 23:22:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=c/DnahY9TkVt90Ml3qNDcTFGCSgUoibLjko7txckNec=;
	b=CwbBR/sbDKyBaXR4HVnPC4t8RVGx1CdQKCvy3CDFgdopuoQWSFgIpLw5JxHCtnaB5z
	ibyZuZH+cUgwj2hjDihIbs06ihao03ayY8hEVKK0BYQUqfYgLL5W1QB/5DYBrXFEiVzO
	0OqiVPI8WRBNzqXdWfiZPZsYNymrNujSW8OyY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ILabyyRaYQmV83QB+gDf+HqMyCrbXEwt0XT24etbJIs0Zedb4q0IDudPoZiFWqMrcH
	NAZ+Tad1FluNwhKG+zmWefrB37HznrTzy7LbuO7fUQLjaeS+l7S4fJV9K0P1thGo34Z/
	eF8CJ9GIC3RlVlhlbMWozFHmhfVEQJYCJA6zc=
MIME-Version: 1.0
Received: by 10.150.63.15 with SMTP id l15mr9805950yba.250.1265181723491; Tue, 
	02 Feb 2010 23:22:03 -0800 (PST)
In-Reply-To: <ad82c8891002022244ic33360do6596413f17d95972@mail.gmail.com>
References: <ad82c8891002022244ic33360do6596413f17d95972@mail.gmail.com>
Date: Wed, 3 Feb 2010 15:22:03 +0800
Message-ID: <7b09df4c1002022322o657c4135i698130baf5ff4fcb@mail.gmail.com>
From: "Dennis.Yxun" <dennis.yxun@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.195
X-SA-Exim-Mail-From: dennis.yxun@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Touchscreen is not working in compulab Em-x270
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
X-List-Received-Date: Wed, 03 Feb 2010 07:24:34 -0000
Content-Type: text/plain; charset=UTF-8

Hi vivek:
    Have you ever tried tslib test utils to verified your driver?
    You have to narrow down your problem, kernel space, tslib, Xserver..
Or just configuration problem...

Dennis

On Wed, Feb 3, 2010 at 2:44 PM, vivek tambakad <vivektambakad@gmail.com>wrote:

> Hi,
>       I have ported x11-image onto the compulab Em-x270 board, but
> touchscreen is not working.
> The touchscreen kernel modules are present and i think there is problem in
> user space.I tried following command:
> *export TSLIB_TSDEVICE**=/dev/input/touchscreen0*
>  Please guide me in solving this issue.
>
> with regards
> vivek tambakad
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

