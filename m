Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1JIMoc-0006ad-M8
	for openembedded-devel@openembedded.org; Fri, 25 Jan 2008 12:33:46 +0100
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1JIMog-0001Az-NP
	for openembedded-devel@openembedded.org; Fri, 25 Jan 2008 11:33:50 +0000
Received: from ip-62-143-227-114.1411n-cud12k-01.ish.de ([62.143.227.114])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Fri, 25 Jan 2008 11:33:50 +0000
Received: from no2spam by ip-62-143-227-114.1411n-cud12k-01.ish.de with local
	(Gmexim 0.1 (Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Fri, 25 Jan 2008 11:33:50 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Rolf Leggewie <no2spam@nospam.arcornews.de>
Date: Fri, 25 Jan 2008 12:33:39 +0100
Message-ID: <fnchem$8v4$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: ip-62-143-227-114.1411n-cud12k-01.ish.de
User-Agent: Thunderbird 2.0.0.6 (X11/20071022)
Sender: news <news@ger.gmane.org>
Subject: RFC: strip "-native" from $S for native packages automatically (bug 1856)
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
X-List-Received-Date: Fri, 25 Jan 2008 11:33:47 -0000
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit

Hi,

I elicit your comments on bug 1856, especially comment3.

The bug is about stripping "-native" automatically from the S variable
for native packages since it will hardly ever occur that a tar ball will
unpack to $PN-native-$PV/  This would save us resetting $S manually for
native packages all the time.  Koen suggested the fix to go into
native.bbclass. When I revisited the bug today, I thought this must be
as easy to fix as simply adding

  export S=`echo $S|sed s/\-native\-/\-/`

to native.bbclass which is what I propose.  This might still have some
issues that I so far overlooked such as the need to further escape
special characters or something else, but the general idea should be
clear.  Please be aware that I have not yet tested this.  Any comments
as to why this should or should not work?

If there is no opposition, I'll make some simple tests to verify correct
functioning of the code before finally committing.

Regards

Rolf


PS: http://bugs.openembedded.org/show_bug.cgi?id=1856#c3



