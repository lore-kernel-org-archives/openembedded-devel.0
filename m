Received: from futzingaround.com ([67.212.234.189])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <o2e@saaworld.com>) id 1PBdYa-0000sl-TY
	for openembedded-devel@lists.openembedded.org;
	Fri, 29 Oct 2010 03:15:03 +0200
Received: from [192.168.154.227] ([216.239.45.19]) (authenticated bits=0)
	by futzingaround.com (8.13.1/8.13.1) with ESMTP id o9T1EFgV029840
	(version=TLSv1/SSLv3 cipher=AES128-SHA bits=128 verify=NO);
	Thu, 28 Oct 2010 18:14:16 -0700
From: Scott Anderson <o2e@saaworld.com>
Date: Thu, 28 Oct 2010 18:14:15 -0700
Message-Id: <7CA724BF-0546-44EC-BE42-A042B0CBEA7B@saaworld.com>
To: koen@openembedded.org
Mime-Version: 1.0 (Apple Message framework v1081)
X-Mailer: Apple Mail (2.1081)
X-SA-Exim-Connect-IP: 67.212.234.189
X-SA-Exim-Mail-From: o2e@saaworld.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Missing space in patch for "linux.inc: add knob to turn off cortex a8 fixups"
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
X-List-Received-Date: Fri, 29 Oct 2010 01:15:03 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

Hi Koen,

I was looking in  =
.../beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r90+gitra6bad=
4464f985fdd3bed72e1b82dcbfc004d7869/temp/log.do_compileconfigs.25634 =
today and saw it complaining:
  =
.../beagleboard-angstrom-linux-gnueabi/linux-omap-psp-2.6.32-r90+gitra6bad=
4464f985fdd3bed72e1b82dcbfc004d7869/temp/run.do_compileconfigs.25634: =
line 679: [: missing `]'

I believe this change:
  =
http://cgit.openembedded.org/cgit.cgi/openembedded/diff/recipes/linux/linu=
x.inc?id=3D88335ada413098838c3c8315b90183eef1ccd0d3
should have a space between "yes" and the closing square bracket.

Hope this is useful,
  SAA



