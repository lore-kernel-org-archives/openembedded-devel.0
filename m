Received: from mail-ww0-f43.google.com ([74.125.82.43])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1PLfZw-0001wv-Lx
	for openembedded-devel@lists.openembedded.org;
	Thu, 25 Nov 2010 18:25:53 +0100
Received: by wwb31 with SMTP id 31so266417wwb.24
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 25 Nov 2010 09:24:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=bwiO9WKCJ5gJPrs3GPEx5zV1G35rw8gVerjlPkyf+7U=;
	b=wtQqu4EgUQROSYa5SUYQViUN89i9pgE/+NQ4QzVrsnC65ea0liAu/0SgRAOv63EJ+o
	eDd2GhaPdlzbEZ3NovAZIyuEC6enStSr0Gk9W25uybed2uS+1zoZTMOxS03zjda7tJQp
	QrjTJWr+fWoV/o/CXo2J8dr9hsu1sX/ac/9Eo=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=RfC8UIlNGogrfEnIE/QR+LrNFP4tMRx8igo4BXR9HhKkePwwvnagKhqOKUb54K3Ix2
	FBAL6U7hiJZdSrRzJL7ehOnT1PsKou2Bv6dRxkxthb6SqQt67fJqFjbPwKmn4cOA6ZAV
	/y+kGV2giAjHl3d+ZMwjgiMFRDgHPIIiaDPQM=
MIME-Version: 1.0
Received: by 10.216.173.194 with SMTP id v44mr965817wel.100.1290705876976;
	Thu, 25 Nov 2010 09:24:36 -0800 (PST)
Received: by 10.216.49.130 with HTTP; Thu, 25 Nov 2010 09:24:36 -0800 (PST)
Date: Thu, 25 Nov 2010 18:24:36 +0100
Message-ID: <AANLkTinbu9JpEw5fdX8pHcxraf4uTdCf7JKm9v1UekeS@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.43
X-SA-Exim-Mail-From: andrea.adami@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: bluez-dtl1-workaround not provided?
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
X-List-Received-Date: Thu, 25 Nov 2010 17:25:53 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hello,

build from scratch of console image for c7x0/armv5te leads to:

...
Configuring sysvinit.
Collected errors:
 * satisfy_dependencies_for: Cannot satisfy the following dependencies
for task-base-extended:
 * <--->bluez-dtl1-workaround *.
 * opkg_install_cmd: Cannot install package task-base-extended.
 * resolve_conffiles: Existing conffile
/oe/build/tmp/rootfs/console-image/etc/device_table is different from
the conffile in the new package. The new conffile will be placed at
/oe/build/tmp/rootfs/console-image/etc/device_table-opkg.

A quick grep reveals:

andrea@mizar /oe/openembedded $ grep -R bluez-dtl1-workaround .
Binary file ./.git/index matches
./classes/kernel.bbclass:DEPENDS_kernel-module-dtl1-cs = "bluez-dtl1-workaround"
./classes/kernel.bbclass:RDEPENDS_kernel-module-dtl1-cs =
"bluez-dtl1-workaround"
./conf/machine/jornada7xx.conf:MACHINE_EXTRA_RDEPENDS =
"kernel-modules bluez-dtl1-workaround"
./recipes/tasks/task-base.bb:    ${@base_contains('COMBINED_FEATURES',
'pcmcia', 'bluez-dtl1-workaround', '',d)} \
./recipes/tasks/task-base.bb:# bluez-dtl1-workaround above is
workaround for bitbake not handling DEPENDS on it in
andrea@mizar /oe/openembedded $


So, first doubt is: why make this mandatory for everyone having pcmcia?
Second, why is it failing now?

Any idea?

Andrea


