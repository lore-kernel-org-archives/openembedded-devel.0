Received: from [209.85.146.183] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1JqbKs-0007Zk-9O
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Apr 2008 23:56:34 +0200
Received: by wa-out-1112.google.com with SMTP id l24so7937452waf.22
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 28 Apr 2008 14:56:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=bAv3xmAFqwlw9TiDSPBH1g4LPmatTMW6jsIR23C6zHA=;
	b=DSkIzWFvhoAdR8IgPzR3mcDb8n7HftpaDhqtdimLcukfLpPuiy4/gG/lIOyZpczIhqVQMwLpiZojdDVEZZ4woIoQs3Uiwm1hnfvs2PybtpRSjRLGrTsvCck652EsmCpCpMdEEmKsoWJn9z8dsYyhLv4NwrsWZCT7PpbcQa9KVNo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=K/ea4xjJgOcEnqs8OUNpVApmAJSRyyPXgVLkZeP0SM2SltQbcEfpgmSAg5Ttl4lFkVXjAPi5z+AxGvJnbz9rmMNrnW7l7KLeGIHunFIb6nk06GShvy4iuBB4Y0+xjd3OVoMzu0M39RFTjSIB6RYekKB9np8naVJFxRZ9qCVZHoI=
Received: by 10.114.157.1 with SMTP id f1mr7146511wae.10.1209419768082;
	Mon, 28 Apr 2008 14:56:08 -0700 (PDT)
Received: by 10.114.234.12 with HTTP; Mon, 28 Apr 2008 14:56:08 -0700 (PDT)
Message-ID: <19c1b8a90804281456g210eaea5w6b972754e51f9661@mail.gmail.com>
Date: Mon, 28 Apr 2008 14:56:08 -0700
From: "Khem Raj" <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0804281439h1602ad7dvaa317f64efd3bd35@mail.gmail.com>
MIME-Version: 1.0
References: <200804281451.05548.geoffrey@pager.net>
	<c384c5ea0804281439h1602ad7dvaa317f64efd3bd35@mail.gmail.com>
Subject: Re: Mixed up STAGING_INCDIR's in uclibc.inc?
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
X-List-Received-Date: Mon, 28 Apr 2008 21:56:34 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Mon, Apr 28, 2008 at 2:39 PM, Leon Woestenberg
<leon.woestenberg@gmail.com> wrote:
> Hello Geoffrey, Marcin, Richard,
>
> (I think Marcin committed the original change, and I think from Poky)
>
> On Mon, Apr 28, 2008 at 9:51 PM, Geoffrey Wossum <geoffrey@pager.net> wrote:
> >  Seems to me like that should be STAGING_INCDIR_NATIVE instead of
> >  STAGING_INCDIR.  If I make that change, then everything works again.
> >
>
> Additionally, there is another issue:
>
> The original patch Changelog entry described this patch was done as
> uclibc needs ncurses-native instead of host provided ncurses.
> Now, it seems the committer forgot to add this to the DEPENDS.
>
> I have a freshly installed Ubuntu 8.04, and I probably don't have the
> ncurses-dev, whereas Geoffrey probably does, which explains the
> difference.
>
> Does this make sense?

Yeah I dont hit this problem as I have libncurses5-dev installed on my host.

>
> Regards,
> --
> Leon
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


