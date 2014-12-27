Return-Path: <akuster808@gmail.com>
Received: from mail-pd0-f172.google.com (mail-pd0-f172.google.com
	[209.85.192.172])
	by mail.openembedded.org (Postfix) with ESMTP id 66B71726A8
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 19:53:05 +0000 (UTC)
Received: by mail-pd0-f172.google.com with SMTP id y13so14701734pdi.31
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 27 Dec 2014 11:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:cc:subject
	:references:in-reply-to:content-type:content-transfer-encoding;
	bh=ENvU7oQcRDadJ8tQnu5zJCUORVg3Lfnwx7195CgqaJc=;
	b=YwzDN2t0RsabhOmUYM2qc/2Z6aMVR050QoanUE+A8DACEa7jmPosX5B67xN42NkEUR
	dWPWZsAY+aLv+wfGQA+TSnswPbmNGtjpBuhWUiLND83YZFI2Ot3lhpfXXc9vr8pcIwHi
	FeTZEOKootGL3svAO7u9eAk8T7DdiXbBT9zi54aDEUyrQWQ+FpsJiumrtw7ifm8CNPtP
	iKQWwgwfyS244kvUg8qUjn3PMJKxkjasX3k6FatowlmqhRlveQlIymIGgRjwo6/wKgsH
	9kVKXrXkT22NeO/ea6Hxkwac+DhSCe6kCZ4jXYbXQTNrh7WYaWTvx0pkd+bGM/ToTRyt
	eZkA==
X-Received: by 10.66.150.74 with SMTP id ug10mr78644269pab.68.1419709986574;
	Sat, 27 Dec 2014 11:53:06 -0800 (PST)
Received: from ?IPv6:2601:c:a700:272f:fc52:df7d:daef:c441?
	([2601:c:a700:272f:fc52:df7d:daef:c441])
	by mx.google.com with ESMTPSA id
	hx9sm31713246pad.38.2014.12.27.11.53.04
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Sat, 27 Dec 2014 11:53:05 -0800 (PST)
Message-ID: <549F0E1E.4080107@gmail.com>
Date: Sat, 27 Dec 2014 11:53:02 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <cover.1419700394.git.akuster808@gmail.com>	<8769665d9efb22405435d730c01c1a41d7251b29.1419700394.git.akuster808@gmail.com>
	<20141227174513.GH2465@jama>
In-Reply-To: <20141227174513.GH2465@jama>
Cc: otavio@ossystems.com.br
Subject: Re: [PATCH 27/27] xf86-video-glamo: fix build with xserver 1.16
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
X-List-Received-Date: Sat, 27 Dec 2014 19:53:06 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/27/2014 09:45 AM, Martin Jansa wrote:
> On Sat, Dec 27, 2014 at 09:22:14AM -0800, Armin Kuster wrote:
>> From: Martin Jansa <Martin.Jansa@gmail.com>
>
> This shoudn't be needed in dizzy which has old enough xserver.

Thanks I will drop it.

- armin
>
>> Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   ...-glamo.h-use-const-for-jbt6k74_state_path.patch | 29 ++++++++++++++++++++++
>>   .../xorg-driver/xf86-video-glamo_git.bb            |  1 +
>>   2 files changed, 30 insertions(+)
>>   create mode 100644 meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch
>>
>> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch
>> new file mode 100644
>> index 0000000..a820371
>> --- /dev/null
>> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo/0004-glamo.h-use-const-for-jbt6k74_state_path.patch
>> @@ -0,0 +1,29 @@
>> +From 180a00634f351a09ceabc5695d8e1acc3e585501 Mon Sep 17 00:00:00 2001
>> +From: Martin Jansa <Martin.Jansa@gmail.com>
>> +Date: Fri, 12 Dec 2014 12:00:10 +0100
>> +Subject: [PATCH] glamo.h: use const for jbt6k74_state_path
>> +
>> +* fix build issue with xserver 1.16:
>> +  glamo-driver.c:501:32: error: assignment discards 'const' qualifier from pointer target type [-Werror]
>> +
>> +Signed-off-by: Martin Jansa <Martin.Jansa@gmail.com>
>> +---
>> + src/glamo.h | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/src/glamo.h b/src/glamo.h
>> +index 5fd5c04..5e072be 100644
>> +--- a/src/glamo.h
>> ++++ b/src/glamo.h
>> +@@ -148,7 +148,7 @@ typedef struct {
>> + #endif
>> +
>> + #ifdef JBT6K74_SET_STATE
>> +-    char *jbt6k74_state_path;
>> ++    const char *jbt6k74_state_path;
>> +     char saved_jbt6k74_state[14];
>> + #endif
>> +
>> +--
>> +2.1.3
>> +
>> diff --git a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
>> index 38c12f3..78c6564 100644
>> --- a/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
>> +++ b/meta-oe/recipes-graphics/xorg-driver/xf86-video-glamo_git.bb
>> @@ -14,6 +14,7 @@ SRC_URI = "git://git.openmoko.org/git/xf86-video-glamo.git;branch=master \
>>              file://0001-fix-build-with-KMS-disabled.patch \
>>              file://0003-glamo-driver-adapt-to-xserver-0.13-video-API.patch \
>>              file://0001-glamo-driver-remove-references-to-mibstore.patch \
>> +           file://0004-glamo.h-use-const-for-jbt6k74_state_path.patch \
>>   "
>>
>>   S = "${WORKDIR}/git"
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>
>
>

