Return-Path: <akuster808@gmail.com>
Received: from mail-pa0-f54.google.com (mail-pa0-f54.google.com
	[209.85.220.54])
	by mail.openembedded.org (Postfix) with ESMTP id B7FC272607
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 21:53:26 +0000 (UTC)
Received: by mail-pa0-f54.google.com with SMTP id fb1so14883084pad.41
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 16 Dec 2014 13:53:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=b7xwaBp6k081DQy2oAf2Z5QLeoiwBU9eCUNCXw59TFA=;
	b=agsxhwOvAtoGd6EsJyzhWZlrjsuuL7JaETl1+72I39ejsLF55NnclXu8Mj+g2XN20M
	MMOMw4ejzHkHN3rzOXPWiezY6aoPLCXN6iMe5y1/UfntXGkxd224oPE8/MYGS8Sz5Aux
	PIn7SyyX8XeZySYSUyAlXFhDX8xuWrAyJBw5oTsJFuOHrgRpbMIi8Ta9fH2LGZx1FY8p
	dDjXf0k8Au8y2c8PvZReRJpzV4vC0FwpkxvyBB2aUt9TMxsLpknW5ZQYiOUhBfOyMNBF
	ayuUD/0Of+r3G9k66sTdM9SWUlpeEjq3REB8SI04lVQZ4KCQ4YgoL6ucYYgpd0Y9c4Dd
	geIg==
X-Received: by 10.68.235.5 with SMTP id ui5mr64044416pbc.152.1418766807374;
	Tue, 16 Dec 2014 13:53:27 -0800 (PST)
Received: from [10.43.100.29] (64.2.3.194.ptr.us.xo.net. [64.2.3.194])
	by mx.google.com with ESMTPSA id kl7sm1945625pdb.10.2014.12.16.13.53.25
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 16 Dec 2014 13:53:26 -0800 (PST)
Message-ID: <5490A9D4.8040806@gmail.com>
Date: Tue, 16 Dec 2014 13:53:24 -0800
From: akuster808 <akuster808@gmail.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.3.0
MIME-Version: 1.0
To: Hongxu Jia <hongxu.jia@windriver.com>, 
	openembedded-devel@lists.openembedded.org
References: <1418662550-13436-1-git-send-email-akuster808@gmail.com>
	<548F8C66.5080005@windriver.com>
In-Reply-To: <548F8C66.5080005@windriver.com>
Subject: Re: [meta-perl][PATCH 1/4] lib-perl: move package from meta-security to meta-perl
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
X-List-Received-Date: Tue, 16 Dec 2014 21:53:30 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit



On 12/15/2014 05:35 PM, Hongxu Jia wrote:
> On 12/16/2014 12:55 AM, Armin Kuster wrote:
>> please consider this common package for meta-perl.
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>   meta-perl/recipes-perl/libperl/lib-perl_0.63.bb | 28
>> +++++++++++++++++++++++++
>>   1 file changed, 28 insertions(+)
>>   create mode 100644 meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
>
> We have a another lib-perl in oe-core
> (meta/recipes-devtools/perl/perl_5.20.0.bb),
> Are they the same?
I am not sure.

lib-perl is a small simple module which simplifies the manipulation of 
@INC at compile time.

I don't know if perl_5.20 includes this.

If not, how about rename the recipe?

It looks like on cpan.org it is refereed to a just 'lib'.

I can rename it to that.


> Others is fine to me.

great.

Kind regards,
Armin
>
> //Hongxu
>
>>
>> diff --git a/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
>> b/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
>> new file mode 100644
>> index 0000000..7895864
>> --- /dev/null
>> +++ b/meta-perl/recipes-perl/libperl/lib-perl_0.63.bb
>> @@ -0,0 +1,28 @@
>> +DESCRIPTION = "This is a small simple module which simplifies the \
>> +manipulation of @INC at compile time. It is typically used to add
>> extra \
>> +directories to Perl's search path so that later 'use' or 'require'
>> statements \
>> +will find modules which are not located in the default search path."
>> +
>> +SECTION = "libs"
>> +LICENSE = "Artistic-1.0 | GPL-1.0+"
>> +PR = "r0"
>> +
>> +LIC_FILES_CHKSUM =
>> "file://README;beginline=26;endline=30;md5=94b119f1a7b8d611efc89b5d562a1a50"
>>
>> +
>> +DEPENDS += "perl"
>> +
>> +SRC_URI =
>> "http://www.cpan.org/authors/id/S/SM/SMUELLER/lib-${PV}.tar.gz"
>> +
>> +SRC_URI[md5sum] = "8607ac4e0d9d43585ec28312f52df67c"
>> +SRC_URI[sha256sum] =
>> "72f63db9220098e834d7a38231626bd0c9b802c1ec54a628e2df35f3818e5a00"
>> +
>> +S = "${WORKDIR}/lib-${PV}"
>> +
>> +EXTRA_CPANFLAGS = "EXPATLIBPATH=${STAGING_LIBDIR}
>> EXPATINCPATH=${STAGING_INCDIR}"
>> +
>> +inherit cpan
>> +
>> +do_compile() {
>> +    export LIBC="$(find ${STAGING_DIR_TARGET}/${base_libdir}/ -name
>> 'libc-*.so')"
>> +    cpan_do_compile
>> +}
>

