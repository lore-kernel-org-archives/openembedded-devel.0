Received: from [206.46.173.9] (helo=vms173009pub.verizon.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <denis@denix.org>) id 1M3vJ9-00033v-3F
	for openembedded-devel@lists.openembedded.org;
	Tue, 12 May 2009 18:58:23 +0200
Received: from gandalf.denix.org ([71.127.60.148]) by vms173009.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 6.3-7.04 (built Sep 26 2008;
	32bit)) with ESMTPA id <0KJJ00AWWIU1MKCW@vms173009.mailsrvcs.net> for
	openembedded-devel@lists.openembedded.org; Tue,
	12 May 2009 11:51:38 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 5DA8914AF5F; Tue,
	12 May 2009 12:51:35 -0400 (EDT)
Date: Tue, 12 May 2009 12:51:35 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: openembedded-devel@lists.openembedded.org
Message-id: <20090512165135.GA32320@denix.org>
References: <1242089668-11610-1-git-send-email-denis@denix.org>
	<1242089668-11610-8-git-send-email-denis@denix.org>
	<200905121303.01792.marcin@juszkiewicz.com.pl>
	<guc8an$pk6$1@ger.gmane.org>
MIME-version: 1.0
In-reply-to: <guc8an$pk6$1@ger.gmane.org>
User-Agent: Mutt/1.5.16 (2007-06-09)
Subject: Re: [PATCH 7/8] linux-davinci: build linux-davinci kernels	for dm6446, dm6467 and dm355 EVMs
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
X-List-Received-Date: Tue, 12 May 2009 16:58:23 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline
Content-transfer-encoding: quoted-printable

On Tue, May 12, 2009 at 06:32:23PM +0200, Koen Kooi wrote:
> On 12-05-09 13:03, Marcin Juszkiewicz wrote:
>> Dnia wtorek, 12 maja 2009 o 02:54:27 Denys Dmytriyenko napisa??(a):
>>> +++ b/recipes/linux/linux-davinci_2.6.28.bb
>>> @@ -3,10 +3,12 @@ require linux.inc
>>>   DESCRIPTION =3D "Linux kernel for Davinci processors"
>>>   KERNEL_IMAGETYPE =3D "uImage"
>>>
>>> -COMPATIBLE_MACHINE =3D "davinci-sffsdr"
>>> +COMPATIBLE_MACHINE =3D "(dm6446-evm|dm6467-evm|davinci-sffsdr)"
>>
>>> +++ b/recipes/linux/linux-davinci_git.bb
>>
>>> -COMPATIBLE_MACHINE =3D "(davinci-dvevm|davinci-sffsdr|dm355-leopard)"
>>> +COMPATIBLE_MACHINE =3D=20
>>> "(dm6446-evm|dm6467-evm|dm355-evm|davinci-sffsdr|dm355-leopard)"
>>
>>> -DEFAULT_PREFERENCE =3D "-1"
>>> +DEFAULT_PREFERENCE =3D "1"
>>
>> So all Davinci devices starts to use GIT kernel instead of 2.6.28?
>
> That's the idea, it's where TI is producing patches against :)

That's where the support is being added right now. 2.6.28 only has support =
for=20
6446 and partially for 6467.

--=20
Denys


