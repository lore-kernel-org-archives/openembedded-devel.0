Received: from mail-bw0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OUIOD-0001NG-CV
	for openembedded-devel@lists.openembedded.org;
	Thu, 01 Jul 2010 13:57:10 +0200
Received: by bwz10 with SMTP id 10so250602bwz.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 01 Jul 2010 04:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=AjgoH7wCt/V4Zmvb9K3Jyv2NcEc8FTIKKsNfNvLJI78=;
	b=KjuMf26bIKwA5iNnOoWpN191DPPj2VGQvpWCmR3wGTv95HA8lYudqJkZH0YI/T83ft
	zCTDc/SjoBwTXM3+InOpW7deVC5jj/Xfe5xI8ZrtMEZwxfhWT0f3PgBJsokd6GlUUKXr
	5OkEGOeCDF1Rx+Zo4KVryFl5VXzrcCgwotYdo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=GWiWJceYsc+uWj/ddruEIU21GAf+H0skRhrXdeMdCGuBgzGg8kA4u55+LCVMhs9r21
	u7Msvsm90g2Scapnij99uTlnj7PS+MFrS5Q1nOjuUL0y2ceMkeCOiwiQOMEZop5k3GQm
	wRLYSNcmg208kD8HCGhgm+QcuChg2Aeq0eGYM=
MIME-Version: 1.0
Received: by 10.204.73.195 with SMTP id r3mr7400148bkj.147.1277985146441; Thu, 
	01 Jul 2010 04:52:26 -0700 (PDT)
Received: by 10.204.73.81 with HTTP; Thu, 1 Jul 2010 04:52:26 -0700 (PDT)
In-Reply-To: <i0hl7b$8uu$1@dough.gmane.org>
References: <4C0F9119.3000909@freyther.de> <4C2B1BC4.2030808@freyther.de>
	<i0f8ct$acp$1@dough.gmane.org> <4C2B446A.5040301@freyther.de>
	<i0hl7b$8uu$1@dough.gmane.org>
Date: Thu, 1 Jul 2010 13:52:26 +0200
Message-ID: <AANLkTimkcS9sUwgwykKcksbWMJvo1jolGpB-oaznT2bg@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.47
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: TSC Meetings for the meeting of June
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
X-List-Received-Date: Thu, 01 Jul 2010 11:57:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/7/1 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 30-06-10 15:19, Holger Freyther wrote:
>
>> In regard to the TSC, what mode of operation do you propose? We freeze
>> the tree until all items are implemented in the order they are proposed?
>> We find people driving a topic?
>
> In this specific case you (or the TSC) choose to work on a extremely
> intrusive and controversial *cosmetic* change first instead of tackling
> the some of the (IMO more important) items agreed on earlier:
>
> * making QA checks be enabled by default
> * promoting new style staging and converting existing recipes
> * promoting bbclassextend and converting existing recipes
> * fixing nativesdk

As stated before the TSC is responsible for deciding on the road
forward, notably on controversial issues, NOT for implementing them.
The TSC handles issues that are brought up by the community.
I'd say if the TSC decided e.g. on new style staging as the way
forward it is up to the people who requested a ruling on this to take
it forward.

>
> By skipping over those, without saying why and going for the cosmetic
> change the TSC is sending out a signal that they do NOT care about
> quality, only appearance. In the past I was proud about how OE handled
> things by the things you yourself created, like insane.bbclass, the
> first edition of tinderbox, etc. But recently only 2 groups of OE
> developers seem to care about quality, the SHR and angstrom folk. Those
> are the only 2 distros that have the QA checks enabled. Due to the
> nature of OE other benefit from the awesome work Martin and Khem have
> been doing, but it feels a bit one sided to me.

I do care about quailty (although not being part of the SHR or
angstrom folks), but unfortunately your perception on quality and mine
differ substantially.
For me a goal would be to have a set of high quality recipes. Others
seem to mix up quality and quantity and think quality has to do with
having many versions of a recipe around.
Of course that does not really help to make high quality recipes.
Updating many versions is a lot more work (and not too rewarding if
you just use a single version). Also testing all those versions is a
PITA.
Net effect: either older versions are not updated, or the versions are
updated but not tested. In both cases IMHO quality-wise a less
desirable situation.

Then again, I tried to fight the version diarrhea, and I lost.So be it.
But don't come and ask me to improve the quality of recipes that IMHO
should have been discarded long time ago.

Frans.
>
> Since nearly all OE developers can't work fulltime on OE, I would
> propose that the TSC sends out a few "call to action" mails, describing
> the tasks that need doing and some guidance on how they want to see it
> done. I will *gladly* help out, but I need to know what needs doing and
> avoid duplicate work.
>
> It would help to have a "completed action items", "in progress action
> items" and "action items that noone is working on" list in the TSC
> minutes (or wiki) to keep track of stuff.
>
> And of course a big thank you to all the people working on QA that I
> didn't mention.
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFMLFgrMkyGM64RGpERAtCVAJ4xp7Lxx91AwSUN7DgEwxasSjr4gACgi2/n
> qbbTDqsfC2RlFjxhRglNtZ4=
> =zIjM
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


