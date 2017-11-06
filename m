Return-Path: <akuster808@gmail.com>
Received: from mail-pg0-f67.google.com (mail-pg0-f67.google.com [74.125.83.67])
	by mail.openembedded.org (Postfix) with ESMTP id 2EA0578435;
	Mon,  6 Nov 2017 18:14:28 +0000 (UTC)
Received: by mail-pg0-f67.google.com with SMTP id l24so8836060pgu.11;
	Mon, 06 Nov 2017 10:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=subject:to:cc:references:from:message-id:date:user-agent
	:mime-version:in-reply-to:content-language;
	bh=GkTKOfz11p/iY/JQCDgtV/j+9V8w8lvD/U7kH3JADr0=;
	b=ZUf5emTo4bhzorO54X7SyUH/gpzcC0NV9Xxjlp5evKqt5hYv+YX4iVoq7NkeWvqFRn
	a6DjSjTul63EjQvRZNp6XA0yh69lzJoOtHqVs63NwRcnYTQZJ8pmjrzO1oGM2jTTqFSV
	nhpOaaRYIpNhy/rRTvDkqCWAVgVb6IwMX0yEjsiFnzr1oGnxwHXXDBimDueL33GVHDLw
	RJ3C6fen0AzHnz2J/QrMMg+zqQH5UeVWwwe93NWWlNYXF0a8EaF92fisYJNHnmSw8ZIq
	OjJJe8et9wMNI5tMKV8qgOSrhjcsItFX8IzKZytK2wn3WbbdsQu0nHKKcNAm41+Z8bKl
	/S/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:subject:to:cc:references:from:message-id:date
	:user-agent:mime-version:in-reply-to:content-language;
	bh=GkTKOfz11p/iY/JQCDgtV/j+9V8w8lvD/U7kH3JADr0=;
	b=ZoMtuhF64lCEBWzeKatJb1kCGLPKGKOHNnsUYZXECNwTpfPzp2lDUqMirLvOBJHusn
	WKioFxAu7Wpphwt4FEhxxWNK0/k510PPc+X7PUhM34IffQhyqniW+WjaUDaZY/own6vp
	BRcfPnbr2JtNsh80/Z+h+U4ggRQeXmHpGbefiKDLNJDujImDen36WsYlQ90k/LIci4O4
	fxlkEch04eGYwephoXMWcpWhj793AHiVU6rJeZI2brXum0rDS1ukP4LNXY9GHWSU9v40
	yxOj+M8mY58qhLaiaJXkK1Dx+fIbqP1sFwehWhp1NXL8bGRFBaf/jFrAaTgvylFA2i9D
	eGPA==
X-Gm-Message-State: AMCzsaXO8iXhrGIuWMNGDIEUUWGJ7rT1nL8vwabLhD67S1J14uOhaK+R
	4IbapeQNihMCE1AQodBB9+cN4Q==
X-Google-Smtp-Source: ABhQp+QVH8lWtkkCCzbeEg/LD1RHOv8nT5p8IFcg4DgXtQYY3otyUjt6/qJG5I2zkVHmPCgo8/z0gg==
X-Received: by 10.84.168.69 with SMTP id e63mr15265703plb.193.1509992070231;
	Mon, 06 Nov 2017 10:14:30 -0800 (PST)
Received: from ?IPv6:2601:202:4001:9ea0:687e:6787:a054:61f8?
	([2601:202:4001:9ea0:687e:6787:a054:61f8])
	by smtp.gmail.com with ESMTPSA id
	b19sm25870757pfd.182.2017.11.06.10.14.29
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 06 Nov 2017 10:14:29 -0800 (PST)
To: Denys Dmytriyenko <denis@denix.org>, akuster808 <akuster808@gmail.com>
References: <8075716d-066a-ec38-3787-fd64bb9c61d5@gmail.com>
	<20171106164345.GQ9221@denix.org>
From: akuster808 <akuster808@gmail.com>
Message-ID: <18f73e9e-6c8f-2c36-f9fc-6d6e53ef179d@gmail.com>
Date: Mon, 6 Nov 2017 10:14:27 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
	Thunderbird/52.4.0
MIME-Version: 1.0
In-Reply-To: <20171106164345.GQ9221@denix.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.12
Cc: "yocto@yoctoproject.org" <yocto@yoctoproject.org>,
	openembedded-architecture
	<openembedded-architecture@lists.openembedded.org>,
	OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: Re: [yocto] [Openembedded-architecture] [RFC] stable branch naming scheme
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
X-List-Received-Date: Mon, 06 Nov 2017 18:14:29 -0000
Content-Language: en-US
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable



On 11/06/2017 08:43 AM, Denys Dmytriyenko wrote:
> On Fri, Nov 03, 2017 at 09:20:43AM -0700, akuster808 wrote:
>> Hello,
>>
>> The problem I hope to solve is that a Maintainer can stage changes in
>> any branch in the contrib repos making it difficult for folks to track=

>> their back port requests. The also makes it harder to automate any kin=
d
>> of build automation.
>>
>> I would like to propose a contrib naming scheme for the stable release=

>> branches. I am thinking of the following:
>>
>> stable/{version}-next or {special char}_stable/{version}-next.
>>
>> =C2=A0=C2=A0 "version" is either the code name or numeric like in bitb=
ake.
>>
>> =C2=A0=C2=A0 "special char" would be used to have these branches at th=
e top of th
>> list, if we wont that.
> I like this branch unification!
>
> I know we discussed this at OEDEM and there was some convenience reason=
 given,=20
> but can we also standardize on the tree? I.e. openembedded-core-contrib=
 vs.=20
> poky-contrib?

The current Poky maintenance process talks about deconstructing
"stable-next":
https://wiki.yoctoproject.org/wiki/Stable_branch_maintenance#Stable_branc=
h_maintainers
=C2=A0
# Split out any bitbake changes and send them to the bitbake-devel mailin=
g
list (marking them with the appropriate stable version in the subject
line e.g. [1.20])
# Split out OE-Core changes and create an openembedded-core-contrib branc=
h
containing them; send the cover letter only (marking it as such in the
subject) to the openembedded-core mailing list.
The above has been happening via=C2=A0 a script Richard runs.=C2=A0 I per=
sonally
think it the workflow should be for OE -> Yocto. This does add more work
for the maintainer but is cleaner.=C2=A0 I did ask Richard to create
bitbake-contrib for this purpose but am lazy as he uses his script ; )

The reason I choose "stable/" branching is that the "-next" branches are
out of sync and not being used correctly or not defined on their
purpose. another subject for another time.

- armin

>
>> We can apply this to all OE / Yocto repos that have stable branch
>> maintenance process.
>>
>> If we standardize on a naming scheme, We can then document this so
>> contributers can monitor their requests more easily. The community can=

>> see what changes are being backport.=C2=A0 This will enable the possib=
ility
>> to automate builds, etc.=C2=A0
>>
>> let me know what you think.
>>
>> Kind regards,
>>
>> Armin
>>
>>
>>
>> _______________________________________________
>> Openembedded-architecture mailing list
>> Openembedded-architecture@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-architectu=
re


