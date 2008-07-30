Received: from [74.125.46.158] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KOEMx-0005t4-3f
	for openembedded-devel@openembedded.org; Wed, 30 Jul 2008 18:17:43 +0200
Received: by yw-out-1718.google.com with SMTP id 5so59311ywr.30
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 09:16:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=rJjWzz37eOQCcjQ1pMHZjTAg9KkgUiE2IPYevLWnD8g=;
	b=HMQmjHcA/UIxCkWB0Qa8Ot12W2+EKFBAB0eitOHxKTlGXoSPTW1XWj4FFWzvW2h2V9
	e81VLsztVpNDCgGaf8oQO1slwObKLZtrtY0p11UXOArLe8dIEO1Ghxqte3i65clsJsp1
	TcOlYk8Ky91vwk1kQiMjQYGOQ89T91hMOz7f0=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=wbEFhxwRY4S6eLLMn9THb6/GghUd74uguav5gCfdIYklhvdZXal5B7PXvrXUZSvgRh
	bkJAYUsAM7YXGHxMJUx1k2JWEGGTjbJGzGjh6qlK+1iOl9jaXSUgB6MIWYBSLarV66Ur
	uh7gTt9UN3pnn88q8jcTB6U1HqidTWKNjKbjQ=
Received: by 10.114.77.19 with SMTP id z19mr8771169waa.138.1217434558973;
	Wed, 30 Jul 2008 09:15:58 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Wed, 30 Jul 2008 09:15:58 -0700 (PDT)
Message-ID: <f96d234e0807300915y48ffc027w14e5a37604141ab9@mail.gmail.com>
Date: Wed, 30 Jul 2008 12:15:58 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <1217428116.5510.26.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
Subject: Re: Git Migration Status
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 30 Jul 2008 16:17:43 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 30, 2008 at 10:28 AM, Richard Purdie <rpurdie@rpsys.net> wrote:
> On Wed, 2008-07-30 at 09:07 -0400, Philip Balister wrote:
>> Otavio Salvador wrote:
>> > "Cliff Brake" <cliff.brake@gmail.com> writes:
>> >
>> >> Using real email addresses would also simplify server admin and be one
>> >> less load on the server.  When the spam starts flowing, this can
>> >> require a significant amount of network bandwidth.  Where I host my
>> >> main web site and domain, the owner claims spam to email accounts is
>> >> by far the greatest use of bandwidth, and he spends a lot of time
>> >> implementing anti-spam measures.  With limited resources, simple is
>> >> good!
>> >
>> > +1
>> >
>>
>> I also agree. I would prefer to commit with my own address. I own all
>> the domains, so they should last as long as I do.
>
> Before we all start jumping on this wagon let me explain some of the
> background to what I proposed. I was trying to keep that announcement
> brief and it assumes some understanding of git so let me explain
> further:

Thanks for explaining -- this provoked me to do a little more digging ...

We have a nomenclature issue -- "commit id" is typically referred to
in the git documentation as the hash that defines a particular commit,
so perhaps "committer" is slightly more correct.  Being on the doc
team, I guess I'm supposed to be picky about stuff like this :-)

The following docs give a little more information:

http://www.kernel.org/pub/software/scm/git/docs/git-config.html
http://www.kernel.org/pub/software/scm/git/docs/git-commit-tree.html

GIT_AUTHOR_NAME
GIT_AUTHOR_EMAIL
GIT_AUTHOR_DATE
GIT_COMMITTER_NAME
GIT_COMMITTER_EMAIL
GIT_COMMITTER_DATE

Is env variables the only way to set these to be different than user.*?

The following commands:

git log --pretty=raw
git show --pretty=raw

can be used to show both committer and author id.  gitk also shows
both author and committer ID.

One thing that is useful is to be able to figure out who might have
merged a change from another branch.  For example, I could have my own
git repo where all the commit IDs are my ID (oops, I meant
committer!!!!).  Someone else could merge this repo into the master OE
repo.  In this case, the committer ID for a particular commit does not
tell you who decided to merge my branch into the master OE repo, as my
committer ID will still be listed in the commits.  You have to follow
a graph of all the merges to know for sure what happened.

There are several ways to view this:

git log --branch ... (my version of git does not have this :-(  )
gitk $commit_id..$branch_name

The second option shows a simple graphical view of how something got
into a branch and all the merge points.  The more I mess with git, the
more impressed I am that you can just try stuff like "gitk
$commit_id..$branch_name", and it just works.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


