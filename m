Received: from mail-px0-f175.google.com ([209.85.212.175])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <raj.khem@gmail.com>) id 1OVDfG-00038z-6H
	for openembedded-devel@lists.openembedded.org;
	Sun, 04 Jul 2010 03:06:37 +0200
Received: by pxi12 with SMTP id 12so1952575pxi.6
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 03 Jul 2010 18:01:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:cc:subject
	:message-id:mime-version:content-type:content-disposition:user-agent;
	bh=nPo/XxuIpEIvFjqpJmir7sXfWGSeT4mEwFl8sc6HzUQ=;
	b=U7VSEIMd9HQz6pNIE5e9nfOom9EL6RoXlS44bqtt1PnOoRxZSp9wqS0s3nQwCyNwjo
	E/GULI8cAEsi3McdyFiPR3CFZvBQ65xcRRv27Pje6F9cTp1f1SCdCrslv7+5+mezfw3u
	hawL1fZp2QhG2eEfLhGo/XiJFh6f8y+JPPHxU=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:cc:subject:message-id:mime-version:content-type
	:content-disposition:user-agent;
	b=rxAueSRKOQtbrgcGJS8QoSvPGCm+L8CIU7ig9uhJrNyf66kB9wQqpOMpjOm2SiN5sr
	3MeRNHAeXL0hLW9tW9EEOR3RLuBhabGbGI5sufVG30xcrljcfr3H4HU47PyRqOZuyZss
	/XfI7efCL+Auci6IEkuJSyz1CyH+iy5ZdhXyA=
Received: by 10.142.212.2 with SMTP id k2mr1129735wfg.264.1278205305795;
	Sat, 03 Jul 2010 18:01:45 -0700 (PDT)
Received: from gmail.com (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id y16sm2697094wff.2.2010.07.03.18.01.44
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 03 Jul 2010 18:01:44 -0700 (PDT)
Date: Sat, 3 Jul 2010 18:01:50 -0700
From: Khem Raj <raj.khem@gmail.com>
To: bitbake-dev@lists.berlios.de
Message-ID: <20100704010150.GA21048@gmail.com>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.212.175
X-SA-Exim-Mail-From: raj.khem@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: openembedded-devel@lists.openembedded.org
Subject: Commit ca257adc587bb0937ea76d8b32b654fdbf4192b8 changes behavior on which recipes rely
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
X-List-Received-Date: Sun, 04 Jul 2010 01:06:38 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi

Due to this commit here

commit ca257adc587bb0937ea76d8b32b654fdbf4192b8
Author: Nitin A Kamble <nitin.a.kamble@intel.com>
Date:   Thu Jun 3 21:50:02 2010 -0700

    bitbake decodeurl: fix the file:// url handling
    
    Without this patch decoding a url of this kind file://dir/filename
gives
    path=/filename host=dir.
    With the patch it decodes as path=/dir/filename host=""
    
    Probably nobody stumbled on this issue yet because nobody used
    file:// urls with directory names in the path.
    
    (From Poky rev: c3682bf89bdf236a4b4d834069d947b6a1456791)
    
    Signed-off-by: Nitin A Kamble <nitin.a.kamble@intel.com>
    Signed-off-by: Richard Purdie <rpurdie@linux.intel.com>


few recipes in OE are broken now.
Previous behavior was that if it has
file://pam.d/securetty in SRC_URI
then bitbake would copy it into
$WORKDIR/pam.d/securetty and recipes used
this location to access these files. But after
this commit the directory is ignored and it gets
copied into ${WORKDIT}

Problem is that I have found three places where it happens
two were ok because the build failed as it could not find
the file where it was looking for but third one took me
a day to debug because it copied only if directory existed
otherwise it used the old files so the build passed and image
got created but it would not let login happen

see shadow recipes

do_install_append() {                                                                                                                                                            
  # Ensure that /etc/skel is created so any default files that we want
  # copied into new users home                                                                                
  # dirs can be put in there later (ideal for .xinitrc for example).                                                                                                             
  install -d ${D}${sysconfdir}/skel/                                                                                                                                             
                                                                                                                                                                                 
  # Ensure that the image has as /var/spool/mail dir so shadow can put
  # mailboxes there if the user                                                                               
  # reconfigures Shadow to default (see sed below).                                                                                                                              
  install -d ${D}${SHADOW_MAILDIR}                                                                                                                                               
                                                                                                                                                                                 
  if [ -e ${WORKDIR}/pam.d ]; then                                                                                                                                               
      install -d ${D}${sysconfdir}/pam.d/                                                                                                                                        
      install -m 0644 ${WORKDIR}/pam.d/* ${D}${sysconfdir}/pam.d/                                                                                                                
  fi                                                                                                                                                                             

...


I would propose the revert the above commit as I am reluctant
to fix so many recipes I know only 3 and who know how many more
will start doing wrong things silently.

Thanks
-Khem



