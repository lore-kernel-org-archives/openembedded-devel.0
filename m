Received: from mail.cvg.de ([62.153.82.30])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <enrico.scholz@sigma-chemnitz.de>) id 1O36ER-00036q-E4
	for openembedded-devel@lists.openembedded.org;
	Sat, 17 Apr 2010 13:30:43 +0200
Received: from ensc-virt.intern.sigma-chemnitz.de
	(ensc-virt.intern.sigma-chemnitz.de [192.168.3.24])
	by mail.cvg.de (8.14.3/8.14.4) with ESMTP id o3HBR5RM015428
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=NO);
	Sat, 17 Apr 2010 13:27:05 +0200
Received: from ensc by ensc-virt.intern.sigma-chemnitz.de with local (Exim
	4.71) (envelope-from <ensc@sigma-chemnitz.de>)
	id 1O36Ay-0003vV-J3; Sat, 17 Apr 2010 13:27:04 +0200
From: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
To: openembedded-devel@lists.openembedded.org
References: <1271327750-29247-1-git-send-email-koen@openembedded.org>
Date: Sat, 17 Apr 2010 13:27:04 +0200
In-Reply-To: <1271327750-29247-1-git-send-email-koen@openembedded.org> (Koen
	Kooi's message of "Thu, 15 Apr 2010 12:35:48 +0200")
Message-ID: <lyiq7qe2uv.fsf@ensc-virt.intern.sigma-chemnitz.de>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/23.1 (gnu/linux)
MIME-Version: 1.0
Sender: Enrico Scholz <enrico.scholz@sigma-chemnitz.de>
X-Scanned-By: MIMEDefang 2.67 on 62.153.82.30
X-SA-Exim-Connect-IP: 62.153.82.30
X-SA-Exim-Mail-From: enrico.scholz@sigma-chemnitz.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED,
	SPF_HELO_PASS,SPF_PASS autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Cc: Koen Kooi <koen@openembedded.org>
Subject: Re: [PATCH 1/2] kernel bbclass: convert to new style staging (from poky)
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
X-List-Received-Date: Sat, 17 Apr 2010 11:30:45 -0000
Content-Type: text/plain; charset=us-ascii

Koen Kooi <koen.kooi@gmail.com> writes:

>  	if [ -e include/asm ] ; then
>  		# This link is generated only in kernel before 2.6.33-rc1, don't stage it for newer kernels
>  		ASMDIR=`readlink include/asm`
>  
> -		mkdir -p ${STAGING_KERNEL_DIR}/include/$ASMDIR
> -		cp -fR include/$ASMDIR/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> +		mkdir -p $kerneldir/include/$ASMDIR
> +		cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/
>  	fi
> +
> +	cp -fR include/$ASMDIR/* $kerneldir/include/$ASMDIR/

this breaks on recent kernels because they do no have include/asm and
ASMDIR won't be defined here.


>  	if [ -e arch/${ARCH}/include/asm/ ] ; then 
> -		if [ -e include/asm ] ; then
> -			cp -fR arch/${ARCH}/include/asm/* ${STAGING_KERNEL_DIR}/include/$ASMDIR/
> -		fi
> -		install -d ${STAGING_KERNEL_DIR}/arch/${ARCH}/include
> -		cp -fR arch/${ARCH}/* ${STAGING_KERNEL_DIR}/arch/${ARCH}/	
> +		cp -fR arch/${ARCH}/include/asm/* $kerneldir/include/$ASMDIR/

ditto



Enrico


