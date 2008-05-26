Received: from [209.85.132.241] (helo=an-out-0708.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1K0jlV-00008v-B2
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 May 2008 22:57:57 +0200
Received: by an-out-0708.google.com with SMTP id b38so446455ana.83
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 May 2008 13:54:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	bh=SOurGp7n2E+KnKFhmBVkn5SecHE2qKVT3TO1TwgvP0E=;
	b=S/MKcbciT9y5bBQ9JGaIwc5C7whIfKDfjoxqdej9XRisWcFhE++MFVcjKSrQehv5IRWKa3EgW19wX6g1Pu7ew3BXWPQyEtrOW6e1q36DRdIqFR997DwKBF8BgD4FessgU0dL5x41/N7LB5V1UJn+Cy+WuF8jsFfKPIReg7FJgf8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=VZ6CTiEos+rI3QIT1g/Oa5lfc4qrOUWOky7zyGJ5v1ZYTEgOHDNLsDUSXpR4ZezJ16HiEfvDv3h7DdOX4haiN5NxmQNRimg5zHsfMmJZah7MAKe1c1kDbFa4iWjlORk69IkeODFTJ9pXWf57b827B/9lpOqSvsyvxqJMWHvS4xg=
Received: by 10.101.67.15 with SMTP id u15mr730428ank.19.1211835279510;
	Mon, 26 May 2008 13:54:39 -0700 (PDT)
Received: by 10.100.189.9 with HTTP; Mon, 26 May 2008 13:54:39 -0700 (PDT)
Message-ID: <c384c5ea0805261354i1e72a973i3efbb20681e00f03@mail.gmail.com>
Date: Mon, 26 May 2008 22:54:39 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <1211780824.10806.52.camel@isis>
MIME-Version: 1.0
References: <1211780824.10806.52.camel@isis>
Subject: Re: [PATCH] glibc staging puts .a files in /lib
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Mon, 26 May 2008 20:57:57 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello Khem,

On Mon, May 26, 2008 at 7:47 AM, Khem Raj <raj.khem@gmail.com> wrote:
>
> I have been seeing this problem where link would fail for libgcc when
> building libgcc with some weird messages like
>
> also Leon was seeing same issue on eglibc. I tracked this problem to
>
Kudos Khem! Thank you very much for investigating this; I would not
have been able to track it down so quickly.

It's good to have your toolchain expertise around, very much appreciated.

> The attached patch fixes it for glibc. Eglibc also needs similar fix but
> I decided to use make install in eglibc which makes it much easier.
>
> OK ?
>
I just wonder why we didn't see this issue on glibc yet? Even with my
machine (mpc8313e-rdb) this didn't show up earlier.
Could it be the (older) version of glibc I used?

Regards,
-- 
Leon


