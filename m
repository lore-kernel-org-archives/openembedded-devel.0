Return-Path: <Chong.Lu@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 2A0A965D08
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:21:47 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s3P1LmY9017887
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 24 Apr 2014 18:21:48 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Thu, 24 Apr 2014 18:21:47 -0700
Message-ID: <5359B8A8.7010801@windriver.com>
Date: Fri, 25 Apr 2014 09:21:44 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1398323681-19373-1-git-send-email-Chong.Lu@windriver.com>
	<5358DE99.40604@dominion.thruhere.net>
In-Reply-To: <5358DE99.40604@dominion.thruhere.net>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V4] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Fri, 25 Apr 2014 01:21:48 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/24/2014 05:51 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Chong Lu schreef op 24-04-14 09:14:
>> 1. default enable perl and python bindings 2. rrdtool uses perl.real,
>> perl.real doesn't know where the PERL5LIB should be when prebuilts are
>> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes
>> perl.real 3. While using dash as /bin/sh, subsequent commands in
>> functions will not use the environment variables passed to the function
>> call line unless explicitly run "export ENV_VAR". 4. delete unrecognized
>> options: "--enable-local-libpng" and "--enable-local-zlib"
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> ---
>> +DESCRIPTION_${PN}-perl = \ +"The ${PN}-perl package includes RRDtool
>> bindings for perl." +FILES_${PN}-perl =
>> "${libdir}/perl/vendor_perl/*/*.pm ${datadir}/${PN}/examples \ +
>> ${libdir}/perl/vendor_perl/*/auto/RRDs/RRDs.*" +RDEPENDS_${PN}-perl =
>> "perl perl-module-lib perl-module-getopt-long perl-module-time-hires \ +
>> perl-module-io-file perl-module-ipc-open2 perl-module-io-socket"
>> +RPROVIDES_${PN} += "${PN}-perl"
> Why do you need RPROVIDES?
>
>
>> + +DESCRIPTION_${PN}-python = \ +"The ${PN}-python package includes
>> RRDtool bindings for python." +FILES_${PN}-python =
>> "${libdir}/python${PYTHON_BASEVERSION}/site-packages/*"
>> +RDEPENDS_${PN}-python = "python" +RPROVIDES_${PN} += "${PN}-python"
> Why do you need RPROVIDES?
If I put rrdtool-python into image.
I got following errors when I built image.
     Nothing RPROVIDES 'rrdtool-python'
So, I added RPROVIDES.

Best Regards
Chong
>
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTWN6ZMkyGM64RGpERAiAuAKCSrfa70haQRDE5fE8JNW4ggq280gCeP1Va
> ZhT7mk+HdHXQQXu7MKk17jw=
> =QukM
> -----END PGP SIGNATURE-----


