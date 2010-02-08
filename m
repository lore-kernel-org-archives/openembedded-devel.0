Received: from mail-yx0-f180.google.com ([209.85.210.180])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1NeXR2-0004kw-6Y
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Feb 2010 18:30:11 +0100
Received: by yxe10 with SMTP id 10so5487048yxe.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 08 Feb 2010 09:27:35 -0800 (PST)
MIME-Version: 1.0
Received: by 10.142.56.8 with SMTP id e8mr4486508wfa.82.1265650054362; Mon, 08 
	Feb 2010 09:27:34 -0800 (PST)
In-Reply-To: <hkp46v$tv8$1@ger.gmane.org>
References: <hkm5j4$fib$2@ger.gmane.org>
	<ac9c93b11002070821x6d5ac559sd8bb519b902b0af0@mail.gmail.com>
	<hkmqif$i2t$1@ger.gmane.org>
	<ac9c93b11002080525l4399ea54h23d387c8ce2f9024@mail.gmail.com>
	<hkp46v$tv8$1@ger.gmane.org>
Date: Mon, 8 Feb 2010 09:27:34 -0800
Message-ID: <18e217241002080927h1a4009acodd66ec735a64d31a@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.210.180
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: TSC meeting minutes 20100204
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
X-List-Received-Date: Mon, 08 Feb 2010 17:30:11 -0000
Content-Type: text/plain; charset=ISO-8859-1

> >> New-style staging means it has no do_stage method defined anymore (and
> >> not getting one thru things like autotools_stage.bbclass as well).
> >> It will re-use the output of do_install() to populate staging and run QA
> >> checks on.
> >>
> >> You can check it building it and and looking for messages like "Legacy
> >> staging enabled", which would tell you it's still using the old, slow
> >> method.
> >>
> >> regards,
> >>
> >> Koen
> >
> > Did a quick grep, there are still some 1400+ recipes that have a
> > do_stage. Now some of them are older versions (e.g. there are 6
> > xorg-lib/pixman recipes).
> > I'm more than happy to do my part of the cleaning but....
> > Almost most of the packages are things I don't know too much about.
> > What I can do (with packaged staging) remove do_stage, build, build a
> > package that depends on it and if that builds commit my work. Is that
> > considered to be good enough?
>
> You can compare the contents of the packaged-staging packages to see
> differences between then. That's what I do as a first check. Building
> something against it is the second check :)
>
> regards,
>
I, too, am still a little unclear  regarding how the new style staging
works. Are you saying that we are able now to simply remove the do_stage()
function and bitbake will somehow just know which files are intended to be
staged from the install.. what if a [say header] file that was not
previously "installed" is required by a dependent recipe?

> You can compare the contents of the packaged-staging packages to see
> differences between then. That's what I do as a first check. Building
> something against it is the second check :)


further, if Franz simply builds just one recipe (say "B") that depends on
another recipe ("A"), B might not make use of all the files staged by A,
whereas a 3 recipe may use some other files... so that method of testing is
not sufficient.... I *think* that is what Koen was saying in his most recent
reply.. right?

Still, is there some documentation on exactly how you are supposed to do the
"new-style" staging and how it works...

thanks mike

