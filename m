Received: from gravedo.de ([85.214.79.159])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <morphis@gravedo.de>) id 1OdTpN-0006nD-Jr
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Jul 2010 21:59:10 +0200
Received: by gravedo.de (Postfix, from userid 5001)
	id 6843E80C52A; Mon, 26 Jul 2010 21:58:55 +0200 (CEST)
Received: from [192.168.1.142] (p5489BA1E.dip.t-dialin.net [84.137.186.30])
	by gravedo.de (Postfix) with ESMTPSA id 44CA180C524
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Jul 2010 21:58:54 +0200 (CEST)
Message-ID: <4C4DE8FA.7060707@gravedo.de>
Date: Mon, 26 Jul 2010 21:58:50 +0200
From: Simon Busch <morphis@gravedo.de>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.11) Gecko/20100713 Thunderbird/3.0.6
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1279651497-20918-1-git-send-email-morphis@gravedo.de>	<1279651497-20918-2-git-send-email-morphis@gravedo.de>
	<20100726074601.GA27921@excalibur.local>
In-Reply-To: <20100726074601.GA27921@excalibur.local>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 85.214.79.159
X-SA-Exim-Mail-From: morphis@gravedo.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH 1/4] lvm2: rebase all recipes on a global lvm2.inc recipe
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
X-List-Received-Date: Mon, 26 Jul 2010 19:59:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 26.07.2010 09:46, Stefan Schmidt wrote:
> Hello.
> 
> On Tue, 2010-07-20 at 20:44, Simon Busch wrote:
>> This rebases all specific versions of lvm2 on a global recipe lvm2.inc which defines the
>> common parameters for building lvm2. Staging is overwritten as we don't need any of the
>> executables or manpages the build of lvm2 produces for any related builds.
>>
>> Signed-off-by: Simon Busch <morphis@gravedo.de>
> 
> Looks good. Two comments below.

Thank you for commenting this patches!

> 
>> diff --git a/recipes/lvm2/lvm2.inc b/recipes/lvm2/lvm2.inc
>> new file mode 100644
>> index 0000000..a7e37b5
>> --- /dev/null
>> +++ b/recipes/lvm2/lvm2.inc
>> @@ -0,0 +1,20 @@
>> +SECTION = "utils"
>> +DESCRIPTION = "LVM2 is a set of utilities to manage logical volumes in Linux."
>> +LICENSE = "GPL"
>> +DEPENDS = "device-mapper"
>> +INC_PR = "r2"
>> +
>> +S = "${WORKDIR}/LVM2.${PV}"
>> +SRC_URI = "ftp://sources.redhat.com/pub/lvm2/old/LVM2.${PV}.tgz \
>> +           file://crosscompile_fix.patch"
>> +
>> +# Unset user/group to unbreak install.
>> +EXTRA_OECONF = "--with-user= --with-group= --disable-o_direct"
>> +EXTRA_OECONF_arm = "--with-user= --with-group= --disable-o_direct"
> 
> I can see that you just merged this in from an already existing recipe, but do
> we know why we have an overrirde for ARM here which changes nothing? Looks bogus
> to me.

Hm, you are right. I checked it with recompiling without the
EXTRA_OECONF_arm statement. It works fine. Is it ok if I supply an extra
patch removing this statement or should I rework this patch?

> 
>> +inherit autotools
>> +
>> +# We don't need to stage anything (the executables are no needed at build time by any
>> +# other recipe)
>> +do_stage() {
>> +}
> 
> While we don't need the executables the don't hurd either IMHO. Can we get rid
> of this?
> 

The problem was, that the executables and manpages where installed into
the staging dir and never removed, when the packages was clean ur
purged. So I added the empty do_stage block to avoid stage of anything
from this package as we don't need them anyway.

regards,
morphis



