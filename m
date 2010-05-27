Received: from promwad.com ([83.149.69.23])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vladimir.davydov@promwad.com>) id 1OHeMb-00021T-WF
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 16:47:14 +0200
Received: from [195.222.85.229] (helo=intranet.promwad.com)
	by promwad.com with esmtps (TLSv1:AES256-SHA:256) (Exim 4.63)
	(envelope-from <vladimir.davydov@promwad.com>) id 1OHeIO-0004CO-4w
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 17:42:52 +0300
Received: from linux-x8hi.promwad.com ([192.168.10.129]
	helo=linux-x8hi.localnet) by intranet.promwad.com with esmtpsa
	(TLS1.0:DHE_RSA_AES_256_CBC_SHA1:32) (Exim 4.69)
	(envelope-from <vladimir.davydov@promwad.com>) id 1OHeHo-0007hl-Eb
	for openembedded-devel@lists.openembedded.org;
	Thu, 27 May 2010 17:42:16 +0300
To: openembedded-devel@lists.openembedded.org
From: Vladimir Davydov <vladimir.davydov@promwad.com>
Organization: Promwad
Date: Thu, 27 May 2010 17:42:21 +0300
MIME-Version: 1.0
Message-Id: <201005271742.21771.vladimir.davydov@promwad.com>
X-SA-Exim-Connect-IP: 83.149.69.23
X-SA-Exim-Mail-From: vladimir.davydov@promwad.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: developmet setup
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
X-List-Received-Date: Thu, 27 May 2010 14:47:15 -0000
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit

Hi,

Maybe following way will not usefull for you, but it is working for me.

I have overrided do_fetch() method in the kernel recipe to make symlink to my 
kernel source tree, which is under git control.

S = "${WORKDIR}/linux-2.6"

do_fetch () {                                                                                                                                          
  cd ${WORKDIR}                                                                                                                                      
  if [ ! -L ${S} ]; then                                                                                                                             
    ln -sf ${MY_KERNEL_PATH} ${S}                                                                                                             
  fi                                                                                                                                                 
}                                                                                                                                                      

MY_KERNEL_PATH is the local path to my kernel source tree. It is passed from  
environment variables.
I'm using this way only for kernel development.


> Hi all,
> I was searching a clean way to develop in OE my new kernel and my new
> applications.
> 
> I saw this nice article about kernel development:
> http://bec-systems.com/site/521/best-practices-for-kernel-development-with-
> openembedded
> 
> I would like a way to develop inside Openembedded, but not in work
> directory.
> I mean to develop a project in a git tree, allowing me to use 'git diff'
> ..... and finally 'git push' to my internal git servers.
> This is an idea:
> bitbake -c devshell-path /home/myapplication myapplicationrecipe
> 
> Perhaps srctree is a good tool already done for it?
> 
> Thanks,
> Raffaele
> _______________________________________________
> Openembedded-devel mailing list
> Openembedded-devel@lists.openembedded.org
> http://lists.linuxtogo.org/cgi-bin/mailman/listinfo/openembedded-devel


-- 
Vladimir Davydov


