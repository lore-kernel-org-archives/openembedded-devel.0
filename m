Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <nicola.mfb@gmail.com>) id 1LfieJ-0005gb-KP
	for openembedded-devel@lists.openembedded.org;
	Fri, 06 Mar 2009 23:36:11 +0100
Received: by yw-out-1718.google.com with SMTP id 4so384295ywq.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 06 Mar 2009 14:31:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type;
	bh=5DkhemvqX6fWXrhzwF93IVJqNoxDA3+My2fFXZaLqqk=;
	b=xdIhG7LHG58dz1yfODeWBw0c0684fZ8/OfX/+6BvkvQehsCqu5Gr98SvZ4ZgRZ8/1w
	iFCkfARIEInfiGozwDvT9gI7ajIFP+uPCmHv1ug6pe7BY84b3PKNWAKkxFd8V+P+oxYA
	acomSfP3fvtZv/RDkepskwsSQOFmIo6fFMCG8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	b=YWyfpft/xTYQITkz6qLQzrzBFeBrUlXyl8Evs5VRWdXlX+xrvQLdtHJxw9lWUUF729
	QpWGNv+OxCBuo5Qld2sX0qda8VvHdxgbyOAzOMqF96T8m8jeq0ycaaaOPWtwXF4fCAM8
	j+MlO3OWe6mTnoAacu8f2r1aGH8qkLatattaE=
MIME-Version: 1.0
Received: by 10.220.95.202 with SMTP id e10mr1080818vcn.12.1236378699407; Fri, 
	06 Mar 2009 14:31:39 -0800 (PST)
In-Reply-To: <1236373070.7461.49.camel@utx.utx.cz>
References: <1236373070.7461.49.camel@utx.utx.cz>
Date: Fri, 6 Mar 2009 23:31:39 +0100
Message-ID: <359c5480903061431t30283e9dgda3d57aedfbb8999@mail.gmail.com>
From: Nicola Mfb <nicola.mfb@gmail.com>
To: openembedded-devel@lists.openembedded.org, devel@lists.openmoko.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Cc: Matthias Hentges <matthias@hentges.net>
Subject: Re: [PATCH] new interface is already up but udev must call ifup anyway
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
X-List-Received-Date: Fri, 06 Mar 2009 22:36:11 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

2009/3/6 Stanislav Brabec <utx@penguin.cz>

> Few weeks ago yet another change happened in the dark, and network did
> not start to work automatically after inserting my WLAN card.
>
> Debugging this problem, I found that interface is already up=EF=BB=BF but=
 not
> configured when /etc/udev/scripts/network.sh is called. This script
> thinks, that card is already configured and quits. This behavior is
> intentional and was introduced three years ago=EF=BB=BF (and working).
>
> The fix actually reverts following change:
> Author: Matthias Hentges <oe@hentges.net>
> Date:   Thu Apr 20 16:01:09 2006 +0000
>    udev: network.sh: Do not ifup an already configured network device
> again.
>
> That is why I am asking:
>
> Is anybody aware of change, that made new interfaces up without
> configuring them? Was it an intention or not?
>

I had the same problem with bnep bluetooth networking, and another issue
when spawing dhcp, take a look at:
http://lists.openmoko.org/pipermail/devel/2009-February/004895.html

       Nicola

