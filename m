Received: from mail-gw0-f47.google.com ([74.125.83.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <george.huntingtoniii@gmail.com>) id 1QpRwl-0000zo-EM
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Aug 2011 23:28:47 +0200
Received: by gwb11 with SMTP id 11so906522gwb.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 05 Aug 2011 14:24:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=33lDyhgUgPPU8QiP/ZAQ/yDeg4W/b8R01aQIoj+yb9Y=;
	b=cOSWbetSAKsI02Oiip/0EdyVn8+D6hZBTm3Df+rhgnegHtVuNQK6NXn578FRWtyXrW
	qCpkiDC5ZaIfAfydC+fRUM9mHQJyvzkwZ1Vl8reUKRL9m3lbReErvp14oanckDP/I9UB
	xnCFh/1bEC+1fXOHmuBPnWGM5pyLLwrfuvugQ=
MIME-Version: 1.0
Received: by 10.236.185.7 with SMTP id t7mr3838369yhm.45.1312579461983; Fri,
	05 Aug 2011 14:24:21 -0700 (PDT)
Received: by 10.236.110.3 with HTTP; Fri, 5 Aug 2011 14:24:21 -0700 (PDT)
In-Reply-To: <1312577070.14079.26.camel@jjg-linux>
References: <CAFu+nvEwf_hPbB0a21qJFWAHZqdCkb3MPaKaZcLFgD+xc7cGVw@mail.gmail.com>
	<4E15F6DD.2020308@mentor.com> <1312553761.14079.22.camel@jjg-linux>
	<CAFu+nvE3v+VswNB-3ZwF3dFMa42wgeSv6GMBJ4C=bYNpWKKFmw@mail.gmail.com>
	<20110805151726.GB15632@rhein.zuhause.netz>
	<CAFu+nvEwGYd-t6n04yn41wd50+5zPoEu=5WVYxOmaWLDdyKdEQ@mail.gmail.com>
	<1312577070.14079.26.camel@jjg-linux>
Date: Fri, 5 Aug 2011 17:24:21 -0400
Message-ID: <CAFu+nvGDUbec-_BVft9-K+Uko95U9CYftk47TWPKh1BA=w7P3g@mail.gmail.com>
From: "George C. Huntington, III" <george.huntingtoniii@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: classpath in 2011.03-maintenance
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
X-List-Received-Date: Fri, 05 Aug 2011 21:28:47 -0000
Content-Type: text/plain; charset=UTF-8

the -bootclasspath ''
part where it uses the single quotes next to eack other, if you replace that
with ::
two colons it will magically work
I think for some reason it doesn't like '' for an empty path but two
path separators back to back ::
will work great.



On Fri, Aug 5, 2011 at 4:44 PM, Jesse Gilles <jgilles@multitech.com> wrote:

> ''

