Received: from [81.228.11.159] (helo=pne-smtpout2-sn1.fre.skanova.net)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ulf.samuelsson@atmel.com>) id 1MbCNs-0000h0-Gn
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 13:52:49 +0200
Received: from [10.175.196.247] (213.66.88.44) by
	pne-smtpout2-sn1.fre.skanova.net (7.3.140.3) (authenticated as
	u82406562)
	id 4A2D61FD00543475 for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 13:36:22 +0200
Message-ID: <4A82A936.3020101@atmel.com>
Date: Wed, 12 Aug 2009 13:36:22 +0200
From: Ulf Samuelsson <ulf.samuelsson@atmel.com>
Organization: Atmel Nordic AB
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <4A828368.5030100@atmel.com>
	<fce2a370908120214o3b6893b0lfc515b0874f5afd3@mail.gmail.com>
In-Reply-To: <fce2a370908120214o3b6893b0lfc515b0874f5afd3@mail.gmail.com>
Subject: Re: U-Boot not copied into tmp/deploy/glibc/<board>
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
X-List-Received-Date: Wed, 12 Aug 2009 11:52:55 -0000
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit

Ihar Hrachyshka skrev:
> On Wed, Aug 12, 2009 at 11:55 AM, Ulf
> Samuelsson<ulf.samuelsson@atmel.com> wrote:
>> Right now, u-boot is built in my private git tree,
>> when I do bitbake x11-gpe-image,
>>
>> It is not copied to tmp/deploy/glibc/<board>
>>
>> If I do
>> bitbake u-boot, the stuff IS copied.
>>
>> Anyone can think of a reason for this problem?
>>
>> I have modified the git tree since the first build
>> to fix some problems. Can old junk be the trouble?
> 
> I've seen the behaviour yesterday on my tree.
> 

I see some traces of u-boot in
"tmp/deploy/glibc/ipk/<board>/mourge"
"tmp/deploy/glibc/sources/GPL" (links to the downloaded packages)

./glibc/ipk/at91sam9263ek/morgue/u-boot-dbg_2009.08-rc2-r0.3_at91sam9263ek.ipk
./glibc/ipk/at91sam9263ek/morgue/u-boot-dev_2009.08-rc2-r0.3_at91sam9263ek.ipk
./glibc/pstage/angstromglibc/staging-u-boot-at91sam9263ek-angstrom-linux-gnueabi_2009.08-rc2-r0_x86_64-linux.ipk

-- 
Best Regards
Ulf Samuelsson



