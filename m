Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1OwWRL-0003nw-3M
	for openembedded-devel@openembedded.org; Fri, 17 Sep 2010 10:37:04 +0200
Received: by gxk10 with SMTP id 10so715994gxk.6
	for <openembedded-devel@openembedded.org>;
	Fri, 17 Sep 2010 01:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=b9F0/SO43BPAEZMZ7eoRvXJHwG4M30+35T8cLHJC/nM=;
	b=oKBYkQiytLn7pb9xSKmzdB0SoCnpKzQ0OsdXMBEntOy3sBkn3Cw57PXAH4veM3eae4
	BBIMaXJ1BfDZvUf7U/mQv6p3liXL9m/Wynltdtr9udb8AjhNf6ViDcZTtfB+wgC4oMz5
	5ngFf5AF1aTr0gj6hLMeo2FSvxQgpX2r/XFO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=xi8G1NN5B2LoqWIhZjgwd6WwgVkBcxi9rlFVa8S+6Y0/NIsUImN78J2tdnfAhioGRZ
	0GndhjNcvziHFpPfgzz9F3sOrHqPe8kDZdEcCI1BT8N4pI/79qVEkpYR4jO/vycfNFC8
	a5eHzYgH5PGx8h6Wwf/VS2PXSThkBF4haFMqc=
MIME-Version: 1.0
Received: by 10.100.202.15 with SMTP id z15mr5102869anf.217.1284712571334;
	Fri, 17 Sep 2010 01:36:11 -0700 (PDT)
Received: by 10.231.205.204 with HTTP; Fri, 17 Sep 2010 01:36:11 -0700 (PDT)
In-Reply-To: <AANLkTimF0DyLTfajYY0zWdnLDRuE8_00iufG4V5dRY12@mail.gmail.com>
References: <AANLkTimF0DyLTfajYY0zWdnLDRuE8_00iufG4V5dRY12@mail.gmail.com>
Date: Fri, 17 Sep 2010 10:36:11 +0200
Message-ID: <AANLkTi=+EyFf3VbmfaeEk0LfhKgvWW30soUA71HRarpu@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: removal of alsa-scenario_git.bb ?
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
X-List-Received-Date: Fri, 17 Sep 2010 08:37:04 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/9/17 Frans Meulenbroeks <fransmeulenbroeks@gmail.com>:
> Hi all,
>
> Yesterday I bumped upon alsa-scenario_git.bb.
> This one had a DP of -1 and does not fetch.
>
> At first I thought a bad SRCREV but when trying to clone the git I
> also got a failure:
>
> frans@frans-desktop:/tmp$ git clone git://slimlogic.co.uk/alsa-scenario
> Initialized empty Git repository in /tmp/alsa-scenario/.git/
> fatal: The remote end hung up unexpectedly
>
> If this persists should we remove the recipe?
> I also could not identify any user.
>
> I'm especially interested in the views of Graeme on this as he added the recipe.
>
> Frans
>
Meanwhile it has been brought to my attention that this is probably an
outage in the git server. I'll keep an eye on it.

Frans


