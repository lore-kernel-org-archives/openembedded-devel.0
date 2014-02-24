Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id F07706121F
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 15:18:48 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id t59so5326527yho.38
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Feb 2014 07:18:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=gPxOTOer3g0C89otAnSm7Cv1hknA3KoPaQFgyjpLh8c=;
	b=nz/P6oEKqDroYnguuRaBXmT8o1Tg0k6+LJaiT/cZG4FV79ga1TOQ/5fnWsHHFYF3zM
	NRtg9vCqWAVzYDmnEEF4KucNiA8T+egsC+Lin1Jxz5iSIVJdSoF7iJTTQibX5VhvuJk+
	1wYnqkluO/rba71CwAFFgObIEyufDLCeYh4u3hA4bQwcto0+8Bk8vcPFDNygcB7Id8iD
	1iuChtt4Bgd6+xgoUJv1SYTBDhczijO/AGGC1CuaGiSAsKBCjyz4t657njRCzlv5xpQI
	WFgcNaOzs8CPTh8sBAPK9nxLxwePecrYS7EQ1ug6x5GxH0d61Ho5vU/OsDNfa5zq1Ocf
	fmTw==
MIME-Version: 1.0
X-Received: by 10.236.130.80 with SMTP id j56mr1457677yhi.155.1393255128876;
	Mon, 24 Feb 2014 07:18:48 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Mon, 24 Feb 2014 07:18:48 -0800 (PST)
In-Reply-To: <20140222080505.GK3854@jama>
References: <1392916331-30391-1-git-send-email-denis@denix.org>
	<20140222080505.GK3854@jama>
Date: Mon, 24 Feb 2014 12:18:48 -0300
X-Google-Sender-Auth: MmJsFCGR8LlzHxbrnviR0LGUZs0
Message-ID: <CAP9ODKpHFfexkFfqFvQWZGiXmoZKcigmCJukizYh1hJkGWkgoQ@mail.gmail.com>
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
X-List-Received-Date: Mon, 24 Feb 2014 15:18:49 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello Martin,

On Sat, Feb 22, 2014 at 5:05 AM, Martin Jansa <martin.jansa@gmail.com> wrote:
> On Thu, Feb 20, 2014 at 12:12:11PM -0500, Denys Dmytriyenko wrote:
>> From: Denys Dmytriyenko <denys@ti.com>
>>
>> * This way we don't mangle ${B} and can repeat do_install if necessary. And
>>   previously it would require running do_compile again to restore the proper
>>   state of ${B}.
>> * Need to bump PR, since do_compile isn't changing, but needs to re-run to
>>   re-populate qmake-real binary.
>>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>> ---
>>  recipes-qt/qt5/nativesdk-qtbase.inc | 12 ++++++------
>>  1 file changed, 6 insertions(+), 6 deletions(-)
>>
>> diff --git a/recipes-qt/qt5/nativesdk-qtbase.inc b/recipes-qt/qt5/nativesdk-qtbase.inc
>> index fa44009..3cb9b0e 100644
>> --- a/recipes-qt/qt5/nativesdk-qtbase.inc
>> +++ b/recipes-qt/qt5/nativesdk-qtbase.inc
>> @@ -10,6 +10,8 @@ require nativesdk-qt5.inc
>>  # it's already included with newer oe-core, but include it here for dylan
>>  FILESEXTRAPATHS =. "${FILE_DIRNAME}/qtbase:"
>>
>> +PR = "r1"
>> +
>
> It's already merged, but please don't add new PRs, especially to .inc
> files.

As explained by Denys this is really need, in this case.  I agree it
could have been put in the bb recipe though.

Denys, could you move this to the bb recipe? This avoids the PR to be
kept when we update to newer version.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

