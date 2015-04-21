Return-Path: <sven.ebenfeld@gmail.com>
Received: from mail-wi0-f169.google.com (mail-wi0-f169.google.com
	[209.85.212.169])
	by mail.openembedded.org (Postfix) with ESMTP id 0FAE473D5E
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 21 Apr 2015 06:34:44 +0000 (UTC)
Received: by widdi4 with SMTP id di4so126271621wid.0
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 20 Apr 2015 23:34:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=Kj7NPd34IATmCVex0OKdrwpm6B80ldLbYmdb3xGXc9s=;
	b=ChQmzQzCaS/k2kOFWiksdjzp72Lc05de332Znmy4l33CL1nY4f9RpL6Jc0qdyRZT9O
	AxxCv2BEOyPahuZIfmXa5j8Qo7BvXFAUUtav68qtt/5PKzrPH4PV0l0V4nnmwXC0cPW1
	dtRLM/f5EbIVoGoz6A1JUdRsQd2ZoYaq/NvBF4pSDWGdgnvkrM4vziVRw33ThpGWpikz
	tFpWNK7doH5zUsAmo/CFBQJyTEY4s9OGHnvXlgmxxT6j/Fix3VEsJzpFwhejuL+zEDph
	Q4DNwNE93M7z1j66bMLy9pq37MDHQRd06cT8qh8AtxNJmSiubjaFLwmZTj3u0Cogq4+F
	RcYQ==
X-Received: by 10.180.74.37 with SMTP id q5mr2753994wiv.59.1429598085464;
	Mon, 20 Apr 2015 23:34:45 -0700 (PDT)
Received: from [192.168.50.199] (ip-84-119-99-153.unity-media.net.
	[84.119.99.153])
	by mx.google.com with ESMTPSA id dl2sm18234994wib.2.2015.04.20.23.34.44
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 20 Apr 2015 23:34:44 -0700 (PDT)
Message-ID: <5535EF8A.4070100@gmail.com>
Date: Tue, 21 Apr 2015 08:34:50 +0200
From: Sven Ebenfeld <sven.ebenfeld@gmail.com>
User-Agent: Mozilla/5.0 (Windows NT 6.3; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.6.0
MIME-Version: 1.0
To: Otavio Salvador <otavio@ossystems.com.br>, 
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
References: <1428910057-23647-1-git-send-email-sven.ebenfeld@gmail.com>
	<CAP9ODKoV+SZYEaSEYWL2=8Pz49VrUjaRbMHsAb0-Y8v3H_8+NQ@mail.gmail.com>
In-Reply-To: <CAP9ODKoV+SZYEaSEYWL2=8Pz49VrUjaRbMHsAb0-Y8v3H_8+NQ@mail.gmail.com>
Subject: Re: [meta-java][PATCH v2 0/7] Update OpenJDK7 to IcedTea 2.5.4 und OpenJDK 7u75b13
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
X-List-Received-Date: Tue, 21 Apr 2015 06:34:46 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Hi Otavio,

Am 20.04.2015 um 16:58 schrieb Otavio Salvador:
> Hello Sven,
> 
> On Mon, Apr 13, 2015 at 4:27 AM, Sven Ebenfeld <sven.ebenfeld@gmail.com> wrote:
>> There were some mistakes in my former recipes. This version fixes them.
>> OpenJDK-7 did not depend on krb5 but excluded it in OECONF. Now I changed to
>> depending on krb5 and not excluding it. I've tested building and running it
>> against dizzy and master branches of oe-core, bitbake and meta-openembedded.
>> Built with qemux86 and qemuarm. This release switches the HotSpot-Release to a
>> newer one because of a segfault bug in the ARM Thumb2 JIT.
> 
> Did you see Khem comments about the patchset?
> 

Yes, I saw those comments. I was thinking, that there will come more
comments, so I waited to create a new patchset.

> It would be interesting to get a new version addressing those so we
> can merge it into master branch (currently it is hold in master-next).
> 

If you want to merge it, I will fix the issues and send a new patchset.

