Received: from [203.97.33.68] (helo=smtp5.clear.net.nz)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <matthew@4d-electronics.co.nz>) id 1Mfom1-0008Lg-OA
	for openembedded-devel@lists.openembedded.org;
	Tue, 25 Aug 2009 07:40:50 +0200
Received: from tardis.4d-electronics.co.nz
	(202-0-56-223.cable.telstraclear.net [202.0.56.223])
	by smtp5.clear.net.nz (CLEAR Net Mail)
	with ESMTP id <0KOX009172YCJJ30@smtp5.clear.net.nz> for
	openembedded-devel@lists.openembedded.org; Tue,
	25 Aug 2009 17:23:00 +1200 (NZST)
Received: from localhost (localhost [127.0.0.1])	by tardis.4d-electronics.co.nz
	(Postfix) with ESMTP id 73C615CE258	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:23:00 +1200 (NZST)
Received: from tardis.4d-electronics.co.nz ([127.0.0.1])
	by localhost (tardis.4d-electronics.co.nz [127.0.0.1])
	(amavisd-new, port 10024)	with ESMTP id WuCA09TX932S	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:23:00 +1200 (NZST)
Received: from [192.168.1.129] (unknown [192.168.1.129])
	by tardis.4d-electronics.co.nz (Postfix) with ESMTPS id 2EF385CE222	for
	<openembedded-devel@lists.openembedded.org>; Tue,
	25 Aug 2009 17:23:00 +1200 (NZST)
Date: Tue, 25 Aug 2009 17:22:58 +1200
From: Matthew Dombroski <matthew@4d-electronics.co.nz>
In-reply-to: <200908250709.57101.holger+oe@freyther.de>
To: openembedded-devel@lists.openembedded.org
Message-id: <4A937532.1070503@4d-electronics.co.nz>
MIME-version: 1.0
X-Virus-Scanned: by Amavis+SpamAssassin+ClamAV and more at	4d-electronics.co.nz
X-Spam-Flag: NO
X-Spam-Score: -1.44
References: <4A936CC0.70409@4d-electronics.co.nz>
	<200908250709.57101.holger+oe@freyther.de>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-GB; rv:1.9.1.1) Gecko/20090715
	Thunderbird/3.0b3
X-Spam-Status: No, score=-1.44 tagged_above=-99 required=5
	tests=[ALL_TRUSTED=-1.44]
X-Spam-Level: 
Subject: Re: CMake and Qt4
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
X-List-Received-Date: Tue, 25 Aug 2009 05:40:50 -0000
Content-type: text/plain; charset=ISO-8859-1; format=flowed
Content-transfer-encoding: 7bit

>
> This will not work when both qt4x11 and qt4e is built and staged. I have no
> specific knowledge of the current FindQt4 cmake module but there should be a
> way to tell it that we want the QtE, QtX11 or QtMac built...
>
> Do you have any idea?
>    
Do you know the naming convention of qt4x11?
qt4e names libs with a big E like this: libQtCoreE.so.4.5

It shouldnt be hard to add another variable in FindQt4.cmake that 
controls what names we search for.

~Matt


