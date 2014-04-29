Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 16011609B1
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 07:55:38 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3T7tdJK029966
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 29 Apr 2014 00:55:39 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Tue, 29 Apr 2014 00:55:38 -0700
Message-ID: <535F5AF7.9050607@windriver.com>
Date: Tue, 29 Apr 2014 15:55:35 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1398756121-13263-1-git-send-email-Chong.Lu@windriver.com>
	<ljnl9v$2fs$1@ger.gmane.org>
In-Reply-To: <ljnl9v$2fs$1@ger.gmane.org>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V6] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Tue, 29 Apr 2014 07:55:39 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/29/2014 03:45 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Chong Lu schreef op 29-04-14 09:22:
>> 1. default enable perl and python bindings 2. rrdtool uses perl.real,
>> perl.real doesn't know where the PERL5LIB should be when prebuilts are
>> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes
>> perl.real 3. While using dash as /bin/sh, subsequent commands in
>> functions will not use the environment variables passed to the function
>> call line unless explicitly run "export ENV_VAR". 4. delete unrecognized
>> options: "--enable-local-libpng" and "--enable-local-zlib"
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> ---
>> meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |   92
>> +++++++++++++++++++-- 1 file changed, 86 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
>> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb index
>> 533451f..e337529 100644 ---
>> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb +++
>> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb @@ -15,25 +15,105 @@
>> SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
>> +PACKAGES += "${PN}-perl ${PN}-python"
> That needs to move below do_install, since it's a packaging var
> (PACKAGE_CONFIG is actually recipe-config, so those go above do_configure).
> Also, do you need =+ here instead of +=?
Ok, thanks.
=+ is better here.

Chong
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTX1iBMkyGM64RGpERAg1aAJ0YiuDvRTjWQzenMhHx9RSdCmW1aQCdF/zD
> Ow07E6UIg9o56HoTzQrQ14U=
> =fzFu
> -----END PGP SIGNATURE-----
>


