Received: from smtp4.nedap.com ([213.160.213.85] helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <jaap.dejong@nedap.com>) id 1UPSET-0003mk-AF
	for openembedded-devel@lists.openembedded.org;
	Tue, 09 Apr 2013 08:40:42 +0200
Received: from nvs0066.nedap.local (10.91.8.1) by relaysmtp1.nedap.local
	(10.1.8.139) with Microsoft SMTP Server id 8.3.279.5; Tue, 9 Apr 2013
	08:23:19 +0200
X-TM-IMSS-Message-ID: <62c55d770004a4d3@nedap.com>
Received: from [10.2.40.10] ([10.2.40.10]) by nedap.com ([10.91.8.1]) with
	ESMTP (TREND IMSS SMTP Service 7.1) id 62c55d770004a4d3 ;
	Tue, 9 Apr 2013 08:23:23 +0200
Message-ID: <5163B3D7.2000400@nedap.com>
Date: Tue, 9 Apr 2013 08:23:19 +0200
From: Jaap de Jong <jaap.dejong@nedap.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:16.0) Gecko/20121011 Thunderbird/16.0.1
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <5162B803.4090400@nedap.com> <20130408131717.GA2470@jama>
	<kjv77m$tt7$1@ger.gmane.org> <20130408201539.GD2470@jama>
In-Reply-To: <20130408201539.GD2470@jama>
Subject: Re: machinename with dash in it
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
X-List-Received-Date: Tue, 09 Apr 2013 06:40:43 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/08/2013 10:15 PM, Martin Jansa wrote:
> On Mon, Apr 08, 2013 at 09:53:34PM +0200, Koen Kooi wrote:
>> -----BEGIN PGP SIGNED MESSAGE-----
>> Hash: SHA1
>>
>> Op 08-04-13 15:17, Martin Jansa schreef:
>>> On Mon, Apr 08, 2013 at 02:28:51PM +0200, Jaap de Jong wrote:
>>>> Hi All, something strange happens with my machinename with a dash in
>>>> it: x-y If I bitbake some image it will end up that netbase is not
>>>> found. Inspection of build/tmp-angstrom_v2012_12-eglibc/work shows 2
>>>> variants of x-y: one with a dash and one where the dash is replaced by
>>>> an underscore: x-y and x_y In x-y only netbase is found, rest of the
>>>> machinespecific packages are in x_y
>>> MACHINE_ARCH is MACHINE with s/-/_/g (because rpm had issues with -) so
>>> it's expected.
>>>
>>>> Creating the image fails with the message that netbase is not found...
>>>> Any ideas?
>>> It's probably caused by
>>> https://bugzilla.yoctoproject.org/show_bug.cgi?id=4102 do manual cleanup
>>> described there and it should work fine.
>> The root cause was this one:
>> https://git.linaro.org/gitweb?p=openembedded/meta-linaro.git;a=commit;h=30f353c072336ad764e9528ae3c508adb28fa4ad
> Heh, I was expecting that all MACHINEs in PACKAGE_ARCH died long time
> ago.
>
Thanks for the hint, this is fixed now.
(I have a new error though....)
Jaap



