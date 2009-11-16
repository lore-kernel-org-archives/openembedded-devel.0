Received: from qw-out-1920.google.com ([74.125.92.149])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1NA5Dk-0006fP-6l
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Nov 2009 18:18:35 +0100
Received: by qw-out-1920.google.com with SMTP id 4so948862qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Nov 2009 09:17:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=8P0ZbBqU/TbP/YXe58V+XnGlmpBPuTm46/UGW50mhhQ=;
	b=lPuw24HOGXxOTrW4G8XsMpT3EBgVBe3/lr73lEbF16E3AT7GieJXDXPMa5O2wJe0TK
	0G2e30u6jSz0GCIiPpO6RdtT4SnkonJ96zRjBUGPgI/POzw/Vjh+M1xJdZssNy7otAV0
	ggKpTAZCuPmbOQmYjeM94uPS7rcMPHmuKbETI=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=G3gL0JO6pqAdSUA6COHjQxnCdVbPF5L7iKS5mIwHBKE6wmGxA31obSq6vwroumq193
	A484d8PIRMt0IFkJwoH+1JDV8KypMB5jMuWEtlWpYbQ3XyCFaWHcbuyU2bHsWN8SCN4m
	IOSswT+IWz7/zojTbkJldlKVhz7be7XNS44p4=
MIME-Version: 1.0
Received: by 10.239.143.219 with SMTP id l27mr808454hba.162.1258391829994; 
	Mon, 16 Nov 2009 09:17:09 -0800 (PST)
In-Reply-To: <alpine.LFD.2.00.0911160553300.13586@localhost>
References: <alpine.LFD.2.00.0911150948430.14311@localhost>
	<200911160100.38336.marcin@juszkiewicz.com.pl>
	<alpine.LFD.2.00.0911160353130.16011@localhost>
	<1258365971.25369.528.camel@lenovo.internal.reciva.com>
	<alpine.LFD.2.00.0911160553300.13586@localhost>
Date: Mon, 16 Nov 2009 18:17:09 +0100
Message-ID: <c384c5ea0911160917y101a8759l9b879c0028f8ffa6@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.149
X-SA-Exim-Mail-From: leon.woestenberg@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: any ETA on a working dev beagleboard demo image?
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
X-List-Received-Date: Mon, 16 Nov 2009 17:18:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

On Mon, Nov 16, 2009 at 11:53 AM, Robert P. J. Day
<rpjday@crashcourse.ca> wrote:
> On Mon, 16 Nov 2009, Phil Blundell wrote:
>> On Mon, 2009-11-16 at 04:05 -0500, Robert P. J. Day wrote:
>> > =A0 IMHO, the fact that you don't know anyone who uses a fedora
>> > build host is not a compelling reason to ignore build breakage
>> > that happens on a fedora build host.
>>

There has been talk about automated build tests (in fact, I have used
nightly builds to find regressions but no longer have the hardware
available to me).

I think it would be good to generate a set of "well-known good
building combo's" that build from scratch.

Which keys should be in there? I think: host system (uname output?),
target (MACHINE), bitbake target (image name), OE .dev revision (git
commit)

What can we extract from the tinderbox database?

Should we modify the oe-stats class so that we collect this
information automatically?

Maybe detect that the user is building from scratch (i.e. no
destination directory exists yet)

Regards,
--=20
Leon


