Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1ObKPv-0002H0-8R
	for openembedded-devel@lists.openembedded.org;
	Tue, 20 Jul 2010 23:32:02 +0200
Received: by bwz10 with SMTP id 10so3487362bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 20 Jul 2010 14:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=0i/11E3JltpqxE75PWMfCng6oegIGE1Rg3WqvhzC9us=;
	b=HyYcFsyS6OIO2IINIAEb6F9FtrKUI7Cc5i63uPlSQdhBtMrPwV1BacpXzdOsEicDGw
	FhJmYHZW2aIgyrhzsWLkZQ8qpwVwJA/bGc25GFnPQtt+TFglWiIJC8qwnbIrsrU3BK7+
	tvshnviu46HKojFxu3iAXIEbHRz8ZAkBo8lmU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=ByhfXsGXcrMOk8XkNPeua+NSUKZ+wEXXRKHDa7QTm+4p8PdznW0h2Ytbmbgtl0ric7
	SpD5UQ3lpQVmD6VTL3P1WqKOPpT+nhisgC4xPF9lKlC4bBACYsuBkP0kjNxpp15bNB//
	wDP4pZqI2z9N5fSWFOew/C3Nxq9zQzXq1PryU=
MIME-Version: 1.0
Received: by 10.204.56.14 with SMTP id w14mr5611329bkg.187.1279661511074; Tue, 
	20 Jul 2010 14:31:51 -0700 (PDT)
Received: by 10.204.60.208 with HTTP; Tue, 20 Jul 2010 14:31:50 -0700 (PDT)
In-Reply-To: <i24qm2$qc6$1@dough.gmane.org>
References: <20100709204055.GA12163@excalibur.local>
	<20100720070108.GE1512@excalibur.local>
	<i23lkm$ftn$1@dough.gmane.org>
	<20100720084026.GI1512@excalibur.local>
	<i24kf7$3d3$1@dough.gmane.org>
	<20100720173425.GL1512@excalibur.local>
	<i24qm2$qc6$1@dough.gmane.org>
Date: Tue, 20 Jul 2010 23:31:50 +0200
Message-ID: <AANLkTikzcSaJR2zDVR2A-18tiiWOuCSm6OhYTpUToAI_@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [RFC] New stable branch (and maybe a new process?)
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
X-List-Received-Date: Tue, 20 Jul 2010 21:32:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/20 Koen Kooi <k.kooi@student.utwente.nl>

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 20-07-10 19:34, Stefan Schmidt wrote:
> > Hello.
> >
> > On Tue, 2010-07-20 at 18:56, Koen Kooi wrote:
> >> On 20-07-10 10:40, Stefan Schmidt wrote:
> >>>
> >>> So your suggestion is to wait until all three are done?
> >>
> >> 'Wait' is maybe the wrong word. I would try to do a call to arms to get
> >> more people interested into getting this done.
> >
> > Wasn't there a list produced with all recipes that used legacy staging? I
> swear
> > I have seen something like this but I can't find it in my recent builds.
>
> In your TMPDIR:
>
> koen@dominion:/OE/angstrom-dev$ cat legacy-staging.log | sort | uniq | wc
> -l
> 53
>

If I understand things correctly these are only the recipes that you have
actually build that have legacy-staging (my current file lists only 1:
libtool).
However there are way more recipes around that use legacy staging.
Not fully sure if this is a right measure but there are 1140 recipes in my
tree that have a do_stage word in it. 21 of these are things like
do_stage_append, the other 1119 are having do_stage as a word.

Grep output from my tree:

frans@linux-suse:~/oe/openembedded/recipes> grep -l do_stage */*.bb | wc -l
1140
frans@linux-suse:~/oe/openembedded/recipes> grep -l -w do_stage */*.bb | wc
-l
1119

I suspect all of these need fixing (or removal).

Taking alsa/alsa-lib as an example (as this one was near the top of the list
if you do a grep.
There are 9 versions in the tree:
alsa-lib_1.0.11.bb
alsa-lib_1.0.13.bb
alsa-lib_1.0.14.bb
alsa-lib_1.0.15.bb
alsa-lib_1.0.17.bb
alsa-lib_1.0.18.bb
alsa-lib_1.0.19.bb
alsa-lib_1.0.20.bb
alsa-lib_1.0.23.bb
The last two do not have a do_stage. The first 7 do.
If we want to abandon legacy staging the first 7 should be fixed too (which
implies reworking the recpie and checking if it builds and installs
properly).
Alternate of course could be to remove those recipes (which could be done
minus .15 which is pinned:
conf/distro/include/preferred-om-2008-versions.inc:PREFERRED_VERSION_alsa-lib
?= "1.0.15"

As I wrote this is just an example. There seem to be 1119 files to go

Frans

PS: and apologies for digressing the discussion.


> It includes beasts like perl and python.
>
> regards,
>
> KOen
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMRe4CMkyGM64RGpERAv89AJ9jHvcsxzDIQAYNIHbJR1IWV3PlDACeNYn2
> qVizRtaDD5OWWKuSSRb5RcY=
> =Q4uM
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

