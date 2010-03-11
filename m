Received: from smtp7.myhsphere.biz ([204.10.105.69] helo=mail9.myhsphere.biz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <balakrishnan@e-consystems.com>) id 1Nph7u-00020r-J6
	for openembedded-devel@lists.openembedded.org;
	Thu, 11 Mar 2010 13:04:34 +0100
Received: (qmail 7161 invoked by uid 399); 11 Mar 2010 12:01:23 -0000
Received: from dsl-tn-dynamic-216.238.164.122.airtelbroadband.in (HELO
	?192.168.6.250?) (balakrishnan@e-consystems.com@122.164.238.216)
	by mail9.myhsphere.biz with ESMTPAM; 11 Mar 2010 12:01:23 -0000
X-Originating-IP: 122.164.238.216
X-Sender: balakrishnan@e-consystems.com
From: balakrishnan <balakrishnan@e-consystems.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <mailman.3.1268305202.10009.openembedded-devel@lists.openembedded.org>
References: <mailman.3.1268305202.10009.openembedded-devel@lists.openembedded.org>
Date: Thu, 11 Mar 2010 17:31:20 +0530
Message-Id: <1268308880.3822.63.camel@balakrishnan-desktop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-SA-Exim-Connect-IP: 204.10.105.69
X-SA-Exim-Mail-From: balakrishnan@e-consystems.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-1.6 required=5.0 tests=AWL,BAYES_00,HTML_MESSAGE,
	RCVD_IN_BL_SPAMCOP_NET autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: Re: xtscal issue... (Balakrishnan)
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
X-List-Received-Date: Thu, 11 Mar 2010 12:04:35 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit



> On Thu, Mar 11, 2010 at 1:19 PM, balakrishnan
> <balakrishnan@e-consystems.com> wrote:
> > Hi,
> > ? ? ? ?I have faced touch screen calibration issue with Xorg-server
> 1.5.3.
> > While running xtscal application, it is through following error
> >
> > **XCALIBRATE extension missing: Success**
> >
> > How can I resolve this? and calibrate touch screen.
> use ts_calibrate from tslib, or use Kdrive not from Xorg.
> 

yeah, with the tslib only I have calibrated my touch screen. But in
default tslib binaries are not built with rootfs, so I have updated
tslib.inc like below

/***************************************************************************/
FILES_${PN} = "${libdir}/*.so.* ${libdir}/ts/*.so* \
	       ${sysconfdir}/ts.conf ${sysconfdir}/profile.d/tslib.sh
${datadir}/tslib \
		${FILES_tslib-dev} ${libdir}/ts/*.la \
		${bindir}/ts_calibrate \
		${bindir}/ts_harvest ${bindir}/ts_print ${bindir}/ts_print_raw
${bindir}/ts_test "
/*******************************************************************************/

But still binaries are not copied correctly to the final rootfs.

