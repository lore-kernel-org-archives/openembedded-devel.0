Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PmsEl-0001x0-Qr for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 19:24:27 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1PmsDn-00073L-2G for openembedded-devel@lists.openembedded.org;
	Tue, 08 Feb 2011 19:23:27 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 19:23:27 +0100
Received: from k.kooi by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim
	0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 19:23:27 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Tue, 08 Feb 2011 19:23:12 +0100
Message-ID: <iis1mg$tj9$1@dough.gmane.org>
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>
	<4D517D6C.3070604@mentor.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.16) Gecko/20101127 Shredder/3.0.11pre
In-Reply-To: <4D517D6C.3070604@mentor.com>
X-Enigmail-Version: 1.0.1
Subject: Re: [PATCH] task-base: conditional wifi and bluetooth tasks in PACKAGES
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
X-List-Received-Date: Tue, 08 Feb 2011 18:24:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 08-02-11 18:29, Tom Rini wrote:
> On 02/07/2011 03:13 PM, Filip Zyzniewski wrote:
>> This reduces amount of tasks for bootstrap-image from around 3400 to
>> around 1600 for jlime.
>>
>> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
> 
> Can some of the other distro folks chime in here?

Yeah, this patch is wrong, since task-base is supposed to drag in bt and
wifi when it's available which includes usb, pci, serial, etc.

> 
>> ---
>>   recipes/tasks/task-base.bb |    6 +++---
>>   1 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
>> index 32d871d..c8d6df7 100644
>> --- a/recipes/tasks/task-base.bb
>> +++ b/recipes/tasks/task-base.bb
>> @@ -1,5 +1,5 @@
>>   DESCRIPTION = "Merge machine and distro options to create a basic
>> machine task/package"
>> -PR = "r92"
>> +PR = "r93"
>>
>>   inherit task
>>
>> @@ -31,8 +31,8 @@ PACKAGES = ' \
>>               ${@base_contains("MACHINE_FEATURES", "redboot",
>> "task-base-redboot", "",d)} \
>>               ${@base_contains("MACHINE_FEATURES", "apex",
>> "task-base-apex", "",d)} \
>>               \
>> -            task-base-bluetooth \
>> -            task-base-wifi \
>> +            ${@base_contains("MACHINE_FEATURES", "bluetooth",
>> "task-base-bluetooth", "",d)} \
>> +            ${@base_contains("MACHINE_FEATURES", "wifi",
>> "task-base-wifi", "",d)} \
>>               \
>>               ${@base_contains("DISTRO_FEATURES", "cramfs",
>> "task-base-cramfs", "", d)} \
>>               ${@base_contains("DISTRO_FEATURES", "ipsec",
>> "task-base-ipsec", "", d)} \
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFNUYoQMkyGM64RGpERAuFAAJ9Y5jiml8NdBJpg5XmD7b8BlwjjFQCfXL8H
xuKrNII4OscMLUu/S2dAejQ=
=j2V5
-----END PGP SIGNATURE-----



