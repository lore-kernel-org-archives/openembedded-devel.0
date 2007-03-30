Received: from [64.233.184.231] (helo=wr-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <philipp.zabel@gmail.com>) id 1HXHPA-0004gV-5k
	for openembedded-devel@lists.openembedded.org;
	Fri, 30 Mar 2007 15:44:37 +0200
Received: by wr-out-0506.google.com with SMTP id 55so598241wri
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 30 Mar 2007 06:44:35 -0700 (PDT)
Received: by 10.115.59.1 with SMTP id m1mr731234wak.1175262274555;
	Fri, 30 Mar 2007 06:44:34 -0700 (PDT)
Received: by 10.114.60.9 with HTTP; Fri, 30 Mar 2007 06:44:34 -0700 (PDT)
Message-ID: <74d0deb30703300644n6462aa90kaaa06f199c3c0483@mail.gmail.com>
Date: Fri, 30 Mar 2007 15:44:34 +0200
From: "pHilipp Zabel" <philipp.zabel@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: X11R7.2 / epoch support
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Fri, 30 Mar 2007 13:44:44 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi openembedded-devel,

Yesterday we added the Xorg X11R7.2 release to OpenEmbedded. It is
noteworthy that the packages make use of bitbake/OE's new epoch
support. They drop the temporary X11R7.x_-prefix from their PV version
and instead set the epoch to PE = "1".

This means that bitbake releases without epoch handling (currently up
to 1.8) will think that for example a version X11R7.1_1.1.0 is newer
than 1:1.2.0. To be able to build the new packages with bitbake 1.6 or
1.8, you need to set PREFERRED_VERSIONs. As usual, we have
conf/distro/include/preferred-xorg-versions-X11R7.2.inc for that
reason. The angstrom distro already includes this and therefore now
ships X11R7.2 by default.

The OE epoch support consists of changes to package_ipk.bb and
package_deb.bb to write the epoch into the package control file. I
don't know if other package formats than ipk or deb support epochs
(rpm?) - patches welcome.

happy testing
Philipp


