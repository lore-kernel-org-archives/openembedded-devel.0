Received: from [74.125.92.150] (helo=qw-out-1920.google.com)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <cliff.brake@gmail.com>) id 1LKZav-00007W-SF
	for openembedded-devel@lists.openembedded.org;
	Wed, 07 Jan 2009 15:41:17 +0100
Received: by qw-out-1920.google.com with SMTP id 14so3475365qwa.36
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 07 Jan 2009 06:35:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=domainkey-signature:received:received:message-id:date:from:to
	:subject:mime-version:content-type:content-transfer-encoding
	:content-disposition;
	bh=FfUK9+ojoncOb33hQoKLhH7Z9y/6FjZyGl6ua2/kSyM=;
	b=pkq0F7rcyjJW1HkTvQGcTTUxsFdmVNDxiR8N5cKhrtbZwoZb1xUAXjggLT1HjM4Ivs
	F2FlgJR30DJ0uqyjIh2nHgKUOg3v8dCedWn56Qk1YIcUK/qkKSfG94Xx66kXIEO6idu8
	MO4ho41nZ9G99agvz7mHTtzfmNAGuFt9ROjz8=
DomainKey-Signature: a=rsa-sha1; c=nofws; d=gmail.com; s=gamma;
	h=message-id:date:from:to:subject:mime-version:content-type
	:content-transfer-encoding:content-disposition;
	b=E85GA5yYte+0bSPpOmxwxrIkHzVaJGwYtZ16VXJSgRJ/ntH7GLbI/rxENmZe/M/SpM
	NMw/InK5KZ0zoDBbO5ToEpB4FeZJT6DuwNvM16aDlXIXnoaCCtgphI2IxHG/Cp5t/1mE
	Q0AaAfMzelX6LnETInS0VNXccczyxVks8xzSw=
Received: by 10.214.113.16 with SMTP id l16mr19614389qac.340.1231338913113;
	Wed, 07 Jan 2009 06:35:13 -0800 (PST)
Received: by 10.151.116.6 with HTTP; Wed, 7 Jan 2009 06:35:13 -0800 (PST)
Message-ID: <f96d234e0901070635q6c29b1d3xb3a00be2147e2c07@mail.gmail.com>
Date: Wed, 7 Jan 2009 09:35:13 -0500
From: "Cliff Brake" <cliff.brake@gmail.com>
To: openembedded-devel@lists.openembedded.org
MIME-Version: 1.0
Subject: mono build error with swp instruction
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
X-List-Received-Date: Wed, 07 Jan 2009 14:41:18 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

I ran into an interesting build error this morning that might be worth
documenting ...

When building mono with the latest toolchains built with OE, I get:

/tmp/ccYsXwlg.s:3067: Error: selected processor does not support `swp
r2,r0,[r4]'
/tmp/ccYsXwlg.s:3161: Error: selected processor does not support `swp
r2,r0,[r4]'
/tmp/ccYsXwlg.s:3272: Error: selected processor does not support `swp
r3,r4,[r5]'

In the libgc code, there is the following:

#    ifdef ARM32
        inline static int GC_test_and_set(volatile unsigned int *addr) {
          int oldval;
          /* SWP on ARM is very similar to XCHG on x86.  Doesn't lock the
           * bus because there are no SMP ARM machines.  If/when there are,
           * this code will likely need to be updated. */
          /* See linuxthreads/sysdeps/arm/pt-machine.h in glibc-2.1 */
          __asm__ __volatile__("swp %0, %1, [%2]"
      		  	     : "=&r"(oldval)
      			     : "r"(1), "r"(addr)
			     : "memory");
          return oldval;
        }

The solution was to set ARM_INSTRUCTION_SET = "arm" in the mono recipe.

Thanks,
Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com


