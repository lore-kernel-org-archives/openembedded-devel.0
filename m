Received: from mail-pw0-f47.google.com ([209.85.160.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1NieMX-0002OZ-NT
	for openembedded-devel@lists.openembedded.org;
	Sat, 20 Feb 2010 02:42:33 +0100
Received: by pwi5 with SMTP id 5so715586pwi.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 19 Feb 2010 17:39:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=DW3K43H6nCWpa+WGiCcbSfhQRbFkjMc5tHJtr13E8ks=;
	b=GATiRspWRbd+LG4EvhfoU1gvK/ANZwbovx97wuvUjTAj1x+jhHNM6VF82m3fytDcKg
	IFjJVuPQG7SKUqVcgpjACQkBXN14+ZBMiMgEcMz2D/K8sPbOSgNNZrLynmoujNcGBsic
	t72sTm7GyDIH6HFSJ2/HVV5TT9uDFB+cJFN28=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=MTvpYbDdywFnXYzW2DrmlGkxNFfT+vBvBS2weX8WM4xbxiagMzjMHUJU8Jn9lzr4SC
	G/I5Utcdvb8D5OMCmUf4i2ag/BBaXHDRic9VXPT09+8kPHSUzwRYU+M/C1L5p++k27+2
	G1XhDcLJ6poMVqK+RleTYvCD+RlJ3nFA4jUrc=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.143.24.18 with SMTP id b18mr4256693wfj.16.1266629987066; Fri, 
	19 Feb 2010 17:39:47 -0800 (PST)
In-Reply-To: <1266512303.6436.1199.camel@rex>
References: <1266316492.6436.127.camel@rex>
	<b6ebd0a51002160616m462683b3nd2f4b17524395ddf@mail.gmail.com> 
	<1266334604.6436.159.camel@rex>
	<201002181009.07359.marcin@juszkiewicz.com.pl> 
	<b6ebd0a51002180813q171a3d41kef83d708f4ba6eea@mail.gmail.com> 
	<1266512303.6436.1199.camel@rex>
From: Chris Larson <clarson@kergoth.com>
Date: Fri, 19 Feb 2010 18:39:27 -0700
X-Google-Sender-Auth: 51e6c53a0b48c81d
Message-ID: <b6ebd0a51002191739r245abeafq23de526308a29bab@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.160.47
X-SA-Exim-Mail-From: kergoth@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: RFC: Improve our default conf file setup
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
X-List-Received-Date: Sat, 20 Feb 2010 01:42:33 -0000
Content-Type: text/plain; charset=UTF-8

On Thu, Feb 18, 2010 at 9:58 AM, Richard Purdie <rpurdie@rpsys.net> wrote:

> On Thu, 2010-02-18 at 09:13 -0700, Chris Larson wrote:
> > With COLLECTIONS (and BBLAYERS could work similarly), all the overlay
> > priorities and bbpath ordering are automatically determined based on the
> > order of entries in the variable.  Documented as highest-to-lowest.
> >
> > Note that I'm not necessarily arguing against the use of a per-layer
> > configuration file, as this seems like it would be quite useful, but I
> > question the need for the boilerplate.
>
> Its certainly possible to put defaults in which would handle the
> "standard" case. My main dislike is having to hardcode behaviour and
> variable handing into bitbake in that case.
>

Not hardcoding *any* behavior into bitbake is how we got into the mess that
we're in, and is likely the source of a large amount of confusion on the
part of our userbase, and is likely the cause of some of the performance
issues as well.  Flexibility is good, but there's a point at which the
benefits no longer outweigh the drawbacks.


> The idea that adding an empty layer.conf file breaks a previously
> working overlay seems counter intuitive too...
>

The layer itself deciding where it goes in the BBPATH is not obvious or nice
or clear to me the way it seems to be to you.  How can a given layer claim
to know where it should go in the bbpath, what its priority should be?  I
think it makes a great deal more sense to let the order/information in
bblayers.conf define that, as the user has direct control over that.  Can
you think of any cases where a given layer could possibly know better than
the user, or where defining the priority via BBLAYERS is insufficient?
 Regarding BBFILES, there's nothing to hardcode.  Add the layer to BBFILES,
let bitbake find the recipes, and you have BBMASK to remove the ones you
don't want.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

