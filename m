Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSnDg-0001XT-Js for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 11:04:54 +0100
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1RSlEr-0003Re-Vy for openembedded-devel@lists.openembedded.org;
	Tue, 22 Nov 2011 08:57:57 +0100
Received: from ip545070eb.adsl-surfen.hetnet.nl ([84.80.112.235])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 08:57:57 +0100
Received: from koen by ip545070eb.adsl-surfen.hetnet.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 22 Nov 2011 08:57:57 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 22 Nov 2011 08:57:43 +0100
Message-ID: <jafkln$of4$1@dough.gmane.org>
References: <1321905239-3527-1-git-send-email-schnitzeltony@gmx.de>
	<jaeia9$bll$1@dough.gmane.org>
	<201111220049.20452.schnitzeltony@gmx.de>
	<201111220144.15440.schnitzeltony@gmx.de>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: ip545070eb.adsl-surfen.hetnet.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:8.0) Gecko/20111105 Thunderbird/8.0
In-Reply-To: <201111220144.15440.schnitzeltony@gmx.de>
X-Enigmail-Version: 1.3.3
Subject: Re: [meta-oe][V2 0/4] libnl and iw updates to make networkmanager work
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
X-List-Received-Date: Tue, 22 Nov 2011 10:04:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-11-11 01:44, Andreas Müller schreef:
> On Tuesday, November 22, 2011 12:49:20 AM Andreas Müller wrote:
>> On Monday, November 21, 2011 11:11:22 PM Koen Kooi wrote:
>>> Op 21-11-11 20:53, Andreas Müller schreef:
>>>> V1 -> V2: networkmanager bump PR
>>>> 
>>>> Note: It might be required to rebuild wpa-supplicant coming from 
>>>> oe-core.
>>> 
>>> I'll apply this set tomorrow if there are no comments, but could you
>>> also push libnl3 into oe-core and then bump PR for wpa-supplicant? If
>>> not, could you add a wpa-supplicant bbappend that simply does PR_INC
>>> = 1 (or PRINC, I forget) ?
>> 
>> how about:
>> 
>> 1st step: I'll send V3 in a few minutes with wpa-supplicant PR bump.
>> 
>> 2nd step: * libnl-3 -> oe-core and remove workarounds for
>> wpa-supplicant (symlink include/lib) * modify wpa-supplicant so that it
>> works with libnl-3 without workarounds & PR bump +2 * iw -> oe-core?
>> 
>> Since I am under pressure in my first life, 2nd step may take a few
>> days.
>> 
>> What do you think?
>> 
> Sorry for spamming but: how about 2nd step only?

I'm fine with either, but since you sent a v3 already, do you want me to
apply it?

regards,

Koen
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (Darwin)
Comment: GPGTools - http://gpgtools.org

iEYEARECAAYFAk7LVfUACgkQMkyGM64RGpGZHgCeN4ob+HRSlwPRzJEKodaTMBDB
hoAAn01kwtNCtxiurR1C2XsFo4Ded+ot
=Y+pG
-----END PGP SIGNATURE-----



