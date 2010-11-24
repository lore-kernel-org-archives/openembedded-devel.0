Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PLBVq-0008LR-1U
	for openembedded-devel@lists.openembedded.org;
	Wed, 24 Nov 2010 10:19:38 +0100
Received: by iwn7 with SMTP id 7so387467iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 Nov 2010 01:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=c3hH0NTAWXIsDyGQcW9+xtk+K9eVWANiTl2/Qhtjg4s=;
	b=eqFb+mtz/Qepy2K029JMuF+fl4nRL5nzR+y3pa06mgi3iozzBmKC/F9EXag4soLmYF
	jI6+TwVr3v68R1LjnTP7z+zIWv7+CB0jekjZOET9+Eh7vkXBQD4vKe8XOfuq3yIf/4IR
	QufPAJ0FqH0qF8+1koA8DqNlGEQujUH2/QA6g=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=EHzRFqz52AGl/TzsPR0qKhs5iSVfd20yjbvd6MGZHTUk00QPDhqIdMfe2yZMo7JpeB
	KCEdvLloWPbtRkCpN2N9VF6u6KFk3ksq7ewseCdWV46kyUUn/3RI+J6Ub63d0scb69VL
	LJNihjC1hJYK0YAs7xlqgJzh/Ix1XjiBWPfzw=
MIME-Version: 1.0
Received: by 10.231.144.21 with SMTP id x21mr8569839ibu.126.1290590304854;
	Wed, 24 Nov 2010 01:18:24 -0800 (PST)
Received: by 10.231.33.4 with HTTP; Wed, 24 Nov 2010 01:18:24 -0800 (PST)
In-Reply-To: <20101124080705.GF3274@jama>
References: <4CEC1E17.1030208@sensortherm.de>
	<AANLkTinhykFBHcgJR5suXU8Q7op+FOxofExY-d42XmYw@mail.gmail.com>
	<AANLkTimymQB4kxvp-ybAzpUMMxQNy43GZyxKNzmRH3Uw@mail.gmail.com>
	<20101124080705.GF3274@jama>
Date: Wed, 24 Nov 2010 10:18:24 +0100
Message-ID: <AANLkTinv88_9h_1RB8OS5XuqSV2zKBhS2FcxMrpsWh8e@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: I've downloaded oe
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
X-List-Received-Date: Wed, 24 Nov 2010 09:19:38 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/11/24 Martin Jansa <martin.jansa@gmail.com>:
> On Wed, Nov 24, 2010 at 08:52:41AM +0100, Frans Meulenbroeks wrote:
>> What about moving all recipes that do not fetch and also did not fetch
>> during Martins test from last march/april to a directory non-fetching
>> or so?
>
> But those recipes were only those where I wasn't able to find the source
> at all (even with google help and couple of popular premirrors). Any
> origin for source was fine for me, because I was only interested in
> checksum check.
>
>> Apparently these are non fetchable for a long time, with no one
>> apparently building them or having an interest to fix them.
>
> More likely those who were building those before are still building
> OK, because they had it in theirs downloads dir. (but the second part is
> right :/).
>
>> My proposal would be to do that before the release is made, thereby
>> improving the % of the recipes that build.
>
> We can improve it also by putting those missing upstream files to
> sources.openembedded.org and use it as premirror. But first we hav to
> find someone who still have it in downloads dir :/ (I don't).
>
> Removing recipes would need to remove those also from tasks/images and
> in the end release images could miss some important functionaly in worst
> case.

I think most of the non fetching recipes would fall into one of these
categories:
- recipes that are very specific and are not part of a task or image
- recipes that are older versions and that are not used/build

Wrt the remark on missing important functionality:
For a user with a clean slate, the functionality is already missing as
the task/image cannot be build from scratch.

It might be a good idea to do a test trying to build all images for
one distro/machine and see what comes out.
Start with a clean system (empty downloads dir, empty TMPDIR, no
pstaged files etc).
Then bitbake all images. By doing it subsequently without cleaning
TMPDIR inbetween it'll become clear which images do build from scratch
and which don't.

Is someone able/willing to do this test and report the result (suggest
using distro minimal or angstrom or probably shr and machine angstrom)

Frans


