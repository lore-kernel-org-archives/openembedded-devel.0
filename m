Received: from mail-px0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msundius@sundius.com>) id 1Nez7a-0003kB-IW
	for openembedded-devel@lists.openembedded.org;
	Wed, 10 Feb 2010 00:03:59 +0100
Received: by pxi5 with SMTP id 5so190234pxi.12
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 09 Feb 2010 15:01:17 -0800 (PST)
MIME-Version: 1.0
Received: by 10.143.26.39 with SMTP id d39mr307917wfj.33.1265756476412; Tue, 
	09 Feb 2010 15:01:16 -0800 (PST)
In-Reply-To: <4B71D7F0.6070706@cbnco.com>
References: <C791CD9B.22735%jgrant@vml.com>
	<18e217241002080848t193add2drd5603d0c252ee509@mail.gmail.com>
	<4B71D7F0.6070706@cbnco.com>
Date: Tue, 9 Feb 2010 15:01:16 -0800
Message-ID: <18e217241002091501q3cc2dcbek17e3ad35ecfa0c9c@mail.gmail.com>
From: C Michael Sundius <msundius@sundius.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.175
X-SA-Exim-Mail-From: msundius@sundius.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: Working with OEMs
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
X-List-Received-Date: Tue, 09 Feb 2010 23:03:59 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Tue, Feb 9, 2010 at 1:47 PM, Michael Smith <msmith@cbnco.com> wrote:

> C Michael Sundius wrote:
>
>> Further, I wonder if there are others out there who also feel
>> this way? My understanding is that Monta Vista is using OE; are there
>> voices
>> on this list from MV or others that use OE for creating a consistent means
>> of building for developers and Config/Release Managers? If so, what are
>> your
>> tricks and complaints with respect to this issue.
>>
>
> Hi Mike,
>
> I'm using COLLECTIONS, the srctree and gitver classes, plus amend.inc. I
> think all of the above come from Chris at MV. It's about three billion times
> better than the custom build system we had before.
>
> We have four trees:
>
> - public: playground for new recipes before submitting to OE; also,
> amend.inc's to tweak packaging behaviour or configure flags.
> - private: recipes to build closed-source drivers from our suppliers;
> - oe: full org.openembedded.dev;
> - proj: git repos for internal projects get cloned here, and added to
> COLLECTIONS with wildcards
>

we used just two collections:
openembedded:  a trimmed down openembedded tree with just the recipes that
we use
local: just like your "private"


> Building the internal projects with OE means they barely even need to be
> cross-compile aware. All they need is a simple Makefile, and a git tag to
> set the package version. It's way easier than writing a one-off build system
> for each project.
>
> The only problem is that bitbake takes forever to start up: COLLECTIONS
> causes a re-exec of Python, I think, and there are about 8,000 recipes in
> the tree. But we get around it by passing in a specific recipe file with -b.
>
> this is why we only use a trimmed down version of the OE tree. our
developers would completely revolt if we had to parse all 20k recipes... I
think its really 20k...

this is easier for building, but makes it harder to sync with the main tree.


 but I'm thinking that maybe I'll just create a file with a list of the
recipes (or just the recipe dirs) that I can used to build my BBFILES list
with. That way I'll be able to keep the whole oe tree..

We do not use git here :[ we used something call Synergy CCM (I had never
heard of it before either, but I guess its a company owned by IBM... its not
very friendly) ,  anyhow there is no fetcher currently supported. I see that
we will likely need to write our own fetcher so that we can enforce
versioning better.

we've, however, really actually been very successful by creating a class
that adds a task before the patch task.. it just sets up a symlink to the
checked out version of the code... its simple and I'm sure we could do
something fancier, but it wroks really well... it just means that we need to
pair the baseline of the OE repo w/ the source code repo.

-----------------

I have not used the srctree class, though I noticed it a while back and have
not had time to check out what it is or how it works.. (Now I guess I have
to go and educate myself...). Also not aware of the amend.inc file

-----------------

we've had long discussions about how to reconsile our software versions (for
proprietery code) and the recipe versions since they don't really follow the
version - revision way of doing things that OE uses. This has been difficult
one, I'd like to push them to be better with versioning, but infact we need
to have a real fetcher for our source control software before we can enforce
which version is built by each recipe.

---------

Finally, our drivers and applications teams just condensed their nicly
modularized recipes into just two recipes because intra recipe dependency
checking was not working (i.e. when you rebuild one recipe its dependant
recipes should rerun, but don't). I finally provided them a solution but
they had already created monster recipes for all of their source code :}



> For release management, I have a class that creates a list of the .deb
> packages that would have gone into an image, and a script that checks them
> into the right place in CVS. If you use Angstrom I think you get the same
> list for free every time you build an image. The class just saves me from
> waiting for rootfs to run.
>

we use lots of magic that puts the image in a form that can be installed on
the box. this is done in the image-postprocessing function (theres a hook
for this in the image class, forget what its called). we don't really track
the individual packages.. just the image since we never allow installing
individual packages the box.

 thanks for your comments.

