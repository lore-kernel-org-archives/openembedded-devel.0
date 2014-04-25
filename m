Return-Path: <Chong.Lu@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id 6EBCC65D2E
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 08:22:10 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.14.5/8.14.5) with ESMTP id s3P8MAr5021282
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL)
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 25 Apr 2014 01:22:10 -0700 (PDT)
Received: from [128.224.162.204] (128.224.162.204) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server (TLS) id 14.3.169.1;
	Fri, 25 Apr 2014 01:22:10 -0700
Message-ID: <535A1B2F.1010909@windriver.com>
Date: Fri, 25 Apr 2014 16:22:07 +0800
From: Chong Lu <Chong.Lu@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1398392569-1412-1-git-send-email-Chong.Lu@windriver.com>
	<535A126F.1010300@dominion.thruhere.net>
In-Reply-To: <535A126F.1010300@dominion.thruhere.net>
X-Originating-IP: [128.224.162.204]
Subject: Re: [PATCH V5] rrdtool: enable perl and python bindings
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
X-List-Received-Date: Fri, 25 Apr 2014 08:22:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 04/25/2014 03:44 PM, Koen Kooi wrote:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>
> Chong Lu schreef op 25-04-14 04:22:
>> 1. default enable perl and python bindings 2. rrdtool uses perl.real,
>> perl.real doesn't know where the PERL5LIB should be when prebuilts are
>> used. Use the wrapper perl instead, perl sets PERL5LIB and invokes
>> perl.real 3. While using dash as /bin/sh, subsequent commands in
>> functions will not use the environment variables passed to the function
>> call line unless explicitly run "export ENV_VAR". 4. delete unrecognized
>> options: "--enable-local-libpng" and "--enable-local-zlib"
>>
>> Signed-off-by: Chong Lu <Chong.Lu@windriver.com> ---
>> meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb |  129
>> ++++++++++++++++++++- 1 file changed, 123 insertions(+), 6 deletions(-)
>>
>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb
>> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb index
>> 533451f..36785cd 100644 ---
>> a/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb +++
>> b/meta-oe/recipes-extended/rrdtool/rrdtool_1.4.7.bb @@ -15,25 +15,142 @@
>> SRC_URI = "http://oss.oetiker.ch/rrdtool/pub/rrdtool-${PV}.tar.gz \
>> SRC_URI[md5sum] = "ffe369d8921b4dfdeaaf43812100c38f" SRC_URI[sha256sum] =
>> "956aaf431c955ba88dd7d98920ade3a8c4bad04adb1f9431377950a813a7af11"
>>
>> -inherit autotools gettext +inherit autotools gettext pythonnative
>> perlnative python-dir
>>
>> EXTRA_AUTORECONF = "-I m4"
>>
>> -PACKAGECONFIG ??= "" +PACKAGECONFIG ??= "python perl" +
>> +PACKAGES_DYNAMIC += "^${PN}-perl ^${PN}-python"
> No, just no. Martin said 'Add it to PACKAGES'.
>
If I add it to PACKAGES, I will get following errors:
ERROR: QA Issue: rrdtool-perl is listed in PACKAGES multiple times, this 
leads to packaging errors.
ERROR: QA Issue: rrdtool-python is listed in PACKAGES multiple times, 
this leads to packaging errors.
>> +python populate_packages_prepend() { +    def fill_more(name,
>> rdep=None): +        if name is None or name.strip() == "": +
>> return + +        fpack=d.getVar('PACKAGES') or "" +
>> fpack="${PN}-" + name + " " + fpack +        d.setVar('PACKAGES', fpack)
>> +        if rdep is not None: +
>> prdep=d.getVar('RDEPENDS_${PN}-' + name) or "" +            prdep=rdep +
>> " " + prdep +            d.setVar('RDEPENDS_${PN}-' + name, prdep) + +
>> prdep=d.getVar('RDEPENDS_${PN}-' + name) or "" +            bb.debug(1,
>> "RDEPENDS_${PN}-" + name + "=" + prdep) + +
>> conf=(d.getVar('PACKAGECONFIG', True) or "").split() +
>> pack=d.getVar('PACKAGES') or "" +    bb.debug(1, "PACKAGECONFIG=%s" %
>> conf) +    bb.debug(1, "PACKAGES1=%s" % pack ) + +    if "perl" in conf
>> : +        fill_more("perl") + +    if "python" in conf: +
>> fill_more("python") + +    pack=d.getVar('PACKAGES', True) or "" +
>> bb.debug(1, "PACKAGES after=%s" % pack) + +    #debug code +
>> #prdep=d.getVar('RDEPENDS_${PN}') or "" +    #bb.debug(1,
>> "RDEPENDS_${PN}" + "=" + prdep) +    #prdep=d.getVar('RDEPENDS') or "" +
>> #bb.debug(1, "RDEPENDS" + "=" + prdep) +}
> What is this?
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v1.4.5 (Darwin)
> Comment: GPGTools - http://gpgtools.org
>
> iD8DBQFTWhJvMkyGM64RGpERArXTAJ4u1918rurp4h7aTEX6wW2/J0C+IgCeLLQc
> ALaeAdoJhjuntnDEx23edT0=
> =0QxD
> -----END PGP SIGNATURE-----


