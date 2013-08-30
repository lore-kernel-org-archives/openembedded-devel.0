Return-Path: <net147@gmail.com>
Received: from mail-pa0-f43.google.com (mail-pa0-f43.google.com
	[209.85.220.43])
	by mail.openembedded.org (Postfix) with ESMTP id BD1806BD61
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 10:42:40 +0000 (UTC)
Received: by mail-pa0-f43.google.com with SMTP id hz10so2170291pad.16
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Aug 2013 03:42:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=dhRn1/skizJN7qhPaRCZlK+MBAlYjqCavgKtl7nbRsA=;
	b=VIqNc0Ne+5k2xcVGeJz1OjFzMZySskCDbyBOCj2ekmhD+/QXmd3c6jCcOS0LQ3xMJv
	QEfE8Od34QFTBVJsaG01Yshf0P0TGC7fmoQ6MpVvHw0a38Gur9NaII6txHLL1A2qi64M
	If5fukz2mjhqLA+GVLlAMfJKOivIX7ySGanUstAYdbE+KuJxvuiyE22J6ZCG6SfAt2Km
	1rJjXcqi6o9oOKPxJdb2paW5dIWzVPuUAh/n4XVkH5s30CBpVLIt4Aarxv8eEifJveUZ
	NuTkVn6LkPRa2y6RzjN6hGb/kR744KQtbL3qe6gpe5gn3RasssjWmj63eeZzH6FbfSJB
	fuuA==
X-Received: by 10.66.178.143 with SMTP id cy15mr9908990pac.105.1377859361284; 
	Fri, 30 Aug 2013 03:42:41 -0700 (PDT)
Received: from [192.168.0.2] (60-242-179-244.static.tpgi.com.au.
	[60.242.179.244])
	by mx.google.com with ESMTPSA id xe9sm47022686pab.0.1969.12.31.16.00.00
	(version=TLSv1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Fri, 30 Aug 2013 03:42:40 -0700 (PDT)
Message-ID: <522075F2.7070804@gmail.com>
Date: Fri, 30 Aug 2013 20:37:38 +1000
From: Jonathan Liu <net147@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1377824151-7538-1-git-send-email-net147@gmail.com>
	<20130830090146.GS3544@jama>
In-Reply-To: <20130830090146.GS3544@jama>
Subject: Re: [meta-oe][PATCH] qt-creator: update to 2.8.1
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
X-List-Received-Date: Fri, 30 Aug 2013 10:42:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 30/08/2013 7:01 PM, Martin Jansa wrote:
> On Fri, Aug 30, 2013 at 10:55:51AM +1000, Jonathan Liu wrote:
>> Signed-off-by: Jonathan Liu <net147@gmail.com>
>> ---
>>   .../qt-creator/{qt-creator_2.8.0.bb => qt-creator_2.8.1.bb}           | 4 ++--
>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>   rename meta-oe/recipes-qt/qt-creator/{qt-creator_2.8.0.bb => qt-creator_2.8.1.bb} (87%)
>>
>> diff --git a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
>> similarity index 87%
>> rename from meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
>> rename to meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
>> index a95ad5a..21d5264 100644
>> --- a/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.0.bb
>> +++ b/meta-oe/recipes-qt/qt-creator/qt-creator_2.8.1.bb
>> @@ -7,8 +7,8 @@ LIC_FILES_CHKSUM = "file://LGPL_EXCEPTION.TXT;md5=eb6c371255e1262c55ae9b652a90b5
>>   SECTION = "qt/app"
>>   
>>   SRC_URI = "http://download.qt-project.org/official_releases/qtcreator/2.8/${PV}/${BP}-src.tar.gz"
>> -SRC_URI[md5sum] = "5aacdad4491b7dda9758a81384d8da79"
>> -SRC_URI[sha256sum] = "7ac5d9a36c2f561f74d77378d4eae95a78c7752b323e1df924d6e895e99f45d2"
>> +SRC_URI[md5sum] = "79ef6c6ece0c00035ef744c9d6e3bd3b"
>> +SRC_URI[sha256sum] = "d5ae007a297a4288d0e95fd605edbfb8aee80f6788c7a6cfb9cb297f50c364b9"
> Hi, does it fix build on arm?
I tested for x86 target. I haven't tested on ARM. 
https://codereview.qt-project.org/#change,61264 hasn't been merged yet 
and I don't see any ARM build fixes in the logs between v2.8.0 and 
v2.8.1 so I am guessing compiling for ARM isn't fixed yet.
>
> One issue was missing cpuid.h
> http://lists.openembedded.org/pipermail/openembedded-devel/2013-August/091952.html
>
> and then there were some warning causing build failure with -Werror.
Is -Werror standard or added through a conf option?
>
> If yes, I'll happily replace my patch with this one :).
Regards,
Jonathan

