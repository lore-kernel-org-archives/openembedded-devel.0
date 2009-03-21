Received: from [209.85.218.171] (helo=mail-bw0-f171.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <andrea.adami@gmail.com>) id 1LlAWh-0004s8-S6
	for openembedded-devel@lists.openembedded.org;
	Sun, 22 Mar 2009 00:22:51 +0100
Received: by bwz19 with SMTP id 19so1232413bwz.12
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 21 Mar 2009 16:21:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:in-reply-to:references
	:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	bh=wq7Fi2d7JEoU8yWKSXTO+RLA/su3jpxxsWWyTT1hK50=;
	b=lkN2DcBOR09Bv4M81g+W4ksGCAXuQ5YvrQYUKxdLtW2eamNkZKgloETxlJ+r3b6CoR
	K4qjgkHJK1SqtmZ7WGdpXHd82za3L43mQrefFUfv7A1BOtP0kSML9/BYUhIRh6kkNjyg
	xaZXwmH0wmB/ZTVTyG/Dt3Kyd4I65ZeZXxYtg=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:content-type:content-transfer-encoding;
	b=kRcakZ9+0vKLzfQisX1DXXDKVeXKNylpten2rMF1FezDJHeCaqRpxuOF2XqUWJqUeu
	wQK94j2kcPFRkPm2j+hdXh3EiCI6G1m80Sx56+Aq3Qq5YSG64DvJ5hmKcThOWK5YFdfC
	g1ltoGWbq0lu6XR4Op3+Ztc1Ir/QvPW+sRYXg=
MIME-Version: 1.0
Received: by 10.223.110.144 with SMTP id n16mr4655512fap.55.1237677697511; 
	Sat, 21 Mar 2009 16:21:37 -0700 (PDT)
In-Reply-To: <gq29fi$k9s$1@ger.gmane.org>
References: <80a0c20d0903191458m2c450cb3se2ed0c2ef2680c78@mail.gmail.com>
	<gpvlao$cps$1@ger.gmane.org>
	<b6ebd0a50903201805l2eb43d3v8c1f88979e0f1db2@mail.gmail.com>
	<gq29fi$k9s$1@ger.gmane.org>
Date: Sun, 22 Mar 2009 00:21:37 +0100
Message-ID: <d1b08f940903211621u72551e45w22aeeb217712cd00@mail.gmail.com>
From: Andrea Adami <andrea.adami@gmail.com>
To: openembedded-devel@lists.openembedded.org
Subject: Re: packaged-staging not working properly
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
X-List-Received-Date: Sat, 21 Mar 2009 23:22:52 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Unfortunately I somehow confirm the issue with virtual/kernel: I moved
DEPLOY_DIR = and now $srcfle = $destfile in  package_stagefile_shell()
.

DEPLOY_DIR = "/oe/build/deploy/${ANGSTROMLIBC}"

NOTE: package linux-rp-2.6.26-r9: task do_deploy: started
ERROR: function do_deploy failed
ERROR: log data follows
(/oe/build/tmp/angstrom/work/c7x0-angstrom-linux-gnueabi/linux-rp-2.6.26-r9/temp/log.do_deploy.1405)
| cp: `/oe/build/deploy/glibc/images/c7x0/zImage-2.6.26-r9-c7x0.bin'
and `/oe/build/deploy/glibc/images/c7x0/zImage-2.6.26-r9-c7x0.bin' are
the same file

base.bbclass
 package_stagefile_shell()
 ...

destfile=`echo $srcfile | sed s#${TMPDIR}#${PSTAGE_TMPDIR_STAGE}#`

Unsure if it's Angstrom-specific or not.


Regards

Andrea


