Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f172.google.com (mail-yk0-f172.google.com
	[209.85.160.172])
	by mail.openembedded.org (Postfix) with ESMTP id DBC56606D4
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 20:23:22 +0000 (UTC)
Received: by mail-yk0-f172.google.com with SMTP id 200so2867454ykr.17
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 20 Apr 2014 13:23:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:content-type;
	bh=PENkTWpZuXYWuoLjTtxFUlQE0UjQp/8vr53DLuK0BiI=;
	b=aLKvGeoguGNXogSt1hxC3DCjGZiGL8XdhLWoc886+bllUNT993qEpTeJDdIs1Z0lI/
	8anloDIvSORMefJYNmNDlVDUpsz7mb2aiECFD/vmseOwFvCRexASOFff6Rw5lqfYoRCg
	PEyVNoaV+4SP0damKtSSM/Nl+nL8uMlSoZdbGwR4lRtWs2QhuNA8reZYr7/bYVLHvFUI
	4K4fBziUl50tZgSMEzo0OQLrq4EBVo/c2h20RnEisquxApaT/zSj508KVtrONOGvu1yh
	kFHmT2U+KrIXPGvfiECM3BpaPA8XRWBAhCy2exiHNEUke5qkq+3T7Lgk5EXM6IcEDXKt
	Wa+g==
MIME-Version: 1.0
X-Received: by 10.236.199.212 with SMTP id x60mr135388yhn.90.1398025402925;
	Sun, 20 Apr 2014 13:23:22 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.124.72 with HTTP; Sun, 20 Apr 2014 13:23:22 -0700 (PDT)
In-Reply-To: <CAPbeDCn+wU_rCnmenVegyK_A4heeVRWOG_qU9j78z32TQ8by6w@mail.gmail.com>
References: <1397581965-24301-1-git-send-email-jacob.kroon@mikrodidakt.se>
	<20140420103441.GL2486@jama>
	<CAPbeDCn+wU_rCnmenVegyK_A4heeVRWOG_qU9j78z32TQ8by6w@mail.gmail.com>
Date: Sun, 20 Apr 2014 17:23:22 -0300
X-Google-Sender-Auth: SWoXrILv9kmJNyz_x17PzWCRDTM
Message-ID: <CAP9ODKoYBArpTXtnr3dEP7O=pKKERM0in_kBYDQ=RNV7R0p6mg@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH] populate_sdk_qt5.bbclass: Fix PACKAGE_GROUP deprecation warning
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
X-List-Received-Date: Sun, 20 Apr 2014 20:23:23 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Apr 20, 2014 at 10:54 AM, Jacob Kroon <jacob.kroon@gmail.com> wrote:
> Hi Martin,
>
> On Sun, Apr 20, 2014 at 12:34 PM, Martin Jansa <martin.jansa@gmail.com>wrote:
>
>> On Tue, Apr 15, 2014 at 07:12:45PM +0200, Jacob Kroon wrote:
>> > Fixes the following warning:
>> >
>> > WARNING: PACKAGE_GROUP is deprecated, please use FEATURE_PACKAGES instead
>>
>> It's correct patch, but I'm a bit tempted to take this patch after
>> branching daisy, because some people are using latest meta-qt5 with
>> older oe-core releases and this undoing this change is easy to miss
>> (unlike e.g. cmake .bbappends which fail when not updated for correct
>> oe-core releases).
>>
>> What do you think?
>>
>>
> I think I follow you. So the deprecation happened in commit
> d703e07ea5056624101e1bc48f10d25b602635e9, 2014-03-07, so I guess only
> daisy/master will give the warning. For older oe-core releases with
> meta-qt5 master, this patch could silently break stuff I can imagine. So
> like you propose, keeping this one for master only, after branching daisy,
> seems like a good idea to me.

I prefer to drop the warning in daisy. It is always bad to have
warnings during the build and we ought to have it clean. As I said,
this will indeed break people but not many people are using this class
as this is quite new.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

