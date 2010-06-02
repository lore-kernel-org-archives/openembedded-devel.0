Received: from mail-wy0-f175.google.com ([74.125.82.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1OJtg3-0001jW-GP
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Jun 2010 21:32:37 +0200
Received: by wyb32 with SMTP id 32so353555wyb.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 02 Jun 2010 12:28:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=6h/rdBetTlTe1ETH9VHE0/jolfMeRDnkHKIgr22afD0=;
	b=WWENWW+FTld+HjxLExjr1I9zsHRFAQSIXZ8CRRRdcC8nDpbH5mip8OLm/De5TPlRHx
	xT4Oq8iEyB7IUPn+KbmgqgvbwIIB/okq6yWAXrpLKK5tMv+S3J0+krJ394PeqWRcxhN0
	5HpUzZqhiPADLwyQnxrOyjDLk7e0hCaAG0jLE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=P5YipxDF0gbBWqVWpy9bhH5Q5DvaalFu/FFtUiTlpDV2Ftna4W/Q+DOjSE9LAVg3wm
	w4iNwyHnkzv/nKAy5kNUJMtggSe5Ybem8bLgMhrynh2Wc7OjtHsFUYOIFDjN0/wmeTmO
	iu7b9pI2UMdrYtzXxUc3v4HHwCoF9J0//56uM=
MIME-Version: 1.0
Received: by 10.216.170.83 with SMTP id o61mr414108wel.37.1275506899988; Wed, 
	02 Jun 2010 12:28:19 -0700 (PDT)
Received: by 10.216.49.206 with HTTP; Wed, 2 Jun 2010 12:28:19 -0700 (PDT)
Date: Wed, 2 Jun 2010 15:28:19 -0400
Message-ID: <AANLkTinnks0kTFkPqkwLR-TvvzzAvOsfTVaO521fgBMs@mail.gmail.com>
From: Cliff Brake <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.82.175
X-SA-Exim-Mail-From: cliff.brake@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: srctree status
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
X-List-Received-Date: Wed, 02 Jun 2010 19:32:37 -0000
Content-Type: text/plain; charset=ISO-8859-1

Below is a list of know issues with srctree.  I'm testing with the
following source/recipe:

http://cgit.bec-systems.com/cgit.cgi/autotools-demo/

To build:

cd <oe>/recipes
git clone git://git.bec-systems.com/autotools-demo
cd -
bitbake autotools-demo

Below are bitbake changes that are needed:
http://cgit.bec-systems.com/cgit.cgi/bitbake/log/?h=cbrake/1.10-srctree-fixes
(2 patches)

And the following OE changes are needed:
http://cgit.bec-systems.com/cgit.cgi/openembedded/log/?h=2010-06-02_srctree-fix
(1 patch)

There also seems to be an issue in that DEPENDS are not processed
correctly.  I tried the following srctree based recipe:
http://cgit.bec-systems.com/cgit.cgi/qt-overo-palo-gpio/tree/qt-overo-palo-gpio.bb

and bitbake was running the configure task for the above recipe before
the DEPEND's had built (qt-tools, etc).  It seems the DEPENDS variable
is getting set correctly:

DEPENDS="qt4-tools-native qt4-embedded coreutils-native
virtual/arm-angstrom-linux-gnueabi-gcc virtual/libc"

But, perhaps not being processed.

Chris offered the following on IRC:
13:42 < kergoth_> if you aren't using a native or cross version of the
recipe, then you can confidently say you don't need it to do it
13:43 < kergoth_> http://dl.dropbox.com/u/112715/Files/inscm-1.tar.bz2
was what i was experimenting with when i created the class
13:44 < kergoth_> had shasum-native and m4-native going, so needed that code
13:44 < kergoth_> take a look at the class, the merge_tasks function
13:45 < kergoth_> this was also written prior to the new style staging
stuff, so it may need tweaking
13:45 < kergoth_> it explicitly runs do_stage, which isn't likely what
we want it doing

So, thats it :-)

I'd really like to get this going as I think it would make OE a lot
more usable for people building products, as well as anyone who is
doing iterative development on a package that needs to be routinely
compiled for the target system.

Thanks,
Cliff


