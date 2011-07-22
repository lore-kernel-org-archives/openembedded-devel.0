Received: from c2beaomr09.btconnect.com ([213.123.26.187]
	helo=mail.btconnect.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <smith@trdeo.co.uk>) id 1QkCzS-0003tz-Q3
	for openembedded-devel@linuxtogo.org; Fri, 22 Jul 2011 12:29:55 +0200
Received: from host109-149-246-170.range109-149.btcentralplus.com (EHLO
	_192.168.0.12_) ([109.149.246.170]) by c2beaomr09.btconnect.com
	with ESMTP id DTC89043; Fri, 22 Jul 2011 11:22:01 +0100 (BST)
From: Rob Smith <smith@trdeo.co.uk>
To: openembedded-devel@linuxtogo.org
Date: Fri, 22 Jul 2011 11:22:00 +0100
Message-ID: <1311330120.1861.13.camel@avalanches>
Mime-Version: 1.0
X-Mailer: Evolution 2.32.2 
X-Mirapoint-IP-Reputation: reputation=Fair-1, source=Queried,
	refid=tid=0001.0A0B0301.4E294F49.00A1, actions=tag
X-Junkmail-Premium-Raw: score=7/50, refid=2.7.2:2011.7.22.100618:17:7.586,
	ip=109.149.246.170, rules=__TO_MALFORMED_2,
	__TO_NO_NAME, __CT, __CT_TEXT_PLAIN, __HAS_MSGID,
	__SANE_MSGID, INVALID_MSGID_NO_FQDN, __MIME_VERSION,
	__HAS_X_MAILER, __CTE, __CP_MEDIA_BODY,
	BODYTEXTP_SIZE_3000_LESS, BODY_SIZE_900_999,
	__MIME_TEXT_ONLY, RDNS_GENERIC_POOLED,
	BODY_SIZE_5000_LESS, RDNS_SUSP_GENERIC,
	BODY_SIZE_1000_LESS, RDNS_SUSP, BODY_SIZE_2000_LESS,
	BODY_SIZE_7000_LESS, NO_URI_FOUND
X-Junkmail-Status: score=10/50, host=c2beaomr09.btconnect.com
X-Junkmail-Signature-Raw: score=unknown,
	refid=str=0001.0A0B020D.4E294FEC.002F,ss=1,fgs=0,
	ip=0.0.0.0, so=2010-07-22 22:03:31,
	dmn=2009-09-10 00:05:08, mode=multiengine
X-Junkmail-IWF: false
Subject: Problem with task do_package_update_index_ipk
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
X-List-Received-Date: Fri, 22 Jul 2011 10:29:55 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

Hello,

I've encountered a strange problem that seems to have arisen from
nowhere. Essentially, when I try to bitbake an image
(omap3-console-image), the process gets completely stuck in the task
do_package_update_index_ipk. Its currently been running for over 4
hours. Yesterday, it was working fine, and would take only a few minutes
for that task to complete.

This morning, all I changed was some configure options for the packages
gst-plugins-base and gst-plugins-good, cleaned them, and then rebuilt,
using these commands:

# bitbake gst-plugins-base -c clean
# bitbake gst-plugins-base
# bitbake gst-plugins-good -c clean
# bitbake gst-plugins-good
# bitbake omap3-console-image

This last command gets stuck in the do_package_update_index_ipk task.
What exactly does this task do, and is there anything I can do to fix
this? Is there an index file that might be corrupt?

Thanks for any help,
Regards
Rob Smih



