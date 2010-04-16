Received: from fg-out-1718.google.com ([72.14.220.153])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1O2ksj-0004gJ-No
	for openembedded-devel@lists.openembedded.org;
	Fri, 16 Apr 2010 14:42:50 +0200
Received: by fg-out-1718.google.com with SMTP id 19so1037504fgg.6
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 16 Apr 2010 05:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=rxcs63CcdjT5WNr7VBhWut0DtGjLBLrgcN4uR2IJ7+A=;
	b=k8IZAmKkHD3UUR/rC+JAR8zaVV6vhnDBxDFpb5SRHcTeMmiZ2WViKTZfG0tWSY5AAW
	TLTxIIPK4FT3/SHxyEUx9MUndeg255TY3gL0DJghF4SJn06HWUyQDWoHRZ+8kTaOHppE
	UaUdRxh7n2A4Wb9d15nKDJzNMcAwkT+qzDcVQ=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=MgsjioBYvyPw1L5NJYdm2KkphIdwrG17YfZsXB2j3sYNudYAoTGgoQhWN7W09rzn6l
	vkY+ETCn4jYtopMKyUYSAOwbuv111sHKQB1FCU0bK++ufYdpHUFNyjs+d4X2i01m7p1e
	Gwpsmg9UyVbyqwB7TCEwSPYlxlzTgxHhjZM5c=
Received: by 10.87.2.15 with SMTP id e15mr1325439fgi.23.1271421561795;
	Fri, 16 Apr 2010 05:39:21 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id b17sm3624545fka.43.2010.04.16.05.39.20
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Fri, 16 Apr 2010 05:39:21 -0700 (PDT)
Date: Fri, 16 Apr 2010 14:39:20 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100416123920.GB3323@jama>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 72.14.220.153
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Do we really want shared Xserver script for all machines?
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
X-List-Received-Date: Fri, 16 Apr 2010 12:42:50 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

on Openmoko Freerunner om-gta02 Xserver script takes about 3s on every
boot
http://build.shr-project.org/tests/jama/bootchart-2.6.32.9.r1.png

it's started from /etc/init.d/xserver-nodm and with eliminated Xserver
call by passing xinit call directly with right Xorg params I get this
 
http://build.shr-project.org/tests/jama/bootchart-2.6.32.9.r3.png

My question is:

should I commit simplified versions of Xserver script
xserver-kdrive-common/xserver-kdrive-common/Xserver
to
xserver-kdrive-common/xserver-kdrive-common/om-gta02/Xserver
and the same for other devices supported in Xserver (to save 
grep,awk call).

or do it only for om-gta02 (maybe even in 
xserver-kdrive-common/xserver-nodm-init/xserver-nodm
) and those who care about boot time will follow?

Maybe calling fallback_screen_arg only where it's really needed would be
good enough optimization, without the cost of loosing PACKAGE_ARCH =
"all".

Cheers,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


