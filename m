Received: from [209.85.217.166] (helo=mail-gx0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1Lgo8i-0007OM-Cd
	for openembedded-devel@lists.openembedded.org;
	Mon, 09 Mar 2009 23:40:04 +0100
Received: by gxk10 with SMTP id 10so2876915gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 09 Mar 2009 15:35:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=pWwArsNI24uAPsj/kcchrnFX8g+c3th2YDB8+24mjEQ=;
	b=oOA3SnT6DQX0EBlG3awafGVAnR8ZQIQN3OBVwMoTg7w7Ybuqllb61aM1YmBBl7w6Pt
	XaAzOsYTkWBzZ+Sq/hOXqPNcJc3YQpG0PO7XapvAWT8synXbBdAW99UVd3+vKA6S92ll
	tiJ/lEI6PUNdCtaklBQ4V69OO2qXeBkcLiloo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=vFG0r1qVlkJvT5lhLQiOCa95hNTLdaVxYb/rVye54v3R/uKTzj9w3vhnJBGB67JLcx
	PcIRSfSDumnV3yE28O4BiW+k7J50JT3fAwMH9YittrdVHZl39JV4hXpONk7mcyj/BaNZ
	tW8WW1/7EbjeXyy2uyTAvGkE07B3Wa+ezq07Q=
MIME-Version: 1.0
Received: by 10.142.156.19 with SMTP id d19mr2752951wfe.6.1236638103489; Mon, 
	09 Mar 2009 15:35:03 -0700 (PDT)
In-Reply-To: <1236637089.29394.59.camel@cheeto.emacinc.com>
References: <1236463653.25861.321.camel@cheeto.emacinc.com>
	<200903071735.37618.raj.khem@gmail.com>
	<1236637089.29394.59.camel@cheeto.emacinc.com>
Date: Mon, 9 Mar 2009 15:35:03 -0700
Message-ID: <19c1b8a90903091535u4dd8982blc884a508cc35e8dc@mail.gmail.com>
From: Khem Raj <raj.khem@gmail.com>
To: Travis Stratman <tstratman@emacinc.com>
Cc: openembedded-devel@lists.openembedded.org
Subject: Re: failure on gcc-cross-initial-4.2.4-r5 for i686
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
X-List-Received-Date: Mon, 09 Mar 2009 22:40:04 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On Mon, Mar 9, 2009 at 3:18 PM, Travis Stratman <tstratman@emacinc.com> wrote:
> Thanks Khem.
>
> On Sat, 2009-03-07 at 17:35 -0800, Khem Raj wrote:
>>
>> Are you using latest git? I do not get the error like yours for me it builds
>> fine for i686-generic machine. Could you post your local.conf ?
>> are you using some pre existing distro and machine or defining your own.
>
> I'm using the latest git (as of Saturday morning) of
> org.openembedded.dev. I'm using i686-generic.conf for the machine file
> and a custom distro file mostly taken directly from the Angstrom conf
> for now. As of right now there is nothing in /opt/oe/EMAC-OE-x86 besides
> the custom conf files that I am using and a custom busybox packages
> directory. I have done a lot of work w/ OE for ARM but I'm starting out
> with the latest and greatest for the x86 side.
>
> conf files follow (minus comments and newlines):
> ----
> travis@cheeto:/opt/oe/EMAC-OE-x86/conf$ sed -e 's/#.*//' -e '/^$/ d' local.conf
> MNT = "/mnt/oe/x86"
> DL_DIR = "${MNT}/sources"
> BBFILES := "/opt/oe/EMAC-OE-x86/packages/*/*.bb ${MNT}/org.openembedded.dev/packages/*/*.bb"
> BBFILE_COLLECTIONS = "upstream EMAC-OE-x86"
> BBFILE_PATTERN_upstream = "${MNT}/org.openembedded.dev/"
> BBFILE_PATTERN_EMAC-OE-x86 = "/opt/oe/EMAC-OE-x86/"
> BBFILE_PRIORITY_upstream = "5"
> BBFILE_PRIORITY_EMAC-OE-x86 = "10"
> BBMASK = ""
> PREFERRED_PROVIDERS = "virtual/qte:qte virtual/libqpe:libqpe-opie"
> PREFERRED_PROVIDERS += " virtual/libsdl:libsdl-x11"

snip

> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc-initial:gcc-cross-initial"
> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}gcc:gcc-cross"
> PREFERRED_PROVIDERS += " virtual/${TARGET_PREFIX}g++:gcc-cross"

Can you try by removing above three

Rest of the changes seems like should not have effect.

Thx

-Khem


