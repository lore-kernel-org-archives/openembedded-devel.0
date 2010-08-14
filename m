Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vwyodapink@gmail.com>) id 1OkLKU-0003t0-3Z
	for openembedded-devel@lists.openembedded.org;
	Sat, 14 Aug 2010 20:19:41 +0200
Received: by wyb38 with SMTP id 38so4126709wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 14 Aug 2010 11:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=zgVgpMBz/ecst28WPlxJTsrnPhVWaMXoJ1b2frBPnUk=;
	b=tnXfwIPwMA6TdQq1inRmAfEV6kgFMt90rABirzVgEuFdx7T8LeyKIFl8qCFLQ25mp6
	63iB+aGYsBFVIhGeUd5rZEyfZ95PhouDB6M6lmlANiznDxS2fH1AInGpsoHWokv1hwDz
	n9hB8DfRBvNerzBxUc85maOUrB55LF1vA6Os0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=g2xG32V0He2lBgtKlL9nTJ6A0Zy6NVlr6ISX1LrE8g7Iky/4NSyFp9w13bIGmIYUo9
	J0UBqBkuSWWCGBHtVridMHxxDIg9hBPvTCiwhBkGfyyxSJSSGRlr/x3/41V446K6mvQC
	V1UbaL3eIvjLy2H3GdqYsSmtqGh8IqIAxkwPM=
MIME-Version: 1.0
Received: by 10.227.157.4 with SMTP id z4mr2630685wbw.43.1281809955818; Sat,
	14 Aug 2010 11:19:15 -0700 (PDT)
Received: by 10.216.135.18 with HTTP; Sat, 14 Aug 2010 11:19:15 -0700 (PDT)
In-Reply-To: <AANLkTikw6vx5mHeAAbtjJDv5b=ato=93yxv=9u2gjm56@mail.gmail.com>
References: <AANLkTi=gYuoD-3RO=c5GpEbOZoHsAJOijrXXGnzcdNe9@mail.gmail.com>
	<AANLkTina16zJVc+O13hPdpLzwV9X5mXAFhhUG5BWsb04@mail.gmail.com>
	<AANLkTikw6vx5mHeAAbtjJDv5b=ato=93yxv=9u2gjm56@mail.gmail.com>
Date: Sat, 14 Aug 2010 11:19:15 -0700
Message-ID: <AANLkTikMKFG8k8k4xM81LBsVQf21L0d43fEUiYf_UskW@mail.gmail.com>
From: "J. L. " <vwyodapink@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: vwyodapink@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
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
X-List-Received-Date: Sat, 14 Aug 2010 18:19:41 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Right on thanks that does seem to answer a couple questions I have
come across so far especially the devshell. I will give making my
recipe another shot again today and see if I can get further with it
or even crazier get it to build correctly. Thanks again hopefully we
will see some other input to your original statement.



On Sat, Aug 14, 2010 at 10:06 AM, AJ ONeal <coolaj86@gmail.com> wrote:
> I've been compiling some common general issues
> http://fastr.github.com/articles/Troubleshooting-bitbake.html
>
> Here's some quick-n-dirty instructions akin to using devshell:
>
>
> =A0 1. cd ${OVEROTOP}/tmp/work/${ARCH}/${PACKAGE}_${VER}_r${REV}/${BUILD}
> =A0 =A0 =A0- ${ARCH} is probably armv7a-angstrom-linux-gnueabi
> =A0 =A0 =A0- ${BUILD} is a directory which is not NOT src or temp such as=
 the
> =A0 =A0 =A0package name or git or trunk or svn
> =A0 =A0 =A0- ${VER} and ${REV} - duh.
> =A0 2. `cp ../temp/run.do_compile.${OLD_PID}
> =A0 =A0 =A0- ${OLD_PID} is a number like 3597 or 4352
> =A0 =A0 =A0- do_compile could be any task - do_install, etc
> =A0 3. vim run.do_compile.1234
> =A0 =A0 =A01. comment out do_compile() (or whatever)
> =A0 =A0 =A02. add bash --norc
> =A0 4. ./run.do_compile.1234 will put you in an environment with all
> =A0 variables set
> =A0 5. make (or whatever) to try to build, debug issues
> =A0 6. exit (when done to go back to shell without run.do_compile setting=
s)
>
> This is based on the tip on openembedded wiki, but it took me a while to
> understand what theirs meant so I cleaned it up in a fashion which is
> hopefully crystal clear.
>
> AJ ONeal
>
> On Sat, Aug 14, 2010 at 10:16 AM, J. L. <vwyodapink@gmail.com> wrote:
>
>> I agree with you AJ, its become a serious pain to just get a built
>> image. I myself have only built once completely and have yet to again
>> since figuring out the changes I needed to make to that image. I would
>> like to help myself but someone like me whose not very competent in
>> this area finds the documentation a tad lacking to properly learn the
>> ways to help. I still have yet to figure out how to even get my own
>> program from the net to build with OE as just following the hello
>> world does not seem to be enough for me to grasp how to do it with an
>> actual problem. Which runs me into my next issue I can not properly
>> modify the way some programs build to get the features I want.
>>
>> I have also noticed on the gumstix boards while most of the time it
>> seems its the same errors people get, every once in awhile you see
>> some people with one issue and others with another.
>>
>> I am sure this wont be of much use as a post but figured I would chime
>> in from an inexperienced beginner trying to get a footing in here and
>> to actually be able to use things properly.
>>
>>
>>
>> On Sat, Aug 14, 2010 at 8:46 AM, AJ ONeal <coolaj86@gmail.com> wrote:
>> > This is about the 4th time that I've `rm -rf`-d everything and started
>> from
>> > scratch and never yet got a working `bitbake omap3-console-image`
>> >
>> > Every time I `git pull` it's a different set of problems. It's never t=
he
>> > same package twice, but they never all compile for the basic console
>> image
>> > anywhere from 4 to 20 hours in.
>> >
>> > Fortunately, I do have a machine that did build omap3-console-image a =
few
>> > weeks ago at work. But I've never been able to get it on my machine at
>> home
>> > (same os) to start playing around with.
>> >
>> > What needs to happen in order for things to git checked that they work
>> with
>> > at least a few common meta-tasks before being pushed out?
>> > And is there anything I can do to help? (Donate some machine time to r=
un
>> > tests, for example)
>> >
>> >
>> > Obviously, we all have our day jobs and whatnot, but this is becoming
>> really
>> > frustrating for me and I'd like to see things improve.
>> >
>> > AJ ONeal
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>> >
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


