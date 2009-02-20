Received: from [209.85.221.16] (helo=mail-qy0-f16.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <otavio.salvador@gmail.com>) id 1LafEl-00039q-7M
	for openembedded-devel@lists.openembedded.org;
	Sat, 21 Feb 2009 00:56:55 +0100
Received: by qyk9 with SMTP id 9so1728439qyk.12
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 20 Feb 2009 15:54:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:sender:received:from:to
	:subject:organization:user-agent:x-url:x-attribution:date:message-id
	:mime-version:content-type;
	bh=iPMff/ougHYlQZrMMSROooNJMRaVesNcF2VSoKv0SO4=;
	b=iAsCOUenLFgmsDGDTCJ3NwXSU2HPuNCdb57JXeWxn4/KBvn3VurSd2q+kiBBDmiHve
	AhM3JDKLHemIIXYhFTv2nA2es9VIl4pmv0weP1Yd+LxXif8HjkgsSKkdz0nWDbSkiiQ/
	iISKmX6HIbsGVEngSD/H0IO0kbBhwo5upYuXY=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=sender:from:to:subject:organization:user-agent:x-url:x-attribution
	:date:message-id:mime-version:content-type;
	b=x+jDPIVEcQZbH70PYv8C+AAES998QsWTVxKcH2fcQ5j52c/fnTdngtHKu0YThrkqjk
	uDBeLJOKZKNNZuV9QEvAnPItv0db0PzeAZLY2CB4/EhOhGs2eN78LZt4a8ryxxVyJhkr
	3s1d5IVc5o9uZaZgq0ykTLCXNKEspoKOag3Bw=
Received: by 10.224.10.208 with SMTP id q16mr2362394qaq.387.1235174062782;
	Fri, 20 Feb 2009 15:54:22 -0800 (PST)
Received: from ossystems.com.br (201-40-162-47.cable.viacabocom.com.br
	[201.40.162.47])
	by mx.google.com with ESMTPS id 6sm2896946qwd.53.2009.02.20.15.54.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 20 Feb 2009 15:54:22 -0800 (PST)
Sender: Otavio Salvador <otavio.salvador@gmail.com>
Received: by ossystems.com.br (Postfix, from userid 1000)
	id BE3F8610047; Fri, 20 Feb 2009 20:54:10 -0300 (BRT)
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Development Mailing List
	<openembedded-devel@lists.openembedded.org>
Organization: O.S. Systems Ltda.
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.0.90 (gnu/linux)
	(x86_64-pc-linux-gnu)
X-URL: http://www.ossystems.com.br/
X-Attribution: O.S.
Date: Fri, 20 Feb 2009 20:54:10 -0300
Message-ID: <87ocww3brx.fsf@neumann.lab.ossystems.com.br>
MIME-Version: 1.0
Subject: Pull request with minor changes for initrdscripts
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
X-List-Received-Date: Fri, 20 Feb 2009 23:56:55 -0000
Content-Type: text/plain; charset=us-ascii

Hello,

We've done few minor but usefull changes at our tree and would be nice
to get them merged in. Please someone review it and pull if agree.

The following changes since commit 1b3740d56dfddbfa7861a07fdfdc3d00f5af0637:
  Otavio Salvador (1):
        parted: drop configure_prepend since syscalls.h was remove

are available in the git repository at:

  git://projetos.ossystems.com.br/git/users/otavio/org.openembedded.dev.git master

Otavio Salvador (4):
      initramfs-module-ext3: use mkdir -p to create mount path
      initramfs-module-aufs: use mkdir -p to create mount path
      initramfs-uniboot: add support to start a shell and enable debug
      initramfs-uniboot: call depmod if the image lack a dep file

 packages/initrdscripts/files/80-ext3.sh |    2 +-
 packages/initrdscripts/files/98-aufs.sh |    2 +-
 packages/initrdscripts/files/init.sh    |    7 +++++++
 3 files changed, 9 insertions(+), 2 deletions(-)

-- 
Otavio Salvador                  O.S. Systems
E-mail: otavio@ossystems.com.br  http://www.ossystems.com.br
Mobile: +55 53 9981-7854         http://projetos.ossystems.com.br


