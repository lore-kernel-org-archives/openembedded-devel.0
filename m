Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f41.google.com (mail-yh0-f41.google.com
	[209.85.213.41])
	by mail.openembedded.org (Postfix) with ESMTP id 10DE4605F8
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:47:10 +0000 (UTC)
Received: by mail-yh0-f41.google.com with SMTP id f73so5373827yha.14
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:47:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=OXYetCz3yqjk/ISngrudVawh37Kivz0UK13XrcNufW4=;
	b=p7iAERC+FbCcfHKRmsFzDJLTBkk/zVpoMLBS1V/HtFU7aReGlqs8s50OSTzk2P5agg
	jgDdNtRPLc4o6z3XmEspyQN9UNCJYQGIUpqZxKRQ/VbZ2djlxzA8pcrf4wruEvHlIoAM
	9xYvv0zPoC2tTpVGStNuXcCuC6T9WnUmFwBJG5MVH7GMlwhxiMZg2t25NCKHPu4nFBcj
	v6L1w1Ea2vun15Rll6td6y3ANLyE8YV6vUCyymQYWQB5h20GbE/u0z4fePknSmwu0b9k
	nLzxZmpfnz26MGMiDWpBNWeKTZZHPL5UMfaoy4nXSaDgRQ63j80GgUr8i0nIHhpoNn72
	Uo4w==
MIME-Version: 1.0
X-Received: by 10.236.60.68 with SMTP id t44mr30153380yhc.47.1393256831316;
	Mon, 24 Feb 2014 07:47:11 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Mon, 24 Feb 2014 07:47:11 -0800 (PST)
In-Reply-To: <20140224154437.GH26981@jama>
References: <1392916331-30391-1-git-send-email-denis@denix.org>
	<20140222080505.GK3854@jama>
	<CAP9ODKpHFfexkFfqFvQWZGiXmoZKcigmCJukizYh1hJkGWkgoQ@mail.gmail.com>
	<20140224154437.GH26981@jama>
Date: Mon, 24 Feb 2014 12:47:11 -0300
X-Google-Sender-Auth: dmV_KgZoCIzSB9tnj24hstrV7g8
Message-ID: <CAP9ODKpB=+tBO0=oWLodwKSqcJ5g0fvSaJxPw=EMgm+Et5SX1A@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: Denys Dmytriyenko <denys@ti.com>
Subject: Re: [meta-qt5][PATCHv2] nativesdk-qtbase: do qmake replacement in ${D} instead of ${B}
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
X-List-Received-Date: Mon, 24 Feb 2014 15:47:13 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 24, 2014 at 12:44 PM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Mon, Feb 24, 2014 at 12:18:48PM -0300, Otavio Salvador wrote:
>> Hello Martin,
>>
>> On Sat, Feb 22, 2014 at 5:05 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
>> > On Thu, Feb 20, 2014 at 12:12:11PM -0500, Denys Dmytriyenko wrote:
>> >> From: Denys Dmytriyenko <denys@ti.com>
>> >>
>> >> * This way we don't mangle ${B} and can repeat do_install if necessary. And
>> >>   previously it would require running do_compile again to restore the proper
>> >>   state of ${B}.
>> >> * Need to bump PR, since do_compile isn't changing, but needs to re-run to
>> >>   re-populate qmake-real binary.
>> >>
>> >> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> >> ---
>> >>  recipes-qt/qt5/nativesdk-qtbase.inc | 12 ++++++------
>> >>  1 file changed, 6 insertions(+), 6 deletions(-)
>> >>
>> >> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
>> >> index fa44009..3cb9b0e 100644
>> >> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
>> >> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
>> >> @@ -10,6 +10,8 @@ require nativesdk-qt5.inc
>> >>  # it's already included with newer oe-core, but include it here for dylan
>> >>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
>> >>
>> >> +PR = "r1"
>> >> +
>> >
>> > It's already merged, but please don't add new PRs, especially to .inc
>> > files.
>>
>> As explained by Denys this is really need, in this case.  I agree it
>> could have been put in the bb recipe though.
>
> Sorry I've overlooked it in message.
>
> with rm_work you wouldn't see this issue, but for cost of reexecuting
> do_compile :)
>
>> Denys, could you move this to the bb recipe? This avoids the PR to be
>> kept when we update to newer version.
>
> I can try to remember this and remove it when doing next upgrade to
> 5.2.2.

Yes but I keep rm_work off in my builders to get this kind of failure ;-)

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

