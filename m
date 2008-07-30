Received: from [74.125.46.156] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1KOF9r-0006e3-RT
	for openembedded-devel@openembedded.org; Wed, 30 Jul 2008 19:08:16 +0200
Received: by yw-out-1718.google.com with SMTP id 5so74524ywr.30
	for <openembedded-devel@openembedded.org>;
	Wed, 30 Jul 2008 10:06:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=DJt/XNL3yQ0QA6Y1kqajoyDWDD1bMjwT+PFpSRLmCuE=;
	b=xBFNkmUpm9Q6K5J7kIbUCF73UILWPYNjTE4hnqRshDw2XlJW3CEHGkgksr7p+k5Fhb
	boGEYgO8fnQ7NIc31Lur7u56P6BwVRQtOdkXbg9W9I/KgE3asPC8V8+G8xEMp/KtgYYy
	VMrPBlHrWXc7kTATIHYRH7D+uh/Dpvj+M5fVs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=PqnEN/f+sYeJg1YdPc4esk/pn7eva1GVVJQoZ0do4U/+oVj7Re2QbXkyiJXCKffLni
	kV4bYUmzBL6IrG9A5GAjZSJ9rTR0oyMHtmN+Dbrp1MzmpA4wLV5f8WTkhbSvAWWFyc9u
	q5CXPtwgCUXIC9cctf4QNESfvi6Ncc7QKhsuU=
Received: by 10.114.53.18 with SMTP id b18mr5622418waa.220.1217437592223;
	Wed, 30 Jul 2008 10:06:32 -0700 (PDT)
Received: by 10.114.184.13 with HTTP; Wed, 30 Jul 2008 10:06:32 -0700 (PDT)
Message-ID: <f96d234e0807301006x5fc528b8kf9a762021a0024f5@mail.gmail.com>
Date: Wed, 30 Jul 2008 13:06:32 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@openembedded.org
In-Reply-To: <1217434487.5510.64.camel@dax.rpnet.com>
MIME-Version: 1.0
References: <1217340989.5482.10.camel@dax.rpnet.com>
	<488FAE77.7050107@whitby.id.au>
	<200807300920.37221.openembedded@haerwu.biz>
	<f96d234e0807300429j2fff8df0oc494e4a5beb9f8ff@mail.gmail.com>
	<87myjz34uv.fsf@neumann.lab.ossystems.com.br>
	<4890678A.5040005@balister.org>
	<1217428116.5510.26.camel@dax.rpnet.com>
	<489084EE.9070407@whitby.id.au>
	<1217434487.5510.64.camel@dax.rpnet.com>
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
X-List-Received-Date: Wed, 30 Jul 2008 17:08:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

On Wed, Jul 30, 2008 at 12:14 PM, Richard Purdie <rpurdie@rpsys.net> wrote:

> Say I have some tree outside OE and I commit things to is as a developer
> with no access to OE directly. "We" then want to merge that into OE.
> Even assuming the commit hooks allow this (there are ways and means) we
> immediately lose our namespace protection. There are 101 other scenarios
> that would allow this to happen and they show that namespace protection
> is pointless with git.

Agreed, I'm not sure there is any way we can force a uniform commit id
format with the possibility of merging branches.

> Note that your AUTHORS file would also break with this approach unless
> at merge time you grep the external tree for all email addresses and
> then add them which would be tedious at best.

It seems to me that whoever does the merge has to vouch for the
commits in the branch that gets merged.

> For b) I'd propose making a list of the monotone IDs we have and asking
> for opinions of what to do with them. I'm happy for
> "rpurdie@openembedded.org" to become "Richard Purdie <rpurdie@rpsys.net>
> for example and that will increase the usefulness of the metadata (some
> username mappings are much harder to guess). I already have a list of
> bkcvs ids to monotone IDs so this just leaves the the monotone -> git
> mappings. Is anyone willing to volunteer to collect a list?

Why not put a list on the wiki and ask people to edit.  I'll see what
I can find ...

> For a) I guess the best we can do is add some checking for insane commit
> and author IDs like containing "localhost", not setting a name or
> containing an IP address. I'd also like to add something to the commit
> policy about only committing using sane IDs, commits with invalid IDs
> are at risk of being reverted.

Seems like it has to come down to policy.  Anyone who wants to merge a
branch needs to make sure it has sane commit ID's first.  Its fairly
easy to track down who merged a commit, so this may require some
enforcement, but people will learn fairly quickly if its enforced.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


