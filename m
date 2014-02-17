Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f46.google.com (mail-yh0-f46.google.com
	[209.85.213.46])
	by mail.openembedded.org (Postfix) with ESMTP id 3FCFB6E839
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 17:45:26 +0000 (UTC)
Received: by mail-yh0-f46.google.com with SMTP id v1so14306941yhn.19
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 17 Feb 2014 09:45:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=7chc4AaEBAdOSFKjTm71MEqjB7SXqutUtaKDcYovIFA=;
	b=OmU0p2zcMnyu7NDaqc4Ol1WSHZh4KT2hVwBubfa2IgvuNVZuZRmc+I+Wx195bTYnS0
	ZbidsPi8qx2Qy1jKjXsNyf1k8Db6NMclWO635VhCd9ULIeiMuvCkRdmFhLGBiK7t+L1H
	KkXHWIB6/jXmwa16k57y7KszagpCI5wA2tKTkHNvnGNtMfyb0NT+1ND3m72p8SLX2uqS
	0KN/QzMAIpHi2QwPEpBl7+3vhCHAn/7Z0eTH3LzAllBgeaE7zsQxA3qHwatkgfQ0IJhe
	MQRvbUCFajnV0nf+bCTOt/yQbvi/rvKgMsbY//cu5vvlVYFfJfm5qxVL5MthIDHDsebg
	ogGw==
MIME-Version: 1.0
X-Received: by 10.236.121.162 with SMTP id r22mr23956411yhh.47.1392659126779; 
	Mon, 17 Feb 2014 09:45:26 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.217.136 with HTTP; Mon, 17 Feb 2014 09:45:26 -0800 (PST)
In-Reply-To: <20140217173620.GP22890@denix.org>
References: <1392411754-10608-1-git-send-email-otavio@ossystems.com.br>
	<1392411754-10608-2-git-send-email-otavio@ossystems.com.br>
	<20140217173620.GP22890@denix.org>
Date: Mon, 17 Feb 2014 14:45:26 -0300
X-Google-Sender-Auth: z10R8CXR_NiT1fOggXfQW-_ykAw
Message-ID: <CAP9ODKpgFR1uHe97v4zUBThoZfk1wRVdFAq=zzXFy8HNWdqVfA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: Denys Dmytriyenko <denis@denix.org>
Cc: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-qt5][PATCH 2/2] nativesdk-qtbase.inc: Remove unused contents
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
X-List-Received-Date: Mon, 17 Feb 2014 17:45:26 -0000
Content-Type: text/plain; charset=ISO-8859-1

On Mon, Feb 17, 2014 at 2:36 PM, Denys Dmytriyenko <denis@denix.org> wrote:
> On Fri, Feb 14, 2014 at 07:02:34PM -0200, Otavio Salvador wrote:
>> Fixes:
>>
>> ERROR: QA Issue: nativesdk-qtbase: Files/directories were installed but not shipped
>>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib
>>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/include
>>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/share
>>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Test.so
>>   /opt/oel/13.0+snapshot/sysroots/i686-oelsdk-linux/usr/lib/libQt5Network.so
>>   ...
>>
>> Signed-off-by: Otavio Salvador <otavio@ossystems.com.br>
>
> Acked-by: Denys Dmytriyenko <denys@ti.com>

I applied it and found it broke the build afterwards. I fixed this one
(will send the patch in some minutes) but this uncovered another issue
I am working on now.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

