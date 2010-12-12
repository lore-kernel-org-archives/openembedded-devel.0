Received: from mail-iw0-f169.google.com ([209.85.214.169])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PRkj5-0004gT-Sb
	for openembedded-devel@lists.openembedded.org;
	Sun, 12 Dec 2010 13:08:28 +0100
Received: by iwn40 with SMTP id 40so1751646iwn.28
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 12 Dec 2010 04:06:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type:content-transfer-encoding;
	bh=e9ngkGFaXXN0IFhPQuSQR0/DoqqfcQCIabIjwK7R1DA=;
	b=Al3ZsqRyLwVO2HxAZbnVjGl4lZsGqsNNOy3tnDWiu8WYASO2mnvON8GkpRGOh41zG3
	bS8p4xga+fH02yvjR7uLvcQM44V38fJSYZC7NN1TXHzF9WYei5QhVSPgstyUhD7fF73c
	V9nJPoUnKNPDHIVABHZeM0TDlsO2GglIhENAE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=mNqEo4gLd9o+B5xauxVbb4YXY3PAgR3ji0KDxBB/dfm4+zUgNDRiaxiA4X7vtHDVNk
	IB1zZmEO15e3A08g3dD6od3YAA4xwiibmGkLHJu8O3YDMqOhz2j36pxIuOEU7JhBGw2Z
	fLVrpfXgBY+l1noPbJEol8jAYLnE+gfw+mvg0=
MIME-Version: 1.0
Received: by 10.231.182.13 with SMTP id ca13mr1070392ibb.57.1292155613352;
	Sun, 12 Dec 2010 04:06:53 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Sun, 12 Dec 2010 04:06:53 -0800 (PST)
Date: Sun, 12 Dec 2010 13:06:53 +0100
Message-ID: <AANLkTi=20woN1TEygXwHwgoOm3_OPp+GLU6JMNpAq3eV@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.169
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: js compilation oddity
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
X-List-Received-Date: Sun, 12 Dec 2010 12:08:28 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

When compiling js (for beagleboard/minimal) I got this:

| k_cos.c: In function =EF=BF=BD=EF=BF=BD=EF=BF=BD__kernel_cos=EF=BF=BD=EF=
=BF=BD=EF=BF=BD:
| k_cos.c:125:21: warning: =EF=BF=BD=EF=BF=BD=EF=BF=BDqx=EF=BF=BD=EF=BF=BD=
=EF=BF=BD may be used uninitialized in this function
| Assembler messages:
| Fatal error: can't create Linux_All_DBG.OBJ/k_cos.o: No such file or dire=
ctory
| make[1]: *** [Linux_All_DBG.OBJ/k_cos.o] Error 1

Full log at:
http://tinderbox.openembedded.net/public/logs/task/13169490.txt

bitbake -cclean js; bitbake js
resulted in a proper build; so apparently this is not reproducible.

Anyone an idea ?

Frans


