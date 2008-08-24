Received: from [74.125.44.156] (helo=yx-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <slapinid@gmail.com>) id 1KXNDg-0007tb-2g
	for openembedded-devel@lists.openembedded.org;
	Sun, 24 Aug 2008 23:33:56 +0200
Received: by yx-out-1718.google.com with SMTP id 4so678552yxp.42
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 24 Aug 2008 14:32:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=umn5oc3/JPC250+ama1u5/wZerni+giwVdItV8JVjgM=;
	b=Fo9bTdPvdcNKxdY0alQv+Sq6oMBeuxky0SuxwDzJz999GgrJtDcVMs5mUUqNeCPj/g
	yAP4gp+mI6VJVdrkzPqdTB/h42UNxn+NEtY54uGD3itWPinPG55v0WVHgkfPptQi93mC
	Dw/eBAGG8ty0w71DrfVv1HGnzyH66kLKFBv8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=SAVnugtD36aShRwm+b/yfSsKR29gdHWAkjwMO5Ymf+tH1rhkWyhQ87HnDj3vqKeXNP
	Fc4qE/RwMnQUyVWb0OidIY3ZckoBcYvz8OM98XfvnjUtz8/q8Kyihbh6o3XS/canDnm1
	LqDKTvFfFISWEyvGc41IlzVo5ModCfYuHX57o=
Received: by 10.151.38.11 with SMTP id q11mr5901552ybj.68.1219613551465;
	Sun, 24 Aug 2008 14:32:31 -0700 (PDT)
Received: by 10.150.227.15 with HTTP; Sun, 24 Aug 2008 14:32:31 -0700 (PDT)
Message-ID: <48239d390808241432t17087c09xf4c31185082ae829@mail.gmail.com>
Date: Mon, 25 Aug 2008 01:32:31 +0400
From: "Sergey Lapin" <slapinid@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: sato-image FTBFS
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
X-List-Received-Date: Sun, 24 Aug 2008 21:33:56 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,
I have this error during build of x11-sato-image:
NOTE: Resolving any missing task queue dependencies
ERROR: '['/home/slapin/OE/org.openembedded.dev/packages/images/x11-sato-image.bb']'
RDEPENDS/RRECOMMENDS or otherwise requires the runtime entity
'ttf-liberation' but it wasn't found in any PACKAGE or RPROVIDES
variables
NOTE: Runtime target 'ttf-liberation' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['ttf-liberation']
ERROR: Required build target 'x11-sato-image' has no buildable providers.
Missing or unbuildable dependency chain was: ['x11-sato-image',
'ttf-liberation']

Is it bug? ttf-liberation_0.2,bb does not provide 'ttf-liberation
package but various *-mono, *-serif, et al.

What did original recipe author meant?

All the best,
S.


