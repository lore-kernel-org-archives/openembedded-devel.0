Received: from [74.125.46.153] (helo=yw-out-1718.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <leon.woestenberg@gmail.com>) id 1M4wc7-0008Bw-Tn
	for openembedded-devel@lists.openembedded.org;
	Fri, 15 May 2009 14:34:12 +0200
Received: by yw-out-1718.google.com with SMTP id 9so1072924ywk.42
	for <openembedded-devel@lists.openembedded.org>;
	Fri, 15 May 2009 05:27:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:mime-version:received:date:message-id:subject
	:from:to:content-type:content-transfer-encoding;
	bh=aTNCzM3vwrkyRl9BT8Z++OuHWN+xG1RBF0l7Se8rR98=;
	b=baThHA7i9lQjp7jPR48K6J+M4H2Pz6mw9kBlIdbjqr66gMP774WZH6teoTL6ejVFzi
	uN/R34DIPft1GcquPM2sEecDOElbtNv3rBLPV0TYO/YLdDBChP8U9blsqmi2JQNr49FP
	1BW9xblehy/IthH0SJydqLMH3VXy4mkc+p/lM=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=mime-version:date:message-id:subject:from:to:content-type
	:content-transfer-encoding;
	b=VM8oYQyJ3SN/Ocni1IHJb/udQTg60ccM7lSYr4jPFEevSVeB41zyv4M1zRkcpn/y5h
	FftsuA5882OWRn/BeM4l4aQdMR0VAXHQmMXbxob6Llon1/KQdxEUz6xFoK9ETqKV5Jyp
	PaJ7oKTwyldm5lW1xNTUd6slnyEKfrBOIXckY=
MIME-Version: 1.0
Received: by 10.90.100.11 with SMTP id x11mr2763505agb.85.1242390018509; Fri, 
	15 May 2009 05:20:18 -0700 (PDT)
Date: Fri, 15 May 2009 14:20:18 +0200
Message-ID: <c384c5ea0905150520k3e38f4f3q2d2279f714eded1a@mail.gmail.com>
From: Leon Woestenberg <leon.woestenberg@gmail.com>
To: openembedded-devel <openembedded-devel@lists.openembedded.org>
Subject: [HEADS UP] zecke-no-host-includes.patch is not compiled-in for gcc 4.3.2+ (4.3.x?)
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
X-List-Received-Date: Fri, 15 May 2009 12:34:12 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

Hello,

I got a heads-up from one of the ptxdist guys that:

http://cgit.openembedded.org/cgit.cgi?url=openembedded/tree/recipes/gcc/gcc-4.3.2/zecke-no-host-includes.patch

no longer works for GCC 4.3.2 as GCC upstream changed "CROSS_COMPILE"
to "CROSS_DIRECTORY_STRUCTURE".

and the patch uses #ifdef CROSS_COMPILE


The patch code thus is not compiled-in.


I currently have no gcc 4.3.x oe builds, maybe someone who does can
verify this quickly?


Regards,
-- 
Leon


