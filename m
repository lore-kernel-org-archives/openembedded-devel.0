Received: from [209.85.211.177] (helo=mail-yw0-f177.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1N2Res-0003y8-Rw
	for openembedded-devel@lists.openembedded.org;
	Mon, 26 Oct 2009 16:39:02 +0100
Received: by ywh7 with SMTP id 7so10184951ywh.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 26 Oct 2009 08:37:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=FrXFYCLqxSnLB+HqwbCdyCRFIQOVfT6Gxc+VZcKsuMc=;
	b=sTiOm1x3z+rGcdAxhiRpwqQebe6dIRBIZgXHH9cxL8Ov6Jb7jDmGY1EKLhmuHZMWOv
	SlDKnhHzp7iUIS1V4q08YBcX/9Et7Oia2KOMf6H/nGzhcTdLfgPaPZGN76gEBY6iwwYq
	dbhSFrgrsEOBDzxZs6yaxrlUfZLOJtSe2vYhc=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=VaEuBudzUp3KXyM0XwG4PjMiJMf7Ck/cjkIa/DV9ouN2Fzi7+vmTokUyJK9ryEtgne
	vplnwrdREEnRocY0BIwGWvzB0nGgAPDSShxNkL0w1osoZuo0XPHfrnyQv2u10AE6jIKH
	wKCTTozfJSt+vn4s9jyjeXyhTXtQ39q5n4edU=
MIME-Version: 1.0
Received: by 10.101.7.17 with SMTP id k17mr4322117ani.181.1256571473400; Mon, 
	26 Oct 2009 08:37:53 -0700 (PDT)
Date: Mon, 26 Oct 2009 16:37:53 +0100
Message-ID: <ac9c93b10910260837m708ebc41ja934d825c6b1bec3@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.211.177
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: MACHINE_KERNEL_PR issue
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
X-List-Received-Date: Mon, 26 Oct 2009 15:39:02 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

While creating a recipe which generates a module I bumped into the
following issue.
If I do
inherit module
the package name uses MACHINE_KERNEL_PR and not PR.
I understand the reason for this: if the kernel is modified you want
the proper modules.
However in a recipe this means that if the recipe changes for whatever
reason that technically one should increase all MACHINE_KERNEL_PR
values (as otherwise the new version is not used).
In my eyes this is not very desirable.

Any opinions how we should fix this?

Frans


