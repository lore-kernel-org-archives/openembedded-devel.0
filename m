Received: from [209.85.217.170] (helo=mail-gx0-f170.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1LlWpz-0002ek-JO
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Mar 2009 00:12:15 +0100
Received: by gxk18 with SMTP id 18so4778211gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 22 Mar 2009 16:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:date:x-google-sender-auth:message-id:subject:from:to:cc
	:content-type:content-transfer-encoding;
	bh=JLquwBvfmxbychh5t1kslFllrFQLf9gmv29TgOJkA+U=;
	b=fYgyybwW7/QX9wR1eicMevw/nRTjpIiofEVc07cHjnW18DB2CzQ5W+FgXf6Dk7B+g6
	HWzy61svOKDFnXulC3ZSWmgkLUekzEM2o0kFrdWdpeADR0L2L3/DvB1ibCMEo3l9beRw
	QQBDlhJsP0u9NIu5Gwo4up/BiKzOWi0hW3dho=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	b=k1nO99r6i8wG+bJxNzfVsX+tsK6LbgzcTQe6oRMwKjP2xutdFlaL9kX+miMEVjyAD7
	wQIFw8ab1Xrmui4yQVOdPdtJ/IPsXGM5wcwXTteNeWVj1UCUeXxN6LiFRYBdoBxpXDzf
	pEPqEnwR2S/QrOSAaziNQfwKQKarNqmPCghiA=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.151.142.16 with SMTP id u16mr10961932ybn.125.1237763454614; 
	Sun, 22 Mar 2009 16:10:54 -0700 (PDT)
In-Reply-To: <200903222019.02947.marcin@juszkiewicz.com.pl>
References: <20090321211351.BAC5718934F@amethyst.openembedded.net>
	<200903222019.02947.marcin@juszkiewicz.com.pl>
Date: Sun, 22 Mar 2009 16:10:54 -0700
X-Google-Sender-Auth: 701115671f397bf5
Message-ID: <b6ebd0a50903221610g15e7aed0q53fd1a4208775cf4@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
To: Marcin Juszkiewicz <marcin@juszkiewicz.com.pl>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [oe-commits] Chris Larson : base.bbclass:
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
X-List-Received-Date: Sun, 22 Mar 2009 23:12:16 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Sun, Mar 22, 2009 at 12:19 PM, Marcin Juszkiewicz
<marcin@juszkiewicz.com.pl> wrote:
>
> Why those changes were not sent for review to ML? They touched core of
> system so should be sent first. Especially when they broke many recipes
> and added extra work for other developers.
>
> Now we can not use wildcards in SRC_URI which broke many recipes
> (alsa-state for example) which is totally wrong. I hope that fix for it
> is on a way - otherwise I would vote for reverting those changes.

You're welcome to revert them if you like.  I'm fine using my heavily
patched local branch if that's the way you'd prefer it.  FILESDIR was
never intended to stick around this long.  It was a remnant of the way
things were done before FILESPATH was introduced, and the wildcards in
file:// urls were never intended to function, either, that only worked
as a side effect of the way do_unpack was implemented, in shell.

Rest assured, I'll be sure to send every single patch to the list in
the future, even though It's highly unlikely that you would've spotted
the wildcards bug via inspection.
-- 
Chris Larson
clarson at kergoth dot com
clarson at mvista dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Software Engineer
MontaVista Software, Inc.


