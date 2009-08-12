Received: from [209.85.220.216] (helo=mail-fx0-f216.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <stuart68@gmail.com>) id 1MbEfS-0008DN-62
	for openembedded-devel@lists.openembedded.org;
	Wed, 12 Aug 2009 16:19:12 +0200
Received: by fxm12 with SMTP id 12so25427fxm.20
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 Aug 2009 07:02:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type;
	bh=v0gBNQ2M8Gc8NuflWgZdma8+kJ/iuIhTQ7zVLus4hY8=;
	b=pl9i/WJ9BvC4SqE8dSA+YxxcWkkSo53HKw68hiz5ZKCE+ZErtdDq0pvOv03eEv8yUH
	hpXq4/dgUBhpyjhrDOy+yvTFlK88N1dOglH/X37Fx+kR1OTybfxRKHZq0nqDSB9syBSn
	v8l2mKh4oRh9pqExEF0m80OzR4PiRBi1Vuuv8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type;
	b=cGnn2U0dO49bUTH3DK8Y+yXE/iLhbUifxkPGqa0QNvytxMqBtAhBDJVJQwSId4E8A0
	f/NTppQPULyEgNG7Pu29V/M1cf/+s7xqb7YvNjmpOfzmSBnA4ZrEdk7kRKhTHjp8W1f4
	YD7pViZP2HE9GbEAq70WukANLe2GxEIudIaJs=
MIME-Version: 1.0
Received: by 10.204.104.7 with SMTP id m7mr86494bko.24.1250085759371; Wed, 12 
	Aug 2009 07:02:39 -0700 (PDT)
Date: Wed, 12 Aug 2009 15:02:39 +0100
Message-ID: <91283b620908120702l24e9f2fbre7a778266d1d993d@mail.gmail.com>
From: Stuart Gray <stuart68@gmail.com>
To: openembedded-devel@lists.openembedded.org
X-Content-Filtered-By: Mailman/MimeDel 2.1.11
Subject: linux-omap3_git.bb - SRC_URI_append list error????
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
X-List-Received-Date: Wed, 12 Aug 2009 14:19:29 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hi,

The Bitbake file named above includes reference to a file which I think
should not be included within this .bb file.

Can someone with experience of compiling the kernel and an in-depth
knowledge of what should be included have a look at this and let me know if
it is correct. I think the correct Bitbake file that it should be include
within in is the linux-omap3_2.6.30.bb where it is also included.

The line in question is:

           file://rc8-to-final.diff;patch=1 \

Thanks,
Stuart

