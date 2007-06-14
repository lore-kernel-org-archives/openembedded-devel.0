Received: from [64.233.162.234] (helo=nz-out-0506.google.com)
	by linuxtogo.org with esmtp (Exim 4.67)
	(envelope-from <damwid@gmail.com>) id 1HygDb-0003fJ-07
	for openembedded-devel@lists.openembedded.org;
	Thu, 14 Jun 2007 05:41:56 +0200
Received: by nz-out-0506.google.com with SMTP id n29so375240nzf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Jun 2007 20:38:48 -0700 (PDT)
Received: by 10.115.33.1 with SMTP id l1mr1399890waj.1181792328067;
	Wed, 13 Jun 2007 20:38:48 -0700 (PDT)
Received: from ?192.168.1.3? ( [123.112.47.165])
	by mx.google.com with ESMTP id j31sm1789033waf.2007.06.13.20.38.45
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 13 Jun 2007 20:38:47 -0700 (PDT)
Message-ID: <4670B841.4040605@gmail.com>
Date: Thu, 14 Jun 2007 11:38:41 +0800
From: DAMWID <damwid@gmail.com>
User-Agent: Thunderbird 1.5.0.12 (X11/20070604)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
Subject: mountall.sh bugs
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
X-List-Received-Date: Thu, 14 Jun 2007 03:42:10 -0000
Content-Type: text/plain; charset=GB18030; format=flowed
Content-Transfer-Encoding: 7bit

Hi all,

The mountall.sh in initscripts-1.0 package use the following line to 
mount all filesystem except nfs, smbfs, and ncpfs:

	mount -at nonfs,nosmbfs,noncpfs 2>/dev/null

there are two problems here:

1) the arguments for -t option should be "nonfs,smbfs,ncpfs", the "no" 
should be prefixed to the whole fstype list, not to each fstype.

2) currently, busybox does not support the "-t type1,type2" and "-t 
notype1,type2" option, so this line actually does nothing at all.

The best way to resolve this problem is add above options support to 
busybox. As a workaround, I replace this line with a simple "mount -a" 
command, and it works for me.

B.R.
Damwid


