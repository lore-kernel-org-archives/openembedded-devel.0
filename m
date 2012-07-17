Received: from plane.gmane.org ([80.91.229.3])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sr4BW-0001tw-Ul for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 11:35:15 +0200
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1Sr40a-0002L3-22 for openembedded-devel@lists.openembedded.org;
	Tue, 17 Jul 2012 11:23:56 +0200
Received: from 188.207.89.201 ([188.207.89.201])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 11:23:55 +0200
Received: from koen by 188.207.89.201 with local (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@lists.openembedded.org>;
	Tue, 17 Jul 2012 11:23:55 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@lists.openembedded.org
From: Koen Kooi <koen@dominion.thruhere.net>
Date: Tue, 17 Jul 2012 11:23:43 +0200
Message-ID: <ju3auv$81f$1@dough.gmane.org>
References: <20120716074256.12AC410334@opal>
	<20120716182528.GO3729@jama.jama.net>
	<CALbNGRRd0ndx_CLht9e-vhRizm=ERkoyCugtZ7jb58i-QW34qg@mail.gmail.com>
	<20120717091818.GA3390@jama.jama.net>
Mime-Version: 1.0
X-Complaints-To: usenet@dough.gmane.org
X-Gmane-NNTP-Posting-Host: 188.207.89.201
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7;
	rv:12.0) Gecko/20120428 Thunderbird/12.0.1
In-Reply-To: <20120717091818.GA3390@jama.jama.net>
X-Enigmail-Version: 1.4.2
Subject: =?UTF-8?B?UmU6IFtvZS1jb21taXRzXSBBbmRyZWFzIE3DvGxsZXIgOiBzeXN0ZW1kLmJiY2xhc3M6IGFkZCAqLXN5c3RlbWQgcGFja2FnZXMgdG8gUlJFQ09NTUVORFM=?=
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
X-List-Received-Date: Tue, 17 Jul 2012 09:35:15 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA1

Op 17-07-12 11:18, Martin Jansa schreef:
> On Tue, Jul 17, 2012 at 10:54:41AM +0200, Andreas Müller wrote:
>> On Mon, Jul 16, 2012 at 8:25 PM, Martin Jansa <martin.jansa@gmail.com>
>> wrote:
>>> On Mon, Jul 16, 2012 at 07:42:56AM +0000, git@git.openembedded.org
>>> wrote:
>>>> Module: meta-openembedded.git Branch: master Commit:
>>>> 264e5a44e1111f939b43c11bb9514a0b435918db URL:
>>>> http://git.openembedded.org/?p=meta-openembedded.git&a=commit;h=264e5a44e1111f939b43c11bb9514a0b435918db
>>>>
>>>>
>>>> 
Author: Andreas Müller <schnitzeltony@googlemail.com>
>>>> Date:   Wed Jul 11 20:46:07 2012 +0200
>>>> 
>>>> systemd.bbclass: add *-systemd packages to RRECOMMENDS
>>> 
>>> This is a bit unfortunate e.g. when busybox is used in small chroot 
>>> image. busybox pulls busybox-syslog, which now adds
>>> busybox-syslog-systemd and it ends with
>>> systemd/dbus/udev/shadow/pam/util-linux/kmod being added to
>>> previously small image, see:
>>> 
>>> http://git.shr-project.org/git/?p=buildhistory.git;a=blobdiff;f=images/crespo/eglibc/chroot-image/installed-package-names.txt;h=07187b9e51bd0199910152a8019d117ed41cc2db;hp=8f401e657dd449e30fe8183dc86a791d09614d9f;hb=ac04304bb15221b49e5af6838068f158e7d628ed;hpb=4c0555e7fa689c3c20902c7fc1ec8e525769723f
>>>
>>>
>>> 
So it could be solved by image specific BAD_RECOMMENDATIONs or something
>>> like that, but by default it doesn't work very well in this
>>> use-case.
>>> 
>>> Cheers,
>>> 
>> I think the image specific BAD_RECOMMENDATION is not that easy to 
>> implement and to handle by user. I am 'dreaming' of of a distro layer 
>> blacklist. So in your case the distro could mask out whole 
>> meta-systemd. Could you live with that?
> 
> No, as the same distro is used to create full images with systemd and 
> this chroot-image is just small initramfs for kernel (where 
> systemd+friends is really not needed/expected).

I think the easiest solution is to remove 'inherit systemd' from busybox.
-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.5 (Darwin)
Comment: GPGTools - http://gpgtools.org

iD8DBQFQBS8fMkyGM64RGpERAlJGAKC4n4q1daBZUi9ltRWaY5jW4GKEcQCfeOxE
amLnSb79qfeIuA1HExCF2M0=
=ypGT
-----END PGP SIGNATURE-----



