Received: from mail.multimedia-labs.de ([82.149.226.172])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <obi@opendreambox.org>) id 1PQPpO-0003FM-2l
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 20:37:26 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.multimedia-labs.de (Postfix) with ESMTP id F29BA314B7CB
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 20:35:54 +0100 (CET)
X-Virus-Scanned: Debian amavisd-new at mail.multimedia-labs.de
Received: from mail.multimedia-labs.de ([127.0.0.1])
	by localhost (mail.multimedia-labs.de [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP id mIWmMCRuzW6w
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 20:35:48 +0100 (CET)
Received: from [172.22.22.60] (ip-109-90-189-193.unitymediagroup.de
	[109.90.189.193])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mail.multimedia-labs.de (Postfix) with ESMTPSA id E0D81314B584
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  8 Dec 2010 20:35:47 +0100 (CET)
Message-ID: <4CFFDE13.5050900@opendreambox.org>
Date: Wed, 08 Dec 2010 20:35:47 +0100
From: Andreas Oberritter <obi@opendreambox.org>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.12) Gecko/20101027 Thunderbird/3.1.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1291813088-23444-1-git-send-email-obi@opendreambox.org>
	<idoklh$pb4$2@dough.gmane.org>
In-Reply-To: <idoklh$pb4$2@dough.gmane.org>
X-SA-Exim-Connect-IP: 82.149.226.172
X-SA-Exim-Mail-From: obi@opendreambox.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] conf/distro: remove unused variable	CVS_TARBALL_STASH
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
X-List-Received-Date: Wed, 08 Dec 2010 19:37:26 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 12/08/2010 08:01 PM, Koen Kooi wrote:
> And it isn't used in bitbake either?

BitBake master and 1.10 don't use it. Now that you've asked, I checked
older versions and saw that 1.8 still uses the variable.

Reasons for creating the patches were a) BitBake ignoring my
CVS_TARBALL_STASH variable and b) the existence of PREMIRRORS and
MIRRORS, which provide more flexible functionality.

What's your opinion to solve this inconsistency between BitBake versions?

Regards,
Andreas

> On 08-12-10 13:58, Andreas Oberritter wrote:
>> Signed-off-by: Andreas Oberritter <obi@opendreambox.org>
>> ---
>>  conf/distro/angstrom-2008.1.conf |    5 -----
>>  conf/distro/include/oplinux.inc  |    4 ----
>>  conf/distro/include/slugos.inc   |    1 -
>>  conf/distro/kaeilos.conf         |    6 ------
>>  conf/distro/shr.conf             |    2 --
>>  5 files changed, 0 insertions(+), 18 deletions(-)
> 
>> diff --git a/conf/distro/angstrom-2008.1.conf b/conf/distro/angstrom-2008.1.conf
>> index ec03276..30ec35b 100644
>> --- a/conf/distro/angstrom-2008.1.conf
>> +++ b/conf/distro/angstrom-2008.1.conf
>> @@ -50,11 +50,6 @@ FEED_BASEPATH = "feeds/unstable/${ANGSTROM_PKG_FORMAT}/${LIBC}/"
>>  # Uncomment this to fetch packaged-staging packages from the central angstrom server
>>  #PSTAGE_MIRROR = "${ANGSTROM_URI}/${FEED_BASEPATH}packaged-staging"
> 
>> -#The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
>> -CVS_TARBALL_STASH ?= "\
>> -		     http://www.angstrom-distribution.org/unstable/sources/ \
>> -		    "
>> -
> 
>>  #Make sure we use 2.6 on machines with a 2.4/2.6 selector
>>  KERNEL = "kernel26"
>> diff --git a/conf/distro/include/oplinux.inc b/conf/distro/include/oplinux.inc
>> index 36eca58..6e6bddb 100644
>> --- a/conf/distro/include/oplinux.inc
>> +++ b/conf/distro/include/oplinux.inc
>> @@ -28,10 +28,6 @@ MAINTAINER = "Digital OPSiS Developers Team <oplinux-developers@digital-opsis.co
>>  # Packaging and output format
>>  IMAGE_FSTYPES = "tar.gz jffs2 ext2.gz cramfs squashfs squashfs-lzma cpio.gz"
> 
>> -# Specifies a location to search for pre-generated tarballs when fetching
>> -# a cvs:// URI. Outcomment this, if you always want to pull directly from CVS.
>> -#CVS_TARBALL_STASH = "http://www.digital-opsis.com/oplinux/sources/"
>> -
>>  PREMIRRORS = "(ftp|http)://.*/.*/ http://source.digital-opsis.com/"
> 
>>  #
>> diff --git a/conf/distro/include/slugos.inc b/conf/distro/include/slugos.inc
>> index c2a380d..07dfd65 100644
>> --- a/conf/distro/include/slugos.inc
>> +++ b/conf/distro/include/slugos.inc
>> @@ -109,7 +109,6 @@ DISTRO_EXTRA_DEPENDS ?= ""
>>  DISTRO_EXTRA_RDEPENDS ?= ""
>>  DISTRO_EXTRA_RRECOMMENDS ?= ""
> 
>> -CVS_TARBALL_STASH = "http://sources.nslu2-linux.org/sources/"
>>  INHERIT += "nslu2-mirrors"
> 
>>  #FIXME: HACK: REMOVE THIS
>> diff --git a/conf/distro/kaeilos.conf b/conf/distro/kaeilos.conf
>> index 815d40f..84ea4e7 100644
>> --- a/conf/distro/kaeilos.conf
>> +++ b/conf/distro/kaeilos.conf
>> @@ -48,12 +48,6 @@ EXTRA_IMAGECMD_ext2 = "-i 4096"
>>  FEED_BASEPATH = "feeds/unstable/${ANGSTROM_PKG_FORMAT}/${LIBC}/"
> 
> 
>> -#The angstrom-mirrors.bbclass should have everything, but we can use this as a fallback
>> -CVS_TARBALL_STASH ?= "\
>> -		     http://www.angstrom-distribution.org/unstable/sources/ \
>> -		    "
>> -
>> -
>>  #Make sure we use 2.6 on machines with a 2.4/2.6 selector
>>  KERNEL = "kernel26"
>>  MACHINE_KERNEL_VERSION = "2.6"
>> diff --git a/conf/distro/shr.conf b/conf/distro/shr.conf
>> index 0258231..bf615f8 100644
>> --- a/conf/distro/shr.conf
>> +++ b/conf/distro/shr.conf
>> @@ -79,8 +79,6 @@ ANGSTROM_BLACKLIST_pn-linux-ml403-mvista-2.6.x = "strange kernel, spank maintain
>>  ANGSTROM_BLACKLIST_pn-linux-davinci = "strange kernel, spank maintainer"
> 
> 
>> -CVS_TARBALL_STASH += "http://build.shr-project.org/sources/"
>> -
>>  #The shr-mirrors.bbclass repleaces this
>>  #PREMIRRORS = "(ftp|https?)$://.*/.* http://build.shr-project.org/sources/"
>>  INHERIT += "shr-mirrors" 
> 

_______________________________________________
Openembedded-devel mailing list
Openembedded-devel@lists.openembedded.org
http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel



