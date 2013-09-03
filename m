Return-Path: <erp@movis.dk>
Received: from clobix.com (mail.clobix.com [54.229.118.53])
	by mail.openembedded.org (Postfix) with ESMTP id 9DA686BEF5
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  3 Sep 2013 14:57:12 +0000 (UTC)
Received: (qmail 25493 invoked by uid 89); 3 Sep 2013 14:57:02 -0000
Received: from unknown (HELO ?10.0.0.129?) (erp@movis.dk@::ffff:83.93.56.101)
	by 0 with ESMTPA; 3 Sep 2013 14:57:02 -0000
Message-ID: <5225F8A9.9040700@movis.dk>
Date: Tue, 03 Sep 2013 16:56:41 +0200
From: "Emil R. Petersen" <erp@movis.dk>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.12) Gecko/20130116 Icedove/10.0.12
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1378219999-12757-1-git-send-email-erp@movis.dk>
	<CAOMwXhPf33o2i_Ci6pRYe-j1ZYnF7ronJ7-8ydrA1Z9b=BLzWA@mail.gmail.com>
In-Reply-To: <CAOMwXhPf33o2i_Ci6pRYe-j1ZYnF7ronJ7-8ydrA1Z9b=BLzWA@mail.gmail.com>
Subject: Re: [PATCH] libcarp-perl: added
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
X-List-Received-Date: Tue, 03 Sep 2013 14:57:13 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I suppose? I'll do that if you want.
If you're putting it to me as a question - No idea!
As a request, then sure.

On 03/09/13 16:55, Laszlo Papp wrote:
> Hmm, shouldn't you mention in the commit message which version just in case?
>
>
> On Tue, Sep 3, 2013 at 3:53 PM, Emil Petersen<erp@movis.dk>  wrote:
>
>> Carp recipe added
>>
>> Signed-off-by: Emil Petersen<erp@movis.dk>
>> ---
>>   .../recipes-perl/libcarp-perl/libcarp-perl_1.26.bb | 25
>> ++++++++++++++++++++++
>>   1 file changed, 25 insertions(+)
>>   create mode 100644 meta-perl/recipes-perl/libcarp-perl/
>> libcarp-perl_1.26.bb
>>
>> diff --git a/meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bbb/meta-perl/recipes-perl/libcarp-perl/
>> libcarp-perl_1.26.bb
>> new file mode 100644
>> index 0000000..0ae7bf3
>> --- /dev/null
>> +++ b/meta-perl/recipes-perl/libcarp-perl/libcarp-perl_1.26.bb
>> @@ -0,0 +1,25 @@
>> +SUMMARY = "Carp - alternative warn and die for modules"
>> +AUTHOR = "Andrew Main<zefram@fysk.org>"
>> +HOMEPAGE = "https://metacpan.org/module/Carp"
>> +SECTION = "libs"
>> +LICENSE = "Artistic-1.0 | GPL-1.0+"
>> +LIC_FILES_CHKSUM = "file://README;md5=d613c00d4cb8d48c01f09fca2a7873a0"
>> +
>> +RPROVIDES_${PN} = "libcarp-heavy-perl"
>> +
>> +RDEPENDS_${PN} += "perl-module-strict \
>> +                   perl-module-warnings \
>> +                   libexporter-perl \
>> +                   libtest-more-perl \
>> +                  "
>> +
>> +SRC_URI = "
>> http://cpan.metacpan.org/authors/id/Z/ZE/ZEFRAM/Carp-${PV}.tar.gz"
>> +SRC_URI[md5sum] = "86229a6f0dc44e0730f96c1909bb346d"
>> +SRC_URI[sha256sum] =
>> "0a310222a9a52eca9425bca19e6d8e04faa8bb4f64d5c16f2f6cce8190c0a99b"
>> +
>> +S = "${WORKDIR}/Carp-${PV}"
>> +
>> +inherit cpan
>> +
>> +BBCLASSEXTEND = "native"
>> +
>> --
>> 1.8.4.rc3
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel
>>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.openembedded.org/mailman/listinfo/openembedded-devel

