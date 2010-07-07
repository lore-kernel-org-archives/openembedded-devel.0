Received: from 93-97-173-237.zone5.bethere.co.uk ([93.97.173.237]
	helo=tim.rpsys.net) by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <rpurdie@rpsys.net>) id 1OWVHb-00028A-2p
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jul 2010 16:07:44 +0200
Received: from localhost (localhost [127.0.0.1])
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o67E2QE1014210;
	Wed, 7 Jul 2010 15:02:26 +0100
Received: from tim.rpsys.net ([127.0.0.1])
	by localhost (tim.rpsys.net [127.0.0.1]) (amavisd-new,
	port 10024) with LMTP
	id 14101-02; Wed,  7 Jul 2010 15:02:22 +0100 (BST)
Received: from [192.168.3.10] ([192.168.3.10]) (authenticated bits=0)
	by tim.rpsys.net (8.13.6/8.13.8) with ESMTP id o67E2Kde014204
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Wed, 7 Jul 2010 15:02:20 +0100
From: Richard Purdie <rpurdie@rpsys.net>
To: Khem Raj <raj.khem@gmail.com>
In-Reply-To: <20100704010150.GA21048@gmail.com>
References: <20100704010150.GA21048@gmail.com>
Date: Wed, 07 Jul 2010 15:02:10 +0100
Message-ID: <1278511330.30247.3690.camel@rex>
Mime-Version: 1.0
X-Mailer: Evolution 2.28.3 
X-Virus-Scanned: amavisd-new at rpsys.net
X-SA-Exim-Connect-IP: 93.97.173.237
X-SA-Exim-Mail-From: rpurdie@rpsys.net
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=5.0 tests=AWL,BAYES_00,RDNS_DYNAMIC,
	TVD_RCVD_IP autolearn=no version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: bitbake-dev@lists.berlios.de, openembedded-devel@lists.openembedded.org
Subject: Re: [Bitbake-dev] Commit ca257adc587bb0937ea76d8b32b654fdbf4192b8 changes behavior on which recipes rely
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
X-List-Received-Date: Wed, 07 Jul 2010 14:07:44 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit

On Sat, 2010-07-03 at 18:01 -0700, Khem Raj wrote:
> Hi
> 
> Due to this commit here
> 
> commit ca257adc587bb0937ea76d8b32b654fdbf4192b8
> Author: Nitin A Kamble <nitin.a.kamble@intel.com>
> Date:   Thu Jun 3 21:50:02 2010 -0700
> 
>     bitbake decodeurl: fix the file:// url handling
>     
>     Without this patch decoding a url of this kind file://dir/filename
> gives
>     path=/filename host=dir.
>     With the patch it decodes as path=/dir/filename host=""
>     
>     Probably nobody stumbled on this issue yet because nobody used
>     file:// urls with directory names in the path.
>     
>     (From Poky rev: c3682bf89bdf236a4b4d834069d947b6a1456791)
>     
>     Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
>     Signed-off-by: Richard Purdie <rpurdie@linux.intel.com>
> 
> 
> few recipes in OE are broken now.
> Previous behavior was that if it has
> file://pam.d/securetty in SRC_URI
> then bitbake would copy it into
> $WORKDIR/pam.d/securetty and recipes used
> this location to access these files. But after
> this commit the directory is ignored and it gets
> copied into ${WORKDIT}
> 
> Problem is that I have found three places where it happens
> two were ok because the build failed as it could not find
> the file where it was looking for but third one took me
> a day to debug because it copied only if directory existed
> otherwise it used the old files so the build passed and image
> got created but it would not let login happen
> 
> see shadow recipes
> 
> do_install_append() {                                                                                                                                                            
>   # Ensure that /etc/skel is created so any default files that we want
>   # copied into new users home                                                                                
>   # dirs can be put in there later (ideal for .xinitrc for example).                                                                                                             
>   install -d ${D}${sysconfdir}/skel/                                                                                                                                             
>                                                                                                                                                                                  
>   # Ensure that the image has as /var/spool/mail dir so shadow can put
>   # mailboxes there if the user                                                                               
>   # reconfigures Shadow to default (see sed below).                                                                                                                              
>   install -d ${D}${SHADOW_MAILDIR}                                                                                                                                               
>                                                                                                                                                                                  
>   if [ -e ${WORKDIR}/pam.d ]; then                                                                                                                                               
>       install -d ${D}${sysconfdir}/pam.d/                                                                                                                                        
>       install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/                                                                                                                
>   fi                                                                                                                                                                             
> 
> ...
> 
> 
> I would propose the revert the above commit as I am reluctant
> to fix so many recipes I know only 3 and who know how many more
> will start doing wrong things silently.

Hmm, I synced up Poky's bitbake fixes but I'd forgotten about this
commit:

http://git.pokylinux.org/cgit.cgi/poky/commit/?id=2160dddcc14d9378aff5d48ee72e3dc39b4ab8c7

How about using this code in base.bbclass:

if type == "file":
    # When we switch to bitbake 1.10, simplify this mess
    check = bb.decodeurl(url)[1]
    if check:
        destdir = check
    elif path.find("/") != -1:
        destdir = path.rsplit("/", 1)[0]
    else:
        destdir = "."

I don't like the idea of ignoring this as returning a host which is
really a path and is special cased in base.bbclass is just wrong and
should be fixed (with a sensible migration path).

We found this by noticing that file:/// urls don't work so it is a valid
fix.

Is someone with an old bitbake around able to test if the above solves
the problem?

Cheers,

Richard










