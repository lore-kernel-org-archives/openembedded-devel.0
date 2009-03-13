Received: from [208.51.207.131] (helo=mail.2mi.com.br)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <jader@2mi.com.br>) id 1Li9Qo-0005a0-F8
	for openembedded-devel@lists.openembedded.org;
	Fri, 13 Mar 2009 16:36:18 +0100
Received: from localhost (localhost [127.0.0.1])
	by mail.2mi.com.br (Postfix) with ESMTP id E251C503618D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 12:40:46 -0300 (BRT)
X-Virus-Scanned: amavisd-new at 2mi.com.br
Received: from mail.2mi.com.br ([127.0.0.1])
	by localhost (mail.2mi.com.br [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5OaWb+7er3IP
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 12:40:39 -0300 (BRT)
Received: from [192.168.15.100] (unknown [189.102.205.109])
	by mail.2mi.com.br (Postfix) with ESMTP id 9CA2E502762D
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 13 Mar 2009 12:40:39 -0300 (BRT)
From: "Jader H. Silva" <jader@2mi.com.br>
To: Open Embedded <openembedded-devel@lists.openembedded.org>
Organization: 2MI Tecnologia
Date: Fri, 13 Mar 2009 12:35:47 -0300
Message-Id: <1236958547.8913.5.camel@northpole>
Mime-Version: 1.0
X-Mailer: Evolution 2.24.3 
Subject: Can't build an ext2 minimal image
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
X-List-Received-Date: Fri, 13 Mar 2009 15:36:19 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

I'm trying to build a minimal-image with an ext2 filesystem image, so I
set inside my local.conf:

IMAGE_FSTYPES = "ext2"

But OE insists on building an jffs2 image. I found, inside
conf/distro/minimal.conf:

IMAGE_FSTYPES = "tar.gz jffs2"

Does it means local.conf's IMAGE_FSTYPES get overwritten? If so, can
anybody fix it?




Jader H. Silva
Depto. de desenvolvimento
2MI Tecnologia








