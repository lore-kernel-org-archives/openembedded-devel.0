Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f50.google.com (mail-wm0-f50.google.com [74.125.82.50])
	by mail.openembedded.org (Postfix) with ESMTP id 54BC46E5CC
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 19:54:09 +0000 (UTC)
Received: by mail-wm0-f50.google.com with SMTP id l126so79130606wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 11:54:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=Ok8OazegMpiweoF0sPgu9ddhZsKLquy9QDApinQLTzg=;
	b=atHgA0Bcd5KfnJYoud9V5RZxEnppQ8SIBPjMer24qq6De+Ge8dFz0o1RvoZSgIXzfr
	Xbu9KFLQeiNiZM57FMOj7wyYQgI0y8kjhuC//4XATTY+fpEuLwzsK4IeG+ZY6ALEXGZg
	D0VuDNk/GDeBfq1j1kqmrWnZhn5+3WtBJl7FNmiovkrIaG7Juxj6lPRT0nX8apjo4Vh6
	EtlJD5saHJkxfQuJGwul04qLqM+sRBG4F4Eyp56idFpIkR4WW99LbcHZ6XXZcfOxeesq
	UUmZC+mxHb7dVkWbi+eyugAFgeATc5houpcnjhZrUVHvYILTY+AQwfoEspGuBgcPb+/P
	3+mw==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr6900983wjc.114.1450468449614; 
	Fri, 18 Dec 2015 11:54:09 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Fri, 18 Dec 2015 11:54:09 -0800 (PST)
In-Reply-To: <20151218113115.GD2563@jama>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
	<20151218113115.GD2563@jama>
Date: Fri, 18 Dec 2015 11:54:09 -0800
Message-ID: <CAJ86T=WVuXXzRojbg1yNaJLuTiDVBXecoof1ArQQfJqZqe2vew@mail.gmail.com>
From: Andre McCurdy <armccurdy@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-multimedia][PATCH 0/4] mpg123 cleanups + update
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 18 Dec 2015 19:54:13 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 3:31 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Dec 03, 2015 at 07:21:52PM -0800, Andre McCurdy wrote:
>> Andre McCurdy (4):
>>   mpg123: recipe formatting cleanup, no functional changes
>>   mpg123: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
>>   mpg123: drop unnecessary dependency on tslib
>>   mpg123: update 1.21.0 -> 1.22.4
>
> Can you please fix:
> mpg123-1.22.4: ELF binary
> '/tmp/work/i586-oe-linux/mpg123/1.22.4-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.41.2'
> has relocations in .text [textrel]

Yes, I can take a look. This isn't a regression though - all versions
of mpg123 contain x86 assembler which require text relocations and
upstream isn't planning to fix them:

  http://sourceforge.net/p/mpg123/bugs/168/

So the solution will be a new patch which disables assembler
optimisations when building for x86.

>>
>>  .../mpg123/{mpg123_1.21.0.bb => mpg123_1.22.4.bb}  | 47 ++++++++++++----------
>>  1 file changed, 25 insertions(+), 22 deletions(-)
>>  rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.21.0.bb => mpg123_1.22.4.bb} (86%)
>>
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
> --
> Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>

