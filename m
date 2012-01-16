Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1RmspN-0008B3-KB
	for openembedded-devel@lists.openembedded.org;
	Mon, 16 Jan 2012 21:06:49 +0100
Received: by vcbfl15 with SMTP id fl15so1134492vcb.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Jan 2012 11:59:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CpeVeSoOvMfmpyNEXLN8xZa0AAZmqMv50849v9+X1GM=;
	b=py0yI/m0ry1HpQFSfbuSf42+FP4y60C07UPfeWcYXlqfaCZVwONMU00DIYOIpw/Z6U
	1dv7QKuvNIj3N3jWh0GWRtPqntdLoezB9Lx39ejvs9H7asUO+LxFK/sTrS5kBI68hO16
	nnFbdQJFnRefDwKqxz9oQ8zkqShkJjj0czYb0=
MIME-Version: 1.0
Received: by 10.220.154.135 with SMTP id o7mr9118322vcw.2.1326743953048; Mon,
	16 Jan 2012 11:59:13 -0800 (PST)
Received: by 10.52.67.171 with HTTP; Mon, 16 Jan 2012 11:59:13 -0800 (PST)
In-Reply-To: <CA+M6bXnz_B48oc4Nt_Cw-arQpR_nqx=HSLMba49+5giqGt4mSQ@mail.gmail.com>
References: <CACW_hTaxUWYmPmvczsBFNgaGBKMFyt7Pg40ZCr6JNppe3btScA@mail.gmail.com>
	<CA+M6bXnz_B48oc4Nt_Cw-arQpR_nqx=HSLMba49+5giqGt4mSQ@mail.gmail.com>
Date: Mon, 16 Jan 2012 20:59:13 +0100
Message-ID: <CACW_hTaEj8ogaR5NihAeGQsKu6kA0SXD4-BzgaoK02+eH_uGcg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [2011.03-maintenance] commit 89cb863234616620d172984ff173f1d84ce4caa9
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
X-List-Received-Date: Mon, 16 Jan 2012 20:06:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

2012/1/16 Tom Rini <trini@kernel.crashing.org>

> On Thu, Jan 12, 2012 at 12:33 AM, Frans Meulenbroeks
> <fransmeulenbroeks@gmail.com> wrote:
> > Dear all,
> >
> > I just accidently committed
> > 89cb863234616620d172984ff173f1d84ce4caa9<
> http://cgit.openembedded.org/openembedded/commit/?h=2011.03-maintenance&id=89cb863234616620d172984ff173f1d84ce4caa9
> >on
> > the maintenance branch.
> >
> > My intention was to commit this to master and send a maintenance pull
> > request, but as i did not notice that my branch was on
> 2011.03-maintenance,
> > I accidently pushed to that branch
> > (actually somewhat surprizing me, as i did not expect to be able to push
> > against that branch).
> >
> > I'll leave it to the maintainers to decide on how to handle this.
> > I would like to see this recipe in the maintenance branch too thoguh.
> >
> > The patch moves the recipe from the 2007_365 version to the 2010_365
> > version.
> > commit message:
>
> *kicks gmail for not marking this important*
>
> Well, how does this fit against the rest of the requirements for the
> branch?  In other words, have you gotten all of these changes in
> somewhere else so they won't be lost?
>
> Hi Tom,

Not sure what you exactly mean.
The change is also in oe classic master. oe-core does not carry this recipe
(and if I recall correctly meta-oe neither does)
As it stands the patch simplifies the recipe as the uclibc specific patch
is not needed any more (and hence is dropped).

And maybe I caused confusion: the changes I listed in the commit message
are the official changes between 2007_365 and 2010_365, not changes I made
to the code.
In fact the recipe is pretty straightforward.

Best regards, Frans

