Received: from moutng.kundenserver.de ([212.227.17.8])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <robert@projekt131.de>) id 1RzRZI-0002pS-9l
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Feb 2012 12:38:08 +0100
Received: from freya (kamel.E-Technik.Uni-Dortmund.DE [129.217.182.56])
	by mrelayeu.kundenserver.de (node=mreu1) with ESMTP (Nemesis)
	id 0La0Ij-1Sl6cj2YPd-00lk4n; Mon, 20 Feb 2012 12:05:48 +0100
From: "Robert Budde" <robert@projekt131.de>
To: <openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Feb 2012 12:05:48 +0100
Message-ID: <002c01ccefbf$99ccf580$cd66e080$@projekt131.de>
MIME-Version: 1.0
X-Mailer: Microsoft Outlook 14.0
Thread-Index: Aczvv5lSkDGu3JUFRmiz2JRwgJlfvA==
X-Provags-ID: V02:K0:hhUJf9LXBL79W77D2t0jVwMRnSdmq5vv0pKdCdQuqFp
	NDKYnM/13nwvY/U0rP8a1Vm6/Io1Ar3soKmzPC/XCoRJYq4y8J
	rL0dbb7bHF9LfroQfBAr5egK5MNJji05lSnyH2k0IaSAOm87UH
	DkrVyIRUMWCUJLoLl5nU2JcNOVn4v3p5iaFKslRpb/dt14EWRJ
	36kkFfqtB5GwdPMqyujeEkOr34tkTmqXDhx+5NFieSYGNqU6Ez
	ujlA+Qgns6mMnY9vR4LJJKpb7T939WwBbeLJdDHnxD09QYj9Ye
	h4XAPsdgFVaQVeuMaAvhOQdwhcVdRC99y6PqSxat/gDLptBrVS
	Kgv7KCH2tNffOun1p6O0Sp1VSIKT/CZVC9whlYBAk
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Deploy binaries not compiled for target / PACKAGE_STRIP = "no" does not work?
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
X-List-Received-Date: Mon, 20 Feb 2012 11:38:08 -0000
Content-Language: de
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hi!

 

I am trying to write a recipe for packaging "webmin". The web-interface for
system administration is written entirely in PERL, therefore it "just" has
to be copied to the right directory (and some conf-files have to be
generated). Right now the recipe should download the right archive and copy
the files to the right directory. As the archive contains precompiled
binaries the "strip"-operations in do_package() fail!? I tried to get rid of
it by 'PACKAGE_STRIP = "no"', but that does not work.

 

webmin_1.580.bb: http://pastebin.com/7T9duc7j

webmin.inc: http://pastebin.com/ZUcqGSGF

 

NOTE: Preparing runqueue

NOTE: Executing SetScene Tasks

NOTE: Executing RunQueue Tasks

NOTE: Running task 995 of 1324 (ID: 9,
/angstrom/setup-scripts/meta-omnigateipes/webmin/webmin_1.580.bb,
do_package)

NOTE: package webmin-1.580-r3.0: task do_package: Started

ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comme-remove-section=.note
'/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglwork/armv7a-angstrom-l
inux-gnueabi/webmin-1.580-r3.0/package/usr/share/webmiunt/freebsd-mounts-3''
strip command failed

ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comme-remove-section=.note --strip-unneeded
'/angstrom/setup-scripts/build/tmp-anom_2010_x-eglibc/work/armv7a-angstrom-l
inux-gnueabi/webmin-1.580-r3.0/packagr/share/webmin/acl/Authen-SolarisRBAC-0
.1/blib/arch/auto/Authen/SolarisRBAC/risRBAC.so'' strip command failed

ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comme-remove-section=.note
'/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglwork/armv7a-angstrom-l
inux-gnueabi/webmin-1.580-r3.0/package/usr/share/webmiunt/freebsd-mounts-4''
strip command failed

ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comme-remove-section=.note
'/angstrom/setup-scripts/build/tmp-angstrom_2010_x-eglwork/armv7a-angstrom-l
inux-gnueabi/webmin-1.580-r3.0/package/usr/share/webmiunt/freebsd-mounts-5''
strip command failed

 

Any ideas? Is there an alternative to tell bitbake/oe just to deploy the
files?

 

Best regards,

Robert


