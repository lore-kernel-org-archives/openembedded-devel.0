Received: from [207.164.182.72] (helo=smtp.cbnco.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <msmith@cbnco.com>) id 1MYLok-000334-QF
	for openembedded-devel@lists.openembedded.org;
	Tue, 04 Aug 2009 17:20:49 +0200
Received: from localhost (localhost [127.0.0.1])
	by smtp.cbnco.com (Postfix) with ESMTP id 7D6FA52CF1D
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 11:05:13 -0400 (EDT)
Received: from smtp.cbnco.com ([127.0.0.1])
	by localhost (mail.cbnco.com [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 16437-02 for <openembedded-devel@lists.openembedded.org>; 
	Tue,  4 Aug 2009 11:05:13 -0400 (EDT)
Received: from [172.20.22.83] (auriga-dmzgw.cbnco.com [207.164.182.65])
	by smtp.cbnco.com (Postfix) with ESMTPSA id DDC3E52CF12
	for <openembedded-devel@lists.openembedded.org>;
	Tue,  4 Aug 2009 11:05:12 -0400 (EDT)
Message-ID: <4A784E25.7040709@cbnco.com>
Date: Tue, 04 Aug 2009 11:05:09 -0400
From: Michael Smith <msmith@cbnco.com>
User-Agent: Thunderbird 2.0.0.22 (X11/20090605)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Virus-Scanned: amavisd-new at cbnco.com
Subject: Misc patches - openssh, etc.
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
X-List-Received-Date: Tue, 04 Aug 2009 15:21:07 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I've got a few patches pending. I'm wondering if someone could take some 
time and look into applying them.

source-checker: usability tweaks;
oe-checksums-sorter.py: speed up about 4X using a hash
http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/source-checker/

openssh.inc: cleanup
http://patchwork.openembedded.org/patch/860/

hicolor-icon-theme: don't inherit gnome
http://patchwork.openembedded.org/patch/870/
(discussion & old patch here:
http://thread.gmane.org/gmane.comp.handhelds.openembedded/25224/focus=25230)

mesa-dri and xorg-xserver-common tls fixes:
http://patchwork.openembedded.org/bundle/msmith%40cbnco.com/mesa-tls/


You can also pull these from:

git://jrz.cbnco.com/toastix/openembedded-mike.git


(but that tree also contains an unsubmitted patch to remove 
DEFAULT_PREFERENCE="-1" from openssh 5.2, as suggested by Denis)

Thanks,
Mike


