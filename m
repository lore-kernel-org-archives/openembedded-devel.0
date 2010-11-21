Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PK007-0006jg-LM
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Nov 2010 03:50:00 +0100
Received: by gxk2 with SMTP id 2so3656990gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 20 Nov 2010 18:48:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=qSacLWcCsT7HfZ7AeE4lyeW70CVM08QAAEXZkL6kSjY=;
	b=H7vAS07rESX2766bJhoGYY30ruTYKBWoqpm2qzYxpWdU0PgvQbnm0vQf5YcgJbxjYL
	pc0jz/ymN9A+gIYSGH693fUubwJBHT0k2QiK5SNCJtM/c+an7Bz8VqTbzXpWmuLy2jCA
	6BGs2+XPz/vFY7wun/a3lEYgXkJeEBuzW/Guc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=POs2XxxIobI8NMkHXFz8yetSyJuKTBGmv69qthhop7M+x/CZm0f7uHypoOxFPNjau/
	YU0kLSIHq92FKL3zL+pcJAeB0vIUq5vMbCX83GmObVbbvt7XMoreEd/lMJol7L/SRdft
	EUhtM8xNbP7sJCKXh/a/gD9sxlu23sWuOoRnc=
Received: by 10.91.42.30 with SMTP id u30mr3576994agj.102.1290307728437; Sat,
	20 Nov 2010 18:48:48 -0800 (PST)
MIME-Version: 1.0
Received: by 10.90.120.8 with HTTP; Sat, 20 Nov 2010 18:48:28 -0800 (PST)
In-Reply-To: <4CE6B538.6050801@balister.org>
References: <AANLkTinVj9oh0p9xp9ZUtBijB63Fy7O8LcXc5-tUF9v6@mail.gmail.com>
	<ic5jrc$ksc$1@dough.gmane.org> <4CE67FA1.6020901@mentor.com>
	<ic60r2$hrs$1@dough.gmane.org> <20101119144425.GC3411@jama>
	<4CE6B538.6050801@balister.org>
From: Khem Raj <raj.khem@gmail.com>
Date: Sat, 20 Nov 2010 18:48:28 -0800
Message-ID: <AANLkTinunsDQVc6JpctLdDHXZwQReMPY6wr7ZqLNv2=N@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: release-2010.12 branch ready for testing
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
X-List-Received-Date: Sun, 21 Nov 2010 02:50:00 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Nov 19, 2010 at 9:34 AM, Philip Balister <philip@balister.org> wrote:
> On 11/19/2010 06:44 AM, Martin Jansa wrote:
> ....
>
>
>> I think that short-lived branch is better, because every testing branch
>> had few easy-to-fix issues which were fixed almost immediately in .dev
>> after testing branched and it would be hard to choose which branch was
>> best.
>>
>> But tag from any testing branch + first few quick fixes would be almost as
>> good as based on any other testing branch.
>>
>> And I also agree with Phil that this short lived branch should be
>> removed when the tag is created (to show that it's final state without
>> maintainance).
>
> I also think a *short lived* branch is a good route to try. I've been
> thinking about how the git history looks of a tag after you delete the
> branch leading up to it.
>
> For emphasis, the short lived branch will not be used to maintain the tag.
>

Yes this is exactly a short lived branch. The patches would come via
master mostly.

here are steps.

1. Tag master with branchpoint
2. Create branch
3. Cherry-pick fixes (usually commit to master first) -- (current state)
4. Tag the branch for release
5. Collapse branch to master
6. Delete release branch
7. Announce the release

Thanks
-Khem

> Philip
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


