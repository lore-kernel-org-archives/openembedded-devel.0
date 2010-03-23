Received: from qw-out-1920.google.com ([74.125.92.147])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <kergoth@gmail.com>) id 1Nu6JC-0000Dx-RH
	for openembedded-devel@lists.openembedded.org;
	Tue, 23 Mar 2010 16:47:21 +0100
Received: by qw-out-1920.google.com with SMTP id 4so591445qwk.36
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 23 Mar 2010 08:43:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:sender:received:in-reply-to
	:references:from:date:x-google-sender-auth:message-id:subject:to
	:content-type; bh=6CzjZC0jPG0+IWIgB/JGEau9V/FYS4AYbP6LATZ89rY=;
	b=XGwGYn1NFEv2BOA6N9Ijgeg/tKcpnIunjThXKnM7RXJK4MB5OuZCDbRj3TJEIYysGA
	R8zkM9HJVMHkHqH5fDgBbOkXka26XerVx5mVzwv48wEogo4U9NIrkswYOlRbFmwD3NkO
	UEz4NFxvDPtc1SYRlXiB2V7CGn+NLYvmN6gwU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:from:date
	:x-google-sender-auth:message-id:subject:to:content-type;
	b=BLT8H6DN/qJqA4vGnxYRpSPlnvsdPdncAxprdw5QMiyebIjy+dMHX9wWjGWJ04DCfl
	WkhlBxQgsr1ARFEk8SXVRxTtOXUybHFYnVVsyb4eiv5Cup8soCcQM9sBOM1SYunl8kcY
	qnlia24IGEmiRzBBy/rA1sy8FY0N2CjYPrubc=
MIME-Version: 1.0
Sender: kergoth@gmail.com
Received: by 10.229.189.16 with SMTP id dc16mr982921qcb.92.1269358996104; Tue, 
	23 Mar 2010 08:43:16 -0700 (PDT)
In-Reply-To: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
References: <b6ebd0a51003221526y7c47c57esd7bc14cc5e85f893@mail.gmail.com>
From: Chris Larson <clarson@kergoth.com>
Date: Tue, 23 Mar 2010 08:42:56 -0700
X-Google-Sender-Auth: 8de7f45fa9890736
Message-ID: <b6ebd0a51003230842g44c6bd29tdc01db5dc7e05bec@mail.gmail.com>
To: Openembedded Discussion <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 74.125.92.147
X-SA-Exim-Mail-From: kergoth@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,HTML_MESSAGE,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: BBVERSIONS
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
X-List-Received-Date: Tue, 23 Mar 2010 15:47:33 -0000
Content-Type: text/plain; charset=UTF-8

Just created a proper github project for my nano experimentations, and
pushed the current incarnation (slightly messier than it needs to be, since
I'm still experimenting with different ways of structuring it).
http://github.com/kergoth/Nano-OE/tree/master/recipes/nano/.

On Mon, Mar 22, 2010 at 3:26 PM, Chris Larson <clarson@kergoth.com> wrote:

> Greetings all,
>
> I'm emailing about a prototype I threw together of a BBVERSIONS
> implementation in BitBake.  This functionality is similar to BBCLASSEXTEND,
> but it lists versions, and sets PV rather than doing an inherit.  This
> allows you to create one recipe that can build multiple versions of
> something.  Either you can do one recipe that can build everything, or you
> could (I prefer this) create one recipe for each range of versions which are
> built in a given way with a given set of patches.
>
> It helps if you think about an upstream change (which, say, breaks
> application of a patch) as being a change going forward.  No one makes a
> change assuming it'll be reverted the next release, so it's likely that a
> given patch will apply through a set of versions, until another change
> breaks it further.  So, metadata and patches is really rarely bound to just
> one version, but is instead bound to the series of versions which can be
> built in that way and which can have those patches applied.
>
> The version from BBVERSIONS is added to OVERRIDES, to allow for version
> specific metadata.  In addition, you can specify a name for the range of
> versions, which is also added to OVERRIDES.  As an example, I created a
> nano_1.0.0+.bb recipe which builds 1.0.0 through 1.0.6, its BBVERSIONS is
> set to 1.0.[0-6].  The BPV variable gets set with the 1.0.0+ value, so it
> can be used in the filespath, so the generic files go there, and individual
> versions can override further if necessary.
>
> I've been experimenting with a set of files and recipes to build every
> version of nano that exists, from 1.0.0 through 2.2.3, with one recipe for
> each set of versions.  I'm still investigating to find the optimal workflow
> with this, someone else may want just one recipe for all versions, or they
> may want to leave it as is, just one recipe per version, but I suspect this
> may reduce the number of files duplicated across filespaths amongst versions
> which could be grouped together into a single recipe.
>
> Thoughts? Questions? Concerns?  I've been wondering if this is really
> worthwhile, but I think it is.  I think there is value in keeping old
> versions around, but this allows us to avoid cluttering up the repository as
> much, and makes it so that one change to a recipe can affect all the
> versions in that range by default, or all versions, rather than just the one
> version you tested.  Of course, ideally you'd test all versions, but that's
> the case today too, its just that now our recipes get bitrotted instead.
>  Personally, I'd rather see the old version content continue to be brought
> forward by default, and if it fails to build with that, we fix it, but it's
> easier to fix a build than to unclutter the repository.
>
> I'm hoping to get some input on this :)
>
> The bitbake changes: http://github.com/kergoth/BitBake/commits/bbversions
> The repository with my experimentations with nano (haven't pushed since I
> split the recipe by version range yet): http://gist.github.com/338382
> --
> Christopher Larson
> clarson at kergoth dot com
> Founder - BitBake, OpenEmbedded, OpenZaurus
> Maintainer - Tslib
> Senior Software Engineer, Mentor Graphics
>



-- 
Christopher Larson
clarson at kergoth dot com
Founder - BitBake, OpenEmbedded, OpenZaurus
Maintainer - Tslib
Senior Software Engineer, Mentor Graphics

