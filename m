Received: from [64.233.166.181] (helo=py-out-1112.google.com)
	by linuxtogo.org with esmtp (Exim 4.68)
	(envelope-from <mwhoosier@gmail.com>) id 1Ixnd8-00046K-LS
	for openembedded-devel@lists.openembedded.org;
	Thu, 29 Nov 2007 18:56:55 +0100
Received: by py-out-1112.google.com with SMTP id a25so4336216pyi
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 29 Nov 2007 09:53:49 -0800 (PST)
Received: by 10.35.68.3 with SMTP id v3mr7819359pyk.1196358828741;
	Thu, 29 Nov 2007 09:53:48 -0800 (PST)
Received: by 10.35.15.5 with HTTP; Thu, 29 Nov 2007 09:53:48 -0800 (PST)
Message-ID: <d543f5920711290953x75c79b84gbb5bfdce83bfc324@mail.gmail.com>
Date: Thu, 29 Nov 2007 11:53:48 -0600
From: "Matt Hoosier" <matt.hoosier@gmail.com>
Sender: mwhoosier@gmail.com
To: openembedded-devel@lists.openembedded.org, poky <poky@o-hand.com>
MIME-Version: 1.0
X-Google-Sender-Auth: 2c2536155beefa6d
Subject: Syntax for requiring a dependency task's deploy phase to be finished
X-BeenThere: openembedded-devel@lists.openembedded.org
X-Mailman-Version: 2.1.9
Precedence: list
Reply-To: openembedded-devel@lists.openembedded.org
List-Id: Using the OpenEmbedded metadata to build Distributions
	<openembedded-devel.lists.openembedded.org>
List-Unsubscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=unsubscribe>
List-Archive: <http://lists.linuxtogo.org/pipermail/openembedded-devel>
List-Post: <mailto:openembedded-devel@lists.openembedded.org>
List-Help: <mailto:openembedded-devel-request@lists.openembedded.org?subject=help>
List-Subscribe: <http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel>,
	<mailto:openembedded-devel-request@lists.openembedded.org?subject=subscribe>
X-List-Received-Date: Thu, 29 Nov 2007 17:56:55 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi,

I'm trying to build a kernel containing an initramfs linked directly
into the kernel binary. This is inspired by the recent discussion
here: building a minimal image with IMAGE_FSTYPE set to cpio.

I need to be sure that by the time the kernel's do_compile task
executes, the minimal image has been deploy to ${DEPLOY_DIR}/image.
What's the right way to write this dependency?

Thanks


