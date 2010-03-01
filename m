Received: from mail-fx0-f220.google.com ([209.85.220.220])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1Nm6pz-0004d3-A0
	for openembedded-devel@lists.openembedded.org;
	Mon, 01 Mar 2010 15:43:16 +0100
Received: by fxm20 with SMTP id 20so2287997fxm.12
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 01 Mar 2010 06:40:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=D2y0oSTK+UWlCj7chFKvo6Vs3n7MdlJTxRtyhOcj2xU=;
	b=GNAdIg38cGsGQ4rtbGVa+pB27/Bm2jWsqHyeUWnYHSaq2AtJ+m6rO1yl+6rHTPNCc8
	J33uAq9A/p7WaexY9YzDMCOQFDCQDpRdV7alRaNjuKq+aAbWQkiAys8i0o3NZXuipMHW
	B/Hf5V0KXgv4yoTymY5vj/8jqxjl4HHaUAiok=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=vjIPd4bsYnwzc0RjjscLqXW0g+sbjtK+XIH+jKXRZqLZ/lV8p4YBe7IrygxrbuINSd
	g1lIEuOG2q6soxLZ9+w0G4eRi5BjSSARXC/fnDyaH3tWtqciJ97EEQGIGwO1kD6qjJQu
	IeeC5r9q+PMI6YfcQoeay4yCkR01AqmL2AH6A=
Received: by 10.223.14.15 with SMTP id e15mr5125955faa.57.1267454421505;
	Mon, 01 Mar 2010 06:40:21 -0800 (PST)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 15sm2169881fxm.0.2010.03.01.06.40.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Mon, 01 Mar 2010 06:40:20 -0800 (PST)
Date: Mon, 1 Mar 2010 15:40:40 +0100
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100301144040.GB12022@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.220.220
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.0 required=5.0 tests=SPF_PASS autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Should be xserver-xorg MACHINE_ARCH?
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
X-List-Received-Date: Mon, 01 Mar 2010 14:43:16 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Today I was checking why building om-gta01 and om-gta02 in same tmpdir
fails with this error:

 * satisfy_dependencies_for: Cannot satisfy the following dependencies for task-shr-minimal-x:
 *      libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *  libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *  libdrm (>= 2.4.18+gitr4565+b5aec2bd3df736216e86eae28e278172d3ba3362) *

first I noticed that task-shr-minimal.bb was missing
PACKAGE_ARCH = "${MACHINE_ARCH}"
after I moved some machine specific depends there (from shr-image.inc).

But even after that setting PACKAGE_ARCH right, I have this error and I think 
it's because xserver-xorg was built first for om-gta02 with virtual/libgl 
provider set to mesa-dri (_git.bb version used) and resulting .ipk has armv4t
arch, even when it was built with machine specific virtual/libgl provider and
libdrm version also specific for om-gta02 (om-gta01 will use 2.4.18 release instead,
because it doesn't need glamo specific patches from libdrm_git.bb)

What is right solution? Set xserver-xorg arch to MACHINE_ARCH (as virtual/libgl is
usually decided based on target machine). Or force om-gta01 to use mesa-dri (I already
did) and also libdrm from git repo with glamo patches (because upstream git repo and 
glamo repo has different SRCREV so switching to libdrm_git.bb won't help).

Thanks!

Regards,

BTW: I think we're going to have the same problems as when someone want's to build different
distributions in same tmpdir.

Looks like I should always use distro override instead machine override, because with machine
override I'm creating the same problem as above for other distributions building more machines
in same tmpdir.

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


