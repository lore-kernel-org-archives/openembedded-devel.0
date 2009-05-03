Received: from [220.181.12.12] (helo=m12-12.163.com)
	by linuxtogo.org with smtp (Exim 4.69)
	(envelope-from <lida_mail@163.com>) id 1M0knl-00062Q-6I
	for openembedded-devel@lists.openembedded.org;
	Mon, 04 May 2009 01:08:54 +0200
Received: from [192.168.58.103] (unknown [116.227.146.13])
	by smtp8 (Coremail) with SMTP id DMCowLDLyaWmIv5Jdy_nEQ--.8857S2;
	Mon, 04 May 2009 07:03:03 +0800 (CST)
From: "Daniel.Li" <lida_mail@163.com>
To: openembedded-devel@lists.openembedded.org
In-Reply-To: <20090503165548.GB7973@smtp.west.cox.net>
References: <1241357669.13222.0.camel@daniel-laptop>
	<20090503165548.GB7973@smtp.west.cox.net>
Organization: PALFocus (http://palfocus.oicp.net)
Date: Mon, 04 May 2009 07:03:03 +0800
Message-Id: <1241391783.13222.4.camel@daniel-laptop>
Mime-Version: 1.0
X-Mailer: Evolution 2.26.1 
X-CM-TRANSID: DMCowLDLyaWmIv5Jdy_nEQ--.8857S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKFW3Wr13Cr1rtr18Kw18AFb_yoWDAwcE9a
	yDua4vvrn2qa4qy3Wktr15J34rKFW8Aw1Fyayvqr1jva4Du3W3Wa4vkr4xA3Wagr48K342
	vrn0qFWqqas8KjkaLaAFLSUrUUUUUbIjqfuFe4nvWSU5nxnvy29KBjDU0xBIdaVrnRJUUU
	PEb7IF0VCYb41lb7IF0VCF04k20xv_GFyrM7k042IE42xK82IY64kIx2x0424lb7IF0VCF
	I7km07C26c804VAKzcIF0wAYjsxI4VWUJwAYFVCjjxCrM7AC8VAFwI0_Jr0_Gr1l1I0E4x
	80FVCIwcAKzIAtM7C26IkvcIIF6IxKo4kEV4yl1IIY67AEw4v_Jr0_Jr4l84ACjcxK6xII
	jxv20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26rxl6s0DM28EF7xvwV
	C2z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kK67kvxFCE
	548m6r1fGryUXwAawVACjsI_Ar4v6c8GOVW06r1DJrWUAwAawVACjsI_Ar4v6c8GOVWY6r
	1DJrWUAwAawVAC0I8062xK64kEc2Ij6c8GOVWUur45Jrylnx0Ec2IEnICE548m6r1DJrWU
	ZwAqjxCE34x0Y48IcwAq048E620vw7xCY7CE4x8GYI0EYx1l5I8CrVACY4xI64kE6c02F4
	0Ex7xfMcIj6xIIjxv20xvE14v26r1j6r18McIj6I8E87Iv67AKxVWUJVW8JwACjcxG0xvY
	0x0EwIxGrwAC62BYpTIE1TZKA3svLVAKvSnIqfZI6r4l7I0Y64k_MxkFs20EY4vE77kJMx
	kIecxEwVAFwVWfMxkI7II2jI8vz4v_Jr0_Jryl42xK82IYc2Ij64vIr41l4x8a6c8ajcxJ
	MI8E67AF67kF1VAFwI0_Jr0_JrylIxkGc2Ij64vIr41lIxAIcVC2z280aVAFwI0_Jr0_Gr
	1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUB2-eUUUU
	U
X-CM-SenderInfo: 5olgtshpdlzqqrwthudrp/
Subject: Re: qemu-native build fail
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
X-List-Received-Date: Sun, 03 May 2009 23:08:54 -0000
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Sun, 2009-05-03 at 09:55 -0700, Tom Rini wrote:
> On Sun, May 03, 2009 at 09:34:29PM +0800, Daniel.Li wrote:
> > Dear List,
> > 
> > I have found that qemu-native failed with gcc 3.4, see below.
> > Originally, qemu failed with 4.* gcc, now qemu is ok with gcc3.4 but
> > qemu-native failed. 
> > 
> > I googled, only found this http://pastebin.com/f75407ece# , which seems
> > failed on 20 Apr.
> 
> This sounds like a host-provided gcc-3.4, which isn't new enough, is
> being used, rather than the 3.4.6 that OE builds.  I thought this had
> been fixed, but perhaps not.  Can you confirm that you have a gcc-3.4
> package installed on your host?  Thanks.

Thanks Tom.
Yes,you are right. OE is using gcc-3.4 (host) instead of gcc-3.4 build
by OE.
Cause, I removed gcc3.4 from host, it reports command gcc3.4 not found.

Well, I'm new to OE. Could you please let me know how to build
qemu-native with it's internal gcc3.4? 

Any configuration change? Thanks in advance.
> 
-- 
Daniel.Li <lida_mail@163.com>
PALFocus (http://palfocus.oicp.net)




