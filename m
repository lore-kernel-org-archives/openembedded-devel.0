Return-Path: <george.nita@enea.com>
Received: from mx-3.enea.com (sestofw01.enea.se [192.36.1.252])
	by mail.openembedded.org (Postfix) with SMTP id BFC6F6F9D2
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 21 Mar 2014 09:38:35 +0000 (UTC)
Received: from [192.168.14.121] (192.168.14.121) by smtp.enea.com
	(172.21.1.209) with Microsoft SMTP Server id 14.3.158.1;
	Fri, 21 Mar 2014 10:38:34 +0100
Message-ID: <532C088F.8090102@enea.com>
Date: Fri, 21 Mar 2014 11:38:23 +0200
From: George Nita <george.nita@enea.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.3.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>, Koen Kooi
	<koen@dominion.thruhere.net>
References: <1395386596-56931-1-git-send-email-george.nita@enea.com>
	<532C016C.2060309@dominion.thruhere.net>
In-Reply-To: <532C016C.2060309@dominion.thruhere.net>
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
X-List-Received-Date: Fri, 21 Mar 2014 09:38:40 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2014 11:07 AM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> George Nita schreef op 21-03-14 08:23:
>> Without fusermount the '/etc/init.d/fuse status' command exits with
>> error. Added fusermount to PACKAGES list and ensured it gets installed.
>
> How are you ensuring it gets installed? You only added a new packages, you
> haven't updated any R* variable to take the new package into account.
>
By installing fusermount into ${base_bindir}
>>
>> Signed-off-by: George Nita <george.nita@enea.com> ---
>> meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb |    5 ++++- 1 file
>> changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb
>> b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb index
>> a761932..1e8f958 100644 ---
>> a/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb +++
>> b/meta-filesystems/recipes-support/fuse/fuse_2.9.3.bb @@ -21,7 +21,8 @@
>> inherit autotools pkgconfig
>>
>> EXTRA_OECONF = "--disable-kernel-module"
>>
>> -PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr libulockmgr-dev
>> libulockmgr-dbg" +PACKAGES =+ "fuse-utils-dbg fuse-utils libulockmgr
>> libulockmgr-dev \ +             libulockmgr-dbg fusermount"
>>
>> RRECOMMENDS_${PN} = "kernel-module-fuse"
>>
>> @@ -40,4 +41,6 @@ DEBIAN_NOAUTONAME_fuse-utils-dbg = "1"
>>
>> do_install_append() { rm -rf ${D}${base_prefix}/dev +    install -d
>> ${D}${base_bindir} +    install -m 0755 ${B}/util/fusermount -t
>> ${D}${base_bindir} }
>>
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTLAFsMkyGM64RGpERAj7iAJ9imAv8fVGxLzkGfEY1M3iyyGbnHwCeKtaa
> GyHWWpd05haNOE69NMQQLaA=
> =XU/E
> -----END PGP SIGNATURE-----
>


-- 
Best regards,
George Nita

