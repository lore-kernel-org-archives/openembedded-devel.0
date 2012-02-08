Received: from mga01.intel.com ([192.55.52.88])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <josh@linux.intel.com>) id 1RuviZ-0008Hz-BA
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Feb 2012 01:49:03 +0100
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
	by fmsmga101.fm.intel.com with ESMTP; 07 Feb 2012 16:39:55 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.71,315,1320652800"; d="scan'208";a="122261002"
Received: from unknown (HELO [10.255.15.17]) ([10.255.15.17])
	by fmsmga002.fm.intel.com with ESMTP; 07 Feb 2012 16:39:55 -0800
Message-ID: <4F31C45B.1010600@linux.intel.com>
Date: Tue, 07 Feb 2012 16:39:55 -0800
From: Joshua Lock <josh@linux.intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120131 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <1328627573-5217-1-git-send-email-schnitzeltony@googlemail.com>
	<CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
In-Reply-To: <CAP9ODKpi+WWUuf7iP8QgJK2vgmM3KAgS0Fkhbu3eEy80L2eszA@mail.gmail.com>
Subject: Re: [meta-oe][RFC 00/27] systemd / initmanager rework
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
X-List-Received-Date: Wed, 08 Feb 2012 00:49:03 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 8bit

On 07/02/12 07:55, Otavio Salvador wrote:
> On Tue, Feb 7, 2012 at 13:12, Andreas Müller
> <schnitzeltony@googlemail.com>wrote:
>
>> * These are my first python experiences - suggestions welcome.
>> * In local.conf (or in distro) the configuration variable INIT_MANAGER
>> selects
>>   the initmanager to be build into an image. When changing the selection,
>>   a build from scratch is required. INIT_MANAGER currently defaults to
>> systemd
>>   (see image.bbclass and initmanager.bbclass)
>> * In systemd.bbclass debug messages were left in to have a better overview
>>   what's going on.
>> * An additional patch series goes out for meta-angstrom.
>> * This is a huge RFC which might cause serious impacts. What I have already
>>   detected after a build from scatch is that /var/lib/opkg is missing in the
>>   image (although it can be found in libopkg.ipk). I will spend the next
>>   days with my new friend buildhistory (thanks for this!!).
>>
>
> I've looked at your changes and they does seem to be a good base for
> further work:

I agree, good job!

> * The init system ought to be a DISTRO_FEATURE (as sysvinit ought to be too
> IMO)

I know there's some disagreement with the suggestion that the init 
system ought to be a DISTRO_FEATURE but my (admittedly uninformed) 
opinion is that I can't see how we can avoid it.

It looks like systemd provides various interfaces and API's that 
packages may or may not use and as more packages adopt these we're going 
to need to be able to enable/disable more than just some unit 
files/scripts for init support.

> * I'd like to see sysvinit packages splitted onto ${PN}-sysvinit as well

Agreed. Do we need to think about the case where a systemd based system 
might *need* an initscript (no units available) vs. when the -sysvinit 
and -systemd packages both provide similar functionality?

Would it be desirable for the rootfs generation logic to be able to fall 
back to an alternative "initscript" provider?

> * I'd use rootfs generation to install ${PN}-${INIT_SYSTEM} packages for
> packages being installed
>
> Thoughts?

Cheers,
Joshua
-- 
Joshua Lock
         Yocto Project "Johannes factotum"
         Intel Open Source Technology Centre


