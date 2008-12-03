Received: from [209.85.221.10] (helo=mail-qy0-f10.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1L7xxG-0006nj-Mf
	for openembedded-devel@lists.openembedded.org;
	Wed, 03 Dec 2008 21:04:14 +0100
Received: by qyk3 with SMTP id 3so3057848qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Dec 2008 12:00:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:cc:in-reply-to:mime-version:content-type
	:content-transfer-encoding:content-disposition:references;
	bh=DDcsVjnY3/fUjXp3Mtx+ya6v3AMsUn8a6267RjoM0zY=;
	b=WgEsEPT6/4AdPPfoLoZHaLcWTASMGohKh4BxnytkYDSNvkKSl8wfMLBn++9JqP7uNS
	S5JnEN2+ctI42Z9B33YPnlQ0X1qaQialVm4g07ZV7zBQ/l3WX29Yx+lPhhzStgx0ASMB
	rCG532W0gCz+ozt8IpS6vJs9Vef39X7P93S64=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:cc:in-reply-to:mime-version
	:content-type:content-transfer-encoding:content-disposition
	:references;
	b=iut46YAFwYBNM+F7yw01RDYEIovS7MznLM/oj3Eq58W0IfvpV5fjYdZxsJoCH69Eqe
	WHd6lmWuT1LcLuprmJGB/IuRmGSMNuLieOhl6boqgtcNQi7OTRPMhQVSFpd3UYJLvCVv
	DQ2MvUQcbldwL2IsXM2XpWtuZLJu1SG74qsME=
Received: by 10.214.10.12 with SMTP id 12mr13935526qaj.130.1228334440986;
	Wed, 03 Dec 2008 12:00:40 -0800 (PST)
Received: by 10.215.100.14 with HTTP; Wed, 3 Dec 2008 12:00:40 -0800 (PST)
Message-ID: <c384c5ea0812031200v541ef8f6m696f3d523436ffc2@mail.gmail.com>
Date: Wed, 3 Dec 2008 21:00:40 +0100
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20081203175143.GK16628@smtp.west.cox.net>
MIME-Version: 1.0
References: <c384c5ea0812030846n604eccf0pe47d15f7122f0435@mail.gmail.com>
	<b6ebd0a50812030900r593d6bb0me3a35316907b21ab@mail.gmail.com>
	<20081203175143.GK16628@smtp.west.cox.net>
Cc: openembedded-devel@openembedded.org
Subject: Re: [RFC Wild Ideas Department] create soft-links from <pkg>/<src>/patches/some_local.patch to <oe.git>/packages/<pkg>/files/some_local.patch
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
X-List-Received-Date: Wed, 03 Dec 2008 20:04:15 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hello,

On Wed, Dec 3, 2008 at 6:51 PM, Tom Rini <trini@kernel.crashing.org> wrote:
> On Wed, Dec 03, 2008 at 10:00:13AM -0700, Chris Larson wrote:
>> On Wed, Dec 3, 2008 at 9:46 AM, Leon Woestenberg
>> <leon.woestenberg@gmail.com> wrote:
>>
>> I can see why you want it.   The file:// fetcher copies everything,
>> not just patches, they aren't fetched differently currently.  You
>> could introduce regressions if it were to affect anything but patches,
>> so you'd have to add a special case for uris with patch=1 in the
>> file:// fetcher to link instead of copy, and possibly make it optional
>> via a variable.  I take it you do a lot of patch alterations in the
>> workdir to fix problems?
>
> A lot? No.  But for everyone working from a fixed OE snapshot, this
> would be a nice timesaver.  Heck, soft-linking all of the file URIs
> would be nice here.  Perhaps a variable to control doing it always
> (default to off) ?
>
Exactly what I had in mind, for the reasons mentioned.

I only care about the local patches.

Edit source, quilt refresh, and my checkout has a modified patch.

Regards,
-- 
Leon


