Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pkfm2-0005bP-VO
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 17:41:43 +0100
Received: from svr-orw-exc-10.mgc.mentorg.com ([147.34.98.58])
	by relay1.mentorg.com with esmtp 
	id 1Pkfl8-0005bU-6S from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Wed, 02 Feb 2011 08:40:46 -0800
Received: from na2-mail.mgc.mentorg.com ([134.86.114.213]) by
	SVR-ORW-EXC-10.mgc.mentorg.com with Microsoft
	SMTPSVC(6.0.3790.4675); Wed, 2 Feb 2011 08:40:45 -0800
Received: from [172.30.80.88] ([172.30.80.88]) by na2-mail.mgc.mentorg.com
	with Microsoft SMTPSVC(6.0.3790.3959); 
	Wed, 2 Feb 2011 09:40:44 -0700
Message-ID: <4D498909.90908@mentor.com>
Date: Wed, 02 Feb 2011 09:40:41 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-OriginalArrivalTime: 02 Feb 2011 16:40:45.0062 (UTC)
	FILETIME=[F0121A60:01CBC2F7]
Subject: qt4*-image and qt 4.6.3?
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
X-List-Received-Date: Wed, 02 Feb 2011 16:41:43 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

Currently none of the qt4*-images build for qt4 4.6.3.  This is because 
building with -xmlpatterns in 4.6.3 isn't viable (it's not a trivial fix 
to enable it, for some reason...) and it's embedded into the image 
recipes themselves in some cases, rather than tasks that can be 
RRECOMMENDED.  I see two courses of action here:
1) Just say the images don't build on 4.6.x (and I'll drop trying them 
from my builder)
2) Rework the qt4e-*images to use a new task-qt4e-base and update 
task-qt4-x11 to RRECOMMEND the xmlpattern bits.

Currently angstrom-2008.1 and kaelios-2009 pin to 4.6.3 and are in-tree 
(and I know Arago also cares, but is out of tree and I'm not suggesting 
we drop qt 4.6.x). Thoughts?  Thanks!

-- 
Tom Rini
Mentor Graphics Corporation


