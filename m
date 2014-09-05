Return-Path: <mike.looijmans@topic.nl>
X-Greylist: delayed 317 seconds by postgrey-1.34 at layers.openembedded.org;
	Fri, 05 Sep 2014 14:03:50 UTC
Received: from smtp10.online.nl (smtp10.online.nl [194.134.42.55])
	by mail.openembedded.org (Postfix) with ESMTP id 122B0713D4
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 14:03:50 +0000 (UTC)
Received: from smtp10.online.nl (localhost [127.0.0.1])
	by smtp10.online.nl (Postfix) with ESMTP id E8C6E4025C
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:58:30 +0200 (CEST)
Received: from [192.168.1.6] (s55969068.adsl.online.nl [85.150.144.104])
	by smtp10.online.nl (Postfix) with ESMTP
	for <openembedded-devel@lists.openembedded.org>;
	Fri,  5 Sep 2014 15:58:30 +0200 (CEST)
Message-ID: <5409C186.8050200@topic.nl>
Date: Fri, 05 Sep 2014 15:58:30 +0200
From: Mike Looijmans <mike.looijmans@topic.nl>
Organization: Topic
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.6.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CAJTo0LaRETJdKG-bL+40YtGrVjs4MLVLiydybSUj5ALa2tyxUQ@mail.gmail.com>	<CAJTo0LYhvZHJEEQLWuCsfxqqbBCSXnxR3cxJZJt2Z0fgYgwEww@mail.gmail.com>
	<CALbNGRRVvT7Qv868RNWbo8_DjLwkbUjOH_cCNMjPNifFEcHu3g@mail.gmail.com>
In-Reply-To: <CALbNGRRVvT7Qv868RNWbo8_DjLwkbUjOH_cCNMjPNifFEcHu3g@mail.gmail.com>
X-Online-Scanned: by Cloudmark authority (on smtp10.online.nl)
Subject: Re: Style issue for recipes
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Sep 2014 14:03:58 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 09/04/2014 07:29 PM, Andreas Müller wrote:
> On Thu, Sep 4, 2014 at 6:34 PM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 4 September 2014 15:12, Burton, Ross <ross.burton@intel.com> wrote:
>>> Quick question of style for the community to bikeshed on:  in the
>>> general case should recipes be split into foo_1.2.bb and foo.inc, or
>>> should they only split to bb/inc if there are multiple versions and
>>> generally there should just be foo_1.2.bb.
>>
>> Another argument against widespread inc files: they encourage the
>> impression that maintaining multiple versions is just a matter of
>> having a .inc file.  The moment you start having to put
>> version-specific statements into a .bb you've entered a world of pain
>> in keeping the .bb files in sync, moving options into the .inc as they
>> become used by all versions, and purging old version-specific
>> statements.
>>
>> Ross
>> --
> I agree with Ross: It often took me time to find out where
> functionality comes from. Inc-files do only make sense for multiple
> versions of recipes or if different recipes share same code (only
> example I can remember is meta-gnome gvfs/gvfs-gdu-volume-monitor
> circular-dependency hack).
>
> My feeling is that the inc-files are still from classic oe times where
> we had multiple versions for many recipes and most can be merged into
> recipes without loosing something.

Why not take it one step further and remove the version from the bb 
filename? Only use the "versioned" filename if there actually is more 
than one version.

I'd propose that the recipe for package "foo" is always called "foo.bb". 
A "PV" setting in that file can provide the information that bitbake needs.

If there's an alternative, but not mainstream or recommended version for 
that package, it can be named "foo_1.1.bb".

That way, you can see in a glance what recipe is the default one and 
which are the "extras".

I guess for 99% of the recipes, there's only one version. It's much 
easier to track it if the filename remains constant. Yes, I know about 
git's fancy features, but...

What about the mighty simple usecase of just being able to search for 
"foo.bb" using your favorite search engine and then actually finding it 
in a public overlay repository on the web? For example, you will be able 
to find a recipe for libdvdcss by simply hunting for "libdvdcss.bb", but 
you'll have a hard time finding the hamsterdb recipe because it happens 
to be named "hamsterdb_git.bb" in that same repository.

-- 
Mike Looijmans

