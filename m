Received: from mail-iw0-f173.google.com ([209.85.223.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Nn3a5-0004Mg-72
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Mar 2010 06:26:45 +0100
Received: by iwn3 with SMTP id 3so1839467iwn.13
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Mar 2010 21:23:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=qv6XuUQyBiyu55uKw81lFy79Ju5owSaKyMJddQJHPsc=;
	b=lkhPKKLdDBDzp9DzUu1LJjn9UUAO9v5A1ERBlxSUh2qYVYdp+zgNOrLffvUz2ZtJPo
	owIJK4Xf/JMjE6O3VXedZ75HNSQmFjrfjB8trIw8nqw0MFCF5wkdujp6ZEXbPCdKdDGe
	xG3gXGwHV5PqV4Vn4LEHwOwtR+uctNbPG1kO4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=YImiB3rm04XyEnxC2YrRmRcNrPIxxyYKqjzfR2AepdAMQN58PBsLKl/if8ZPKYLN7x
	kk8IYVhOhH+S5FlRRP90hAfYetJPMb8zWnfEI33S5UoDAp78a3jp8hop3GwwCOPCuBNb
	3zIOduC3Pda11Kr9d3ltuOLOTKrN/Vi8IKUf0=
MIME-Version: 1.0
Received: by 10.231.159.207 with SMTP id k15mr656585ibx.52.1267680228587; Wed, 
	03 Mar 2010 21:23:48 -0800 (PST)
In-Reply-To: <4CF74675-86F3-45C9-A837-5D5A3489F2A5@kaon.com>
References: <B22FA4FC-2DB7-49E8-AB09-3FF8FC3D36D9@kaon.com>
	<4CF74675-86F3-45C9-A837-5D5A3489F2A5@kaon.com>
Date: Wed, 3 Mar 2010 21:23:48 -0800
Message-ID: <19c1b8a91003032123t4e402cb0u8db75a6862dca799@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.173
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: Trying and Failing to enable Java with GCC 4.3.3
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
X-List-Received-Date: Thu, 04 Mar 2010 05:26:45 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 3, 2010 at 9:19 AM, Joshua Smith <jesmith@kaon.com> wrote:
> Update: I dug around in the log files and I think I have a more root caus=
e of this error.
>
> configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
>
> I've attached the whole log of the failing build.
>
> Any hints?
>
> On Mar 3, 2010, at 11:20 AM, Joshua Smith wrote:
>
>> Hello,
>>
>> I'm new to OE. =A0I'm trying to get GCJ compiled for the TouchBook (an A=
RM-based tablet). =A0After some searching and trial-and-error, I figured ou=
t that I need to add:
>>
>> JAVA_arm =3D ",java" to recipies/gcc-4.3.3.inc
>>
>> But now I'm getting an error when it tries to build gcc-cross-4.3.3:
>>
>> make[4]: Entering directory `/OE/build/tmp/work/armv7a-angstrom-linux-gn=
ueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gn=
ueabi/64/zlib'
>> make[4]: *** No rule to make target `all'. =A0Stop.
>> make[4]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnu=
eabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnu=
eabi/64/zlib'
>> make[3]: *** [multi-do] Error 1
>> make[3]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnu=
eabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnu=
eabi/zlib'
>> make[2]: *** [all-multi] Error 2
>> make[2]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-gnu=
eabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-gnu=
eabi/zlib'
>> make[1]: *** [all-zlib] Error 2
>>
>> (I can give you more of the log if it would help, but this is the first =
error)
>>
>> I can see why adding Java would cause GCC to need zlib when maybe it did=
n't before. =A0But I don't know what to change to get zlib configured as pa=
rt of the gcc build process.

for configure errors its better to post config.log which is generated
in the build tree. Thats where we can find the cause of error.
do_compile log wont help.


>>
>> Help?
>>
>> -Joshua Smith
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


