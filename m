Received: from mail-iw0-f173.google.com ([209.85.214.173])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1PQFFZ-00076A-FZ
	for openembedded-devel@lists.openembedded.org;
	Wed, 08 Dec 2010 09:19:47 +0100
Received: by iwn40 with SMTP id 40so974844iwn.18
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 08 Dec 2010 00:18:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=9DBdKZiSDSLx5H8ZtE98WHv1VGVfGLWxegcAv6aEmpk=;
	b=YgrFntQxHsYjQtNCKo8U82jhw1Y0og+vNm3lTrezLeWZt61OkPLtEgtKuIRsZ00xVP
	4i46bR7N2Ej0IDfCvbudW3N0PFhblavHmetQUyiV0Z/2OZHKKZjx8CiWrBm/LXXWQZ/O
	tJY2fm+dODUpfT3mD4GgYxApp2+77a38KsH3c=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cqd29gl4osGDBWd4947RuB8HTb20yk95OFn3uVFSPTb10AtTwkX1OES1N9rRHnyzNN
	6qU9u/O4RtDQ+OShgNRlcvJL5F4j682Nn8EGCexCI6S+9Qg5bRvZVNINNoUNY1tPydj6
	bl+H4K9QCy//SJsZyG0EHk6ISBgMIj/TZB664=
MIME-Version: 1.0
Received: by 10.231.13.203 with SMTP id d11mr8905692iba.157.1291796297198;
	Wed, 08 Dec 2010 00:18:17 -0800 (PST)
Received: by 10.231.200.140 with HTTP; Wed, 8 Dec 2010 00:18:17 -0800 (PST)
Date: Wed, 8 Dec 2010 09:18:17 +0100
Message-ID: <AANLkTimi=FMoZrm_Yum8xLkUkwd5+aYXDjguAqHj3mQS@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.214.173
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: gcc QA issue
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
X-List-Received-Date: Wed, 08 Dec 2010 08:19:48 -0000
Content-Type: text/plain; charset=ISO-8859-1

We bumped intot he following gcc QA issue (distro angsgtrom, machine
mpc8313e-rdb)

ERROR: QA Issue with gcc: non -dev package contains symlink .so: gcc
path '/work/ppce300c3-angstrom-linux/gcc-4.3.3-r20.1/packages-split/gcc/usr/lib/gcc/powerpc-angstrom-linux/4.3.3/libgcc_s.so'
NOTE: package objc skipped
NOTE: package gcc-4.3.3-r20.1: task do_package: Succeeded

Anyone a suggestion?

Frans


