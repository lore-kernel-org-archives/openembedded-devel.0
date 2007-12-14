Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1J3BKS-0005ZN-V4
	for openembedded-devel@openembedded.org; Fri, 14 Dec 2007 15:15:53 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1J3BF9-0000h6-UJ
	for openembedded-devel@openembedded.org; Fri, 14 Dec 2007 14:10:23 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 14 Dec 2007 14:10:23 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 14 Dec 2007 14:10:23 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 14 Dec 2007 15:08:01 +0100
Message-ID: <fju2o1$9l2$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
Sender: news <news@ger.gmane.org>
Subject: RFC: drop timezones from OE
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
X-List-Received-Date: Fri, 14 Dec 2007 14:15:53 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

it seems that there are two, conflicting packages in OE providing
timezone data: tzdata from glibc and timezones from opie/handhelds.

I think it would make sense to drop timezones and only have the timezone
data from glibc as this eliminates problems where one wants to install
package A that depends on tzdata but you also want package B where the
dependency is declared for timezones.  Currently, you can only install
either A or B.

If there is consensus on this, I would take care that OE metadata is
updated accordingly (drop timezones folder, replace occurences of
timezones in DEPENDS with tzdata, etc.)

Regards

Rolf



