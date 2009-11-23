Received: from moutng.kundenserver.de ([212.227.126.187])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <chris@2net.co.uk>) id 1NCco6-0001Wn-Dz
	for openembedded-devel@lists.openembedded.org;
	Mon, 23 Nov 2009 18:34:37 +0100
Received: from [192.168.159.11] ([89.240.49.212])
	by mrelayeu.kundenserver.de (node=mreu0) with ESMTP (Nemesis)
	id 0MZQdt-1NTKcg1zMD-00LGNq; Mon, 23 Nov 2009 18:20:28 +0100
Message-ID: <4B0AC426.3030505@2net.co.uk>
Date: Mon, 23 Nov 2009 17:19:34 +0000
From: Chris Simmonds <chris@2net.co.uk>
User-Agent: Thunderbird 2.0.0.23 (X11/20090817)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1258901140-30575-1-git-send-email-bernhard.kaindl@gmx.net>
	<1258990008.8426.29.camel@conroy-linux>
In-Reply-To: <1258990008.8426.29.camel@conroy-linux>
X-Provags-ID: V01U2FsdGVkX1/+kBi+6/tO2joSqL+Tzmu1BIMFbznOgVr7WiB
	ldWHaX6wig/qF2qnvjmlsjeNHgRy/uZCxH5V4rxJnB0DXuQ7w1
	mw+hda6RSlSd39TTmtdZzg11x6xuVT5nOSI+NioReA=
X-SA-Exim-Connect-IP: 212.227.126.187
X-SA-Exim-Mail-From: chris@2net.co.uk
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] external-toolchain: Really accept toolchains built by meta-toolchain.bb
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
X-List-Received-Date: Mon, 23 Nov 2009 17:34:37 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Chris Conroy wrote:
> On Sun, 2009-11-22 at 15:45 +0100, Bernhard Kaindl wrote:
>> external-toolchain-generic,
>> external-toolchain:
>>
>> * The current external-toolchain recipes which are documented to accept
>>   toolchains built by meta-toolchain actually do not accept such because
>>   they expect ${prefix}/package-status to exist which is provieded by
>>   the poky toolchains but not the current OE meta-toolchain package.
>>
>>   Fix this by also looking for ${prefix}/usr/lib/opkg/status, which is the
>>   package-status file of the OE meta-toolchain package.
>>
>> * Also change the error message which is shown when neither file is found
>>   more explicit.
> 
> What about changing the meta-toolchain to generate the environment-setup
> script? While it's not important to have the script for normal building
> of packages, I've found it helpful to be able to do a quick compile of a
> test program here or there. Though, I understand that it might be
> dangerous since some folks might think the environment-setup creates an
> an entire cross building platform for them when they really want to stay
> inside OE....
> 
> --Chris

meta-toolchain does generate environment-setup and so far as I am aware 
it works fine as a stand-alone toolchain. Is there some reason why I 
should not be using it as such?

Chris S.



