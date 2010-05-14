Received: from astoria.ccjclearline.com ([64.235.106.9])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpjday@crashcourse.ca>) id 1OCrkm-0001BG-7c
	for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 12:04:25 +0200
Received: from cpe00142a336e11-cm001ac318e826.cpe.net.cable.rogers.com
	([174.113.191.234] helo=crashcourse.ca)
	by astoria.ccjclearline.com with esmtpsa (TLSv1:AES256-SHA:256)
	(Exim 4.69) (envelope-from <rpjday@crashcourse.ca>)
	id 1OCrgz-0007wP-90 for openembedded-devel@lists.openembedded.org;
	Fri, 14 May 2010 06:00:29 -0400
Date: Fri, 14 May 2010 06:00:23 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@lynx
To: OpenEmbedded Development mailing list
	<openembedded-devel@lists.openembedded.org>
Message-ID: <alpine.DEB.2.00.1005140557420.29014@lynx>
User-Agent: Alpine 2.00 (DEB 1167 2008-08-23)
MIME-Version: 1.0
X-AntiAbuse: This header was added to track abuse,
	please include it with any abuse report
X-AntiAbuse: Primary Hostname - astoria.ccjclearline.com
X-AntiAbuse: Original Domain - lists.openembedded.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-SA-Exim-Connect-IP: 64.235.106.9
X-SA-Exim-Mail-From: rpjday@crashcourse.ca
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: numerous "strip command failed" ERRORs in building beagle image
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
X-List-Received-Date: Fri, 14 May 2010 10:04:25 -0000
Content-Type: TEXT/PLAIN; charset=US-ASCII


  obviously not fatal since the build kept chugging along, but there
were a number of "ERROR"s of the following form:


NOTE: Running task 3873 of 11130 (ID: 4231,
/home/rpjday/oe/openembedded/recipes/xcb/libpthread-stubs_0.2.bb,
do_patch)
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/rpjday/oe/angstrom-dev/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r75+gitr627293ad28604b22612f9a4a318f64cfab241e22/package/kernel/scripts/pnmtologo''
strip command failed
ERROR: runstrip: ''arm-angstrom-linux-gnueabi-strip'
--remove-section=.comment --remove-section=.note
'/home/rpjday/oe/angstrom-dev/work/beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r75+gitr627293ad28604b22612f9a4a318f64cfab241e22/package/kernel/scripts/bin2c''
strip command failed
... etc etc ...

  normally, i don't care but i typically take anything labelled as an
"ERROR" seriously so if it's genuinely not an error, perhaps it should
be relabelled.  (suggested from a position of complete ignorance.)

rday

-- 

========================================================================
Robert P. J. Day                               Waterloo, Ontario, CANADA

            Linux Consulting, Training and Kernel Pedantry.

Web page:                                          http://crashcourse.ca
Twitter:                                       http://twitter.com/rpjday
========================================================================


