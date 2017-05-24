Return-Path: <gmane@reliableembeddedsystems.com>
X-Greylist: delayed 5019 seconds by postgrey-1.34 at layers.openembedded.org;
	Wed, 24 May 2017 21:02:07 UTC
Received: from delivery.mailspamprotection.com
	(delivery.mailspamprotection.com [198.143.161.19])
	by mail.openembedded.org (Postfix) with ESMTP id 9F078780F2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 24 May 2017 21:02:07 +0000 (UTC)
Received: from ns1.siteground282.com ([184.154.233.8] helo=siteground282.com)
	by se2.mailspamprotection.com with esmtps
	(TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.86)
	(envelope-from <gmane@reliableembeddedsystems.com>)
	id 1dDc71-0004Vq-5s for openembedded-devel@lists.openembedded.org;
	Wed, 24 May 2017 14:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=reliableembeddedsystems.com; s=dkim;
	h=Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-Type:MIME-Version;
	bh=+aVs8y8TXwbw1pujCv7fFSVhDvu6b9WXZla7459NIxk=;
	b=Z3eROGJvJUscw17DyJxxmHgf9/
	augUl18VO8tLiq7yV2egALddaba+2nOOEX+nKx9/irBEeFmQgDkwB2v+cNYvp9ba65IrAAv5BrsTk
	5nC4dykKsxjEm6b9AX7TeQ6y5PWOANfEH/lwaW9fD023GueHD3WsYd18IQTVv+v5U7Kk=; 
Received: from [127.0.0.1] (port=38372 helo=secure282.sgcpanel.com)
	by siteground282.com with esmtpa (Exim 4.86_2)
	(envelope-from <gmane@reliableembeddedsystems.com>)
	id 1dDc71-0007pW-1K; Wed, 24 May 2017 14:38:27 -0500
MIME-Version: 1.0
Date: Wed, 24 May 2017 14:38:26 -0500
From: gmane@reliableembeddedsystems.com
To: openembedded-devel@lists.openembedded.org
Message-ID: <699dad9dcbac38153aa5fbdc1cff0176@reliableembeddedsystems.com>
X-Sender: gmane@reliableembeddedsystems.com
User-Agent: Roundcube Webmail/1.2.3
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - siteground282.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - reliableembeddedsystems.com
X-Originating-IP: 184.154.233.8
X-SpamExperts-Domain: siteground282.com
X-SpamExperts-Username: 184.154.233.8
Authentication-Results: mailspamprotection.com;
	auth=pass smtp.auth=184.154.233.8@siteground282.com
X-SpamExperts-Outgoing-Class: ham
X-SpamExperts-Outgoing-Evidence: Combined (0.10)
X-Recommended-Action: accept
X-Filter-ID: s0sct1PQhAABKnZB5plbIWEcM0d9a2K3OcfFeaASvaIT05e+4t99MpEggFbXzbnhJWdbsu/PGngF
	sP6QHv82uiZTaFCDa9A7C/jInU0NPk5o9qUFE8XEupMgL9lQhc5MhXE3Kd6zku9YzkFh73wKYPbj
	aPZXen3YvWHScRpGw7A40pIiLcKdagK+IDwjGrwSdcZlLYnU0OVurAn1C092Z+fHzJ6mVE7ewsip
	SVIfs4b8lqiX/iYk2i0LFY+7WTlyYb30GV/LTTOHpImWPCex54onRWlBmDnjzYnePIvOXJvlgTl6
	fJxyntEfhZCKje4ZpF5GFn0VGJE1yVv3RLa3Fi7/+fOTvqVqTiiM4NskccT/51HuFxEGlQ85t+9R
	s1HAWpqH02ENgZUUUrBwtgAspuoAEMCxBXuH+MlsW5Hvjb1aa40DxZPJuLUk3zkVKd8p5Y7I2CWT
	8Blyjv8ff7POYMlPrwhaptjM6mDbrQoWHhR9Xvup00ykaCetGbgwh6w19yu3PsN6rObOy/Hw4klu
	yN2tI4ORboLLJ1/iZb6eaQlxyGe8Oo3j1g27BsRrIsZRZ6VZsjZEXqWgl88PYDZKsoPAgTtUp75u
	qlx0KezvZHWCmTc9uT9DMs6SMEjVZA0kg5n8VBio8m6UFbwbb/Mty7VMVgat3TQaaU1HqyTxak55
	nzL4YRLClWuMPFGDl2tB9/wyR8kiMkUYmQJ8RxdH4tckr4+35XlktvqF0fzELcfjXtI7t2T/AtVl
	zJte3A6IpxTlxEqgu5dCqW6kT6qTaBlY6LuKU4f4Yig/3kYZbLOQrqWhTVyw0Qc//Mvvck6HHEJb
	wmE7KWCXRpeuK5vYscWCUrx9bsMxqV8qbl871PlU78MduaDOYP/ZNL0YgQxZW40Lnw+i0mPpggwU
	UEl4Ndju3sWbN1p4gT8cuSYPG+mDFdkT0m/caJZKYJATsKOe
