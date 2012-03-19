Received: from mail-yx0-f175.google.com ([209.85.213.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <philipp.zabel@gmail.com>) id 1S9YWY-0006G1-3m
	for openembedded-devel@lists.openembedded.org;
	Mon, 19 Mar 2012 10:05:06 +0100
Received: by yenm3 with SMTP id m3so5136745yen.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 19 Mar 2012 01:56:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	bh=I66Za3IzJ339TpdVL1mT1Au70rcUjrUZCO8y+69KqrI=;
	b=tHdgQq59cQV+WlaC2BDGNIfQdWbYG4CcPuF1+cHjpw/0dYoxdrHrmczcsaBa2FqGRi
	OFGLC65JGHjSl3jNW52jphLlfl01tbTOLunmO76RSiDI20CrbSmLwpQnKmzycQ+7sJxn
	ioghdzbvLQWWCCbTQztK3KAo+SVpI8mHl6aDBdsez9BhzVLm4LiHxad4jY624dndC5Hx
	BrDOIwQbte5+bFZhBvRiT4s6xwHLNEqhQ/D+tzvF50haEcN+RrwkK9pRGPTcVzqgRhGC
	l7Xr6PeSths/ORM7ZdVgNeXhe3MqdQpw45mqRtKJUoSg9NTzZlYEFYVg/6NR0GlvLBEs
	BwmA==
MIME-Version: 1.0
Received: by 10.60.4.105 with SMTP id j9mr12827913oej.29.1332147374477; Mon,
	19 Mar 2012 01:56:14 -0700 (PDT)
Received: by 10.182.11.71 with HTTP; Mon, 19 Mar 2012 01:56:14 -0700 (PDT)
In-Reply-To: <4F61EF82.6060609@dresearch-fe.de>
References: <CAAwVp3u7i6ptQ=dvCV_RGwctHqDWKLXXPXKjGwZJ_okhDx8gwg@mail.gmail.com>
	<4F61EF82.6060609@dresearch-fe.de>
Date: Mon, 19 Mar 2012 09:56:14 +0100
Message-ID: <CA+gwMcdbyWg4wYoT9abUE90+t7bDnDcCM+DiX8nxM0WpJtPuJg@mail.gmail.com>
From: Philipp Zabel <philipp.zabel@gmail.com>
To: Steffen Sledz <sledz@dresearch-fe.de>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: udev_141 vs. udev_network_queue.sh
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
X-List-Received-Date: Mon, 19 Mar 2012 09:05:06 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 15, 2012 at 2:32 PM, Steffen Sledz <sledz@dresearch-fe.de> wrot=
e:
> On 13.03.2012 16:06, Mario Schuknecht wrote:
>> The udev script /etc/udev/scripts/network.sh writes all not configured
>> interfaces into the file /dev/udev_network_queue
>> root@3065-4-00001:~# cat /dev/udev_network_queue
>> eth0
>> lo
>> ra0
>> But no script or program check this file.
>> I googled =A0udev_network_queue and found an old bitbake recipe
>> http://svn.nslu2-linux.org/svnroot/slugos/releases/slugos-3.10-beta/open=
embedded/packages/udev/udev_084.bb
>> that
>> installs =A0udev_network_queue.sh.
>> That script checks this files and starts the interfaces.
>>
>> Why is this file not installed any longer? Is there any other way or
>> concept to handle this situation?
>
> It seems that the installation of this script was lost in between udev_08=
4 and udev_089. The latter was introduced by Philipp Zabel (commit 83e3ce3d=
bc5f49a7c8ee4b535ed14d8938c252aa).
>
> Can someone remember if this script wasn't installed any longer by intent=
ion or by mistake?
>
> Should it be installed in later udev versions again?

I do not remember removing this script consciously.
If it still solves a real use case, maybe it should be added back again.

regards
Philipp


