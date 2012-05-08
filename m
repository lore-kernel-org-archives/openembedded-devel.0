Received: from mail-gg0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SRfWc-00014d-Uy
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 10:12:03 +0200
Received: by ggcy3 with SMTP id y3so1387380ggc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2012 01:02:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=wERW/1dF9mZs8kLu6CyDejsNMIAeSpEqPm6VopRFGN8=;
	b=ehcHHGTLHm2dbt++Na4qab70NS0n7oAx/CjwTVqLoplkl7i/IdJFt5MVjZh5Mu6T+W
	u5TcislQB+09TpoTdEE8nVoLTOelYe/J/X0+bUiVh1t4cqH74tceMbeEF6ALncT50y/8
	L0Z4qwOceZShilJCSsAFjAOvLJDo/cxutjQ3yPQcE2SLK2AjhVrCg+WHN544AtVvEhwT
	kK7Q+MEGvlxxj0QNv3JUkvxzOhQjmR77MUuwIMIonaCh0h67bHEOGNTqlTc1kxRr+kzl
	O88zGs8ffSN9PsqVPgC+QbxgrRbjii2B16umYouk8kCpFh6jU+KwxqveQQI0zqGIio2l
	iLog==
MIME-Version: 1.0
Received: by 10.50.222.134 with SMTP id qm6mr1617152igc.49.1336464130706; Tue,
	08 May 2012 01:02:10 -0700 (PDT)
Received: by 10.231.49.134 with HTTP; Tue, 8 May 2012 01:02:10 -0700 (PDT)
In-Reply-To: <4FA809C8.1000504@windriver.com>
References: <CAOHjBZusy84GNLJ+YXY598E4Zd5M-zAZo=hb==wVJhwTQqDPkA@mail.gmail.com>
	<4FA809C8.1000504@windriver.com>
Date: Tue, 8 May 2012 10:02:10 +0200
Message-ID: <CAOHjBZvnEk+j4CiLRq1NWbejfpFZdj7YjoJLhX1FhYUciekV=Q@mail.gmail.com>
From: Giuseppe Condorelli <giuseppe.condorelli@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: [oe-core] Prefix in rpms packages
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
X-List-Received-Date: Tue, 08 May 2012 08:12:03 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi Mark, All,
thanks for your reply.
What I need is to manually install target rpms locating them in my own
directory.
With no relocation available I should install them starting from / and this
is not good if I need to install on host.
What I need (in other words) is the possibility to set Prefix during spec
file creation to have a relocation.
Am I wrong?

Cheers,
Giuseppe

2012/5/7 Mark Hatle <mark.hatle@windriver.com>

> On 5/7/12 5:30 AM, Giuseppe Condorelli wrote:
>
>> Hi All,
>>
>> after having built my own image, I've looked at the resultant rpms under
>> the deploy directory and I saw
>> no relocation is possible (rpm -qpli<package>). This because Prefix is not
>> set during spec file creation
>> (package_rpm.bbclass).
>> As far as you know, is it possible to set Prefix somehow?
>>
>
> What type of packages are you trying to relocate?
>
> For target packages I don't expect that it would ever work.  The items
> built by the build system often have internal paths and expectations.
>
> For SDK packages (i.e. things that run on the host), it might be possible
> to make them relocatable, but it would be specific to those style packages.
>  (Any relocatable package has to have the inbuilt knowledge to move and
> change configuration files as necessary.  Also you have to have the right
> set of packages to install into the environment and such.  I don't believe
> we use RPM to install any native/SDK packages today.)
>
> --Mark
>
>  Please let me know.
>> Thanks,
>> Giuseppe
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
>
>
> ______________________________**_________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>

