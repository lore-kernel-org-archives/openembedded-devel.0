Received: from na3sys009aog102.obsmtp.com ([74.125.149.69])
	by linuxtogo.org with smtp (Exim 4.72)
	(envelope-from <douglas.royds@taitradio.com>) id 1PmygP-00023r-Ak
	for openembedded-devel@lists.openembedded.org;
	Wed, 09 Feb 2011 02:17:25 +0100
Received: from source ([209.85.161.48]) (using TLSv1) by
	na3sys009aob102.postini.com ([74.125.148.12]) with SMTP
	ID DSNKTVHq5nO0wrap6iMiXEghqG0mf7wNIeNY@postini.com;
	Tue, 08 Feb 2011 17:16:24 PST
Received: by mail-fx0-f48.google.com with SMTP id 2so7077706fxm.35
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 08 Feb 2011 17:16:22 -0800 (PST)
Received: by 10.223.101.136 with SMTP id c8mr1423034fao.100.1297198751620;
	Tue, 08 Feb 2011 12:59:11 -0800 (PST)
Received: from [172.25.113.34] ([202.37.96.91])
	by mx.google.com with ESMTPS id j12sm1936246fax.9.2011.02.08.12.59.09
	(version=SSLv3 cipher=RC4-MD5); Tue, 08 Feb 2011 12:59:10 -0800 (PST)
Message-ID: <4D51AEA4.4010702@taitradio.com>
Date: Wed, 09 Feb 2011 09:59:16 +1300
From: Douglas Royds <douglas.royds@taitradio.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.2.13) Gecko/20101208 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1297116822-30938-1-git-send-email-filip.zyzniewski@gmail.com>	<4D517D6C.3070604@mentor.com>
	<iis1mg$tj9$1@dough.gmane.org>
In-Reply-To: <iis1mg$tj9$1@dough.gmane.org>
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
X-List-Received-Date: Wed, 09 Feb 2011 01:17:25 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/11 07:23, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> On 08-02-11 18:29, Tom Rini wrote:
>> On 02/07/2011 03:13 PM, Filip Zyzniewski wrote:
>>> This reduces amount of tasks for bootstrap-image from around 3400 to
>>> around 1600 for jlime.
>>>
>>> Signed-off-by: Filip Zyzniewski<filip.zyzniewski@gmail.com>
>> Can some of the other distro folks chime in here?
> Yeah, this patch is wrong, since task-base is supposed to drag in bt and
> wifi when it's available which includes usb, pci, serial, etc.

I believe Filip's patch is correct, in removing them from the PACKAGES 
list when these features are not set.

task-base already checks the MACHINE_FEATURES and DISTRO_FEATURES for 
bluetooth and wifi:

    RDEPENDS_task-base = "\
         ...
         ${@base_contains('COMBINED_FEATURES', 'bluetooth',
    'task-base-bluetooth', '',d)} \
         ${@base_contains('COMBINED_FEATURES', 'wifi', 'task-base-wifi',
    '',d)} \
         ...

The dependency on usb, pci, etc. is implemented in a python __anonymous 
function lower down in the file.


>>> ---
>>>    recipes/tasks/task-base.bb |    6 +++---
>>>    1 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/recipes/tasks/task-base.bb b/recipes/tasks/task-base.bb
>>> index 32d871d..c8d6df7 100644
>>> --- a/recipes/tasks/task-base.bb
>>> +++ b/recipes/tasks/task-base.bb
>>> @@ -1,5 +1,5 @@
>>>    DESCRIPTION = "Merge machine and distro options to create a basic
>>> machine task/package"
>>> -PR = "r92"
>>> +PR = "r93"
>>>
>>>    inherit task
>>>
>>> @@ -31,8 +31,8 @@ PACKAGES = ' \
>>>                ${@base_contains("MACHINE_FEATURES", "redboot",
>>> "task-base-redboot", "",d)} \
>>>                ${@base_contains("MACHINE_FEATURES", "apex",
>>> "task-base-apex", "",d)} \
>>>                \
>>> -            task-base-bluetooth \
>>> -            task-base-wifi \
>>> +            ${@base_contains("MACHINE_FEATURES", "bluetooth",
>>> "task-base-bluetooth", "",d)} \
>>> +            ${@base_contains("MACHINE_FEATURES", "wifi",
>>> "task-base-wifi", "",d)} \
>>>                \
>>>                ${@base_contains("DISTRO_FEATURES", "cramfs",
>>> "task-base-cramfs", "", d)} \
>>>                ${@base_contains("DISTRO_FEATURES", "ipsec",
>>> "task-base-ipsec", "", d)} \
>>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
>
> iD8DBQFNUYoQMkyGM64RGpERAuFAAJ9Y5jiml8NdBJpg5XmD7b8BlwjjFQCfXL8H
> xuKrNII4OscMLUu/S2dAejQ=
> =j2V5
> -----END PGP SIGNATURE-----
>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel

=======================================================================
This email, including any attachments, is only for the intended
addressee.  It is subject to copyright, is confidential and may be
the subject of legal or other privilege, none of which is waived or
lost by reason of this transmission.
If the receiver is not the intended addressee, please accept our
apologies, notify us by return, delete all copies and perform no
other act on the email.
Unfortunately, we cannot warrant that the email has not been
altered or corrupted during transmission.
=======================================================================



