Received: from [80.91.229.2] (helo=ciao.gmane.org)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <gcho-openembedded-devel@m.gmane.org>)
	id 1KilNz-0000Zl-2w
	for openembedded-devel@openembedded.org; Thu, 25 Sep 2008 09:35:39 +0200
Received: from list by ciao.gmane.org with local (Exim 4.43)
	id 1KilKN-00087T-5r
	for openembedded-devel@openembedded.org; Thu, 25 Sep 2008 07:31:55 +0000
Received: from s55917625.adsl.wanadoo.nl ([85.145.118.37])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00 for <openembedded-devel@openembedded.org>;
	Thu, 25 Sep 2008 07:31:55 +0000
Received: from k.kooi by s55917625.adsl.wanadoo.nl with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <openembedded-devel@openembedded.org>;
	Thu, 25 Sep 2008 07:31:55 +0000
X-Injected-Via-Gmane: http://gmane.org/
To: openembedded-devel@openembedded.org
From: Koen Kooi <k.kooi@student.utwente.nl>
Date: Thu, 25 Sep 2008 09:31:43 +0200
Message-ID: <gbfeov$m8g$1@ger.gmane.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: s55917625.adsl.wanadoo.nl
User-Agent: Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10.5; en-US;
	rv:1.9.1b1pre) Gecko/20080912030722 Shredder/3.0b1pre
Sender: news <news@ger.gmane.org>
Subject: liboil softfloat fix questions
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
X-List-Received-Date: Thu, 25 Sep 2008 07:35:39 -0000
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

I noticed liboil got patched:

+if test x"${ENABLE_SOFTFLOAT}" = "xyes"; then
+      VFP_CFLAGS="$VFP_CFLAGS -mfloat-abi=softfp"
+else
+      VFP_CFLAGS="$VFP_CFLAGS -mfpu=vfp"

That looks a bit wrong to me, since for EABI you'd want 
'-mfloat-abi=softfp -mfpu=vfp' to make it use the VFP coprocessor using 
softfloat calling conventions[1] and plain '-mfloat-abi=softfp' to do 
softfloat, and with OABI you don't want to pass '-mfloat-abi=softfp'
To make it even more complicated, on armv7a[2] you want to pass 
-mfpu=neon -mfloat-abi=softfp. If you look at the output of gcc -S 
you'll see that EABI won't use an FPU unless you pass in 
-mfloat-abi=softfp *and* -mfpu=<FPU>.

AFAICT OE passes all the needed magic already in TARGET_CCFLAGS, so it 
seems that this entire construct can be removed.

Robert, could you beat the cacao people with a cluebat so they get their 
stuff right?

regards,

Koen

[1] There are more permutations, but let's focus on the one OE is 
currently using
[2] On cortex-a8 the VFP isn't pipelined, so double precision math is 
twice as slow compared to ARM11 cores, the NEON unit is pipelined, but 
can only do single-precision. So don't be surprised if your new omap3 
nokia tablet performs FP math slower than your n810.



