Received: from mail-pv0-f175.google.com ([74.125.83.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <graham.gower@gmail.com>) id 1P8Ljy-0003Gl-EA
	for openembedded-devel@lists.openembedded.org;
	Wed, 20 Oct 2010 01:37:11 +0200
Received: by pvg13 with SMTP id 13so598770pvg.6
	for <openembedded-devel@lists.openembedded.org>;
	Tue, 19 Oct 2010 16:36:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from
	:user-agent:mime-version:to:subject:content-type
	:content-transfer-encoding;
	bh=B8O01KuYzZcfhJv2AtdcnMzH0N0xJ+iAIZwZTb+5FIQ=;
	b=iG1sB/BoHrfLmvdWYHquaifcUoiulO2JGb6HOE34UE58t5+Vpn3qOXoMbEu5XpGDzD
	v4fct6l8OvztLH5NOh/0gSa4UM6isdMi+Nb6p+cTsOeFVKwsOQqOUYjXY7agN1CQk1XO
	Am5cW4LhI9Ub4m2ibbdZoq2AfwGISpjcjGXgc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject
	:content-type:content-transfer-encoding;
	b=gtj8LpDCE2QbFQKc5dzpk4mPauDlNNuNDhAcqZs3T5dM0DN3Bnnjh1peTGa+aGSnO7
	OP+2TB48B1Nz5PsuN25/Ummkz8XrkcW76YY5Tf0+xQ/NQQLZQuT52qp9mv3Luy0fxpWX
	5plqF8gP9LbX+P+11gfPx1y6JXye67ObmCZs0=
Received: by 10.142.135.17 with SMTP id i17mr5257418wfd.278.1287531392923;
	Tue, 19 Oct 2010 16:36:32 -0700 (PDT)
Received: from [10.0.0.5] (eth7090.sa.adsl.internode.on.net [150.101.58.177])
	by mx.google.com with ESMTPS id
	y42sm19923892wfd.10.2010.10.19.16.36.30
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Tue, 19 Oct 2010 16:36:31 -0700 (PDT)
Message-ID: <4CBE2B7A.4040601@gmail.com>
Date: Wed, 20 Oct 2010 10:06:26 +1030
From: Graham Gower <graham.gower@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux x86_64; en-US;
	rv:1.9.1.12) Gecko/20100909 Thunderbird/3.0.7
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 74.125.83.175
X-SA-Exim-Mail-From: graham.gower@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: nspr-4.7.1: race condition causing occasional build failure
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
X-List-Received-Date: Tue, 19 Oct 2010 23:37:11 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

The failure looks like this:

make[3]: Entering directory `/mnt/oe/tmp/work/mipsel-oe-linux/nspr-4.7.1-r1/nspr-4.7.1/mozilla/nsprpub/pr/include/md'
../../../config/./nsinstall -R -m 444 ./_aix32.cfg ./_aix64.cfg ./_beos.cfg ./_bsdi.cfg ./_darwin.cfg ./_dgux.cfg ./_freebsd.cfg ./_hpux32.cfg ./_hpux64.cfg ./_irix32.cfg ./_irix64.cfg ./_linux.cfg ./_ncr.cfg ./_nec.cfg ./_netbsd.cfg ./_nextstep.cfg ./_nto.cfg ./_openbsd.cfg ./_openvms.cfg ./_os2.cfg ./_osf1.cfg ./_qnx.cfg ./_reliantunix.cfg ./_riscos.cfg ./_scoos.cfg ./_solaris.cfg ./_sony.cfg ./_sunos4.cfg ./_unixware.cfg ./_unixware7.cfg ./_win16.cfg ./_win95.cfg ./_winnt.cfg ../../../dist/include/nspr/md
../../../config/./nsinstall: ../../../config/./nsinstall: cannot execute binary file
make[3]: *** [export] Error 126


do_compile_prepend() contains the following line:
cp ${STAGING_BINDIR_NATIVE}/${P}/nsinstall config/nsinstall
Which copies the nsinstall program built by nspr-tools-native. However,
in the case of the failure, nspr chooses to build a version of nsinstall
for the target.

I'm having trouble reproducing this, but I can see that I am not alone
in experiencing this bug.
http://tinderbox.openembedded.net/packages/764121/

Any help with determining what causes this race would be appreciated. It has
the follow on effect of causing various other packages to fail in difficult
to diagnose ways.

-Graham


