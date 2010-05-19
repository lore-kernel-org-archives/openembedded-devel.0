Received: from mail-vw0-f47.google.com ([209.85.212.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <daniel.xntian@gmail.com>) id 1OEfgR-0002Dh-5o
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 11:35:25 +0200
Received: by vws20 with SMTP id 20so2723974vws.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 02:31:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:received:date:message-id
	:subject:from:to:content-type;
	bh=MDDfSPpyj6Nt5HUx7+cYNJdgvtGJnukqjLzcNgnLRvc=;
	b=DbFi4HPaWc4dNcrbp26tD9E3aRAOzm47l6tmfAO0ssYf5MENDzr6zvC7sDktPtxl2U
	UQ4xDTWjA24fpPwi1d+/aTVMxTmkkGKlQN5bjwgI9GhcVLkhg7YMyp+oK3piFk5sut9d
	hET7gy48N0fL77Q8UMUnl2scEStQTxmiDRUAs=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=rbRf01W+zzaI1wkqxR4/NmgYcmyitT4fdBdiMhSEx0RV+ckzcAb3Nw3EcIurFdMUI4
	M4Juo0njUlZitBwsSfZDY65gQR8kFh0ZCBmgyUqOREYc/i3OaMBwhbmaSNAecfJpvPXu
	1AMQa1x/LqUUP92YOWBlSQqNw+6rdo7gzKpSg=
MIME-Version: 1.0
Received: by 10.220.88.81 with SMTP id z17mr4209629vcl.174.1274261481383; Wed, 
	19 May 2010 02:31:21 -0700 (PDT)
Received: by 10.220.100.140 with HTTP; Wed, 19 May 2010 02:31:21 -0700 (PDT)
Date: Wed, 19 May 2010 17:31:21 +0800
Message-ID: <AANLkTimeUg2WhglfZE-N2rdYNZ4yehKmR6YSvBL5NIPX@mail.gmail.com>
From: daniel tian <daniel.xntian@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
X-SA-Exim-Connect-IP: 209.85.212.47
X-SA-Exim-Mail-From: daniel.xntian@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Does anybody try the e-image-core
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
X-List-Received-Date: Wed, 19 May 2010 09:35:33 -0000
X-List-Received-Date: Wed, 19 May 2010 09:35:33 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi, guys:
    Now I am working on a project: porting the enlighenment on mips machine.
    The local.conf is configure as db1200 machine which is a mips32
little endian arch.
    I have already built a rootfs and kernel from previous
openembedded source code.
    But the startx command is not found, so I don't know how to
startup the enlightenment desktop, and maybe there have any others
packages missing in this rootfs.
    So I just wander whethere somebody has already try the
e-image-core succeeded(ARM platform is Ok.)

     And there is another problem. Now I update the OE code, and try
to build the e-image-core again. But there is package not being
downloaded:
    /home/daniel/OE/openembedded/recipes/e17/illume-keyboard-default_svn.bb,
Here is the error message:

NOTE: fetch http://mirrors.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
--2010-05-19 17:05:16--
http://mirrors.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
Resolving mirrors.openembedded.org... 82.197.159.157
Connecting to mirrors.openembedded.org|82.197.159.157|:80... NOTE:
Running task 2440 of 6114 (ID: 3728,
/home/daniel/OE/openembedded/recipes/glibc/glibc-initial_2.9.bb,
do_qa_staging)
connected.
HTTP request sent, awaiting response... 404 Not Found
2010-05-19 17:05:17 ERROR 404: Not Found.

NOTE: fetch http://sources.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
--2010-05-19 17:05:17--
http://sources.openembedded.org//e.src.modules.illume.keyboards_svn.enlightenment.org_.svn.e.trunk_48935_.tar.gz
Resolving sources.openembedded.org... 140.211.169.165
Connecting to sources.openembedded.org|140.211.169.165|:80... connected.
HTTP request sent, awaiting response... 404 Not Found
2010-05-19 17:05:17 ERROR 404: Not Found.

Does anybody also meet this problem?

and can anyone give some advise? thanks very much.
Any suggestion is appreciated.


          daniel


