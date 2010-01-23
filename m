Received: from mail-yw0-f178.google.com ([209.85.211.178])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <camelguo@gmail.com>) id 1NYcos-0000Xu-Jw
	for openembedded-devel@lists.openembedded.org;
	Sat, 23 Jan 2010 11:02:21 +0100
Received: by ywh8 with SMTP id 8so2014600ywh.3
	for <openembedded-devel@lists.openembedded.org>;
	Sat, 23 Jan 2010 01:59:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:content-type:date:subject:to
	:mime-version:content-transfer-encoding:from:organization:message-id
	:user-agent; bh=Wc50C6WVohCxiDWjM5NRw4hXDjZ1TN8XlQAvimC0u+4=;
	b=tL/k8q3WW2Nqx3Msku6ulRXGNSe6fiKujylAGQ3/Gc9yIWJ6Ma/fmvQuFjZJRhV4Ug
	NMrHY0ss3WqMv7f+Fv765JU2RfN6ABmpCTmnks4NLrt+jvyu0w+8AsjWIaJHOSrItXJI
	IPreZ05yPtlv4Mj0yCKllgzMhzZkiD0Uj08aw=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=content-type:date:subject:to:mime-version:content-transfer-encoding
	:from:organization:message-id:user-agent;
	b=woU+ykxLj3t6Nc500VbiwLRjrzq6lw3zcK95jiIFTwY2bJHVapk4DcWK9QYpmpq80U
	4vBuGxZ0Jyx2moNnrBvIitZuNkm0Xh+/XriEOVfVmufN9v6RIqtZi4rmJhuaPIiDPSa8
	cDTBpoq6HvywJv+6xgmssN0KSEq0CNXhvurhc=
Received: by 10.150.55.8 with SMTP id d8mr5488469yba.288.1264240799850;
	Sat, 23 Jan 2010 01:59:59 -0800 (PST)
Received: from guohr-laptop-ubuntu ([123.162.71.84])
	by mx.google.com with ESMTPS id 23sm1116466ywh.33.2010.01.23.01.59.55
	(version=TLSv1/SSLv3 cipher=RC4-MD5);
	Sat, 23 Jan 2010 01:59:58 -0800 (PST)
Date: Sat, 23 Jan 2010 17:59:47 +0800
To: openembeded-devel <openembedded-devel@lists.openembedded.org>
MIME-Version: 1.0
From: "Guo Hongruan" <camelguo@gmail.com>
Organization: Gulessoft, Inc
Message-ID: <op.u6zcpxd7mn1qzu@guohr-laptop-ubuntu>
User-Agent: Opera Mail/10.10 (Linux)
X-SA-Exim-Connect-IP: 209.85.211.178
X-SA-Exim-Mail-From: camelguo@gmail.com
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: No (on linuxtogo.org); Unknown failure
Subject: undefined reference to `_restfpr_14_x' in gcc-4.4.2/libgcc/../gcc/unwind.inc:307 when building ppc603e
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
X-List-Received-Date: Sat, 23 Jan 2010 10:02:22 -0000
Content-Type: text/plain; charset=utf-8; format=flowed; delsp=yes
Content-Transfer-Encoding: 7bit

Hi guys,
   I am trying to building openembedded with the following configuration.
MACHINE=storcenter
DISTRO=micro
LIBC=eglibc
But I met the following error when compiling eglibc-2_10:

  /media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/cross/eglibc/ppc603e/lib/gcc/powerpc-oe-linux/4.4.2/libgcc_eh.a(unwind-dw2.o):  
In function `_Unwind_Backtrace':
|  
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/eglibc/ppc603e-oe-linux/gcc-cross-intermediate-4.4.2-r2.1/gcc-4.4.2/libgcc/../gcc/unwind.inc:307:  
undefined reference to `_restfpr_14_x'
| collect2: ld returned 1 exit status
| make[2]: ***  
[/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/eglibc/ppc603e-oe-linux/eglibc-2.10-r8.6/build-powerpc-oe-linux/elf/sln]  
Error 1
| make[2]: *** Waiting for unfinished jobs....
|  
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/cross/eglibc/ppc603e/lib/gcc/powerpc-oe-linux/4.4.2/libgcc_eh.a(unwind-dw2.o):  
In function `_Unwind_Backtrace':
|  
/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/eglibc/ppc603e-oe-linux/gcc-cross-intermediate-4.4.2-r2.1/gcc-4.4.2/libgcc/../gcc/unwind.inc:307:  
undefined reference to `_restfpr_14_x'
| collect2: ld returned 1 exit status
| make[2]: ***  
[/media/work-disk/testslave/oe_gss_inc_change_allinone/build/tmp/work/eglibc/ppc603e-oe-linux/eglibc-2.10-r8.6/build-powerpc-oe-linux/elf/ldconfig]  
Error 1

anyone has met the same question before?
Is it caused by the incorrect toolchain set?
Is there anyone who has ever built toolchain for powerpc successfully?

Thanks a lot!


-- 
Guo Hongruan, Embedded Linux Consultant
Skype: camelguo
Twitter: camelguo
http://www.gulessoft.com


