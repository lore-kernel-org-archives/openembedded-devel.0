Received: from mail-vx0-f175.google.com ([209.85.220.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1QpkvG-00078C-Rq
	for openembedded-devel@lists.openembedded.org;
	Sat, 06 Aug 2011 19:44:30 +0200
Received: by vxj14 with SMTP id 14so2575353vxj.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 06 Aug 2011 10:40:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=/Cgdmf657HBNmj+cCxxNhgoDQhXaU6g/HpRfT7rBGoU=;
	b=Fnl6sooD22I0Qb4pz9IeI+sm3BMYl+0Co33epOimnWIuq1g+TdlzLJ52L0/wBJ+uDX
	haTnr+eGro3lGuVbSlHewK08XEGnq4kwaGKSLPEz7LKUEhvCYdbumzW6WOasPl8o2uEh
	2ibuIuvJBFv9qIswdd80X7aF4c4gMKHjvWpI4=
MIME-Version: 1.0
Received: by 10.52.155.135 with SMTP id vw7mr3460974vdb.238.1312652403646;
	Sat, 06 Aug 2011 10:40:03 -0700 (PDT)
Received: by 10.220.203.12 with HTTP; Sat, 6 Aug 2011 10:40:03 -0700 (PDT)
Date: Sat, 6 Aug 2011 19:40:03 +0200
Message-ID: <CACW_hTaSmZHdnvvAsvLbZBLCoxKnxdetTGGYbWPMnVGjOBwi4A@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: isuses installing from scratch
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
X-List-Received-Date: Sat, 06 Aug 2011 17:44:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi all,

Found the following issues when installing from scratch on ubuntu 11.04
Decided to use the getting started page.
http://wiki.openembedded.net/index.php/Getting_started
This page mentions 1.10.2 from berlios, but the latest version on berlios is
1.12.0
Can't change it in the wiki.

And 1.12.0 also needed python-ply iand python-progressbar installed.

And lastly the example for local.conf is not correct:

For building a .dev branch, in your local.conf file, you should have at
least the following three entries. Example for the Angstrom distribution and
the Openmoko gta01 machine:

BBFILES = "/stuff/openembedded/recipes/*/*.bb"
DISTRO = "angstrom-2010.x"
MACHINE = "beagleboard"

The text talks about gta01, example uses beagleboard

Can someone with edit rights fix this?

Thanks! Frans

