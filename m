Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1Pjpye-0003RQ-U9
	for openembedded-devel@lists.openembedded.org;
	Mon, 31 Jan 2011 10:23:17 +0100
Received: by qyk8 with SMTP id 8so2688608qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 31 Jan 2011 01:22:13 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.131.18 with SMTP id v18mr6083023qas.243.1296465733583;
	Mon, 31 Jan 2011 01:22:13 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.203.137 with HTTP; Mon, 31 Jan 2011 01:22:13 -0800 (PST)
X-Originating-IP: [78.106.57.174]
In-Reply-To: <4D435A32.9070901@mentor.com>
References: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
	<4D435A32.9070901@mentor.com>
Date: Mon, 31 Jan 2011 12:22:13 +0300
X-Google-Sender-Auth: CzIYBQb7ih95Pu-YTIEQQBalln8
Message-ID: <AANLkTiku+-Z5nMcW+FyvmcD5F=dxATgtzwYKOT2Qpn4F@mail.gmail.com>
From: Yury Bushmelev <jay4mail@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: oestats as automated testing reporting tool (Was: testing branch 2011-01-20)
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
X-List-Received-Date: Mon, 31 Jan 2011 09:23:17 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

2011/1/29 Tom Rini <tom_rini@mentor.com>:
> On 01/26/2011 03:04 PM, Yury Bushmelev wrote:
>>
>> I have spent some time to looking over oestats client and server code.
>> Below are some ideas.
>
> [snip]
>>>
>>> - workstation (distro + arch)*
>>
>> We have build arch in oestats already (BUILD_ARCH). I'll prefer
>> replace it with BUILD_SYS because we can use e.g.
>> darwin/freebsd/cygwin as build host later.

>> As there is no reliable way to get user's build host distro I'll ask
>> to introduce new bitbake variable (OESTATS_HOST_DISTRO?).
>
> We can code some things up. =A0For example, if uname -o has Linux in the =
name,
> we can see if lsb_release exists (more often than not, it will/should) an=
d
> then bam, we've got it. =A0Otherwise we can do some poking around before =
just
> giving up.

I'm considering using following scenario:
a) try OESTATS_HOST_DISTRO in bb env
a) try lsb_release -irc
c) set it to "Please install lsb_release or setup OESTATS_HOST_DISTRO
in your local.conf"

We can get distro name by many other ways (/etc/issue,
/etc/*-release). But I have no other reliable ideas how to get distro
version.

I've found other problem. Kernel arch may be different from userspace
arch. They may use i686 userspace with x86_64 kernel. I suspect that
userspace arch is more interesting for us. First idea is using "file
/sbin/init" e.g. to detect userspace arch and pass it as BUILD_ARCH.

Any ideas?

--=20
Yury Bushmelev


