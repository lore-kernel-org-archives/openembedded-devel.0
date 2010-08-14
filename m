Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <coolaj86@gmail.com>) id 1OkKCB-0007Pe-0C
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 19:07:15 +0200
Received: by fxm6 with SMTP id 6so2431962fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 10:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=1UK+FDTyJvg9Jley3oHWKnMCq8cGklBJMK14T8HBxPA=;
	b=GCCOkRJN1NXrdqUITWzkCjuA/fwcpM41Vk1NsZQoz5yQIsu6X3xe9vZPJiBpS0ZG2s
	sjfapRiEv9ZpegeXvaMytSGSo4FZMV1srCmNfrgmXutQDOcRV4aKZAbcNiMpSX/eJJMr
	OFnWxND2SoEvoFaX0ICLZhwPcgZnr8L2EPrK4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=OLFSA18IK7r33c7wWOEZr9rlDgHAmGDKovDIOveiRD++LSFOp5DLRwJAvb4Gla9sxx
	AWrmsK/DGSKIPw9UKGJt4EtL/0gwgoLYgJwuRLozo9/A0L3yg7oIroYWmB9ys3K9xXU0
	CSHfm9EmItuLRn9SzwJCFCtbmsSN5mdBCaYts=
Received: by 10.223.110.67 with SMTP id m3mr3412949fap.24.1281805599179; Sat,
	14 Aug 2010 10:06:39 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.223.125.209 with HTTP; Sat, 14 Aug 2010 10:06:19 -0700 (PDT)
In-Reply-To: <AANLkTina16zJVc+O13hPdpLzwV9X5mXAFhhUG5BWsb04@mail.gmail.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTina16zJVc+O13hPdpLzwV9X5mXAFhhUG5BWsb04@mail.gmail.com>
From: AJ ONeal <coolaj86@gmail.com>
Date: Sat, 14 Aug 2010 11:06:19 -0600
Message-ID: <AANLkTikw6vx5mHeAAbtjJDv5b=ato=93yxv=9u2gjm56@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: coolaj86@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: What to do about the poor bitbake Quality Control?
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
X-List-Received-Date: Sat, 14 Aug 2010 17:07:15 -0000
Content-Type: text/plain; charset=ISO-8859-1

I've been compiling some common general issues
http://fastr.github.com/articles/Troubleshooting-bitbake.html

Here's some quick-n-dirty instructions akin to using devshell:


   1. cd ${OVEROTOP}/tmp/work/${ARCH}/${PACKAGE}_${VER}_r${REV}/${BUILD}
      - ${ARCH} is probably armv7a-angstrom-linux-gnueabi
      - ${BUILD} is a directory which is not NOT src or temp such as the
      package name or git or trunk or svn
      - ${VER} and ${REV} - duh.
   2. `cp ../temp/run.do_compile.${OLD_PID}
      - ${OLD_PID} is a number like 3597 or 4352
      - do_compile could be any task - do_install, etc
   3. vim run.do_compile.1234
      1. comment out do_compile() (or whatever)
      2. add bash --norc
   4. ./run.do_compile.1234 will put you in an environment with all
   variables set
   5. make (or whatever) to try to build, debug issues
   6. exit (when done to go back to shell without run.do_compile settings)

This is based on the tip on openembedded wiki, but it took me a while to
understand what theirs meant so I cleaned it up in a fashion which is
hopefully crystal clear.

AJ ONeal

On Sat, Aug 14, 2010 at 10:16 AM, J. L. <vwyodapink@gmail.com> wrote:

> I agree with you AJ, its become a serious pain to just get a built
> image. I myself have only built once completely and have yet to again
> since figuring out the changes I needed to make to that image. I would
> like to help myself but someone like me whose not very competent in
> this area finds the documentation a tad lacking to properly learn the
> ways to help. I still have yet to figure out how to even get my own
> program from the net to build with OE as just following the hello
> world does not seem to be enough for me to grasp how to do it with an
> actual problem. Which runs me into my next issue I can not properly
> modify the way some programs build to get the features I want.
>
> I have also noticed on the gumstix boards while most of the time it
> seems its the same errors people get, every once in awhile you see
> some people with one issue and others with another.
>
> I am sure this wont be of much use as a post but figured I would chime
> in from an inexperienced beginner trying to get a footing in here and
> to actually be able to use things properly.
>
>
>
> On Sat, Aug 14, 2010 at 8:46 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> > This is about the 4th time that I've `rm -rf`-d everything and started
> from
> > scratch and never yet got a working `bitbake omap3-console-image`
> >
> > Every time I `git pull` it's a different set of problems. It's never the
> > same package twice, but they never all compile for the basic console
> image
> > anywhere from 4 to 20 hours in.
> >
> > Fortunately, I do have a machine that did build omap3-console-image a few
> > weeks ago at work. But I've never been able to get it on my machine at
> home
> > (same os) to start playing around with.
> >
> > What needs to happen in order for things to git checked that they work
> with
> > at least a few common meta-tasks before being pushed out?
> > And is there anything I can do to help? (Donate some machine time to run
> > tests, for example)
> >
> >
> > Obviously, we all have our day jobs and whatnot, but this is becoming
> really
> > frustrating for me and I'd like to see things improve.
> >
> > AJ ONeal
> > _______________________________________________
> > Openembedded-devel mailing list
> > Openembedded-devel@lists.openembedded.org
> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
> >
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

