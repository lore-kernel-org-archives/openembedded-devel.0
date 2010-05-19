Received: from out3.smtp.messagingengine.com ([66.111.4.27])
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <vjensen@gmx.de>) id 1OEfwE-0003lw-6A
	for openembedded-devel@lists.openembedded.org;
	Wed, 19 May 2010 11:51:43 +0200
Received: from compute2.internal (compute2.internal [10.202.2.42])
	by gateway1.messagingengine.com (Postfix) with ESMTP id 3B0ECF7C44
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 05:37:15 -0400 (EDT)
Received: from heartbeat2.messagingengine.com ([10.202.2.161])
	by compute2.internal (MEProxy); Wed, 19 May 2010 05:37:15 -0400
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; d=messagingengine.com;
	h=date:from:to:subject:message-id:mime-version:content-type;
	s=smtpout; bh=f/Q504YMD62LDptKC0eFyhbOGF8=;
	b=nlaAFDbm9g2vkf3O2zT4yUECMZQL8qRqz7akLKgvjcYS8/oMaJg9gCvFGMEp1jXNQ1ZOi7FzRv4nH60SVUsh9N49USQTuTmjAO8RFdc5/8do6oBmrgRHm3PSO0MXvgtPgPev4v9pbCSXgsjl5JQZ8hh8FI/lXvNR+37MyMddOJc=
X-Sasl-enc: bdfPH75EEuuTOItJouUehQqZHJEb9MnTdC6lqrKbq3Q+ 1274261827
Received: from [192.168.1.34] (hnvr-4d078ae5.pool.mediaWays.net [77.7.138.229])
	by mail.messagingengine.com (Postfix) with ESMTPSA id 23B3F56F53
	for <openembedded-devel@lists.openembedded.org>;
	Wed, 19 May 2010 05:37:07 -0400 (EDT)
Date: Wed, 19 May 2010 11:38:32 +0200 (CEST)
From: Vitus Jensen <vjensen@gmx.de>
To: openembedded-devel@lists.openembedded.org
Message-ID: <alpine.LNX.2.00.1005181720550.21508@asterix.crazy-teaparty.dyndns.org>
User-Agent: Alpine 2.00 (LNX 1167 2008-08-23)
Jabber-ID: vitus_jensen@gmx.de
X-Accepted-File-Formats: ASCII rtf ps pdf - *NO* MS Office files please
X-Message-Flag: Worried about bugs & viruses? Switch to Mac/Unix/PC Pine! Info
	@ www.ii.com
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 66.111.4.27
X-SA-Exim-Mail-From: vjensen@gmx.de
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=AWL,BAYES_00,
	RCVD_IN_DNSWL_LOW,SPF_FAIL autolearn=ham version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: powerpc-g++ 4.2.4 problem casting long long to double
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
X-List-Received-Date: Wed, 19 May 2010 09:51:44 -0000
Content-Type: TEXT/PLAIN; format=flowed; charset=US-ASCII

Hello!

We noticed a strange problem with C++ code casting long long variables to 
double, as a lot of qt-embedded code is doing.

=================
double
convert(long long l)
{
   return (double)l;	// or double(l)
}

int
main(int argc, char * argv[])
{
   long long l = 10;
   double f;

   f = convert(l);
   printf("convert: %lld => %f\n", l, f);
   return 0;
}
====================

output:
convert: 10 => 0.000000

C++ compiled via powerpc-angstrom-linux-g++ gives the above result. 
Compiling the same code as C using powerpc-angstrom-linux-gcc works fine. 
But when looking at the assembler code both compiler produce virtually 
identical output and both call __floatdidf to do the actual conversion. 
Very strange, has anyone ever seen similar effects?


MACHINE bluepro (ppc603e, used in n1200, efika, lite5200, storcenter)
DISTRO angstrom
BRANCH stable

Openembedded is used to build images and QT4 SDKs for this machine which 
work fine otherwise.  The compiler version used is the default for 
angstrom (4.2.4), that default and the gcc recipe is identical between 
stable and dev branches.

ppc405 uses the older 4.1.1 gcc which shows the identical behaviour when 
selected via ANGSTROM_GCC_VERSION.  4.3.2 and 4.3.3 failed to link but 
created the same assembler code otherwise.

How can I analyse this situation further?  I'm particular interested in 
how different __floatdidf versions get used dependend on frontend, the 
source of __floatdidf is in the gcc sourcetree and I expected it to be 
compiled just once.

Vitus


PS: fp-int-convert-long-double.c from the testsuite fails too, if
compiled via powerpc-angstrom-linux-g++

-- 
Vitus Jensen, Hannover, Germany, Universe (current)
pgp public key available from keyservers


