Received: from mail1.windriver.com ([147.11.146.13])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <mark.hatle@windriver.com>) id 1SRkAc-00040W-Fn
	for openembedded-devel@lists.openembedded.org;
	Tue, 08 May 2012 15:09:45 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca [147.11.189.40])
	by mail1.windriver.com (8.14.3/8.14.3) with ESMTP id q48CxjIH002084
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 8 May 2012 05:59:45 -0700 (PDT)
Received: from Macintosh-5.local (172.25.36.229) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.1.255.0;
	Tue, 8 May 2012 05:59:44 -0700
Message-ID: <4FA918BF.7040603@windriver.com>
Date: Tue, 8 May 2012 07:59:43 -0500
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.6;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <CAOHjBZusy84GNLJ+YXY598E4Zd5M-zAZo=hb==wVJhwTQqDPkA@mail.gmail.com>
	<4FA809C8.1000504@windriver.com>
	<CAOHjBZvnEk+j4CiLRq1NWbejfpFZdj7YjoJLhX1FhYUciekV=Q@mail.gmail.com>
In-Reply-To: <CAOHjBZvnEk+j4CiLRq1NWbejfpFZdj7YjoJLhX1FhYUciekV=Q@mail.gmail.com>
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
X-List-Received-Date: Tue, 08 May 2012 13:10:29 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/12 3:02 AM, Giuseppe Condorelli wrote:
> Hi Mark, All,
> thanks for your reply.
> What I need is to manually install target rpms locating them in my own
> directory.
> With no relocation available I should install them starting from / and this
> is not good if I need to install on host.
> What I need (in other words) is the possibility to set Prefix during spec
> file creation to have a relocation.
> Am I wrong?

You should not be installing target RPMs onto your host system directly.  This 
will contaminate your host RPM database and produce a system with invalid 
entries, causing programs like yum, smart or zypper to fail when attempting to 
update.

When you install target packages into your host environment for development you 
should be using a chroot and with the RPM database located within that chroot. 
This is how the build system does it, and really is the only safe way to do the 
install.  (If you need the update-alternatives and other pre/post-install 
scriptlets to run.. then this requires even more advanced knowledge..)

(I'm going to assume you don't need the scriptlets to run...) As your regular 
non-privileged user id, you can run pseudo to enable root-like fake chroot and 
other privileged operations..  and then inside of the pseudo environment use the 
version of RPM we built:  rpm --root=<your install path> -Uhv  --noscripts 
--dbpath=/var/lib/rpm <list of package>

(the above is from memory, so verify this before running it)

Look at meta/classes/rootfs_rpm.bbclass and meta/classes/package_rpm.bbclass for 
more details of exactly how the system constructs root filesystems.

--Mark

> Cheers,
> Giuseppe
>
> 2012/5/7 Mark Hatle<mark.hatle@windriver.com>
>
>> On 5/7/12 5:30 AM, Giuseppe Condorelli wrote:
>>
>>> Hi All,
>>>
>>> after having built my own image, I've looked at the resultant rpms under
>>> the deploy directory and I saw
>>> no relocation is possible (rpm -qpli<package>). This because Prefix is not
>>> set during spec file creation
>>> (package_rpm.bbclass).
>>> As far as you know, is it possible to set Prefix somehow?
>>>
>>
>> What type of packages are you trying to relocate?
>>
>> For target packages I don't expect that it would ever work.  The items
>> built by the build system often have internal paths and expectations.
>>
>> For SDK packages (i.e. things that run on the host), it might be possible
>> to make them relocatable, but it would be specific to those style packages.
>>   (Any relocatable package has to have the inbuilt knowledge to move and
>> change configuration files as necessary.  Also you have to have the right
>> set of packages to install into the environment and such.  I don't believe
>> we use RPM to install any native/SDK packages today.)
>>
>> --Mark
>>
>>   Please let me know.
>>> Thanks,
>>> Giuseppe
>>> ______________________________**_________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**
>>> openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>>
>>
>>
>> ______________________________**_________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.**openembedded.org<Openembedded-devel@lists.openembedded.org>
>> http://lists.linuxtogo.org/**cgi-bin/mailman/listinfo/**openembedded-devel<http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



