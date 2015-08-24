Return-Path: <Kai.Kang@windriver.com>
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by mail.openembedded.org (Postfix) with ESMTP id 551AD73F8C
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 24 Aug 2015 02:24:53 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id t7O2OrNN010316
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Sun, 23 Aug 2015 19:24:53 -0700 (PDT)
Received: from [128.224.162.231] (128.224.162.231) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.235.1;
	Sun, 23 Aug 2015 19:24:52 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <1440146235-9630-1-git-send-email-kai.kang@windriver.com>
	<1440146235-9630-3-git-send-email-kai.kang@windriver.com>
	<CAMKF1srhV4VSLeNXahHGytoyH+=BbtW-gn0iyO6Nvzh_YMzDKQ@mail.gmail.com>
From: Kang Kai <Kai.Kang@windriver.com>
Message-ID: <55DA807A.3010107@windriver.com>
Date: Mon, 24 Aug 2015 10:24:58 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:38.0) Gecko/20100101
	Thunderbird/38.2.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1srhV4VSLeNXahHGytoyH+=BbtW-gn0iyO6Nvzh_YMzDKQ@mail.gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-networking][PATCH 2/4] atftp: build with gcc 5.2
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
X-List-Received-Date: Mon, 24 Aug 2015 02:24:56 -0000
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 2015年08月22日 00:08, Khem Raj wrote:
> On Fri, Aug 21, 2015 at 1:37 AM,  <kai.kang@windriver.com> wrote:
>> From: Kai Kang <kai.kang@windriver.com>
>>
>> atftp fails to build with gcc 5.2:
>>
>> tftp_def.h:54:14: warning: inline function 'Strncpy' declared but never defined
>>
>> GCC 5 defaults to -std=gnu11 instead of -std=gnu89. The semantics of
>> inline function changes. Pass '-std=gnu89' to gcc to compile atftp.
>>
>> Ref:
>> https://gcc.gnu.org/gcc-5/porting_to.html
>>
>> Signed-off-by: Kai Kang <kai.kang@windriver.com>
>> ---
>>   meta-networking/recipes-daemons/atftp/atftp_git.bb | 2 ++
>>   1 file changed, 2 insertions(+)
>>
>> diff --git a/meta-networking/recipes-daemons/atftp/atftp_git.bb b/meta-networking/recipes-daemons/atftp/atftp_git.bb
>> index b53f637..0ece58f 100644
>> --- a/meta-networking/recipes-daemons/atftp/atftp_git.bb
>> +++ b/meta-networking/recipes-daemons/atftp/atftp_git.bb
>> @@ -32,6 +32,8 @@ USERADD_PACKAGES = "${PN}d"
>>   USERADD_PARAM_${PN}d = "--system --no-create-home --shell /bin/false \
>>                           --user-group nobody"
>>
>> +EXTRA_OEMAKE = "CFLAGS='${CFLAGS} -std=gnu89'"
> this is a woraround and will work, however if you are at and fix it
> once for all that will be desirable. eg. this file you could move the
> definition of
> inline function into the relevant .h file and make it a static inline

Hi Raj,

Thanks. I'll try it.

--Kai

>
>> +
>>   do_install_append() {
>>       install -d ${D}${sysconfdir}/init.d
>>       install -m 0755 ${WORKDIR}/atftpd.init ${D}${sysconfdir}/init.d/atftpd
>> --
>> 1.9.1
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
Regards,
Neil | Kai Kang


