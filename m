Received: from mail-ve0-f175.google.com ([209.85.128.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ross.burton@intel.com>) id 1UeSKI-0007Y3-CB
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 May 2013 17:49:06 +0200
Received: by mail-ve0-f175.google.com with SMTP id cz11so5677445veb.20
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 May 2013 08:30:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=x-received:mime-version:in-reply-to:references:from:date:message-id
	:subject:to:cc:content-type:x-gm-message-state;
	bh=KBw0yWtqfzt8tAu5M/YixGwlbt4jIN7YhVZaZemZDAI=;
	b=D2YQWSePAZvkzRcNMlTf7lRJscP38M4dclQrmW9yJZjmPSgZ9HH0B4m08tdokmUDpT
	4+PtKUXbxmZfR37im+zAkffbyd7n2l6E/atCzUbXW+2naauvW6QDBad1vMjfeCRq1xXA
	VtiQVkO4XZ+cixziRdIXJzYxdVIW/Lp03G7/Y9wct8y3rerv3l+ceu7lPnCc0/rQu2Gp
	1urVRx6G3jk2l3N7ei4jU6kH3zaQ4OeOhpD+u6wvle0m9P50/KG5HuCEXBQ8JCbV1uKI
	Ni3T91PwWakU3gIYVtBJXddIJB00jaMaKuAjkD7wkLyPx81JyVv/cOPIt+F88nSvR/h9
	zf/A==
X-Received: by 10.52.165.99 with SMTP id yx3mr28740738vdb.34.1369063821722;
	Mon, 20 May 2013 08:30:21 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.220.98.7 with HTTP; Mon, 20 May 2013 08:30:01 -0700 (PDT)
In-Reply-To: <CAMKF1sre8J9DyME66wKjvoEVB9pqQ4TEjpUQZeaLae6kh+KuRw@mail.gmail.com>
References: <1368895167-6841-1-git-send-email-raj.khem@gmail.com>
	<CAJTo0LYDp-wfrSqkswLdj32keLtyV62oCZm5cuX4QXtUGyEG1A@mail.gmail.com>
	<CAMKF1sre8J9DyME66wKjvoEVB9pqQ4TEjpUQZeaLae6kh+KuRw@mail.gmail.com>
From: "Burton, Ross" <ross.burton@intel.com>
Date: Mon, 20 May 2013 16:30:01 +0100
Message-ID: <CAJTo0LZrgjBH4m=mp2rdN-PYowynu0_vqQ0HJ7RL5GFQMEo+Qw@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Gm-Message-State: ALoCoQlqz1uwTNXrtRVWmSJlsPfJscyiGuttiPhO4AF0pMb9sVz3+gxWZ3AIQVMJngMG30cOk1TY
Cc: =?UTF-8?B?RXJpYyBCw6luYXJk?= <eric@eukrea.com>,
	Otavio Salvador <otavio@ossystems.com.br>
Subject: Re: [meta-browser][PATCH] libxi: Match the bbappend to OE-Core
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.11
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Mon, 20 May 2013 15:49:25 -0000
Content-Type: text/plain; charset=UTF-8

On 20 May 2013 16:25, Khem Raj <raj.khem@gmail.com> wrote:
> On Mon, May 20, 2013 at 2:18 AM, Burton, Ross <ross.burton@intel.com> wrote:
>> On 18 May 2013 17:39, Khem Raj <raj.khem@gmail.com> wrote:
>>> +BBCLASSEXTEND += "native"
>>
>> Why don't you submit a patch to oe-core's libxi, or even
>> xorg-lib-common.inc, to add this?
>
> yeah that should be in OE-Core.

I also noticed that it's only used by one of the three chrome recipes,
so is it even needed at all?

Ross


