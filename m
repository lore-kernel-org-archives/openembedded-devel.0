Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1PDn4q-0005CS-RO
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 00:49:13 +0100
Received: by gxk26 with SMTP id 26so973147gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 03 Nov 2010 16:48:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:in-reply-to
	:references:from:date:message-id:subject:to:content-type;
	bh=6GfBOkzm0llQCvs9OTEjoG+S0PSKA7rz81gPBton+VI=;
	b=rScfhJ3zdqqpjW4LeVJ60PvNv4zNSBkE62f+VRkcms8tZN4JqnaQNcIdKw3zgKftze
	eSELUBNPJru9Z7U+OpXRWzhRdUX1vRz/6xI7hUSFcmMH85iydRRScX6Y500vhlbI2p4x
	jsH+lz6mYNCnwkGmghB/2vF/KE53wwoLeSAxQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:content-type;
	b=FSYcJvXTFL5t/gevD0ZnYkvSa8TocAL/dCkMsAjSIREwVw/PjfBkHlxrm2jRueGAYF
	hmkqlxKEsEzS3vudmvUWfXm062Pn2Ap937/uRRBDK1wPErkxxMpb/XKnzAmrRD10hvd3
	2awihKZtaB/82TE5vcTvhKKdSgNr5l04atsXU=
Received: by 10.91.11.6 with SMTP id o6mr236169agi.91.1288828100655; Wed, 03
	Nov 2010 16:48:20 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.91.135.18 with HTTP; Wed, 3 Nov 2010 16:48:00 -0700 (PDT)
In-Reply-To: <AANLkTikOZCR47_Yd6Z7WoPSZZGW_65wTtzpxTPu89D1w@mail.gmail.com>
References: <AANLkTik9vuL4RR0x1mn_dSGXP2r2dn1RrgbOyxqYw+TD@mail.gmail.com>
	<AANLkTim-aV6bGmFZN3sg-w83ji1DGBvKJAh=DabPL-ij@mail.gmail.com>
	<AANLkTikOZCR47_Yd6Z7WoPSZZGW_65wTtzpxTPu89D1w@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
Date: Wed, 3 Nov 2010 16:48:00 -0700
Message-ID: <AANLkTi==Pf6K0p48n8cJhMnws6=43qGrX5HAPRgYyJaj@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: problems building openldap and libtool
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
X-List-Received-Date: Wed, 03 Nov 2010 23:49:13 -0000
Content-Type: text/plain; charset=UTF-8

On Wed, Nov 3, 2010 at 4:36 PM, J. L. <vwyodapink@gmail.com> wrote:
> On Wed, Nov 3, 2010 at 4:24 PM, Khem Raj <raj.khem@gmail.com> wrote:
>> On Wed, Nov 3, 2010 at 3:55 PM, J. L. <vwyodapink@gmail.com> wrote:
>>> I am having an issue of how libtool is building on my machine. I am
>>> running Ubuntu 10.10 64bit Kernel 2.6.35-23-generic bitbake 1.10.1
>>> overo branch. Here is what happens when building:
>>>
>>> Error for openldap
>>> NOTE: package openldap-2.4.23-r2: task do_configure: Started
>>> ERROR: Function do_configure failed
>>> NOTE: Task failed: ('function do_configure failed',
>>> '/home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815')
>>> ERROR: Logfile of failure stored in:
>>> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.12815
>>> Log data follows:
>>> | cp: cannot stat
>>> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/ltmain.sh':
>>> No such file or directory
>>
>> can you add DEPENDS += "libtool" to openldap_2.4.23.bb and retry ?
>
> Still getting this error and I cleaned and rebuilt both recipes

try this patch and remove that DEPENDS

diff --git a/recipes/openldap/openldap_2.4.23.bb
b/recipes/openldap/openldap_2.4.23.bb
index 3ac15f6..8afd951 100644
--- a/recipes/openldap/openldap_2.4.23.bb
+++ b/recipes/openldap/openldap_2.4.23.bb
@@ -188,7 +188,7 @@ DEPENDS      += "${OPENLDAP_DEPENDS}"
 CPPFLAGS_append = " -D_GNU_SOURCE"

 do_configure() {
-       cp ${STAGING_DATADIR}/libtool/config/ltmain.sh ${S}/build
+       cp ${STAGING_ETCDIR_NATIVE}/libtool/config/ltmain.sh ${S}/build
        rm -f ${S}/libtool
        aclocal
        libtoolize --force --copy


>
> ERROR: Logfile of failure stored in:
> /home/vdubhack/overo-oe/tmp/work/armv7a-angstrom-linux-gnueabi/openldap-2.4.23-r2/temp/log.do_configure.2783
> Log data follows:
> | cp: cannot stat
> `/home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/ltmain.sh':
> No such file or directory
> | ERROR: Function do_configure failed
> NOTE: package openldap-2.4.23-r2: task do_configure: Failed
>
>
> libtool does not build to this location
> /home/vdubhack/overo-oe/tmp/sysroots/armv7a-angstrom-linux-gnueabi/usr/share/libtool/
> it builds to here
> tmp/sysroots/armv7a-angstrom-linux-gnueabi/home/vdubhack/overo-oe/tmp/sysroots/x86_64-linux/usr/share/libtool/
>
> It seems to put home/vdubhack/overo-oe/tmp the incorrect way. instead
> of being in front of the tmp/sysroot like most things
>
> same with aclocal and aclocal-1.11
>
> Thanks
>
> JL
>>
>>
>> -khem
>>
>> _______________________________________________
>> Openembedded-devel mailing list
>> Openembedded-devel@lists.openembedded.org
>> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>>
>
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel
>


