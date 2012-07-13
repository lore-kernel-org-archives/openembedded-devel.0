Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1SpdlX-0005Fw-Cm for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 13:10:31 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Spdag-0001iW-LG for openembedded-devel@lists.openembedded.org;
	Fri, 13 Jul 2012 12:59:18 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 12:59:18 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Jul 2012 12:59:18 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Fri, 13 Jul 2012 12:59:07 +0200
Message-ID: <jtov1q$i08$1@dough.gmane.org>
References: <1342168240-7760-1-git-send-email-schnitzeltony@googlemail.com>
	<1342168240-7760-15-git-send-email-schnitzeltony@googlemail.com>
	<jtonri$ov3$2@dough.gmane.org>
	<CALbNGRR1ezjSQOaPwZpBDSdjHJ_GRLOuXUQ--ZJdaK07kDS-ow@mail.gmail.com>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <CALbNGRR1ezjSQOaPwZpBDSdjHJ_GRLOuXUQ--ZJdaK07kDS-ow@mail.gmail.com>
X-Enigmail-Version: 1.4.2
Subject: Re: [meta-oe, V2 14/32] udisks: move systemd support to meta-systemd
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
X-List-Received-Date: Fri, 13 Jul 2012 11:10:31 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 13-07-12 11:40, Andreas Müller schreef:
> On Fri, Jul 13, 2012 at 10:56 AM, Koen Kooi <koen@dominion.thruhere.net>
> wrote:
>> -----BEGIN PGP SIGNED MESSAGE----- Hash: SHA1
>> 
>> Op 13-07-12 10:30, Andreas Müller schreef:
>>> Signed-off-by: Andreas Müller <schnitzeltony@googlemail.com> --- 
>>> meta-oe/recipes-support/udisks/udisks_1.0.4.bb     |   10 +++------- 
>>> .../udisks/udisks/add-systemd-support.patch        |    0 
>>> .../recipes-support/udisks/udisks_1.0.4.bbappend   |   13
>>> +++++++++++++
>> 
>> As a more generic remark about udisks and systemd: no need to start
>> this units on boot, they get automatically started when needed when
>> using a GUI. I'm not sure there are any non-GUI users of udisks
>> currently, but if there are, please speak up!
>> 
>> regards,
>> 
>> Koen
> I did the udisks systemd patch long time ago [1]. At that time it fixed
> automount problem in xfce dm-less environment. I will test without
> starting on boot and let you know.

To be clear: that change isn't needed for this patchset to go in :)
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFP//96MkyGM64RGpERAvM6AJ41XGUAU2NKxCqhYlv3GrTP/x/z3ACfTIr+
DXsxPGVTFlP/1qV+RcfO5RY=
=+wno
-----END PGP SIGNATURE-----



