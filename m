Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <andrea.adami@gmail.com>) id 1Q1xpA-0007uO-5u
	for openembedded-devel@lists.openembedded.org;
	Tue, 22 Mar 2011 10:24:24 +0100
Received: by wwb17 with SMTP id 17so7500276wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Mar 2011 02:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:in-reply-to:references:date
	:message-id:subject:from:to:content-type;
	bh=B1q9QCi5TuIesbLnlPGPAHxETc71x1pEXqFFQ4BRIaI=;
	b=SXylUjPpymArZYK9ZcmND5O86YKSxYMgZWbUIxCDZ0TiCZA/OdAhl1pAM+CDd/d3A2
	5xalWzSPm76oXnhRlzU5sxsz9fc65xLPiyls39QNWfaEefoRI+jwaK4PAhz7PzUHKCSN
	uqbc2N+5Tasp/+16pzvUf+nCHvu3ZMaA1gOtI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=rACwsUrrR0zMAw2Rb83WeNd1FnnwhaVqw0coy6Cx6XOkUbgTH1REcqjLzIcBfb8Gwe
	uVI/i4j0+NgFo9TPtIIm4aROmGsDVr/cJ9IbYnxwC6zXMtZTUJsiSVGHVInRLFkkqmIy
	AgOmtxf+d/O4aKx/CFgNyi4DCEFhM3r2Qpkbc=
MIME-Version: 1.0
Received: by 10.227.28.154 with SMTP id m26mr4964620wbc.216.1300785754606;
	Tue, 22 Mar 2011 02:22:34 -0700 (PDT)
Received: by 10.227.6.214 with HTTP; Tue, 22 Mar 2011 02:22:34 -0700 (PDT)
In-Reply-To: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
References: <1300784531-13757-1-git-send-email-heinold@inf.fu-berlin.de>
Date: Tue, 22 Mar 2011 10:22:34 +0100
Message-ID: <AANLkTi=Q6ATHuoUN87y8G9futYc+2iJ9c23YLRfPYOZj@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: lzma has no -e option
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
X-List-Received-Date: Tue, 22 Mar 2011 09:24:24 -0000
Content-Type: text/plain; charset=ISO-8859-1

Yes, I've seen this too.
It's due to a mismatch between lzma (utils) and xz (utils).

We should probably move to xz   http://tukaani.org/xz/

Andrea

On Tue, Mar 22, 2011 at 10:02 AM,  <heinold@inf.fu-berlin.de> wrote:
> Hi,
>
> maybee I am wrong but my host lzma and the lzma build with oe angstroem-2010 has no -e option
> for compression. So even its a weak define in bitbake.conf it should be correct.
>
> Bye Henning
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


