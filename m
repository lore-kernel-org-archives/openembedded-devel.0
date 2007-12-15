Received: from [209.85.128.186] (helo=fk-out-0910.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <pmiscml@gmail.com>) id 1J3YZM-00042p-KL
	for openembedded-devel@lists.openembedded.org;
	Sat, 15 Dec 2007 16:04:48 +0100
Received: by fk-out-0910.google.com with SMTP id 18so539766fks.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 15 Dec 2007 07:00:09 -0800 (PST)
Received: by 10.86.30.9 with SMTP id d9mr4279739fgd.16.1197730809201;
	Sat, 15 Dec 2007 07:00:09 -0800 (PST)
Received: from ?192.168.20.166? ( [194.79.8.34])
	by mx.google.com with ESMTPS id 13sm14281764fks.2007.12.15.07.00.08
	(version=SSLv3 cipher=OTHER); Sat, 15 Dec 2007 07:00:08 -0800 (PST)
Date: Sat, 15 Dec 2007 17:05:15 +0200
From: Paul Sokolovsky <pmiscml@gmail.com>
X-Mailer: The Bat! (v3.64.01 Christmas Edition) Professional
X-Priority: 3 (Normal)
Message-ID: <1846530493.20071215170515@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <4763B128.6050806@student.utwente.nl>
References: <164348748.20071215043923@gmail.com>
	<4763B128.6050806@student.utwente.nl>
MIME-Version: 1.0
Subject: Re: [RFC] ANGSTROM_MODE -> SYSTYPE
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Sat, 15 Dec 2007 15:04:48 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello Koen,

Saturday, December 15, 2007, 12:49:12 PM, you wrote:

> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1

> Paul Sokolovsky schreef:
>> Hello Openembedded-devel,
>> 
>>    ANGSTROM_MODE config variable has proven to be very useful and
>> successful feature during the Angstrom evolution. IMHO, it is worth
>> generalization of its meaning and naming to become a generic
>> additional OE distro configuration parameter. 
>> So, I'd like to propose
>> it to be renamed to SYSTYPE, with the description "Select particular
>> system variant of a distribution which supports such feature, e.g.,
>> underlying libc type."

> How will a user know if that flag is supported for the distro he/she
> wants to use?

  How user knows which distros are available in the first place? She
goes and looks up them in configs or reads documentation. How user
knows which SYSTYPEs are supported, if any, for some distro? She does
the same regarding configs/docs reading.

> should we enhance insane.bbclass to crosscheck TARGET_OS with
> SYSTYPE_FOO for the uclibc vs glibc case? And if so, how would it check
> between glibc and eglibc?

  User "input" validation is always a nice thing, but adds a bunch of
code, and OE lacks it many places anyway ;-). Well, we could solve it
in this case like this for example: Make supporting distro set
SYSTYPES_AVAILABLE, and make insane.bbclass (or maybe even
sanity.bbclass) to check that SYSTYPE value appears there.

> Having an *easier* OE-blessed way for switching C library would be nice,
> but let's make sure people don't shoot themselves in the foot by setting
> SYSTYPE_FOO with a distro that has no knowledge of it.

  Switching C library in merely a particular use case of ability to
adjust an important distro parameter without formally creating another
distro [config or build area]. So useful for Angstrom, it is useless
for some deeply-embedded distro which is developed and QA solely
against uclibc. Such a distro can use SYSTYPE for some other important
parameter they want to tweak. More on this in another mail.

> regards,

> Koen


>>   Obviously, it wouldn't be limited to libc type, but intended to be a
>> generic sub-parameter of a distro, it could be debug/release type,
>> size type (minimal/standard/extended), whatever. The usage idea is to
>> have standard name for such generic parameter, plus semantically it
>> should be expected that a distro allows to build different SYSTYPE's
>> side-by-side in the same build dir (like Angstrom does for libc
>> variants).
>> 
>> 





-- 
Best regards,
 Paul                            mailto:pmiscml@gmail.com



