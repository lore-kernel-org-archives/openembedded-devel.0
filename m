Received: from lo.gmane.org ([80.91.229.12])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCTTX-00057g-Ag for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:09:00 +0200
Received: from list by lo.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1OCTPj-0007G4-TB for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 10:05:03 +0200
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 10:05:03 +0200
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 13 May 2010 10:05:03 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
connect(): No such file or directory
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 13 May 2010 09:56:04 +0200
Message-ID: <hsgbak$a9i$2@dough.gmane.org>
References: <1497291088.961273677544100.JavaMail.root@aphid.buglabs.net>
	<1273685689.2355.11.camel@gnutoo-desktop>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.6; en-US;
	rv:1.9.1.9) Gecko/20100428 Shredder/3.0.5pre
In-Reply-To: <1273685689.2355.11.camel@gnutoo-desktop>
X-Enigmail-Version: 1.0.1
X-SA-Exim-Connect-IP: 80.91.229.12
X-SA-Exim-Mail-From: gcho-openembedded-devel@m.gmane.org
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [PATCH] conf/machine/bug20.conf, add xf86-input-tslib for BUG2.0 touchscreen
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
X-List-Received-Date: Thu, 13 May 2010 08:09:00 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

On 12-05-10 19:34, GNUtoo wrote:
> On Wed, 2010-05-12 at 10:19 -0500, John Connolly wrote:
>> *BUG20 is using tslib for xorg touchscreen.
>> *would like this to get into stable
>> *tested on BUG2.0
>> ---
>>  conf/machine/bug20.conf |    1 +
>>  1 files changed, 1 insertions(+), 0 deletions(-)
>>
>> diff --git a/conf/machine/bug20.conf b/conf/machine/bug20.conf
>> index dbc1faf..42c2c12 100644
>> --- a/conf/machine/bug20.conf
>> +++ b/conf/machine/bug20.conf
>> @@ -9,6 +9,7 @@ XSERVER = "xserver-xorg \
>>             xserver-xorg-extension-glx \
>>             xf86-input-evdev \
>>             xf86-input-mouse \
>> +           xf86-input-tslib \
>>             xf86-video-omapfb \
>>             xf86-input-keyboard"
> I don't know what happens if the PR of the tasks using XSERVER are not
> bumped,and that bug20.conf is changed.
> And there are quite a few:
> /recipes/tasks $ grep XSERVER *
> angstrom-task-gnome.bb:XSERVER ?= "xserver-xorg \
> angstrom-task-gnome.bb:  ${XSERVER} \
> angstrom-task-lxde.bb:XSERVER ?= "xserver-xorg \
> angstrom-task-lxde.bb:  ${XSERVER} \
> task-gmae.bb:            ${XSERVER} \
> task-openmoko-ui.bb:XSERVER ?= "xserver-kdrive-fbdev"
> task-openmoko-ui.bb:  ${XSERVER} \
> task-x11.bb:XSERVER ?= "xserver-kdrive-fbdev"
> task-x11.bb:XSERVER_COMMON ?= "xserver-kdrive-common"
> task-x11.bb:XSERVER_COMMON_shr = "xserver-common"
> task-x11.bb:  ${XSERVER} \
> task-x11.bb:  ${XSERVER_COMMON} \
> 
> But in another hand bug20 is a not yet released machine,so nobody would
> have built for bug20 apart buglabs people.

About that, I've been thinking about making a *single* task that only
contains the XSERVER var that can be use by all of the above tasks.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)

iD8DBQFL67CUMkyGM64RGpERArNPAJ9hy0Uc0uyJkIkgN3EQLQXbNdq3MACeLpNo
8VSrLeTGskOUqod5+RhhqVY=
=hXg9
-----END PGP SIGNATURE-----



