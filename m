Return-Path: <george.nita@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id 239256F9BB
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 16:49:19 +0000 (UTC)
Received: from [192.168.14.121] (192.168.14.121) by smtp.enea.com
	(172.21.1.208) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 21 Mar 2014 17:49:13 +0100
Message-ID: <532C6D7E.4070504@enea.com>
Date: Fri, 21 Mar 2014 18:49:02 +0200
From: George Nita <george.nita@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Koen Kooi
	<koen@dominion.thruhere.net>
References: <1395386596-56931-1-git-send-email-george.nita@enea.com>	<532C016C.2060309@dominion.thruhere.net>	<532C088F.8090102@enea.com>
	<lgh6ub$tbs$1@ger.gmane.org>
In-Reply-To: <lgh6ub$tbs$1@ger.gmane.org>
X-Originating-IP: [192.168.14.121]
Subject: Re: [meta-filesystems] [PATCH] Add fusermount to fuse by default
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 21 Mar 2014 16:49:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2014 01:15 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> George Nita schreef op 21-03-14 10:38:
>> On 03/21/2014 11:07 AM, Koen Kooi wrote: George Nita schreef op 21-03-14
>> 08:23:
>>>>> Without fusermount the '/etc/init.d/fuse status' command exits
>>>>> with error. Added fusermount to PACKAGES list and ensured it gets
>>>>> installed.
>>
>> How are you ensuring it gets installed? You only added a new packages,
>> you haven't updated any R* variable to take the new package into
>> account.
>>
>>> By installing fusermount into ${base_bindir}
>
> So what you're saying is that /bin/fusermount ends up in 'fuse-utils' and
> you're just adding 'fusermount' to PACKAGES because it looks cool? I get
> that you want to have /bin/fusermount installed on your system, but I don't
> get what your patch is doing.
You're right, no need to add 'fusermount' to PACKAGES.
However, in order to get fusermount in the image root file system:
- add installation lines in code as in my patch or similar
- delete the 2 lines that assign to FILES_fuse-utils and 
FILES_fuse-utils-dbg
- something else (what ?)

> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTLB9GMkyGM64RGpERAn6/AJ4oqRW3F4Y+bXvOuAg9sUQEZGIGJgCcCeSj
> BDhkv5mcw4UZjB56C5zJmso=
> =a1Ip
> -----END PGP SIGNATURE-----
>


-- 
Best regards,
George Nita

