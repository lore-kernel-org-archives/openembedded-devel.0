Return-Path: <otavio.salvador@gmail.com>
Received: from mail-yk0-f176.google.com (mail-yk0-f176.google.com
	[209.85.160.176])
	by mail.openembedded.org (Postfix) with ESMTP id 9C2FB61585
	for <openembedded-devel@lists.openembedded.org>;
	Wed,  6 Aug 2014 17:59:08 +0000 (UTC)
Received: by mail-yk0-f176.google.com with SMTP id 19so1921418ykq.35
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 06 Aug 2014 10:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:sender:date:message-id:subject:from:to:content-type;
	bh=CGNQh4zv+EvelgitSQk4PAccMBK9xXAz/gTxiiN0qBI=;
	b=htb3Zglx48U9VSgSyQkrPltXGYXAZuKBq8wajupePrpJdpxc4qP7T9xUrmB2AGEHIN
	VZEmKWHmZKU9e+//v4pgfO+mdqw7pqNMGmXePN0otuEKynVlGaskFqxKkSkdq/MCtvCZ
	Fk1YJen1+EYezg3qHS7bd44tzZotFnVIonHXHchCoFDPkclxqclj+GtdBZzuMxaCxamK
	tcJygFNnnqA0fvvicn4gXuOHcMBPXXPckf1bgcf5GDb63nSmlg1+eJpNn1aTSgQcutTZ
	LW6Seqq3SyTo7l7DsfDg2xeFVhFwUT49tr6VE0RmxYyAGOFqxhI+F3bUPBr3bYnMESNO
	XAog==
MIME-Version: 1.0
X-Received: by 10.236.129.3 with SMTP id g3mr18638330yhi.67.1407347946805;
	Wed, 06 Aug 2014 10:59:06 -0700 (PDT)
Sender: otavio.salvador@gmail.com
Received: by 10.170.56.201 with HTTP; Wed, 6 Aug 2014 10:59:06 -0700 (PDT)
Date: Wed, 6 Aug 2014 14:59:06 -0300
X-Google-Sender-Auth: ABpY99zQ1U6RZOMwhLWuXAMj0tc
Message-ID: <CAP9ODKpe1xeC9KksG+7igf_nrLY5-hx5UgeoC=2p=D4Vysj1hA@mail.gmail.com>
From: Otavio Salvador <otavio@ossystems.com.br>
To: OpenEmbedded Devel List <openembedded-devel@lists.openembedded.org>
Subject: [meta-qt5] Patch failing to apply
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.12
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.openembedded.org/mailman/options/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.openembedded.org/pipermail/openembedded-devel/>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.openembedded.org/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Wed, 06 Aug 2014 17:59:12 -0000
Content-Type: text/plain; charset=UTF-8

Hello,

The daisy branch seems to be broken. Please check:

recipe qtimageformats-5.2.1-r0: task do_patch: Started
ERROR: Command Error: exit status: 1  Output:
Applying patch 0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
patching file qtimageformats.pro
Hunk #1 FAILED at 1.
1 out of 1 hunk FAILED -- rejects in file qtimageformats.pro
Patch 0001-qtimageformats.pro-Make-the-dependencies-determinist.patch
does not apply (enforce with -f)
ERROR: Function failed: patch_do_patch
ERROR: Logfile of failure stored in:
.../build/tmp/work/cortexa9hf-vfp-neon-oel-linux-gnueabi/qtimageformats/5.2.1-r0/temp/log.do_patch.22853

I catch this in our autobuilder.

-- 
Otavio Salvador                             O.S. Systems
http://www.ossystems.com.br        http://code.ossystems.com.br
Mobile: +55 (53) 9981-7854            Mobile: +1 (347) 903-9750

