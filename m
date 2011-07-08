Received: from mail-iw0-f175.google.com ([209.85.214.175])
	by linuxtogo.org with esmtp (Exim 4.72)
	(envelope-from <raj.khem@gmail.com>) id 1Qf3WG-0004aP-At
	for openembedded-devel@lists.openembedded.org;
	Fri, 08 Jul 2011 07:22:28 +0200
Received: by iwn4 with SMTP id 4so1548189iwn.6
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 07 Jul 2011 22:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=message-id:date:from:user-agent:mime-version:to:subject:references
	:in-reply-to:content-type:content-transfer-encoding;
	bh=dxguZWLUu/ZBfSdCSKq6LK2+1161s3+ypXaw9Dmbz3E=;
	b=j4LA0fhpymng4+m1du0Q/krREqfcxuyOanGrwAXxLrrZ/36EJnWPDKC/som0hC7tIB
	PGaKh7pSPU7sN+ks6gxmEr4cQXmP/msJ6QI3wtTmXxhTBqjvV2/wdRoFxdDsMUIt/sw5
	JXdeXvpchTTqNz4y7m5RPLM5Z3gyfF5AsRCbw=
Received: by 10.231.200.20 with SMTP id eu20mr1423210ibb.24.1310102315423;
	Thu, 07 Jul 2011 22:18:35 -0700 (PDT)
Received: from [192.168.1.70] (99-57-141-118.lightspeed.sntcca.sbcglobal.net
	[99.57.141.118])
	by mx.google.com with ESMTPS id m18sm1850895ibc.62.2011.07.07.22.18.34
	(version=SSLv3 cipher=OTHER); Thu, 07 Jul 2011 22:18:34 -0700 (PDT)
Message-ID: <4E169329.3050702@gmail.com>
Date: Thu, 07 Jul 2011 22:18:33 -0700
From: Khem Raj <raj.khem@gmail.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.17) Gecko/20110516 Lightning/1.0b2 Thunderbird/3.1.10
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78E50@nzc-ap-xch-02.ap.trimblecorp.net><CAE21AQpLShYH+82swduxQLWtpTGtTawuywbt2WxXHUTB5+9zDQ@mail.gmail.com><F7C0AA5DD1508F4789E10B6CC9BB75DB04A78EBC@nzc-ap-xch-02.ap.trimblecorp.net>	<CAE21AQq6YfPtuqxKfBs5cCGvBeO4ALk4d+_iZpZOpGZyBUNETw@mail.gmail.com>
	<F7C0AA5DD1508F4789E10B6CC9BB75DB04A78FCB@nzc-ap-xch-02.ap.trimblecorp.net>
In-Reply-To: <F7C0AA5DD1508F4789E10B6CC9BB75DB04A78FCB@nzc-ap-xch-02.ap.trimblecorp.net>
Subject: Re: Debugging u-boot
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
X-List-Received-Date: Fri, 08 Jul 2011 05:22:28 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 07/07/2011 12:25 PM, Bernard Mentink wrote:
> Hi Charles,
>
> Tried that but got the following linker error:
>
> ---------------------------------------------------------- error ---------------------------------------
> | /home/bernie/Stuff/build/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld: failed to merge target specific data of file emutls_s.o
> | /home/bernie/Stuff/build/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld: error: /home/bernie/Stuff/build/tmp/work/i686-armv6-sdk-angstrom-linux-gnueabi/gcc-cross-sdk-4.5-r36.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/crtendS.o uses VFP register arguments, ./libgcc_s.so.1.tmp does not
> | /home/bernie/Stuff/build/tmp/sysroots/i686-linux/usr/armv6/arm-angstrom-linux-gnueabi/bin/ld: failed to merge target specific data of file /home/bernie/Stuff/build/tmp/work/i686-armv6-sdk-angstrom-linux-gnueabi/gcc-cross-sdk-4.5-r36.2+svnr170880/gcc-4_5-branch/build.i686-linux.arm-angstrom-linux-gnueabi/./gcc/crtendS.o
> | collect2: ld returned 1 exit status
> | make[2]: *** [libgcc_s.so] Error 1

this means there is fp ABI gotcha is it on latest oe.dev ? I remember 
fixing the hard FP build on oe.dev  see commit 
888c1f3a2e103793bc03488d2051ee4683f7516a

I dont know if that was picked for 2011.03 release branch


