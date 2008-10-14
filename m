Received: from [209.85.200.174] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jonas.bonn@gmail.com>) id 1KplAN-0007Uu-OI
	for openembedded-devel@lists.openembedded.org;
	Tue, 14 Oct 2008 16:46:32 +0200
Received: by wf-out-1314.google.com with SMTP id 29so2423545wff.3
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 14 Oct 2008 07:41:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=jczXHX3pBDuqaS3hqwkDM43F+EF9+viXB/BEVVKGXyA=;
	b=vWtl1YntEKZTn6i4Agkq5lYx9N8xbjVSXIH6iNsSJOCCIbdWynfI5n5O6fm4nxtiYR
	GgKJtzUDWRIcJQ1uZM4xrIqfpMsryo6/v2/jDEaWDfPM2wZNgMyLJdyy9B4JnGaN1i38
	AogorjLHvoYcH4aAFyvINQRDjKvjPBz4dPbKE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=dKbVjLYhMGByIKd33ZVg3e8wkdbahBFMAsj/LdlqznIwkWn1xlj7pIj4Kw4CGCPd8c
	k0KA0DFrK6N8Ggh1elSmjKG1wJFsc5U3enDW/Wm/WLyArNBdZa6+aCxvZmUr1JVFbvvP
	pYRvVU+PVvKropoSSSzQggl++OtlGxM3Sl2O4=
Received: by 10.114.196.13 with SMTP id t13mr6880337waf.219.1223995286694;
	Tue, 14 Oct 2008 07:41:26 -0700 (PDT)
Received: by 10.114.14.4 with HTTP; Tue, 14 Oct 2008 07:41:26 -0700 (PDT)
Message-ID: <7a6abd110810140741m4f0dffb9ob97a5a46fdf737e4@mail.gmail.com>
Date: Tue, 14 Oct 2008 16:41:26 +0200
From: "Jonas Bonn" <jonas.bonn@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <48ED467B.5080208@whitby.id.au>
MIME-Version: 1.0
References: <200810080751.15817.zecke@selfish.org>
	<200810081303.35934.zecke@selfish.org> <gci4to$pcf$1@ger.gmane.org>
	<200810081757.57676.zecke@selfish.org> <48ED467B.5080208@whitby.id.au>
Subject: Re: ETA on git conversion
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
X-List-Received-Date: Tue, 14 Oct 2008 14:46:32 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

>> git clone git://git.openembedded.net/FIXME openembedded.git
>
> Does it need to create openembedded.git as the directory name rather
> than just openembedded?

Convention is to use the .git extension for "bare" repositories and
not for a working directory as you would be creating with git-clone.
If you clone from an xxx.git repository, the working directory will be
called just "xxx" if you don't specify anything else.

>
>> git config user.name "Your Name"
>> git config user.mail "you@name"
>
> Do we want to use the --global flag so that the scope of these commands
> covers all git repos for that user and they don't forget to do it for
> every new repo they clone?

Yes, this is a good idea, in my opinion.

>
>> git commit --amend
>
> Add a comment that this should only be done on commits that have not
> been pushed anywhere, and should *never* be done on commits that have
> been pushed to a public repo?
>

I imagine the public repo is set up to only allow fast-forwards... in
this case the user won't be able to push at all if they do an --amend
on commit that's already in the repository.

>>       ( git clone git://git.openembedded.net/org.openembedded.dev openembedded ; \
>>         cd openembedded ; \
>>         git config --add remote.origin.fetch '+refs/remotes/*:refs/remotes/*' )

No, this doesn't look right...  you should not be fetching the
"remote" repository's remotes.  You should only be grabbing the
"heads" from the remote repo.  But maybe you had a reason for doing
this...???
Otherwise, the following is the usual mantra:
git config --add remote.origin.fetch '+refs/heads/*:refs/remotes/*'
...but this is also the default that git-clone sets up fpr you, so no
need to do it explicitly.

>>       ( cd openembedded && \
>>         ( git branch | egrep -e ' org.openembedded.dev$$' > /dev/null || \
>>           git checkout -b org.openembedded.dev --track origin/org.openembedded.dev ))
>>       ( cd openembedded && git checkout org.openembedded.dev )
>>       touch openembedded/.git/config
>

/Jonas


