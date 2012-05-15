Received: from mail-bk0-f47.google.com ([209.85.214.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <martiert@gmail.com>) id 1SUDWW-0001g1-1b
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 May 2012 10:54:28 +0200
Received: by bkcjm2 with SMTP id jm2so4836228bkc.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 May 2012 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=zbTN5UmVaFB6MgNBUudm2DDXmXP+Ii9g8G3dg0mMWcQ=;
	b=cDSBhpwWmLJQPssdeQoZ1AnbnR7V8KAZVmto00hQlQmhyFk9sLap4UEfZ4K3DqdxI+
	CWB4LAwWVc18C3xc0bDcVzePs2H0zWN9jourQG1ud/9AxTW8dRVX60IszksUvGb4Wkrk
	sXQHsMLwwjth2mX9KbsYbVX7/N56OQKdmgY+NsUpCkXA9CGE6eSG/EuUCL4GdYP7Gv0K
	cJTl42fvuTdOqeQ+LnkKCOq1iDItPrYLKzxVK4qPzv2YU+1dLQFWu4TSaE/KMNEY0VKL
	zX+13Ef/wKhP0Dd3DF5h265kGwkuFOp5KpON8zt31rqVeXCvIrr/QJeohfkks7nWSlTd
	JDWA==
Received: by 10.204.151.130 with SMTP id c2mr4398545bkw.125.1337071468176;
	Tue, 15 May 2012 01:44:28 -0700 (PDT)
Received: from [10.54.74.16] (64-103-25-233.cisco.com. [64.103.25.233])
	by mx.google.com with ESMTPS id m2sm7504085bkm.2.2012.05.15.01.44.26
	(version=SSLv3 cipher=OTHER); Tue, 15 May 2012 01:44:27 -0700 (PDT)
Message-ID: <4FB216D2.6010108@gmail.com>
Date: Tue, 15 May 2012 10:41:54 +0200
From: =?UTF-8?B?TWFydGluIEVydHPDpXM=?= <martiert@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.4) Gecko/20120502 Thunderbird/10.0.4
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <CADZ6=avMrT89BZA=awFOhCQFMhTDo1n67ZQya7J3Z9BSQeZHqw@mail.gmail.com>
	<CAMKF1sqCxAnukfORLmDT9vxg-V8ABcUgjXYTP5b1jc=LZfDu1w@mail.gmail.com>
	<CADZ6=auir8z1R2eQ0c++EcdLWizOQ+=OhbqM5q6Fms1=G0CJhw@mail.gmail.com>
In-Reply-To: <CADZ6=auir8z1R2eQ0c++EcdLWizOQ+=OhbqM5q6Fms1=G0CJhw@mail.gmail.com>
Subject: Re: New kmod {libdir} breaks udev 182 build
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
X-List-Received-Date: Tue, 15 May 2012 08:54:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 05/15/12 10:39, Thilo Fromm wrote:
> Hello Khem,
>
>>> I've got an issue with
>>> openembedded-core/meta/recipes-kernel/kmod/kmod_git.bb, with the way
>>> {libdir} is set in line 19:
>>>
>>> libdir = "${base_libdir}"
>>>
>>> "git blame" claims this was added by Khem Raj on 2012-05-08. This line
>>> causes libkmod to put its pkgconfig ".pc" file in the staging area at
>>> "/lib/pkgconfig/libkmod.pc". This is sad because other recipes would
>>> only look at /usr/lib/pkgconfig/ and /usr/share/pkgconfig.
>>>
>>> Take meta-openembedded/meta-oe/recipes-core/udev/udev_182.bb, for
>>> example. The build predictably fails with
>>>
>>> checking for KMOD... no
>>> configure: error: Package requirements (libkmod >= 5) were not met:
>>>
>>> No package 'libkmod' found
>>>
>>>
>>> So what's the right thing do do here? Use a different package install
>>> path for libkmod, or point udev to /lib/pkgconfig by extending its
>>> PKG_CONFIG_PATH correspondingly?
>> One solution is to fix kmod to install pc files in /usr/lib with right paths
>> to access libkmod
>>
>> second solution is to look for pc files in ${base_libdir} while building udev
>> can you try this option.
> Yes, I was trying to state these two possible resolutions in my first
> mail. I already tried adding
>
> PKG_CONFIG_PATH =
> "${PKG_CONFIG_DIR}:${STAGING_DATADIR}/pkgconfig:${PKG_CONFIG_SYSROOT_DIR}/${base_libdir}/pkgconfig/"
>
> to udev-182 and systemd (which is also affected) recipes. It works
> around the bug. Still, I think kmod is publishing its .pc files in the
> wrong directory.
>
> Regards,
> Thilo
>
We are also having this issue, and have just added this hack in a
bbappend for udev and systemd. Not a pretty solution, but found it to be
a lot of work to make only the .pc files be put in /usr/lib/pkgconfig
instead of /lib/pkgconfig. I totally agree that kmod publishes it's .pc
files in the wrong directory, as every distro I have tried uses
/usr/lib/pkgconfig as the pkgconfig directory. Guess we will keep this
hack until kmod is fixed upstream though.

- Martin


