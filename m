Received: from mail-yw0-f185.google.com ([209.85.211.185])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1Nfqyf-0000Hg-0d
	for openembedded-devel@lists.openembedded.org;
	Fri, 12 Feb 2010 09:34:20 +0100
Received: by ywh15 with SMTP id 15so2040279ywh.5
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 12 Feb 2010 00:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=Su5FbdkwPvxRpvHKYsItEA39SzH2J6SCaFcInEwPAvo=;
	b=qMRlhT0bXvB0VDAtCRHgwkZcq8rGZAaBqQyzMC4GpPYhDQAGCLsCp2CEx7/e8jo4H7
	o00hmBuGwteWj44FxSrXDlegDCugmIcgFPQB8Bpkoj35zuTiD2mfpi4QNwhzD4E3lIy1
	1/Pcv2ZGOlUcU0bv80a3iDzmVds/xUsvfHIJ4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=dTlWm/wHCHl5l/4L1ocTpmpXmt6b4qt3YRtK5/2TI6mtMnoLNT9Wxs0sQ2+43qvz1m
	5jSEYH41Su9Hd6SUU1HyNOBrvQgrEzCLYvd3VLnjFDpL2gU+dc9Wo9tFVQlOYPyfcj8y
	wAZi5mzkpyQf4meXflsaIrEzQsmdeRcr9JSNk=
MIME-Version: 1.0
Received: by 10.101.192.18 with SMTP id u18mr1536577anp.75.1265963501313; Fri, 
	12 Feb 2010 00:31:41 -0800 (PST)
In-Reply-To: <f4e6dc971002111503m1d0be8v46d23ff0a1e796b2@mail.gmail.com>
References: <f4e6dc971002111503m1d0be8v46d23ff0a1e796b2@mail.gmail.com>
Date: Fri, 12 Feb 2010 09:31:41 +0100
Message-ID: <ac9c93b11002120031y6c352ccci36ca405ca4da95bb@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.185
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: Recent update to modphp segfaults
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
X-List-Received-Date: Fri, 12 Feb 2010 08:34:20 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2010/2/12  <openembedded@status.e4ward.com>:
> Hello all.
>
> I am using OpenEmbedded with my Gumstix Overo. I am attempting to put
> Apache2 and PHP on there. I tried to build Apache2-2.2.14, and it
> broke on the configure step saying that some checks can't be done
> while cross compiling. Rather than figure that out, I was pressed for
> time and simply used Apache2-2.2.3 instead. That worked fine.
>
> I recently pulled new updates, and I tried Apache-2.2.14 again. It
> built! I was happy about that, but then when I tried to get it working
> with modphp, the Apache2 error log had a bunch of lines like "[notice]
> child pid xxxx exit signal Segmentation fault (11)". So I decided to
> try Apache2-2.2.3 again (just in case) and I have the same problem. So
> my only conclusion is that, although the package version and release
> version of modphp remained the same, it was updated (when I had it
> working correctly there was no /etc/apache2/modules.d/ directory; now
> there is). Is it now broken? I'm not quite sure what the issue is; any
> advice would be welcome!
>
> =A0 =A0Thanks!
>
> =A0 =A0 =A0 =A0 Kyle Fazzari

It is quite possible that you are running out of memory.
Kill some processes and try again (or set up swap space).

Btw, you might want to have a look at lighttpd.
apache is a PITA

Frans


