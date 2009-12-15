Received: from mail-px0-f183.google.com ([209.85.216.183])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vivektambakad@gmail.com>) id 1NKSFO-0000MW-Qn
	for openembedded-devel@lists.openembedded.org;
	Tue, 15 Dec 2009 08:55:10 +0100
Received: by pxi13 with SMTP id 13so2794596pxi.24
	for <openembedded-devel@lists.openembedded.org>;
	Mon, 14 Dec 2009 23:53:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=LxNhUbJWpjR8vQd/6KAyU17+WJuN93wvV1Jd37vXqQA=;
	b=tEs492Pis/SSQFpnVozIKvR9WMmJI932rq8hGW+j/g4i2W2bk2lStUH1C6iyVvTmgW
	GZvtg+Z+HUpinRQqKXY140OXRChUeDpN6ofi83KTooun9wc/d3zuVwcPR8Gl+t2Te4Yr
	gqsFa/OKEskGgtlRlWnzdBAEKTGmqF3gTfKtw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=LmmPHc4ubvVKsh9+luX7RWsgZnh9f91JMYB7hBHYfYA6YPeZ3RmOw61ofVnEFlzoSC
	sdvHAGmIfCqyMJRlMZsa4Bthud19fK1Y+zmuMzficLgW3VAEcFLQHtMXYWEbTAJwdWwW
	0fE1pe+D2+rzucUA4u68xm1dCV9fcTMoqgSj0=
MIME-Version: 1.0
Received: by 10.114.237.24 with SMTP id k24mr4036343wah.5.1260863599867; Mon, 
	14 Dec 2009 23:53:19 -0800 (PST)
Date: Tue, 15 Dec 2009 13:23:19 +0530
Message-ID: <ad82c8890912142353j1ed5f5b1l3e0684d060d61f09@mail.gmail.com>
From: vivek tambakad <vivektambakad@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-SA-Exim-Connect-IP: 209.85.216.183
X-SA-Exim-Mail-From: vivektambakad@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: mkfs.jffs2: command not found while building x11-image
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
X-List-Received-Date: Tue, 15 Dec 2009 07:55:10 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,
        I am getting mkfs.jffs2:command not found while running bitbake
x11-image.

| + mkfs.jffs2
--root=/home/vivek/development/em-x270/stuff/build/oetmp/rootfs/x11-image
--output=/home/vivek/development/em-x270/stuff/build/oetmp/deploy/glibc/images/em-x270/Angstrom-x11-image-glibc-ipk-2009.X-test-20091215-em-x270.rootfs.jffs2
--eraseblock=0x20000 --pad --faketime -n
|
/home/vivek/development/em-x270/stuff/build/oetmp/work/em-x270-angstrom-linux-gnueabi/x11-image-1.0-r0/temp/run.do_rootfs.2207:
line 699: mkfs.jffs2: command not found
NOTE: Task failed:
/home/vivek/development/em-x270/stuff/build/oetmp/work/em-x270-angstrom-linux-gnueabi/x11-image-1.0-r0/temp/log.do_rootfs.2207
ERROR: TaskFailed event exception, aborting
ERROR: Build of
/home/vivek/development/em-x270/stuff//openembedded/recipes/images/
x11-image.bb do_rootfs failed
ERROR: Task 10
(/home/vivek/development/em-x270/stuff//openembedded/recipes/images/
x11-image.bb, do_rootfs) failed
NOTE: Tasks Summary: Attempted 5679 tasks of which 5678 didn't need to be
rerun and 1 failed.
ERROR: '/home/vivek/development/em-x270/stuff//openembedded/recipes/images/
x11-image.bb' failed

Is there anything i need to add in x11-image.bb files. Please tell me how to
overcome from this error.

with regards
vivek tambakad

