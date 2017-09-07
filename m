Return-Path: <mark.hatle@windriver.com>
Received: from mail5.wrs.com (mail5.windriver.com [192.103.53.11])
	by mail.openembedded.org (Postfix) with ESMTP id 91B9F71A18
	for <openembedded-devel@lists.openembedded.org>;
	Thu,  7 Sep 2017 13:45:12 +0000 (UTC)
Received: from ALA-HCA.corp.ad.wrs.com (ala-hca.corp.ad.wrs.com
	[147.11.189.40])
	by mail5.wrs.com (8.15.2/8.15.2) with ESMTPS id v87DjC1q025846
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=OK);
	Thu, 7 Sep 2017 06:45:12 -0700
Received: from soho-mhatle-m.local (172.25.36.226) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.361.1;
	Thu, 7 Sep 2017 06:45:11 -0700
To: =?UTF-8?Q?Andreas_M=c3=bcller?= <schnitzeltony@googlemail.com>
References: <1504725809-12825-1-git-send-email-mark.hatle@windriver.com>
	<1504725809-12825-20-git-send-email-mark.hatle@windriver.com>
	<CALbNGRS8S=vdceyyRV2fuTyJnZFM0MsK=JWdVoWn_KAxu_SRsw@mail.gmail.com>
From: Mark Hatle <mark.hatle@windriver.com>
Organization: Wind River Systems
Message-ID: <729ff654-8482-3c02-fe1e-fc88a1a90179@windriver.com>
Date: Thu, 7 Sep 2017 08:45:11 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.12; rv:52.0)
	Gecko/20100101 Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <CALbNGRS8S=vdceyyRV2fuTyJnZFM0MsK=JWdVoWn_KAxu_SRsw@mail.gmail.com>
Cc: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Subject: Re: [PATCH 19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
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
X-List-Received-Date: Thu, 07 Sep 2017 13:45:12 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

On 9/7/17 4:29 AM, Andreas Müller wrote:
> On Wed, Sep 6, 2017 at 9:23 PM, Mark Hatle <mark.hatle@windriver.com> wrote:
>> This resolves a failure of the yocto-compat-layer.py script.  Changing the
>> PACKAGECONFIG setting by just including a layer can cause problems.
>>
>> Signed-off-by: Mark Hatle <mark.hatle@windriver.com>
>> ---
>>  meta-gnome/conf/enable_gnome.conf                   | 2 ++
>>  meta-gnome/recipes-devtools/glade/glade3_%.bbappend | 1 -
>>  2 files changed, 2 insertions(+), 1 deletion(-)
>>  delete mode 100644 meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>>
>> diff --git a/meta-gnome/conf/enable_gnome.conf b/meta-gnome/conf/enable_gnome.conf
>> index 883a6f5..7e711ee 100644
>> --- a/meta-gnome/conf/enable_gnome.conf
>> +++ b/meta-gnome/conf/enable_gnome.conf
>> @@ -1 +1,3 @@
>>  AVAHI_GTK_pn-avahi-ui = "gtk gtk3"
>> +
>> +PACKAGECONFIG_pn-glade3 = "gnome"
>> diff --git a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend b/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>> deleted file mode 100644
>> index 3abacfb..0000000
>> --- a/meta-gnome/recipes-devtools/glade/glade3_%.bbappend
>> +++ /dev/null
>> @@ -1 +0,0 @@
>> -PACKAGECONFIG ??= "gnome"
>> --
>> 1.8.3.1
>>
> Yet another stupid question (yes I need gnome support for working with
> glade3): How is enable_gnome.conf supposed to be activated?
> 
> For the record: This is yet another patch kicking things off for the
> sake of yocto-compat-layer script. Is meta-gnome supposed to be yocto
> compatible? Was this decided by 'community'?

See the cover letter:

[18/31] enable_gnome.conf: Move the AVAHI_GTK setting
- The yp-compat script does not allow a layer to modify the system wide
configuration (including modifying other recipe behavior).  The AVHAI_GTK
changes the behavior of that recipe, which is detected by the script.  So
I choose to move this to a configuration file that will need to be required
by the user IF they want avahi to use GTK.  I'm not happy with this, but I
don't see any other way to meet the requirements.

[19/31] glade3: Move PACKAGECONFIG setting to enable_gnome.conf
- Similar to the above, but with PACKAGECONFIG this time.

I don't see an alternative here due to this requirement.  As I said before you
guys maintain meta-openembedded, I don't.  If this doesn't work (and I never
expected it to) then reject the patch and don't merge it.

I simply don't have an answer to any other way to implement this based on the
specific requirement of that checking script.

> But I am sure I missed another point...
> 
> Andreas
> 


