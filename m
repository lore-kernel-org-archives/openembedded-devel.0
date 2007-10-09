Received: from [209.85.146.178] (helo=wa-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <papercrane@gmail.com>) id 1IfAjh-0002IY-GR
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Oct 2007 10:46:41 +0200
Received: by wa-out-1112.google.com with SMTP id l24so2156967waf
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Oct 2007 01:40:54 -0700 (PDT)
Received: by 10.114.53.1 with SMTP id b1mr4302057waa.1191919253850;
	Tue, 09 Oct 2007 01:40:53 -0700 (PDT)
Received: by 10.114.144.2 with HTTP; Tue, 9 Oct 2007 01:40:53 -0700 (PDT)
Message-ID: <432beae0710090140g1f0caea8wd5905635e460a46f@mail.gmail.com>
Date: Tue, 9 Oct 2007 01:40:53 -0700
From: "Justin Patrin" <papercrane@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <ABA57F92-B9FA-41C5-B0CD-76A4A6A146A5@gumstix.com>
MIME-Version: 1.0
References: <DE31D336-513F-40FF-B766-DCED127697B0@gumstix.com>
	<432beae0710081610k11b018a9s164aff560466718d@mail.gmail.com>
	<ABA57F92-B9FA-41C5-B0CD-76A4A6A146A5@gumstix.com>
Subject: Re: monotone question
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Tue, 09 Oct 2007 08:46:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 10/8/07, Craig Hughes <craig@gumstix.com> wrote:
> On Oct 8, 2007, at 4:10 PM, Justin Patrin wrote:
>
> > That's essentially the only way to fix it. You could also rename them
> > or move them to another place. Monotone doesn't merge these since they
> > aren't the same file ancestrally, they just happen to have the same
> > name.
>
> *sigh* OK.  It sucks that it doesn't at least give you the option of
> merging them, since identically named files in the same directory are
> more than likely related even if monotone doesn't know about it yet.
> For example, two branches both modify a package's patches in the same
> way because upstream changed...

That's called suturing and it's on the list of wanted features for monotone.

>
> >> That seems really bad cos there's a window
> >> there where the org.gumstix.oe needs to be committed in a broken
> >> state (missing those files)....
> >
> > True, but if you always expect every single revision to be bug-
> > free.....
>
> Bug free is not the same as broken.  You'll never be bug free, but
> you should never be broken.  In situations where you have a build
> tree with multiple people working on it, people throw things at you
> hard if you ever break the build.  Big heavy things.  I guess the way
> around this potentially in this situation would be to just create a
> new branch off the current one, break that branch, propagate to it,
> fix the merge issues, then propagate from that branch back to the
> original one once everything's unbroken.  Huge pita, but it won't
> break the build for others working on the original branch in the
> meantime.

Well....I wouldn't consider sending 2 revs at the same time, one of
which is broken but the newest of which is fixed breaking the
build.... You can always put a big comment in the commit message
saying "BREAKS THE BUILD, DO NOT USE" if you're that worried about it.
The distributed nature of monotone does allow you to create both revs
locally and push them both once the fixed one is done.

-- 
Justin Patrin


