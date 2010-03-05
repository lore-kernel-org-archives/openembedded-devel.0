Received: from mail-iw0-f184.google.com ([209.85.223.184])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1NnNUw-00027J-RA
	for openembedded-devel@lists.openembedded.org;
	Fri, 05 Mar 2010 03:42:59 +0100
Received: by iwn14 with SMTP id 14so180370iwn.12
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Mar 2010 18:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=JnBf/6y9vXsAyxctpJ+LPKk/00GU1gsL8CfIoEyOo0I=;
	b=k0IDDhuzEm1n1JTiEvd/RADATF5Nt0/k+mTxTWq+gVMFlq3D/oEyBfskyjRBoJ1x8C
	75feqsO81YxhZFXEJa3WPgJbM8VicOZGGgJvg4E6YJgpdEnYEzrlvBz2ykkecavBYRd6
	FY0Y8+U7cpdNjLiwM5b7koC0X+YRETva3+P/E=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=UJhz0lk5qC2cyMqpaNJ+PaFo3rBOdGV45r5UjaymfK6az6Y850ybmbm/4hYuqfZMku
	Hrhnf/Y7BabdMA6ljTlg08RtqYeH7eUPJeDJsmgtG5Vn1CGJAIMnUF9uFdb/pBetLZcv
	C3JQ6d9/pntAkwblQafuzRANS3FNk/IiHX8WE=
MIME-Version: 1.0
Received: by 10.231.147.70 with SMTP id k6mr20186ibv.55.1267756789017; Thu, 04 
	Mar 2010 18:39:49 -0800 (PST)
In-Reply-To: <0209FF33-B31E-4779-B339-F0D678A6A075@kaon.com>
References: <B22FA4FC-2DB7-49E8-AB09-3FF8FC3D36D9@kaon.com>
	<4CF74675-86F3-45C9-A837-5D5A3489F2A5@kaon.com>
	<19c1b8a91003032123t4e402cb0u8db75a6862dca799@mail.gmail.com>
	<0209FF33-B31E-4779-B339-F0D678A6A075@kaon.com>
Date: Thu, 4 Mar 2010 18:39:48 -0800
Message-ID: <19c1b8a91003041839t233bdaf7g921c682c0abd2479@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.223.184
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
X-List-Received-Date: Fri, 05 Mar 2010 02:42:59 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 4, 2010 at 6:41 AM, Joshua Smith <jesmith@kaon.com> wrote:
> Oh, sorry about that. =A0I've attached the do_configure log for gcc_cross=
. =A0Doesn't look too helpful to me, but what do I know? =A0If you meant so=
me other configure log, let me know!
>
> In case it helps: before trying to build gcj inside OE, I was trying to b=
uild a native GCC compiler on the target machine (TouchBook, based on the B=
eagleboard), and I got this same error when I tried configuring with --disa=
ble-shared (with --enabled-shared I had other problems).
>

its not config.log that you attached is it ?
> Thanks.
>
> -Joshua
>
> On Mar 4, 2010, at 12:23 AM, Khem Raj wrote:
>
>> On Wed, Mar 3, 2010 at 9:19 AM, Joshua Smith <jesmith@kaon.com> wrote:
>>> Update: I dug around in the log files and I think I have a more root ca=
use of this error.
>>>
>>> configure: error: Link tests are not allowed after GCC_NO_EXECUTABLES.
>>>
>>> I've attached the whole log of the failing build.
>>>
>>> Any hints?
>>>
>>> On Mar 3, 2010, at 11:20 AM, Joshua Smith wrote:
>>>
>>>> Hello,
>>>>
>>>> I'm new to OE. =A0I'm trying to get GCJ compiled for the TouchBook (an=
 ARM-based tablet). =A0After some searching and trial-and-error, I figured =
out that I need to add:
>>>>
>>>> JAVA_arm =3D ",java" to recipies/gcc-4.3.3.inc
>>>>
>>>> But now I'm getting an error when it tries to build gcc-cross-4.3.3:
>>>>
>>>> make[4]: Entering directory `/OE/build/tmp/work/armv7a-angstrom-linux-=
gnueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-=
gnueabi/64/zlib'
>>>> make[4]: *** No rule to make target `all'. =A0Stop.
>>>> make[4]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-g=
nueabi/64/zlib'
>>>> make[3]: *** [multi-do] Error 1
>>>> make[3]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-g=
nueabi/zlib'
>>>> make[2]: *** [all-multi] Error 2
>>>> make[2]: Leaving directory `/OE/build/tmp/work/armv7a-angstrom-linux-g=
nueabi/gcc-cross-4.3.3-r7.1/gcc-4.3.3/build.i686-linux.arm-angstrom-linux-g=
nueabi/zlib'
>>>> make[1]: *** [all-zlib] Error 2
>>>>
>>>> (I can give you more of the log if it would help, but this is the firs=
t error)
>>>>
>>>> I can see why adding Java would cause GCC to need zlib when maybe it d=
idn't before. =A0But I don't know what to change to get zlib configured as =
part of the gcc build process.
>>
>> for configure errors its better to post config.log which is generated
>> in the build tree. Thats where we can find the cause of error.
>> do_compile log wont help.
>>
>>
>>>>
>>>> Help?
>>>>
>>>> -Joshua Smith
>>>>
>>>
>>> _______________________________________________
>>> Openembedded-devel mailing list
>>> Openembedded-devel@lists.openembedded.org
>>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>>
>>>
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>
>
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>
>


