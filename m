Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wg0-f44.google.com (mail-wg0-f44.google.com [74.125.82.44])
	by mail.openembedded.org (Postfix) with ESMTP id 4CBDA736B6
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Apr 2015 20:02:41 +0000 (UTC)
Received: by wgoe14 with SMTP id e14so64741755wgo.0
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 01 Apr 2015 13:02:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=1Vxsy/dSSiL9uJE5jEo69oPV1jd220GUHTcurmyG1cI=;
	b=pKaQUPjWmFQ+y4nq3IPtNIHcjRT/ccoEtMbMoMgQ7CTI+wpNau5uu7z6HhmAzUnrKT
	CHpbmHLFJVIICDgqw5bdNFQvdTEwocpxXxvNVxJiPM72eOmE8JaJN/zS113wC1hwLhG7
	aLPzSSRFymoWJGRBFDMVQxf3Iuf5dLWsWk87q8HdBFzJACTTlfnJXQnJ6m1LqJ742hbr
	Fy/Ui0G+4VbUyO9Aks/31mR1CgMY4bSWxpQlVILA1XTgkcq2mopY6bteg24SaodFBEay
	p2KDanNempoaDtKYgIq3/VvDUN+2yVARnnHhwhFIkrX6RTRnJrvD5O6LNPs7McYpdWKF
	aduQ==
X-Received: by 10.194.210.103 with SMTP id mt7mr88529142wjc.103.1427918559389; 
	Wed, 01 Apr 2015 13:02:39 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id m4sm4113725wjb.25.2015.04.01.13.02.38
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 01 Apr 2015 13:02:38 -0700 (PDT)
Message-ID: <551C4EE6.5080507@gmail.com>
Date: Wed, 01 Apr 2015 22:02:46 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org, 
	Otavio Salvador <otavio@ossystems.com.br>
References: <CAD0=qkK3-x3CXStZkOVqOwfZioaLq+A9XwXehVT+HdLRzGPanw@mail.gmail.com>
	<CAP9ODKoR5VYhDGVgoj8HLzXwc6H4mAGfBh64bFx5drLE9W+pSg@mail.gmail.com>
In-Reply-To: <CAP9ODKoR5VYhDGVgoj8HLzXwc6H4mAGfBh64bFx5drLE9W+pSg@mail.gmail.com>
Subject: Re: [meta-java] Trying to update openjdk-7 to icedtea 2.5.4 and jdk75b13
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
X-List-Received-Date: Wed, 01 Apr 2015 20:02:47 -0000
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit

Hello Otavio,

Am 01.04.2015 um 17:25 schrieb Otavio Salvador:
> Hello Sven,
> 
> On Wed, Apr 1, 2015 at 12:19 PM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
>> I'm currently trying to update openjdk-7 to the current icedtea-release.
>> I'm getting as far as to the compile step which fails during a run of rmic.
>> In difference to earlier builds, it tries to run the just compiled
>> rmic java-classes.
> 
> Thanks a lot for doing this, this is indeed an important change to be
> done ... also due security reasons.
> 
>> The bootstrap jdk6 complains about incompatible class version.
>> "Exception in thread "main" java.lang.UnsupportedClassVersionError:
>> sun/rmi/rmic/Main : Unsupported major.minor version 51.0"
>>
>> That is correct as the build process compiles these classes with
>> "-source 7" and "-target 7".
>> Currently I don't really know how to fix this problem. Atm I guess I
>> would need to add a jdk6 bootstrap version of rmic. Can anyone give me
>> a hint how to fix this problem?
> 
> Yes, you likely needs a rmic-native variant.

Do you think it makes sense to create a new rmic-native recipe or should
it be created within the recipe?

> 
> I am very busy now and won't have bandwidth to help on this, am sorry.
> 
> One side note though ... you might want, before, clean old versions of
> the recipe and rework it so in the process you gain more intimacy of
> the build process ... and helps to provide a nicer base of work as
> well.
> 

You're right, I will see, how I get used to this process.

--
Cheers,
Sven

