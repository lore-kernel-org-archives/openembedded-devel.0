Received: from [209.85.200.170] (helo=wf-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <taroth@gmail.com>) id 1LY69D-0000Na-7K
	for openembedded-devel@openembedded.org; Fri, 13 Feb 2009 23:04:35 +0100
Received: by wf-out-1314.google.com with SMTP id 25so1388045wfc.6
	for <openembedded-devel@openembedded.org>;
	Fri, 13 Feb 2009 14:03:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=7XimqR+f2qsbEKBH2MKesLmit4o9tBHraclDLm79Lxw=;
	b=G+ZEIHy3SL28m4wCaCBZLdaSPUFY8sGKwb+woXlF8cCRU9nc5LQsqUM4QR+VXK2JI1
	eNJBj+ZFe/N5Nch6nGGjhLGMGVT6QCbyZH+sD+1YFIWM2vb5+d8ynthCkZ0v4/EbjAgg
	FpGXQIiOOPfxQGYX+HzUH/J+Cawx5gRelU6H4=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=EVj3QfjGlaTwVOv023SQvbEi+dPQUxpPGpKn3VuyrE6xmqpgtoTwys934uz/QbsvvT
	1YtHZi78dTNyyXwdV1uTv/ZvWxD0MFtUFP+qOheyquRxnqCr7fknx9r9kjQuvQQz7xKe
	6m+5yXipxmDhAICN07wNeQJhgghoW31lggGlI=
MIME-Version: 1.0
Received: by 10.142.58.20 with SMTP id g20mr1121120wfa.191.1234562586500; Fri, 
	13 Feb 2009 14:03:06 -0800 (PST)
Date: Fri, 13 Feb 2009 14:03:06 -0800
Message-ID: <f46da1cf0902131403g13809c26n76ef4f50d38e2839@mail.gmail.com>
From: "Theodore A. Roth" <taroth@gmail.com>
To: openembedded-devel@openembedded.org
Subject: missing busybox patch for initramfs-minimal-image
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
X-List-Received-Date: Fri, 13 Feb 2009 22:04:35 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

I just ran 'bitbake initramfs-minimal-image' for my setup and it
failed with this:

NOTE: Applying patch 'B921600.patch'
(/home/roth/dev/OE/openembedded/packages/busybox/busybox-static-1.11.3/angstrom/./B921600.patch)
NOTE: Task failed: Error:
/home/roth/dev/OE/openembedded/packages/busybox/busybox-static-1.11.3/angstrom/./B921600.patch
not found.
NOTE: package busybox-static-1.11.3-r3: task do_patch: failed
ERROR: TaskFailed event exception, aborting
NOTE: package busybox-static-1.11.3: failed
ERROR: Build of
/home/roth/dev/OE/openembedded/packages/busybox/busybox-static_1.11.3.bb
do_patch failed
ERROR: Task 165
(/home/roth/dev/OE/openembedded/packages/busybox/busybox-static_1.11.3.bb,
do_patch) failed
NOTE: Tasks Summary: Attempted 428 tasks of which 416 didn't need to
be rerun and 1 failed.
ERROR: '/home/roth/dev/OE/openembedded/packages/busybox/busybox-static_1.11.3.bb'
failed


To resolve this, I simply copied the B921600.patch like this:

  $ cp packages/busybox/busybox-1.11.3/B921600.patch
packages/busybox/busybox-static-1.11.3

Ted Roth


