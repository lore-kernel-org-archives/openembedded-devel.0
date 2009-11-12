Received: from [209.85.216.175] (helo=mail-px0-f175.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1N8h3K-0000wm-Ib
	for openembedded-devel@lists.openembedded.org;
	Thu, 12 Nov 2009 22:18:05 +0100
Received: by pxi5 with SMTP id 5so1834077pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 12 Nov 2009 13:16:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type;
	bh=MhN/7XaOr0ikOo2IRpiGl/08ZvVOWchig6cqSaxdYvo=;
	b=e8Vfqc127IDRO97DoUfQOBLG7dS/GEYZvwRwBNrwW+RlV5rYeVx48EUHY2KA3EJTmw
	eBKde/oWePBU/DT5QBEHEWBiMOubOS+fxDznAurz9DlOl1BMWqBETDNCa0c6Odo1ymO2
	OfQO/9eW1X65eglnB98fabkQaE/0QE0PN4ezQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=fcBRHDTVlBq77zwxkUgeW0Q3EuwhLny5mayFyLPIvxq2V7aRwslA8421NGTBTdTEoE
	ptzmaA86FFC+mKTbCpT4AMiac+wBfsTd0D7jfDi8OobgpSpV2wA3IF0j9fOPgqO3tILB
	Y0mHsJCBfU6dxltHjq6WeIXOBFF8LbxQILyLg=
MIME-Version: 1.0
Received: by 10.143.27.37 with SMTP id e37mr376889wfj.234.1258060602562; Thu, 
	12 Nov 2009 13:16:42 -0800 (PST)
In-Reply-To: <1258039776.4924.69.camel@conroy-linux>
References: <200911120457.39018.holger+oe@freyther.de>
	<6ec4247d0911112034v54f570ccn4c4334a1da094f0d@mail.gmail.com>
	<1258038869.4924.67.camel@conroy-linux>
	<1258039776.4924.69.camel@conroy-linux>
Date: Fri, 13 Nov 2009 07:46:42 +1030
Message-ID: <6ec4247d0911121316p41602634l75a789e752cc286f@mail.gmail.com>
From: Graham Gower <graham.gower@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: meta-toolchain continues to woe
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
X-List-Received-Date: Thu, 12 Nov 2009 21:18:05 -0000
Content-Type: text/plain; charset=ISO-8859-1

Chris,
The patch you submitted prints out an error from the lockf() function
call. Which is fine, but its more common for the creat() call to fail
before hand, meaning that the lockf() function would have be passed -1
as the file descriptor.

I made a small change to hopefully improve this.
http://code.google.com/p/opkg/source/detail?r=288

-Graham


