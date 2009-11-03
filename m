Received: from [87.249.123.12] (helo=smtp.nedap.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jaap.dejong@nedap.com>) id 1N5Jc9-00058P-H4
	for openembedded-devel@lists.openembedded.org;
	Tue, 03 Nov 2009 14:40:04 +0100
Received: from nvs0066.nedap.local ([10.91.8.1]) by smtp.nedap.com with
	Microsoft SMTPSVC(6.0.3790.1830); Tue, 3 Nov 2009 14:38:49 +0100
X-TM-IMSS-Message-ID: <35adc0ac00016c31@nedap.com>
Received: from [10.2.40.9] ([10.2.40.9]) by nedap.com ([10.91.8.1]) with ESMTP
	(TREND IMSS SMTP Service 7.0) id 35adc0ac00016c31 for
	<jaap.dejong@nedap.com>; Tue, 3 Nov 2009 14:38:46 +0100
From: Jaap de Jong <jaap.dejong@nedap.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <hcp7pt$ne9$1@ger.gmane.org>
References: <1257250214.22826.88.camel@nvc0624> <hcp7pt$ne9$1@ger.gmane.org>
Date: Tue, 03 Nov 2009 14:35:45 +0100
Message-ID: <1257255345.13860.0.camel@nvc0624>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.1 
X-OriginalArrivalTime: 03 Nov 2009 13:38:49.0893 (UTC)
	FILETIME=[F9C17D50:01CA5C8A]
X-SA-Exim-Connect-IP: 87.249.123.12
X-SA-Exim-Mail-From: jaap.dejong@nedap.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: Re: [PATCH] suite of utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs
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
X-List-Received-Date: Tue, 03 Nov 2009 13:40:04 -0000
X-Groupsio-MsgNum: 13812
Content-Type: multipart/mixed; boundary="=-22zdVf3vXa2FupebQAB5"

--=-22zdVf3vXa2FupebQAB5
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Updated.
Much simpeler now...

On Tue, 2009-11-03 at 13:30 +0100, Koen Kooi wrote:
> On 03-11-09 13:10, Jaap de Jong wrote:
> > Hi there,
> >
> > attached a proposal for a recipe for building a jtag tool for programming xilinx cpld's, fpga's and eeprom's.
> > Disclaimer: this is my first recipe; possibly not optimal...
> 
> Please use something like
> 
> SRC_URI = 
> "svn://xc3sprog.svn.sourceforge.net/svnroot/xc3sprog;proto=https;module=trunk" 
> 
> 
> and set SRCREV accordingly instead of overriding do_fetch.
> 
> regards,
> 
> Koen
> 
> 
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


--=-22zdVf3vXa2FupebQAB5
Content-Disposition: attachment; filename*0=0001-Suite-of-utilities-for-programming-Xilinx-FPGAs-CPLD.pat; filename*1=ch
Content-Type: text/x-patch; name="0001-Suite-of-utilities-for-programming-Xilinx-FPGAs-CPLD.patch"; charset="UTF-8"
Content-Transfer-Encoding: 7bit


Suite of utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs

---
 recipes/xc3sprog/xc3sprog_411.bb |   15 +++++++++++++++
 1 files changed, 15 insertions(+), 0 deletions(-)
 create mode 100644 recipes/xc3sprog/xc3sprog_411.bb

diff --git a/recipes/xc3sprog/xc3sprog_411.bb b/recipes/xc3sprog/xc3sprog_411.bb
new file mode 100644
index 0000000..0ffc4dc
--- /dev/null
+++ b/recipes/xc3sprog/xc3sprog_411.bb
@@ -0,0 +1,15 @@
+# xc3sprog build file
+LICENSE="GPL"
+DESCRIPTION="suite of utilities for programming Xilinx FPGAs, CPLDs, and EEPROMs"
+HOMEPAGE="http://sourceforge.net/projects/xc3sprog"
+
+DEPENDS += "libftdi"
+
+SRC_URI = "svn://xc3sprog.svn.sourceforge.net/svnroot/xc3sprog;proto=https;module=trunk" 
+SRCREV = ${PV}
+
+S="${WORKDIR}/trunk"
+PR = "r0"
+
+inherit cmake
+
-- 
1.6.3.3


--=-22zdVf3vXa2FupebQAB5--
