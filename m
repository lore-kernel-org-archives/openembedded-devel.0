Received: from mail-gx0-f224.google.com ([209.85.217.224])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <fransmeulenbroeks@gmail.com>) id 1NtKlX-0000QU-HI
	for openembedded-devel@lists.openembedded.org;
	Sun, 21 Mar 2010 14:00:31 +0100
Received: by gxk24 with SMTP id 24so812033gxk.7
	for <openembedded-devel@lists.openembedded.org>;
	Sun, 21 Mar 2010 05:57:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=rQgZbQG5JnCnqiJQ7jkObjm7lnxVHU335VrOEgkxjto=;
	b=GYaz2vHiNUZjX8ym4DD9uZMpkyncpkIYnt5N/vcfxbmN2ZhfcNmvzUXr0f5Yx4fEZB
	Fhl77ETCIlsvebpP8EVy4TMvdpmPr71avc4iq4XgrzQBPx4sUYjD0dmWfoF/cKE0ll8V
	m/u7uPd3yibDejCmesbfsn7WWE314VntdJK8k=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=bRoDBNQqmJpp5HReyG6LPcMEmzJIB82KqM9wk6lbhJ+i5OMEn8eDtcI+6JdKanEROP
	3L6P5KIMyMBKPfW1t8S0cUuc0GBy9fr3KJHIvpzCCrnB75ywx6b0H/XBj3vH5E5cMUPw
	FZ4hv33K45JK2vSyKub5gwi6ncJQYC2R1jXFU=
MIME-Version: 1.0
Received: by 10.101.175.38 with SMTP id c38mr3530760anp.40.1269176239861; Sun, 
	21 Mar 2010 05:57:19 -0700 (PDT)
Date: Sun, 21 Mar 2010 13:57:19 +0100
Message-ID: <ac9c93b11003210557u1fcbcc21jb0dafb9fa16ccc96@mail.gmail.com>
From: Frans Meulenbroeks <fransmeulenbroeks@gmail.com>
To: openembedded-devel@lists.openembedded.org, hawkboard@googlegroups.com
X-SA-Exim-Connect-IP: 209.85.217.224
X-SA-Exim-Mail-From: fransmeulenbroeks@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: hawkboard at 456 Mhz?
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
X-List-Received-Date: Sun, 21 Mar 2010 13:00:31 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

In the openembedded repository I saw the following patch:
http://cgit.openembedded.org/cgit.cgi/openembedded/tree/recipes/linux/linux-davinci/da850_omapl138_opp456mhz.patch
This seems to suggest that it is possible to run the hawkboard at 456
Mhz (and yeah: I know it is out of spec and out of warranty, but for
an experiment it would be quite helpful for me).
I've build the kernel with openembedded, the patch is applied,
CONF_CPU_FREQ is defined, but the control hook in /sys is not there.
I've also tried tweaking the file with the settings (ds850.c) but to no avail.

Anyone a suggestion on how to get this done?

Thanks alot! FM

PS: a way to downclock would also be fine for my experiment. For a
disk benchmark I would like to know what part of the time it takes to
read data actually is caused by the device and which comes from the
os.
Assumption is that the device time is independent of the CPU clock and
that the os time is roughly linear with the cpu frequency. (and yes, I
use an access pattern that tries to avoid pre-caching by the device).


