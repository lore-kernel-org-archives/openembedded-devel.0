Return-Path: <Rongqing.Li@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id E31EE7061E
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 17 Jul 2014 12:29:42 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.5) with ESMTP id s6HCTd1H003454
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Thu, 17 Jul 2014 05:29:39 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.169.1;
	Thu, 17 Jul 2014 05:29:38 -0700
Message-ID: <53C7C1B4.2010204@windriver.com>
Date: Thu, 17 Jul 2014 20:29:40 +0800
From: Rongqing Li <rongqing.li@windriver.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/20130623 Thunderbird/17.0.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
References: <1405058909-12162-1-git-send-email-rongqing.li@windriver.com>
	<20140716140341.GC2433@jama>
In-Reply-To: <20140716140341.GC2433@jama>
Subject: Re: [PATCH 2/3][meta-perl] libxml-filter-buffertext-perl: add recipe
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
X-List-Received-Date: Thu, 17 Jul 2014 12:29:46 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 07/16/2014 10:03 PM, Martin Jansa wrote:
> On Fri, Jul 11, 2014 at 02:08:29PM +0800, rongqing.li@windriver.com wrote:
>> From: Roy Li <rongqing.li@windriver.com>
>>
>> Signed-off-by: Roy Li <rongqing.li@windriver.com>
>> ---
>>   .../libxml/libxml-filter-buffertext-perl_1.01.bb   |   27 ++++++++++++++++++++
>>   1 file changed, 27 insertions(+)
>>   create mode 100644 meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
>>
>> diff --git a/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
>> new file mode 100644
>> index 0000000..0fbeeb5
>> --- /dev/null
>> +++ b/meta-perl/recipes-perl/libxml/libxml-filter-buffertext-perl_1.01.bb
>> @@ -0,0 +1,27 @@
>> +SUMMARY = "XML::Filter::BufferText - Filter to put all characters() in one event"
>> +DESCRIPTION = "\
>> +The XML::Filter::BufferText module is a very simple filter.  One common \
>> +cause of grief (and programmer error) is that XML parsers aren't required \
>> +to provide character events in one chunk.  They can, but are not forced \
>> +to, and most don't.  This filter does the trivial but oft-repeated task \
>> +of putting all characters into a single event. \
>> +"
>> +SECTION = "libs"
>> +LICENSE = "Artistic-1.0 | GPLv1+"
>> +HOMEPAGE = "http://search.cpan.org/dist/XML-Filter-BufferText/"
>> +DEPENDS += "libxml-sax-perl-native"
>> +RDEPENDS_${PN} += "libxml-sax-perl"
>> +
>> +SRC_URI = "http://search.cpan.org/CPAN/authors/id/R/RB/RBERJON/XML-Filter-BufferText-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "2992c0387632583b966ab9c965b25512"
>> +SRC_URI[sha256sum] = "8fd2126d3beec554df852919f4739e689202cbba6a17506e9b66ea165841a75c"
>> +
>> +LIC_FILES_CHKSUM = "file://BufferText.pm;beginline=88;endline=90;md5=497aa6d79cc84c3d769a2a0016bee928"
>> +
>> +S = "${WORKDIR}/XML-Filter-BufferText-${PV}"
>> +
>> +inherit cpan
>> +
>> +BBCLASSEXTEND = "native"
>> +
>> +PACKAGE_ARCH = "all"
>
> This doesn't seem right, see
> http://lists.openembedded.org/pipermail/openembedded-core/2014-July/094409.html
>


It should inherit allarch, not define PACKAGE_ARCH to all.

but I test, it seems unable to fix this issue, the abi is included into
./all-poky-linux/libxml-sax-writer-perl
./all-poky-linux-gnueabi/libxml-sax-writer-perl



-Roy

>
>

-- 
Best Reagrds,
Roy | RongQing Li

