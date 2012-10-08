Received: from mail.windriver.com ([147.11.1.11])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Jackie.Huang@windriver.com>) id 1TL64o-0000Vo-2l
	for openembedded-devel@lists.openembedded.org;
	Mon, 08 Oct 2012 07:40:26 +0200
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.14.5/8.14.3) with ESMTP id q985RGLA014631
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 7 Oct 2012 22:27:17 -0700 (PDT)
Received: from [128.224.162.159] (128.224.162.159) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.2.309.2;
	Sun, 7 Oct 2012 22:27:16 -0700
Message-ID: <50726433.6060409@windriver.com>
Date: Mon, 8 Oct 2012 13:27:15 +0800
From: jhuang0 <jackie.huang@windriver.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:15.0) Gecko/20120907 Thunderbird/15.0.1
MIME-Version: 1.0
To: Andrei Gherzan <andrei@gherzan.ro>
References: <1349401196-24611-1-git-send-email-jackie.huang@windriver.com>
	<CAK18fxHsc8BjjkbS=Xo5zBHO6OEWx9GYUraND1Lv16u-n=r59Q@mail.gmail.com>
In-Reply-To: <CAK18fxHsc8BjjkbS=Xo5zBHO6OEWx9GYUraND1Lv16u-n=r59Q@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-oe][PATCH v3] iw: add iw 3.6 recipe
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
X-List-Received-Date: Mon, 08 Oct 2012 05:40:26 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit



On 10/5/2012 6:20 PM, Andrei Gherzan wrote:
> Hello,
>
> On Fri, Oct 5, 2012 at 4:39 AM, <jackie.huang@windriver.com> wrote:
>
>> iw: add iw 3.6 recipe
>>
>
> Don't copy the subject here.
>
>
>>
>> Signed-off-by: Jackie Huang <jackie.huang@windriver.com>
>> ---
>>   meta-oe/recipes-connectivity/iw/iw_3.6.bb |   23 +++++++++++++++++++++++
>>   1 files changed, 23 insertions(+), 0 deletions(-)
>>   create mode 100644 meta-oe/recipes-connectivity/iw/iw_3.6.bb
>>
>> diff --git a/meta-oe/recipes-connectivity/iw/iw_3.6.bbb/meta-oe/recipes-connectivity/iw/
>> iw_3.6.bb
>> new file mode 100644
>> index 0000000..42a43c3
>> --- /dev/null
>> +++ b/meta-oe/recipes-connectivity/iw/iw_3.6.bb
>> @@ -0,0 +1,23 @@
>> +SUMMARY = "nl80211 based CLI configuration utility for wireless devices"
>> +DESCRIPTION = "iw is a new nl80211 based CLI configuration utility for \
>> +wireless devices. It supports almost all new drivers that have been added
>> \
>> +to the kernel recently. "
>> +HOMEPAGE = "http://linuxwireless.org/en/users/Documentation/iw"
>> +SECTION = "base"
>> +LICENSE = "BSD"
>> +LIC_FILES_CHKSUM = "file://COPYING;md5=878618a5c4af25e9b93ef0be1a93f774"
>> +
>> +DEPENDS = "libnl pkgconfig"
>> +
>> +SRC_URI = "http://wireless.kernel.org/download/iw/${P}.tar.bz2 \
>> +
>> file://0001-iw-version.sh-don-t-use-git-describe-for-versioning.patch \
>> +          "
>> +
>> +SRC_URI[md5sum] = "1c18bfbbc8773629e5e8ac733a39540c"
>> +SRC_URI[sha256sum] =
>> "df11036ac11df31f44083da962a6e9c74bdea7c01c596c4b5840f948cdb6c857"
>> +
>> +EXTRA_OEMAKE = ""
>> +
>>
>
> Do you really need this?

Yes, in the Makefile, pkg-config commands is used to get libraries info 
and then modify CFLAGS and LIBS accordingly, but they will be overrode 
with the -e option in typical EXTRA_OEMAKE, so I need this to drop the 
-e option.

>
> +do_install() {
>> +       oe_runmake DESTDIR=${D} install
>>
>
> Why don't you add DESTDIR=${D} to EXTRA_OEMAKE and drop the install rule?

It will do nothing with the default intall rule, I just kept the same 
way used in the 3.2 recipe.

Thanks,
Jackie

>
> ag
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>

-- 
Jackie Huang
WIND RIVER | China Development Center
MSN:jackielily@hotmail.com
Tel: +86 8477 8594
Mobile: +86 138 1027 4745


