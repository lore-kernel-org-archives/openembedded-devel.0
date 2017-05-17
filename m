Return-Path: <Randy.MacLeod@windriver.com>
Received: from mail1.windriver.com (mail1.windriver.com [147.11.146.13])
	by mail.openembedded.org (Postfix) with ESMTP id C2AD077E7F
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 17 May 2017 20:22:01 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail1.windriver.com (8.15.2/8.15.1) with ESMTPS id v4HKM1Ja022692
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 17 May 2017 13:22:01 -0700 (PDT)
Received: from [172.25.44.8] (172.25.44.8) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 17 May 2017 13:22:01 -0700
To: Khem Raj <raj.khem@gmail.com>
References: <20170517181502.20574-1-Randy.MacLeod@windriver.com>
	<CAMKF1sqdCv=Pk4Bt==m+QrZK0WL6C9S73_8Y70GrxRki-S6BAQ@mail.gmail.com>
From: Randy MacLeod <randy.macleod@windriver.com>
Message-ID: <bd6cbc3e-a936-3cba-f0d7-edfb18795dc6@windriver.com>
Date: Wed, 17 May 2017 16:22:00 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.8.0
MIME-Version: 1.0
In-Reply-To: <CAMKF1sqdCv=Pk4Bt==m+QrZK0WL6C9S73_8Y70GrxRki-S6BAQ@mail.gmail.com>
X-Originating-IP: [172.25.44.8]
Cc: openembeded-devel <openembedded-devel@lists.openembedded.org>
Subject: Re: [meta-oe][PATCH] rrdtool: add gettext-native dependency
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 17 May 2017 20:22:02 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2017-05-17 03:45 PM, Khem Raj wrote:
> On Wed, May 17, 2017 at 11:15 AM, Randy MacLeod
> <Randy.MacLeod@windriver.com> wrote:
>> Add gettext-native dependency to use autopoint.
>>
>> When building rrdtool for a 'tiny' distro, ie one that does
>> not have internationalization support in glibc, configure
>> fails with the error:
>>    autoreconf: failed to run autopoint: No such file or directory
>> autopoint is part of gettext so add that native dependency.
>> This must happen transitively for builds using a regular configuration
>> of glibc.
>>
>> Signed-off-by: Randy MacLeod <Randy.MacLeod@windriver.com>
>> ---
>>  meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>> index db2df28a0..160dea58d 100644
>> --- a/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>> +++ b/meta-oe/recipes-extended/rrdtool/rrdtool_1.6.0.bb
>> @@ -4,7 +4,7 @@ HOMEPAGE = "http://oss.oetiker.ch/rrdtool/"
>>  LICENSE = "GPLv2"
>>  LIC_FILES_CHKSUM = "file://COPYRIGHT;md5=3349111ed0533471494beec99715bc9d"
>>
>> -DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native"
>> +DEPENDS = "libpng zlib cairo pango glib-2.0 libxml2 groff-native gettext-native"
>
> perhaps inherit gettext is more appropriate ?

That's already there:

$ grep gettext `find * -name "rrdtoo*bb"`
inherit cpan autotools-brokensep gettext pythonnative python-dir systemd

and in meta/classes/gettext.bbclass:

def gettext_dependencies(d):
     if d.getVar('INHIBIT_DEFAULT_DEPS') and not oe.utils.inherits(d, 
'cross-canadian'):
         return ""
     if d.getVar('USE_NLS') == 'no':
         return "gettext-minimal-native"
     return d.getVar('DEPENDS_GETTEXT', False)

I could install autopoint as part of gettext-minimal-native
but I need to dig a bit more and learn what the heck autopoint
is being used for... maybe I need to fix rrdtool's configure
script and/or see if that's done already in the newer version.

../Randy


>
>
>>
>>  SRCREV = "61f116744262c4c18922dcf806e496715f199669"
>>  PV = "1.6.0"
>> --
>> 2.11.0
>>
>> --
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.openembedded.org/mailman/listinfo/openembedded-devel


-- 
# Randy MacLeod. SMTS, Linux, Wind River
Direct: 613.963.1350 | 350 Terry Fox Drive, Suite 200, Ottawa, ON, 
Canada, K2K 2W5

