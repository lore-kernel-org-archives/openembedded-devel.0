Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OpKM3-0005Mt-UB
	for openembedded-devel@lists.openembedded.org;
	Sat, 28 Aug 2010 14:17:53 +0200
Received: by yxk30 with SMTP id 30so1537456yxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 28 Aug 2010 05:17:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=g2LFA+ekTOGdFpWGjxo4mUskYYddqESLYUDSzy5nP2Y=;
	b=KsPMEy6Z0A+RQxqsqwicibUCpBcYkBMQpCg0Cm1znJfMeO4iQ6PEubppepC6N/PefY
	V/xahaXxqV+J8YDF8QUwUd+5O0fp7Jx58VYt3RGcDLVP/bYhrypGxpyslTVXK3pbxB+y
	ZsXeOV1dPK0AdJWuHYjPIyFLi0hpxTcwa8T5I=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=e+TwCE8Lr6PsKn8dqKlKOTmC332tjHVaoJOEYHJ838U1d1yucDH+dN3hookgrid7HL
	guahvz4CDKaztq3cRJMoVkUSb2v18jdo2QEzM38hryMsufZfgp6NlIuGGFgd76PZysal
	O2imo6a4j7FAPkLY3gh1DU1RXUexCQLtSAO/A=
MIME-Version: 1.0
Received: by 10.90.56.12 with SMTP id e12mr1899894aga.179.1282997837371; Sat,
	28 Aug 2010 05:17:17 -0700 (PDT)
Received: by 10.231.205.138 with HTTP; Sat, 28 Aug 2010 05:17:17 -0700 (PDT)
In-Reply-To: <i5ao76$sja$1@dough.gmane.org>
References: <AANLkTin5LRCz6PU_x6Mw+V2Xf8W=i+n4RLqQjwON1R7+@mail.gmail.com>
	<i5ao76$sja$1@dough.gmane.org>
Date: Sat, 28 Aug 2010 14:17:17 +0200
Message-ID: <AANLkTimg-G7W0SNdf_35BRENQvBOJ9UVdn9Xugwn_AcW@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.213.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] review process
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
X-List-Received-Date: Sat, 28 Aug 2010 12:17:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/8/28 Koen Kooi <k.kooi@student.utwente.nl>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 27-08-10 14:15, Frans Meulenbroeks wrote:
>> It is a good rule that important changes (toolchain, infrastructure)
>> are reviewed before being committed.
>> This is e.g. also specified in
>> http://wiki.openembedded.net/index.php/Commit_Policy
>>
>> However, recently I've seen some issues that our review process does
>> not seem to work or is abused.
>>
>> I see two things happening.
>> - patches are submitted for review but do not gain any feedback in a
>> reasonable time. I have several patches in the queue that did not get
>> any feedback.
>> - people are abusing their powers by rejecting changes without
>> motivation. See e.g [1] and [2]. I feel if you reject a patch you have
>> an obligation to explain why you rejected it.
>
> If you want to delete a recipe I maintain, the burden is on you or are
> you saying that maintainers aren't in charge of their recipes anymore?

One of the reasons that someone submits a patch is *because* he is not
the maintainer of the recipe.
Like Mickey says it is not more than polite to tell the submitter (who
invested time in creating the patch) why you reject the patch.
Maintainership does not only come with rights but also with
responsibilities. There is no reason to be rude.
Note also that OE is a team effort. One is the maintainer of the
recipe, not the dictator of the recipe.

Also I (and I think many with me) would appreciate it if you showed
the same respect to the recipes of others as you expect others to show
to your recipes.

Frans.

PS: Wrt the maintainership of the recipes: I do not want to divert
this topic into a discussion on that, but will react to that in the
bitbake world thread started by Khem.


