Received: from [124.219.5.209] (helo=aakash.openmoko.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1KLZlF-00081G-0a
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jul 2008 10:31:49 +0200
Received: from [172.16.23.111] (helo=buddha.tw.openmoko.com)
	by aakash.openmoko.org with esmtpsa (TLS-1.0:RSA_AES_256_CBC_SHA1:32)
	(Exim 4.63) (envelope-from <john_lee@openmoko.com>)
	id 1KLZjv-0006Cr-Qw for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jul 2008 16:30:36 +0800
Received: from john by buddha.tw.openmoko.com with local (Exim 4.69)
	(envelope-from <john_lee@openmoko.com>) id 1KLZiQ-00024D-P8
	for openembedded-devel@lists.openembedded.org;
	Wed, 23 Jul 2008 16:28:54 +0800
Date: Wed, 23 Jul 2008 16:28:54 +0800
From: John Lee <john_lee@openmoko.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Message-ID: <20080723082854.GA4431@buddha.tw.openmoko.com>
Mail-Followup-To: openembedded-devel
	<openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
User-Agent: Mutt/1.5.18 (2008-05-17)
X-SA-Exim-Connect-IP: 172.16.23.111
X-SA-Exim-Mail-From: john_lee@openmoko.com
X-Spam-Checker-Version: SpamAssassin 3.1.7-deb (2006-10-05) on 
	aakash.openmoko.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=5.0 tests=ALL_TRUSTED,AWL,BAYES_00 
	autolearn=ham version=3.1.7-deb
X-SA-Exim-Version: 4.2.1 (built Tue, 09 Jan 2007 17:23:22 +0000)
X-SA-Exim-Scanned: Yes (on aakash.openmoko.org)
Subject: python-efl does not compile with cython 0.9.8
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.10
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
X-List-Received-Date: Wed, 23 Jul 2008 08:31:49 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

FYI:

python-efl (python-evas, python-ecore, etc) only compiles with cython
0.9.6.14, not 0.9.8.  this is due to some include path and syntax
changes.  either python-efl guys should fix it or we have to set
preferred version of python-cython-native in local.conf.


Regards,
John


