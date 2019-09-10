Return-Path: <prvs=149650af6=Richard.Leitner@skidata.com>
Received: from mail2.skidata.com (mail2.skidata.com [91.230.2.91])
	by mail.openembedded.org (Postfix) with ESMTP id 95C7D7BD9A
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 10 Sep 2019 06:06:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
	d=skidata.com; i=@skidata.com; q=dns/txt; s=selector1;
	t=1568095592; x=1599631592;
	h=subject:to:references:from:message-id:date:mime-version:
	in-reply-to:content-transfer-encoding;
	bh=OyGqXQL8mMVY0dIEcGGbVJJWEapT8AyKzNns96ZTjeg=;
	b=PllDt9Fgc2sM+3oNLuyQVJYV0lERBBYHWQlOILtswkLfGPOBOl0bL+6w
	8USzzYCO7JjRsibmNYPZxQxshZqm3E10XB5+i/eCA9esWgF0f/1uCv1XB
	33lrb56YnKC9sLP9XKQZnEN4xPsMRuB2y7dEASqrILRuuP+lma19yJPOZ
	XmtuL0WtYCZP4jcyJzvs1RCsGOgWaBy2ngb9FC1HEpXCNWr4i5Dy8jaZd
	TuXR0kMD7tkyt99v8++OsQX6dPtkdbFJkThQK2IWurdZF9bF57o6ogUzl
	dYG2EBnP1fAcveBKervSHYWAveyQUcBndXQkmyXKsWefs2SlVKLT3BAUe Q==;
IronPort-SDR: pmfwodSCZ9wztGBLHTTZRukuBhq9aV7PUcWeAPbEGCbvW0UBs7oWtKWccNUF3GaTun98ugWe8/
	g5NRTgu2h+ucS09Gw0cTD8s26dX87vGKrZy1NuYisOKui6ZT1cTa1rdortnhJP0zhrzL5RVMZD
	BYXNjEdrCvJ+Iichb6noCn5TIAgKCaANhLjFqz+vXExptjnrdCh7FvJJ1xdrC6hy0FPnnszuJe
	r5gvylrjj83rototE1gQ09bMqWuCm6gxjmWfTirDJzwKYXyR/iKdR2bj7sn1pm42UMjoPIBc/Q
	/GM=
X-IronPort-AV: E=Sophos;i="5.64,487,1559512800"; 
   d="scan'208";a="2325145"
To: <openembedded-devel@lists.openembedded.org>
References: <b6f2c586-cb29-5015-ec35-ab2c7dcf8d4d@amotus.ca>
	<20190909205704.GA14642@localhost>
From: Richard Leitner <richard.leitner@skidata.com>
Message-ID: <6454a666-ebbe-ab60-533d-b60ffb927682@skidata.com>
Date: Tue, 10 Sep 2019 08:06:31 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <20190909205704.GA14642@localhost>
X-Originating-IP: [192.168.111.252]
X-ClientProxiedBy: sdex4srv.skidata.net (192.168.111.82) To
	sdex5srv.skidata.net (192.168.111.83)
Subject: Re: Support for OpenJDK 9+
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
X-List-Received-Date: Tue, 10 Sep 2019 06:06:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit


On 09/09/2019 22:57, Adrian Bunk wrote:
> On Mon, Sep 09, 2019 at 07:52:16PM +0000, Mathieu Alexandre-Tétreault wrote:
>> Howdy,
>>
>> We recently got a request to add support for Java(OpenJdk) 9+.
>> I came to wonder if there was any limitations preventing the use of
>> Openjdk 9+ on arm?

None that I'm aware of...

>>
>> Any advise will be appreciated.
> 
> Debian stable ships OpenJDK 11 on three different arm architectures.

Additionally please take in mind the end-of-support of the OpenJDK 
releases to make sure you put the effort in a long maintained version if 
possible.

Furthermore you may also take advantages of synergies with adoptopenjdk.net?

regards;Richard.L

