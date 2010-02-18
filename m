Received: from qmta07.emeryville.ca.mail.comcast.net ([76.96.30.64])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enelson1000@comcast.net>) id 1NiA7e-0006Gb-4r
	for openembedded-devel@lists.openembedded.org;
	Thu, 18 Feb 2010 18:25:09 +0100
Received: from omta09.emeryville.ca.mail.comcast.net ([76.96.30.20])
	by qmta07.emeryville.ca.mail.comcast.net with comcast
	id jUfM1d0080S2fkCA7VNRw2; Thu, 18 Feb 2010 17:22:25 +0000
Received: from [192.168.1.100] ([173.13.189.149])
	by omta09.emeryville.ca.mail.comcast.net with comcast
	id jVNP1d00E3DqXwV8VVNPwj; Thu, 18 Feb 2010 17:22:24 +0000
From: ed <enelson1000@comcast.net>
To: openembedded-devel@lists.openembedded.org
Date: Thu, 18 Feb 2010 09:22:21 -0800
Message-Id: <1266513741.3907.23.camel@ed-hp-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 76.96.30.64
X-SA-Exim-Mail-From: enelson1000@comcast.net
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: python-sip_4.7.9 recipe question
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
X-List-Received-Date: Thu, 18 Feb 2010 17:25:09 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I am trying to build pyqt for the mini2440.  The image I built completed
with no errors but am having problems when I try and run a simple python
program using pyqt.  The first thing I found was that 
sip.so was not packaged in rootfs image.  So I looked at the
python-sip_4.7.9.bb recipe which requires python-sip.inc.

python.-sip.inc looks like it does all the work.

The log file shows it does all the build tasks. 
1. do_setscene - It complains about the following:

NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
${@python_dir(d)}
NOTE: <type 'exceptions.TypeError'>:exceptions must be classes or
instances, not str while evaluating:
	install -d ${D}${libdir}/${PYTHON_DIR}/site-packages/
	install -m 0755 libsip.so.1.0.0
${D}${libdir}/${PYTHON_DIR}/site-packages/sip.so

2.  All the other tasks run with no complaints.

I find sip.so file in the install and image directories.
tmp/work/armv4t-angstrom-linux-gnueabi/python-sip-4.7.9-ml0
    /install/python-sip/usr/lib/python2.6/site-packages/

tmp/work/armv4t-angstrom-linux-gnueabi/python-sip-4.7.9-ml0
    /image/usr/lib/python2.6/site-packages

In the staging-pkg  I see the following.
tmp/work/armv4t-angstrom-linux-gnueabi/python-sip-4.7.9-ml0
    /staging-pkg/staging/armv4t-angstrom-linux-gnueabi/shlibs/
    python-sip.list ===> contains libsip.so.1
    python-sip.ver ==> contains 4.7.9

So my questions are:
1. Why didn't sip.so end up in my rootfs?
2. Do I also need libsip.so.1 in my rootfs?

Thanks
Ed



