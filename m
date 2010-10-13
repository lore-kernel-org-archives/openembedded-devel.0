Received: from smtprelay04.ispgateway.de ([80.67.31.31])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dimov@ronetix.at>) id 1P61hB-0001NC-JM
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 15:48:43 +0200
Received: from [62.178.142.196] (helo=iserv.ronetix.at)
	by smtprelay04.ispgateway.de with esmtps (TLSv1:AES256-SHA:256)
	(Exim 4.68) (envelope-from <dimov@ronetix.at>) id 1P5xO2-0005WI-9v
	for openembedded-devel@lists.openembedded.org;
	Wed, 13 Oct 2010 11:12:38 +0200
Received: from [192.168.10.40] (tserv_vpn [192.168.22.10])
	by iserv.ronetix.at (8.13.8/8.13.8) with ESMTP id o9D9CQ3T016725
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 13 Oct 2010 11:12:27 +0200
Message-ID: <4CB57839.3030905@ronetix.at>
Date: Wed, 13 Oct 2010 12:13:29 +0300
From: RONETIX - Asen Dimov <dimov@ronetix.at>
User-Agent: Thunderbird 2.0.0.23 (X11/20090825)
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
X-Df-Sender: [pbs]Z2Fnb3ZAcm9uZXRpeC5hdA==
X-SA-Exim-Connect-IP: 80.67.31.31
X-SA-Exim-Mail-From: dimov@ronetix.at
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,SPF_HELO_PASS,
	SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: [RFC] Add machine pm9g45 based on at91sam9g45
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
X-List-Received-Date: Wed, 13 Oct 2010 13:48:43 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

I want to add a new board and have a method solving some issues(listed 
below).
But I am not sure if this could be the appropriate solution, so this is 
the idea
to be commented on.

 The idea of patching linux kernel for pm9g45
                                             
 As the 2.6.30-at91-exp.tar.gz has a patch(with number 66) which do not 
apply
 cleanly( parts of it have been already applied to 2.6.30.10 kernel) and 
also
 the bitbake do not handle patches in a tar.gz format, that leaded to 
the need
 of writing code for extended patching. The PM9G45_patches_list 
contains      
 patches, which have be applied after the 2.6.30-at91-exp.tar.gz, so the 
option
 "apply=no" make this. That helps to apply patches in proper 
order.            
                                                                              
 
 A patch method have to be appended to the python do_patch() 
task.               
 And as I do not know python(I made a try with python but I couldn't 
make it)  
 the appended code just call a shell script that implements the method 
-       
 do_patchronetix_sh().                                                        
 
                                                                              
 
 So the do_patchronetix_sh() extract the 2.6.30-at91-exp.tar.gz and 
apply      
 patches in it one by one, but when it reaches the problem patch the 
hunks     
 already applied are removed and the patch( 66) is then 
applied.               
 Then from the names in PM9G45_patches_list are removed "file://" 
and          
 ";apply=no" in order to be valid names for the patch 
utility.                 
 And finally the ARM machine list is 
updated.                                 

part of recipes/linux/linux_2.6.30.bb
--- 8< 
------------------------------------------------------------------------------------------
PM9G45_patches_list = " \
        file://0001-ads7846-.c-and-.h-add-swap_xy.patch;apply=no \
        file://0003-print-some-more-info-from-atmel_nand.c.patch;apply=no \
        
file://0004-add-newline-at-the-end-of-uncorrectable-error.patch;apply=no \
        
file://0005-Add-CompactFlash-to-at91sam9g45-architecture.patch;apply=no \
        
file://0006-pm9g45-system-ram-can-be-on-CS1-or-CS6.patch;apply=no \       
        file://0007-add-pm9g45-board.patch;apply=no 
\                             
        file://0008-pm9g45-default-configuration-files.patch;apply=no 
\           
        file://0009-add-float-flags-in-Makefile.patch;apply=no \
        file://0010-conditional-compile-if-DEDICATED_VRAM.patch;apply=no \
        
file://0011-add-pm9g45-board-version-1.2-and-adjust-memory-sele.patch;apply=no 
\
        
file://0012-enable-USB-Device-with-On-the-go-ability.patch;apply=no "


AT91_EXP_PROBLEM_PATCH = 
"2.6.30-at91-exp-0066-sound-soc-update-soc-support-to-2.6.32-rc3-alsa.patch"
SRC_URI_append_ronetix-pm9g45 = " 
ftp://www.at91.com/pub/linux/2.6.30-at91/2.6.30-at91-exp.tar.gz;name=2630at91exptargz 
\
                                ${PM9G45_patches_list} "

do_patchronetix_sh() {
        cd ${S}
        # add AT91 experimental patches
        export PatchList=`ls ${WORKDIR}/2.6.30-at91-exp/`
        for Patch in ${PatchList}; do \
                if [ ${AT91_EXP_PROBLEM_PATCH} == $Patch ]; then \
                        echo "This patch has problems ${Patch}" ;\
                        #remove that hunks which have been already 
applied. \
                        sed -e '4342,4350 d' -e '6422,6435 d' -e 
'7720,7742 d' \
                                ${WORKDIR}/2.6.30-at91-exp/${Patch} | 
patch -s -f -p1 ;\
                        continue ;\
                fi
                echo "Applying patch ${WORKDIR}/2.6.30-at91-exp/${Patch}" ;\
                patch -s -f -p1 < ${WORKDIR}/2.6.30-at91-exp/${Patch};\
        done
        # add pm9g45 patches
        for Patch in "${PM9G45_patches_list}" ; do \
                export NEW_FLIST="${NEW_FLIST} `echo ${Patch} | sed -e 
"s/file\:\/\/*//g" -e "s/;apply=no//g" -e "s/ \\ //g"`";\
        done
        for Patch in ${NEW_FLIST} ;do \
                echo "Applying patch ${WORKDIR}/${Patch}" ;\
                patch -s -f -p1 < ${WORKDIR}/${Patch};\
        done
        #update arm mach-types
        #instead of applying 
file://0002-add-pm9g45-number-in-mach-types.patch
        wget http://www.arm.linux.org.uk/developer/machines/download.php 
-O ${S}/arch/arm/tools/mach-types
}
addtask patchronetix_sh

python do_patch_append_ronetix-pm9g45 () {
        bb.build.exec_func('do_patchronetix_sh', d)
}
# End of idea for patching linux kernel for pm9g45
--- 8< 
------------------------------------------------------------------------------------------

Regards,
Asen


