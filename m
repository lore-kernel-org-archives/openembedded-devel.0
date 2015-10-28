Return-Path: <george.mccollister@gmail.com>
Received: from mail-io0-f177.google.com (mail-io0-f177.google.com
	[209.85.223.177])
	by mail.openembedded.org (Postfix) with ESMTP id 7737076E04
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 21:16:35 +0000 (UTC)
Received: by iofz202 with SMTP id z202so25175819iof.2
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 28 Oct 2015 14:16:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type;
	bh=GLvTwucXcoHueP+qZg4pSlSfexnmckZet1csMXB8YR8=;
	b=pFe3aKsdyMZ4juO70G4wcFN5etMhCDN51F0X/X/O92ha/FC3PnXgq/YRWs63q3Uhfx
	JhylFYqciyOv/1+vNHvBJvB33fVcyWoP2eLbi/HKNWo5oS5uLa1f0Ty+sjNUPP1DCUvK
	/jQufx3QLp7s/6uTngLy9RdB6zYUwxfEYSusfeaoFEZyslTklIud2rpAIisyvpIeKmUB
	7egJbvCDgagdWlvHu/gF8nmAlFR7F+DVEs9iJT3hDv6tYwBIIjsuCF6I+xjqWayqiuCh
	1btXS9QzDCck2wa/zvWXG/21Wljb6ivsTgBB0+isXqpRlTe1tcQavq/0371NJOeelhyK
	e37g==
MIME-Version: 1.0
X-Received: by 10.107.155.16 with SMTP id d16mr37090472ioe.38.1446066996012;
	Wed, 28 Oct 2015 14:16:36 -0700 (PDT)
Received: by 10.36.137.134 with HTTP; Wed, 28 Oct 2015 14:16:35 -0700 (PDT)
In-Reply-To: <5630F692.6050109@gmail.com>
References: <1445897141-24786-1-git-send-email-george.mccollister@gmail.com>
	<5630F692.6050109@gmail.com>
Date: Wed, 28 Oct 2015 16:16:35 -0500
Message-ID: <CAFSKS=M9aSmfqHfodvspROcO8UhD_o9KiR_6CQ6fvZpVguD6Rw@mail.gmail.com>
From: George McCollister <george.mccollister@gmail.com>
To: akuster808 <akuster808@gmail.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: [meta-webserver][PATCH] apache2: fix config_vars.mk path contamination
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
X-List-Received-Date: Wed, 28 Oct 2015 21:16:36 -0000
Content-Type: text/plain; charset=UTF-8

Armin,

Probably doesn't need to be. The only recipe I've come across apart
from the one I wrote last week that builds an apache module is in
meta-openstack (mod-wsgi). I'm working with master right now so if it
only works in master that's fine by me.

-George

On Wed, Oct 28, 2015 at 11:23 AM, akuster808 <akuster808@gmail.com> wrote:
> George,
>
> Should this be backported to fido and/or dizzy?
>
> - armin
>
> On 10/26/2015 03:05 PM, George McCollister wrote:
>> Replace contaminated paths with staging paths so apxs can be successfully used
>> in other recipes to build modules when host and target arch differ.
>>
>> Signed-off-by: George McCollister <george.mccollister@gmail.com>
>> ---
>>  meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>> diff --git a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
>> index af5c72a..b62fd8c 100644
>> --- a/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
>> +++ b/meta-webserver/recipes-httpd/apache2/apache2_2.4.16.bb
>> @@ -117,6 +117,10 @@ apache_sysroot_preprocess () {
>>      sed -i 's!^APR_CONFIG = .*!APR_CONFIG = ${STAGING_BINDIR_CROSS}/apr-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>>      sed -i 's!^APU_CONFIG = .*!APU_CONFIG = ${STAGING_BINDIR_CROSS}/apu-1-config!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>>      sed -i 's!^includedir = .*!includedir = ${STAGING_INCDIR}/apache2!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> +    sed -i 's!^CFLAGS = -I[^ ]*!CFLAGS = -I${STAGING_INCDIR}/openssl!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> +    sed -i 's!^EXTRA_LDFLAGS = .*!EXTRA_LDFLAGS = -L${STAGING_LIBDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> +    sed -i 's!^EXTRA_INCLUDES = .*!EXTRA_INCLUDES = -I$(includedir) -I. -I${STAGING_INCDIR}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>> +    sed -i 's!--sysroot=[^ ]*!--sysroot=${STAGING_DIR_HOST}!' ${SYSROOT_DESTDIR}${datadir}/${BPN}/build/config_vars.mk
>>  }
>>
>>  #
>>

