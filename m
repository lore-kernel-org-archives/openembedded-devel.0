Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OTg0D-0007Kz-UO
	for openembedded-devel@lists.openembedded.org;
	Tue, 29 Jun 2010 20:57:52 +0200
Received: by fxm12 with SMTP id 12so1044932fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Jun 2010 11:53:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=yDU7DO3GmvztWXaEniCVOxgwiUwBeTgr+WLE3LAM5Kc=;
	b=vxdnaJQ4WDaWyP1bAdVH841d3Lq6Upzvi/LamrnG2ej8Wy5R6bLx1ZsvfPSetweiei
	vNHR4s1QH4DzlXI2H4RxMBV7/Az6MI/TDVkoXUqwcYW1uMdLpSKWKXmk8tbxW4lTljmw
	lC+iOcpxIwZZYgrXU91cLWYLkPmK/VUSgP430=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=hsEB+0Ixr4A/Zc9vzmq3ZGeNbwjbGYqITkD5YXs7KsUyKWq1gmSqWD7zNJ/NR8pez+
	qF/olmoRLDz3TYJm9OdARJWgXk5wkLIaHt1927qW48zMfEH4YQD237SO2dZP4zCuBZqX
	zBJ088Gg4nTfgFwpMp/fR5MZjEAVsOJHD4mNg=
Received: by 10.223.123.211 with SMTP id q19mr5971674far.63.1277837586533; 
	Tue, 29 Jun 2010 11:53:06 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.231.14.131 with HTTP; Tue, 29 Jun 2010 11:52:46 -0700 (PDT)
In-Reply-To: <92233E3F-2CFC-4F88-A780-1A15D7D94A00@keylevel.com>
References: <933C8D2B-2A4E-46EE-A342-ED5EB3636F38@keylevel.com> 
	<AANLkTilmoW3cU9hcM1PbN8-yDTM36uzkNB5CwU8obJf1@mail.gmail.com> 
	<92233E3F-2CFC-4F88-A780-1A15D7D94A00@keylevel.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Tue, 29 Jun 2010 11:52:46 -0700
Message-ID: <AANLkTim3wnL18BjsIrLiKZC5NRc70UG77N1GtOiISghA@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: 'swapper' process using 100% cpu when system idle
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
X-List-Received-Date: Tue, 29 Jun 2010 18:57:54 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Jun 29, 2010 at 6:39 AM, Chris Tapp <dokuwiki@keylevel.com> wrote:
>> try using different kernel version
>
> Ok - is it as simple as adding (for example)
>
> PREFERRED_VERSION_linux = "2.6.18"
>
> to <my_console_image.bb> ?

on .dev
well look at the kernel recipe you want
to go to and add

DEFAULT_PREFERENCE_<yourmachine> = "1"
you might have to provide defconfig also.

>
> Chris
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


