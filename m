Received: from mail-gx0-f175.google.com ([209.85.161.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PDufs-00010e-Gc
	for openembedded-devel@lists.openembedded.org;
	Thu, 04 Nov 2010 08:55:57 +0100
Received: by gxk26 with SMTP id 26so1196579gxk.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 04 Nov 2010 00:55:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=yqEBE8ehdwwkfvE7n6d33AMeuiy1fdLfz9s7LqThJCs=;
	b=Uj45POixIgI+v3dPJDi32NeQy7irHe6eYNZSKZWjNPa13HiVGFu1rV7juR8n2h3WXg
	4mxs4hcJ/EG4WMZNXiZMSr8C8GnVz9O5pp/RabzEA+qN87X5GIutrt0tGbzqyWik8d+l
	4wyWSpfLOeCAG/31Fge6zjiriHmc6I949aS/o=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=L0eOittKfyVc7x/WMiJMRyYIr3vGel3zw/gSENgHKR32Hfgw6+toS9132NRtZIEyou
	vPaDXwYeOFpvg8QnhtHL2j13ULyZFIdm8S8wMXvv1x/rkXI5eNOsaDCOa/9YHcx745DQ
	ZfuLWY+QcjrR5fklkp0awzyQd8TV3E59IGCpY=
MIME-Version: 1.0
Received: by 10.231.191.6 with SMTP id dk6mr197119ibb.51.1288857304297; Thu,
	04 Nov 2010 00:55:04 -0700 (PDT)
Received: by 10.231.40.13 with HTTP; Thu, 4 Nov 2010 00:55:04 -0700 (PDT)
Date: Thu, 4 Nov 2010 08:55:04 +0100
Message-ID: <AANLkTinVAYqvP7-hNbSjTyhy1SJSHNj78=w0DKgoyEhD@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.161.175
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: e2fsprogs do_package issue
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
X-List-Received-Date: Thu, 04 Nov 2010 07:55:57 -0000
Content-Type: text/plain; charset=ISO-8859-1

Got this when building e2fsprogs:

NOTE: package e2fsprogs-1.41.9-r24: task do_package: Started
NOTE: the following files were installed but not shipped in any package:
NOTE:   /usr/share/ss/ct_c.awk
NOTE:   /usr/share/ss/ct_c.sed
NOTE:   /usr/share/et/et_h.awk
NOTE:   /usr/share/et/et_c.awk

No idea where these are for. Should these be packaged?
And if not should they be removed e.g. in do_install_append so the
above note gets away?

Frans


