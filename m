Received: from mail-ey0-f175.google.com ([209.85.215.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <ashcharles@gmail.com>) id 1P8hqH-0001LF-Dn
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 01:13:10 +0200
Received: by eye27 with SMTP id 27so1040509eye.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 20 Oct 2010 16:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:mime-version:received:from:date
	:message-id:subject:to:content-type;
	bh=xk1w81+8n0hZPpC68H88oIDpBP6ovrovMwjP0yt3U4g=;
	b=sBg7oVYDyJrAY+mLKPrcwNtE6qx+nPRTanyk5C5yvXUGdn1Yqfoj8/hSMS+xgRv4yS
	rbjt/0wuYdtlHpG1WFdwmbeoZg+Vng+RhHeCjgppPhYtIE/JiRFIYfU3t/IE0vVX/ed5
	8ZDTwRTUoVRX2otV0IQxkxzTL/VmlNoCIpnR8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:from:date:message-id:subject:to:content-type;
	b=g5a5F+vktbZIv/eba49t4VLhaZAZqETG2n0Q9ePIXraufw0DFv57qtKxnO4MgOJUva
	43tbdxZwwDffFD5BNm7XyyZ2/Aib5peoinOQJEARn7NKg50LirkbhjQc+368UrGMPUVQ
	EvyeolgwGzYbVxSkSQMejynBAUEbbQIRsknaM=
Received: by 10.213.13.80 with SMTP id b16mr4322086eba.89.1287616353220; Wed,
	20 Oct 2010 16:12:33 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.14.127.137 with HTTP; Wed, 20 Oct 2010 16:12:13 -0700 (PDT)
From: Ash Charles <ashcharles@gmail.com>
Date: Wed, 20 Oct 2010 16:12:13 -0700
Message-ID: <AANLkTi=B3qc0KgH_oz0_iLHN0ztbP6g7XD5fP-Jxg--j@mail.gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.215.175
X-SA-Exim-Mail-From: ashcharles@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: 'require' across different collections
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
X-List-Received-Date: Wed, 20 Oct 2010 23:13:10 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

Is it possible to use the 'require' or 'include' keywords across
different collections without specifying an absolute path?
Specifically, I have an image recipe which adds a few additional
packages to console-image.bb; it lives in a separate collection i.e.
it is not recipes/images/.  I currently get parse errors if I try to
'require console-image.bb' yet I had thought there was a way of doing
this and I can't track it down in the mailing list archives.

Any suggestions on how best to supplement an image with a few extra packages?

Many thanks,
-Ash


