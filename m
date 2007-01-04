Received: from [64.233.182.187] (helo=nf-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <papercrane@gmail.com>) id 1H2K9H-0005gt-Pw
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Jan 2007 05:24:15 +0100
Received: by nf-out-0910.google.com with SMTP id l24so7255748nfc
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Jan 2007 20:23:02 -0800 (PST)
Received: by 10.78.149.15 with SMTP id w15mr3843221hud.1167884582705;
	Wed, 03 Jan 2007 20:23:02 -0800 (PST)
Received: by 10.78.39.8 with HTTP; Wed, 3 Jan 2007 20:23:02 -0800 (PST)
Message-ID: <432beae0701032023m25e84479w1d40eba6c5c5d7d9@mail.gmail.com>
Date: Wed, 3 Jan 2007 20:23:02 -0800
From: "Justin Patrin" <papercrane@gmail.com>
To: "Paul Sokolovsky" <pmiscml@gmail.com>, angstrom-distro-devel@linuxtogo.org
In-Reply-To: <285929428.20070102220611@gmail.com>
MIME-Version: 1.0
References: <20061230051641.GA30225@hezmatt.org>
	<1167506369.5626.46.camel@localhost.localdomain>
	<20061230214326.GE15188@hezmatt.org>
	<4596E33D.306@dominion.kabel.utwente.nl>
	<285929428.20070102220611@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [Angstrom-devel] A question of workflow
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
X-List-Received-Date: Thu, 04 Jan 2007 04:24:15 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On 1/2/07, Paul Sokolovsky <pmiscml@gmail.com> wrote:
> Hello Koen,
>
> Sunday, December 31, 2006, 12:07:57 AM, you wrote:
>
> []
> > Do what virtually every DSCM does to support that: make a branch
>
>   Well, that's what I wanted to ask for a long time: if I make my
> private branch in the local OE checkout, do I need to do some steps to
> ensure it won't be pushed to the upstream repo (assuming I have commit to
> .dev branch)?
>

What you would do is to create your own branch and propagate from
org.openembedded.dev to your own branch whenever you want the newest
changes. Make changes locally in your branch, put them in the
bugtracker, and when they're applied you get the new versions when you
propagate. Of course, since it's not using your branch revision as the
ancestor and we not always commit your patch as it originally was, you
will have conflicts, but c'est la vie. This is a general trust
problem.

You could also make changes in a local branch and then propagate to
org.openembedded.dev, but in this case you are basically just making
your changes to org.openembedded.dev and if you got push access to our
DB all of a sudden your branch's revisions would be pulled into the
main DB since they are ancestors of revisions in org.openembedded.dev.
The revisions in your branch would also not have branch certs (due to
our limiting of branches you can push) and so would be basically
dangling ancestors. Again, this wouldn't be good for us as it brings
in a lot of revisions that we don't really need.

I suggest option 1 where you propagate from .dev to your own branch.
Yes, you will have conflicts if we alter your patches, but there is
really no way (with monotone at least) to deal with this.

(Essentially what we are talking about here is cherry picking and
knowing where a patch came from. It's a complicated issue and not
somehting that monotone supports directly at the moment.)

-- 
Justin Patrin


