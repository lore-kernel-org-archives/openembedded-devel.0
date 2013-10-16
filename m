Return-Path: <Hongxu.Jia@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 3D14E6CBA4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 16 Oct 2013 03:39:36 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id r9G3dcTc011221
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Tue, 15 Oct 2013 20:39:38 -0700 (PDT)
Received: from [128.224.162.194] (128.224.162.194) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.40) with Microsoft SMTP Server id 14.2.347.0;
	Tue, 15 Oct 2013 20:39:37 -0700
Message-ID: <525E0A78.4080000@windriver.com>
Date: Wed, 16 Oct 2013 11:39:36 +0800
From: Hongxu Jia <hongxu.jia@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:24.0) Gecko/20100101 Thunderbird/24.0
MIME-Version: 1.0
To: Emil Petersen <erp@movis.dk>
References: <1378222691-13852-1-git-send-email-erp@movis.dk>
	<525E009C.1040201@windriver.com>
In-Reply-To: <525E009C.1040201@windriver.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-perl][PATCH] libdigest-md5-perl_2.53: added
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
X-List-Received-Date: Wed, 16 Oct 2013 03:39:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 10/16/2013 10:57 AM, Hongxu Jia wrote:
> On 09/03/2013 11:38 PM, Emil Petersen wrote:
>> Signed-off-by: Emil Petersen <erp@movis.dk>
>> ---
>>   .../libdigest-md5-perl/libdigest-md5-perl_2.53.bb      | 18 
>> ++++++++++++++++++
>>   1 file changed, 18 insertions(+)
>>   create mode 100644 
>> meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb
>>
>> diff --git 
>> a/meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb b/meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb 
>>
>> new file mode 100644
>> index 0000000..bbbaf2d
>> --- /dev/null
>> +++ 
>> b/meta-perl/recipes-perl/libdigest-md5-perl/libdigest-md5-perl_2.53.bb
>> @@ -0,0 +1,18 @@
>> +SUMMARY = "Digest::MD5 - Perl interface to the MD5 Algorithm"
>> +AUTHOR = "Gisle Aas <gisle@activestate.com>"
>> +HOMEPAGE = "https://metacpan.org/module/Digest::MD5"
>> +SECTION = "libs"
>> +LICENSE = "Artistic-1.0 | GPL-1.0+"
>> +LIC_FILES_CHKSUM = "file://README;md5=2f93400875dbb56f36691d5f69f3eba5"
>> +
>> +RDEPENDS_${PN} = "libdigest-base-perl"
>
> Which recipe provides libdigest-base-perl?
>

Should be RDEPENDS_${PN} = "perl-module-digest-base"

//Hongxu

> //Hongxu
>
>> +
>> +SRC_URI = 
>> "http://cpan.metacpan.org/authors/id/G/GA/GAAS/Digest-MD5-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "affc629d05c4c7b3efe4b3b874bce528"
>> +SRC_URI[sha256sum] = 
>> "cde667c0c0c8a4d819d332ba9a4cad7e9f75fc7cabd490aae405ce7bc54d5152"
>> +
>> +S = "${WORKDIR}/Digest-MD5-${PV}"
>> +
>> +inherit cpan
>> +
>> +BBCLASSEXTEND = "native"
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


