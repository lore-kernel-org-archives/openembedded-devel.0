Return-Path: <armccurdy@gmail.com>
Received: from mail-wm0-f45.google.com (mail-wm0-f45.google.com [74.125.82.45])
	by mail.openembedded.org (Postfix) with ESMTP id 137716FF77
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 20:37:25 +0000 (UTC)
Received: by mail-wm0-f45.google.com with SMTP id l126so146144wml.1
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 18 Dec 2015 12:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=CfcZsvDfquMbCI2W0RV/J9pdjUGRhtNZz72/b5jAFLM=;
	b=x+XCQh3feWWGnHqKsMJd5OdcWOjnBEUxSuK6sOBXAncRJ76piF93SVUMNm0FBG6a25
	Xp22ikwtbVdtBhjzd5DMIQBo0NTtFfacjbLC6DWokJd4umujvfKAaYNVAn2NDo1sGqss
	JMVDeq50VDBn0ELuL0JeHmfl7B0UGSRcPV/CAxrL680K6cXXuXXlCLWGQtcL8W6KWWNF
	Ic4/AV1MZrIZHHVEqDbOq+9Jo4ASHds7xIWWXuiYGS+JS7E/T3VYsWxOOYTwo/kVlm2F
	ZtxMfqZziyZPaz57iIOp8ZJ7fvhXQ63gmCcYktFo65+qJj2FJ7WXICPp74jeHzIpo2hq
	h/oA==
MIME-Version: 1.0
X-Received: by 10.194.200.134 with SMTP id js6mr7092471wjc.114.1450471045857; 
	Fri, 18 Dec 2015 12:37:25 -0800 (PST)
Received: by 10.194.117.68 with HTTP; Fri, 18 Dec 2015 12:37:25 -0800 (PST)
In-Reply-To: <CA+chaQeNBm6xO+YCx3-XTLefXf_OdzU2m=Qe3yxKJS_Ct46Y1A@mail.gmail.com>
References: <1449199316-14048-1-git-send-email-armccurdy@gmail.com>
	<20151218113115.GD2563@jama>
	<CAJ86T=WVuXXzRojbg1yNaJLuTiDVBXecoof1ArQQfJqZqe2vew@mail.gmail.com>
	<CA+chaQeNBm6xO+YCx3-XTLefXf_OdzU2m=Qe3yxKJS_Ct46Y1A@mail.gmail.com>
Date: Fri, 18 Dec 2015 12:37:25 -0800
Message-ID: <CAJ86T=WmVFDtL0G-Zu=QaB0+SaBJC8iLDHNRWhf1aigp62P-EQ@mail.gmail.com>
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
X-List-Received-Date: Fri, 18 Dec 2015 20:37:28 -0000
Content-Type: text/plain; charset=UTF-8

On Fri, Dec 18, 2015 at 11:56 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> Then you can disable that warning with this explanation in comment with
> INSANE_SKIP.

I'll do some experiments first. Based on the discussion in the mpg123
bug report it's not clear that the i586 assembler is any better than
the generic C, so disabling the assembler might be a good solution
anyway.

  http://sourceforge.net/p/mpg123/bugs/168/#677e

> On Fri, Dec 18, 2015 at 8:54 PM, Andre McCurdy <armccurdy@gmail.com> wrote:
>
>> On Fri, Dec 18, 2015 at 3:31 AM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>> > On Thu, Dec 03, 2015 at 07:21:52PM -0800, Andre McCurdy wrote:
>> >> Andre McCurdy (4):
>> >>   mpg123: recipe formatting cleanup, no functional changes
>> >>   mpg123: limit ARM_INSTRUCTION_SET = "arm" over-ride to armv4/armv5
>> >>   mpg123: drop unnecessary dependency on tslib
>> >>   mpg123: update 1.21.0 -> 1.22.4
>> >
>> > Can you please fix:
>> > mpg123-1.22.4: ELF binary
>> >
>> '/tmp/work/i586-oe-linux/mpg123/1.22.4-r0/packages-split/mpg123/usr/lib/libmpg123.so.0.41.2'
>> > has relocations in .text [textrel]
>>
>> Yes, I can take a look. This isn't a regression though - all versions
>> of mpg123 contain x86 assembler which require text relocations and
>> upstream isn't planning to fix them:
>>
>>   http://sourceforge.net/p/mpg123/bugs/168/
>>
>> So the solution will be a new patch which disables assembler
>> optimisations when building for x86.
>>
>> >>
>> >>  .../mpg123/{mpg123_1.21.0.bb => mpg123_1.22.4.bb}  | 47
>> ++++++++++++----------
>> >>  1 file changed, 25 insertions(+), 22 deletions(-)
>> >>  rename meta-multimedia/recipes-multimedia/mpg123/{mpg123_1.21.0.bb =>
>> mpg123_1.22.4.bb} (86%)
>> >>
>> >> --
>> >> 1.9.1
>> >>
>> >> --
>> >> _______________________________________________
>> >> Openembedded-devel mailing list
>> >> Openembedded-devel@lists.openembedded.org
>> >> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> > --
>> > Martin 'JaMa' Jansa     jabber: Martin.Jansa@gmail.com
>> >
>> > --
>> > _______________________________________________
>> > Openembedded-devel mailing list
>> > Openembedded-devel@lists.openembedded.org
>> > http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>> >
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> --
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

