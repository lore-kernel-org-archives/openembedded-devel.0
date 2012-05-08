Received: from mail-wi0-f177.google.com ([209.85.212.177])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <giuseppe.condorelli@gmail.com>) id 1SRlQm-0003T0-V6
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 16:30:29 +0200
Received: by wibhj13 with SMTP id hj13so645380wib.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 May 2012 07:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type; bh=zH70l2hMUYxAbjbdfVf1Qm42YWpYfq9w8YUH2QfJ5uo=;
	b=1Jz2uUs0h7LdDDok1RPAtAi7CL2LK5FWWIIy433Wm7d3+lNv6S31ZVuD+r/S4fTIXa
	ti/M1JkF7DNoJbGm9wxnwo36E/oKeRnhoOi57Wm+AHIH1YLALpsxZ8L8x6lif8SNmir0
	3WJGJE3tnLD3Dk3labY9gBJ+4aLWuw/pxdv+lPCQVLgJde5BtUSeYn2EFCFz36/e6w8j
	+qBmLfNcgOq5fypwY5c53XO8q1aTXTriVjaizPFt/ZiHrXdOUD5PSP84WfW7zHoct0pW
	svIGG6DoKlwfH9jGbByiaS6jDyny+hPg4HknqmPeH4wCMyUxId7B0uvkeApuKeVzbMct
	UyOw==
MIME-Version: 1.0
Received: by 10.50.196.230 with SMTP id ip6mr10421339igc.49.1336486832454;
	Tue, 08 May 2012 07:20:32 -0700 (PDT)
Received: by 10.231.49.134 with HTTP; Tue, 8 May 2012 07:20:32 -0700 (PDT)
In-Reply-To: <4FA918BF.7040603@windriver.com>
References: <CAOHjBZusy84GNLJ+YXY598E4Zd5M-zAZo=hb==wVJhwTQqDPkA@mail.gmail.com>
	<4FA809C8.1000504@windriver.com>
	<CAOHjBZvnEk+j4CiLRq1NWbejfpFZdj7YjoJLhX1FhYUciekV=Q@mail.gmail.com>
	<4FA918BF.7040603@windriver.com>
Date: Tue, 8 May 2012 16:20:32 +0200
Message-ID: <CAOHjBZuiCDCB4cNWHsFG2FoyogK-dAy4Af99Tj2o82j+h7Linw@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 May 2012 14:30:50 -0000
Content-Type: text/plain; charset=ISO-8859-1

Many many thanks for clarification, Mark!

2012/5/8 Mark Hatle <mark.hatle@windriver.com>

> On 5/8/12 3:02 AM, Giuseppe Condorelli wrote:
>
>> Hi Mark, All,
>> thanks for your reply.
>> What I need is to manually install target rpms locating them in my own
>> directory.
>> With no relocation available I should install them starting from / and
>> this
>> is not good if I need to install on host.
>> What I need (in other words) is the possibility to set Prefix during spec
>> file creation to have a relocation.
>> Am I wrong?
>>
>
> You should not be installing target RPMs onto your host system directly.
>  This will contaminate your host RPM database and produce a system with
> invalid entries, causing programs like yum, smart or zypper to fail when
> attempting to update.
>
> When you install target packages into your host environment for
> development you should be using a chroot and with the RPM database located
> within that chroot. This is how the build system does it, and really is the
> only safe way to do the install.  (If you need the update-alternatives and
> other pre/post-install scriptlets to run.. then this requires even more
> advanced knowledge..)
>
> (I'm going to assume you don't need the scriptlets to run...) As your
> regular non-privileged user id, you can run pseudo to enable root-like fake
> chroot and other privileged operations..  and then inside of the pseudo
> environment use the version of RPM we built:  rpm --root=<your install
> path> -Uhv  --noscripts --dbpath=/var/lib/rpm <list of package>
>
> (the above is from memory, so verify this before running it)
>
> Look at meta/classes/rootfs_rpm.**bbclass and meta/classes/package_rpm.**bbclass
> for more details of exactly how the system constructs root filesystems.
>
> --Mark
>
>  Cheers,
>> Giuseppe
>>
>> 2012/5/7 Mark Hatle<mark.hatle@windriver.com**>
>>
>>  On 5/7/12 5:30 AM, Giuseppe Condorelli wrote:
>>>
>>>  Hi All,
>>>>
>>>> after having built my own image, I've looked at the resultant rpms under
>>>> the deploy directory and I saw
>>>> no relocation is possible (rpm -qpli<package>). This because Prefix is
>>>> not
>>>> set during spec file creation
>>>> (package_rpm.bbclass).
>>>> As far as you know, is it possible to set Prefix somehow?
>>>>
>>>>
>>> What type of packages are you trying to relocate?
>>>
>>> For target packages I don't expect that it would ever work.  The items
>>> built by the build system often have internal paths and expectations.
>>>
>>> For SDK packages (i.e. things that run on the host), it might be possible
>>> to make them relocatable, but it would be specific to those style
>>> packages.
>>>  (Any relocatable package has to have the inbuilt knowledge to move and
>>> change configuration files as necessary.  Also you have to have the right
>>> set of packages to install into the environment and such.  I don't
>>> believe
>>> we use RPM to install any native/SDK packages today.)
>>>
>>> --Mark
>>>
>>>  Please let me know.
>>>
>>>> Thanks,
>>>> Giuseppe
>>>> ______________________________****_________________
>>>> Openembedded-devel mailing list
>>>> Openembedded-devel@lists.**ope**nembedded.org <http://openembedded.org>
>>>> <Openembedded-**devel@lists.openembedded.org<Openembedded-devel@lists.openembedded.org>
>>>> >
>>>> http://lists.linuxtogo.org/****cgi-bin/mailman/listinfo/**<http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**>
>>>> openembedded-devel<http://**lists.linuxtogo.org/cgi-bin/**
>>>> mailman/listinfo/openembedded-**devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>>> >
>>>>
>>>>
>>>
>>> ______________________________****_________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.**ope**nembedded.org <http://openembedded.org><
>>> Openembedded-**devel@lists.openembedded.org<Openembedded-devel@lists.openembedded.org>
>>> >
>>> http://lists.linuxtogo.org/****cgi-bin/mailman/listinfo/****
>>> openembedded-devel<http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel>
>>> <http://**lists.linuxtogo.org/cgi-bin/**mailman/listinfo/openembedded-**
>>> devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>> >
>>>
>>>  ______________________________**_________________
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

