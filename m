Received: from [66.249.92.172] (helo=ug-out-1314.google.com)
	by linuxtogo.org with esmtp (Exim 4.63)
	(envelope-from <leon.woestenberg@gmail.com>) id 1HbZCP-0000xq-58
	for openembedded-devel@lists.openembedded.org;
	Wed, 11 Apr 2007 11:33:09 +0200
Received: by ug-out-1314.google.com with SMTP id e2so69885ugf
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 11 Apr 2007 02:33:08 -0700 (PDT)
Received: by 10.67.121.15 with SMTP id y15mr319156ugm.1176283988456;
	Wed, 11 Apr 2007 02:33:08 -0700 (PDT)
Received: by 10.66.251.2 with HTTP; Wed, 11 Apr 2007 02:33:08 -0700 (PDT)
Message-ID: <c384c5ea0704110233n3460422er46d71c2a41121da3@mail.gmail.com>
Date: Wed, 11 Apr 2007 11:33:08 +0200
From: "Leon Woestenberg" <leon.woestenberg@gmail.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <c384c5ea0704110200q43512f77gaa3092f081b18d91@mail.gmail.com>
MIME-Version: 1.0
References: <c384c5ea0704110132s27b28fcifba5fc2db437e167@mail.gmail.com>
	<1176280755.5843.3.camel@localhost.localdomain>
	<c384c5ea0704110200q43512f77gaa3092f081b18d91@mail.gmail.com>
Subject: Re: deterministic OE builds - multiple providers
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
X-List-Received-Date: Wed, 11 Apr 2007 09:33:09 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

To illustrate the undeterministic points, this is what happens on one machine:

leon@axonnl-092 ~/sandbox/ixp4xx/openembedded $ bitbake -vvv
ixp4xx-kernel -c patch | grep Running
NOTE: Running task 1 of 3 (ID: 2,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_fetch)
NOTE: Running task 1 of 3 (ID: 2,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_fetch)
NOTE: Running task 2 of 3 (ID: 0,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_unpack)
NOTE: Running task 1 of 3 (ID: 2,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_fetch)
NOTE: Running task 2 of 3 (ID: 0,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_unpack)
NOTE: Running task 3 of 3 (ID: 1,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_patch)
NOTE: Running task 1 of 3 (ID: 2,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_fetch)
NOTE: Running task 2 of 3 (ID: 0,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_unpack)
NOTE: Running task 3 of 3 (ID: 1,
/home/leon/sandbox/openembedded/tv.axon.openembedded/packages/linux/ixp4xx-kernel_2.6.19.bb,
do_patch)

leon@axonnl-092 ~/sandbox/ixp4xx/openembedded $ bitbake -vvv
ixp4xx-kernel | grep Running
cp: cannot stat
`/home/leon/sandbox/openembedded/org.openembedded.dev/packages/linux/linux/defconfig':
No such file or directory
NOTE: Running task 218 of 234 (ID: 96,
/home/leon/sandbox/openembedded/org.openembedded.dev/packages/linux/linux_2.6.19.bb,
do_unpack)
NOTE: Running task 218 of 234 (ID: 96,
/home/leon/sandbox/openembedded/org.openembedded.dev/packages/linux/linux_2.6.19.bb,
do_unpack)


