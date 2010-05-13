Received: from mail-fx0-f47.google.com ([209.85.161.47])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <martin.jansa@gmail.com>) id 1OCS9o-0008FF-JL
	for openembedded-devel@lists.openembedded.org;
	Thu, 13 May 2010 08:44:33 +0200
Received: by fxm11 with SMTP id 11so863197fxm.6
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 12 May 2010 23:40:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:date:from:to:subject
	:message-id:references:mime-version:content-type:content-disposition
	:content-transfer-encoding:in-reply-to:user-agent;
	bh=Ylvy3DvSPKvCedBmpj0NOPsrGsm0k/x6I6Tir1GbeuM=;
	b=NARP1pE9QsXTShF2pFWFq/UC+6BjbQIb3bILOZm6QoO26czw1S4+dmJuqvcLYSmJP2
	BqPzw227Qi69/sOZmeIAKeI7zcj8xfmB3EVancLBdHV9D2VxlrpkouBB1c8dKpuUZeC5
	9gTMOTGR6+FpOk+mSd4QoGZKsCYeKtlSWdodE=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=date:from:to:subject:message-id:references:mime-version
	:content-type:content-disposition:content-transfer-encoding
	:in-reply-to:user-agent;
	b=JL/HymSvkyV83e6jtp8yOZurn2AvDuxx1ukCWI49RHQ8uuXxj/HTqtq9KUpnVDhXMp
	XLzT0q4qkwnTfUVTnWRuiqjCfqn/+UjJPbuzwT3nVR7Hh1IGMS2CH7dJSJwyoWdJCzBh
	ZcBqe4in63BU3rt2F9Jg/R29QAKF7OTGDn4zI=
Received: by 10.223.65.73 with SMTP id h9mr9427509fai.75.1273732837624;
	Wed, 12 May 2010 23:40:37 -0700 (PDT)
Received: from localhost (161-24.13.24.78.awnet.cz [78.24.13.161])
	by mx.google.com with ESMTPS id 2sm4397251faf.15.2010.05.12.23.40.36
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Wed, 12 May 2010 23:40:36 -0700 (PDT)
Date: Thu, 13 May 2010 08:40:37 +0200
From: Martin Jansa <martin.jansa@gmail.com>
To: openembedded-devel@lists.openembedded.org
Message-ID: <20100513064037.GB3370@jama>
References: <alpine.DEB.2.00.1005121722300.14972@lynx>
	<201005130953.59314.roman@khimov.ru>
MIME-Version: 1.0
In-Reply-To: <201005130953.59314.roman@khimov.ru>
User-Agent: Mutt/1.5.20 (2009-06-14)
X-SA-Exim-Connect-IP: 209.85.161.47
X-SA-Exim-Mail-From: martin.jansa@gmail.com
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=5.0 tests=AWL,BAYES_00,SPF_PASS
	autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: some possible fixes in the OE web pages
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
X-List-Received-Date: Thu, 13 May 2010 06:44:33 -0000
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, May 13, 2010 at 09:53:54AM +0400, Roman I Khimov wrote:
> В сообщении от Четверг 13 мая 2010 01:30:53 автор Robert P. J. Day написал:
> > * on http://wiki.openembedded.net/index.php/OEandYourDistro#Ubuntu,
> > there's a reference to configuring for qemu-arm:
> > 
> >   echo 128 > /proc/sys/vm/mmap_min_addr
> > 
> > from memory, i always simply set that to zero on fedora.  is there
> > something magic about the value 128?  at the moment, it's at the
> > default value of 65536 on this ubuntu system.
> 
> With current qemu in OE mmap_min_addr tricks are not needed at all.

Hi,

On some systems (I have report from fedora and kubuntu) it still needs 0
in mmap_min_addr :/.

Investigating why, but it's slow because it doesn't fail on my box.

My guess is that this chunk from
http://git.qemu.org/qemu.git/tree/linux-user/main.c
cannot work on systems where normal user is not allowed to read 
/proc/sys/vm/mmap_min_addr and mmap_min_addr is not initialized with
sane value.

    /*
     * Read in mmap_min_addr kernel parameter.  This value is used
     * When loading the ELF image to determine whether guest_base
     * is needed.  It is also used in mmap_find_vma.
     */
    {
        FILE *fp;

        if ((fp = fopen("/proc/sys/vm/mmap_min_addr", "r")) != NULL) {
            unsigned long tmp;
            if (fscanf(fp, "%lu", &tmp) == 1) {
                mmap_min_addr = tmp;
                qemu_log("host mmap_min_addr=0x%lx\n", mmap_min_addr);
            }
            fclose(fp);
        }
    }

But here (gentoo) it works ok with 4096 in mmap_min_addr and qemu-native
from OE as well as app-emulation/qemu-kvm-0.12.3* from gentoo.

BTW: 0.12.4 is out, but in changelog I don't see anything I must have.

Regards,

-- 
uin:136542059                jid:Martin.Jansa@gmail.com
Jansa Martin                 sip:jamasip@voip.wengo.fr 
JaMa                         


