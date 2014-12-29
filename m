Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yh0-f51.google.com (mail-yh0-f51.google.com
	[209.85.213.51])
	by mail.openembedded.org (Postfix) with ESMTP id 66D2A7264B
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 12:08:03 +0000 (UTC)
Received: by mail-yh0-f51.google.com with SMTP id a41so6462734yho.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 29 Dec 2014 04:08:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:in-reply-to:references:date:message-id:subject
	:from:to:cc:content-type;
	bh=Q+RZcAF9cCW3a/aVKabw1lfNLvm9U/ri36M8ZFjohck=;
	b=oA+MNv0Lb41DeChViMBk59ZbxIpBx2fw8DhsNIoOV3je1cDm9U5tPOqDUUiK7hbywX
	HtxzbTcee/4tIgiCfYmlWkWgVZVJWtgofrYLf26EDnMEzOsbphrUF1vh5x5K2o4DC9cM
	OKS50GO9G7o6DxhWAvw11CAuePLOFrAZ01d3IBjxnw/XMvAJbIAes2ZO6zqqK8uu0l7E
	GqaUsr6CaIghqniUUBz3sHlDjF1BzrczEvXgOv8alwYKxcegPHNYX3VGu7Q+x1WtPwAQ
	YEwSlyjiB2xwDSgcBPSytUB8BdpwDPk5NpCUaoVPv3Lx3SJspxt1vv+7G2CaWogui+nr
	uDBw==
MIME-Version: 1.0
X-Received: by 10.236.39.134 with SMTP id d6mr15708336yhb.90.1419854884202;
	Mon, 29 Dec 2014 04:08:04 -0800 (PST)
Sender: otavio.salvador@gmail.com
Received: by 10.170.171.132 with HTTP; Mon, 29 Dec 2014 04:08:04 -0800 (PST)
In-Reply-To: <2843303.CPYcjsZDpv@peggleto-mobl5.ger.corp.intel.com>
References: <1859515.Hd60QW1tn7@peggleto-mobl5.ger.corp.intel.com>
	<6010322.On4bLv5MV8@peggleto-mobl5.ger.corp.intel.com>
	<2843303.CPYcjsZDpv@peggleto-mobl5.ger.corp.intel.com>
Date: Mon, 29 Dec 2014 10:08:04 -0200
X-Google-Sender-Auth: Jmq-3Qr8_xeILZyH9qHstA0ntGE
Message-ID: <CAP9ODKosAV7tt_PV30EJanVMAdu=1hV8TZpV+GLCMALqz9Da9g@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Cc: yocto <yocto@yoctoproject.org>
Subject: Re: [yocto] meta-java layer maintainership
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
X-List-Received-Date: Mon, 29 Dec 2014 12:08:05 -0000
Content-Type: text/plain; charset=UTF-8

On Sun, Dec 28, 2014 at 10:31 AM, Paul Eggleton
<paul.eggleton@linux.intel.com> wrote:
> On Monday 01 December 2014 11:57:10 Paul Eggleton wrote:
>> On Monday 01 December 2014 10:16:24 Paul Eggleton wrote:
>> > Henning would like some folks to help him maintain the meta-java layer,
>> > which contains OpenJDK and other open source Java-related components.
>> >
>> > An ideal candidate maintainer would:
>> >  * Have an interest in maintaining the Java-related recipes in the layer
>> >  * Be willing to review and merge patches from the community
>> >
>> > If you'd like to help out here (and responsibility can be shared by more
>> > than one person, it doesn't just have to be one) then please reply here or
>> > in private and I'll arrange for you to get access to the repository.
>>
>> Looks like we now have enough people to take care of this, thanks everyone!
>
> I'm not sure if this ever got announced, but we now have the following
> maintainers for meta-java:
>
>   Henning Heinold <henning@itconsulting-heinold.de>
>   Mario Domenech Goulart <mario@ossystems.com.br>
>   Maxin John <maxin.john@enea.com>
>   Otavio Salvador <otavio@ossystems.com.br>
>
> At the same time, the layer has also been moved to the following location:
>
>   http://git.yoctoproject.org/cgit/cgit.cgi/meta-java/
>
> I've just updated the OE layer index accordingly. Please update your local
> clones using something similar to the following command:
>
>   git remote set-url origin git://git.yoctoproject.org/meta-java

It'd be great if Henning could contact Github and as for a mirror to
be set, in previous location. This allows for old repository to be
kept in sync with this new one.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

