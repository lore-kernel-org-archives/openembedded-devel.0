Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PX9Dd-0008Ox-Ga
	for openembedded-devel@lists.openembedded.org;
	Mon, 27 Dec 2010 10:19:31 +0100
Received: by iwn8 with SMTP id 8so8826698iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 27 Dec 2010 01:16:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:in-reply-to
	:references:date:message-id:subject:from:to:content-type;
	bh=i8UlUEdB/N6RlbEXoIgUGN3p+6h4KGKpPL5TDUVlXZw=;
	b=HY0O9++pRdO2SP0T17NlaUH4xVe01fjNFl7fMVWNNhW4cyYEJR/EF+oLQOl4vvhSXX
	/y5DEA/HfL0cyb1sbTMnWIVufLDjowklAYdhbvZrBbTsHzV7jgtbfozuKWkC4o8eMzLO
	x9Y6F8mx/sG2nLqEysuOwsT+a23HCfGlEeOt4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type;
	b=d7dtvORKnmsYUgTuYJJ1raE05UwORAxVRTfvbq4yf0dCSszYfxzDhnHz5uZgicKpwQ
	astMBsD9J/JwJI9g2WGtQ+532tl4GKHYZSMgtWTKCvClyhn1ZXYYQn2aJ0lkSsetomuj
	5hHbAP19F36iY//erQWW/C52RfjRGvpHoPvh4=
MIME-Version: 1.0
Received: by 10.231.37.136 with SMTP id x8mr11975459ibd.132.1293439613084;
	Mon, 27 Dec 2010 00:46:53 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Mon, 27 Dec 2010 00:46:53 -0800 (PST)
In-Reply-To: <4D180E45.2010306@gmail.com>
References: <1293399498-14036-1-git-send-email-fransmeulenbroeks@gmail.com>
	<4D180E45.2010306@gmail.com>
Date: Mon, 27 Dec 2010 09:46:53 +0100
Message-ID: <AANLkTini4GZx5bs86WWS=SmrhsCSTdYPzg9pPVpMpd2c@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: [PATCH v2] cpan_build.bbclass; added cc and ld flags to the perl Build.PL invocation
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
X-List-Received-Date: Mon, 27 Dec 2010 09:19:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

2010/12/27 Khem Raj <raj.khem@gmail.com>:
> On 12/26/2010 1:38 PM, Frans Meulenbroeks wrote:
>>
>> Without these gcc would be used which resolves to /usr/bin/gcc
>> and one gets an intel exe.
>> This showed up with libparams-validate-perl and libdatetime-perl
>> The LDFLAGS are added to resolve the GNU_HASH QA error
>>
>> Signed-off-by: Frans Meulenbroeks<fransmeulenbroeks@gmail.com>
>
> Why a new dir called poky ?

I goofed. Sry.

The patch only aimed to contain the following:

diff --git a/classes/cpan_build.bbclass b/classes/cpan_build.bbclass
index d1bbc4f..070e061 100644
--- a/classes/cpan_build.bbclass
+++ b/classes/cpan_build.bbclass
@@ -26,6 +26,7 @@ cpan_build_do_configure () {
               # build for target
               . ${STAGING_LIBDIR}/perl/config.sh
               perl Build.PL --installdirs vendor \
+                       --config cc="${CC} ${LDFLAGS}" --config
ld="${CCLD} ${LDFLAGS}" \
                       --destdir ${D} \
                       --install_path lib="${datadir}/perl5" \
                       --install_path arch="${libdir}/perl5" \

Thought I'd verified the patch with git log -p but apparently I didn't
look carefully enough.
No idea how that poky file ended up in my tree at all.
Will resubmit.

Frans.


