Received: from [209.85.217.166] (helo=mail-gx0-f166.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <philipp.zabel@gmail.com>) id 1LhJdd-0006V1-Ey
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Mar 2009 09:18:06 +0100
Received: by gxk10 with SMTP id 10so4124787gxk.12
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Mar 2009 01:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=qYxTGNcIkwTzW+09fBw92Qsqbk53SYW7T6Onn7H8O8w=;
	b=ab+xug6j9DEycWEEjy4yye3S5raYCgvV+jf34vrKLPHUuGZeCB11p5GInFStmcnh/f
	xemFU9aLOErgUPpwo88s07y+mpCfYdfSM4sVxVU0W+WOtVNO3BKdqJAHQ7GD9g7ovkOH
	L3OtrxTBMwrO+KYcvTKTX9gj2FHEAGx1G+MKo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding;
	b=aaiauyWIk2ge8QGKBSvoBfbrCdCw8yGUBkQ8angzbY9LcnHv0FWU0nWG1WP6VqVPoM
	0+n600ticsVWXtn6DcwfFDdIGXdGXiDF1rwTc31LBKtDeVkohD1K6XzBAJRFvjmEeyOs
	HkvN4Qg7cDoBg8NMad6QBXdNhdqFlPiZWARqc=
MIME-Version: 1.0
Received: by 10.150.143.12 with SMTP id q12mr14533131ybd.245.1236759478149; 
	Wed, 11 Mar 2009 01:17:58 -0700 (PDT)
In-Reply-To: <49B73DC1.5000902@gmail.com>
References: <49B5E3B9.70409@gmail.com>
	<1236709292.28500.27.camel@hammer.suse.cz>
	<49B73DC1.5000902@gmail.com>
Date: Wed, 11 Mar 2009 09:17:58 +0100
Message-ID: <74d0deb30903110117m2de9bd4cvd7bc88501e9c719b@mail.gmail.com>
From: pHilipp Zabel <philipp.zabel@gmail.com>
To: Ben Gamari <bgamari@gmail.com>
Cc: Vitus Jensen <vjensen@gmx.de>, beagleboard@googlegroups.com,
	openembedded-devel@lists.openembedded.org,
	Discussion of the angstrom distribution development
	<angstrom-distro-devel@linuxtogo.org>
Subject: Re: [Angstrom-devel] Avahi recipe
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
X-List-Received-Date: Wed, 11 Mar 2009 08:18:10 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

replacing openembedded-users with openembedded-devel
(http://lists.linuxtogo.org/pipermail/openembedded-users/2009-March/000978.html).

On Wed, Mar 11, 2009 at 5:27 AM, Ben Gamari <bgamari@gmail.com> wrote:
> On 03/10/2009 02:21 PM, Stanislav Brabec wrote:
>>
>> I guess I got the problem:
>>
>> Version 0.6.24 is already decently split and you can install
>> avahi-autoipd without triggering additional dependencies. This is not
>> valid for version 0.6.21 triggered in your build.
>>
>> I guess that it's caused by
>> distro/include/preferred-om-2008-versions.inc.
>>
>> Remove three avahi related lines from it and try again.
>>
>
> Nope, no dice. In fact, things are getting even stranger:
>
>> DEBUG: providers for avahi-daemon are: ['avahi-python', 'avahi']
>> DEBUG: update_data()
>> DEBUG: update_data()
>> NOTE: checking PREFERRED_PROVIDER_avahi-python
>> NOTE: checking PREFERRED_PROVIDER_avahi-python-0.6.21
>> NOTE: checking PREFERRED_PROVIDER_avahi-python-0.6.21-r8
>> NOTE: checking PREFERRED_PROVIDER_avahi
>> NOTE: checking PREFERRED_PROVIDER_avahi
>> NOTE: selecting avahi to satisfy runtime avahi-daemon due to
>> PREFERRED_PROVIDER_avahi = avahi
>> DEBUG: sorted providers for avahi-daemon are:
>> ['/mnt/oe/oe/openembedded/packages/avahi/avahi_0.6.24.bb',
>> '/mnt/oe/oe/openembedded/packages/avahi/avahi-python_0.6.21.bb']
>> DEBUG: adding '/mnt/oe/oe/openembedded/packages/avahi/avahi_0.6.24.bb' to
>> satisfy runtime 'avahi-daemon'
>
>> ...
>>
>> DEBUG: adding
>> '/mnt/oe/oe/openembedded/packages/avahi/avahi-python_0.6.21.bb' to satisfy
>> runtime 'avahi-daemon'
>
>> ...
>>
>> DEBUG: providers for avahi-autoipd are: ['avahi-python', 'avahi']
>> DEBUG: update_data()
>> DEBUG: update_data()
>> NOTE: checking PREFERRED_PROVIDER_avahi-python
>> NOTE: checking PREFERRED_PROVIDER_avahi-python-0.6.21
>> NOTE: checking PREFERRED_PROVIDER_avahi-python-0.6.21-r8
>> NOTE: checking PREFERRED_PROVIDER_avahi
>> NOTE: checking PREFERRED_PROVIDER_avahi
>> NOTE: selecting avahi to satisfy runtime avahi-autoipd due to
>> PREFERRED_PROVIDER_avahi = avahi
>> DEBUG: sorted providers for avahi-autoipd are:
>> ['/mnt/oe/oe/openembedded/packages/avahi/avahi_0.6.24.bb',
>> '/mnt/oe/oe/openembedded/packages/avahi/avahi-python_0.6.21.bb']
>> DEBUG: adding '/mnt/oe/oe/openembedded/packages/avahi/avahi_0.6.24.bb' to
>> satisfy runtime 'avahi-autoipd'
>> DEBUG: adding
>> '/mnt/oe/oe/openembedded/packages/avahi/avahi-python_0.6.21.bb' to satisfy
>> runtime 'avahi-autoipd'
>
> It's apparently still trying to install 0.6.21 for some reason, but this
> time in addition to 0.6.24. Odd. Any ideas?

Those messages do not mean that the recipes will be actually built. If
I'm not mistaken, bitbake is just considering alternatives here.
Especially this ...

>> NOTE: selecting avahi to satisfy runtime avahi-autoipd due to
>> PREFERRED_PROVIDER_avahi = avahi

... part sounds like it's going to do the right thing.

I have the same messages in my -DD log. When I call "DISTRO=angstrom
bitbake task-base" on a clean tmp, it just builds avahi (0.6.24), not
avahi-python (0.6.21) or any of its additional dependencies.

regards
Philipp


