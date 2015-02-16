Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f54.google.com (mail-yh0-f54.google.com
	[209.85.213.54])
	by mail.openembedded.org (Postfix) with ESMTP id 0AEFB60556
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 13:02:30 +0000 (UTC)
Received: by mail-yh0-f54.google.com with SMTP id z6so13868112yhz.13
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 16 Feb 2015 05:02:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=0lSjEoDWZCfBX+C8oS92qm4skBiIhiBNzz2kZIn9qVg=;
	b=bQo/hcFB9o+/DXvUP9QtaQneax2ct65EBuyOjDhJT/lNo/HN8cN0MajGQLSMRBR3p/
	bvP3vM0ZakhO9A+gehF/F+OOYtXWO2JuX9mhFx5PWBK/nA6R+fK2id/WBcPu2ADeOxFH
	RwKvNj23YxvHehuM6DLR6EVTMzrUQ77gCD7mmuSO+AMWwaWRGkYfQc5abYKvGKbBrr6f
	bo8orFARMhYdmjqYA0QQsk2dMJyZIwjI660bJZtlh9zSoGf/WQDA9MFiXbuwj5srx498
	qAG83cmCjm4bad65lDq48giMvWNmKqAYHDk7BQpc8G1FNNge3YrGUsTOuXiLQy+0a2Zf
	QfAw==
MIME-Version: 1.0
X-Received: by 10.236.44.98 with SMTP id m62mr15798777yhb.136.1424091751761;
	Mon, 16 Feb 2015 05:02:31 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.123.133 with HTTP; Mon, 16 Feb 2015 05:02:31 -0800 (PST)
In-Reply-To: <54E1E839.1000706@pseudoterminal.org>
References: <54DF0A5A.80700@pseudoterminal.org>
	<CAP9ODKpqBjbbSam7+p0cvYKQUwyAsa9tK24DTo+-=uGofJs9cQ@mail.gmail.com>
	<2529087.slZT0YBCqg@peggleto-mobl5.ger.corp.intel.com>
	<CAP9ODKpWO7wbutYpZBwRh-TPoNhGjCPnun_gJ4SnQaDAPjwCAQ@mail.gmail.com>
	<54E1E839.1000706@pseudoterminal.org>
Date: Mon, 16 Feb 2015 11:02:31 -0200
X-Google-Sender-Auth: cFtgTu6Njk2LWrR9f1PwJJNg5Bs
Message-ID: <CAP9ODKr47rHwxzAuzaTs_W=s=j4D5q2iN5x0YqvnkPm7XX6HxA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: Question about RDEPENDS and RRECOMMENDS
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
X-List-Received-Date: Mon, 16 Feb 2015 13:02:34 -0000
Content-Type: text/plain; charset=UTF-8

On Mon, Feb 16, 2015 at 10:53 AM, Carlos Rafael Giani
<dv@pseudoterminal.org> wrote:
> On 02/16/2015 01:42 PM, Otavio Salvador wrote:
>>
>> On Mon, Feb 16, 2015 at 9:12 AM, Paul Eggleton
>> <paul.eggleton@linux.intel.com> wrote:
...
>>> The QA warning message could perhaps be worded more accurately - what it
>>> means
>>> is there in an implicit runtime dependency and there is no RDEPENDS (not
>>> DEPENDS) explicitly telling the system to ensure that that dependency is
>>> satisfied. Whitelisting is never the proper way to fix this warning -
>>> either add
>>> an explicit RDEPENDS, or use configuration to ensure that the implicit
>>> dependency isn't needed.
>>
>>  From my understand, which Carlos can confirm, what he did was adding
>> the package on the rdepends. Once this was done the QA warnings shows
>> up which is wrong.
>>
>> This can be seen at 'sed' recipe:
>>
>> ---
>> SUMMARY = "Stream EDitor (text filtering utility)"
>> ...
>> RDEPENDS_${PN}-ptest += "make locale-base-ru-ru ${PN}"
>> ---
>>
>> In my system, with ptest enabled, I see:
>>
>> WARNING: QA Issue: sed-ptest rdepends on locale-base-ru-ru, but it
>> isn't a build dependency? [build-deps]
>>
>> and this is clearly a false positive as this uses this locale at
>> runtime for a test. Not necessarily it needs to have a DEPENDS on it
>> which would imply it would need to be available in sysroot before sed
>> configure could start.
>>
>> What I think is missing is that the 'build-deps' check would need to
>> whitelist the dependencies which come from a /explict/ package added
>> in a RDEPENDS. What do you think?
>>
>
> Yes, exactly. The current QA warning greatly limits the usefulness of
> RDEPENDS, in my opinion.  If I explicitely add a package name B to RDEPENDS
> in recipe A, and I add A to the IMAGE_INSTALL list, then I am stating that B
> must also be built and installed on the image, but it does *not* have to be
> built before A. Yet, the warnings makes it look as if B has to be built
> before A. This is confusing.
>
> It makes a lot of sense to warn if for example a build script autodetects
> and links against a certain library which is not mentioned in the DEPENDS
> variable. But this is a different use case than the one mentioned above, and
> somehow it seems that both were lumped together.

What seems to be missing is the QA check to verify if B is explicitly
cited in the recipe and in case it should be whitelisted.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

