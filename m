Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TmMGY-0001Se-UE for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 11:25:16 +0100
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1TmM2S-0004Gi-HR for openembedded-devel@lists.openembedded.org;
	Sat, 22 Dec 2012 11:10:40 +0100
Received: from ip4da2a5ae.direct-adsl.nl ([77.162.165.174])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 11:10:40 +0100
Received: from koen by ip4da2a5ae.direct-adsl.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 22 Dec 2012 11:10:40 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Sat, 22 Dec 2012 11:10:09 +0100
Message-ID: <kb40tq$84p$1@ger.gmane.org>
References: <CAMBWrQnMQtEs78=OtkSR1mjctfet8ArQ_XE43wDB6-6NKiDShA@mail.gmail.com>
	<CAMBWrQm6UbF9t5sAn=oudmhQ2MJdDNMb3ki6o7_sdjErun4SWw@mail.gmail.com>
	<CA+chaQcvSts25RvERVyOxOcsqaLRfADf8zTq_YpqAB8Bp_O+fg@mail.gmail.com>
	<CAMBWrQ=J8n9tm99UT0QvcU1oB4kUtpH+kguDUYfxWP7_u_TPYQ@mail.gmail.com>
	<20121222100318.14a48e10@eb-e6520>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip4da2a5ae.direct-adsl.nl
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.8;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
In-Reply-To: <20121222100318.14a48e10@eb-e6520>
X-Enigmail-Version: 1.4.6
Subject: Re: Multiple .bb files are due to be built which each provide udev
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
X-List-Received-Date: Sat, 22 Dec 2012 10:25:17 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 22-12-12 10:03, Eric Bénard schreef:
> Hi Stan,
> 
> Le Fri, 21 Dec 2012 13:18:26 -0800, Stan Hu <stanhu@gmail.com> a écrit :
> 
>> Thanks.  Oops, I meant the denzil branch.  It was updated today and
>> has this bug you reference.
>> 
> OK I now also reproduce this (my default images don't have udev so I 
> didn't saw that when testing denzil-next) in meta-toolchain-qte.
> 
> Here setting PREFERRED_PROVIDER_udev = "systemd" workaround the problem
> (at least for meta-toolchain-qte but I'm not using udev nor systemd so I
> can't really test if a rootfs using udev still works this way) ?
> 
> The problem seems to come from : 
> 6e0ddd4526f3e0005babe9381c17c06c22a9eda3 wheere commit log says "systemd:
> update to v189" but in reallity it also adds udev packages in systemd
> recipe.
> 
> At first sight, I think I'll revert this patch as it will break denzil 
> builds which is not what we should expect from a stable branch.

Please don't revert it, I really need those updates in denzil. Setting
PREFERRED_PROVIDER_udev is easy enough



-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQ1YcBMkyGM64RGpERArmIAJ9GMjzNj/qB3HQZiT72K3FF8wENggCfZ4Wk
jMcK4E7b7S/TNJrPRK0llQc=
=U+7o
-----END PGP SIGNATURE-----



