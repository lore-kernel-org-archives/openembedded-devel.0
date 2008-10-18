Received: from [74.125.92.147] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1KrHnc-0001nm-PO
	for openembedded-devel@lists.openembedded.org;
	Sat, 18 Oct 2008 21:49:20 +0200
Received: by qw-out-1920.google.com with SMTP id 5so330742qwf.36
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 18 Oct 2008 12:49:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=CJ7DsTZfA3bq8vZ99wVvhO8R/zdyKAuNENHuuEezlCI=;
	b=WPvUgDAqTH0UNC+vQzUQQAh9U9aYsIXPmZWFH+Kht9bYTo2K0YwniXGNK8PkSAaRND
	18jboYLkD9ZVLphe6w+A/1HWhOX3CucnBcMLyCZdZDlzYyaAIQGV+Uir+aF9o4B7QA+z
	C1BENZqix+ecbr2h9QPQS4mNYWZTbHbmHrvmM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=CTDdSD+x10AgbLV6BmETCVauZwWu6ZQYqxbGpGjUF6zoKroG5ypWr0f91Dh/IX+1LX
	79pux/tUhYtb77dtRXabL7Ueyw4UAYrsZer1yuFliXh4e8yqRBNBuNywHS48U5ZB93mR
	8fPvlU57T0IFGXQYH/4E387nw4VVl02XHNrfQ=
Received: by 10.214.44.17 with SMTP id r17mr7601682qar.66.1224359349922;
	Sat, 18 Oct 2008 12:49:09 -0700 (PDT)
Received: by 10.214.12.10 with HTTP; Sat, 18 Oct 2008 12:49:09 -0700 (PDT)
Message-ID: <c384c5ea0810181249x4d700cdbw2e409eb1fecefaab@mail.gmail.com>
Date: Sat, 18 Oct 2008 21:49:09 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081018183016.GA4310@jama>
MIME-Version: 1.0
References: <20081017131704.GA4334@jama>
	<200810172041.10116.openembedded@haerwu.biz>
	<20081018183016.GA4310@jama>
Subject: Re: checksums.ini - should check only against filename not uri_src
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
X-List-Received-Date: Sat, 18 Oct 2008 19:49:21 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Sat, Oct 18, 2008 at 8:30 PM, Martin Jansa <Martin.Jansa@mk.cvut.cz> wrote:
> On Fri, Oct 17, 2008 at 08:41:09PM +0200, Marcin Juszkiewicz wrote:
> could be used. From discussion on irc it seemed like global checksums.ini
> is not a good idea at all, at least because of high probability of merge
> conflicts, and that checksums should be moved to .bb files or defined on
> per-package files.
>
Yes, I agree the checksums solution should be redesigned.


Note that I have written a package to help import, learn and
automatically google for missing packages, from which some ideas might
be ripped.

Source here:

http://www.sidebranch.com/leon/witpa_20080730.tar.bz2

Regards,
-- 
Leon