X-Report-Abuse-To: spam@quarantine1.mailspamprotection.com
Cc: robert.berger@reliableembeddedsystems.com
Subject: Re: [meta-oe] [PATCH v4] add php 7.1.0
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
X-List-Received-Date: Wed, 24 May 2017 21:02:07 -0000
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 2016-12-26 16:39, Huang Qiyu wrote:
> 1)Add php_7.1.0.bb
> 2)Delete php_5.5.38.bb,since it is Replaced by php_5.6.26.bb.
> 3)Move pthread-check-threads-m4.patch out of 7.1.0, since it is 
> integrated upstream.
> 
> Signed-off-by: Huang Qiyu <huangqy.fnst@cn.fujitsu.com>

I took the latest and greatest php 7.1.0 from master 
http://cgit.openembedded.org/meta-openembedded/tree/meta-oe/recipes-devtools/php

And added php (among other things) to a poky/pyro core-image-sato-sdk 
and built an extensible SDK

bitbake core-image-sato-sdk -c populate_sdk_ext

When I try to install the SDK

./poky-glibc-x86_64-core-image-sato-sdk-armv7a-neon-toolchain-ext-2.3.sh

I get:

Extracting 
SDK................................................................................................................................done
Setting it up...
Extracting buildtools...
Preparing build system...
Parsing recipes: 100% 
|#########################################################################################################################| 
Time: 0:00:41
Initialising tasks: 100% 
|######################################################################################################################| 
Time: 0:00:15
Checking sstate mirror object availability: 100% 
|##############################################################################################| 
Time: 0:00:00
WARNING: Logfile for failed setscene task is 
/opt/ext-sdk/poky/2.3/tmp/work/x86_64-linux/php-native/7.1.0-r0/temp/log.do_populate_sysroot_setscene.24207
WARNING: Setscene task 
(virtual:native:/opt/ext-sdk/poky/2.3/layers/multi-v7-ml/recipes-devtools/php.ori/php_7.1.0.bb:do_populate_sysroot_setscene) 
failed with exit code '1' - real task will be run instead
ERROR: Task php-native.do_populate_sysroot_setscene failed
ERROR: SDK preparation failed: error log written to 
/opt/ext-sdk/poky/2.3/preparing_build_system.log

I believe the problem is in:

php_sstate_postinst

In cooker mode I am able to see related warnings like this:

bitbake php-native -c clean && bitbake php-native

you might need to run it twize

NOTE: Executing SetScene Tasks
WARNING: Logfile for failed setscene task is 
/tmp/yocto-autobuilder/yocto-autobuilder/yocto-worker/res-custom-pyro-multi-v7-core-image-minimal-sato-sdk-ext/build/build/tmp/work/x86_64-linux/php-native/7.1.0-r1/temp/log.do_populate_sysroot_setscene.6285
WARNING: Setscene task 
(virtual:native:/tmp/yocto-autobuilder/yocto-autobuilder/yocto-worker/res-custom-pyro-multi-v7-core-image-minimal-sato-sdk-ext/build/meta-mainline/multi-v7-ml/recipes-devtools/php/php_7.1.0.bb:do_populate_sysroot_setscene) 
failed with exit code '1' - real task will be run instead
NOTE: Executing RunQueue Tasks

Note that with -c cleansstate or -c cleanall you won't see the warning

I hacked this to make it compile without a warning - not sure it is 
correct:

php_sstate_postinst() {
     if [ "${BB_CURRENTTASK}" = "populate_sysroot_setscene" ]
     then
        head -n1 ${SYSROOT_DESTDIR}${sysconfdir}/pear.conf > 
${SYSROOT_DESTDIR}${sysconfdir}/pear.tmp.conf
        for p in `tail -n1  ${SYSROOT_DESTDIR}${sysconfdir}/pear.conf | 
sed -s 's/;/ /g'`; do
             echo $p | awk -F: 'BEGIN {OFS = ":"; ORS = 
";"}{if(NF==3){print $1, length($3)-2*match($3, /^"/), $3} else {print 
$0}}';
         done >> ${SYSROOT_DESTDIR}${sysconfdir}/pear.tmp.conf
         mv -f ${SYSROOT_DESTDIR}${sysconfdir}/pear.tmp.conf 
${SYSROOT_DESTDIR}/${sysconfdir}/pear.conf
     fi
}

Can you please have a look?

Regards,

Robert

