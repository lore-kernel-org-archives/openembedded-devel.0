Received: from qw-out-1920.google.com ([74.125.92.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nu6HZ-0000Dx-OH
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 16:45:03 +0100
Received: by qw-out-1920.google.com with SMTP id 4so591445qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:41:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=w04tob1mmplv2O08bTL2z43asJo6Df1f3bwP9mImxsg=;
	b=X33+YMUMD7m2dAeEAQY0AnNnbfMPOBPSH9UTIuMn+1Bty6FkitnOCJvZcrHC4Z2iFU
	97GcVyxpThqipoL8xWd3ZT8z8c89GafXfEHdqdHk8UtnbzMctHAczy+bsCgCCJsMYngK
	8VBtBThmiRJeaTspiUWjrtBZGcizYruJrn7Xk=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=eTPBlgpQhltbIOdDhtFqrCJ9SCzINV2/BCZdOd3xikeWkeh9FLCudMB3XsUvf9vktB
	A8SqHkqZyz1HT3vLFZ4oJhlMb3cU8PJaojfeDMgAWO0ogBREOe214eKIkoLksHmNf/kd
	mXHMNmJySoNgtG+aLKLJMvjO2rfXLHFeYJwJM=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.190.129 with SMTP id di1mr852246qcb.75.1269358894120; Tue, 
	23 Mar 2010 08:41:34 -0700 (PDT)
In-Reply-To: <20100323094757.GE21210@jama>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com> 
	<20100323094757.GE21210@jama>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 08:41:14 -0700
X-Google-Sender-Auth: 06a4f02696d8e232
Message-ID: <b6ebd0a51003230841g5fa61480t6330eda0d27596d2@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 15:46:09 -0000
Content-Type: text/plain; charset=UTF-8

On Tue, Mar 23, 2010 at 2:47 AM, Martin Jansa <martin.jansa@gmail.com>wrote:

> On Mon, Mar 22, 2010 at 03:26:53PM -0700, Chris Larson wrote:
> > Greetings all,
> >
> > Thoughts? Questions? Concerns?  I've been wondering if this is really
> > worthwhile, but I think it is.  I think there is value in keeping old
> > versions around, but this allows us to avoid cluttering up the repository
> as
> > much, and makes it so that one change to a recipe can affect all the
> > versions in that range by default, or all versions, rather than just the
> one
> > version you tested.  Of course, ideally you'd test all versions, but
> that's
> > the case today too, its just that now our recipes get bitrotted instead.
> >  Personally, I'd rather see the old version content continue to be
> brought
> > forward by default, and if it fails to build with that, we fix it, but
> it's
> > easier to fix a build than to unclutter the repository.
> >
> > I'm hoping to get some input on this :)
>
> For me it seems easier to read shared stuff in .inc and then multiple
> files with just include on .inc and checksums. Sometimes with additional
> patch or some fix only for particular version, instead of one a bit
> longer file with OVERRIDES.
>
> But maybe it's just lack of imagination on my side.
>
> Also as I stated in some other thread, I think it's usefull to have one
> version
> of each major version which was in OE (probably latest from each range
> you have in nano.bb example), because to test 5 version at least if
> patches apply cleanly and it builds ok, is much faster than 42 version
> from example.
>

I also agreed that it's nicer to duplicate a tiny amount of metadata than to
have a giant file full of overrides, but with BBVERSIONS, you could keep
every minor version of a given major version around.  Keep one recipe per
major version, just keep all the minor versions around.  It really doesn't
take that long to fire off a loop that builds all variants, I have a script
for it - bitbake sets a variable that lists them all, but like I said in the
start of the thread, personally, I'd rather see the versions available, and
relatively easy to fix if they break, than either remove them entirely or
let their recipes bitrot.  That's my personal opinion, of course, I'm sure
others disagree.. but I do think this feature could be useful, even if we
don't keep every version around, since it makes it easier to share metadata
across multiple versions without having to create a pile of extra .inc's.
 foo.inc and foo_ver.bb is great, foo_1.x.inc, etc gets messy fast.
-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

