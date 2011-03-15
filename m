Received: from mail-qw0-f47.google.com ([209.85.216.47])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <graham.gower@gmail.com>) id 1PzdUp-0000Pa-NS
	for openembedded-devel@lists.openembedded.org;
	Wed, 16 Mar 2011 00:17:47 +0100
Received: by qwh5 with SMTP id 5so842080qwh.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 15 Mar 2011 16:16:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
	:subject:references:in-reply-to:content-type
	:content-transfer-encoding;
	bh=DpsCs5h45Pn0NIQOFkckqq8rgfI1/7bZaMn4es6ba78=;
	b=TzSGWjyXBEzK4ho/GupNTsFExTAnFMowtrmAFfnq3s5W1++lmVuC6cSjiEz6SCPp8E
	DQDYUYkEcDM5pHg1E2njCqRxwEterfdrTenUROi7EmsitEzM/MhP1brcfiZv0M3PlV1l
	lynF6dxN8hpQO7wV6w0aAAXmQJ4thGKuYpAGw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	b=RI3HV+NzoAh2MYVeOpWEilBIpi2QnHZTW+/zSNix9/9dAiRyu5T3d26q6kMVfVyl7P
	lFRWbYNiB9lodK4Z8VW5ZQaDc9z/vFmzt4mMhyN3pIkVhSTlYK8qAm3l1jRSkbL69Cce
	fUCccCno8rWR1Rg96LqxZvmtKhpkx9x2n1F/4=
Received: by 10.224.140.1 with SMTP id g1mr50348qau.345.1300230963812;
	Tue, 15 Mar 2011 16:16:03 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id l12sm246522qcu.43.2011.03.15.16.16.01
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 15 Mar 2011 16:16:03 -0700 (PDT)
Message-ID: <4D7FF32E.80801@gmail.com>
Date: Wed, 16 Mar 2011 09:45:58 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.15) Gecko/20101113 Thunderbird/3.0.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1299841477-23487-1-git-send-email-sledz@dresearch.de>
	<1300180117.2522.14.camel@eha>
In-Reply-To: <1300180117.2522.14.camel@eha>
Subject: Re: Eliminating dependency race-conditions (was Re: [PATCH] net-snmp: disable libnl use)
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
X-List-Received-Date: Tue, 15 Mar 2011 23:17:47 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 03/15/2011 07:38 PM, Esben Haabendal wrote:
> On Fri, 2011-03-11 at 12:04 +0100, Steffen Sledz wrote:
>> which occurred sometimes depending on build order (not in clean
>> package only builds).
> 
> I would like to raise awareness of the underlying problem here.
> 
> The current dependency/staging model of OE basically has this feature
> that a build can be influenced not only by it's own dependencies, but
> also what has been build before it (or not).
> 
> I strongly believe that this has to be fixed on the architectural level,
> and not just on a case-by-case level as is currently needed.
> 
> I haven't received much feedback on the preivous posting about the
> per-recipe staging principle implemented in OE-lite, but I decided to
> take this opportunity to re-iterate the fact that the OE-lite
> implementation of staging and build dependencies eliminates this
> problem.
> 
> I am still very much interested in discussing how to move this
> technology from OE-lite to OE, but as it impacts all recipe metadata
> (build dependencies has to be redefined), OE community at a large really
> needs to value the benefits of solving this problem.
> 
> Best regards,
> Esben
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


I did some work last year to fix some of the low hanging fruit (on a
case by case basis).
My methodology was to do two runs of bitbake -k world, then compare
the output. In case anyone is interested, I used the script below to
identify the problematic recipes. Last time I ran it was in November,
by which time the output had reduced to a list of 5-10 items most of
the time.


#!/bin/sh
#
# Quick and dirty script to determine which tasks fail in one world.log,
# where they succeeded in another. world.log should be generated with, e.g.
# $ bitbake -k world | tee world.log
#
# If there are too many failures, this script will take too long as grep -f
# is slooow.

if [ $# != 2 ]; then
	echo "usage: $0 world.log.1 world.log.2"
	exit 1
fi

tasks="do_setscene do_fetch do_distribute_sources do_unpack do_prepsources
	do_patch do_configure do_qa_configure do_compile do_install
	do_populate_sysroot do_package do_package_write_ipk
	do_package_write do_package_stage do_package_stage_all do_build
	do_qa_staging"

tmp1=`mktemp /tmp/world_regress.XXXXXX`
tmp2=`mktemp /tmp/world_regress.XXXXXX`

for task in $tasks; do
	grep "task $task: Failed" $2 \
		| sed -e 's/^.*NOTE: package //' \
			-e 's/task \(.*\): Failed/\1/' \
		> $tmp1

	grep "task $task: Succeeded" $1 \
		| sed -e 's/^.*NOTE: package //' \
			-e 's/task \(.*\): Succeeded/\1/' \
		> $tmp2

	grep -f $tmp1 $tmp2 \
		| sort -n
done

rm -f $tmp1 $tmp2



