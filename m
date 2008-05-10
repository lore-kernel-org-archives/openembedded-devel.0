Received: from [209.85.132.248] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1Juqsh-0007qJ-MP
	for openembedded-devel@lists.openembedded.org;
	Sat, 10 May 2008 17:21:04 +0200
Received: by an-out-0708.google.com with SMTP id b38so349969ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 10 May 2008 08:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=XlczFtLSlitbdF2wemDB8p9+vyWzQjIsiz7FZFUd81s=;
	b=QN4auVdHlC0Lq6vezjXcIFiOauMdkbz/YYgoxDxIGI076jaqgZw28XpNceJS5LAa5jGSvAyQpc7ljQbNzz4RLlTP2Oaw/6udxmn9q/s7tZ42+irC5b4AeZBbMW3OaU7Ov+06aBUKDWUvkOLkLkEQ/vVZdcqriv3wgXAcnDxC7pM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=RUmGzQp5z7RI+S3EcCTIGmDecbVeRe88BGczjps1VaXx7cMsZ2avZZP6WD5cFddH26N2/jORkC+Gb4Rru/lVZEPnHshijjDcmqQ/1q3Pb/T/8ZAzC/ZEb9/VYnEiGo0jJOTFeSUxv7jKqeqUteQ7g9R4fovF+FthNHg/ic85H4Y=
Received: by 10.100.33.19 with SMTP id g19mr6925853ang.123.1210432804159;
	Sat, 10 May 2008 08:20:04 -0700 (PDT)
Received: by 10.100.190.7 with HTTP; Sat, 10 May 2008 08:20:03 -0700 (PDT)
Message-ID: <c384c5ea0805100820t64c75e41qde797bfb3245b7ed@mail.gmail.com>
Date: Sat, 10 May 2008 17:20:03 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <g049dg$2ks$1@ger.gmane.org>
MIME-Version: 1.0
References: <g049dg$2ks$1@ger.gmane.org>
Subject: Re: RFC: reverse the name change for org.oe.stable
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10b4
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
X-List-Received-Date: Sat, 10 May 2008 15:21:07 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sat, May 10, 2008 at 3:53 PM, Rolf Leggewie
<no2spam@nospam.arcornews.de> wrote:

> I am concerned about the loss of reputation that OE is incurring because
> the .stable guys are willfully ignoring the official bug tracker.  I

I'm not ignoring the bug tracker, I just don't have time to work on
stable currently.

> think it should be renamed back to angstrom$whateveritwasbefore.  We
> can't seriously be telling guys all the time "report your problems to
> the BTS" and then have the "official" stable branch completely and
> willfully ignore it.  I'd go as far as requesting it should be denied
> the org.openembedded.* namespace in monotone.
>
I understand your problem. Some thoughts:

The only way to have the OE community to maintain .stable, is to have
the OE community use it. Currently, we are in a chicken and egg
situation there.

Personally, I do not have the time to maintain .stable, but I will
probably use the next stable branch and maintain it.

Telling people to report problems to the bugtracker is sane, whether
we have a stable branch or not.

Maintaining recipes that are _cvs or _svn are not feature freeze.
Stable does not match with the SCM versions and should not be chosen
in any stable distro.

Regards,
-- 
Leon


