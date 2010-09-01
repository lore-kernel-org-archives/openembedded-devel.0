Received: from web.fajnnet.com ([89.203.157.2])
	by linuxtogo.org with esmtp (Exim 4.69) (envelope-from <i@minami.cz>)
	id 1Oqpp3-0007Td-Fg for openembedded-devel@lists.openembedded.org;
	Wed, 01 Sep 2010 18:06:09 +0200
Received: from [192.168.2.100] (unknown [192.168.177.2])
	by web.fajnnet.com (Postfix) with ESMTP id 5D20C24C006
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  1 Sep 2010 17:41:08 +0200 (CEST)
Message-ID: <4C7E74A8.3090200@minami.cz>
Date: Wed, 01 Sep 2010 17:43:36 +0200
From: =?UTF-8?B?TWljaGFsIE1pbsOhxZk=?= <i@minami.cz>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.8) Gecko/20100806 Lanikai/3.1.2
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1283346978-14041-1-git-send-email-i@minami.cz>
	<1283348760.4187.11.camel@mattotaupa>
In-Reply-To: <1283348760.4187.11.camel@mattotaupa>
X-SA-Exim-Connect-IP: 89.203.157.2
X-SA-Exim-Mail-From: i@minami.cz
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] grub 0.97: fixing broken 256byte-inodes patch
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
X-List-Received-Date: Wed, 01 Sep 2010 16:06:09 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable

  On 09/01/2010 03:46 PM, Paul Menzel wrote:
> did it ever work with Ext2 partitions in OE? I guess =C8=A6ngstr=C3=B6m=
 is using=20
> it and Ext2 partitions and it is working there?
I haven't found any note in angstrom mailing list mentioning the problem,
but this bug occurs in other distros [1], [2] when grub is patched with
the version of patch originally from read-hat (the same, that's now in OE=
).
I didn't dig much deeper...maybe it's platform dependend (I'm compiling f=
or
geode), but after I tried the fixed version of patch, the problem went aw=
ay.
> please take a look at the commit policy [1] and resent with a
> Signed-off-by line. Please also update the patch queue [2].
thx for advice, i'll do as you say

[1] http://bugs.archlinux.org/task/14363
[2]=20
http://www.mail-archive.com/debian-bugs-dist@lists.debian.org/msg544938.h=
tml


