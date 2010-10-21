Received: from www.xora.org.uk ([80.68.91.202] helo=xora.vm.bytemark.co.uk)
	by linuxtogo.org with esmtp (Exim 4.69)
	(envelope-from <dp@xora.org.uk>) id 1P8tF3-00006g-SK
	for openembedded-devel@lists.openembedded.org;
	Thu, 21 Oct 2010 13:23:30 +0200
Received: from localhost (localhost [127.0.0.1])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTP id A66B3A5152
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 12:22:54 +0100 (BST)
X-Virus-Scanned: Debian amavisd-new at xora.vm.bytemark.co.uk
Received: from xora.vm.bytemark.co.uk ([127.0.0.1])
	by localhost (xora.vm.bytemark.co.uk [127.0.0.1]) (amavisd-new,
	port 10024) with ESMTP id jTh-s--76dNG
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 12:22:53 +0100 (BST)
Received: from [192.168.1.10] (188-220-34-37.zone11.bethere.co.uk
	[188.220.34.37])
	by xora.vm.bytemark.co.uk (Postfix) with ESMTPSA id C9C2EA5149
	for <openembedded-devel@lists.openembedded.org>;
	Thu, 21 Oct 2010 12:22:52 +0100 (BST)
Message-ID: <4CC0228B.5080402@xora.org.uk>
Date: Thu, 21 Oct 2010 12:22:51 +0100
From: Graeme Gregory <dp@xora.org.uk>
User-Agent: Mozilla/5.0 (Windows; U; Windows NT 6.1; en-GB;
	rv:1.9.2.11) Gecko/20101013 Lightning/1.0b2 Thunderbird/3.1.5
MIME-Version: 1.0
To: openembedded-devel@lists.openembedded.org
References: <i9p1d0$7q4$1@dough.gmane.org>
	<4CC00D57.4070601@xora.org.uk>	<i9p2uf$f40$1@dough.gmane.org>
	<1287658122.16386.444.camel@rex>
In-Reply-To: <1287658122.16386.444.camel@rex>
X-Enigmail-Version: 1.1.1
X-SA-Exim-Connect-IP: 80.68.91.202
X-SA-Exim-Mail-From: dp@xora.org.uk
X-Spam-Checker-Version: SpamAssassin 3.2.5 (2008-06-10) on discovery
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=5.0 tests=AWL,BAYES_00 autolearn=ham
	version=3.2.5
X-SA-Exim-Version: 4.2.1 (built Wed, 25 Jun 2008 17:20:07 +0000)
X-SA-Exim-Scanned: Yes (on linuxtogo.org)
Subject: Re: [RFC] turning conf/machine into a set of bblayers
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
X-List-Received-Date: Thu, 21 Oct 2010 11:23:30 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit

On 21/10/2010 11:48, Richard Purdie wrote:
> On Thu, 2010-10-21 at 11:59 +0200, Koen Kooi wrote:
>> The downside of amend.inc is the de-sync when the recipe gets updated,
>> but not the overlay. You run the risk of using a version without the
>> overrides that way.
>> Maybe some fancy scripts, (pre-)commit hooks or just old fanishioned
>> review on the ml could solve those type of issues.
>>
>> How do file overrides like
>> recipes/netbase/netbase/beagleboard/interfaces get handled in a
>> bblayer/amend.inc world?
> Taking a poky example of formfactor which is a very similar situation,
> create a .bbappend file:
>
> http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta-emenlow/packages/formfactor/formfactor_0.0.bbappend
>
> with the contents of:
>
> FILESEXTRAPATHS := "${THISDIR}/${PN}"
> PRINC = "1"
>
> and place the appropriate files underneath as usual:
>
> http://git.pokylinux.org/cgit/cgit.cgi/poky/tree/meta-emenlow/packages/formfactor/formfactor/emenlow/machconfig
>
> We should make it a hard fail if a .bbappend is found with no
> corresponding .bb file, I'm not sure if that happens or not at the
> moment.
>
Only half joking, maybe we should RFC just making OE a community bblayer
for poky.

Graeme



