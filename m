Received: from mail-qy0-f175.google.com ([209.85.216.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jay@jay-tech.ru>) id 1PiDUh-0002W8-5S
	for openembedded-devel@lists.openembedded.org;
	Wed, 26 Jan 2011 23:05:39 +0100
Received: by qyk8 with SMTP id 8so5720443qyk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 26 Jan 2011 14:04:50 -0800 (PST)
MIME-Version: 1.0
Received: by 10.224.80.194 with SMTP id u2mr846756qak.293.1296079490383; Wed,
	26 Jan 2011 14:04:50 -0800 (PST)
Sender: jay@jay-tech.ru
Received: by 10.220.203.137 with HTTP; Wed, 26 Jan 2011 14:04:50 -0800 (PST)
X-Originating-IP: [78.106.57.174]
Date: Thu, 27 Jan 2011 01:04:50 +0300
X-Google-Sender-Auth: nfg2chyQTnDQKmYpLvpjp3lnci4
Message-ID: <AANLkTinAbLLKzbMbcQNSkgh8dQj+FD7WtuVd+wQ1ZKmz@mail.gmail.com>
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
X-List-Received-Date: Wed, 26 Jan 2011 22:05:39 -0000
Content-Type: text/plain; charset=ISO-8859-1

I have spent some time to looking over oestats client and server code.
Below are some ideas.

> I've thought about collecting testing results via oe-stats.
> We should collect following data:
> - machine
Already in oestats (bb MACHINE variable)

> - distro
Already in oestats (bb USERDISTRO variable)

> - target
Well.. This should be name of image which was built. We have it but it
is mixed with lots of other packages data.
Not sure about best way here. May be we should use bitbake cmdline
args here. I'll address this question to bitbake developers.

> - workstation (distro + arch)*
We have build arch in oestats already (BUILD_ARCH). I'll prefer
replace it with BUILD_SYS because we can use e.g.
darwin/freebsd/cygwin as build host later.
As there is no reliable way to get user's build host distro I'll ask
to introduce new bitbake variable (OESTATS_HOST_DISTRO?).

> - bitbake version*
Seems bb.__version__ should be enough. Should we send revision and
branch when using git version?

> - tester (builder) name
OESTATS_BUILDER

> - last successful build
Report may get this from database.

> - build type (clean/incremental)*
OESTATS_BUILD_TYPE?

> - current issues
Report may get this from database.

I've forget to note that we have METADATA_BRANCH and METADATA_REVISION
as well in oestats.

P.S.: Do we really need this in perspective of merging with yocto? Or
may be just use e.g. some spreadsheet/form on google instead?

-- 
Yury Bushmelev


