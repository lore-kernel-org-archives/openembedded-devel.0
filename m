Received: from relay1.mentorg.com ([192.94.38.131])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <Tom_Rini@mentor.com>) id 1Pu5AY-0003uk-Nx
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 16:37:54 +0100
Received: from svr-orw-fem-01.mgc.mentorg.com ([147.34.98.93])
	by relay1.mentorg.com with esmtp 
	id 1Pu59A-00043p-Sm from Tom_Rini@mentor.com 
	for openembedded-devel@lists.openembedded.org;
	Mon, 28 Feb 2011 07:36:28 -0800
Received: from SVR-ORW-FEM-04.mgc.mentorg.com ([147.34.97.41]) by
	svr-orw-fem-01.mgc.mentorg.com over TLS secured channel with
	Microsoft SMTPSVC(6.0.3790.4675); Mon, 28 Feb 2011 07:36:28 -0800
Received: from [172.30.80.189] (147.34.91.1) by svr-orw-fem-04.mgc.mentorg.com
	(147.34.97.41) with Microsoft SMTP Server id 14.1.270.1;
	Mon, 28 Feb 2011 07:36:28 -0800
Message-ID: <4D6BC0EA.4000207@mentor.com>
Date: Mon, 28 Feb 2011 08:36:10 -0700
From: Tom Rini <tom_rini@mentor.com>
Organization: Mentor Graphics Corporation
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.13) Gecko/20101208 Lightning/1.0b2 Thunderbird/3.1.7
MIME-Version: 1.0
To: <openembedded-devel@lists.openembedded.org>
X-OriginalArrivalTime: 28 Feb 2011 15:36:28.0714 (UTC)
	FILETIME=[443F98A0:01CBD75D]
Subject: shr-image failure
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
X-List-Received-Date: Mon, 28 Feb 2011 15:37:55 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Hey all,

Trying to build shr/shr-image/nokia900 fails with the following: 
http://pastebin.com/Z13aYd2Z which seems odd in that we're building:

NOTE: Running task 5802 of 10948 (ID: 2141, 
/var/hudson/workspace/sb_openembedded_autobuilder/BBPKGS/shr-image/DISTRO/shr/MACHINE/nokia900/label/sb-u804/recipes/efl1/elementary_svn.bb, 
do_setscene)
NOTE: package elementary-2_0.7.0+svnr56372-r11: task do_setscene: Started

And it's already past do_populate_sysroot before this starts.  I do see 
some svn complaining (and not doing something...) earlier on in the 
do_configure here.

-- 
Tom Rini
Mentor Graphics Corporation


