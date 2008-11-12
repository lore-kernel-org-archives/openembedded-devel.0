Received: from [66.249.92.175] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1L0CMr-0007hE-84
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Nov 2008 10:50:33 +0100
Received: by ug-out-1314.google.com with SMTP id k3so1050192ugf.4
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Nov 2008 01:48:35 -0800 (PST)
Received: by 10.67.116.16 with SMTP id t16mr3446190ugm.51.1226483315617;
	Wed, 12 Nov 2008 01:48:35 -0800 (PST)
Received: from ?192.168.1.10? ([78.86.128.56])
	by mx.google.com with ESMTPS id y6sm455243uge.28.2008.11.12.01.48.34
	(version=SSLv3 cipher=RC4-MD5); Wed, 12 Nov 2008 01:48:35 -0800 (PST)
From: Graeme Gregory <dp@xora.org.uk>
To: openembedded-devel@lists.openembedded.org
Date: Wed, 12 Nov 2008 09:48:33 +0000
Message-Id: <1226483313.7474.5.camel@aquilonia>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.1 
Subject: [RFC] Moving xorg.conf to seperate .bb file/package
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
X-List-Received-Date: Wed, 12 Nov 2008 09:50:33 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

At the moment xorg.conf is handled within the xserver-xorg .bb file.

As xorg.conf varies per machine this will effectively make xserver-xorg
machine specific which sort of defeats the purpose of a module xorg.

My suggestion is to move xorg.conf out of xserver-xorg. Then add a
RRECOMMEND_${PN} = "xserver-xorg-conf" to xserver-xorg.

Is this a sane plan?

Graeme




