Received: from rrcs-98-100-91-244.central.biz.rr.com ([98.100.91.244]
	helo=pluto.melinkcorp.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <bevenson@melinkcorp.com>) id 1T3S7l-0007Rb-74
	for openembedded-devel@lists.openembedded.org;
	Mon, 20 Aug 2012 15:34:33 +0200
Received: from pluto.melinkcorp.local ([10.0.2.4]) by pluto.melinkcorp.local
	([10.0.2.4]) with mapi; Mon, 20 Aug 2012 09:21:23 -0400
From: Bryan Evenson <bevenson@melinkcorp.com>
To: "openembedded-devel@lists.openembedded.org"
	<openembedded-devel@lists.openembedded.org>
Date: Mon, 20 Aug 2012 09:21:23 -0400
Thread-Topic: Cron job additions from image and package update
Thread-Index: Ac1+1rGBsCY21SNyQj2/xTxJglY20w==
Message-ID: <91586D499ADFD74FBCFB8425266A5DE4012C6BAE354C@pluto.melinkcorp.local>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-vipre-scanned: 02DA088700319E02DA09D4
acceptlanguage: en-US
MIME-Version: 1.0
Subject: Cron job additions from image and package update
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
X-List-Received-Date: Mon, 20 Aug 2012 13:34:33 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I am on the 2011.03-maintenance branch of OpenEmbedded.  I have a few cron =
jobs that I want my device to run, but I am having issues getting updated i=
mages to apply the new cron job list.  I would like the cron jobs to be ins=
talled for root in the built image and I would also like to be able to upda=
te the cron job list through an appropriate package.  I am having problems =
with both tasks.

First, I have a customized image for my system.  In the image recipe, I am =
using an addition to the ROOTFS_POSTPROCESS_COMMAND to add my cron job list=
.  This is what I am doing so far inside my image's Bitbake recipe related =
to cron:

rootfs_postprocess() {
	# cron: Add cron jobs for our image
	cd ${IMAGE_ROOTFS}
	cd etc
	echo '<text for job 1>' > temp_cron.txt
	echo '<text for job 2>' >> temp_cron.txt
    	echo '<text for job 3>' >> temp_cron.txt
	crontab temp_cron.txt
}

ROOTFS_POSTPROCESS_COMMAND +=3D " rootfs_postprocess; "

When I bitbake my image and look at the resulting filesystem, I see that /e=
tc/temp_cron.txt exists but there are no entries under /var/cron/tabs.  If =
I burn my new image onto a board, login as root and then call "crontab /etc=
/temp_cron.txt", then the cron jobs are installed as expected.  I've also t=
ried changing the last line of the rootfs_postprocess function to "crontab =
-u root temp_cron.txt", but then I get then following error during the imag=
e build:

| ERROR: ld.so: object 'libfakeroot.so' from LD_PRELOAD cannot be preloaded=
: ignored.
| must be privileged to use -u

I assume this is all related to some intricacies of using crontab under fak=
eroot but I haven't yet found a solution.  Anyone else successfully install=
ing cron jobs on their image?

Also, this would then install the cron jobs on the image but there is no op=
kg package created that contains the updated cron job list.  I would like t=
o be able to perform an opkg install or upgrade to apply new system setting=
s like this.  Do I need to create a separate recipe so that these system fi=
les are included in a package, or is there a ways to do this from my existi=
ng image recipe?

Thanks,
Bryan Evenson



