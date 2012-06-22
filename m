Received: from 75-148-42-21-colorado.hfc.comcastbusiness.net ([75.148.42.21]
	helo=judge.camp.se-eng.com) by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <ray.danks@se-eng.com>) id 1SiBPE-0005U6-LB
	for openembedded-devel@lists.openembedded.org;
	Fri, 22 Jun 2012 23:28:40 +0200
Received: from localhost (localhost [127.0.0.1])
	by judge.camp.se-eng.com (Postfix) with ESMTP id C2DFA138AFC;
	Fri, 22 Jun 2012 15:11:31 -0600 (MDT)
X-Virus-Scanned: amavisd-new at camp.se-eng.com
Received: from judge.camp.se-eng.com ([127.0.0.1])
	by localhost (judge.camp.se-eng.com [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 0kI4I+bGHKvT; Fri, 22 Jun 2012 15:11:29 -0600 (MDT)
Received: from [172.20.202.96] (beast.camp.se-eng.com [172.20.202.96])
	by judge.camp.se-eng.com (Postfix) with ESMTPSA id 5C416138AF9;
	Fri, 22 Jun 2012 15:11:29 -0600 (MDT)
Message-ID: <4FE4DFCA.4090606@se-eng.com>
Date: Fri, 22 Jun 2012 15:12:42 -0600
From: Raymond Danks <ray.danks@se-eng.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0) Gecko/20120129 Thunderbird/10.0
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: New meta-xen layer
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
X-List-Received-Date: Fri, 22 Jun 2012 21:28:41 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

I have constructed a layer for the purpose of building Xen in 
OpenEmbedded.  Xen is a hypervisor and associated tools running on Linux 
available as a package in distributions such as Ubuntu and Fedora.  It 
is also modified and included in the rpm-based Xen Cloud Platform 
distribution and Citrix XenServer.

This layer currently includes recipes and recipe modifications for 
building xen, libvirt, and a minimal xen image that may be used for 
launching virtual machines via the xl command line interface.  This 
currently targets the x86 Xen host (OE target) architecture; development 
has been done entirely on x86_64.

I'm open to receiving feedback, patches and suggestions.  Also, I'm 
curious if this layer may be published to the OpenEmbedded layer index 
and by what process that should be achieved?

meta-xen|Xen related software||git://git.se-eng.com/meta-xen.git| 
http://git.se-eng.com/gitweb/?p=meta-xen.git;a=summary|

Thanks,
Ray

Raymond Danks
Sage Electronic Engineering, LLC
http://www.se-eng.com

