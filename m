Received: from mail-yw0-f47.google.com ([209.85.213.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SIfnV-0008PA-0R
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Apr 2012 14:40:17 +0200
Received: by yhjj56 with SMTP id j56so1593517yhj.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Apr 2012 05:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=qMPriWjVEU996gMqkTRuSsrqne4tG6V/Wqe/3PN5KSs=;
	b=ghG7JHYykyYlx/fVLewIyh/18E2DsaXF+PkpSbgYtgQgrrc9FZ5Jo2cYpqZxL9vor0
	VNggo+qYAv++4ZnpfG4s7D1K8TRs4xg5nNebkBFYEo7xPypfVRACZLhrP6wHBEsvedDx
	DAkSkWekp/1zSDdVSoFBNmjB46FaZ/lgJ/Fkwk2UARrOF8Qha2tcjd1d9yRijUtpIKnb
	Nu8rUJwmgv86oEB+0M+NKHxsKFOBrO/7bbCjLbEYqwhSsFJr3TwVo4yCLg9Sc9JHT/Eu
	sH3RQE5oE7BzvYN0xp+IIqjORaMgLlxSYRV1iJfIyinsTElnN9M+IJUE+I1pDTjz8Hdv
	B0mA==
MIME-Version: 1.0
Received: by 10.50.192.228 with SMTP id hj4mr1299643igc.65.1334320255270; Fri,
	13 Apr 2012 05:30:55 -0700 (PDT)
Received: by 10.231.170.15 with HTTP; Fri, 13 Apr 2012 05:30:55 -0700 (PDT)
In-Reply-To: <4F87F76D.1080804@windriver.com>
References: <CAOHjBZudis3ALttGQZ12hxKPQbXKyffZVtoB1buz4AMaamXO=A@mail.gmail.com>
	<4F87F76D.1080804@windriver.com>
Date: Fri, 13 Apr 2012 14:30:55 +0200
Message-ID: <CAOHjBZvLfGM4xb+Cyz1nbp-J7qEkkf6fApehQPzsdVtV02PFow@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] how to add .bb file into project meta directory
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
X-List-Received-Date: Fri, 13 Apr 2012 12:40:17 -0000
Content-Type: text/plain; charset=ISO-8859-1

Many thanks Robert!!! :)

2012/4/13 Robert Yang <liezhi.yang@windriver.com>

>
>
> On 04/13/2012 05:31 PM, Giuseppe Condorelli wrote:
>
>> Hi All,
>>
>> I need to add a new version for a given package and I'm wondering if (and
>> how) I can add the relative recipe in the meta-<my_project>  directory as
>> well
>>
>
> Yes, the new version's recipe will be used by default, if it doesn't, then
> add this to the .conf file
>
> PREFERRED_VERSION_pkg = "<new_version>"
>
> // Robert
>
>  as I do for .bbappend files.
>>
>> Best Regards,
>> Giuseppe
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

